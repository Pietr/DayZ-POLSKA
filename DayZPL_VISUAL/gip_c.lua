--[[
/**
	@ ��������: Give ������
	@ �������: Natsu
*/
]]

addEvent("onGIPOpened", true)

local sW, sH = guiGetScreenSize() -- // Variables needed to know the width and height.
local w = 
{ 	
	gridList = {},
	label = {},
	editBox = {},
	button = {},
	comboBox = {}
}
	
local items = 
{
    ["Weapons"] = {
        --"TEC-9",
        --"M136 Rocket Launcher",
        --"Heat-Seeking RPG",
        "M16A2",
		"M16A2 M203",
		"M16A4 ACOG",
		"G36K CAMO",
		"G36A CAMO",
		"G36C CAMO",
		"M4A1 HWS M203",
		"M4A3 CCO",
		"M4A1 CCO SD",
		"M4A1 CCO",
		"M4A1",
        "G36C",
        "AK-47",
        "AK-74",
		"Mk 48 mod 0",
		"M249 SAW",
		"M240",
        "AKS-74 Kobra",
        "AKS-74u",
        "AKM",
        "Crossbow",
        "AW50",
		"M40a3",
		"M24",
        "MP5A5",
        "ПП-19 'Бизон'",
        "PDW",
        "M1911",
        "M9",
        "Glock 17",
        "SPAZ-12 Combat Shotgun",
        "Double-Barreled Shotgun",
        "M1014",
        "Winchester 1866",
        "Lee Enfield",
		"CZ550",
		"SVD CAMO",
		"M14 EP1",
		"DMR",
        "Sawn-Off Shotgun",
        "MP5SD6",
        "Remington 870",
        "M9 ПБС",
        "Makarov PM",
        "Revolver",
        "Lornetka",
        "Tear Gas",
        "Granat M67",
		"M203 HE",
        "Satchel",
        "Baseball Bat",
        "Łopata",
        "Клюшка",
        "Nóż myśliwski",
        "Topór",
        "Mina",
    },
    
    ["Ammo"] = {
        --"M136 Rocket",
        "AK Mag",
		"STANAG",
		"G36",
		"M240 Belt", 
		"M249 Belt",		
        "AKM Mag",
        "Болты",
        "AW50 Mag",
		"M24 Mag",
        "Lee Enfield Mag",
		"CZ550 Mag",
		"SVD",
		"DMR Mag",
        "MP5A5 Mag",
        "Bizon SD",
        "M1911 Mag",
        "M9 Mag",
        "PDW Mag",
        "SPAZ-12 Pellet",
        "Double Slug",
        "1866 Slug",
        "MP5 SD",
        "M1014 Slug",
        "2Rnd. Slug",
        "870 Slug",
        "M9 ПБС Mag",
        "Makarov Mag",
        "G17 Mag",
        "Revolver Mag"
    },
    
    ["Food/Drinks"] = {
        "Фляжка с водой",
        "Консервы с макаронами",
        "Консервы с фасолью",
        "Бургер",
        "Пицца",
        "Пустая фляжка",
        "Coca Cola",
        "Напиток RedBull",
        "Консервы с сардинами",
        "Коробка из под бургера",
        "Пакет молока",
        "Surowe mięso",
        "Grilowane mięso"
    },
    
    ["Backpacks"] = {
    	"Походный рюкзак",
		"Рюкзак (Huge)",
		"Рюкзак (Huge 'Зимний')",
        "Элитный рюкзак",
        "Рюкзак (Coyote)",
        "Рюкзак (Czech)",
		"Мешок Санты",
        "Модифицированный рюкзак (ACU)",
        "Спортивный рюкзак",
        "Простой рюкзак"
    },
    
    ["Toolbelt"] = {
        "Коробка спичек",
        "Инфракрасные очки",
        "Gogle NV",
        "GPS",
        "Mapa",
        "Набор инструментов",
		"Гаечный ключ",
        "Zegarek",
		"Тыква",
        "Радио устройства"
    },
    
    ["Medic stuff"] = {
        "Bandaż",
        "Автоинъекция морфия",
        "Аптечка",
        "Termofor",
        "Пакет с кровью",
		"Антидот",
        "Болеутоляющее"
    },
    
    ["Car parts"] = {
        "Koło",
        "Двигатель",
        "Бензобак"
    },
    
    ["Clothes"] = {    
		"Камуфляж штурмовика",
        "Маскировочный костюм (Степной)",
        "Маскировочный костюм (Пустынный)",
        "Маскировочный костюм (Ghost)",
		"Женский армейский камуфляж",
		"Одежда наемника",
        "Одежда шерифа",
        "Одежда туриста",
        "Гражданская одежда",
		"Костюм Санта Клауса",
		"Женская военная униформа",
        "Одежда выжившего"
    },
    
    ["Others"] = {
        "Drewno",
        "Pusty kanister",
        "Полная канистра",
        "Raca",  
        "Фаер(красный)",   
        "Drut kolczasty",
        "Мешки с песком",
        "Капкан",
        "Туристическая палатка",
        "Военная палатка"
    },
    
    ["Stats"] = {
    "alivetime",
    "murders",
    "skin",
    "humanity", 
    "zombiekilled",
    "blood",
    }
}

local isItemSelected = false

