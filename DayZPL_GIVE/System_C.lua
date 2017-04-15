local isVisible = false

addEventHandler("onClientResourceStart", getRootElement(), function()
    local screenWidth, screenHeight = guiGetScreenSize()
    local windowWidth, windowHeight = 620, 520
    local windowX, windowY = (screenWidth / 2) - (windowWidth / 2), (screenHeight / 2) - (windowHeight / 2)
	mainWnd = guiCreateWindow(windowX, windowY+100, windowWidth, windowHeight, "Fanboxser", false)

	PoweredByName = guiCreateLabel(535, 22, 127, 15, "Fanbox", false, mainWnd)
    guiLabelSetColor(PoweredByName, 255, 0, 0)		

	guiWindowSetMovable(mainWnd, false)
	guiWindowSetSizable(mainWnd, false)
	guiSetVisible(mainWnd, false)
	guiSetInputMode("no_binds_when_editing")
	
	--Tab Panel
	main_tabPanel = guiCreateTabPanel(9, 20, 601, 490, false, mainWnd)		
	--Player System
	main_tab_players 	= guiCreateTab("Статус", main_tabPanel)
	players_gridlist_players = guiCreateGridList(10, 10, 180, 446, false, main_tab_players)	
	guiGridListAddColumn(players_gridlist_players, "Игроки:", 0.9)
	--Player
	local Top_1 = guiCreateLabel(200, 5, 127, 15, "Игрок", false, main_tab_players)	
	guiSetFont(Top_1, "default-bold-small")
	guiLabelSetColor(Top_1, 255, 0, 0)
	-----------------------------------------------------------------------------------------------------
	players_label_targetPing = guiCreateLabel(200, 25, 127, 15, "Пинг", false, main_tab_players)
	guiCreateLabel(333, 24, 150, 15, "|", false, main_tab_players)			
	players_label_targetName = guiCreateLabel(200, 40, 127, 15, "Ник", false, main_tab_players)
	guiCreateLabel(333, 39, 150, 15, "|", false, main_tab_players)		
	players_label_targetIp = guiCreateLabel(200, 55, 127, 15, "IP", false, main_tab_players)	
	guiCreateLabel(333, 54, 150, 15, "|", false, main_tab_players)			
	players_label_targetSerial = guiCreateLabel(200, 70, 127, 15, "Сериал", false, main_tab_players)			
	guiCreateLabel(333, 69, 150, 15, "|", false, main_tab_players)			
	players_label_targetLogin = guiCreateLabel(200, 85, 127, 15, "Акаунт", false, main_tab_players)		
	guiCreateLabel(333, 84, 150, 15, "|", false, main_tab_players)			
	players_label_targetRights = guiCreateLabel(200, 100, 127, 15, "ХЗ", false, main_tab_players)	
	guiCreateLabel(333, 99, 150, 15, "|", false, main_tab_players)			
	guiCreateLabel(200, 105, 135, 15, "_____________________________________________", false, main_tab_players)
	--Gameplay
	local players_label_gameplayText = guiCreateLabel(200, 120, 164, 15, "Гемплей", false, main_tab_players)
	guiSetFont(players_label_gameplayText, "default-bold-small")
	guiLabelSetColor(players_label_gameplayText, 255, 0, 0)
	-----------------------------------------------------------------------------------------------------
	players_label_targetBlood = guiCreateLabel(200, 140, 164, 15, "Кровь", false, main_tab_players)
	guiCreateLabel(333, 139, 150, 15, "|", false, main_tab_players)	
	players_label_targetWeapon = guiCreateLabel(200, 155, 164, 15, "broń", false, main_tab_players)
	guiCreateLabel(333, 154, 150, 15, "|", false, main_tab_players)	
	players_label_targetBackpack = guiCreateLabel(200, 185, 164, 15, "Рюкзак", false, main_tab_players)
	guiCreateLabel(333, 184, 150, 15, "|", false, main_tab_players)	
	players_label_targetZone = guiCreateLabel(200, 200, 164, 15, "Зона", false, main_tab_players)
	guiCreateLabel(333, 199, 150, 15, "|", false, main_tab_players)	
	players_label_targetArea = guiCreateLabel(200, 215, 164, 15, "Регион", false, main_tab_players)
	guiCreateLabel(333, 214, 150, 15, "|", false, main_tab_players)		
	guiCreateLabel(200, 220, 135, 15, "_____________________________________________", false, main_tab_players)
	--Stats	
	players_label_statsText 		= guiCreateLabel(200, 235, 164, 15, "Статус", false, main_tab_players)
	guiSetFont(players_label_statsText, "default-bold-small")
	guiLabelSetColor(players_label_statsText, 255, 0, 0)
	-----------------------------------------------------------------------------------------------------
	players_label_murders = guiCreateLabel(200, 250, 164, 15, "INWENTARZ", false, main_tab_players)
	guiCreateLabel(333, 249, 150, 15, "|", false, main_tab_players)			
	players_label_bandits = guiCreateLabel(200, 265, 164, 15, "Pieniądze", false, main_tab_players)
	guiCreateLabel(333, 264, 150, 15, "|", false, main_tab_players)		
	players_label_headshots = guiCreateLabel(200, 280, 164, 15, "В голову", false, main_tab_players)
	guiCreateLabel(333, 279, 150, 15, "|", false, main_tab_players)
	players_label_zombieskilled = guiCreateLabel(200, 295, 164, 15, "Зомби", false, main_tab_players)
	guiCreateLabel(333, 294, 150, 15, "|", false, main_tab_players)
	players_label_temperature = guiCreateLabel(200, 310, 164, 15, "Температура", false, main_tab_players)
	guiCreateLabel(333, 309, 150, 15, "|", false, main_tab_players)
	players_label_humanity = guiCreateLabel(200, 325, 164, 15, "Человечность", false, main_tab_players)
	guiCreateLabel(333, 324, 150, 15, "|", false, main_tab_players)
	guiCreateLabel(200, 330, 135, 15, "_____________________________________________", false, main_tab_players)		
	--Vehicle
	players_label_statsText = guiCreateLabel(200, 345, 164, 15, "Машина", false, main_tab_players)
	guiSetFont(players_label_statsText, "default-bold-small")
	guiLabelSetColor(players_label_statsText, 255, 0, 0)	
	players_label_vehicle_name = guiCreateLabel(200, 360, 135, 20, "Машина", false, main_tab_players)
	guiCreateLabel(333, 359, 150, 15, "|", false, main_tab_players)	
	players_label_vehicle_health = guiCreateLabel(200, 375, 135, 20, "ХП Машини", false, main_tab_players)
	guiCreateLabel(333, 374, 150, 15, "|", false, main_tab_players)	
	guiCreateLabel(200, 380, 135, 15, "_____________________________________________", false, main_tab_players)
	--Vehicle Seting		
	players_button_fixVehicle = guiCreateButton(198, 400, 68, 25, "ФИКС", false, main_tab_players)
	guiSetFont(players_button_fixVehicle, "default-bold-small")	
	players_button_destroyVehicle = guiCreateButton(270, 400, 68, 25, "Удалити", false, main_tab_players)
	guiSetFont(players_button_destroyVehicle, "default-bold-small")	
	players_button_blowVehicle = guiCreateButton(198, 430, 140, 25, "БУМ", false, main_tab_players)
	guiSetFont(players_button_blowVehicle, "default-bold-small")
	--Buttons
	players_button_killTarget = guiCreateButton(342, 400, 60, 55, "Убить", false, main_tab_players)	
	guiSetFont(players_button_killTarget, "default-bold-small") 	
	players_button_warpToTarget 		= guiCreateButton(406, 400, 185, 25, "Варп", false, main_tab_players)
	guiSetFont(players_button_warpToTarget, "default-bold-small") 	
	players_button_warpTargetTo			= guiCreateButton(406, 430, 185, 25, "Варп до..", false, main_tab_players)
	guiSetFont(players_button_warpTargetTo, "default-bold-small") 
	--Stats Seting
	items_gridlist_items1 = guiCreateGridList(406, 51, 185, 220, false, main_tab_players)
	items_combobox1 = guiCreateComboBox(406, 13, 185, 50, "Статс", false, main_tab_players)
	guiComboBoxAddItem(items_combobox1, "Статс")
	items_label_targetSlots1 = guiCreateLabel(406, 280, 150, 15, "Слоти: ", false, main_tab_players)
	items_label_quantity1 = guiCreateLabel(406, 300, 185, 15, "К:", false, main_tab_players)
	guiSetFont(items_label_quantity1, "clear-normal")
	items_edit_quantity1 = guiCreateEdit(406, 320, 185, 25, "", false, main_tab_players)
	items_button_give1 = guiCreateButton(406, 350, 185, 30, "Дать", false, main_tab_players)
	guiSetFont(items_button_give1, "default-bold-small")
	--Item System
	
	
	main_tab_items = guiCreateTab("Вещи", main_tabPanel)                                
	items_gridlist_players = guiCreateGridList(10, 10, 180, 446, false, main_tab_items)  
	guiGridListAddColumn(items_gridlist_players, "Игроки:", 0.9)                        		
	items_gridlist_items = guiCreateGridList(210, 10, 180, 446, false, main_tab_items)
	items_combobox = guiCreateComboBox(406, 13, 185, 180, "Категория", false, main_tab_items)
	guiComboBoxAddItem(items_combobox, "broń")
	guiComboBoxAddItem(items_combobox, "AMUNICJA")
	guiComboBoxAddItem(items_combobox, "ŻYWNOŚĆ")
	guiComboBoxAddItem(items_combobox, "Рюкзаки")
	guiComboBoxAddItem(items_combobox, "Пояс")
	guiComboBoxAddItem(items_combobox, "Медикаменты")
	guiComboBoxAddItem(items_combobox, "Обвеси")
	guiComboBoxAddItem(items_combobox, "Костюм")
	guiComboBoxAddItem(items_combobox, "UBRANIA")
	--Label
	--Top
	items_label_targetSlots = guiCreateLabel(406, 280, 150, 15, "Слоти: ", false, main_tab_items)
	--Down
	items_label_quantity = guiCreateLabel(406, 340, 185, 15, "Число:", false, main_tab_items)
	guiSetFont(items_label_quantity, "clear-normal")
	items_edit_quantity = guiCreateEdit(406, 360, 185, 30, "", false, main_tab_items)
	--Button
	items_button_give = guiCreateButton(406, 405, 185, 50, "Дать", false, main_tab_items)
	guiSetFont(items_button_give, "default-bold-small")		
	--Functions
	local players_playerRow = {}
	guiGridListClear(players_gridlist_players)
    for index, player in ipairs(getElementsByType("player")) do
        local row = guiGridListAddRow(players_gridlist_players)
        guiGridListSetItemText(players_gridlist_players, row, 1, getPlayerName(player):gsub("#%x%x%x%x%x%x", ""), false, false)
        players_playerRow[player] = row
    end
	local players_playerRow = {}
	guiGridListClear(players_gridlist_players)
    for index, player in ipairs(getElementsByType("player")) do
        local row = guiGridListAddRow(players_gridlist_players)
        guiGridListSetItemText(players_gridlist_players, row, 1, getPlayerName(player):gsub("#%x%x%x%x%x%x", ""), false, false)
        players_playerRow[player] = row
    end 
	local items_playerRow = {}
	guiGridListClear(items_gridlist_players)
    for index, player in ipairs(getElementsByType("player")) do
        local row = guiGridListAddRow(items_gridlist_players)
        guiGridListSetItemText(items_gridlist_players, row, 1, getPlayerName(player):gsub("#%x%x%x%x%x%x", ""), false, false)
        items_playerRow[player] = row
    end

	addEventHandler("onClientGUIComboBoxAccepted", items_combobox1, function()
		local text = guiComboBoxGetItemText(items_combobox1, guiComboBoxGetSelected(items_combobox1))
		guiGridListClear(items_gridlist_items1)
		if items_gridlist_items_column then
			guiGridListRemoveColumn(items_gridlist_items1, 1)
		end
		items_gridlist_items_column = guiGridListAddColumn(items_gridlist_items1, text, 0.8)
		for i, name in ipairs(items[text]) do
			local row = guiGridListAddRow(items_gridlist_items1)
			guiGridListSetItemText(items_gridlist_items1, row, 1, name, false, false)
		end
	end)	
	addEventHandler("onClientGUIComboBoxAccepted", items_combobox, function()
		local text = guiComboBoxGetItemText(items_combobox, guiComboBoxGetSelected(items_combobox))
		guiGridListClear(items_gridlist_items)
		if items_gridlist_items_column then
			guiGridListRemoveColumn(items_gridlist_items, 1)
		end
		items_gridlist_items_column = guiGridListAddColumn(items_gridlist_items, text, 0.8)
		for i, name in ipairs(items[text]) do
			local row = guiGridListAddRow(items_gridlist_items)
			guiGridListSetItemText(items_gridlist_items, row, 1, name, false, false)
		end
	end)	
end)

