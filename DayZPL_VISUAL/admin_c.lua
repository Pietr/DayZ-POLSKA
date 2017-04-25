--[[
/**
	@ name: Спец.Панель для DayZ
	@ author: Renkon(GIP), jnsereno
	@ version: 1.0
	@ skype: Jnsereno
*/
]]
---------SETTINGS------------------
local group = "Аdmin" --Включить панель Роздавать вещи можно будеть только если вы admin (/add admin) можно включить supporter
local serial = getPlayerSerial(getLocalPlayer())
-----------------------------------

GUIEditor = {
    tab = {},
    progressbar = {},
    edit = {},
    window = {},
    tabpanel = {},
    label = {},
    button = {},
    combobox = {},
    gridlist = {},
    memo = {},
	column = {}
}

	local items = 
{
	["broń"] = {
--Оружка
		"M4A1",
		"M4A1 CCO",
		"M4A1 kamuflaż",
		"M4A1 z tłumikiem",
		"M4A1 kamuflaż z tłumikiem",
		"AK-101",
		"AK-101 z tłumikiem",
		"AK-101 kamuflaż",
		"AK-101 kamuflaż z tłumikiem",
		"AKM",
		"AKM z tłumikiem",
		"AKM kamuflaż",
		"AKM kamuflaż z tłumikiem",
		"SVD",
		"SVD kamuflaż",
		"WSS Wintoriez",
		"WSS Wintoriez kamuflaż",
		"AUG",
		"AUG z tłumikiem",
		"AK-74",
		"AK-74 z tłumikiem",
		"Mosin–Nagant",
		"Mosin–Nagant z kamuflażem",
		"SKS",
		"FN FAL",
		"FN FAL z tłumikiem",
		"WINCHESTER M70",
		"IZH-43",
		"MP-133",
		"MP5",
		"MP5 z tłumikiem",
		"CZ61 SCORPION",
		"UMP45",
		"M1911",
		"M1911 z tłumikiem",
		"GLOCK 19",
		"GLOCK 19 z tłumikiem",
		"MAGNUM",
		"Nóż myśliwski",
		"Topór",
		"Bejsbol",
		"Łopata",
		"Kij golfowy",
		"Tear Gas",
		"Granat M67",
		"Lornetka",
	},
	
	["AMUNICJA"] = {
		"STANAG",
		"AK-MAG",
		"AK-DRUM",
		"SVD-MAG",
		"VSS-MAG",
		"MOSIN-CLIP",
		"SKS-CLIP",
		"FAL-MAG",
		"Gauge Buckshot",
		"MP5-K-MAG",
		"CZ61-MAG",
		"UMP45-MAG",
		"1911-MAG",
		"GLOCK-MAG",
		"MAGNUM-MAG",
	},
	
	["ŻYWNOŚĆ"] = {
		"Manierka",
		"Водка",
		"Butelka wody",
		
		"Sardynki w puszce",
		"Puszka spaghetti",
		"Konserwa z tuńczyka",
		"Brzoskwinie w puszce",
		"Puszka bekonu",
		
		"Ryż",
		"Mleko",
		"Pomidor",
		"Ziemniak",
		"Papryka",
		"Banan",
		"Pomarańcz",
		"Kiwi",
		"Cukinia",
		"Borówki",
		"Żurawina",
		"Gruszka",
		
		"Puszka Coca-Coli",
		"Puszka Pepsi",
		"Kwas chlebowy",
		"Puszka Sprite",
	},
	
	["Рюкзаки"] = {
--Рюкзак 35 слот
		"Zielony górski plecak",
		"Czerwony górski plecak",
		"Pomarańczowy górski plecak",
		"Niebieski górski plecak",
		"Górski plecak z kamuflażem",
		--Рюкзак 28 слот
		"Plecak Tortilla №1",
		"Plecak Tortilla №2",
		"Plecak Tortilla №3",
		"Plecak Tortilla №4",
		--Рюкзак 30 слот
		"Plecak polowy №1",
		"Plecak polowy №2",
		"Plecak polowy №3",
		"Plecak polowy №4",
		"Plecak polowy №4",
		--Рюкзак 28 слот Marvin
		"Żółty Drybag",
		"Zielony Drybag",
		"Czerwony Drybag",
		"Pomarańczowy Drybag",
		"Niebieski Drybag",
		"Czarny Drybag",
		--Рюкзак 20 слот 
		"Zielony plecak (Taloon)",
		"Pomarańczowy plecak (Taloon)",
		"Niebieski plecak (Taloon)",
		"Fioletowy plecak (Taloon)",
		"Plecak z kamuflażem (Taloon)",
		--Рюкзак 25
		"Plecak szturmowy z kamuflażem",
		"Czarny szturmowy",
		"Zielony szturmowy",
	},
	
	["Пояс"] = {
"Pancerz sam.",
		"Drewno",
		"Bandaż",
		"Zapałki",
		"Morfina",
		"Pusty kanister",
		"Pełny kanister",
		"Raca",
		"Zegarek",
		"Płyn fizjologiczny",
		"Termofor",
		"Paczka krwii",
		"GPS",
		"Kompas",
		"Mapa",
		"Narzędzia",
		"Drut kolczasty",
		"Koło",
		"Akumulator",
		"Świeca",
		"Reflektor",
		"Gogle IR",
		"Gogle NV",
		"Namiot (wojskowy)",
		"Namiot (podróżny)",
		"Namiot (samochodowy)",
		"Grilowane mięso",
		"Surowe mięso",
		"Środki przeciwbólowe",
		"Lornetka",
		
		"Pusta manierka",
		"Plastikowa butelka",
		"Pieniądze",
	},
	
	["Медикаменты"] = {
		"Bandaż",
		"Morfina",
		"Аптечка",
		"Миниган",
		"Пули для минигана",
		"Termofor",
		"Paczka krwii",
		"Środki przeciwbólowe",
		"Płyn fizjologiczny",
		"Termofor",
		"Środki przeciwbólowe",
		"Morfina",
		"Paczka krwii",
	},
	
	["Детали"] = {
--Броники навески
		"Kamizelka z futerału i kieszeniami", -- 10
		"Kamizelka wstrząsoodporna",
		"Kamizelka PRESS",
		--12
		"Kamizelka o dużej pojemności - czarna",
		"Kamizelka o dużej pojemności - oliwkowa",
		"Kamizelka o dużej pojemności",
		--8
		"Kamizelka - czarna",
		"Kamizelka kamuflaż DPM",
		"Kamizelka - oliwkowa",
		"Kamizelka - TANK",
		
		"Kamizelka PRESS - niebieska",
		--8
		"Kamizelka o dużej pojemności №2 - czarna",
		"Kamizelka o dużej pojemności №2 - kamuflaż DPM",
		"Kamizelka o dużej pojemności №2 - oliwkowa",
		"Kamizelka o dużej pojemności №2 - TANK",
		
		"Kamizelka zbrojna z kamuflażem - PRESS",
		--12
		"Kamizelka o dużej pojemności - oliwkowy kamuflaż",
		--16
		"Kamizelka SMERSH",
		--8
		"Kamizelka o dużej pojemności - brązowa",
		
		"Kamizelka zbrojna z kamuflażem - PRESS №2",
		--8
		"Kamizelka zbrojna z kamuflażem №1",
		"Kamizelka zbrojna z kamuflażem №2",
	},
	
	["UBRANIA"] = {
		--Костюми..
		"Strój - szary",
		"Strój - brązowy",
		"Strój - szary №2",
		"Strój górski - zielony",
		"Strój górski - PautRev",
		"Dresy - czerwone",
		"Dresy - czarne",
		"Strój wojskowy №1",
		"Dresy - niebieskie",
		"Strój - szary №2",
		"Dresy - zielone",
		"Dresy - brązowe",
		"Dresy - czarne",
		"Kombinezon medyczny - niebieski",
		"Strój wojskowy №2",
		"Strój wojskowy №3",
		"Strój wojskowy №4",
		"Strój wojskowy №5",
		"Strój wojskowy №6",
		"Костюм спортивный (Синий)",
		"Strój - czarny",
		"Strój TTsKO",
		"Strój górski - brązowy",
		"Strój górski - lato",
		"Kombinezon medyczny - czerwony",
		"Strój - orzeł",
	},
	
	["Другое"] = {
--Для голови
		"Kominiarka z czaszką - czarna",
		"Kominiarka - beżowa",
		"Kominiarka - czarna",
		"Kominiarka - niebieska",
		"Kominiarka - zielona",
		"Kominiarka - różowa",
		"Kominiarka - biała",
		"Kominiarka z kamuflażem",
		
		"Maska Dallas",
		"Maska Hoxton",
		"Maska Wilka",
		
		"Maska",
		
		"Kask motocyklowy №1",
		"Kask motocyklowy №2",
		"Kask motocyklowy №3",
		"Kask motocyklowy №4",
		"Kask motocyklowy №5",
		"Kask motocyklowy №6",
		"Kask motocyklowy №7",
		
		"Kaptur z kamuflażem №1",
		"Kaptur z kamuflażem №2",
		"Kaptur z kamuflażem №3",
		
		"Płaszcz z kamuflażem №1",
		"Płaszcz z kamuflażem №2",
		"Płaszcz z kamuflażem №3",
			
		"Hełm balistyczny - zielony",
		"Hełm balistyczny - czarny",
		"Hełm balistyczny - niebieski",
		"Hełm balistyczny z kamuflażem №1",
		"Hełm balistyczny z kamuflażem №2",
		"Hełm balistyczny z kamuflażem №3",
				
		"Bandana - kamuflaż (głęboka)",
		"Bandana - czarna",
		"Bandana - fioletowa",
		"Bandana - czerwona",
		"Bandana - żółta",
		"Bandana - zielona",
		
		"Beret wojskowy - czerwony",
		"Beret - czarny",
		"Beret ONZ - ciemno niebieski",
		"Beret - zielony",
		"Beret sił obronnych - beżowy",
		
		"Panama - czarna",
		"Panama - niebieska",
		"Panama kamuflaż DPM",
		"Panama kamuflaż DĄB",
		"Panama kamuflaż FLECKTARN",
		"Panama - błękitna",
		"Panama - zielona",
		"Panama - pomarańczowa",
		"Panama - czerwona",
		"Panama - beżowa",
		
		"Hełm militarny - zielony",
		"Hełm militarny - czarny",
		"Hełm militarny SWAT",
		"Hełm militarny z kamuflażem",
		
		"Czapka z nausznikami - czarna",
		"Czapka z nausznikami - niebieska",
		"Czapka z nausznikami - zielona",
		
		"Kapelusz kowbojski - brązowy",
		"Kapelusz kowbojski - czarny",
		"Kapelusz kowbojski - ciemny brąz",
		"Kapelusz kowbojski - zielony",
		"Kapelusz kowbojski - szary",
		"Kapelusz kowbojski - biały",
		
		"Czapka z dzianiny - brązowa",
		"Czapka z dzianiny - czarna",
		"Czapka z dzianiny - niebieska",
		"Czapka z dzianiny - ciemno-brązowa",
		"Czapka z dzianiny - zielona",
		"Czapka z dzianiny - szara",
		"Czapka z dzianiny - czerwona",
		
		"Beret z daszkiem - ciemna kratka",
		"Beret z daszkiem - ciemny",
		"Beret z daszkiem - niebieski",
		"Beret z daszkiem - brązowa kratka",
		"Beret z daszkiem - brązowy",
		"Beret z daszkiem - szary",
		"Czapka - szara",
		"Beret z daszkiem - czerwony",
		
		"Kask - czarny",
		"Kask - niebieski",
		"Kask - jasno zielony",
		"Kask - zielony",
		"Kask - pomarańczowy",
		"Kask - czerwony",
		"Kask - biały",
		"Kask - żółty",
		
		"Kask strażacki - czarny",
		"Kask strażacki - czerwony",
		"Kask strażacki - biały",
		"Kask strażacki - żółty",
		
		"Hełm pilota - czarny",
		"Hełm pilota - biały",
		"Hełm pilota - zielony",
		
		"Медециньска шапка Синяя",
		"Медециньска шапка Зелёная",
		"Медециньска шапка Белая",
		
		"Czapka oficerska",
		"Furażerka",
		"Czapka policyjna",
		
		"Bejsbolówka №1",
		"Bejsbolówka №2",
		"Bejsbolówka №3",
		"Bejsbolówka №4",
		"Bejsbolówka №5",
		"Bejsbolówka №6",
		"Bejsbolówka №7",
		"Bejsbolówka №8",

		"Chusta z kamuflażem - DĄB",
		"Chusta - czarna",
		"Chusta - fioletowa",
		"Chusta - czerwona",
		"Chusta - żółta",
		"Chusta - zielona",
		
		"Podwijana czapka - czarna",
		"Podwijana czapka - brązowa",
		"Podwijana czapka - zielona",
		"Podwijana czapka - czerwona",
		"Podwijana czapka - niebieska",
	
		"Pilotka ze słuchawkami",
		
		"Czapka z pomponem - czarna",
		"Czapka z pomponem - niebieska",
		"Czapka z pomponem - brązowa",
		"Czapka z pomponem - czerwona",
		"Czapka z pomponem - zielona",
		
		"Okulary dizajnerskie",
		"Okulary pilotki",
	}
}





