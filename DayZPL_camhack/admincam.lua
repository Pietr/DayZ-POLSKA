function toggleAdminCam(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Admin")) then 
		if not isPedInVehicle(player) then
			if isPlayerFreecamEnabled(player) then
				setPlayerFreecamDisabled(player)
				outputChatBox("Wyłączyłeś tryb samolotowy", player, 255, 0, 0) 
			else 
				setPlayerFreecamEnabled(player)
				outputChatBox("Włączyłeś tryb samolotowy", player, 255, 0, 255) 
			end 
		else 
			outputChatBox("Nie możesz tego używać w samochodzie!", player, 255, 0, 0) 
		end 
	end 
end
addCommandHandler("admincam",toggleAdminCam)

function stopAdminCam()
	if isPlayerFreecamEnabled(source) then
		setPlayerFreecamDisabled(source)
	end
end
addEventHandler( "onPlayerLogout", root, stopAdminCam)
addEventHandler( "onResourceStop", resourceRoot, stopAdminCam)