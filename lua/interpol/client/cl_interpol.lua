
hook.Add( "OnPlayerChat", "ginterpolgithub", function( ply, strText, bTeam, bDead ) 
    if ( ply != LocalPlayer() ) then return end

	strText = string.lower( strText )

	if ( strText == "!ginterpol" ) then 
		gui.OpenURL( "https://github.com/gInterpol/" )
		return true 
	end
end )

if gInterpol.chatyazisi then
timer.Create("advert_interpol",gInterpol.chatyazisisuresi,0,function()
     chat.AddText( Color(0,245,163), "[gInterpol] ", Color( 255, 255, 255),"Bu Sunucu ", Color(0,245,163)," gInterpol ", Color( 255, 255, 255), "ile korunmaktadır!", "\n")
end)
end