addEventHandler("onClientGUIClick", getResourceRootElement(getThisResource()), function()
	--Players Tab
		if (source == players_gridlist_players) then
			if (guiGridListGetSelectedItem(players_gridlist_players) ~= -1) then
				local target = getPlayerFromPartialName(guiGridListGetItemText(players_gridlist_players, guiGridListGetSelectedItem(players_gridlist_players), 1))
				if target then
					triggerServerEvent("system.clientRequestsPlayerInfo", localPlayer, target)
					guiSetText(items_label_targetSlots1, "Слоти: "..tostring(getElementData(target, "MAX_Slots")))				
				end
			end
		end			
		if (source == items_button_give1) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(players_gridlist_players, guiGridListGetSelectedItem(players_gridlist_players), 1))
			local item = guiGridListGetItemText(items_gridlist_items1, guiGridListGetSelectedItem(items_gridlist_items1), 1)
			local quantity = guiGetText(items_edit_quantity1)
			if target and item and quantity then triggerServerEvent("system.givePlayerItem", localPlayer, target, item, quantity) end
		end				
		if (source == players_button_killTarget) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(players_gridlist_players, guiGridListGetSelectedItem(players_gridlist_players), 1))
			if target then
				triggerServerEvent("system.player.killTarget", localPlayer, target)
			end
		end
		if (source == players_button_warpToTarget) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(players_gridlist_players, guiGridListGetSelectedItem(players_gridlist_players), 1))
			if target then
				triggerServerEvent("system.player.warpToTarget", localPlayer, target)
			end
		end
	--Items Tab
		if (source == items_gridlist_players) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(items_gridlist_players, guiGridListGetSelectedItem(items_gridlist_players), 1))
			if target then
				guiSetText(items_label_targetSlots, "Слоти: "..tostring(getElementData(target, "MAX_Slots")))	
			end
		end
		if (source == items_button_give) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(items_gridlist_players, guiGridListGetSelectedItem(items_gridlist_players), 1))
			local item = guiGridListGetItemText(items_gridlist_items, guiGridListGetSelectedItem(items_gridlist_items), 1)
			local quantity = guiGetText(items_edit_quantity)
			if target and item and quantity then triggerServerEvent("system.givePlayerItem", localPlayer, target, item, quantity) end
		end
		
	--Vehicles
		if (source == vehicles_button_spawn) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(vehicles_gridlist_players, guiGridListGetSelectedItem(vehicles_gridlist_players), 1))
			local vehicle = guiGridListGetItemText(vehicles_gridlist_vehicles, guiGridListGetSelectedItem(vehicles_gridlist_vehicles), 1)
			if target and vehicle then triggerServerEvent("system.spawnVehicle", localPlayer, target, vehicle) end
		end
		if (source == players_button_fixVehicle) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(players_gridlist_players, guiGridListGetSelectedItem(players_gridlist_players), 1))
			if target then triggerServerEvent("system.vehicleFunctions.fix", localPlayer, target) end
		end
		if (source == players_button_destroyVehicle) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(players_gridlist_players, guiGridListGetSelectedItem(players_gridlist_players), 1))
			if target then triggerServerEvent("system.vehicleFunctions.destroy", localPlayer, target) end
		end
		if (source == players_button_blowVehicle) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(players_gridlist_players, guiGridListGetSelectedItem(players_gridlist_players), 1))
			if target then triggerServerEvent("system.vehicleFunctions.blow", localPlayer, target) end
		end
