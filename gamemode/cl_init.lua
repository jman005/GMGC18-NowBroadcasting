include("shared.lua")
include("ui/ui_prop.lua")
hook.Add("KeyPress", "PropGUIKeyPress", function(ply, key)
	if (key == IN_USE) then
		CreateMenuDerma()
	end
end)