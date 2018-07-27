GM.Name = "Now Broadcasting"
GM.Author = "Jman005"
GM.Email = "justindev@protonmail.com"
GM.Website = "nope"

function GM:Initialize()
	--Get all props for VGUI menu 
	local propf, _ =  file.Find("nowbroadcasting/gamemode/props/*.lua", "LuaMenu")
	print(#propf)
	for k, f in pairs(propf) do 
		if SERVER then
			AddCSLuaFile("props/" .. f)
		end
		
	end
end