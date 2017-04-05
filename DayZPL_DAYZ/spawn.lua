function spawnDayZPlayer(player)
setElementData ( player, "killed", false ) --дюп
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z, math.random(0,360), 100, 0, 0)
	setElementFrozen(player, true)
	fadeCamera (player, true)
	setCameraTarget (player, player)
	setTimer( function(player)
		if isElement(player) then
			setElementFrozen(player, false)
		end
	end,500,1,player)
	playerCol = createColSphere(x,y,z,1.5)
	setElementData(player,"playerCol",playerCol)
	attachElements ( playerCol, player, 0, 0, 0 )
	setElementData(playerCol,"parent",player)
	setElementData(playerCol,"player",true)
	local account = getPlayerAccount(player)
	setAccountData(account,"isDead",false)
	setElementData(player,"isDead",false)
	setElementData(player,"logedin",true)
	setElementData(player,"admin",getAccountData(account,"admin") or false)
	setElementData(player,"supporter",getAccountData(account,"supporter") or false)
	for i,data in ipairs(playerDataTable) do
		setElementData(player,data[1],data[2])
	end
end



function notifyAboutExplosion2()
	for i,player in pairs(getVehicleOccupants(source)) do
		triggerEvent("kilLDayZPlayer",player)
	end
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion2)

function destroyDeadPlayer (ped,pedCol)
	destroyElement(ped)
	destroyElement(pedCol)
end

function kilLDayZPlayer (killer,headshot,weapon)
if not getElementData(source,"isDead") then
setElementData(source,"isDead",true)
end 
	if getElementData ( source, "killed" ) then -- дюп
		return true
	end
	setElementData ( source, "killed", true )
	   if getPedOccupiedVehicle ( source ) then
        removePedFromVehicle ( source )
    end
	local vehexplode = false
	if getElementData ( source, "attachedToWeapon" ) then
		vehexplode = true
		setElementData ( source, "attachedToWeapon", false )
	end
	pedCol = false
	local account = getPlayerAccount(source)
	if not account then return end
	killPed(source)
	triggerClientEvent(source,"hideInventoryManual",source)
	triggerClientEvent(source,"closeInventory",source)
	if not isElementInWater(source) then
		local x,y,z = getElementPosition(source)
		if getDistanceBetweenPoints3D (x,y,z,6000,6000,0) > 200 then
			local x,y,z = getElementPosition(source)
			local rotX,rotY,rotZ = getElementRotation(source)
			local skin = getElementModel(source)
			local ped = createPed(skin,x,y,z,rotZ)
			pedCol = createColSphere(x,y,z,1.5)
			killPed(ped)
			setTimer(destroyDeadPlayer,7200000*0.75,1,ped,pedCol)	
			attachElements (pedCol,ped,0,0,0)
			setElementData(pedCol,"parent",ped)
			setElementData(pedCol,"playername",getPlayerName(source))
			setElementData(pedCol,"deadman",true)
			setElementData(pedCol,"MAX_Slots",getElementData(source,"MAX_Slots"))
			local time = getRealTime()
			local hours = time.hour
			local minutes = time.minute
			setElementData(pedCol,"deadreason",getPlayerName(source).." nie żyje. Powód śmierci: "..(weapon or "NIEZNANY")..". Godzina śmierci: "..hours..":"..minutes) 
		end	
	end
	if killer then
		if not getElementData(source,"bandit") then
			addPlayerStats (killer,"humanity",math.random(-2500,-1000))
		else
			addPlayerStats (killer,"humanity",math.random(1000,2500))
		end
		setElementData(killer,"murders",getElementData(killer,"murders")+1)
		if getElementData(killer,"humanity") < 0 then
			setElementData(killer,"bandit",true)
		end
		if getElementData(source,"bandit") == true then
			setElementData(killer,"banditskilled",getElementData(killer,"banditskilled")+1)
		end
		if headshot == true then
			setElementData(killer,"headshots",getElementData(killer,"headshots")+1)
		end
	end
		if killer then
			triggerClientEvent ( "onRollMessageStart", getRootElement(),getPlayerName(source).." został zabity przez "..getPlayerName(killer).." ("..(getElementData ( killer, "selectedWeapon"))..")",255,255,255, "died")
		else
			triggerClientEvent ( "onRollMessageStart", getRootElement(),getPlayerName(source).." nie mógł przetrwać w tym niebezpiecznym świecie.",255,255,255, "died")
		end	
	if pedCol then
		for i,data in ipairs(playerDataTable) do
			local plusData = getElementData(source,data[1])
			if data[1] == "STANAG" then
				plusData = math.floor(getElementData(source,data[1])/40)
			elseif data[1] == "AK-MAG" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "AK-DRUM" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "SVD-MAG" then
				plusData = math.floor(getElementData(source,data[1])/10)
			elseif data[1] == "VSS-MAG" then
				plusData = math.floor(getElementData(source,data[1])/10)
			elseif data[1] == "MOSIN-CLIP" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "SKS-CLIP" then
				plusData = math.floor(getElementData(source,data[1])/10)
			elseif data[1] == "FAL-MAG" then
				plusData = math.floor(getElementData(source,data[1])/20)
			elseif data[1] == "Gauge Buckshot" then
				plusData = math.floor(getElementData(source,data[1])/2)
			elseif data[1] == "MP5-K-MAG" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "CZ61-MAG" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "UMP45-MAG" then
				plusData = math.floor(getElementData(source,data[1])/25)
			elseif data[1] == "1911-MAG" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "GLOCK-MAG" then
				plusData = math.floor(getElementData(source,data[1])/15)
			elseif data[1] == "MAGNUM-MAG" then
				plusData = math.floor(getElementData(source,data[1])/6)
			elseif data[1] == "Pieniądze" then
				plusData = math.floor(getElementData(source,data[1])/1000)
			end
			setElementData(pedCol,data[1],plusData)
			local skinID = getElementData(source,"skin")
			local skin = getSkinNameFromID(skinID)
			setElementData(pedCol,skin,1)
		end
	end
	setTimer(setElementPosition,500,1,source,6000,6000,0)
	triggerClientEvent(source,"onClientPlayerDeathInfo",source)
	setAccountData(account,"isDead",true)
	setElementData(source,"isDead",true)
	triggerClientEvent ( "onRollMessageStart", getRootElement(),"#FFFFFF"..getPlayerName(source).." #FF0000zginął",0,22,255, "died")
	if isElement(getElementData(source,"playerCol")) then
		destroyElement(getElementData(source,"playerCol"))
	end	

	setTimer(spawnDayZPlayer,15000,1,source)
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),kilLDayZPlayer)



function checkBuggedAccount()
	for i,player in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(player)
		if not account then return end
		if getElementData(player,"logedin") then
			if getElementModel(player) == 0 then
				if isElement ( player ) then
					spawnDayZPlayer(player)
					outputChatBox(getPlayerName(player).." - konto zostało wyzerowane!",getRootElement(),255,0,0,true)
				end
			end
		end
	end	
end