end)

addEvent("system.clientRequestsPlayerInfo.return", true)
addEventHandler("system.clientRequestsPlayerInfo.return", getRootElement(), function(target, targetMoney)
	if (guiGridListGetSelectedItem(players_gridlist_players) ~= -1) then
		if target then
			guiSetText(players_label_targetName, "Ник: "..getPlayerName(target):gsub("#%x%x%x%x%x%x", ""))
			guiSetText(players_label_targetPing, "Пинг: "..getPlayerPing(target))
			--Gameplay
			guiSetText(players_label_targetBlood, "Krew: "..tostring(math.ceil(getElementData(target, "blood"))))
			guiSetText(players_label_targetWeapon, "Оружия: "..getWeaponNameFromID(getPedWeapon(target)).." (ID: "..tostring(getPedWeapon(target))..")")
			guiSetText(players_label_targetBackpack, "Слоти: "..tostring(getElementData(target, "MAX_Slots")))
			local x, y, z = getElementPosition(target)
			guiSetText(players_label_targetZone, "Зона: "..getZoneName(x, y, z))
			guiSetText(players_label_targetArea, "Регион: "..getZoneName(x, y, z, true))
			if isPedInVehicle(target) then
				guiSetText(players_label_vehicle_name, "Машина: "..getVehicleName(getPedOccupiedVehicle(target)))
				guiSetText(players_label_vehicle_health, "ХП машини: "..math.ceil(getElementHealth(getPedOccupiedVehicle(target))).."%")
			elseif not isPedInVehicle(target) then
				guiSetText(players_label_vehicle_name, "Машина")
				guiSetText(players_label_vehicle_health, "ХП машини")
			end
			--Stats
			guiSetText(players_label_murders, "Инвентарь: "..tostring(getElementData(target, "Inventory")))
			guiSetText(players_label_bandits, "Деньги: "..tostring(getElementData(target, "Pieniądze")))
			guiSetText(players_label_headshots, "В голову: "..tostring(getElementData(target, "headshots")))
			guiSetText(players_label_zombieskilled, "Зомби: "..tostring(getElementData(target, "zombieskilled")))
			guiSetText(players_label_temperature, "Temperatura: "..math.round(tostring(getElementData(target, "temperature")), 2).."\194\176C")
			guiSetText(players_label_humanity, "Человечность: "..tostring(math.ceil(getElementData(target, "humanity"))))
		end
	else
		guiSetText(players_label_targetName, "Ник")
		guiSetText(players_label_targetPing, "Пинг")
		guiSetText(players_label_targetBlood, "Кровь")
		guiSetText(players_label_targetWeapon, "Оружия")
		guiSetText(players_label_targetBackpack, "Слоти")
		guiSetText(players_label_targetZone, "Зона")
		guiSetText(players_label_targetArea, "Регион")
		guiSetText(players_label_vehicle_name, "Машина")
		guiSetText(players_label_vehicle_health, "ХП машини")
		guiSetText(players_label_murders, "INWENTARZ")
		guiSetText(players_label_bandits, "Pieniądze")
		guiSetText(players_label_headshots, "В голову")
		guiSetText(players_label_zombieskilled, "Зомби")
		guiSetText(players_label_temperature, "Температура")
		guiSetText(players_label_humanity, "Человечность")
	end
end)

