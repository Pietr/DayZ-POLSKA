local textures = {}
local cross = false
function crosshair()
	local screenw,screenh = guiGetScreenSize (); 
	local s = screenw * 0.5; 
	local u,v = (screenw - s)*0.5, (screenh - s)*0.5;
	local black = tocolor (0, 0, 0, 255);
	dxDrawRectangle (0, 0, screenw, v, black);
	dxDrawRectangle (0, 0, u, screenh, black);
	dxDrawRectangle (0, screenh, screenw, -v, black);
	dxDrawRectangle (screenw, screenh, -u, -screenh, black);
	dxDrawImage(u,v,screenw-2*u, screenh-2*v, textures["background"])
	if cross == "SVD" then
	    dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures["SVD"])
	elseif cross == "SVD kamuflaż" then
	    dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures["SVD kamuflaż"])
	elseif cross == "WSS Wintoriez" then
	    dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures["WSS Wintoriez"])
	elseif cross == "WSS Wintoriez kamuflaż" then
	    dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures["WSS Wintoriez kamuflaż"])
	elseif cross == "Mosin–Nagant" then
	    dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures["Mosin–Nagant"])
	elseif cross == "Mosin–Nagant z kamuflażem" then
	    dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures["Mosin–Nagant z kamuflażem"])
	elseif cross == "SKS" then
	    dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures["SKS"])
	elseif cross == "WINCHESTER M70" then
	    dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures["WINCHESTER M70"])
	end
end

function on_weapon_aimed (key, state)
	if getPedWeapon(getLocalPlayer ()) == 34 then 
		if state == "down" then 
			cross = getElementData(getLocalPlayer(),"currentweapon_1")
			showPlayerHudComponent("crosshair",false)
			addEventHandler("onClientHUDRender",getRootElement(),crosshair)
		else 
			cross = false
			removeEventHandler("onClientHUDRender",getRootElement(),crosshair);
		end
	end
end

addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),function () 
	textures["background"] = dxCreateTexture("images/crosshairs/background.png", "argb", true, "wrap")
	textures["SVD"] = dxCreateTexture ("images/crosshairs/1.png", "argb", true, "wrap"); 
	textures["SVD kamuflaż"] = dxCreateTexture ("images/crosshairs/1.png", "argb", true, "wrap");
	textures["WSS Wintoriez"] = dxCreateTexture ("images/crosshairs/1.png", "argb", true, "wrap");
	textures["WSS Wintoriez kamuflaż"] = dxCreateTexture ("images/crosshairs/1.png", "argb", true, "wrap");	
	textures["Mosin–Nagant"] = dxCreateTexture ("images/crosshairs/3.png", "argb", true, "wrap");
	textures["Mosin–Nagant z kamuflażem"] = dxCreateTexture ("images/crosshairs/3.png", "argb", true, "wrap");	
	textures["SKS"] = dxCreateTexture ("images/crosshairs/2.png", "argb", true, "wrap");
	textures["WINCHESTER M70"] = dxCreateTexture ("images/crosshairs/3.png", "argb", true, "wrap");
	bindKey ("aim_weapon", "both", on_weapon_aimed);
	addEventHandler ("onClientPlayerWeaponSwitch",getRootElement(),function (previousWeaponSlot)
		if previousWeaponSlot == 6 then 
			if not isPlayerHudComponentVisible ("crosshair") then 
				showPlayerHudComponent("crosshair",true)
			end
		end
	end)
end); 
	
addEventHandler("onClientResourceStop",getResourceRootElement(getThisResource ()),function ()
	unbindKey("aim_weapon", "both", on_weapon_aimed) 
	if not isPlayerHudComponentVisible("crosshair") then
		showPlayerHudComponent("crosshair",true)
	end
end)