
function startServer()
outputServerLog ("--------------------------")
outputServerLog ("DayZ-POLSKA")
outputServerLog ("Author: Pietr && EXT.Team")
outputServerLog ("--------------------------")
end
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),startServer)


adm_group = "Admin" -- назание alc группы, которая может использовать команды

spawnPositions = {
	{-2103.91015625,-2822.794921875,3},
    {-668.052734375,-816.966796875,97.453086853027},
    {1100.080078125,22.6181640625,65.714935302734},
    {2373.873046875,-535.00390625,110.56776428223},
    {2588.787109375,793.123046875,10.954463005066},
    {2566.4912109375,2335.4619140625,17.8203125},
    {1049.04296875,2907.330078125,47.82311630249},
    {384.4365234375,2601.14453125,16.484375},
    {-1298.1142578125,2508.37109375,86.98127746582},
    {-2292.0869140625,2250.232421875,4.9821910858154},
    {-2293.0546875,1311.01953125,15.84025478363},
    {-2976.8203125,499.0322265625,2.4296875},
    {-2311.7158203125,-716.74609375,83.646179199219},
	{-1482.8000488281,2327.1000976563,16.799999237061}, 
	{-800,-1040.6999511719,26.89999961853}, 
	{-1410.2231445313,-2298.3623046875,5.7612915039063}, 
	{2163.1691894531,-102.17922210693,2.75}, 
	{167.42961120605,644.01892089844,1.1961200237274}, 
	{377.52185058594,-2081.3999023438,7.8359375}, 
}

local class_settings = {
		{"VIP:NOCOMMAND",0},
		{"VIP:TIME",0},
}