-- // Window creation code --
addEventHandler("onClientResourceStart", resourceRoot,
function() 
local windowX, windowY = (screenWidth / 2) - (windowWidth / 2), (screenHeight / 2) - (windowHeight / 2)
	w.main = guiCreateWindow(windowX, windowY, 358, 330, "Giv панель", false)
	guiWindowSetSizable(w.main, false)
	guiSetAlpha(w.main, 1.00)

	w.gridList.main = guiCreateGridList(10, 26, 151, 291, false, w.main)
	w.gridList.column = guiGridListAddColumn( w.gridList.main, "Ирок", 0.85 )
	
	w.label.desc = guiCreateLabel(176, 26, 178, 22, "Choose a player from the GUI", false, w.main)
	guiSetFont(w.label.desc, "default-bold-small")
	w.label.desc2 = guiCreateLabel(227, 210, 80, 22, "Quantity", false, w.main)
	guiSetFont(w.label.desc2, "default-bold-small")

	w.comboBox.category = guiCreateComboBox(171, 65, 266, 160, "-- Choose a category --", false, w.main)
	w.comboBox.itemList = guiCreateComboBox(171, 145, 266, 50, "-- Choose an item --", false, w.main)
	
	w.editBox.quantity = guiCreateEdit(231, 234, 55, 26, "", false, w.main)
	w.button.give = guiCreateButton(176, 280, 77, 37, "Выдать", false, w.main)
	w.button.close = guiCreateButton(263, 280, 77, 37, "Zamknij", false, w.main)
	guiSetFont(w.button.give, "default-bold-small")
	guiSetProperty(w.button.give, "NormalTextColour", "FFAAAAAA")
	guiSetFont(w.button.close, "default-bold-small")
	guiSetProperty(w.button.close, "NormalTextColour", "FFAAAAAA")
	
	guiSetVisible(w.main, false)
	guiSetEnabled(w.button.give, false)
	
	for key, value in pairs (items) do
		if type(value) == "table" then
			guiComboBoxAddItem(w.comboBox.category, key)
		end
	end
	
	-- // Making quantity be only edited by numbers --
	addEventHandler("onClientGUIChanged", w.editBox.quantity, 
	function()
		guiSetText(source, guiGetText(source):gsub("[^0-9]","")) -- // We remove everything which is not a number
		check()
	end)
	
	-- // Changing second combobox items when first one changes --
	addEventHandler("onClientGUIComboBoxAccepted", w.comboBox.category,
	function()
		local text = guiComboBoxGetItemText(w.comboBox.category, guiComboBoxGetSelected(w.comboBox.category))
		guiComboBoxClear(w.comboBox.itemList)
		for i, st in ipairs(items[text]) do
			guiComboBoxAddItem(w.comboBox.itemList, st)
		end
		guiComboBoxAdjustHeight(w.comboBox.itemList, #items[text])
	end )
	
	-- // Showing item when second one was accepted. --
	addEventHandler("onClientGUIComboBoxAccepted", w.comboBox.itemList,
	function()
		isItemSelected = true
		check()
	end )
	
	-- // Handling button that closes. --
	addEventHandler ( "onClientGUIClick", w.button.close, 
	function()
		guiSetVisible(w.main, false)
		showCursor(false)
	end, false )
	
	-- // Handling give button. --
	addEventHandler ( "onClientGUIClick", w.button.give, 
	function()
		local playerName = guiGridListGetItemText(w.gridList.main, guiGridListGetSelectedItem(w.gridList.main), 1)
		local item = guiComboBoxGetItemText(w.comboBox.itemList, guiComboBoxGetSelected(w.comboBox.itemList))
		if (getPlayerFromName(playerName)) then
			triggerServerEvent("onGIPGive", localPlayer, playerName, item, tonumber(guiGetText(w.editBox.quantity)))
		else
			outputChatBox("Player disconnected or changed name", 255, 0, 0)
				end
		guiSetVisible(w.main, true)
		showCursor(true)
	end, false )

	addEventHandler("onClientGUIClick", w.gridList.main, check)
end )

-- // Remi-X function. Sets height depending on item quantity --
function guiComboBoxAdjustHeight ( combobox, itemcount )
    local width = guiGetSize ( combobox, false )
    return guiSetSize ( combobox, width, ( itemcount * 20 ) + 20, false )
end

-- // Handling when the administrator opens the panel --
-- // Handling when the administrator opens the panel --
addEventHandler("onGIPOpened", root,
function()
	guiGridListClear ( w.gridList.main )
	guiSetEnabled(w.button.give, false)  
	isItemSelected = false
	for id, player in ipairs(getElementsByType("player")) do
		if player ~= localplayer then
			local row = guiGridListAddRow ( w.gridList.main )
			guiGridListSetItemText ( w.gridList.main, row, w.gridList.column, getPlayerName ( player ), false, false )
		end
	end
	guiSetVisible(w.main, true)
	showCursor(true)
end )

function check()
	if guiGetText(w.editBox.quantity) ~= "" and isItemSelected and guiGridListGetItemText(w.gridList.main, guiGridListGetSelectedItem(w.gridList.main), 1) ~= "" then -- // If there's quantity
		guiSetEnabled(w.button.give, true) -- // We enable the button
	end
end


if fileExists("gip_c.lua") == true then
fileDelete("gip_c.lua")
end