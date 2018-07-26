function CreateMenuDerma()
	--Create the DFrame to hold everything together.
	local frame = vgui.Create("DFrame")
	frame:SetTitle("Props")
	frame:SetSize(500,500)
	frame:Center()
	frame:MakePopup()
	--Scroll panel
	local scrollPanel = vgui.Create("DScrollPanel", frame)
	scrollPanel:Dock(FILL)
	--Icon layout
	local holder = vgui.Create("DIconLayout", scrollPanel)
	holder:Dock(FILL)
	holder:SetSpaceX(5)
	holder:SetSpaceY(5)
	function CreatePropPanel(mdl)
		local propHolder = vgui.Create("DPanel", holder)
		propHolder:SetSize(100,100)
		propHolder:SetBackgroundColor(Color(99,99,99,255))
		local prop = vgui.Create("DModelPanel", propHolder)
		prop:SetSize(100,100)
		local cmdl = ClientsideModel(mdl,RENDERGROUP_OPAQUE)
		--Gets the bounds of a model then multiples it by a 'magic number' that usually results in a good enough camera position.,
		prop:SetCamPos(Vector(cmdl:GetModelBounds().x * -1.3285,cmdl:GetModelBounds().x * -2.8571, cmdl:GetModelBounds().x * -2.8571))
		prop:SetLookAt(Vector(0,0,0))
		print(cmdl:GetModelBounds())
		prop:SetModel(mdl)
		
	end
	function OnPPClick(pnl, btn)
		if pnl:GetName() == "DModelPanel" then
			if btn == MOUSE_LEFT then
				frame:Close()
				CreatePropDerma(pnl:GetModel())
				hook.Remove("VGUIMousePressed", "PropMenuMouseClick")
			end
		end
	end
		
	CreatePropPanel("models/props_borealis/bluebarrel001.mdl")
	CreatePropPanel("models/food/hotdog.mdl")
	hook.Add("VGUIMousePressed", "PropMenuMouseClick", OnPPClick)
	
end

function CreatePropDerma(mdl)
	local frame = vgui.Create("DFrame")
	frame:SetTitle("Props")
	frame:SetSize(500,500)
	frame:Center()
	frame:MakePopup()
	local bck = vgui.Create("DPanel", frame) --dpanel to hold everything so positioning isn't hacky
	bck:Dock(FILL)
	bck:SetBackgroundColor(Color(108,111,114)) --i used snipping tool and paint.net to get this color please help me
	local propHolder = vgui.Create("DPanel", bck)
	propHolder:SetSize(200,200)
	propHolder:SetBackgroundColor(Color(99,99,99,255))
	local prop = vgui.Create("DModelPanel", propHolder)
	prop:SetSize(200,200)
	local cmdl = ClientsideModel(mdl,RENDERGROUP_OPAQUE)
	--Gets the bounds of a model then multiples it by a 'magic number' that usually results in a good enough camera position.,
	prop:SetCamPos(Vector(cmdl:GetModelBounds().x * -1.3285,cmdl:GetModelBounds().x * -2.8571, cmdl:GetModelBounds().x * -2.8571))
	prop:SetLookAt(Vector(0,0,0))
	print(cmdl:GetModelBounds())
	prop:SetModel(mdl)
	local button = vgui.Create("DButton", frame)
	button:Dock(BOTTOM)
	button:SetText("Click to spawn")
	button.DoClick = function()
		net.Start("SpawnProp")
		net.WriteString(mdl)
		net.SendToServer()
	end
end		
	
	
