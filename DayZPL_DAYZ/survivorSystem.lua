weaponAmmoTable = {
		["STANAG"] = {
		{"M4A1",31},
		{"M4A1 z tłumikiem",31},
		{"M4A1 kamuflaż",31},
		{"M4A1 kamuflaż z tłumikiem",31},
		{"AUG",31},
		{"AUG z tłumikiem",31},
	},
		["AK-MAG"] = {
		{"AK-101",30},
		{"AK-101 z tłumikiem",30},
		{"AK-101 kamuflaż",30},
		{"AK-101 kamuflaż z tłumikiem",30},
		{"AK-74",30},
		{"AK-74 z tłumikiem",30},
	},
		["AK-DRUM"] = {
		{"AKM",30},
		{"AKM z tłumikiem",30},
		{"AKM kamuflaż",30},
		{"AKM kamuflaż z tłumikiem",30},
	},
		["SVD-MAG"] = {
		{"SVD",34},
		{"SVD kamuflaż",34},
	},
		["VSS-MAG"] = {
		{"WSS Wintoriez",34},
		{"WSS Wintoriez kamuflaż",34},
	},
		["MOSIN-CLIP"] = {
		{"Mosin–Nagant",34},
		{"Mosin–Nagant z kamuflażem",34},
	},
		["SKS-CLIP"] = {
		{"SKS",34},
	},
		["FAL-MAG"] = {
		{"FN FAL",31},
		{"FN FAL z tłumikiem",31},
	},
		["Gauge Buckshot"] = {
		{"IZH-43",25},
		{"MP-133",25},
		{"WINCHESTER M70",34},
	},
		["MP5-K-MAG"] = {
		{"MP5",29},
		{"MP5 z tłumikiem",29},
	},
		["CZ61-MAG"] = {
		{"CZ61 SCORPION",28},
	},
		["UMP45-MAG"] = {
		{"UMP45",32},
	},
		["1911-MAG"] = {
		{"M1911",22},
		{"M1911 z tłumikiem",22},
	},
		["GLOCK-MAG"] = {
		{"GLOCK 19",23},
		{"GLOCK 19 z tłumikiem",23},
	},
		["MAGNUM-MAG"] = {
		{"MAGNUM",24},
	},

	["others"] = {
		{"Granat dymny",17},
		{"Granat hukowy",18},
		{"Granat M67",16},
		{"Nóż myśliwski",4},
		{"Topór",8},
		{"Lornetka",43},
		{"Bejsbol",5},
		{"Kij golfowy",2},
		{"Łopata",6},
		{"Radio",1},
		{"Piła spalinowa",9},
	},
}


function getWeaponAmmoType (weaponName,notOthers)
	if not notOthers then
		for i,weaponData in ipairs(weaponAmmoTable["others"]) do
			if weaponName == weaponData[1] then
				return weaponData[1],weaponData[2]
			end
		end
	end	
	for i,weaponData in ipairs(weaponAmmoTable["STANAG"]) do
		if weaponName == weaponData[1] then
			return "STANAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["AK-MAG"]) do
		if weaponName == weaponData[1] then
			return "AK-MAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["AK-DRUM"]) do
		if weaponName == weaponData[1] then
			return "AK-DRUM",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["SVD-MAG"]) do
		if weaponName == weaponData[1] then
			return "SVD-MAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["VSS-MAG"]) do
		if weaponName == weaponData[1] then
			return "VSS-MAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["MOSIN-CLIP"]) do
		if weaponName == weaponData[1] then
			return "MOSIN-CLIP",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["SKS-CLIP"]) do
		if weaponName == weaponData[1] then
			return "SKS-CLIP",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["FAL-MAG"]) do
		if weaponName == weaponData[1] then
			return "FAL-MAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Gauge Buckshot"]) do
		if weaponName == weaponData[1] then
			return "Gauge Buckshot",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["MP5-K-MAG"]) do
		if weaponName == weaponData[1] then
			return "MP5-K-MAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["CZ61-MAG"]) do
		if weaponName == weaponData[1] then
			return "CZ61-MAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["UMP45-MAG"]) do
		if weaponName == weaponData[1] then
			return "UMP45-MAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["1911-MAG"]) do
		if weaponName == weaponData[1] then
			return "1911-MAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["GLOCK-MAG"]) do
		if weaponName == weaponData[1] then
			return "GLOCK-MAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["MAGNUM-MAG"]) do
		if weaponName == weaponData[1] then
			return "MAGNUM-MAG",weaponData[2]
		end
	end
	return false
end


weaponIDtoObjectID = {
	{30,355},
	{31,356},
	{25,349},
	{26,350},
	{27,351},
	{33,357},
	{34,358},
	{36,360},
	{35,359},
	{2,333},
	{5,336},
	{8,339},
	{6,337},
}

function getWeaponObjectID (weaponID,weapname)
	if not weapname then weapname = "none" end
	for i,model in pairs (changeWeapons) do
		if i == weapname then
			return model
		end
	end
	for i,weaponData in ipairs(weaponIDtoObjectID) do
		if weaponID == weaponData[1] then
			return weaponData[2]
		end
	end
end		

local elementBackpack = {}
local elementBoroda = {}
function backPackBack (dataName,oldValue)
	if getElementType(source) == "player" then
		for i,v in pairs (clothSlots ) do
			if i == dataName then
				local newvalue = getElementData ( source, dataName )
				if type(newvalue) == "string" then
					local obj = getElementData ( source, dataName.."Object" )
					if obj and isElement(obj) then
						destroyElement (obj)
					end
					local objData = clothesObjects[newvalue]
					local model = getElementModel(source)
					 if objData and objData.skins then
						local x, y, z = getElementPosition(source)
						local helmet = createObject(objData.model_id, x, y, z)
						--setObjectScale ( helmet, objData.skins[7] )
						setElementData ( source, dataName.."Object", helmet )
						attachElementToBone(helmet, source, objData.bone, objData.skins[1], objData.skins[2], objData.skins[3], objData.skins[4], objData.skins[5], objData.skins[6])
					else
						setElementData ( source, dataName, oldValue )
						triggerClientEvent (source, "displayClientInfo", source,"INWENTARZ","Нельзя надеть это на этот скин",22,255,0)
					end
					return true
				else
					local obj = getElementData ( source, dataName.."Object" )
					if obj and isElement (obj) then
						destroyElement ( obj )
					end
					return true
				end
			end
		end
	end
	if getElementType(source) == "player" and dataName =="Rukzak" then
		local newValue = getElementData(source,dataName)
		if elementBackpack[source] then
			detachElementFromBone(elementBackpack[source])
			if isElement(elementBackpack[source]) then
				destroyElement(elementBackpack[source])
			end
			elementBackpack[source] = false
		end
		local x,y,z = getElementPosition(source)
		local rx,ry,rz = getElementRotation(source)
		if newValue == 0 then return end
		for _, data in ipairs ( attach_backpack ) do
			if newValue == data[1] then
				elementBackpack[source] = createObject(data[2],x,y,z)
				attachElementToBone(elementBackpack[source],source,data[3],data[4],data[5],data[6],data[7],data[8],data[9])
				--setObjectScale(elementBackpack[source],data[10])
			end	
		end
	end	
	if getElementType(source) == "player" and dataName == "Boroda" then
		local newValue = getElementData(source,dataName)
		if elementBoroda[source] then
			detachElementFromBone(elementBoroda[source])
			if isElement(elementBoroda[source]) then
				destroyElement(elementBoroda[source])
			end
			elementBoroda[source] = false
		end
		local x,y,z = getElementPosition(source)
		local rx,ry,rz = getElementRotation(source)
		if newValue == 0 then return end
		for _, data in ipairs ( attach_boroda ) do
			if newValue == data[1] then
				elementBoroda[source] = createObject(data[2],x,y,z)
				attachElementToBone(elementBoroda[source],source,data[3],data[4],data[5],data[6],data[7],data[8],data[9])
			end	
		end
	end	
end
addEventHandler ( "onElementDataChange", getRootElement(), backPackBack )


elementWeaponRaplace = {}
function weaponReplace(previousWeaponID,currentWeaponID)
	local weapon1 = getElementData(source,"currentweapon_1")
	local weapon2 = getElementData(source,"currentweapon_2")
	if not weapon1 and not weapon2 then return end
	local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
	local ammoData2,weapID2 = getWeaponAmmoType(weapon2)
	local x,y,z = getElementPosition(source)
	local rx,ry,rz = getElementRotation(source)
	if elementWeaponRaplace[source] then
		destroyElement(elementWeaponRaplace[source])
		elementWeaponRaplace[source] = false
	end
	local model = changeWeapons[weapon1]
	
	if currentWeaponID == weapID2 then
		model = changeWeapons[weapon2]
		setElementData ( source, "selectedWeapon",weapon2)
	elseif currentWeaponID == weapID1 then
		setElementData ( source, "selectedWeapon",weapon1)
	end

	if currentWeaponID == weapID1 or currentWeaponID == weapID2 then
		if model then
			elementWeaponRaplace[source] = createObject(model,x,y,z)
			--attachElementToBone(elementWeaponRaplace[source],source,12,-0.01,0.01,0.1,-185,90,200)
			attachElementToBone(elementWeaponRaplace[source],source,12,-0.01,0.01,0.25,-5,100,190)
		end
	end
	end
addEventHandler("onPlayerWeaponSwitch",getRootElement(),weaponReplace)