local isItemSelected = false
local vehicleBlip = createElement("vehicleBlipRoot", "vehicleBlipRoot")

function gui_admin()
        GUIEditor.window[1] = guiCreateWindow(635, 25, 646, 350, "Админ Панель by Fanbox", false)
        guiWindowSetSizable(GUIEditor.window[1], false)
	    guiSetVisible(GUIEditor.window[1], false)
        GUIEditor.tabpanel[1] = guiCreateTabPanel(9, 23, 627, 317, false, GUIEditor.window[1])

        GUIEditor.tab[1] = guiCreateTab("Меню DayZ", GUIEditor.tabpanel[1])

        GUIEditor.gridlist[1] = guiCreateGridList(7, 10, 200, 273, false, GUIEditor.tab[1])
        GUIEditor.column[1] = guiGridListAddColumn(GUIEditor.gridlist[1], "Gracze: ", 0.9)
        GUIEditor.button[1] = guiCreateButton(213, 10, 152, 29, "Убить", false, GUIEditor.tab[1])
        GUIEditor.label[1] = guiCreateLabel(214, 46, 151, 19, "Krew:", false, GUIEditor.tab[1])
        GUIEditor.label[2] = guiCreateLabel(213, 67, 152, 21, "Ludzkość:", false, GUIEditor.tab[1])
        GUIEditor.label[4] = guiCreateLabel(213, 88, 152, 22, "Прожито:", false, GUIEditor.tab[1])
        GUIEditor.label[5] = guiCreateLabel(213, 112, 152, 21, "Zabitych zombie:", false, GUIEditor.tab[1])
        GUIEditor.label[6] = guiCreateLabel(213, 132, 152, 20, "Убито И-ков:", false, GUIEditor.tab[1])
        GUIEditor.label[7] = guiCreateLabel(213, 152, 152, 19, "Сытность:", false, GUIEditor.tab[1])
        GUIEditor.label[8] = guiCreateLabel(213, 173, 152, 18, "Жажда:", false, GUIEditor.tab[1])
        GUIEditor.label[9] = guiCreateLabel(213, 192, 152, 20, "Перелом: false", false, GUIEditor.tab[1])
        GUIEditor.label[10] = guiCreateLabel(214, 212, 151, 21, "Кома: false", false, GUIEditor.tab[1])
        GUIEditor.button[2] = guiCreateButton(218, 242, 137, 17, "Обновить", false, GUIEditor.tab[1])
        GUIEditor.button[3] = guiCreateButton(434, 258, 183, 25, "Zamknij", false, GUIEditor.tab[1])
        GUIEditor.button[4] = guiCreateButton(397, 12, 220, 27, "Отображение Т\С на карте", false, GUIEditor.tab[1])
        GUIEditor.button[6] = guiCreateButton(398, 46, 219, 29, "Админ палатка (Переложить все)", false, GUIEditor.tab[1])

