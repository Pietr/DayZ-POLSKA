gameplayVariables = {}
gameplayVariables["ping"] = 600 
gameplayVariables["zombiedamage"] = math.random(400,900)
gameplayVariables["enablenight"] = true 
gameplayVariables["ambiencesoundvolume"] = 0.2 -- Звук музики

playlist = {
	{"RMF Maxx","http://files.kusmierz.be/rmf/maxxx.pls"},
	{"RMF Classic","http://files.kusmierz.be/rmf/classic.pls"},
	{"Eska Gorąca 20","http://www.radio.pionier.net.pl/stream.pls?radio=eskastream19"},
	{"Eska Global Lista","http://acdn.smcloud.net/t016-1_mp3.pls"},
	{"Eska Rap","http://acdn.smcloud.net/t016-1_mp3.pls"},
	{"Eska Kraków","http://acdn.smcloud.net/t002-1_mp3.pls"},
	{"EuropaPlus-FM","http://ep128server.streamr.ru:8030/ep128"},
	{"Antyradio","http://ant-waw-01.cdn.eurozet.pl:8602/listen.pls"},
	{"Vox FM","http://www.radio.pionier.net.pl/stream.pls?radio=voxfm"},
	{"Katolickie Radio Zamosc","http://www.listenlive.eu/krz.m3u"},
}

vehicleAddonsInfo = {
	{400,4,1,1},
	{402,4,1,1},
	{403,6,1,1},
	{408,6,1,1},
	{411,4,1,1},
	{415,4,1,1},
	{416,4,1,1},
	{417,3,1,1},
	{427,4,1,1},
	{433,6,1,1},
	{434,4,1,1},
	{435,8,1,1},
	{437,4,1,1},
	{439,4,1,1},
	{455,6,1,1},
	{463,2,1,1},
	{466,4,1,1},
	{468,2,1,1},
	{470,4,1,1},
	{471,4,1,1},
	{487,0,1,1},
	{489,4,1,1},
	{490,4,1,1},
	{495,4,1,1},
	{497,0,1,1},
	{500,4,1,1},
	{514,4,1,1},
	{515,8,1,1},
	{522,2,1,1},
	{525,4,1,1},
	{542,4,1,1},
	{547,4,1,1},
	{545,4,1,1},
	{548,4,1,1},
	{553,2,1,1},
	{579,4,1,1},
	{582,4,1,1},
	{473,0,1,1},
	{596,4,1,1},
	{601,6,1,1},
	{563,3,1,1},
	{425,3,1,1},
	{554,0,1,1},
	{404,4,1,1},
	{410,4,1,1},
	{502,4,1,1},
	{588,4,1,1},
	
}

-- 30 50 60 80 100 140
vehicleFuelTable = {
	{400,60},
	{402,50},
	{403,140},
	{408,140},
	{411,60},
	{415,50},
	{416,80},
	{417,140},
	{427,100},
	{433,140},
	{434,50},
	{435,0},
	{437,140},
	{439,50},
	{455,140},
	{463,30},
	{466,50},
	{468,30},
	{470,80},
	{471,30},
	{487,100},
	{489,80},
	{490,80},
	{495,60},
	{497,100},
	{500,50},
	{514,140},
	{515,140},
	{522,30},
	{525,60},
	{542,50},
	{547,50},
	{545,50},
	{548,140},
	{553,140},
	{579,60},
	{582,60},
	{473,100}, 
	{596,50},
	{601,140},	
	{563,140},	
	{425,140},	
	{554,50},	
	{404,30},
	{410,30},
	{502,60},
	{588,60},
}

