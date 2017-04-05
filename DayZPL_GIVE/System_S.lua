addEvent("system.openGUI", true)
addEventHandler("system.openGUI", getRootElement(), function()
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Name")) then triggerClientEvent(source, "system.openGUI.return", source) end
end)

addEvent("system.clientRequestsPlayerInfo", true)
addEventHandler("system.clientRequestsPlayerInfo", getRootElement(), function(target)
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) then
		local targetMoney = getPlayerMoney(target)
		triggerClientEvent(source, "system.clientRequestsPlayerInfo.return", source, target, targetMoney)
	end
end)

addEvent("system.givePlayerItem", true)
addEventHandler("system.givePlayerItem", getRootElement(), function(target, item, quantity)
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) then
		setElementData(target, tostring(item), tonumber(quantity))
		--outputChatBox("[System] Gave: "..getPlayerName(target).."#FFFFFF, "..quantity.."x "..item, source, 255, 255, 255, true)
		--outputChatBox("[System] Admin gave you: "..quantity.."x "..item, target, 255, 255, 255, true)
	end
end)

addEvent("system.player.setBlood", true)
addEventHandler("system.player.setBlood", getRootElement(), function(target, value)
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) then
		setElementData(target, "blood", tonumber(value))
		--outputChatBox("[System] Set: "..getPlayerName(target).."#FFFFFF Blood "..tostring(value), source, 255, 255, 255, true)
		--outputChatBox("[System] Set: Blood "..tostring(value), target, 255, 255, 255, true)
	end
end)

addEvent("system.player.killTarget", true)
addEventHandler("system.player.killTarget", getRootElement(), function(target)
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) and target then
		setElementData(target, "blood", -100)
		--outputChatBox("[System] Killed player "..getPlayerName(target), source, 255, 255, 255, true)
		--outputChatBox("[System] You were killed by Admin "..getPlayerName(source), target, 255, 255, 255, true)
	end
end)

addEvent("system.player.warpToTarget", true)
addEventHandler("system.player.warpToTarget", getRootElement(), function(target)
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) and target then
		if not isPedInVehicle(target) then
			setElementPosition(source, getElementPosition(target))
		elseif isPedInVehicle(target) then
			warpPedIntoVehicle(source, getPedOccupiedVehicle(target))
		end
		--outputChatBox("[System] Warped to "..getPlayerName(target), source, 255, 255, 255, true)
		--outputChatBox("[System] Admin "..getPlayerName(source).."#FFFFFF warped to you", target, 255, 255, 255, true)
	end
end)
--Vehicle Functions
	addEvent("system.vehicleFunctions.fix", true)
	addEventHandler("system.vehicleFunctions.fix", getRootElement(), function(target)
		if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) and isPedInVehicle(target) then
			fixVehicle(getPedOccupiedVehicle(target))
			--outputChatBox("[System] Fix: "..getPlayerName(target).."#FFFFFF - "..getVehicleName(getPedOccupiedVehicle(target)), source, 255, 255, 255, true)
			--outputChatBox("[System] Fix: Admin "..getPlayerName(source).."#FFFFFF fixed your vehicle", target, 255, 255, 255, true)
		end
	end)
	addEvent("system.vehicleFunctions.blow", true)
	addEventHandler("system.vehicleFunctions.blow", getRootElement(), function(target)
		if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) and isPedInVehicle(target) then
			--outputChatBox("[System] Blow: "..getPlayerName(target).."#FFFFFF - "..getVehicleName(getPedOccupiedVehicle(target)), source, 255, 255, 255, true)
			--outputChatBox("[System] Blow: Admin "..getPlayerName(source).."#FFFFFF blew your vehicle", target, 255, 255, 255, true)
			blowVehicle(getPedOccupiedVehicle(target))
		end
	end)
