addEvent("system.spawnVehicle", true)
addEventHandler("system.spawnVehicle", getRootElement(), function(target, vehicle)
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) and target and vehicle then
		if 	   vehicle == "Ron" then 
		vehID = 601 vehMaxSlots = 80 vehMaxFuel = 140 engine = 1 tires = 8 parts = 1
		elseif vehicle == "Patriot" then 
		vehID = 470 vehMaxSlots = 70 vehMaxFuel = 80 engine = 1 tires = 4 parts = 1
	--Admin Vehicle

			local x, y, z = getElementPosition(target)
			local rx, ry, rz = getElementRotation(target)
			local veh = createVehicle(vehID, x, y, z, rx, ry, rz)
			local vehCol = createColSphere(x + 5, y, z, 4)
			attachElements(vehCol, veh, 0, 0, 0)
			setElementData(vehCol, "parent", veh)
			setElementData(veh, "parent", vehCol)
			setElementData(vehCol, "vehicle", true)
			setElementData(vehCol, "MAX_Slots", vehMaxSlots)
			setElementData(vehCol, "Tire_inVehicle", tires)
			setElementData(vehCol, "Engine_inVehicle", engine)
			setElementData(vehCol, "Parts_inVehicle", parts)
			setElementData(vehCol, "spawn", {vehID, x, y, z})
			setElementData(vehCol, "fuel", vehMaxFuel)
			setVehicleHeadLightColor (veh, 215,200,105)
			setElementData(vehCol,"vehicle_armor",1000)
			warpPedIntoVehicle(target, veh)
			
			outputChatBox("[System] Zrespiono: "..vehicle.." przez "..getPlayerName(target), source, 255, 255, 255, true)
			outputChatBox("[System] Admin "..getPlayerName(source).."#FFFFFF zrespił "..vehicle, target, 255, 255, 255, true)
	end
	end
end)

	addEvent("system.vehicleFunctions.destroy", true)
	addEventHandler("system.vehicleFunctions.destroy", getRootElement(), function(target)
		if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) and isPedInVehicle(target) then
			outputChatBox("[System] Usunął: "..getPlayerName(target).."#FFFFFF - "..getVehicleName(getPedOccupiedVehicle(target)), source, 255, 255, 255, true)
			outputChatBox("[System] Admin "..getPlayerName(source).."#FFFFFF zniszczył twój samochód.", target, 255, 255, 255, true)
			setElementData(getElementData(getPedOccupiedVehicle(target), "parent"), "MAX_Slots", 0)
			setElementData(getElementData(getPedOccupiedVehicle(target), "parent"), "Engine_inVehicle", 0)
			setElementData(getElementData(getPedOccupiedVehicle(target), "parent"), "Tire_inVehicle", 0)
			setElementData(getElementData(getPedOccupiedVehicle(target), "parent"), "Parts_inVehicle", 0)
			setElementData(getElementData(getPedOccupiedVehicle(target), "parent"), "fuel", 0)
			setElementData(getElementData(getPedOccupiedVehicle(target), "parent"), "vehicle", false)
			setElementData(getElementData(getPedOccupiedVehicle(target), "parent"), "vehicle_armor", 0)
			destroyElement(getPedOccupiedVehicle(target))
		end
	end)
	
