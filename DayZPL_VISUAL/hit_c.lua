local screenX, screenY
local drawTimer
local isDrawing
local sound

function drawHitMarker()
	dxDrawImage(screenX-16, screenY-16, 32, 32, "hitmarker.png")
	
end

function fireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if hitElement then
			if getElementType(hitElement)=="player" or getElementType(hitElement)=="ped" or getElementType(hitElement)=="vehicle" then
		screenX, screenY = getScreenFromWorldPosition(hitX, hitY, hitZ)
		if not screenX then return end 
		if isDrawing then return end 
		isDrawing = true
		
		local sound = playSound("hitmarker-sound.wav")
		setSoundVolume( sound , 1)
	
	
		addEventHandler("onClientRender", root, drawHitMarker) 
		if drawTimer and isTimer(drawTimer) then
			killTimer(drawTimer)
		end
		
		
		drawTimer = setTimer(function() 
			isDrawing = false
			removeEventHandler("onClientRender", root, drawHitMarker) 
		end, 500, 1)
	end
	end
end--func
addEventHandler("onClientPlayerWeaponFire", localPlayer, fireFunc)

----------------------------------------------------------------------
-------  Script:  ------------- Visit: --------------- Made in -------
------- 7rust-Dev ---------7rust.bplaced.de----------- GERMANY -------
----------------------------------------------------------------------

function get_hit(attacker, weapon, bodypart)
if ( weapon == 17 ) then --if the weapon used was the minigun
cancelEvent() --cancel the event
else
fadeCamera(false,1,255,0,0)
end

		function cam()
			fadeCamera(true,1)
		end
		setTimer(cam,50,1)

end


addEventHandler("onClientPlayerDamage",getLocalPlayer(),get_hit)

function stopMinigunDamage ( attacker, weapon, bodypart )
	if ( weapon == 17 ) then --if the weapon used was the minigun
		cancelEvent() --cancel the event
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), stopMinigunDamage )

----------------------------------------------------------------------
-------  Script:  ------------- Visit: --------------- Made in -------
------- 7rust-Dev ---------7rust.bplaced.de----------- GERMANY -------
----------------------------------------------------------------------
