function flip (player, command)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( "Admin" ) ) or isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( "Moderator" ) ) or isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( "SuperModerator" ) )  then
		local car = getPedOccupiedVehicle(player)
		local prachy = getPlayerMoney(player)
		local xxx,yyy,zzz = getElementPosition(player)
			--outputChatBox("Your vehicle has been flipped - 1500$.  You have $" ..  getPlayerMoney(player), player, 0, 255, 0)
			setElementRotation(car,0,0,0)
			setElementPosition(car,xxx,yyy,zzz+5)
	end
end
addCommandHandler("flip", flip)

function flip2 (player, command)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( "Admin" ) ) or isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( "Moderator" ) ) or isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( "SuperModerator" ) )  then
		local car = getPedOccupiedVehicle(player)
		local prachy = getPlayerMoney(player)
		local xxx,yyy,zzz = getElementPosition(player)
			--outputChatBox("Your vehicle has been flipped - 1500$.  You have $" ..  getPlayerMoney(player), player, 0, 255, 0)
			setElementRotation(car,0,0,0)
			setElementPosition(car,xxx,yyy,zzz+50)
	end
end
addCommandHandler("flip2", flip2)

function flip3 (player, command)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( "Admin" ) ) or isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( "Moderator" ) ) or isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(player)), aclGetGroup ( "SuperModerator" ) )  then
		local car = getPedOccupiedVehicle(player)
		local prachy = getPlayerMoney(player)
		local xxx,yyy,zzz = getElementPosition(player)
			--outputChatBox("Your vehicle has been flipped - 1500$.  You have $" ..  getPlayerMoney(player), player, 0, 255, 0)
			setElementRotation(car,0,0,0)
			setElementPosition(car,xxx,yyy,zzz+1000)
	end
end
addCommandHandler("flip3", flip3)