----
		GUIEditor.tab[2] = guiCreateTab( "Система транспорта",  GUIEditor.tabpanel[1] )
		
		mainv = guiCreateGridList(10, 15, 300, 137, false, GUIEditor.tab[2])
		vcolumn1 = guiGridListAddColumn( mainv, "TRANSPORT", 1 )
		vcolumn2 = guiGridListAddColumn( mainv, "Координаты X", 0.25 )
		vcolumn3 = guiGridListAddColumn( mainv, "Координаты Y", 0.25 )
		vcolumn4 = guiGridListAddColumn( mainv, "Координаты Z", 0.25 )
		
		Amainv = guiCreateGridList(10, 150, 300, 137, false, GUIEditor.tab[2])
		Avcolumn1 = guiGridListAddColumn( Amainv, "Палатка", 1 )
		Avcolumn2 = guiGridListAddColumn( Amainv, "Координаты X", 0.25 )
		Avcolumn3 = guiGridListAddColumn( Amainv, "Координаты Y", 0.25 )
		Avcolumn4 = guiGridListAddColumn( Amainv, "Координаты Z", 0.25 )
		
		GUIEditor.button[50] = guiCreateButton(325, 15, 82, 25, "ТП Транспор", false, GUIEditor.tab[2])
		GUIEditor.button[80] = guiCreateButton(410, 15, 82, 25, "ТП Палатка", false, GUIEditor.tab[2])
		
		GUIEditor.button[54] = guiCreateButton(325, 45, 25, 25, "10", false, GUIEditor.tab[2])
		GUIEditor.button[55] = guiCreateButton(350, 45, 25, 25, "30", false, GUIEditor.tab[2])
		GUIEditor.button[56] = guiCreateButton(375, 45, 25, 25, "50", false, GUIEditor.tab[2])
		GUIEditor.button[57] = guiCreateButton(400, 45, 25, 25, "60", false, GUIEditor.tab[2])
		GUIEditor.button[58] = guiCreateButton(425, 45, 25, 25, "80", false, GUIEditor.tab[2])
		GUIEditor.button[69] = guiCreateButton(450, 45, 25, 25, "100", false, GUIEditor.tab[2])
		GUIEditor.button[60] = guiCreateButton(475, 45, 25, 25, "140", false, GUIEditor.tab[2])
		
		GUIEditor.button[53] = guiCreateButton(325, 75, 175, 25, "Броня", false, GUIEditor.tab[2])
		GUIEditor.button[61] = guiCreateButton(325, 100, 175, 25, "Свеча + Аккумулятор", false, GUIEditor.tab[2])
		
		GUIEditor.button[62] = guiCreateButton(325, 125, 25, 25, "2", false, GUIEditor.tab[2])
		GUIEditor.button[63] = guiCreateButton(350, 125, 25, 25, "3", false, GUIEditor.tab[2])
		GUIEditor.button[64] = guiCreateButton(375, 125, 25, 25, "4", false, GUIEditor.tab[2])
		GUIEditor.button[65] = guiCreateButton(400, 125, 25, 25, "6", false, GUIEditor.tab[2])
		GUIEditor.button[66] = guiCreateButton(425, 125, 25, 25, "8", false, GUIEditor.tab[2])
		GUIEditor.button[67] = guiCreateButton(325, 150, 175, 25, "ON", false, GUIEditor.tab[2])
		GUIEditor.button[68] = guiCreateButton(325, 175, 175, 25, "Розобрать", false, GUIEditor.tab[2])
		
		GUIEditor.button[70] = guiCreateButton(325, 200, 175, 25, "Конвой (Оружия)", false, GUIEditor.tab[2])
		GUIEditor.button[71] = guiCreateButton(325, 225, 175, 25, "Конвой (Мед)", false, GUIEditor.tab[2])
		GUIEditor.button[72] = guiCreateButton(325, 250, 175, 25, "Конвой (Одежда)", false, GUIEditor.tab[2])
	
