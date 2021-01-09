include("interpol/config.lua")

if SERVER then
	AddCSLuaFile("interpol/client/cl_interpol.lua")
	AddCSLuaFile("interpol/config.lua")
	include("interpol/server/interpol.lua")
	include("interpol/server/whitelist.lua")
end

if CLIENT then
	include("interpol/client/cl_interpol.lua")	
end