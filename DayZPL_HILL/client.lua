

local vdp_Marker1 = createMarker(2597.4, 2814, 10, "cylinder", 3, 0, 255, 255, 100)
local vdp_Marker2 = createMarker(2597.4, 2814, 10, "cylinder", 1.5, 0, 0, 0, 0)

local r, g, b = 0, 255, 255

function vdpVidaMarkerEntrar(player)
	if (player == getLocalPlayer()) and (source == vdp_Marker2) and getElementData(getLocalPlayer(), "blood") ~= 12000 then
		r, g, b = 255, 0, 0
		setMarkerColor(vdp_Marker1, 255, 0, 0, 100)
		setElementData(getLocalPlayer(), "Recarregar Vida", true)
	end
end
addEventHandler("onClientMarkerHit", getRootElement(), vdpVidaMarkerEntrar)

function vdpVidaMarkerSair(player)
	if (player == getLocalPlayer()) and (source == vdp_Marker2) then
		r, g, b = 0, 255, 255
		setMarkerColor(vdp_Marker1, 0, 255, 255, 100)
		setElementData(getLocalPlayer(), "Recarregar Vida", false)
	end
end
addEventHandler("onClientMarkerLeave", getRootElement(), vdpVidaMarkerSair)

setTimer(function(player)
	if (getElementData(getLocalPlayer(), "Recarregar Vida") == true) then
		if (isElementWithinMarker(getLocalPlayer(), vdp_Marker2)) then
		if getElementData(getLocalPlayer(), "blood") ~= 12000 then
			setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")+ 1)
			end
		end
	end
end, 100, 0)

addEventHandler("onClientResourceStart", resourceRoot,
function()
	shwaeki = dxCreateShader( "file/shwaeki.fx" )
	texture = dxCreateTexture("file/marker.png")
	dxSetShaderValue(shwaeki, "MarkerSkin", texture)
	engineApplyShaderToWorldTexture(shwaeki, "cj_w_grad")
end )


