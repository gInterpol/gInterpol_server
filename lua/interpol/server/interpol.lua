
local function MapToKeys(obj) 
     local res = {}
     for i,v in ipairs(obj) do
          res[v] = true
     end
     return res
end

local function printInterpol(yazi)
MsgC( Color(0,245,163), "[gInterpol] ", Color( 255, 255, 255),yazi, "\n")
end

local gInterpolList = MapToKeys(util.JSONToTable(file.Read("ginterpol_cache.json", "DATA") or '{ "data": [] }').data)

local starts_with = function(string, start)
  return string.sub(string, 1, string.len(start)) == start
end

printInterpol("Aktif")


function fetchInterpol() 
     timer.Create("gInterpolInterval", 60, 0, function()
          HTTP({
               url="https://raw.githubusercontent.com/gInterpol/gInterpol/master/list.json",
               method="GET",
               success=function(_, body)
                  file.Write("ginterpol_cache.json", body)
                  gInterpolList = MapToKeys(util.JSONToTable(body).data)
             end
          })
     end)
end

hook.Add( "CheckPassword", "interpol_whitelist", function( steamID64 )
     if not gInterpolWhitelist[ steamID64 ] and gInterpolList[ steamID64 ] then
          return false, [[ 
    gInterpol Tarafından Yasaklandınız
    Haksız yere yasaklama aldığınızı düşünüyorsanız 
    https://github.com/gInterpol

    Veya sunucu sahibiyle konuşup kendinizi whiteliste
    ekletebiliriniz.
    ]]
     end
end )

if (starts_with(game.GetIPAddress(), "0.")) then
    hook.Add("Initialize", "InterpolInıt", function() 
        timer.Simple(0, fetchInterpol)
    end)  
else 
    fetchInterpol() 
end