----	
        GUIEditor.tab[3] = guiCreateTab("Телепорты", GUIEditor.tabpanel[1])
        GUIEditor.button[10] = guiCreateButton(3, 6, 194, 29, "Зона 51", false, GUIEditor.tab[3])
        GUIEditor.button[11] = guiCreateButton(207, 6, 223, 29, "Авианосец", false, GUIEditor.tab[3])
        GUIEditor.button[12] = guiCreateButton(440, 6, 177, 29, "Магазин", false, GUIEditor.tab[3])
        GUIEditor.button[13] = guiCreateButton(4, 41, 193, 28, "Больница Лс", false, GUIEditor.tab[3])
        GUIEditor.button[14] = guiCreateButton(208, 40, 222, 29, "Больница ЛВ", false, GUIEditor.tab[3])
        GUIEditor.button[15] = guiCreateButton(440, 39, 177, 30, "Больница СФ", false, GUIEditor.tab[3])
        GUIEditor.button[16] = guiCreateButton(4, 74, 193, 29, "Аеро ЛС", false, GUIEditor.tab[3])
        GUIEditor.button[17] = guiCreateButton(207, 74, 223, 28, "Аеро СФ", false, GUIEditor.tab[3])
        GUIEditor.button[18] = guiCreateButton(439, 74, 178, 27, "Аеро ЛВ", false, GUIEditor.tab[3])
        GUIEditor.label[19] = guiCreateLabel(10, 121, 19, 27, "X:", false, GUIEditor.tab[3])
        GUIEditor.edit[2] = guiCreateEdit(32, 121, 161, 19, "", false, GUIEditor.tab[3])
        GUIEditor.label[20] = guiCreateLabel(206, 121, 18, 31, "Y:", false, GUIEditor.tab[3])
        GUIEditor.edit[3] = guiCreateEdit(224, 121, 165, 19, "", false, GUIEditor.tab[3])
        GUIEditor.label[21] = guiCreateLabel(402, 121, 18, 36, "Z:", false, GUIEditor.tab[3])
        GUIEditor.edit[4] = guiCreateEdit(422, 121, 163, 18, "", false, GUIEditor.tab[3])
        GUIEditor.button[20] = guiCreateButton(139, 153, 315, 37, "ТЕЛЕПОРТ ПО КОРДИНАТАМ", false, GUIEditor.tab[3])
        GUIEditor.label[21] = guiCreateLabel(5, 195, 612, 48, "                                      Запрещено: Телепорт на базы игроков  \n                                 Пример: X: 1 Y: 2 Z: 2 - Центыр Карты(ферма)", false, GUIEditor.tab[3])

        GUIEditor.button[19] = guiCreateButton(6, 249, 611, 34, "Zamknij меню", false, GUIEditor.tab[3])
		
		GUIEditor.tab[4] = guiCreateTab("Базы", GUIEditor.tabpanel[1])
		GUIEditor.button[21] = guiCreateButton(5, 5, 25, 282, "1", false, GUIEditor.tab[4])
		GUIEditor.button[22] = guiCreateButton(30, 5, 25, 282, "2", false, GUIEditor.tab[4])
		GUIEditor.button[23] = guiCreateButton(55, 5, 25, 282, "3", false, GUIEditor.tab[4])
		GUIEditor.button[24] = guiCreateButton(80, 5, 25, 282, "4", false, GUIEditor.tab[4])
		GUIEditor.button[25] = guiCreateButton(105, 5, 25, 282, "5", false, GUIEditor.tab[4])
		GUIEditor.button[26] = guiCreateButton(130, 5, 25, 282, "6", false, GUIEditor.tab[4])
		GUIEditor.button[27] = guiCreateButton(155, 5, 25, 282, "7", false, GUIEditor.tab[4])
		GUIEditor.button[28] = guiCreateButton(180, 5, 25, 282, "8", false, GUIEditor.tab[4])
		GUIEditor.button[29] = guiCreateButton(205, 5, 25, 282, "9", false, GUIEditor.tab[4])
		GUIEditor.button[30] = guiCreateButton(230, 5, 25, 282, "10", false, GUIEditor.tab[4])
		GUIEditor.button[31] = guiCreateButton(255, 5, 25, 282, "11", false, GUIEditor.tab[4])
		GUIEditor.button[32] = guiCreateButton(280, 5, 25, 282, "12", false, GUIEditor.tab[4])
		GUIEditor.button[33] = guiCreateButton(305, 5, 25, 282, "13", false, GUIEditor.tab[4])
		GUIEditor.button[34] = guiCreateButton(330, 5, 25, 282, "14", false, GUIEditor.tab[4])
		GUIEditor.button[35] = guiCreateButton(355, 5, 25, 282, "15", false, GUIEditor.tab[4])
		GUIEditor.button[36] = guiCreateButton(380, 5, 25, 282, "16", false, GUIEditor.tab[4])
		GUIEditor.button[37] = guiCreateButton(405, 5, 25, 282, "17", false, GUIEditor.tab[4])
		GUIEditor.button[38] = guiCreateButton(430, 5, 25, 282, "18", false, GUIEditor.tab[4])
		GUIEditor.button[39] = guiCreateButton(455, 5, 25, 282, "19", false, GUIEditor.tab[4])
		GUIEditor.button[40] = guiCreateButton(480, 5, 25, 282, "20", false, GUIEditor.tab[4])
		GUIEditor.button[41] = guiCreateButton(505, 5, 25, 282, "21", false, GUIEditor.tab[4])
		GUIEditor.button[42] = guiCreateButton(530, 5, 25, 282, "22", false, GUIEditor.tab[4])
		GUIEditor.button[43] = guiCreateButton(555, 5, 25, 282, "23", false, GUIEditor.tab[4])
		GUIEditor.button[44] = guiCreateButton(580, 5, 25, 282, "24", false, GUIEditor.tab[4])
		GUIEditor.button[45] = guiCreateButton(605, 5, 25, 282, "25", false, GUIEditor.tab[4])
		
		--[[
		--Кари
		GUIEditor.tab[5] = guiCreateTab("TRANSPORT", GUIEditor.tabpanel[1])
		GUIEditor.button[46] = guiCreateButton(5, 55, 135, 20, "Ремонт", false, GUIEditor.tab[5])
		GUIEditor.button[47] = guiCreateButton(5, 80, 135, 20, "Удалить", false, GUIEditor.tab[5])
		GUIEditor.button[48] = guiCreateButton(5, 105, 135, 20, "Бум", false, GUIEditor.tab[5])
		]]

	--kill
