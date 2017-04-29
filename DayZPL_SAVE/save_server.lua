addEventHandler("onResourceStart", resourceRoot,
function()
	database = dbConnect( "sqlite", "database.db" )
	local name = getServerName ( ) --█ UNION DayZ RUS/UA █ vk.com/mta_union
	--if string.find (name, "UNION" ) then
		if auto_load == true then
			loadDataBase()
		end	
		--return true 
	--end
	--cancelEvent()
end)

local FanboxDayZ = getResourceFromName "DayZPL_DAYZ"

function onStart()
	if getResourceState(FanboxDayZ) == "running" then
	outputChatBox(" ",player,255,255,255,true)
	outputChatBox("#FF0000DayZ-POLSKA #FFFFFFSerwer włączony...",player,255,255,255,true)
	saveDataBased()
	end
end
setTimer(onStart,backTime,0)


function loadDataBase()
	local qh = dbQuery(database, "SELECT * FROM vehicles")
	if qh then
		local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
		if num_affected_rows > 0 then
			for result, row in pairs ( result ) do
				createNewVehicle(row)
			end
		end
	end
	local qh = dbQuery(database, "SELECT * FROM tents")
	if qh then
		local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
		if num_affected_rows > 0 then
			for result, row in pairs ( result ) do
				createNewTent(row,"tent")
			end
		end
	end
end

function saveDataBased()
	outputChatBox(" ",getRootElement(),255,255,255,true)
	outputChatBox("#FF0000KOPIA:#FFFFFF Trwa robienie kopii zapasowej serwera...",getRootElement(),255,255,255,true)
	destroyDataBase("tents")
	destroyDataBase("vehicles")
	for i,tent in ipairs(getElementsByType("colshape")) do 
		if getElementData(tent,"tent") then
			local x,y,z = getElementPosition(tent)
			local col = getElementData(tent,"parent")
			local rotx,roty,rot = getElementRotation(getElementData(tent,"parent"))
			local dataT = {}
			local noDeleteTent = false
			for i,v in ipairs(serverData["items"]) do
				local data = getElementData(tent,v[1]) or 0
				if data > 0 then 
					noDeleteTent = true
				end
				table.insert(dataT,{v[1],data})	
			end
			if noDeleteTent == true then
				local result = dbQuery( database, "INSERT INTO  `tents` VALUES ('"..x.."', '"..y.."', '"..z.."', '"..rot.."','"..toJSON(dataT).."');")
				dbFree (result)
			else
				destroyElement(tent)
				destroyElement(col)
			end
		end
	end
	for index,element in ipairs(getElementsByType("vehicle")) do 
		local x,y,z = getElementPosition(element)
		local col = getElementData(element,"parent")
		local rotx,roty,rot = getElementRotation(element)
		local model = getElementModel(element)
		local health = getElementHealth(element)
		local dataT = {}
		for i,v in ipairs(serverData["items"]) do
			if col ~= false then
				local data = getElementData(col,v[1]) or 0
				table.insert(dataT,{v[1],data})
			end	
		end
		for i,v in ipairs(serverData["vehicle"]) do
			if col ~= false then
				local data = getElementData(col,v[1]) or 0
				table.insert(dataT,{v[1],data})
			end	
		end
		local result = dbQuery( database, "INSERT INTO  `vehicles` VALUES ('"..model.."','"..x.."', '"..y.."', '"..z.."', '"..rot.."','"..health.."', '"..toJSON(dataT).."');")
		dbFree (result)
	end	
	outputChatBox("#FF0000KOPIA:#FFFFFF Zakończono robienie kopii zapasowej.",getRootElement(),255,255,255,true)
	setTimer ( function()
	baseCopy()
	end, 10000, 1 )
end


function autoStopSave()
	if auto_save == true then
		saveDataBased()
	end
end	
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()),autoStopSave)

addCommandHandler("save",function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup(adm_group)) then 
		saveDataBased()
	end	
end)

addCommandHandler("load",function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup(adm_group)) then 
		if auto_load == true then 
			outputChatBox("Wczytywanie jest niemożliwe! Automat jest włączony!",player,255,0,0,true)
			return true
		end	
		loadDataBase()
		outputChatBox("#00cc00Załadowane dane z bazy.",player,255,255,255,true)
	end	
end)

addCommandHandler("autoloadoff",function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup(adm_group)) then 
		if auto_load == true then 
			auto_load = false
			outputChatBox("Wyłączyłeś tymczasowo automatyczne wczytywanie!",player)
		else
			auto_load = true
			outputChatBox("Włączyłeś automatyczne wczytywanie!",player)
		end
	end	
