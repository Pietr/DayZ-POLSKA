local numhit = 0 --Щотчик ударвів по дереву
local maxhit = 15 --Максимальна кількість по дереву 
local length = 3 --Мінімальна кількість ударв
function checkIfWeaponIsHatchet(prevSlot,newSlot)
	if getPedWeapon(localPlayer,newSlot) == 6 then
		addEventHandler("onClientPreRender",root,chopPisok)
	else
		removeEventHandler("onClientPreRender",root,chopPisok)
	end
end
addEventHandler("onClientPlayerWeaponSwitch",localPlayer,checkIfWeaponIsHatchet)

function chopPisok()
	local x, y, z = getElementPosition( localPlayer )
	local _, _, rz = getElementRotation( localPlayer )
	local tx = x + - ( length ) * math.sin( math.rad( rz ) )
	local ty = y + length * math.cos( math.rad( rz ) )
	local tz = z
	if getControlState( "fire" ) and getPedWeapon( localPlayer ) == 6 then
		local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material, lighting, piece, worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID = processLineOfSight( x, y, z, tx, ty, tz, true, false, false, true, true, false, false, false, localPlayer, true, false )
		if worldID and not startPisochoktick and pisoklist[worldID] then
			local Pisokname = pisoklist[worldID].name
			local interior = getElementInterior(localPlayer)
			numhit = numhit+1
			if numhit == maxhit then
				if not startPisochoktick then
					numhit = numhit-maxhit
					startPisochoktick = getTickCount()
					chop = playSound3D("1-5/pisok.mp3", x, y, z, true) 
					mainFunction()
					startRollMessage2("Inventory", "Zebrałeś piasek", 255, 22, 0 )
					triggerServerEvent( "onPlayerChopPisok", localPlayer, worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
				end
			end
		end
	end
	if startPisochoktick then
		currenttick = getTickCount() - startPisochoktick
		if currenttick >= math.random(10000,30000) then --Час через який випаде бривно
			chopping = false
			startPisochoktick = nil
		end
	end
end

 
 function mainFunction()
	setTimer ( function()
		  stopSound( chop )
	end, 2000, 1 )
end
 