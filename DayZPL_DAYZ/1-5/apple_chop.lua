local numhit = 0 --Щотчик ударвів по дереву
local maxhit = 15 --Максимальна кількість по дереву 
local length = 3 --Мінімальна кількість ударв
function checkIfWeaponIsHatchet(prevSlot,newSlot)
	if getPedWeapon(localPlayer,newSlot) == 0 then
		addEventHandler("onClientPreRender",root,chopApple)
	else
		removeEventHandler("onClientPreRender",root,chopApple)
	end
end
addEventHandler("onClientPlayerWeaponSwitch",localPlayer,checkIfWeaponIsHatchet)

function chopApple()
	local x, y, z = getElementPosition( localPlayer )
	local _, _, rz = getElementRotation( localPlayer )
	local tx = x + - ( length ) * math.sin( math.rad( rz ) )
	local ty = y + length * math.cos( math.rad( rz ) )
	local tz = z
	if getControlState( "fire" ) and getPedWeapon( localPlayer ) == 0 then
		local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material, lighting, piece, worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID = processLineOfSight( x, y, z, tx, ty, tz, true, false, false, true, true, false, false, false, localPlayer, true, false )
		if worldID and not startAppletick and applelist[worldID] then
			local Applename = applelist[worldID].name
			local interior = getElementInterior(localPlayer)
			numhit = numhit+1
			if numhit == maxhit then
				if not startAppletick then
					numhit = numhit-maxhit
					startAppletick = getTickCount()
					chop = playSound3D("1-5/pear.mp3", x, y, z, true) 
					mainFunction()
					startRollMessage2("Inventory", "Zebrałeś jabłko", 255, 22, 0 )
					triggerServerEvent( "onPlayerChopApple", localPlayer, worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
				end
			end
		end
	end
	if startAppletick then
		currenttick = getTickCount() - startAppletick
		if currenttick >= math.random(10000,30000) then --Час через який випаде писок
			chopping = false
			startAppletick = nil
		end
	end
end

 
 function mainFunction()
	setTimer ( function()
		  stopSound( chop )
	end, 2000, 1 )
end
 