elementWeaponBack = {}
function weaponSwitchBack ( previousWeaponID, currentWeaponID )
	local weapon1 = getElementData(source,"currentweapon_1")
	if not weapon1 then return end
	local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
	local x,y,z = getElementPosition(source)
	local rx,ry,rz = getElementRotation(source)
	if previousWeaponID == weapID1 then
		if elementWeaponBack[source] then
			detachElementFromBone(elementWeaponBack[source])
			destroyElement(elementWeaponBack[source])
			elementWeaponBack[source] = false
		end
		elementWeaponBack[source] = createObject(getWeaponObjectID(weapID1,weapon1),x,y,z)
		setObjectScale(elementWeaponBack[source],0.875)
		if elementBackpack[source] then
			attachElementToBone(elementWeaponBack[source],source,3,0.19,-0.20,-0.01,0,90,90)
		else
			attachElementToBone(elementWeaponBack[source],source,3,0.05,-0.1,-0.01,0,90,180)
		end
	elseif currentWeaponID == weapID1 then
        if isElement(elementWeaponBack[source]) then
           detachElementFromBone(elementWeaponBack[source])
           destroyElement(elementWeaponBack[source])
           elementWeaponBack[source] = false
		end
    end
end
addEventHandler("onPlayerWeaponSwitch",getRootElement(),weaponSwitchBack)


-----------------------------------------
function removeBackWeaponOnDrop ()
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end
	if elementWeaponRaplace[source] then 
		detachElementFromBone(elementWeaponRaplace[source]) 
		destroyElement(elementWeaponRaplace[source])          
		elementWeaponRaplace[source] = false
	end
end
addEvent("removeBackWeaponOnDrop",true)
addEventHandler("removeBackWeaponOnDrop",getRootElement(),removeBackWeaponOnDrop)

function removeAttachedOnDeath ()
	if elementBackpack[source] then
		detachElementFromBone(elementBackpack[source])
		destroyElement(elementBackpack[source])
	end
	if elementBoroda[source] then
		detachElementFromBone(elementBoroda[source])
		destroyElement(elementBoroda[source])
	end
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end
	if elementWeaponRaplace[source] then
		detachElementFromBone(elementWeaponRaplace[source])
		destroyElement(elementWeaponRaplace[source])
		elementWeaponRaplace[source] = false
	end	
	for i, v in pairs ( clothSlots ) do
		local obj = getElementData ( source, i.."Object" )
		if obj and isElement ( obj ) then
			destroyElement ( obj )
		end
	end
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),removeAttachedOnDeath)

function backpackRemoveQuit ()
	if elementBackpack[source] then
		detachElementFromBone(elementBackpack[source])
		destroyElement(elementBackpack[source])
	end
	if elementBoroda[source] then
		detachElementFromBone(elementBoroda[source])
		destroyElement(elementBoroda[source])
	end
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end	
	if elementWeaponRaplace[source] then
		detachElementFromBone(elementWeaponRaplace[source])
		destroyElement(elementWeaponRaplace[source])
		elementWeaponRaplace[source] = false
	end
	for i, v in pairs ( clothSlots ) do
		local obj = getElementData ( source, i.."Object" )
		if obj and isElement ( obj ) then
			destroyElement ( obj )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), backpackRemoveQuit )


function rearmPlayerWeapon (weaponName,slot)
	takeAllWeapons (source)
	local ammoData,weapID = getWeaponAmmoType (weaponName)
	if getElementData(source,ammoData) <= 0 then
		triggerClientEvent (source, "displayClientInfo", source,"Rearm",shownInfos["nomag"],255,0,0)
		return true
	end	
	setElementData(source,"currentweapon_"..slot,weaponName)
	local weapon = getElementData(source,"currentweapon_1")
	if weapon and ( getElementData ( source, weapon ) or 0 ) > 0 then
		local ammoData,weapID = getWeaponAmmoType (weapon)
		giveWeapon(source,weapID,getElementData(source,ammoData), true )
	end
	local weapon = getElementData(source,"currentweapon_2")
	if weapon and ( getElementData ( source, weapon ) or 0 ) > 0 then
		local ammoData,weapID = getWeaponAmmoType (weapon)
		giveWeapon(source,weapID,getElementData(source,ammoData), false )
	end
	local weapon = getElementData(source,"currentweapon_3")
	if weapon and ( getElementData ( source, weapon ) or 0 ) > 0 then
		local ammoData,weapID = getWeaponAmmoType (weapon)
		giveWeapon(source,weapID,getElementData(source,ammoData), false )
	end
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])
		elementWeaponBack[source] = false
	end
	setElementModel(source, getElementData(source,"skin"))
end
addEvent("onPlayerRearmWeapon",true)
addEventHandler("onPlayerRearmWeapon",getRootElement(),rearmPlayerWeapon)

------------------------


function weaponDelete(dataName,oldValue)
	if getElementType(source) == "player" then
		local weapon1 = getElementData(source,"currentweapon_1")
		local weapon2 = getElementData(source,"currentweapon_2")
		local weapon3 = getElementData(source,"currentweapon_3")
		if dataName == weapon1 then
			if getElementData (source,dataName) == 0 then
				local ammoData,weapID = getWeaponAmmoType(dataName)
				takeWeapon (source,weapID)
				setElementData ( source, "currentweapon_1", false)
				removeBackWeaponOnDrop()
			end
		elseif dataName == weapon2 then
			if getElementData (source,dataName) == 0 then
				local ammoData,weapID = getWeaponAmmoType(dataName)
				takeWeapon (source,weapID)
				setElementData ( source, "currentweapon_2", false)
			end
		elseif dataName == weapon3 then
			if getElementData (source,dataName) == 0 then
				local ammoData,weapID = getWeaponAmmoType(dataName)
				takeWeapon (source,weapID)
				setElementData ( source, "currentweapon_3", false)
			end
		end
		local weapon1 = getElementData(source,"currentweapon_1")
		local weapon2 = getElementData(source,"currentweapon_2")
		local weapon3 = getElementData(source,"currentweapon_3")
		local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
		local ammoData2,weapID2 = getWeaponAmmoType(weapon2)
		local ammoData3,weapID3 = getWeaponAmmoType(weapon3)
		if dataName == ammoData1 then
			if not oldValue or oldValue == 0 then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				if getElementData (source,dataName) <= 0 then
					takeWeapon (source,weapID1) 
					setElementData ( source, "currentweapon_1", false)
					if elementWeaponBack[source] then
						detachElementFromBone(elementWeaponBack[source])
						destroyElement(elementWeaponBack[source])	
						elementWeaponBack[source] = false
					end	
				else
					setWeaponAmmo ( source, weapID1, getElementData (source,dataName) )
				end
			elseif getElementData (source,dataName) > oldValue then
				if getElementData (source,dataName)-oldValue > 0 then
					giveWeapon(source,weapID1,getElementData (source,dataName)-oldValue,false)
				end
			end
		end	
		if dataName == ammoData2 then
			if not oldValue or oldValue == 0 then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				if getElementData (source,dataName) <= 0 then
					takeWeapon (source,weapID2) 
					setElementData ( source, "currentweapon_2", false)
					if elementWeaponBack2[source] then
						detachElementFromBone(elementWeaponBack2[source])
						destroyElement(elementWeaponBack2[source])	
						elementWeaponBack2[source] = false
					end	
				else
					setWeaponAmmo ( source, weapID2, getElementData (source,dataName) )
				end
			elseif getElementData (source,dataName) > oldValue then
				if getElementData (source,dataName)-oldValue > 0 then
					giveWeapon(source,weapID2,getElementData (source,dataName)-oldValue,false)
				end
			end
		end	
		if dataName == ammoData3 then
			if not oldValue or oldValue == 0 then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				if getElementData (source,dataName) <= 0 then
					takeWeapon (source,weapID3) 
					setElementData ( source, "currentweapon_1", false)
					if elementWeaponBack[source] then
						detachElementFromBone(elementWeaponBack[source])
						destroyElement(elementWeaponBack[source])	
						elementWeaponBack[source] = false
					end	
				else
					setWeaponAmmo ( source,weapID3,getElementData(source,dataName))
				end
			elseif getElementData (source,dataName) > oldValue then
				if getElementData (source,dataName)-oldValue > 0 then
					giveWeapon(source,weapID3,getElementData (source,dataName)-oldValue,false)
				end
			end
		end
	end
end
addEventHandler("onElementDataChange",getRootElement(),weaponDelete)

function addPlayerStats (player,data,value)
	if data == "food" then	
		local current = getElementData(player,data)
		if current + value > 100 then
			setElementData(player,data,100)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
			setElementData(player,"blood",getElementData(player,"blood")-math.random(50,120))
		else
			setElementData(player,data,current+value)
		end
	elseif data == "thirst" then
		local current = getElementData(player,data)
		if current + value > 100 then
			setElementData(player,data,100)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
			setElementData(player,"blood",getElementData(player,"blood")-math.random(50,120))
		else
			setElementData(player,data,current+value)
		end
		
		elseif data == "sleep" then
		local current = getElementData(player,data)
		if current + value > 400 then
			setElementData(player,data,400)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
		else
			setElementData(player,data,current+value)
		end
		
		elseif data == "sick" then
		local current = getElementData(player,data)
		if current + value > 60 then
			setElementData(player,data,60)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
		else
			setElementData(player,data,current+value)
		end
		
		
		
	elseif data == "blood" then
		local current = getElementData(player,data)
		if current + value > 12000 then
			setElementData(player,data,12000)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
		else
			setElementData(player,data,current+value)
		end
	elseif data == "temperature" then
		local current = getElementData(player,data)
		if current + value > 41 then
			setElementData(player,data,41)
		elseif 	current + value <= 31 then
			setElementData(player,data,31)
		else
			setElementData(player,data,current+value)
		end
	elseif data == "humanity" then
		local current = getElementData(player,data)
		if current + value > 5000 then
			setElementData(player,data,5000)
		else
			setElementData(player,data,current+value)
		end		
	end
end

function checkTemperature()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = 0
			if getWeather == 7 then
				value = -0.1
			elseif getWeather == 12 then
				value = 0
			elseif getWeather == 16 then
				value = -0.4
			elseif getWeather == 4 then
				value = -0.1
			end
			local hour, minutes = getTime()
			if hour >= 21 and hour <= 8 then
				value = value-0.05
			end
			addPlayerStats (player,"temperature",value)
		end
	end	