end)

addCommandHandler("autolsaveoff",function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup(adm_group)) then 
		if auto_save == true then 
			auto_save = false
			outputChatBox("Wyłączyłeś tymczasowo automatyczne zapisywanie!",player)
		else
			auto_save = true
			outputChatBox("Włączyłeś automatyczne zapisywanie!",player)
		end
	end	
end)

function destroyDataBase(base)
	if base == "vehicles" then
		local qh = dbQuery(database, "DELETE FROM vehicles")
		local result = dbPoll( qh, -1 )
	elseif base == "tents" then
		local qh = dbQuery(database, "DELETE FROM tents")
		local result = dbPoll( qh, -1 )
	end
end

function createNewVehicle(row)
	local model = tonumber(row['model'])
	local data = fromJSON(row['data'])
	local x = tonumber(row['x'])
	local y = tonumber(row['y'])
	local z = tonumber(row['z'])
	local r = tonumber(row['r'])
	local health = tonumber(row['health'])
	veh = createVehicle(model,x,y,z+1,0,0,r)
	vehCol = createColSphere(x,y,z+1,3)
	attachElements(vehCol,veh,0,0,1.5)
	setElementData(vehCol,"parent",veh)
	setElementData(veh,"parent",vehCol)
	setElementData(vehCol,"vehicle",true)
	setElementData(vehCol,"ID",row)
	setElementHealth(veh,health)
	for i,v in pairs(data) do
		setElementData(vehCol,v[1],v[2])
	end
end

function createNewTent(row,class)
	local data = fromJSON(row['data'])
	local x = tonumber(row['x'])
	local y = tonumber(row['y'])
	local z = tonumber(row['z'])
	local r = tonumber(row['r'])
	if class == "tent" then
		tent = createObject(2220,x,y,z,0,0,r)
		tentCol = createColSphere(x,y,z,3.5)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent)
		setElementData(tent,"parent",tentCol)
		setElementData(tentCol,"tent",true)
		for i,v in pairs(data) do
			setElementData(tentCol,v[1],v[2])
		end
		if getElementData(tentCol,"MAX_Slots") == false or nil then
			setElementData(tentCol,"MAX_Slots",252)
		end
		if getElementData(tentCol,"MAX_Slots") == 60 then
			setElementModel(tent,2220)
		elseif getElementData(tentCol,"MAX_Slots") == 252 then
			setElementModel(tent,2218)
		elseif getElementData(tentCol,"MAX_Slots") == 168 then
			setElementModel(tent,2222)
		end	
	end
end

function destroyThisVehicle(ps, cmd) 
	if isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount ( ps ) ), aclGetGroup ( adm_group ) ) then 
		local theVehicle = getPedOccupiedVehicle(ps) 
		if (theVehicle) then 
			local col = getElementData(theVehicle, "parent") 
			destroyElement(col) 
			destroyElement(theVehicle) 
		else 
			outputChatBox("Musisz być w pojeździe.",ps,30,144,255,true)
		end 
	end 
end 
addCommandHandler("dtv", destroyThisVehicle)

function destroyVehiclePack(ps, cmd) 
	if isObjectInACLGroup ("user."..getAccountName ( getPlayerAccount (ps) ), aclGetGroup ( adm_group ) ) then 
		vehicles = getElementsByType("vehicle") 
		for i,v in ipairs(vehicles) do 
			local col = getElementData(v, "parent") 
			if isElement (col) then 
				destroyElement(col) 
			end
			destroyElement(v) 
		end
	end 
end 
addCommandHandler("dvp", destroyVehiclePack)

function baseCopy()
	local randomName = randomString(10)
	local time = getRealTime()
	local second = time.second
	local minute = time.minute
	local hour = time.hour
	local monthday = time.monthday
	local month = time.month
	local year = time.year
	local players = getPlayerCount()
	fileCopy("database.db","database_backup/"..monthday.."."..month + 1 ..".".. year + 1900 .."_"..hour.."."..minute.."."..second.."_"..randomName.."_"..players..".db")
end


function randomString(sym_num)
	symbols = {"A","a","B","b","C","c","D","d","I","i","J","j","K","k","L","l","M","m","N","n","O","o","P","p","Q","q","R","r","T","t","U","u","V","v","W","w","X","x","Y","y","Z","z"}
	local pass = ""
	for i = 1, sym_num do
		if math.random (1,2) == 1 then
			pass = pass..tostring(math.random(0,9))
		else
			pass = pass..symbols[math.random(1,#symbols)]
		end
	end
	return pass
end