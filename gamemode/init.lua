AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function GM:PlayerSpawn(ply)
	ply:Give("nbdefault")
end