weaponsShake = {
			["M4A1"] = 0,
			["M4A1 CCO"] = 0,
			["M4A1 kamuflaż"] = 0,
			["M4A1 z tłumikiem"] = 0,
			["M4A1 kamuflaż z tłumikiem"] = 0,
			["AK-101"] = 0,
			["AK-101 z tłumikiem"] = 0,
			["AK-101 kamuflaż"] = 0,
			["AK-101 kamuflaż z tłumikiem"] = 0,
			["AKM"] = 0,
			["AKM z tłumikiem"] = 0,
			["AKM kamuflaż"] = 0,
			["AKM kamuflaż z tłumikiem"] = 0,
			["SVD"] = 0,
			["SVD kamuflaż"] = 0,
			["WSS Wintoriez"] = 0,
			["WSS Wintoriez kamuflaż"] = 0,
			["AUG"] = 0,
			["AUG z tłumikiem"] = 0,
			["AK-74"] = 0,
			["AK-74 z tłumikiem"] = 0,
			["Mosin–Nagant"] = 0,
			["Mosin–Nagant z kamuflażem"] = 0,
			["SKS"] = 0,
			["FN FAL"] = 0,
			["FN FAL z tłumikiem"] = 0,
			["WINCHESTER M70"] = 0,
			["IZH-43"] = 0,
			["MP-133"] = 0,
}


damageTable = {
			{"M4A1",3900},
			{"M4A1 CCO",3900},
			{"M4A1 kamuflaż",3900},
			{"M4A1 z tłumikiem",3900},
			{"M4A1 kamuflaż z tłumikiem",3900},
			{"AK-101",3700},
			{"AK-101 z tłumikiem",3700},
			{"AK-101 kamuflaż",3700},
			{"AK-101 kamuflaż z tłumikiem",3700},
			{"AKM",3500},
			{"AKM z tłumikiem",3500},
			{"AKM kamuflaż",3500},
			{"AKM kamuflaż z tłumikiem",3500},
			{"SVD",8000},
			{"SVD kamuflaż",8000},
			{"WSS Wintoriez",7000},
			{"WSS Wintoriez kamuflaż",7000},
			{"AUG",3000},
			{"AUG z tłumikiem",3000},
			{"AK-74",3300},
			{"AK-74 z tłumikiem",3300},	
			{"Mosin–Nagant",8500},
			{"Mosin–Nagant z kamuflażem",8500},	
			{"SKS",8300},
			{"FN FAL",3000},
			{"FN FAL z tłumikiem",3000},	
			{"WINCHESTER M70",5000},
			{"IZH-43",4500},
			{"MP-133",4300},
			{"MP5",1200},
			{"MP5 z tłumikiem",1200},
			{"CZ61 SCORPION",900},
			{"UMP45",900},
			{"M1911",1200},
			{"M1911 z tłumikiem",1200},
			{"GLOCK 19",1100},
			{"GLOCK 19 z tłumikiem",1100},
			{"MAGNUM",1300},
			
			{"Nóż myśliwski",3000},
			{"Topór",4000},
			{"Bejsbol",1000},
			{"Łopata",700},
			{"Kij golfowy",2000},
			{"Piła spalinowa",1000},
			
			--{"Granat dymny",0},
			{"Granat M67",24000},
			
			{"Lornetka",10},
}

