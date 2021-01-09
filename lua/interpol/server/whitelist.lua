local function printInterpol(yazi)
MsgC( Color(0,245,163), "[gInterpol] ", Color( 255, 255, 255),yazi, "\n")
end


hook.Add( "PlayerInitialSpawn", "whitelist_uyari", function( ply )
	if gInterpolWhitelist[ ply:SteamID64() ] then
	   printInterpol("--------------------------------------------------------------------------")
       printInterpol("Sunucuya gInterpol tarafından yasaklanmış whiteliste eklenmis oyuncu girdi")
       printInterpol("--------------------------------------------------------------------------")
       printInterpol("Oyuncu Adı : "..ply:Nick())
       printInterpol("--------------------------------------------------------------------------")
       printInterpol("Oyuncu SteamID64 : "..ply:SteamID64())
       printInterpol("--------------------------------------------------------------------------")
	end
end )