end
setTimer(checkTemperature,120000,0)

function checkTemperature2()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = 0
			if isElementInWater(player) then
				value = gameplayVariables["temperaturewater"]
			end	
			if getControlState (player,"sprint") then
				value = value+gameplayVariables["temperaturesprint"]
			end
			addPlayerStats (player,"temperature",value)
		end	
	end
end
setTimer(checkTemperature2,10000,0)

function setHunger()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = gameplayVariables["loseHunger"]
			addPlayerStats (player,"food",value)
		end	
	end
end
setTimer(setHunger,60000,0)

function checkHunger()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = 0
			if getControlState (player,"sprint") then
				value = -2.5
			end	
			addPlayerStats (player,"food",value)
		end
	end
end
setTimer(checkHunger,60000,0)


function setThirsty()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = gameplayVariables["loseThirst"]
			addPlayerStats (player,"thirst",value)
		end
	end
end
setTimer(setThirsty,60000,0)

function checkThirsty()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = 0
			if getControlState (player,"sprint") then
				value = -2.5
			end	
			addPlayerStats (player,"thirst",value)
		end
	end
end
setTimer(checkThirsty,60000,0)

function setSleep()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = gameplayVariables["loseThirst"]
			addPlayerStats (player,"sleep",value)
		end
	end
end
setTimer(setSleep,60000,0)

function checkSleep()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = 0
			if getControlState (player,"sprint") then
				value = gameplayVariables["sprintthirst"]
			end	
			addPlayerStats (player,"sleep",value)
		end
	end
end
setTimer(checkSleep,10000,0)


function checkHumanity()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			if getElementData(player,"humanity") < 2500 then
				addPlayerStats (player,"humanity",30)
				if getElementData(player,"humanity") > 2000 then
					setElementData(player,"bandit",false)
				end
			end
		end	
	end
end
setTimer(checkHumanity,60000,0)

function checkBoroda()
for i, player in ipairs(getElementsByType("player")) do
if getElementData(player,"logedin") then
local Time = getElementData(player,"alivetime")
	if Time >= 480 and Time <= 960 then
		setElementData(player,"Boroda",1)
	elseif Time >= 960 then
		setElementData(player,"Boroda",2)
	end
end
end
end
setTimer(checkBoroda,1000,0)