playerDataTable = {
		--Инвентарь
		{"Inventory",0},
		{"Inventory_Setting",8},
		--Скин систем
		{"Kurtka",0},
		{"Shtani",0},
		
		{"bandit",false},
		{"currentweapon_1",false},
		{"currentweapon_2",false},
		{"currentweapon_3",false},
		{"clothGila",false},
		{"clothEis",false},
		{"clothBody",false},
		{"clothHead",false},
		{"clothHeadN",false},
		{"pain",false},
		{"cold",false},
		{"infection",false},
		{"brokenbone",false},
		{"alivetime",0},
		{"skin",100},
		{"MAX_Slots",6},
		{"blood",12000},
		{"food",100},
		{"thirst",100},
		{"sleep",400},--Стамина
		{"radiation",0},--Радиация
		{"temperature",36},
		{"bleeding",0},
		{"humanity",2500},
		{"zombieskilled",0},
		{"headshots",0},
		{"murders",0},
		{"banditskilled",0},
		{"notComa",0},--Шанс коми
		{"inComa",false},--Кома
		{"RadioChannel",0},
		{"GPSChannel",0},
		{"sick",0},--Отравлення
		{"infection_zom",0},--Заражения
		{"grip",0},--Грип
		{"Boroda",0},--Брода
		{"createObject",true},--Статус строительства
		
		--Оружка
		
		{"M4A1",0},
		{"M4A1 CCO",0},
		{"M4A1 kamuflaż",0},
		{"M4A1 z tłumikiem",0},
		{"M4A1 kamuflaż z tłumikiem",0},
		{"AK-101",0},
		{"AK-101 z tłumikiem",0},
		{"AK-101 kamuflaż",0},
		{"AK-101 kamuflaż z tłumikiem",0},
		{"AKM",0},
		{"AKM z tłumikiem",0},
		{"AKM kamuflaż",0},
		{"AKM kamuflaż z tłumikiem",0},
		{"SVD",0},
		{"SVD kamuflaż",0},
		{"WSS Wintoriez",0},
		{"WSS Wintoriez kamuflaż",0},
		{"AUG",0},
		{"AUG z tłumikiem",0},
		{"AK-74",0},
		{"AK-74 z tłumikiem",0},
		{"Mosin–Nagant",0},
		{"Mosin–Nagant z kamuflażem",0},
		{"SKS",0},
		{"FN FAL",0},
		{"FN FAL z tłumikiem",0},
		{"WINCHESTER M70",0},
		{"IZH-43",0},
		{"MP-133",0},
		{"MP5",0},
		{"MP5 z tłumikiem",0},
		{"CZ61 SCORPION",0},
		{"UMP45",0},
		{"M1911",0},
		{"M1911 z tłumikiem",0},
		{"GLOCK 19",0},
		{"GLOCK 19 z tłumikiem",0},
		{"MAGNUM",0},
		{"Nóż myśliwski",0},
		{"Topór",0},
		{"Bejsbol",0},
		{"Łopata",0},
		{"Kij golfowy",0},
		{"Piła spalinowa",0},
		{"Granat dymny",0},
		{"Granat hukowy",0},
		{"Granat M67",0},
		{"Lornetka",0},
		{"STANAG",0},
		{"AK-MAG",0},
		{"AK-DRUM",0},
		{"SVD-MAG",0},
		{"VSS-MAG",0},
		{"MOSIN-CLIP",0},
		{"SKS-CLIP",0},
		{"FAL-MAG",0},
		{"Gauge Buckshot",0},
		{"MP5-K-MAG",0},
		{"CZ61-MAG",0},
		{"UMP45-MAG",0},
		{"1911-MAG",0},
		{"GLOCK-MAG",0},
		{"MAGNUM-MAG",0},

		{"51mm NATO",0},
		{"М134 Minigun",0},
		{"BGM-71 TOW",0},
		
		{"Plan - blok z piasku",0},
		{"Plan - worki z piaskiem",0},
		{"Plan - opony",0},
		{"Plan - przeciwpancerny jeż",0},
		{"Plan - duży przeciwpancerny jeż",0},

		{"Mina",0},
		{"Piasek",0},
		{"Drut",0},
		{"Worek",0},
		{"Opona",0},
		{"Metal",0},
		{"Drut kolczasty",0},
		{"Niedźwiedzia pułapka",0},
		
		{"Pieniądze",0},
		{"Drewno",0},
		{"Bandaż",1},
		{"Manierka",0},
		{"Butelka wody",1},

		{"Sardynki w puszce",0},
		{"Puszka spaghetti",0},
		{"Konserwa z tuńczyka",0},
		{"Brzoskwinie w puszce",0},
		{"Puszka bekonu",0},
		
		{"Sardynki w puszce (✖)",0},
		{"Puszka spaghetti (✖)",0},
		{"Konserwa z tuńczyka (✖)",0},
		{"Brzoskwinie w puszce (✖)",0},
		{"Puszka bekonu (✖)",0},
		{"Otwieracz",0},
		
		{"Ryż",0},
		{"Mleko",0},
		{"Pomidor",0},
		{"Ziemniak",0},
		{"Papryka",0},
		{"Banan",0},
		{"Pomarańcz",0},
		{"Kiwi",0},
		{"Cukinia",0},
		{"Borówki",0},
		{"Żurawina",0},
		{"Gruszka",0},
		{"Jabłko",0},
				
		{"Zapałki",0},
		{"Morfina",0},
		
		{"Puszka Coca-Coli",0},
		{"Puszka Pepsi",0},
		{"Kwas chlebowy",0},
		{"Puszka Sprite",0},
			
		{"Pusty kanister",0},
		{"Pełny kanister",0},
		{"Raca",0},
		{"Zegarek",0},
		{"Płyn fizjologiczny",0},
		{"Termofor",0},
		{"Anty Rad",0},
		{"Węgiel medyczny",0},
		{"Antybiotyk",0},
		{"Adrenalina",0},
		{"Arbidol",0},
		{"Paczka krwii",0},
		{"GPS",0},
		{"Dozymetr",0},
		{"Kompas",0},
		{"Mapa",0},
		{"Narzędzia",0},
		{"Drut kolczasty",0},
		{"Koło",0},
		{"Akumulator",0},
		{"Świeca",0},
		{"Reflektor",0},
		{"Gogle IR",0},
		{"Gogle NV",0},
		{"Namiot (wojskowy)",0},
		{"Namiot (samochodowy)",0},
		{"Namiot (podróżny)",0},
		{"Grilowane mięso",0},
		{"Surowe mięso",0},
		{"Środki przeciwbólowe",1},
		{"Lornetka",0},
		{"Pusta manierka",0},
		{"Plastikowa butelka",0},
		{"Odpadki",0},
		{"Radio",0},
		--Стат
		{"Rukzak",0},
		
		{"Strój - szary",0},
		{"Strój - brązowy",0},
		{"Strój - szary №2",0},
		{"Strój górski - zielony",0},
		{"Strój górski - PautRev",0},
		{"Dresy - czerwone",0},
		{"Dresy - czarne",0},
		{"Strój wojskowy №1",0},
		{"Dresy - niebieskie",0},
		{"Strój - szary №2",0},
		{"Dresy - zielone",0},
		{"Dresy - brązowe",0},
		{"Dresy - czarne",0},
		{"Kombinezon medyczny - niebieski",0},
		{"Strój wojskowy №2",0},
		{"Strój wojskowy №3",0},
		{"Strój wojskowy №4",0},
		{"Strój wojskowy №5",0},
		{"Strój wojskowy №6",0},
		{"Костюм спортивный (Синий)",0},
		{"Strój - czarny",0},
		{"Strój TTsKO",0},
		{"Strój górski - brązowy",0},
		{"Strój górski - lato",0},
		{"Kombinezon medyczny - czerwony",0},
		{"Strój - orzeł",0},

		
	
		--На голову
		{"Kominiarka z czaszką - czarna",0},
		{"Kominiarka - beżowa",0},
		{"Kominiarka - czarna",0},
		{"Kominiarka - niebieska",0},
		{"Kominiarka - zielona",0},
		{"Kominiarka - różowa",0},
		{"Kominiarka - biała",0},
		{"Kominiarka z kamuflażem",0},
		
		{"Maska Dallas",0},
		{"Maska Hoxton",0},
		{"Maska Wilka",0},
		
		{"Maska",0},
		
		{"Kask motocyklowy №1",0},
		{"Kask motocyklowy №2",0},
		{"Kask motocyklowy №3",0},
		{"Kask motocyklowy №4",0},
		{"Kask motocyklowy №5",0},
		{"Kask motocyklowy №6",0},
		{"Kask motocyklowy №7",0},
		
		{"Bandana - kamuflaż (głęboka)",0},
		{"Bandana - czarna",0},
		{"Bandana - fioletowa",0},
		{"Bandana - czerwona",0},
		{"Bandana - żółta",0},
		{"Bandana - zielona",0},
		
		{"Kapelusz kowbojski - brązowy",0},
		{"Kapelusz kowbojski - czarny",0},
		{"Kapelusz kowbojski - ciemny brąz",0},
		{"Kapelusz kowbojski - zielony",0},
		{"Kapelusz kowbojski - szary",0},
		{"Kapelusz kowbojski - biały",0},
		
		{"Beret wojskowy - czerwony",0},
		{"Beret - czarny",0},
		{"Beret ONZ - ciemno niebieski",0},
		{"Beret - zielony",0},
		{"Beret sił obronnych - beżowy",0},
		
		{"Panama - czarna",0},
		{"Panama - niebieska",0},
		{"Panama kamuflaż DPM",0},
		{"Panama kamuflaż DĄB",0},
		{"Panama kamuflaż FLECKTARN",0},
		{"Panama - błękitna",0},
		{"Panama - zielona",0},
		{"Panama - pomarańczowa",0},
		{"Panama - czerwona",0},
		{"Panama - beżowa",0},
		
		{"Kaptur z kamuflażem №1",0},
		{"Kaptur z kamuflażem №2",0},
		{"Kaptur z kamuflażem №3",0},
		
		{"Płaszcz z kamuflażem №1",0},
		{"Płaszcz z kamuflażem №2",0},
		{"Płaszcz z kamuflażem №3",0},
		
		{"Hełm balistyczny - zielony",0},
		{"Hełm balistyczny - czarny",0},
		{"Hełm balistyczny - niebieski",0},
		{"Hełm balistyczny z kamuflażem №1",0},
		{"Hełm balistyczny z kamuflażem №2",0},
		{"Hełm balistyczny z kamuflażem №3",0},

		{"Hełm militarny - zielony",0},
		{"Hełm militarny - czarny",0},
		{"Hełm militarny SWAT",0},
		{"Hełm militarny z kamuflażem",0},
		
		{"Czapka z nausznikami - czarna",0},
		{"Czapka z nausznikami - niebieska",0},
		{"Czapka z nausznikami - zielona",0},
		
		{"Czapka z dzianiny - brązowa",0},
		{"Czapka z dzianiny - czarna",0},
		{"Czapka z dzianiny - niebieska",0},
		{"Czapka z dzianiny - ciemno-brązowa",0},
		{"Czapka z dzianiny - zielona",0},
		{"Czapka z dzianiny - szara",0},
		{"Czapka z dzianiny - czerwona",0},
		
		{"Beret z daszkiem - ciemna kratka",0},
		{"Beret z daszkiem - ciemny",0},
		{"Beret z daszkiem - niebieski",0},
		{"Beret z daszkiem - brązowa kratka",0},
		{"Beret z daszkiem - brązowy",0},
		{"Beret z daszkiem - szary",0},
		{"Czapka - szara",0},
		{"Beret z daszkiem - czerwony",0},
		
		{"Kask - czarny",0},
		{"Kask - niebieski",0},
		{"Kask - jasno zielony",0},
		{"Kask - zielony",0},
		{"Kask - pomarańczowy",0},
		{"Kask - czerwony",0},
		{"Kask - biały",0},
		{"Kask - żółty",0},
		
		{"Kask strażacki - czarny",0},
		{"Kask strażacki - czerwony",0},
		{"Kask strażacki - biały",0},
		{"Kask strażacki - żółty",0},
		
		{"Hełm pilota - czarny",0},
		{"Hełm pilota - biały",0},
		{"Hełm pilota - zielony",0},
			
		{"Husta operacyjna - niebieska",0},
		{"Husta operacyjna - zielona",0},
		{"Husta operacyjna - biała",0},
		
		{"Czapka oficerska",0},
		{"Furażerka",0},
		{"Czapka policyjna",0},
		
		{"Bejsbolówka №1",0},
		{"Bejsbolówka №2",0},
		{"Bejsbolówka №3",0},
		{"Bejsbolówka №4",0},
		{"Bejsbolówka №5",0},
		{"Bejsbolówka №6",0},
		{"Bejsbolówka №7",0},
		{"Bejsbolówka №8",0},
		
		{"Chusta z kamuflażem - DĄB",0},
		{"Chusta - czarna",0},
		{"Chusta - fioletowa",0},
		{"Chusta - czerwona",0},
		{"Chusta - żółta",0},
		{"Chusta - zielona",0},
		
		{"Podwijana czapka - czarna",0},
		{"Podwijana czapka - brązowa",0},
		{"Podwijana czapka - zielona",0},
		{"Podwijana czapka - czerwona",0},
		{"Podwijana czapka - niebieska",0},
		
		{"Pilotka ze słuchawkami",0},
		
		{"Czapka z pomponem - czarna",0},
		{"Czapka z pomponem - niebieska",0},
		{"Czapka z pomponem - brązowa",0},
		{"Czapka z pomponem - czerwona",0},
		{"Czapka z pomponem - zielona",0},

		{"Okulary dizajnerskie",0},
		{"Okulary pilotki",0},
		
		--Броники навески
		{"Kamizelka z futerału i kieszeniami",0}, -- 10
		{"Kamizelka wstrząsoodporna",0},
		{"Kamizelka PRESS",0},
		--12
		{"Kamizelka o dużej pojemności - czarna",0},
		{"Kamizelka o dużej pojemności - oliwkowa",0},
		{"Kamizelka o dużej pojemności",0},
		--8
		{"Kamizelka - czarna",0},
		{"Kamizelka kamuflaż DPM",0},
		{"Kamizelka - oliwkowa",0},
		{"Kamizelka - TANK",0},
		
		{"Kamizelka PRESS - niebieska",0},
		--8
		{"Kamizelka o dużej pojemności №2 - czarna",0},
		{"Kamizelka o dużej pojemności №2 - kamuflaż DPM",0},
		{"Kamizelka o dużej pojemności №2 - oliwkowa",0},
		{"Kamizelka o dużej pojemności №2 - TANK",0},
		
		{"Kamizelka zbrojna z kamuflażem - PRESS",0},
		--12
		{"Kamizelka o dużej pojemności - oliwkowy kamuflaż",0},
		--16
		{"Kamizelka SMERSH",0},
		--8
		{"Kamizelka o dużej pojemności - brązowa",0},
		
		{"Kamizelka zbrojna z kamuflażem - PRESS №2",0},
		--8
		{"Kamizelka zbrojna z kamuflażem №1",0},
		{"Kamizelka zbrojna z kamuflażem №2",0},

		
		

		
		--Рюкзак 35 слот
		{"Zielony górski plecak",0},
		{"Czerwony górski plecak",0},
		{"Pomarańczowy górski plecak",0},
		{"Niebieski górski plecak",0},
		{"Górski plecak z kamuflażem",0},
		--Рюкзак 28 слот
		{"Plecak Tortilla №1",0},
		{"Plecak Tortilla №2",0},
		{"Plecak Tortilla №3",0},
		{"Plecak Tortilla №4",0},
		--Рюкзак 30 слот
		{"Plecak polowy №1",0},
		{"Plecak polowy №2",0},
		{"Plecak polowy №3",0},
		{"Plecak polowy №4",0},
		{"Plecak polowy №5",0},
		--Рюкзак 28 слот Марвин
		{"Żółty Drybag",0},
		{"Zielony Drybag",0},
		{"Czerwony Drybag",0},
		{"Pomarańczowy Drybag",0},
		{"Niebieski Drybag",0},
		{"Czarny Drybag",0},
		--Рюкзак 20
		{"Zielony plecak (Taloon)",0},
		{"Pomarańczowy plecak (Taloon)",0},
		{"Niebieski plecak (Taloon)",0},
		{"Fioletowy plecak (Taloon)",0},
		{"Plecak z kamuflażem (Taloon)",0},
		--Рюкзак 25
		{"Plecak szturmowy z kamuflażem",0},
		{"Czarny szturmowy",0},
		{"Zielony szturmowy",0},
		
		{"Plecak SMERSH",0},
		{"Torba domowa",0},
		{"Skórzana torba",0},
		{"Oryginalny skórzany plecak",0},
		{"Ręcznie robiony plecak",0},
		{"Ręcznie robiony skórzany plecak",0},
		{"Teczka dziecięca",0},
		{"Plecak Coyote",0},
		
		{"Pancerz sam.",0},
	
}

