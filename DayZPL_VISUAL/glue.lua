function glue()
	local player = getLocalPlayer()
	if not getPedOccupiedVehicle(player) then
		local vehicle = getPedContactElement(player)
		if getElementType(vehicle) == "vehicle" then
			
			if getVehicleType ( vehicle )  == "Plane" then
			return
			end
			
			if getVehicleType ( vehicle ) == "Helicopter" then
			return
			end
			if getVehicleType ( vehicle ) == "Bike" then
			return
			end
			if getVehicleType ( vehicle ) == "BMX" then
			return
			end
			if getVehicleType ( vehicle ) == "Quad" then
			return
			end
			local px, py, pz = getElementPosition(player)
			local vx, vy, vz = getElementPosition(vehicle)
			local sx = px - vx
			local sy = py - vy
			local sz = pz - vz
			
			local rotpX = 0
			local rotpY = 0
			local rotpZ = getPlayerRotation(player)
			
			local rotvX,rotvY,rotvZ = getVehicleRotation(vehicle)
			
			local t = math.rad(rotvX)
			local p = math.rad(rotvY)
			local f = math.rad(rotvZ)
			
			local ct = math.cos(t)
			local st = math.sin(t)
			local cp = math.cos(p)
			local sp = math.sin(p)
			local cf = math.cos(f)
			local sf = math.sin(f)
			
			local z = ct*cp*sz + (sf*st*cp + cf*sp)*sx + (-cf*st*cp + sf*sp)*sy
			local x = -ct*sp*sz + (-sf*st*sp + cf*cp)*sx + (cf*st*sp + sf*cp)*sy
			local y = st*sz - sf*ct*sx + cf*ct*sy
			
			local rotX = rotpX - rotvX
			local rotY = rotpY - rotvY
			local rotZ = rotpZ - rotvZ
			
			local slot = getPlayerWeaponSlot(player)
		 skin = getElementModel(player)
		 timeraaa = setTimer(getSkin,1000,0)
		 
		 
			outputDebugString("gluing ".. getPlayerName(player) .." to " .. getVehicleName(vehicle) .. "(offset: "..tostring(x)..","..tostring(y)..","..tostring(z).."; rotation:"..tostring(rotX)..","..tostring(rotY)..","..tostring(rotZ)..")")
			outputDebugString(skin)
			triggerServerEvent("gluePlayer", player, slot, vehicle, x, y, z, rotX, rotY, rotZ)
			
			unbindKey("x","down",glue)
			bindKey("x","down",unglue)
			bindKey("jump","down",unglue)
			unbindKey("x","down",glue)
		end
		
		else
	
		
	end
end
tlt = nil
function getSkin() 
if skin == getElementModel(getLocalPlayer()) then 

else

tlt = triggerServerEvent("ungluePlayer", getLocalPlayer() )
end

end
if tlt then 
killTimer(timeraaa)
end
addCommandHandler("glue",glue)

function unglue ()
	local player = getLocalPlayer()
	triggerServerEvent("ungluePlayer", player)
	unbindKey("jump","down",unglue)
	unbindKey("x","down",unglue)
	bindKey("x","down",glue)
end

addCommandHandler("unglue",unglue)

bindKey("x","down",glue)