function onPlayerRequestChangingStats(itemName,itemInfo,data)
	if data == "food" then
		if itemName == "Sardynki w puszce" then
			blood = 86
			sick = math.random(1,8) 
		elseif itemName == "Puszka spaghetti" then
			blood = 192
			sick = math.random(2,9) 
		elseif itemName == "Konserwa z tuńczyka" then
			blood = 153
			sick = math.random(1,8) 
		elseif itemName == "Brzoskwinie w puszce" then
			blood = 500
			sick = math.random(2,5) 
		elseif itemName == "Puszka bekonu" then
			blood = 107
			sick = math.random(1,5) 
		elseif itemName == "Ryż" then
			blood = 500
			sick = math.random(2,9) 
		elseif itemName == "Mleko" then
			blood = 84
			sick = math.random(1,6) 
		elseif itemName == "Pomidor" then
			blood = 84
			sick = math.random(2,8) 
		elseif itemName == "Ziemniak" then
			blood = 143
			sick = math.random(1,4) 
		elseif itemName == "Papryka" then
			blood = 33
			sick = math.random(2,7) 
		elseif itemName == "Banan" then
			blood = 96
			sick = math.random(1,8) 
		elseif itemName == "Pomarańcz" then
			blood = 117
			sick = math.random(2,8) 
		elseif itemName == "Kiwi" then
			blood = 56
			sick = math.random(1,8) 
		elseif itemName == "Cukinia" then
			blood = 77
			sick = math.random(2,5) 
		elseif itemName == "Borówki" then
			blood = 32
			sick = math.random(1,3) 
		elseif itemName == "Żurawina" then
			blood = 33
			sick = math.random(2,9) 
		elseif itemName == "Gruszka" then
			blood = 70
			sick = math.random(1,6) 
		elseif itemName == "Jabłko" then
			blood = 70
			sick = math.random(1,3) 
		elseif itemName == "Surowe mięso" then
			blood = 100
			sick = math.random(2,7) 
		end
		setPedAnimation (source,"FOOD","EAT_Burger",-1,false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
		addPlayerStats (source,"blood",blood)
		addPlayerStats (source,"sick",sick)
		addPlayerStats (source,"alcogol",-sick)
		addPlayerStats (source,data,gameplayVariables["foodrestore"])
		elseif data == "thirst"  then
		setElementData(source,itemName,getElementData(source,itemName)-1)
		addPlayerStats (source,data,gameplayVariables["thirstrestore"])
		setPedAnimation (source,"VENDING","VEND_Drink2_P",-1,false,false,false,false) 	
		if itemName == "Manierka" then
			setElementData(source,"Pusta manierka",(getElementData(source,"Pusta manierka") or 0)+1)
		end
		if itemName == "Butelka wody" then
			setElementData(source,"Plastikowa butelka",(getElementData(source,"Plastikowa butelka") or 0)+1)
		end	
	end
	triggerClientEvent (source, "displayClientInfo", source,"Food",shownInfos["youconsumed"].." "..itemName,22,255,0)
	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerRequestChangingStats",true)
addEventHandler("onPlayerRequestChangingStats",getRootElement(),onPlayerRequestChangingStats)

function onPlayerOpenFood(itemName)
	if itemName == "Sardynki w puszce (✖)" then
		setElementData(source,itemName,getElementData(source,itemName)-1)
		setElementData(source,"Sardynki w puszce",getElementData(source,"Sardynki w puszce")+1)
	elseif itemName == "Puszka spaghetti (✖)" then
		setElementData(source,itemName,getElementData(source,itemName)-1)
		setElementData(source,"Puszka spaghetti",getElementData(source,"Puszka spaghetti")+1)
	elseif itemName == "Konserwa z tuńczyka (✖)" then
		setElementData(source,itemName,getElementData(source,itemName)-1)
		setElementData(source,"Konserwa z tuńczyka",getElementData(source,"Konserwa z tuńczyka")+1)
	elseif itemName == "Brzoskwinie w puszce (✖)" then
		setElementData(source,itemName,getElementData(source,itemName)-1)
		setElementData(source,"Brzoskwinie w puszce",getElementData(source,"Brzoskwinie w puszce")+1)
	elseif itemName == "Puszka bekonu (✖)" then
		setElementData(source,itemName,getElementData(source,itemName)-1)
		setElementData(source,"Puszka bekonu",getElementData(source,"Puszka bekonu")+1)	
	end
	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerOpenFood",true)
addEventHandler("onPlayerOpenFood",getRootElement(),onPlayerOpenFood)


function onPlayerUseMedicObject(itemName)
	local playersource = source
	setPedAnimation (playersource,"BOMBER","BOM_Plant",-1,false,false,false,false)
	setTimer( function ()
		if itemName == "Bandaż" then
			setElementData(playersource,"bleeding",0)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Płyn fizjologiczny" then
			addPlayerStats (playersource,"blood",7000)
			setElementData(playersource,"bleeding",0)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Anty Rad" then
			addPlayerStats (playersource,"blood",703)
			setElementData(playersource,"radiation",0)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Węgiel medyczny" then
			addPlayerStats (playersource,"blood",100)
			setElementData(playersource,"sick",0)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Antybiotyk" then
			addPlayerStats (playersource,"blood",100)
			setElementData(playersource,"infection_zom",0)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Adrenalina" then
			setElementData(playersource,"sleep",400)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Arbidol" then
			setElementData(playersource,"grip",0)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Termofor" then
			setElementData(playersource,"cold",false)
			setElementData(playersource,"temperature",37)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Środki przeciwbólowe" then
			setElementData(playersource,"pain",false)
			setElementData(playersource,"sleep",400)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Morfina" then
			setElementData(playersource,"brokenbone",false)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Paczka krwii" then
			addPlayerStats (playersource,"blood",12000)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		end
	end,1500,1)	
	triggerClientEvent(playersource,"refreshInventoryManual",playersource)
end
addEvent("onPlayerUseMedicObject",true)
addEventHandler("onPlayerUseMedicObject",getRootElement(),onPlayerUseMedicObject)



function onPlayerGiveMedicObject(itemName,player)
	local playersource = source
	setPedAnimation (playersource,"BOMBER","BOM_Plant", -1, false, false, false, false)
	setTimer( function ()
		if itemName == "bandage" then
			setElementData(player,"bleeding",0)
			setElementData(playersource,"Bandaż",getElementData(playersource,"Bandaż")-1)
			addPlayerStats (playersource,"humanity",40)
		elseif itemName == "giveblood" then
			addPlayerStats (player,"blood",12000)
			setElementData(playersource,"Paczka krwii",getElementData(playersource,"Paczka krwii")-1)
			addPlayerStats (playersource,"humanity",math.random(200,300))
		end
	end,1500,1)	
end
addEvent("onPlayerGiveMedicObject",true)
addEventHandler("onPlayerGiveMedicObject",getRootElement(),onPlayerGiveMedicObject)

function onPlayerRefillWaterBottle (itemName)
	if isElementInWater(source) then
		setElementData(source,"Manierka",getElementData(source,"Manierka")+1)
		setElementData(source,itemName,getElementData(source,itemName)-1)
		triggerClientEvent(source,"refreshInventoryManual",source)
		triggerClientEvent (source, "displayClientInfo", source,"Manierka",shownInfos["filledup"],22,255,0)
	else
		triggerClientEvent (source, "displayClientInfo", source,"Manierka",shownInfos["needwatersource"],255,22,0)
	end	
end
addEvent("onPlayerRefillWaterBottle",true)
addEventHandler("onPlayerRefillWaterBottle",getRootElement(),onPlayerRefillWaterBottle)

function onPlayerRefillWaterBottle2 (itemName)
	if isElementInWater(source) then
		setElementData(source,"Butelka wody",getElementData(source,"Butelka wody")+1)
		setElementData(source,itemName,getElementData(source,itemName)-1)
		triggerClientEvent(source,"refreshInventoryManual",source)
		triggerClientEvent (source, "displayClientInfo", source,"Butelka wody",shownInfos["bootelup"],22,255,0)
	else
		triggerClientEvent (source, "displayClientInfo", source,"Butelka wody",shownInfos["bootel"],255,22,0)
	end	
end
addEvent("onPlayerRefillWaterBottle2",true)
addEventHandler("onPlayerRefillWaterBottle2",getRootElement(),onPlayerRefillWaterBottle2)

function hideBodyClientS () 
  local col = getElementData(source,"currentCol") 
  if isElement ( col ) then   
  if getElementData ( col, "deadman" ) then  
  setPedAnimation ( source, "BOMBER", "BOM_Plant", -1, false, true, true, false )   
  setElementData(source,"loot",false)   
  setElementData(source,"currentCol",false)  
  setTimer ( function ( colision )    
  if isElement ( getElementData ( colision, "parent" ) ) then  
  destroyElement ( getElementData ( colision, "parent" ) )   
  end     
  destroyElement ( colision )   
  end, 1500, 1, col )  
  end  
  end 
  end  
  addEvent("hideBodyClient",true)  addEventHandler("hideBodyClient", getRootElement(),hideBodyClientS)

---- установка брони в тачку
function setArmourVehicle(col)
	setPedAnimation(source,"BOMBER","BOM_Plant",-1,false,false,false,false)
	setElementData(source,"Pancerz sam.",getElementData(source,"Pancerz sam.")-1)
	setElementData(col,"vehicle_armor",1000)
end
addEvent("setArmourVehicle",true)
addEventHandler("setArmourVehicle",getRootElement(),setArmourVehicle)
--
---- Ракет
function setRaketVehicle(col)
	setPedAnimation(source,"BOMBER","BOM_Plant",-1,false,false,false,false)
	setElementData(source,"BGM-71 TOW",getElementData(source,"BGM-71 TOW")-1)
	setElementData(col,"raket",6)
end
addEvent("setRaketVehicle",true)
addEventHandler("setRaketVehicle",getRootElement(),setRaketVehicle)

addEvent("sv_bulletSpawn", true)
addEventHandler("sv_bulletSpawn",getRootElement(),function(x, y, z, player)
	triggerClientEvent("cl_bulletSpawn", getRootElement(), x, y, z, player)
end)

--
attaches_tent = {}
function onPlayerPitchATent(player)
	local x,y,z = getElementPosition(player)
	attaches_tent[player] = createObject(2218,x,y,z)
	attachElements(attaches_tent[player],player,0,4,-1,0,0,-270)
	bindKey(player,"space","down",pitchTent,player)
	bindKey(player,"q","down",destroyAttachTent,player)
end
addEvent("onPlayerPitchATent",true)
addEventHandler("onPlayerPitchATent",getRootElement(),onPlayerPitchATent)

function destroyAttachTent(player)
	detachElements(attaches_tent[player])
	destroyElement(attaches_tent[player])
	unbindKey(player,"space","down",pitchTent)
	unbindKey(player,"q","down",destroyAttachTent)
	setElementData(player,"setTent",false)
end
addEvent("destroyAttachTent",true)
addEventHandler("destroyAttachTent",getRootElement(),destroyAttachTent)

function pitchTent(player)
	unbindKey(player,"space","down",pitchTent)
	unbindKey(player,"q","down",destroyAttachTent)
	detachElements(attaches_tent[player])
	destroyElement(attaches_tent[player])
	
	local x,y,z = getElementPosition(player)
	local xr,yr,zr = getElementRotation(player)
	local px, py, pz = getElementPosition(player)
	local prot = getPedRotation(player)
	local offsetRot = math.rad(prot+90)
	local vx = px + 4 * math.cos(offsetRot)
	local vy = py + 4 * math.sin(offsetRot)
	local vz = pz + 4
	local vrot = prot-270
	local serial = getPlayerSerial(player)
	local name = getPlayerName(player)
	
	attaches_tent[player] = createObject(2218,vx,vy,z-1,0,0,vrot)
	tentCol = createColSphere(x,y,z,4)
	attachElements(tentCol,attaches_tent[player],0,0,0)
	setElementData(tentCol,"parent",attaches_tent[player])
	setElementData(attaches_tent[player],"parent",tentCol)
	setElementData(tentCol,"tent",true)
	setElementData(tentCol,"vehicle",true)
	setElementData(tentCol,"MAX_Slots",252)
	setElementData(tentCol,"serial",serial)
	setElementData(tentCol,"name",name)
	
	setElementData(player,"Namiot (wojskowy)",getElementData(player,"Namiot (wojskowy)")-1)
	setElementData(player,"setTent",false)
	setPedAnimation(player,"BOMBER","BOM_Plant",-1,false,false,false,false)
end
-------------------
attaches_tent2 = {}
function onPlayerPitchATent2(player)
	local x,y,z = getElementPosition(player)
	attaches_tent2[player] = createObject(2220,x,y,z)
	attachElements(attaches_tent2[player],player,0,5,-1,0,0,-270)
	bindKey(player,"space","down",pitchTent2,player)
	bindKey(player,"q","down",destroyAttachTent2,player)
	setElementData(player,"setTent",false)
end
addEvent("onPlayerPitchATent2",true)
addEventHandler("onPlayerPitchATent2",getRootElement(),onPlayerPitchATent2)

function destroyAttachTent2(player)
	detachElements(attaches_tent2[player])
	destroyElement(attaches_tent2[player])
	unbindKey(player,"space","down",pitchTent2)
	unbindKey(player,"q","down",pitchTent2)
	setElementData(player,"setTent",false)
end
addEvent("destroyAttachTent2",true)
addEventHandler("destroyAttachTent2",getRootElement(),destroyAttachTent2)

function pitchTent2(player)
	unbindKey(player,"space","down",pitchTent2)
	unbindKey(player,"q","down",destroyAttachTent2)
	detachElements(attaches_tent2[player])
	destroyElement(attaches_tent2[player])
	
	local x,y,z = getElementPosition(player)
	local xr,yr,zr = getElementRotation(player)
	local px, py, pz = getElementPosition(player)
	local prot = getPedRotation(player)
	local offsetRot = math.rad(prot+90)
	local vx = px + 5 * math.cos(offsetRot)
	local vy = py + 5 * math.sin(offsetRot)
	local vz = pz + 5
	local vrot = prot-270
	local serial = getPlayerSerial(player)
	local name = getPlayerName(player)
	
	attaches_tent2[player] = createObject(2220,vx,vy,z-1,0,0,vrot)
	tentCol = createColSphere(x,y,z,4)
	attachElements(tentCol,attaches_tent2[player],0,0,0)
	setElementData(tentCol,"parent",attaches_tent2[player])
	setElementData(attaches_tent2[player],"parent",tentCol)
	setElementData(tentCol,"tent",true)
	setElementData(tentCol,"vehicle",true)
	setElementData(tentCol,"MAX_Slots",60)
	setElementData(tentCol,"serial",serial)
	setElementData(tentCol,"name",name)
	
	setElementData(player,"Namiot (podróżny)",getElementData(player,"Namiot (podróżny)")-1)
	setElementData(player,"setTent",false)
	setPedAnimation(player,"BOMBER","BOM_Plant",-1,false,false,false,false)
end
-------------------
-------------------
attaches_tent3 = {}
function onPlayerPitchATent3(player)
	local x,y,z = getElementPosition(player)
	attaches_tent3[player] = createObject(2222,x,y,z)
	attachElements(attaches_tent3[player],player,0,5,-1,0,0,-180)
	bindKey(player,"space","down",pitchTent3,player)
	bindKey(player,"q","down",destroyAttachTent3,player)
	setElementData(player,"setTent",false)
end
addEvent("onPlayerPitchATent3",true)
addEventHandler("onPlayerPitchATent3",getRootElement(),onPlayerPitchATent3)

function destroyAttachTent3(player)
	detachElements(attaches_tent3[player])
	destroyElement(attaches_tent3[player])
	unbindKey(player,"space","down",pitchTent3)
	unbindKey(player,"q","down",pitchTent3)
	setElementData(player,"setTent",false)
end
addEvent("destroyAttachTent3",true)
addEventHandler("destroyAttachTent3",getRootElement(),destroyAttachTent3)

function pitchTent3(player)
	unbindKey(player,"space","down",pitchTent3)
	unbindKey(player,"q","down",destroyAttachTent3)
	detachElements(attaches_tent3[player])
	destroyElement(attaches_tent3[player])
	
	local x,y,z = getElementPosition(player)
	local xr,yr,zr = getElementRotation(player)
	local px, py, pz = getElementPosition(player)
	local prot = getPedRotation(player)
	local offsetRot = math.rad(prot+90)
	local vx = px + 5 * math.cos(offsetRot)
	local vy = py + 5 * math.sin(offsetRot)
	local vz = pz + 5
	local vrot = prot-180
	local serial = getPlayerSerial(player)
	local name = getPlayerName(player)
	
	attaches_tent3[player] = createObject(2222,vx,vy,z-1,0,0,vrot)
	tentCol = createColSphere(x,y,z,4)
	attachElements(tentCol,attaches_tent3[player],0,0,0)
	setElementData(tentCol,"parent",attaches_tent3[player])
	setElementData(attaches_tent3[player],"parent",tentCol)
	setElementData(tentCol,"tent",true)
	setElementData(tentCol,"vehicle",true)
	setElementData(tentCol,"MAX_Slots",168)
	setElementData(tentCol,"serial",serial)
	setElementData(tentCol,"name",name)
	
	setElementData(player,"Namiot (samochodowy)",getElementData(player,"Namiot (samochodowy)")-1)
	setElementData(player,"setTent",false)
	setPedAnimation(player,"BOMBER","BOM_Plant",-1,false,false,false,false)
end
-------------------
--Провлка
attaches_Wirefence = {}
function onPlayerBuildAWireFence(player)
	local x,y,z = getElementPosition(player)
	attaches_Wirefence[player] = createObject(1748,x,y,z)
	attachElements(attaches_Wirefence[player],player,0,4,-1.1,0,0,0)
	bindKey(player,"space","down",pitchWirefence,player)
	bindKey(player,"q","down",destroyAttachWireFence,player)
end
addEvent("onPlayerBuildAWireFence",true)
addEventHandler("onPlayerBuildAWireFence",getRootElement(),onPlayerBuildAWireFence)

function destroyAttachWireFence(player)
	detachElements(attaches_Wirefence[player])
	destroyElement(attaches_Wirefence[player])
	unbindKey(player,"space","down",pitchWirefence)
	unbindKey(player,"q","down",destroyAttachWireFence)
	setElementData(player,"setTent",false)
end
addEvent("destroyAttachWireFence",true)
addEventHandler("destroyAttachWireFence",getRootElement(),destroyAttachWireFence)

function pitchWirefence(player)
	unbindKey(player,"space","down",pitchWirefence)
	unbindKey(player,"q","down",destroyAttachWireFence)
	detachElements(attaches_Wirefence[player])
	destroyElement(attaches_Wirefence[player])
	
	local x,y,z = getElementPosition(player)
	local xr,yr,zr = getElementRotation(player)
	local px, py, pz = getElementPosition(player)
	local prot = getPedRotation(player)
	local offsetRot = math.rad(prot+90)
	local vx = px + 4 * math.cos(offsetRot)
	local vy = py + 4 * math.sin(offsetRot)
	local vz = pz + 4
	local vrot = prot+0
	local serial = getPlayerSerial(player)
	local name = getPlayerName(player)
	
	attaches_Wirefence[player] = createObject(1748,vx,vy,z-1.1,0,0,vrot)
	WirefenceCol = createColSphere(x,y,z,4)
	attachElements (WirefenceCol, attaches_Wirefence[player], 0, 0, 0 )
	setElementData(WirefenceCol,"parent",attaches_Wirefence[player])
	setElementData(attaches_Wirefence[player],"parent",WirefenceCol)
	setElementData(WirefenceCol,"wirefence",true)
	setElementData(WirefenceCol,"serial",serial)
	setElementData(WirefenceCol,"name",name)
	
	setElementData(player,"setTent",false)
	setElementData(player,"Drut kolczasty",getElementData(player,"Drut kolczasty")-1)
	setPedAnimation(player,"BOMBER","BOM_Plant",-1,false,false,false,false)

end

function removeWirefence (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Drut kolczasty")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	destroyElement(object)
	setElementData ( source, "currentCol", nil )
	destroyElement(WirefenceCol)
end
addEvent("removeWirefence",true)
addEventHandler("removeWirefence",getRootElement(),removeWirefence)

--Мишки з песком
attaches_Meshok10 = {}
function onMeshok10(player)
	local x,y,z = getElementPosition(player)
	attaches_Meshok10[player] = createObject(1749,x,y,z)
	attachElements(attaches_Meshok10[player],player,0,4,-1.1,0,0,0)
	bindKey(player,"space","down",pitchMeshok10,player)
	bindKey(player,"q","down",destroyAttachMeshok10,player)
end
addEvent("onMeshok10",true)
addEventHandler("onMeshok10",getRootElement(),onMeshok10)

function destroyAttachMeshok10(player)
	detachElements(attaches_Meshok10[player])
	destroyElement(attaches_Meshok10[player])
	unbindKey(player,"space","down",pitchMeshok10)
	unbindKey(player,"q","down",destroyAttachMeshok10)
	setElementData(player,"setTent",false)
end
addEvent("destroyAttachMeshok10",true)
addEventHandler("destroyAttachMeshok10",getRootElement(),destroyAttachMeshok10)

function pitchMeshok10(player)
	unbindKey(player,"space","down",pitchMeshok10)
	unbindKey(player,"q","down",destroyAttachMeshok10)
	detachElements(attaches_Meshok10[player])
	destroyElement(attaches_Meshok10[player])
	
	local x,y,z = getElementPosition(player)
	local xr,yr,zr = getElementRotation(player)
	local px, py, pz = getElementPosition(player)
	local prot = getPedRotation(player)
	local offsetRot = math.rad(prot+90)
	local vx = px + 4 * math.cos(offsetRot)
	local vy = py + 4 * math.sin(offsetRot)
	local vz = pz + 4
	local vrot = prot+0
	local serial = getPlayerSerial(player)
	local name = getPlayerName(player)
	
	attaches_Meshok10[player] = createObject(1749,vx,vy,z-1.1,0,0,vrot)
	Meshok10Col = createColSphere(x,y,z,4)
	attachElements (Meshok10Col, attaches_Meshok10[player], 0, 0, 0 )
	setElementData(Meshok10Col,"parent",attaches_Meshok10[player])
	setElementData(attaches_Meshok10[player],"parent",Meshok10Col)
	setElementData(Meshok10Col,"Meshok10",true)
	setElementData(Meshok10Col,"serial",serial)
	setElementData(Meshok10Col,"name",name)
	
	setElementData(player,"setTent",false)
	setElementData(player,"Piasek",getElementData(player,"Piasek")-10)
	setElementData(player,"Worek",getElementData(player,"Worek")-10)
	setElementData(player,"Plan - worki z piaskiem",getElementData(player,"Plan - worki z piaskiem")-1)
	setPedAnimation(player,"BOMBER","BOM_Plant",-1,false,false,false,false)
end

function removeMeshok10 (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Worek")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	destroyElement(object)
	setElementData ( source, "currentCol", nil )
	destroyElement(Meshok10Col)
end
addEvent("removeMeshok10",true)
addEventHandler("removeMeshok10",getRootElement(),removeMeshok10)
--Блок
attaches_Meshok = {}
function onMeshok(player)
	local x,y,z = getElementPosition(player)
	attaches_Meshok[player] = createObject(1747,x,y,z)
	attachElements(attaches_Meshok[player],player,0,4,0,0,0,0)
	bindKey(player,"space","down",pitchMeshok,player)
	bindKey(player,"q","down",destroyAttachMeshok,player)
end
addEvent("onMeshok",true)
addEventHandler("onMeshok",getRootElement(),onMeshok)

function destroyAttachMeshok(player)
	detachElements(attaches_Meshok[player])
	destroyElement(attaches_Meshok[player])
	unbindKey(player,"space","down",pitchMeshok)
	unbindKey(player,"q","down",destroyAttachMeshok)
	setElementData(player,"setTent",false)
end
addEvent("destroyAttachMeshok",true)
addEventHandler("destroyAttachMeshok",getRootElement(),destroyAttachMeshok)

function pitchMeshok(player)
	unbindKey(player,"space","down",pitchMeshok)
	unbindKey(player,"q","down",destroyAttachMeshok)
	detachElements(attaches_Meshok[player])
	destroyElement(attaches_Meshok[player])
	
	local x,y,z = getElementPosition(player)
	local xr,yr,zr = getElementRotation(player)
	local px, py, pz = getElementPosition(player)
	local prot = getPedRotation(player)
	local offsetRot = math.rad(prot+90)
	local vx = px + 4 * math.cos(offsetRot)
	local vy = py + 4 * math.sin(offsetRot)
	local vz = pz + 4
	local vrot = prot+0
	local serial = getPlayerSerial(player)
	local name = getPlayerName(player)
	
	attaches_Meshok[player] = createObject(1747,vx,vy,z,0,0,vrot)
	MeshokCol = createColSphere(x,y,z,4)
	attachElements (MeshokCol, attaches_Meshok[player], 0, 0, 0 )
	setElementData(MeshokCol,"parent",attaches_Meshok[player])
	setElementData(attaches_Meshok[player],"parent",MeshokCol)
	setElementData(MeshokCol,"Meshok",true)
	setElementData(MeshokCol,"serial",serial)
	setElementData(MeshokCol,"name",name)
	
	setElementData(player,"setTent",false)
	setElementData(player,"Piasek",getElementData(player,"Piasek")-20)
	setElementData(player,"Worek",getElementData(player,"Worek")-6)
	setElementData(player,"Drut",getElementData(player,"Drut")-1)
	setElementData(player,"Plan - blok z piasku",getElementData(player,"Plan - blok z piasku")-1)
	setPedAnimation(player,"BOMBER","BOM_Plant",-1,false,false,false,false)
end

function removeMeshok (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Worek")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	destroyElement(object)
	setElementData ( source, "currentCol", nil )
	destroyElement(MeshokCol)
end
addEvent("removeMeshok",true)
addEventHandler("removeMeshok",getRootElement(),removeMeshok)

--Покришки
attaches_Pokr = {}
function onPokr(player)
	local x,y,z = getElementPosition(player)
	attaches_Pokr[player] = createObject(2032,x,y,z)
	attachElements(attaches_Pokr[player],player,0,4,-0.5,0,0,90)
	bindKey(player,"space","down",pitchPokr,player)
	bindKey(player,"q","down",destroyAttachPokr,player)
end
addEvent("onPokr",true)
addEventHandler("onPokr",getRootElement(),onPokr)

function destroyAttachPokr(player)
	detachElements(attaches_Pokr[player])
	destroyElement(attaches_Pokr[player])
	unbindKey(player,"space","down",pitchPokr)
	unbindKey(player,"q","down",destroyAttachPokr)
	setElementData(player,"setTent",false)
end
addEvent("destroyAttachPokr",true)
addEventHandler("destroyAttachPokr",getRootElement(),destroyAttachPokr)

function pitchPokr(player)
	unbindKey(player,"space","down",pitchPokr)
	unbindKey(player,"q","down",destroyAttachPokr)
	detachElements(attaches_Pokr[player])
	destroyElement(attaches_Pokr[player])
	
	local x,y,z = getElementPosition(player)
	local xr,yr,zr = getElementRotation(player)
	local px, py, pz = getElementPosition(player)
	local prot = getPedRotation(player)
	local offsetRot = math.rad(prot+90)
	local vx = px + 4 * math.cos(offsetRot)
	local vy = py + 4 * math.sin(offsetRot)
	local vz = pz + 4
	local vrot = prot+90
	local serial = getPlayerSerial(player)
	local name = getPlayerName(player)
	
	attaches_Pokr[player] = createObject(2032,vx,vy,z-0.5,0,0,vrot)
	PokrCol = createColSphere(x,y,z,4)
	attachElements (PokrCol, attaches_Pokr[player], 0, 0, 0 )
	setElementData(PokrCol,"parent",attaches_Pokr[player])
	setElementData(attaches_Pokr[player],"parent",PokrCol)
	setElementData(PokrCol,"Pokr",true)
	setElementData(PokrCol,"serial",serial)
	setElementData(PokrCol,"name",name)
	
	setElementData(player,"setTent",false)
	setElementData(player,"Opona",getElementData(player,"Opona")-10)
	setElementData(player,"Plan - opony",getElementData(player,"Plan - opony")-1)
	setPedAnimation(player,"BOMBER","BOM_Plant",-1,false,false,false,false)
end

function removePokr (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Opona")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	destroyElement(object)
	setElementData ( source, "currentCol", nil )
	destroyElement(PokrCol)
end
addEvent("removePokr",true)
addEventHandler("removePokr",getRootElement(),removePokr)

--Еж
attaches_Esh = {}
function onEsh(player)
	local x,y,z = getElementPosition(player)
	attaches_Esh[player] = createObject(14546,x,y,z)
	attachElements(attaches_Esh[player],player,0,4,-1,0,0,90)
	bindKey(player,"space","down",pitchEsh,player)
	bindKey(player,"q","down",destroyAttachEsh,player)
end
addEvent("onEsh",true)
addEventHandler("onEsh",getRootElement(),onEsh)

function destroyAttachEsh(player)
	detachElements(attaches_Esh[player])
	destroyElement(attaches_Esh[player])
	unbindKey(player,"space","down",pitchEsh)
	unbindKey(player,"q","down",destroyAttachEsh)
	setElementData(player,"setTent",false)
end
addEvent("destroyAttachEsh",true)
addEventHandler("destroyAttachEsh",getRootElement(),destroyAttachEsh)

function pitchEsh(player)
	unbindKey(player,"space","down",pitchEsh)
	unbindKey(player,"q","down",destroyAttachEsh)
	detachElements(attaches_Esh[player])
	destroyElement(attaches_Esh[player])
	
	local x,y,z = getElementPosition(player)
	local xr,yr,zr = getElementRotation(player)
	local px, py, pz = getElementPosition(player)
	local prot = getPedRotation(player)
	local offsetRot = math.rad(prot+90)
	local vx = px + 4 * math.cos(offsetRot)
	local vy = py + 4 * math.sin(offsetRot)
	local vz = pz + 4
	local vrot = prot+90
	local serial = getPlayerSerial(player)
	local name = getPlayerName(player)
	
	attaches_Esh[player] = createObject(14546,vx,vy,z-1,0,0,vrot)
	EshCol = createColSphere(x,y,z,4)
	attachElements (EshCol, attaches_Esh[player], 0, 0, 0 )
	setElementData(EshCol,"parent",attaches_Esh[player])
	setElementData(attaches_Esh[player],"parent",EshCol)
	setElementData(EshCol,"Esh",true)
	setElementData(EshCol,"serial",serial)
	setElementData(EshCol,"name",name)
	
	setElementData(player,"setTent",false)
	setElementData(player,"Metal",getElementData(player,"Metal")-4)
	setElementData(player,"Plan - przeciwpancerny jeż",getElementData(player,"Plan - przeciwpancerny jeż")-1)
	setPedAnimation(player,"BOMBER","BOM_Plant",-1,false,false,false,false)
end

function removeEsh (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Metal")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	destroyElement(object)
	setElementData ( source, "currentCol", nil )
	destroyElement(EshCol)
end
addEvent("removeEsh",true)
addEventHandler("removeEsh",getRootElement(),removeEsh)

--Еж10
attaches_Esh10 = {}
function onEsh10(player)
	local x,y,z = getElementPosition(player)
	attaches_Esh10[player] = createObject(1709,x,y,z)
	attachElements(attaches_Esh10[player],player,0,4,-1,0,0,0)
	bindKey(player,"space","down",pitchEsh10,player)
	bindKey(player,"q","down",destroyAttachEsh10,player)
end
addEvent("onEsh10",true)
addEventHandler("onEsh10",getRootElement(),onEsh10)

function destroyAttachEsh10(player)
	detachElements(attaches_Esh10[player])
	destroyElement(attaches_Esh10[player])
	unbindKey(player,"space","down",pitchEsh10)
	unbindKey(player,"q","down",destroyAttachEsh10)
	setElementData(player,"setTent",false)
end
addEvent("destroyAttachEsh10",true)
addEventHandler("destroyAttachEsh10",getRootElement(),destroyAttachEsh10)

function pitchEsh10(player)
	unbindKey(player,"space","down",pitchEsh10)
	unbindKey(player,"q","down",destroyAttachEsh10)
	detachElements(attaches_Esh10[player])
	destroyElement(attaches_Esh10[player])
	
	local x,y,z = getElementPosition(player)
	local xr,yr,zr = getElementRotation(player)
	local px, py, pz = getElementPosition(player)
	local prot = getPedRotation(player)
	local offsetRot = math.rad(prot+90)
	local vx = px + 4 * math.cos(offsetRot)
	local vy = py + 4 * math.sin(offsetRot)
	local vz = pz + 4
	local vrot = prot+0
	local serial = getPlayerSerial(player)
	local name = getPlayerName(player)
	
	attaches_Esh10[player] = createObject(1709,vx,vy,z-1,0,0,vrot)
	Esh10Col = createColSphere(x,y,z,4)
	attachElements (Esh10Col, attaches_Esh10[player], 0, 0, 0 )
	setElementData(Esh10Col,"parent",attaches_Esh10[player])
	setElementData(attaches_Esh10[player],"parent",Esh10Col)
	setElementData(Esh10Col,"Esh10",true)
	setElementData(Esh10Col,"serial",serial)
	setElementData(Esh10Col,"name",name)
	
	setElementData(player,"setTent",false)
	setElementData(player,"Metal",getElementData(player,"Metal")-16)
	setElementData(player,"Plan - duży przeciwpancerny jeż",getElementData(player,"Plan - duży przeciwpancerny jeż")-1)
	setPedAnimation(player,"BOMBER","BOM_Plant",-1,false,false,false,false)
end

function removeEsh10 (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Metal")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	destroyElement(object)
	setElementData ( source, "currentCol", nil )
	destroyElement(Esh10Col)
end
addEvent("removeEsh10",true)
addEventHandler("removeEsh10",getRootElement(),removeEsh10)



function removeTent1 (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Namiot (wojskowy)")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
	setElementData ( source, "currentCol", nil )
end
addEvent("removeTent1",true)
addEventHandler("removeTent1",getRootElement(),removeTent1)

function removeTent2 (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Namiot (podróżny)")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
	setElementData ( source, "currentCol", nil )
end
addEvent("removeTent2",true)
addEventHandler("removeTent2",getRootElement(),removeTent2)

function removeTent3 (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Namiot (samochodowy)")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
	setElementData ( source, "currentCol", nil )
end
addEvent("removeTent3",true)
addEventHandler("removeTent3",getRootElement(),removeTent3)

function addPlayerCookMeat ()
	local playersource = source
	setPedAnimation (playersource,"BOMBER","BOM_Plant",-1,false,false,false,false)
	local meat = getElementData(playersource,"Grilowane mięso")
	setTimer(function()
			setElementData(playersource,"Grilowane mięso",0)
			setElementData(playersource,"Surowe mięso",getElementData(playersource,"Surowe mięso")+meat)
			triggerClientEvent (playersource, "displayClientInfo", playersource,"Костёр","Вы пожарили "..meat.." сырого мяса.",22,255,0)
	end,5000,1)
end
addEvent("addPlayerCookMeat",true)
addEventHandler("addPlayerCookMeat",getRootElement(),addPlayerCookMeat)
--Система костра
addEvent("onPlayerMakeAFire",true)
addEventHandler("onPlayerMakeAFire",getRootElement(),function(itemName)
	local source = source
	if isPedInVehicle(source) then return end
	if isElementInWater(source) then return end
	setElementData(source,"Drewno",getElementData(source,"Drewno")-1)
	local xr,yr,_ = getElementRotation(source)
	px, py, pz = getElementPosition(source)
	prot = getPedRotation(source)
	local offsetRot = math.rad(prot+90)
	local vx = px+1*math.cos(offsetRot)
	local vy = py+1*math.sin(offsetRot)
	local vz = pz+2
	local vrot = prot+90
	local wood = createObject(2214,vx,vy,pz-0.87,xr,yr,vrot)
	setObjectScale(wood,2.9)
	setElementFrozen(wood,true)
	local fireCol = createColSphere(vx,vy,pz-0.75,2.5)
	fire = createObject(3525,vx,vy,pz-0.8,xr,yr,vrot)
	setObjectScale(fire,0)
	attachElements ( fireCol, wood, 0, 0, 0 )
	setElementData(fireCol,"parent",wood)
	setElementData(fireCol,"fireplace",true)
	setPedWeaponSlot(source, 0)
	fireX,fireY,fireZ = getElementPosition(fire)
	triggerClientEvent(source,"fireplaceSound",source,fireX,fireY,fireZ)
	triggerClientEvent(source,"refreshInventoryManual",source)
	setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
	setTimer(function()
		destroyElement(fireCol)
		destroyElement(wood)
		destroyElement(fire)
		triggerClientEvent(source,"fireplaceStop",source)
	end,720000,1)
end)



function onPlayerPlaceRoadflare (itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	local x,y,z = getElementPosition(source)
	local object = createObject(2216,x,y,z-0.6)
	setTimer(destroyElement,300000,1,object)
	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerPlaceRoadflare",true)
addEventHandler("onPlayerPlaceRoadflare",getRootElement(),onPlayerPlaceRoadflare)

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

local chatRadius = 15
local chatEadioRadius = 250
 
function sendMessageToNearbyPlayers( message, messageType )
	cancelEvent()
    if (messageType == 0) then
		local posX, posY, posZ = getElementPosition( source )
        local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
        for index, nearbyPlayer in ipairs( nearbyPlayers ) do
            outputChatBox(""..string.gsub((getPlayerName(source).." : "..message), '#%x%x%x%x%x%x', ''),nearbyPlayer, 211,211,211,true ) -- Color changed from 60,200,40 to 211,211,211
        end
	end	
end
addEventHandler( "onPlayerChat", getRootElement(), sendMessageToNearbyPlayers )


 
function blockChatMessage(m,mt)
    if mt == 1 then
		cancelEvent()
	end
end
addEventHandler( "onPlayerChat", getRootElement(), blockChatMessage )

function preventCommandSpam(commandName)
	if commandName == "login" or commandName == "logout" or commandName == "register" then
		cancelEvent()
	end
end
addEventHandler("onPlayerCommand", root, preventCommandSpam)

function makeRadioStayOff()
    setRadioChannel(0)
    cancelEvent()
end
addEventHandler("onClientPlayerVehicleEnter",getRootElement(),makeRadioStayOff)
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),makeRadioStayOff)

addEventHandler("onPlayerLogin", getRootElement(),function()
	triggerClientEvent ( "onRollMessageStart", getRootElement(), getPlayerName(source).." zalogował się!",255,255,255, "join")
end)

function resourceStart ()
	setGameType ("DayZ-POLSKA")
end
addEventHandler ( "onResourceStart", getResourceRootElement ( ), resourceStart )


skinTable = {
{"Strój - szary",100},
{"Strój - szary №2",101},
{"Strój - brązowy",102},
{"Strój górski - zielony",103},
{"Strój górski - PautRev",104},
{"Dresy - czerwone",105},
{"Dresy - czarne",106},
{"Dresy - niebieskie",107},
{"Dresy - czarne",108},
{"Kombinezon medyczny - niebieski",109},
{"Dresy - zielone",110},
{"Strój wojskowy №1",111},
{"Strój wojskowy №2",112},
{"Strój wojskowy №3",113},
{"Strój wojskowy №4",114},
{"Dresy - brązowe",115},
{"Strój wojskowy №5",116},
{"Strój wojskowy №6",117},
{"Костюм спортивный (Синий)",118},
{"Strój - czarny",120},
{"Strój TTsKO",121},
{"Strój górski - brązowy",122},
{"Strój górski - lato",123},
{"Kombinezon medyczny - czerwony",124},
{"Strój - orzeł",125},
}

function getSkinIDFromName(name)
	for i,skin in ipairs(skinTable) do
		if name == skin[1] then
			return skin[2]
		end
	end
end

function getSkinNameFromID(id)
	for i,skin in ipairs(skinTable) do
		if id == skin[2] then
			return skin[1]
		end
	end
end

function addPlayerSkin (skin)
	local current = getElementData(source,"skin")
	local name = getSkinNameFromID(current)
	setElementData(source,name,getElementData(source,name)+1)
	setElementData(source,skin,getElementData(source,skin)-1)
	local id = getSkinIDFromName(skin)
	setElementData(source,"skin",id)
	setElementModel(source,id)
	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeSkin",true)
addEventHandler("onPlayerChangeSkin",getRootElement(),addPlayerSkin)

local details = {
	{"Tire_inVehicle"},
	{"Engine_inVehicle"},
	{"Parts_inVehicle"},
}


function checkVehicleMovable(veh)
	if isElement(veh) then
		local model = getElementModel(veh)
		if model then
			local tires,engine,parts = getVehicleAddonInfos (model)
			if((getElementData(col,"Tire_inVehicle") or 0) < tonumber(tires)) then
				setVehicleEngineState (veh,false)
				return	
			end
			if((getElementData(col,"Engine_inVehicle") or 0) < tonumber(engine)) then
				setVehicleEngineState(veh,false)
				return
			end
			if((getElementData(col,"Parts_inVehicle") or 0) < tonumber(parts)) then 
			   setVehicleEngineState(veh,false) 
			   return 
			end
		end
	end
end

--Pingkick

function kickPlayerOnHighPing ()
	outputChatBox (getPlayerName(source).."został wyrzucony za wysoki ping!",getRootElement(),27, 89, 224,true)	
	kickPlayer(source,"wysoki ping")
end
addEvent("kickPlayerOnHighPing",true)
addEventHandler("kickPlayerOnHighPing", getRootElement(),kickPlayerOnHighPing)

local handsUp = false
local siting = false
local lying = false
function funcBindHandsup ( player, key, keyState )
	if handsUp then
		setPedAnimation (player,false)
		handsUp = false
	else
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"BEACH","ParkSit_M_loop",nil,true,false,false,false)
		handsUp = true
	end	
end

function funcBindSit ( player, key, keyState )
	if siting then
		setPedAnimation (player,false)
		siting = false
	else
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"SHOP","SHP_Rob_HandsUp",nil,true,true,false,false)
		siting = true
	end	
end

function funcBindLie ( player, key, keyState )
	if lying then
		setPedAnimation (player,false)
		lying = false
	else
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"WUZI","CS_Dead_Guy",nil,false,false,false,true)
		lying = true
		function setVisibility()
			value = 0
		end
	end
end
 
function bindTheKeys ()
  bindKey(source,",","down",funcBindHandsup)
  bindKey(source,".","down",funcBindSit)
  bindKey(source,"l","down",funcBindLie)
end
addEventHandler("onPlayerLogin", getRootElement(), bindTheKeys)
--Мина
local traps = {}

createMine = function(x, y, z) 
			setPedAnimation (source,"BOMBER","BOM_Plant", -1, false, false, false, false)
            local trap = createObject ( 1953, x, y, z-0.1, 0, 0, math.random(0,360) ) 
            table.insert ( traps, trap ) 
            local shape = createColSphere ( x, y, z,2 ) 
            local shapeFar = createColSphere ( x, y, z, 2+0.5 ) 
            setElementData ( trap, "mine", true ) 
            setElementData ( trap, "parent", shape ) 
            setElementData ( shape, "mine", true ) 
            setElementData ( shape, "objectLink", trap ) 
            setElementData ( shape, "farShapeLink", shapeFar ) 
            setElementData ( shapeFar, "nearShapeLink", shape ) 
            setElementData ( shapeFar, "objectLink", trap ) 
            setElementData ( shapeFar, "mineFar", true ) 
end 
                 
addEvent("createMineC", true) 
addEventHandler("createMineC", getRootElement(), createMine) 
                 
function boomMineFireS (mine)
	if isElement ( mine ) then
		local parent = getElementData ( mine, "parent" )
		if isElement ( parent ) then 
			setElementData ( parent, "boom", true)
			local x,y,z = getElementPosition ( mine )
			createExplosion ( x,y,z, 0 )
			local farShapeLink = getElementData ( parent, "farShapeLink" ) 
			if isElement ( farShapeLink ) then 
				destroyElement ( farShapeLink ) 
			end 
			destroyElement ( mine )  
			destroyElement ( parent )
		end
	end
end				 

addEvent("boomMineFire", true) 
addEventHandler("boomMineFire", getRootElement(), boomMineFireS) 
                 
function checkTrapPlace( theElement, matchingDimension ) 
            if ( getElementType ( theElement ) == 'player' ) and matchingDimension then 
                if getElementData ( source, "mine" ) then         
                    if not getElementData ( source, "boom" ) and not getPedOccupiedVehicle ( theElement ) then 
                        local object = getElementData ( source, "objectLink" ) 
                        if isElement ( object ) then 
							if not getElementData ( source, "boom" ) then
								setElementData ( source, "boom", true)
								local x,y,z = getElementPosition ( source )
								createExplosion ( x,y,z, 0 )
								local nearShapeLink = getElementData ( source, "farShapeLink" ) 
								local objectLink = getElementData ( source, "objectLink" ) 
								if isElement ( nearShapeLink ) then 
									destroyElement ( nearShapeLink ) 
								end 
								if isElement ( objectLink ) then 
									destroyElement ( objectLink )  
								end 
								destroyElement ( source )
							end
                        end 
                    end 
                end 
            elseif ( getElementType ( theElement ) == 'vehicle' ) and matchingDimension then
				if getElementData ( source, "mine" ) then       
					setElementData ( source, "boom", true)
					local x,y,z = getElementPosition ( source )
					createExplosion ( x,y,z, 0 )
					local nearShapeLink = getElementData ( source, "farShapeLink" ) 
					local objectLink = getElementData ( source, "objectLink" ) 
					if isElement ( nearShapeLink ) then 
						destroyElement ( nearShapeLink ) 
					end 
					if isElement ( objectLink ) then 
						destroyElement ( objectLink )  
					end 
					destroyElement ( source )
				end
			end
end 
addEventHandler("onColShapeHit",getRootElement(),checkTrapPlace) 
--Капкан      
 createBearTrap = function(x, y, z)
            local trap = createObject ( 1762, x, y, z, 0, 0, math.random(0,360)) 
			setElementCollisionsEnabled (trap, false)
            table.insert ( traps, trap ) 
            local shape = createColSphere ( x, y, z, 1 ) 
            local shapeFar = createColSphere ( x, y, z, 2 ) 
            setElementData ( shape, "trap", true ) 
            setElementData ( shape, "objectLink", trap ) 
            setElementData ( shape, "farShapeLink", shapeFar ) 
 end 

 addEvent("createBearTrapC", true) 
 addEventHandler("createBearTrapC", getRootElement(), createBearTrap) 

 function checkTrapPlace( theElement, matchingDimension ) 
            if ( getElementType ( theElement ) == 'player' ) and matchingDimension then 
                if getElementData ( source, "trap" ) then         
                    if not getElementData ( source, "closed" ) and not getPedOccupiedVehicle ( theElement ) then 
                        local object = getElementData ( source, "objectLink" ) 
                        if isElement ( object ) then 
                            setElementData ( source, "closed", true ) 
							setElementData(theElement, "brokenbone", true)
							setElementData(theElement, "bleeding", getElementData(theElement, "bleeding") + 12)
							setElementData(theElement, "blood", getElementData(theElement, "blood") - 3412)
							setElementData(theElement, "pain", true)
                            triggerClientEvent ( theElement, "playTrapSound", source ) 
							triggerClientEvent ( theElement, "playTrapSound_voul", source ) 
							setElementModel ( object, 1759 ) 
							setTimer(function()
							destroyElement(object)
							end,720000,1)
                        end 
                    end 
                end 
            end 
 end 
 addEventHandler("onColShapeHit",getRootElement(),checkTrapPlace) 
 --


function makeRadioStayOff()
    setRadioChannel(0)
    cancelEvent()
end
addEventHandler("onClientPlayerVehicleEnter",getRootElement(),makeRadioStayOff)
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),makeRadioStayOff)


function kickPlayerOnLowFPS ()
	outputChatBox (getPlayerName(source).."został wyrzucony za zbyt niski FPS!",getRootElement(),27, 89, 224,true)	
	kickPlayer(source,"niski FPS")
end
addEvent("kickPlayerOnLowFPS",true)
addEventHandler("kickPlayerOnLowFPS", getRootElement(),kickPlayerOnLowFPS)

local messages = {
	{"Dotknij 2 razy na przedmiot w ekwipunku aby go użyć"},
	{"W razie pytań zapraszamy na forum www.DayZ-POLSKA.tk"},
	{"Zbugowałeś się?  Jesteś w obiekcie? Wpisz /unbug"},
	{"Nasz Facebook: fb.com/dayzpolskamta"},
	{"Nasz instagram: instagram.com/dayz_polska.tk"},
	{"Jeśli jesteś zmęczony a nie masz namiotu to użyj środków przeciwbólowych"},
	{"Kompas - B"},
	{"Aby założyć mniejszy plecak musisz zmniejszyć swój łup w EQ"},
	{"Na serwerze dostępny jest sklep i punk regeneracji w zielonej strefie"},
	{"Chat globalny - M"},
}

function infoMessage()
	outputChatBox("#ff0000[POMOC]:#ffffff "..messages[math.random(1,#messages)][1].."",getRootElement(),255,255,255,true)
end
setTimer(infoMessage,10*60*1000,0)

function setPedComaAnimation(state)
	if state then
		setElementFrozen(source,true)
		setPedAnimation(source,"ped","FLOOR_hit",-1,false,false,false)
	else
		setPedAnimation(source,false)
		setElementFrozen (source,false)
	end
end
addEvent("setPedComaAnimation",true)
addEventHandler("setPedComaAnimation",getRootElement(),setPedComaAnimation)




function kill_command (source)
   setElementData ( source, "blood", -10 )
   triggerEvent ( "kilLDayZPlayer", source, attacker, false, weapon )
end
addCommandHandler ( "kill", kill_command )

setWeaponProperty ("ak-47","poor","weapon_range",250)
setWeaponProperty ("ak-47","std","weapon_range",250)
setWeaponProperty ("ak-47","pro","weapon_range",250)
setWeaponProperty ("ak-47","poor","target_range",250)
setWeaponProperty ("ak-47","std","target_range",250)
setWeaponProperty ("ak-47","pro","target_range",250)
setWeaponProperty ("m4","poor","weapon_range",250)
setWeaponProperty ("m4","std","weapon_range",250)
setWeaponProperty ("m4","pro","weapon_range",250)
setWeaponProperty ("m4","poor","target_range",250)
setWeaponProperty ("m4","std","target_range",250)
setWeaponProperty ("m4","pro","target_range",250)
setWeaponProperty ("ak-47","poor","accuracy",0.3000)
setWeaponProperty ("ak-47","std","accuracy",0.3000)
setWeaponProperty ("ak-47","pro","accuracy",0.3000)
setWeaponProperty ("m4","poor","accuracy",0.4000)
setWeaponProperty ("m4","std","accuracy",0.4000)
setWeaponProperty ("m4","pro","accuracy",0.4000)
setWeaponProperty ("rifle","poor","weapon_range",270)
setWeaponProperty ("rifle","std","weapon_range",270)
setWeaponProperty ("rifle","pro","weapon_range",270)
setWeaponProperty ("rifle","poor","target_range",270)
setWeaponProperty ("rifle","std","target_range",270)
setWeaponProperty ("rifle","pro","target_range",270)
setWeaponProperty ("mp5","poor","weapon_range",120)
setWeaponProperty ("mp5","std","weapon_range",120)
setWeaponProperty ("mp5","pro","weapon_range",120)
setWeaponProperty ("mp5","poor","accuracy",0.6000)
setWeaponProperty ("mp5","std","accuracy",0.6000)
setWeaponProperty ("mp5","pro","accuracy",0.6000)
setWeaponProperty ("mp5","poor","target_range",120)
setWeaponProperty ("mp5","std","target_range",120)
setWeaponProperty ("mp5","pro","target_range",120)
setWeaponProperty ("uzi","poor","weapon_range",90)
setWeaponProperty ("uzi","std","weapon_range",90)
setWeaponProperty ("uzi","pro","weapon_range",90)
setWeaponProperty ("uzi","poor","accuracy",0.6000)
setWeaponProperty ("uzi","std","accuracy",0.6000)
setWeaponProperty ("uzi","pro","accuracy",0.6000)
setWeaponProperty ("uzi","poor","target_range",90)
setWeaponProperty ("uzi","std","target_range",90)
setWeaponProperty ("uzi","pro","target_range",90)
setWeaponProperty ("silenced","poor","weapon_range",80)
setWeaponProperty ("silenced","std","weapon_range",80)
setWeaponProperty ("silenced","pro","weapon_range",80)
setWeaponProperty ("silenced","poor","target_range",80)
setWeaponProperty ("silenced","std","target_range",80)
setWeaponProperty ("silenced","pro","target_range",80)
setWeaponProperty ("silenced","poor","accuracy",0.9900)
setWeaponProperty ("silenced","std","accuracy",0.9900)
setWeaponProperty ("silenced","pro","accuracy",0.9900)
setWeaponProperty ("deagle","poor","weapon_range",80)
setWeaponProperty ("deagle","std","weapon_range",80)
setWeaponProperty ("deagle","pro","weapon_range",80)
setWeaponProperty ("deagle","poor","target_range",80)
setWeaponProperty ("deagle","std","target_range",80)
setWeaponProperty ("deagle","pro","target_range",80)
setWeaponProperty ("deagle","poor","accuracy",0.9000)
setWeaponProperty ("deagle","std","accuracy",0.9000)
setWeaponProperty ("deagle","pro","accuracy",0.9000)

setWeaponProperty(31, "poor", "maximum_clip_ammo", 40)
setWeaponProperty(30, "poor", "maximum_clip_ammo", 30)
setWeaponProperty(25, "poor", "maximum_clip_ammo", 2)
setWeaponProperty(29, "poor", "maximum_clip_ammo", 30)
setWeaponProperty(28, "poor", "maximum_clip_ammo", 30)
setWeaponProperty(32, "poor", "maximum_clip_ammo", 25)
setWeaponProperty(22, "poor", "maximum_clip_ammo", 7)
setWeaponProperty(23, "poor", "maximum_clip_ammo", 15)
setWeaponProperty(24, "poor", "maximum_clip_ammo", 6)

setWeaponProperty(31, "std", "maximum_clip_ammo", 40)
setWeaponProperty(30, "std", "maximum_clip_ammo", 30)
setWeaponProperty(25, "std", "maximum_clip_ammo", 2)
setWeaponProperty(29, "std", "maximum_clip_ammo", 30)
setWeaponProperty(28, "std", "maximum_clip_ammo", 30)
setWeaponProperty(32, "std", "maximum_clip_ammo", 25)
setWeaponProperty(22, "std", "maximum_clip_ammo", 7)
setWeaponProperty(23, "std", "maximum_clip_ammo", 15)
setWeaponProperty(24, "std", "maximum_clip_ammo", 6)

setWeaponProperty(31, "pro", "maximum_clip_ammo", 40)
setWeaponProperty(30, "pro", "maximum_clip_ammo", 30)
setWeaponProperty(25, "pro", "maximum_clip_ammo", 2)
setWeaponProperty(29, "pro", "maximum_clip_ammo", 30)
setWeaponProperty(28, "pro", "maximum_clip_ammo", 30)
setWeaponProperty(32, "pro", "maximum_clip_ammo", 25)
setWeaponProperty(22, "pro", "maximum_clip_ammo", 7)
setWeaponProperty(23, "pro", "maximum_clip_ammo", 15)
setWeaponProperty(24, "pro", "maximum_clip_ammo", 6)



