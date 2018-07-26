AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile("ui/ui_prop.lua")
include("shared.lua")

function GM:PlayerSpawn(ply)
	ply:Give("nbdefault")
	
end

if SERVER then
	util.AddNetworkString("SpawnProp")
	net.Receive("SpawnProp",function(len, ply)
	if IsValid(ply) then
		local phys = ents.Create("prop_physics")
		if (!IsValid(phys)) then return end
		phys:SetModel(net.ReadString())
		phys:SetPos(ply:GetEyeTrace().HitPos + phys:OBBMaxs())
		phys:Spawn()
	end
	end )
end
	