function playerLogin(username, pass, player)
	local playerID = getAccountData(getPlayerAccount(player),"playerID")
	account = getPlayerAccount(player)
	local x,y,z =  getAccountData(account,"last_x"),getAccountData(account,"last_y"),getAccountData(account,"last_z")
	if getAccountData(account,"isDead") then
		spawnDayZPlayer(player)
		return
	end
	spawnPlayer (player, x,y,z+0.5, math.random(0,360), 100, 0, 0)
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
	for i,data in ipairs(playerDataTable) do
		local elementData = getAccountData(account,data[1])
		if not elementData then
			if data[1] == "brokenbone" or data[1] == "pain" or data[1] == "cold" or data[1] == "infection" or data[1] == "currentweapon_1" or data[1] == "currentweapon_2" or data[1] == "currentweapon_3" or data[1] == "bandit" then
				elementData = elementData
			else
				elementData = 0
			end
		end
		setElementData(player,data[1],elementData)
	end
	setElementData(player,"logedin",true)
	local weapon = getElementData(player,"currentweapon_1")
	if weapon then
		local ammoData,weapID = getWeaponAmmoType (weapon)
		giveWeapon(player,weapID,getElementData(player,ammoData), true )
	end
	local weapon = getElementData(player,"currentweapon_2")
	if weapon then
		local ammoData,weapID = getWeaponAmmoType (weapon)
		giveWeapon(player,weapID,getElementData(player,ammoData), false )
	end
	local weapon = getElementData(player,"currentweapon_3")
	if weapon then
		local ammoData,weapID = getWeaponAmmoType (weapon)
		giveWeapon(player,weapID,getElementData(player,ammoData), false )
	end
	setElementModel(player, getElementData(player,"skin"))