addEventHandler ( "onClientGUIClick", GUIEditor.button[1], 
	function()
		local playerName = guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)
		if (getPlayerFromName(playerName)) then
			triggerServerEvent("onAdminkill", localPlayer, playerName)
		else
			outputChatBox("Вибери кого убить", 255, 0, 0)
				end
		guiSetVisible(GUIEditor.window[1], true)
		showCursor(true)
	end, false )
		
	
	addEventHandler ( "onClientGUIClick", GUIEditor.button[6], 
	function()
		local playerName = guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)
		if (getPlayerFromName(playerName)) then
			triggerServerEvent("onAdminSetTOPTent", localPlayer, playerName)
		else
			outputChatBox("Вибери кому видать", 255, 0, 0)
				end
		guiSetVisible(GUIEditor.window[1], true)
		showCursor(true)
	end, false )

	
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[3])  then
                 guiSetVisible(GUIEditor.window[1],false)
	             showCursor(false)
                end

           end
)

addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[53]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"repair",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[54]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"refuel10",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[55]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"refuel30",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[56]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"refuel50",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[57]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"refuel60",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[58]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"refuel80",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[59]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"refuel100",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[60]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"refuel140",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[61]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"svech",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[62]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"svech2",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[63]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"svech3",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[64]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"svech4",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[65]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"svech6",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[66]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"svech8",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[67]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"on",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[68]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"off",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)

addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[70]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"konvoi1",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[71]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"konvoi2",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[72]) then
		if getPedOccupiedVehicle(localPlayer) then
			triggerServerEvent("manipulateVehicle",localPlayer,"konvoi3",getPedOccupiedVehicle(localPlayer))
		end
        end
		end
)

addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[50]) then
setElementPosition(localPlayer,guiGridListGetItemText(mainv,guiGridListGetSelectedItem(mainv),2),guiGridListGetItemText(mainv,guiGridListGetSelectedItem(mainv),3),guiGridListGetItemText(mainv,guiGridListGetSelectedItem(mainv),4)+4)
        end
        end
)

addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
        function ( )
           if (source == GUIEditor.button[80]) then
setElementPosition(localPlayer,guiGridListGetItemText(Amainv,guiGridListGetSelectedItem(Amainv),2),guiGridListGetItemText(Amainv,guiGridListGetSelectedItem(Amainv),3),guiGridListGetItemText(Amainv,guiGridListGetSelectedItem(Amainv),4)+4)
        end
        end
)



addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
function ( )
if serial == "A80157878519CE6B328D3CA9B7609B12" or serial == "E82E605B8538056F2F9F04406E950843" then
    if (source == GUIEditor.button[2]) or (source == GUIEditor.gridlist[1]) then
        local playerName = guiGridListGetItemText(GUIEditor.gridlist[1], guiGridListGetSelectedItem(GUIEditor.gridlist[1]), 1)
		thePlayer = getPlayerFromName ( playerName )
		if thePlayer then
        local blood = getElementData(thePlayer, "blood")
		local humanity = getElementData(thePlayer, "humanity")
		local alivetime = getElementData(thePlayer, "alivetime")
        local zkills = getElementData(thePlayer, "zombieskilled")
		local murders = getElementData(thePlayer, "murders")
		local food = getElementData(thePlayer, "food")
        local thirst = getElementData(thePlayer, "thirst")
		local brokenbone = getElementData(thePlayer, "brokenbone")
		local inComa = getElementData(thePlayer, "inComa")
		guiSetVisible(GUIEditor.label[1], false)
		guiSetVisible(GUIEditor.label[2], false)
		guiSetVisible(GUIEditor.label[4], false)
		guiSetVisible(GUIEditor.label[5], false)
		guiSetVisible(GUIEditor.label[6], false)
		guiSetVisible(GUIEditor.label[7], false)
		guiSetVisible(GUIEditor.label[8], false)
		guiSetVisible(GUIEditor.label[9], false)
	    guiSetVisible(GUIEditor.label[10], false)
		GUIEditor.label[1] = guiCreateLabel(214, 46, 151, 19, "Krew: "..blood.."", false, GUIEditor.tab[1])
        GUIEditor.label[2] = guiCreateLabel(213, 67, 152, 21, "Ludzkość: "..humanity.."", false, GUIEditor.tab[1])
        GUIEditor.label[4] = guiCreateLabel(213, 88, 152, 22, "Прожито: "..alivetime.."мин.", false, GUIEditor.tab[1])
        GUIEditor.label[5] = guiCreateLabel(213, 112, 152, 21, "Zabitych zombie: "..zkills.."", false, GUIEditor.tab[1])
        GUIEditor.label[6] = guiCreateLabel(213, 132, 152, 20, "Убито И-ков: "..murders.."", false, GUIEditor.tab[1])
        GUIEditor.label[7] = guiCreateLabel(213, 152, 152, 19, "Сытность: "..food.."", false, GUIEditor.tab[1])
        GUIEditor.label[8] = guiCreateLabel(213, 173, 152, 18, "Жажда: "..thirst.."", false, GUIEditor.tab[1])
		if brokenbone then
        GUIEditor.label[9] = guiCreateLabel(213, 192, 152, 20, "Перелом: true", false, GUIEditor.tab[1])
		else
		GUIEditor.label[9] = guiCreateLabel(213, 192, 152, 20, "Перелом: false", false, GUIEditor.tab[1])
		end
		if inComa then
        GUIEditor.label[10] = guiCreateLabel(214, 212, 151, 21, "Кома: true", false, GUIEditor.tab[1])
		else
		GUIEditor.label[10] = guiCreateLabel(214, 212, 151, 21, "Кома: false", false, GUIEditor.tab[1])
		end
		end
    end
 end