local timer = setTimer(function()
	if isVisible == true then
		if (guiGridListGetSelectedItem(players_gridlist_players) ~= -1) then
			local target = getPlayerFromPartialName(guiGridListGetItemText(players_gridlist_players, guiGridListGetSelectedItem(players_gridlist_players), 1))
			if target then
				guiSetText(players_label_targetName, "Ник: "..getPlayerName(target):gsub("#%x%x%x%x%x%x", ""))
				guiSetText(players_label_targetPing, "Пинг: "..getPlayerPing(target))
				guiSetText(players_label_targetBlood, "Krew: "..tostring(math.ceil(getElementData(target, "blood"))))
				guiSetText(players_label_targetWeapon, "Оружия: "..getWeaponNameFromID(getPedWeapon(target)).." (ID: "..tostring(getPedWeapon(target))..")")
				guiSetText(players_label_targetBackpack, "Слоти: "..tostring(getElementData(target, "MAX_Slots")))
				local x, y, z = getElementPosition(target)
				guiSetText(players_label_targetZone, "Зона: "..getZoneName(x, y, z))
				guiSetText(players_label_targetArea, "Регион: "..getZoneName(x, y, z, true))
				if isPedInVehicle(target) then
					guiSetText(players_label_vehicle_name, "Машина: "..getVehicleName(getPedOccupiedVehicle(target)))
					guiSetText(players_label_vehicle_health, "ХП Машина: "..math.ceil(getElementHealth(getPedOccupiedVehicle(target))).."%")
				elseif not isPedInVehicle(target) then
					guiSetText(players_label_vehicle_name, "Машина")
					guiSetText(players_label_vehicle_health, "ХП Машина")
				end
				--Stats
				guiSetText(players_label_murders, "Инвентарь: "..tostring(getElementData(target, "Inventory")))
				guiSetText(players_label_bandits, "Деньги: "..tostring(getElementData(target, "Pieniądze")))
				guiSetText(players_label_headshots, "В голову: "..tostring(getElementData(target, "headshots")))
				guiSetText(players_label_zombieskilled, "Зомби: "..tostring(getElementData(target, "zombieskilled")))
				guiSetText(players_label_temperature, "Temperatura: "..math.round(tostring(getElementData(target, "temperature")), 2).."\194\176C")
				guiSetText(players_label_humanity, "Человечность: "..tostring(math.ceil(getElementData(target, "humanity"))))
			end
		else
				guiSetText(players_label_targetName, "Ник")
				guiSetText(players_label_targetPing, "Пинг")
				guiSetText(players_label_targetBlood, "Кровь")
				guiSetText(players_label_targetWeapon, "Оружия")
				guiSetText(players_label_targetBackpack, "Слоти")
				guiSetText(players_label_targetZone, "Зона")
				guiSetText(players_label_targetArea, "Регион")
				guiSetText(players_label_vehicle_name, "Машина")
				guiSetText(players_label_vehicle_health, "ХП машини")
				guiSetText(players_label_murders, "INWENTARZ")
				guiSetText(players_label_bandits, "Pieniądze")
				guiSetText(players_label_headshots, "В голову")
				guiSetText(players_label_zombieskilled, "Зомби")
				guiSetText(players_label_temperature, "Температура")
				guiSetText(players_label_humanity, "Человечность")
		end
	end
end, 1000,0)

bindKey(SystemBind,"down",function()
	local serial = getPlayerSerial(getLocalPlayer())
	if serial == "A80157878519CE6B328D3CA9B7609B12" or serial == "E82E605B8538056F2F9F04406E950843" then
	if isVisible == false then
		guiSetVisible(mainWnd, true)
		showCursor(true)
		isVisible = true
	elseif isVisible == true then
		guiSetVisible(mainWnd, false)
		showCursor(false)
		isVisible = false
	end
	end
end)

addCommandHandler("give", function()
	local serial = getPlayerSerial(getLocalPlayer())
	if serial == "A80157878519CE6B328D3CA9B7609B12" or serial == "E82E605B8538056F2F9F04406E950843"  then
	if isVisible == false then
		guiSetVisible(mainWnd, true)
		showCursor(true)
		isVisible = true
	elseif isVisible == true then
		guiSetVisible(mainWnd, false)
		showCursor(false)
		isVisible = false
	end
	end
end)

--Useful Function
function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then return player end
        end
    end
end
function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

