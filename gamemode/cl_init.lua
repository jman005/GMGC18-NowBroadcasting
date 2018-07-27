include("shared.lua")
include("ui/ui_prop.lua")
props = {}
local propf, _ =  file.Find("nowbroadcasting/gamemode/props/*.lua", "LuaMenu")
for k, f in pairs(propf) do 
	include("props/" .. f)
end
hook.Add("KeyPress", "PropGUIKeyPress", function(ply, key)
	if (key == IN_USE) then
		CreateMenuDerma()
	end
end)