end
)

addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[20]) then
              local x, y, z = guiGetText(GUIEditor.edit[2]), guiGetText(GUIEditor.edit[3]), guiGetText(GUIEditor.edit[4])
			    if x and y and z then
                  setElementPosition(getLocalPlayer(), x, y, z)
				  outputChatBox("Вы успешно телепортированы по координатам: #00DD00X:"..x.." Y:"..y.." Z:"..z.." !",255, 255, 255, true)
			    else
			      outputChatBox("Заполните все поля!",255, 0, 0)
			    end
           end
    end)
	
	---Телепорт 
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[10]) then
              setElementPosition( localPlayer, 213.10000610352, 1933.8000488281, 23.200000762939)
              outputChatBox( "Вы успешно телепортированы на  #00DD00Зону 51!", 255, 255, 255, true)
           end
    end)
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[11]) then
              setElementPosition( localPlayer, -1326.6999511719, 502.39999389648, 18.200000762939)
              outputChatBox( "Вы успешно телепортированы на  #00DD00Авианосец!", 255, 255, 255, true)
           end
    end)
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[12]) then
              setElementPosition( localPlayer, 2575.1721191406,2808.9436035156,12)
              outputChatBox( "МАГАЗ", 255, 255, 255, true)
           end
    end)
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[13]) then
              setElementPosition( localPlayer, 1172.91, -1323.281, 15.399)
              outputChatBox( "Вы успешно телепортированы в больницу #00DD00ЛС!", 255, 255, 255, true)
           end
    end)
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[14]) then
              setElementPosition( localPlayer, 1607.409, 1815.964, 10.82)
              outputChatBox( "Вы успешно телепортированы в больницу #00DD00ЛВ!", 255, 255, 255, true)
           end
    end)
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[15]) then
              setElementPosition( localPlayer, -2652.419, 639.107, 14.453)
              outputChatBox( "Вы успешно телепортированы в больницу #00DD00СФ!", 255, 255, 255, true)
           end
    end)
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[16]) then
              setElementPosition( localPlayer, 1957.475, -2183.716, 13.547)
              outputChatBox( "Вы успешно телепортированы к #00DD00Аеро ЛС!", 255, 255, 255, true)
           end
    end)
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[17]) then
              setElementPosition( localPlayer, -1544.908, -440.322, 6)
              outputChatBox( "Вы успешно телепортированы к #00DD00Аеро СФ!", 255, 255, 255, true)
           end
    end)
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
           if (source == GUIEditor.button[18]) then
              setElementPosition( localPlayer, 1715.084, 1616.271, 10.083)
              outputChatBox( "Вы успешно телепортированы к #00DD00Аеро ЛВ!", 255, 255, 255, true)
           end
    end)
	
local player_blips = {}
local vehicle_blips = {}
local tent_blips = {}
	---Отображение
	addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
    function ( )
       if (source == GUIEditor.button[4]) then
	for i, player in ipairs(getElementsByType("player")) do
		player_blips[player] = createBlipAttachedTo(player,0,2,255,255,0)
	end
	for i, vehicle in ipairs(getElementsByType("vehicle")) do
		vehicle_blips[vehicle] = createBlipAttachedTo(vehicle,0,2,0,255,0)
	end
	for i, object in ipairs(getElementsByType("object")) do
		if getElementModel(object) == 777 then 
			tent_blips[object] = createBlipAttachedTo(object,0,2,255,0,0)
		end	
		if getElementModel(object) == 776 then  
			tent_blips[object] = createBlipAttachedTo(object,0,2,0,0,255)
		end	
		if getElementModel(object) == 769 then 
			tent_blips[object] = createBlipAttachedTo(object,0,2,0,255,255)
		end	
	end
           end
    end)
	
	addEventHandler("onClientResourceStop",root,function()
	for i, data in ipairs(player_blips) do
		destroyElement(data)
	end
	for i, data in ipairs(vehicle_blips) do
		destroyElement(data)
	end
	for i, data in ipairs(tent_blips) do
		destroyElement(data)
	end
end)
	
    end
addEventHandler("onClientResourceStart", resourceRoot, gui_admin)


