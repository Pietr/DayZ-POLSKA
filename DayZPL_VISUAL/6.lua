addEventHandler ("onClientResourceStop", getResourceRootElement (getThisResource ()),function ()
	unbindKey ("aim_weapon", "both", on_weapon_aimed); 
	if not isPlayerHudComponentVisible ("crosshair") then
		showPlayerHudComponent ("crosshair", true);
	end;
end)
	
local sx, sy = guiGetScreenSize()
local size = 130
local sizes = 90
local cursorX, cursorY = 0, 0

function ckick()
clip = getPedAmmoInClip ( getLocalPlayer() )
size=size+25
local hX,hY,hZ = getPedTargetEnd ( getLocalPlayer() )
hX=hX+25
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), ckick )

bindKey("aim_weapon", "both", function(key, state)        
setTimer ( function()
if size > 130 then
size=size-5
end
end, 100, 0 )
end)


function drawCrosshair() 
    showPlayerHudComponent ("crosshair",false) 
    local hX,hY,hZ = getPedTargetEnd ( getLocalPlayer() )
    local screenX1, screenY1 = getScreenFromWorldPosition ( hX,hY,hZ )
	if screenX1 == false or nil or screenY == false or nil then return end
	local weap = getPedWeapon ( localPlayer )
	weapon = getPedWeapon( getLocalPlayer() )

	if weap > 1 then
		if weap >= 25 and weap <= 27 then
			dxDrawImage(screenX1-(size/2.9), screenY1-(size/2.9), sizes, sizes, "images-2/crosshair/shotgun.png",0,0,0,tocolor(255,255,255,200))	
		elseif weap >= 33 and weap <= 33 then
			dxDrawImage(screenX1-(size/2), screenY1-(size/2), size, size, "images-2/crosshair/79.png",0,0,0,tocolor(255,255,255,200))			
      	elseif weap >= 30 and weap <= 31 then
			dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, "images-2/crosshair/center.png",0,0,0,tocolor(255,255,255,200))	
			dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, "images-2/crosshair/left.png",0,0,0,tocolor(255,255,255,200))	
			dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, "images-2/crosshair/right.png",0,0,0,tocolor(255,255,255,200))		
		elseif weap >= 22 and weap <= 29 then
			dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, "images-2/crosshair/center.png",0,0,0,tocolor(255,255,255,200))	
			dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, "images-2/crosshair/left_pistol.png",0,0,0,tocolor(255,255,255,200))	
			dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, "images-2/crosshair/right_pistol.png",0,0,0,tocolor(255,255,255,200))
		elseif weap >= 32 and weap <= 32 then
			dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, "images-2/crosshair/center.png",0,0,0,tocolor(255,255,255,200))	
			dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, "images-2/crosshair/left_pistol.png",0,0,0,tocolor(255,255,255,200))	
			dxDrawImage(screenX1-size/2, screenY1-size/2, size, size, "images-2/crosshair/right_pistol.png",0,0,0,tocolor(255,255,255,200))
		end
	end
end 

bindKey("aim_weapon", "both", function(key, state)        
    local weapon = getPedWeapon(getLocalPlayer())
    if weapon ~= 0 and weapon ~=1 and weapon ~= 34 then
        if state == "down" then 
            addEventHandler("onClientRender", root, drawCrosshair)
        else
            removeEventHandler("onClientRender", root, drawCrosshair) 
        end 
    end
end)