end
addEvent("onPlayerDayZLogin", true)
addEventHandler("onPlayerDayZLogin", getRootElement(), playerLogin)

function playerRegister(username, pass, player)
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z, math.random(0,360), 100, 0, 0)
	fadeCamera (player, true)
	setCameraTarget (player, player)
	playerCol = createColSphere(x,y,z,1.5)
	attachElements ( playerCol, player, 0, 0, 0 )
	setElementData(playerCol,"parent",player)
	setElementData(playerCol,"player",true)
	for i,data in ipairs(playerDataTable) do
		setElementData(player,data[1],data[2])		
	end
	setElementData(player,"logedin",true)
end
addEvent("onPlayerDayZRegister", true)
addEventHandler("onPlayerDayZRegister", getRootElement(), playerRegister)

function saveAccounts ()
	local account = getPlayerAccount(source)
	if account then
		for i,data in ipairs(playerDataTable) do
			setAccountData(account,data[1],getElementData(source,data[1]))
		end
		local x,y,z =  getElementPosition(source)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		if isElement ( getElementData(source, "playerCol") ) then 
            destroyElement(getElementData(source, "playerCol")) 
        end
	end	
	setElementData(source,"logedin",false)
end
addEventHandler ( "onPlayerQuit", getRootElement(), saveAccounts )

function saveAccounts2()
	for i, player in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(player)
		if account then
			for i,data in ipairs(playerDataTable) do
				setAccountData(account,data[1],getElementData(player,data[1]))
			end
			local x,y,z =  getElementPosition(player)
			setAccountData(account,"last_x",x)
			setAccountData(account,"last_y",y)
			setAccountData(account,"last_z",z)
		end	
	end	
end
addEventHandler ( "onResourceStop", getRootElement(), saveAccounts2 )

