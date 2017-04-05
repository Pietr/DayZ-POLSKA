function destroyHeli(col,obj)
	destroyElement(col)
	destroyElement(obj)
end

Hel = {
	["hospital"] = {
		{"M4A1",2414,1,0},
		{"M4A1 kamuflaż",2388,1,0},
		{"M4A1 z tłumikiem",2397,1,0},
		{"M4A1 kamuflaż z tłumikiem",2405,1,0},
		{"SVD",2423,1,0},
		{"SVD kamuflaż",2426,1,0},
		{"WSS Wintoriez",2431,1,0},
		{"WSS Wintoriez kamuflaż",2434,1,0},
       	{"Pieniądze",2245,1,0},
		{"Жилет большой вместимости Зеленый",2179,1,0},
		{"Kominiarka z czaszką - czarna",2294,1,0},
		{"Strój górski - zielony",2223,1,0},
		{"Hełm militarny - zielony",2346,1,0},
		{"Gogle NV",368,1,0},
		{"Lornetka",369,1,0},
		{"Namiot (wojskowy)",2219,1,0},
		{"Gogle IR",369,1,0},
		{"Radio",330,1,0},
		{"Górski plecak z kamuflażem",2099,1,0},
		{"Plecak Tortilla №1",2302,1,0},
		{"Plecak polowy №1",2307,1,0},
		{"Czarny szturmowy",2090,1,0},
		
		{"STANAG",2470,1,0},
		{"AK-MAG",2471,1,0},
		{"AK-DRUM",2472,1,90},
		{"SVD-MAG",2473,1,0},
		{"VSS-MAG",2473,1,0},
		{"MOSIN-CLIP",2474,1,0},

	},
}

spawnPos = {
	["spawn"] = {
		{-529.2587890625,-1519.2554931641,9.6851024627686},
		{2534.1999511719,1569.1999511719,7.6999998092651},
		{1341,2142.8999023438,10.39999961853},
		{1103.4000244141,-342.20001220703,73.400001525879},
		{1239.5999755859,-1653,11.39999961853},
		{398.5,-1531.1999511719,31.700000762939},
		{-2025.3000488281,-812.70001220703,29.700000762939},
		{-2320.8000488281,178.10000610352,34.900001525879},
		{-1844.8000488281,550.09997558594,34.700000762939},
	},
}

function startHeli(playerSource)
local spawn_crash = math.random(1,9)
x,y,z = spawnPos["spawn"][spawn_crash][1],spawnPos["spawn"][spawn_crash][2],spawnPos["spawn"][spawn_crash][3]
local number = math.random(1,9)
	if number == 1 then
	heliObject = createObject(2236,x+math.random(500,1000),y+math.random(500,1000),z+300)
	elseif number == 2 then	
	heliObject = createObject(2237,x-math.random(500,1000),y-math.random(500,1000),z+300)
	elseif number == 3 then	
	heliObject = createObject(2461,x-math.random(500,1000),y-math.random(500,1000),z+300)
	elseif number == 4 then	
	heliObject = createObject(2462,x-math.random(500,1000),y-math.random(500,1000),z+300)
	elseif number == 5 then	
	heliObject = createObject(2240,x-math.random(500,1000),y-math.random(500,1000),z+300)
	elseif number == 6 then	
	heliObject = createObject(2241,x-math.random(500,1000),y-math.random(500,1000),z+300)
	elseif number == 7 then	
	heliObject = createObject(2242,x-math.random(500,1000),y-math.random(500,1000),z+300)
	elseif number == 8 then	
	heliObject = createObject(2243,x-math.random(500,1000),y-math.random(500,1000),z+300)
	elseif number == 9 then	
	heliObject = createObject(2244,x-math.random(500,1000),y-math.random(500,1000),z+300)
	end
local heliCol = createColSphere(x,y,z,4)
itemDataTable = {}

setElementData(heliCol,"parent",heliObject)
setElementData(heliCol,"hospitalbox",true)
setElementData(heliCol,"MAX_Slots",100)
for _,items in ipairs(Hel["hospital"]) do
local randomNumber = math.random(1,5)
if randomNumber >= 2 then
setElementData(heliCol,items[1],math.random(1,2))
end
end	


local heliBlib = createBlip(x+1000,y,z+150,0)
local rx,ry,rz = getElementRotation(heliObject)
local timeCrash = 8000
attachElements (heliBlib,heliObject,0,0,0)
attachElements (heliCol,heliObject,0,0,0)
	rot = 0
	heliTimer = setTimer(
		function()
			stopObject(heliObject)
			if timeCrash >= 3000 then
				rot = rot + 5
			elseif timeCrash < 3000 then
				rot = rot + 0.01
			end
			timeCrash = timeCrash-100
			moveObject(heliObject,timeCrash,x+2,y,z-1,rx,ry,rot)
			hx,hy,hz = getElementPosition(heliObject)
			if hx == (x+2) and hy == y and hz == (z-1) then
				if isTimer(heliTimer) then
					createExplosion ( hx,hy,hz,7)
					createExplosion ( hx+1,hy,hz+1,7)
					killTimer(heliTimer)
				end
			end
		end,100,0,heliObject,rx,ry,rz,x,y,z)

setTimer(destroyHeli,7200000,1,heliCol,heliObject)
setTimer(destroyHeli,7200000,1,heliBlib,heliObject)

end
setTimer(startHeli,7200000,0)
addCommandHandler ( "pWUzp-fg7pF-5DHrg-oG3As-NvA0L", startHeli)