clothDamageReduce = {


	
	[3] = {"clothGila",{ 
		["Płaszcz z kamuflażem №1"] = 2,
		["Płaszcz z kamuflażem №2"] = 2,
		["Płaszcz z kamuflażem №3"] = 2,
		} 
	},

	[3] = {"clothBody",{ 
		["Kamizelka z futerału i kieszeniami"] = 25, -- 10
		["Kamizelka wstrząsoodporna"] = 30,
		["Kamizelka PRESS"] = 25,
		--12
		
		["Kamizelka o dużej pojemności - czarna"] = 5,
		["Kamizelka o dużej pojemności - oliwkowa"] = 5,
		["Kamizelka o dużej pojemności"] = 5,
		--8
		["Kamizelka - czarna"] = 5,
		["Kamizelka kamuflaż DPM"] = 5,
		["Kamizelka - oliwkowa"] = 5,
		["Kamizelka - TANK"] = 5,
		
		["Kamizelka PRESS - niebieska"] = 25,
		--8
		["Kamizelka o dużej pojemności №2 - czarna"] = 5,
		["Kamizelka o dużej pojemności №2 - kamuflaż DPM"] = 5,
		["Kamizelka o dużej pojemności №2 - oliwkowa"] = 5,
		["Kamizelka o dużej pojemności №2 - TANK"] = 5,
		
		["Kamizelka zbrojna z kamuflażem - PRESS"] = 25,
		--12
		["Kamizelka o dużej pojemności - oliwkowy kamuflaż"] = 5,
		--16
		["Kamizelka SMERSH"] = 5,
		--8
		["Kamizelka o dużej pojemności - brązowa"] = 5,
		
		["Kamizelka zbrojna z kamuflażem - PRESS №2"] = 25,
		--8
		["Kamizelka zbrojna z kamuflażem №1"] = 5,
		["Kamizelka zbrojna z kamuflażem №2"] = 5,	
		} 
	},
	[1] = {"clothEis",{ 
		["Okulary dizajnerskie"] = 0,
		["Okulary pilotki"] = 0,
		} 
	},
	
	[1] = {"clothHead",{
		["Beret wojskowy - czerwony"] = 2,
		["Beret - czarny"] = 2,
		["Beret ONZ - ciemno niebieski"] = 2,
		["Beret - zielony"] = 2,
		["Beret sił obronnych - beżowy"] = 2,
		
		["Panama - czarna"] = 0,
		["Panama - niebieska"] = 0,
		["Panama kamuflaż DPM"] = 0,
		["Panama kamuflaż DĄB"] = 0,
		["Panama kamuflaż FLECKTARN"] = 0,
		["Panama - błękitna"] = 0,
		["Panama - zielona"] = 0,
		["Panama - pomarańczowa"] = 0,
		["Panama - czerwona"] = 0,
		["Panama - beżowa"] = 0,
		
		["Kaptur z kamuflażem №1"] = 0,
		["Kaptur z kamuflażem №2"] = 0,
		["Kaptur z kamuflażem №3"] = 0,
		
		["Hełm balistyczny - zielony"] = 30,
		["Hełm balistyczny - czarny"] = 30,
		["Hełm balistyczny - niebieski"] = 30,
		
		["Hełm balistyczny z kamuflażem №1"] = 30,
		["Hełm balistyczny z kamuflażem №2"] = 30,
		["Hełm balistyczny z kamuflażem №3"] = 30,
		
		["Hełm militarny - zielony"] = 40,
		["Hełm militarny - czarny"] = 40,
		["Hełm militarny SWAT"] = 40,
		["Hełm militarny z kamuflażem"] = 40,
		
		["Czapka z nausznikami - czarna"] = 0,
		["Czapka z nausznikami - niebieska"] = 0,
		["Czapka z nausznikami - zielona"] = 0,
		
		["Kapelusz kowbojski - brązowy"] = 0,
		["Kapelusz kowbojski - czarny"] = 0,
		["Kapelusz kowbojski - ciemny brąz"] = 0,
		["Kapelusz kowbojski - zielony"] = 0,
		["Kapelusz kowbojski - szary"] = 0,
		["Kapelusz kowbojski - biały"] = 0,
		
		["Czapka z dzianiny - brązowa"] = 0,
		["Czapka z dzianiny - czarna"] = 0,
		["Czapka z dzianiny - niebieska"] = 0,
		["Czapka z dzianiny - ciemno-brązowa"] = 0,
		["Czapka z dzianiny - zielona"] = 0,
		["Czapka z dzianiny - szara"] = 0,
		["Czapka z dzianiny - czerwona"] = 0,
		
		["Beret z daszkiem - ciemna kratka"] = 0,
		["Beret z daszkiem - ciemny"] = 0,
		["Beret z daszkiem - niebieski"] = 0,
		["Beret z daszkiem - brązowa kratka"] = 0,
		["Beret z daszkiem - brązowy"] = 0,
		["Beret z daszkiem - szary"] = 0,
		["Czapka - szara"] = 0,
		["Beret z daszkiem - czerwony"] = 0,	
		
		["Kask - czarny"] = 20,
		["Kask - niebieski"] = 20,
		["Kask - jasno zielony"] = 20,
		["Kask - zielony"] = 20,
		["Kask - pomarańczowy"] = 20,
		["Kask - czerwony"] = 20,
		["Kask - biały"] = 20,
		["Kask - żółty"] = 20,
		
		["Kask strażacki - czarny"] = 25,
		["Kask strażacki - czerwony"] = 25,
		["Kask strażacki - biały"] = 25,
		["Kask strażacki - żółty"] = 25,

		["Hełm pilota - czarny"] = 30,
		["Hełm pilota - biały"] = 30,
		["Hełm pilota - zielony"] = 30,	

		["Husta operacyjna - niebieska"] = 0,
		["Husta operacyjna - zielona"] = 0,
		["Husta operacyjna - biała"] = 0,	
		
		["Czapka oficerska"] = 5,
		["Furażerka"] = 5,
		["Czapka policyjna"] = 5,
		
		["Bejsbolówka №1"] = 0,
		["Bejsbolówka №2"] = 0,
		["Bejsbolówka №3"] = 0,
		["Bejsbolówka №4"] = 0,
		["Bejsbolówka №5"] = 0,
		["Bejsbolówka №6"] = 0,
		["Bejsbolówka №7"] = 0,
		["Bejsbolówka №8"] = 0,
		
		["Chusta z kamuflażem - DĄB"] = 0,
		["Chusta - czarna"] = 0,
		["Chusta - fioletowa"] = 0,
		["Chusta - czerwona"] = 0,
		["Chusta - żółta"] = 0,
		["Chusta - zielona"] = 0,
		
		["Podwijana czapka - czarna"] = 0,
		["Podwijana czapka - brązowa"] = 0,
		["Podwijana czapka - zielona"] = 0,
		["Podwijana czapka - czerwona"] = 0,
		["Podwijana czapka - niebieska"] = 0,
		
		["Pilotka ze słuchawkami"] = 0,
		
		["Czapka z pomponem - czarna"] = 0,
		["Czapka z pomponem - niebieska"] = 0,
		["Czapka z pomponem - brązowa"] = 0,
		["Czapka z pomponem - czerwona"] = 0,
		["Czapka z pomponem - zielona"] = 0,
		
		
		} 
	},
	[1] = {"clothHeadN",{
		["Kominiarka z czaszką - czarna"] = 0,
		["Kominiarka - beżowa"] = 0,
		["Kominiarka - czarna"] = 0,
		["Kominiarka - niebieska"] = 0,
		["Kominiarka - zielona"] = 0,
		["Kominiarka - różowa"] = 0,
		["Kominiarka - biała"] = 0,
		["Kominiarka z kamuflażem"] = 0,
		
		["Maska Dallas"] = 5,
		["Maska Hoxton"] = 5,
		["Maska Wilka"] = 5,
		
		["Maska"] = 5,
		
		["Kask motocyklowy №1"] = 25,
		["Kask motocyklowy №2"] = 25,
		["Kask motocyklowy №3"] = 25,
		["Kask motocyklowy №4"] = 25,
		["Kask motocyklowy №5"] = 25,
		["Kask motocyklowy №6"] = 25,
		["Kask motocyklowy №7"] = 25,
		
		["Bandana - kamuflaż (głęboka)"] = 0,
		["Bandana - czarna"] = 0,
		["Bandana - fioletowa"] = 0,
		["Bandana - czerwona"] = 0,
		["Bandana - żółta"] = 0,
		["Bandana - zielona"] = 0,
		} 
	},
}
clothSlots = {
	["clothGila"] = {
		["Płaszcz z kamuflażem №1"] = true,
		["Płaszcz z kamuflażem №2"] = true,
		["Płaszcz z kamuflażem №3"] = true,
	},
	["clothBody"] = {
		["Kamizelka z futerału i kieszeniami"] = true, -- 10
		["Kamizelka wstrząsoodporna"] = true,
		["Kamizelka PRESS"] = true,
		--12
		["Kamizelka o dużej pojemności - czarna"] = true,
		["Kamizelka o dużej pojemności - oliwkowa"] = true,
		["Kamizelka o dużej pojemności"] = true,
		--8
		["Kamizelka - czarna"] = true,
		["Kamizelka kamuflaż DPM"] = true,
		["Kamizelka - oliwkowa"] = true,
		["Kamizelka - TANK"] = true,
		
		["Kamizelka PRESS - niebieska"] = true,
		--8
		["Kamizelka o dużej pojemności №2 - czarna"] = true,
		["Kamizelka o dużej pojemności №2 - kamuflaż DPM"] = true,
		["Kamizelka o dużej pojemności №2 - oliwkowa"] = true,
		["Kamizelka o dużej pojemności №2 - TANK"] = true,
		
		["Kamizelka zbrojna z kamuflażem - PRESS"] = true,
		--12
		["Kamizelka o dużej pojemności - oliwkowy kamuflaż"] = true,
		--16
		["Kamizelka SMERSH"] = true,
		--8
		["Kamizelka o dużej pojemności - brązowa"] = true,
		
		["Kamizelka zbrojna z kamuflażem - PRESS №2"] = true,
		--8
		["Kamizelka zbrojna z kamuflażem №1"] = true,
		["Kamizelka zbrojna z kamuflażem №2"] = true,	
	},
	
	["clothEis"] = {
		["Okulary dizajnerskie"] = true,
		["Okulary pilotki"] = true,
	},
	
	["clothHead"] = {
		["Beret wojskowy - czerwony"] = true,
		["Beret - czarny"] = true,
		["Beret ONZ - ciemno niebieski"] = true,
		["Beret - zielony"] = true,
		["Beret sił obronnych - beżowy"] = true,
		
		["Panama - czarna"] = true,
		["Panama - niebieska"] = true,
		["Panama kamuflaż DPM"] = true,
		["Panama kamuflaż DĄB"] = true,
		["Panama kamuflaż FLECKTARN"] = true,
		["Panama - błękitna"] = true,
		["Panama - zielona"] = true,
		["Panama - pomarańczowa"] = true,
		["Panama - czerwona"] = true,
		["Panama - beżowa"] = true,
		
		["Kaptur z kamuflażem №1"] = true,
		["Kaptur z kamuflażem №2"] = true,
		["Kaptur z kamuflażem №3"] = true,
		
		["Hełm balistyczny - zielony"] = true,
		["Hełm balistyczny - czarny"] = true,
		["Hełm balistyczny - niebieski"] = true,
		["Hełm balistyczny z kamuflażem №1"] = true,
		["Hełm balistyczny z kamuflażem №2"] = true,
		["Hełm balistyczny z kamuflażem №3"] = true,
		
		["Hełm militarny - zielony"] = true,
		["Hełm militarny - czarny"] = true,
		["Hełm militarny SWAT"] = true,
		["Hełm militarny z kamuflażem"] = true,
		
		["Czapka z nausznikami - czarna"] = true,
		["Czapka z nausznikami - niebieska"] = true,
		["Czapka z nausznikami - zielona"] = true,
		
		["Kapelusz kowbojski - brązowy"] = true,
		["Kapelusz kowbojski - czarny"] = true,
		["Kapelusz kowbojski - ciemny brąz"] = true,
		["Kapelusz kowbojski - zielony"] = true,
		["Kapelusz kowbojski - szary"] = true,
		["Kapelusz kowbojski - biały"] = true,
		
		["Czapka z dzianiny - brązowa"] = true,
		["Czapka z dzianiny - czarna"] = true,
		["Czapka z dzianiny - niebieska"] = true,
		["Czapka z dzianiny - ciemno-brązowa"] = true,
		["Czapka z dzianiny - zielona"] = true,
		["Czapka z dzianiny - szara"] = true,
		["Czapka z dzianiny - czerwona"] = true,
		
		["Beret z daszkiem - ciemna kratka"] = true,
		["Beret z daszkiem - ciemny"] = true,
		["Beret z daszkiem - niebieski"] = true,
		["Beret z daszkiem - brązowa kratka"] = true,
		["Beret z daszkiem - brązowy"] = true,
		["Beret z daszkiem - szary"] = true,
		["Czapka - szara"] = true,
		["Beret z daszkiem - czerwony"] = true,	
		
		["Kask - czarny"] = true,
		["Kask - niebieski"] = true,
		["Kask - jasno zielony"] = true,
		["Kask - zielony"] = true,
		["Kask - pomarańczowy"] = true,
		["Kask - czerwony"] = true,
		["Kask - biały"] = true,
		["Kask - żółty"] = true,
		
		["Kask strażacki - czarny"] = true,
		["Kask strażacki - czerwony"] = true,
		["Kask strażacki - biały"] = true,
		["Kask strażacki - żółty"] = true,	
		
		["Hełm pilota - czarny"] = true,
		["Hełm pilota - biały"] = true,
		["Hełm pilota - zielony"] = true,
		
		["Husta operacyjna - niebieska"] = true,
		["Husta operacyjna - zielona"] = true,
		["Husta operacyjna - biała"] = true,
		
		["Czapka oficerska"] = true,
		["Furażerka"] = true,
		["Czapka policyjna"] = true,
		
		["Bejsbolówka №1"] = true,
		["Bejsbolówka №2"] = true,
		["Bejsbolówka №3"] = true,
		["Bejsbolówka №4"] = true,
		["Bejsbolówka №5"] = true,
		["Bejsbolówka №6"] = true,
		["Bejsbolówka №7"] = true,
		["Bejsbolówka №8"] = true,
		
		["Chusta z kamuflażem - DĄB"] = true,
		["Chusta - czarna"] = true,
		["Chusta - fioletowa"] = true,
		["Chusta - czerwona"] = true,
		["Chusta - żółta"] = true,
		["Chusta - zielona"] = true,
		
		["Podwijana czapka - czarna"] = true,
		["Podwijana czapka - brązowa"] = true,
		["Podwijana czapka - zielona"] = true,
		["Podwijana czapka - czerwona"] = true,
		["Podwijana czapka - niebieska"] = true,
		
		["Pilotka ze słuchawkami"] = true,
		
		["Czapka z pomponem - czarna"] = true,
		["Czapka z pomponem - niebieska"] = true,
		["Czapka z pomponem - brązowa"] = true,
		["Czapka z pomponem - czerwona"] = true,
		["Czapka z pomponem - zielona"] = true,	
		
				
	},
	["clothHeadN"] = {
		["Kominiarka z czaszką - czarna"] = true,
		["Kominiarka - beżowa"] = true,
		["Kominiarka - czarna"] = true,
		["Kominiarka - niebieska"] = true,
		["Kominiarka - zielona"] = true,
		["Kominiarka - różowa"] = true,
		["Kominiarka - biała"] = true,
		["Kominiarka z kamuflażem"] = true,
		
		["Maska Dallas"] = true,
		["Maska Hoxton"] = true,
		["Maska Wilka"] = true,
		
		["Maska"] = true,
		
		["Kask motocyklowy №1"] = true,
		["Kask motocyklowy №2"] = true,
		["Kask motocyklowy №3"] = true,
		["Kask motocyklowy №4"] = true,
		["Kask motocyklowy №5"] = true,
		["Kask motocyklowy №6"] = true,
		["Kask motocyklowy №7"] = true,
		
		["Bandana - kamuflaż (głęboka)"] = true,
		["Bandana - czarna"] = true,
		["Bandana - fioletowa"] = true,
		["Bandana - czerwona"] = true,
		["Bandana - żółta"] = true,
		["Bandana - zielona"] = true,
			
	},
}


function getVehicleMaxFuel(loot)
	local modelID = getElementModel(getElementData(loot,"parent"))
	for i,vehicle in ipairs(vehicleFuelTable) do
		if modelID == vehicle[1] then
			 return vehicle[2]
		end
	end
	return false
end

function getClothDamageReduce (bone)
	if clothDamageReduce[bone] then
		local cloth = getElementData ( localPlayer, clothDamageReduce[bone][1] ) or "no"
		for i, v in pairs ( clothDamageReduce[bone][2] ) do
			if cloth == i then
				return 1-v/100
			end
		end
	end
	return 1
end