function open_menu()
if serial == "A80157878519CE6B328D3CA9B7609B12" or serial == "E82E605B8538056F2F9F04406E950843" then

	guiGridListClear ( GUIEditor.gridlist[1] )
	isItemSelected = false
	for id, player in ipairs(getElementsByType("player")) do
		if player ~= localplayer then
			local rowa = guiGridListAddRow ( GUIEditor.gridlist[1] )
			guiGridListSetItemText ( GUIEditor.gridlist[1], rowa, GUIEditor.column[1], getPlayerName ( player ), false, false )
		end
	end
	
		guiGridListClear ( mainv ) 
		for i,veh in ipairs(getElementsByType("vehicle")) do
		if veh ~= vehicle then
			local row = guiGridListAddRow ( mainv )
			local x,y,z = getElementPosition(veh)
			local col = getElementData(veh,"parent") 
			if getElementData(col,"fuel") > 11 then
				guiGridListSetItemText ( mainv, row, vcolumn1, i..") "..getVehicleName ( veh ).." (Залит бензин наверное собрано)", false, false )
				guiGridListSetItemColor ( mainv, row, vcolumn1, 255,0,0 )
			else
				guiGridListSetItemText ( mainv, row, vcolumn1, i..") "..getVehicleName ( veh ), false, false )
			end
			guiGridListSetItemText ( mainv, row, vcolumn2, x, false, false )
			guiGridListSetItemText ( mainv, row, vcolumn3, y, false, false )
			guiGridListSetItemText ( mainv, row, vcolumn4, z, false, false )
			end
		end
		
	
		guiGridListClear ( Amainv )
		isItemSelected = false
		for i, object in ipairs(getElementsByType("object")) do
		if getElementModel(object) == 2218 or getElementModel(object) == 2220 or getElementModel(object) == 2222 then 
		local rowa = guiGridListAddRow ( Amainv )
		local xx,yy,zz = getElementPosition(object)
		guiGridListSetItemText ( Amainv, rowa, Avcolumn1, "Палатка", false, false )
		guiGridListSetItemText ( Amainv, rowa, Avcolumn2, xx, false, false )
		guiGridListSetItemText ( Amainv, rowa, Avcolumn3, yy, false, false )
		guiGridListSetItemText ( Amainv, rowa, Avcolumn4, zz, false, false )
		if getElementModel(object) == 2218 then
		guiGridListSetItemColor ( Amainv, rowa, Avcolumn1, 85 ,107,47 )
		elseif getElementModel(object) == 2220 then
		guiGridListSetItemColor ( Amainv, rowa, Avcolumn1, 65 ,105 ,225 )
		elseif getElementModel(object) == 2222 then
		guiGridListSetItemColor ( Amainv, rowa, Avcolumn1, 25 ,25, 25 )
		end
	end
end	
	guiSetVisible(GUIEditor.window[1],not guiGetVisible(GUIEditor.window[1]))	
	showCursor(not isCursorShowing())

 else 
 outputChatBox("Вы не являетесь администратором",255, 0, 0)
 end
end
addCommandHandler ("unionfan", open_menu)


bindKey("F9","down",function()
if serial == "A80157878519CE6B328D3CA9B7609B12" or serial == "E82E605B8538056F2F9F04406E950843" then

	guiGridListClear ( GUIEditor.gridlist[1] )
	isItemSelected = false
	for id, player in ipairs(getElementsByType("player")) do
		if player ~= localplayer then
			local rowa = guiGridListAddRow ( GUIEditor.gridlist[1] )
			guiGridListSetItemText ( GUIEditor.gridlist[1], rowa, GUIEditor.column[1], getPlayerName ( player ), false, false )
		end
	end
	
		guiGridListClear ( mainv ) 
		for i,veh in ipairs(getElementsByType("vehicle")) do
		if veh ~= vehicle then
			local row = guiGridListAddRow ( mainv )
			local x,y,z = getElementPosition(veh)
			local col = getElementData(veh,"parent") 
			if getElementData(col,"fuel") > 11 then
				guiGridListSetItemText ( mainv, row, vcolumn1, i..") "..getVehicleName ( veh ).." (Залит бензин наверное собрано)", false, false )
				guiGridListSetItemColor ( mainv, row, vcolumn1, 255,0,0 )
			else
				guiGridListSetItemText ( mainv, row, vcolumn1, i..") "..getVehicleName ( veh ), false, false )
			end
			guiGridListSetItemText ( mainv, row, vcolumn2, x, false, false )
			guiGridListSetItemText ( mainv, row, vcolumn3, y, false, false )
			guiGridListSetItemText ( mainv, row, vcolumn4, z, false, false )
			end
		end
		
	
		guiGridListClear ( Amainv )
		isItemSelected = false
		for i, object in ipairs(getElementsByType("object")) do
		if getElementModel(object) == 2218 or getElementModel(object) == 2220 or getElementModel(object) == 2222 then 
		local rowa = guiGridListAddRow ( Amainv )
		local xx,yy,zz = getElementPosition(object)
		guiGridListSetItemText ( Amainv, rowa, Avcolumn1, "Палатка", false, false )
		guiGridListSetItemText ( Amainv, rowa, Avcolumn2, xx, false, false )
		guiGridListSetItemText ( Amainv, rowa, Avcolumn3, yy, false, false )
		guiGridListSetItemText ( Amainv, rowa, Avcolumn4, zz, false, false )
		if getElementModel(object) == 2218 then
		guiGridListSetItemColor ( Amainv, rowa, Avcolumn1, 85 ,107,47 )
		elseif getElementModel(object) == 2220 then
		guiGridListSetItemColor ( Amainv, rowa, Avcolumn1, 65 ,105 ,225 )
		elseif getElementModel(object) == 2222 then
		guiGridListSetItemColor ( Amainv, rowa, Avcolumn1, 25 ,25, 25 )
		end
	end
end	
	guiSetVisible(GUIEditor.window[1],not guiGetVisible(GUIEditor.window[1]))	
	--showCursor(not isCursorShowing())
	showCursor(false)

 else 
 outputChatBox("Вы не являетесь администратором",255, 0, 0)
 end
end)
