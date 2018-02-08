local wx, hy = guiGetScreenSize()
local gpsX = 203
local gpsY = 188
local mapSizeX = 170
local mapSizeY = 121
local mapX = -6.00
local mapY = hy-gpsY- -1
local playerX = mapX+104
local playerY = mapY-20.5
local playerSizeX = 25
local playerSizeY = 25

--Бинокль
local textures = {};

local function render_crosshair ()
	local screenw, screenh = guiGetScreenSize ();
	local s = screenw * 0.5;
	local u,v = (screenw - s)*0.2, (screenh - s)*0.2;
	local black = tocolor (0, 0, 0, 255);

	dxDrawRectangle (0, 0, screenw, v, black);
	dxDrawRectangle (0, 0, u, screenh, black);
	dxDrawRectangle (0, screenh, screenw, -v, black);
	dxDrawRectangle (screenw, screenh, -u, -screenh, black);
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["crosshair"]);
end;

local function on_weapon_aimed (key, state)
	local weapon_binocular = 43;
	if getPedWeapon (getLocalPlayer ()) == weapon_binocular then
		if state == "down" then
			showPlayerHudComponent ("crosshair", false)
			addEventHandler ("onClientHUDRender", getRootElement (), render_crosshair);
			toggleControl ("fire", false)
			showChat(false)
		else
			removeEventHandler ("onClientHUDRender", getRootElement (), render_crosshair);
			showChat(true)
			toggleControl ("fire", true)
		end;
	end;
end;

addEventHandler ("onClientResourceStart", getResourceRootElement (getThisResource ()),
function ()
	textures ["crosshair"] = dxCreateTexture ("images/binoculars.png", "argb", true, "wrap");
	if not textures ["crosshair"] then
		return;
	end;
	bindKey ("aim_weapon", "both", on_weapon_aimed);
	addEventHandler ("onClientPlayerWeaponSwitch", getRootElement (),
	function (previousWeaponSlot)
		local weaponslot_type_binocular = 9;
		if previousWeaponSlot == weaponslot_type_binocular then
			if not isPlayerHudComponentVisible ("crosshair") then
				showPlayerHudComponent ("crosshair", true);
				showChat(true)
				toggleControl ("fire", true)
		end;
	end;
end);

addEventHandler ("onClientResourceStop", getResourceRootElement (getThisResource ()),
function ()
unbindKey ("aim_weapon", "both", on_weapon_aimed);
showChat(true)
toggleControl ("fire", true)
if not isPlayerHudComponentVisible ("crosshair") then
showPlayerHudComponent ("crosshair", true);
end;
end);
end);
----



function rangeFinder()
local w, h = guiGetScreenSize ()
local tx, ty, tz = getWorldFromScreenPosition ( w/2, h/2, 500 )
local px, py, pz = getPedBonePosition(localPlayer,8)
hit, x, y, z, elementHit = processLineOfSight ( px, py, pz, tx, ty, tz )
	if getPedWeapon(localPlayer) == 43 and getElementData(localPlayer,"currentweapon_3") == "Lornetka" then
		if getControlState("aim_weapon") then
			if x and y and z then
				local distance = getDistanceBetweenPoints3D(px,py,pz,x,y,z)
				dxDrawText(tostring(math.floor(distance)).."M",w/2-49,h/2,w,h,tocolor(0,0,0,220),1,"sans")
				dxDrawText(tostring(math.floor(distance)).."M",w/2-50,h/2,w,h,tocolor(255,255,255,220),1,"sans")
			else
				local distance = 500
				dxDrawText("+"..tostring(math.floor(distance)).."M",w/2-49,h/2,w,h,tocolor(0,0,0,220),1,"sans")
				dxDrawText("+"..tostring(math.floor(distance)).."M",w/2-50,h/2,w,h,tocolor(255,255,255,220),1,"sans")
			end
		end
	end
end
addEventHandler("onClientRender",root,rangeFinder)




addEventHandler("onClientResourceStart", getResourceRootElement(),function()
	showPlayerHudComponent ("radar",false)
	xsize = mapSizeX+180
	rr = dxCreateRenderTarget(xsize,xsize,true)
	rr2 = dxCreateRenderTarget(xsize,xsize,true)
	centerleft = xsize / 2
	centertop = mapSizeY / 2
	blipsize = 16
end)


playerTexture = dxCreateTexture ("images/GPS/player.png","argb",true,"clamp")
mapTexture = dxCreateTexture ("images/GPS/radar.jpg","argb",true,"clamp")
gpsTexture = dxCreateTexture ("images/GPS/gps.png","argb",true,"clamp")


addEventHandler("onClientResourceStart", getResourceRootElement(),
function()
	versionLabel = guiCreateLabel(1,1,0.3,0.3,"DayZ-POLSKA",true)
	guiSetSize(versionLabel, guiLabelGetTextExtent ( versionLabel ), guiLabelGetFontHeight ( versionLabel ), false )
	x,y = guiGetSize(versionLabel,true)
	guiSetPosition( versionLabel, 1-x, 1-y*1.8, true )
	guiSetAlpha(versionLabel,0.5)

	versionLabel2 = guiCreateLabel(1,1,0.3,0.3,"".. string.sub(getPlayerSerial(getLocalPlayer()), 27) .."",true)
	guiSetSize(versionLabel2, guiLabelGetTextExtent ( versionLabel2 ), guiLabelGetFontHeight ( versionLabel2 ), false )
	x,y = guiGetSize(versionLabel2,true)
	guiSetPosition(versionLabel2, 1-x, 1-y*2.6, true )
	guiSetAlpha(versionLabel2,0.5)

end)

setPedTargetingMarkerEnabled(false)
function playerStatsClientSite()
	if getElementData(getLocalPlayer(),"logedin") then
		toggleControl ("radar",false)
		showPlayerHudComponent("clock",false)
		showPlayerHudComponent("radar",false)
		showPlayerHudComponent("money",false)
		showPlayerHudComponent("health",false)
		showPlayerHudComponent("weapon",false)
		showPlayerHudComponent("ammo",false)
		showPlayerHudComponent("breath",false)
		setPlayerHudComponentVisible("area_name",false)
		setPlayerHudComponentVisible("vehicle_name",false)
		 --if getElementData(getLocalPlayer(),"Mapa") >= 1  then
			--toggleControl ("radar",true)
		--end
	end
end
setTimer(playerStatsClientSite,1000,0)
--Исправление стелс убийства ножом (в survivalSystem_client)
function killKnifeStelth(targetPlayer)
if isElement(targetPlayer) and isElement(source) then
if not getElementData(targetPlayer,"bandit") then
setElementData(source,"murders",getElementData(source,"murders") + 1)
else
setElementData(source,"banditskilled",getElementData(source,"banditskilled") + 1)
end
setElementData(targetPlayer,"blood",-3)
end
end
addEventHandler("onClientPlayerStealthKill",getRootElement(),killKnifeStelth)


nightvisionimage = guiCreateStaticImage(0,0,1,1,"images/nightvision.png",true)
guiSetVisible(nightvisionimage,false)

infravision = guiCreateStaticImage(0,0,1,1,"images/infravision.png",true)
guiSetVisible(infravision,false)

function playerZoom (key,keyState)
	if key == "n" then
		if getElementData(getLocalPlayer(),"Gogle NV") >= 1 then
			if nightvision then

				guiSetVisible(nightvisionimage,false)
				guiSetVisible(infravision,false)

				nightvision = false
				setCameraGoggleEffect("normal")
			else
				nightvision = true

				guiSetVisible(nightvisionimage,true)
				guiSetVisible(infravision,false)

				setCameraGoggleEffect("nightvision")
			end
		end
	elseif key == "i" then
		if getElementData(getLocalPlayer(),"Gogle IR") >= 1 then
			if infaredvision then
				infaredvision = false

				guiSetVisible(infravision,false)
				guiSetVisible(nightvisionimage,false)

				setCameraGoggleEffect("normal")
			else
				 infaredvision = true

				 guiSetVisible(infravision,true)
				 guiSetVisible(nightvisionimage,false)

				setCameraGoggleEffect("thermalvision")
			end
		end
	end
end
bindKey("n","down",playerZoom)
bindKey("i","up",playerZoom)



function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function getWeaponAmmoType (weaponName)
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[1] then
			return weaponData[1],weaponData[2]
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
end

function getWeaponDamage (weapon)
	for i,weapon2 in ipairs(damageTable) do
		local t,weapon1 = getWeaponAmmoType(weapon2[1])
		if weapon1 == weapon then
			if getElementData(getLocalPlayer(),"humanity") == 5000 then
				if weapon2[1] == "M1911" or weapon2[1] == "M1911 z tłumikiem" or weapon2[1] == "GLOCK 19" or weapon2[1] == "GLOCK 19 z tłumikiem" or weapon2[1] == "MAGNUM" then
					return weapon2[2]*0.3
				end
			end
			return weapon2[2]
		end
	end
end

clothBody = {
		{"Kamizelka z futerału i kieszeniami",0.55},
		{"Kamizelka wstrząsoodporna",0.65},
		{"Kamizelka PRESS",0.65},
		{"Kamizelka PRESS - niebieska",0.75},
		{"Kamizelka zbrojna z kamuflażem - PRESS",0.75},
		{"Kamizelka zbrojna z kamuflażem - PRESS №2",0.75},
}


clothHead = {

		{"Hełm balistyczny - zielony",0.55},
		{"Hełm balistyczny - czarny",0.55},
		{"Hełm balistyczny - niebieski",0.55},
		{"Hełm balistyczny z kamuflażem №1",0.55},
		{"Hełm balistyczny z kamuflażem №2",0.55},
		{"Hełm balistyczny z kamuflażem №3",0.55},
		{"Hełm militarny - zielony",0.55},
		{"Hełm militarny - czarny",0.55},
		{"Hełm militarny SWAT",0.55},
		{"Hełm militarny z kamuflażem",0.55},
		{"Kask - czarny",0.65},
		{"Kask - niebieski",0.65},
		{"Kask - jasno zielony",0.65},
		{"Kask - zielony",0.65},
		{"Kask - pomarańczowy",0.65},
		{"Kask - czerwony",0.65},
		{"Kask - biały",0.65},
		{"Kask - żółty",0.65},
		{"Kask strażacki - czarny",0.55},
		{"Kask strażacki - czerwony",0.55},
		{"Kask strażacki - biały",0.55},
		{"Kask strażacki - żółty",0.55},
		{"Hełm pilota - czarny",0.65},
		{"Hełm pilota - biały",0.65},
		{"Hełm pilota - zielony",0.65},
}

function playerGetDamageDayZ ( attacker, weapon, bodypart, loss )
	cancelEvent()
	damage = 100
	headshot = false
	if weapon == 37 then
		return
	end
--Урон Зомби
	if attacker and getElementData(attacker,"zombie") then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-(getElementData(attacker,"damage") or 800))
		local number = math.random(1,7)
		if number == 4 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
		if getElementData(getLocalPlayer(), "infection_zom") == 0 then
		local aleatory = math.random(1,15)
        if aleatory == 3 then
        setElementData(getLocalPlayer(), "infection_zom", 1)
		end
		end
		if getElementData(getLocalPlayer(), "infection_zom") == 1 then
		local aleatory = math.random(1,20)
        if aleatory == 3 then
        setElementData(getLocalPlayer(), "infection_zom", 2)
		end
		end
		if getElementData(getLocalPlayer(), "infection_zom") == 2 then
		local aleatory = math.random(1,25)
        if aleatory == 3 then
        setElementData(getLocalPlayer(), "infection_zom", 3)
		end
		end
	end

	--Урон ведмедя
	if attacker and getElementData(attacker,"bear") then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-(getElementData(attacker,"damage") or 800))
		local number = math.random(1,2)
		if number == 2 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
	end
	--Урон вовк
	if attacker and getElementData(attacker,"wolf") then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-(getElementData(attacker,"damage") or 800))
		local number = math.random(1,4)
		if number == 2 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
	end
	--Урон лисиця
	if attacker and getElementData(attacker,"fox") then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-(getElementData(attacker,"damage") or 800))
		local number = math.random(1,5)
		if number == 2 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
	end
	--Кровосос
	if attacker and getElementData(attacker,"boss_blood") then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-(getElementData(attacker,"damage") or 800))
		local number = math.random(1,2)
		if number == 2 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
	end
		--Всі боси
	if attacker and getElementData(attacker,"boss_all") then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-(getElementData(attacker,"damage") or 800))
		local number = math.random(1,5)
		if number == 2 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
	end

	--Всі боси
	if attacker and getElementData(attacker,"bot") then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-(getElementData(attacker,"damage") or 800))
		local number = math.random(1,5)
		if number == 2 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
	end
	--Мина
	if not attacker and weapon == 16 then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-28104)
		return true
	end
	if weapon == 49 then
		if loss > 30 then
			setElementData(getLocalPlayer(),"brokenbone",true)
			setControlState ("jump",true)
			setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.floor(loss*10))
		end
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.floor(loss*5))
	elseif weapon == 63 or weapon == 51 or weapon == 19 then
		setElementData(getLocalPlayer(),"blood",0)
		if getElementData(getLocalPlayer(),"blood") <= 0 then
			if not getElementData(getLocalPlayer(),"isDead") == true then
				triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),attacker,headshot)
			end
		end
	elseif weapon and weapon > 1 and attacker and getElementType(attacker) == "player" and weapon ~= 17 then
		local number = math.random(1,8)
		if number >= 6 or number <= 8 then
			setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
		end
		local number = math.random(1,7)
		if number == 2 then
			setElementData(getLocalPlayer(),"pain",true)
		end



		damage = getWeaponDamage (weapon)

		if bodypart == 3 then
			for _, add in ipairs(clothBody) do
				if getElementData ( getLocalPlayer(), "clothBody" ) == add[1] then
					damage = damage*add[2]
				end
			end
		end

		--[[if bodypart == 9 then
			damage = damage*1.5
			headshot = true
		end
		]]

		if bodypart == 9 then
			for _, add in ipairs(clothHead) do
				if getElementData ( getLocalPlayer(), "clothHead" ) == add[1] then
					damage = damage*add[2]
				else
					headshot = true
					setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-getElementData(getLocalPlayer(),"blood"))
				end
			end
		end



		if bodypart == 7 or bodypart == 8 then
			setElementData(getLocalPlayer(),"brokenbone",true)
		end
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(damage*0.75,damage*1.25))

		if not getElementData(getLocalPlayer(),"bandit") then
			setElementData(attacker,"humanity",getElementData(attacker,"humanity")-math.random(40,200))
			if getElementData(attacker,"humanity") < 0 then
				setElementData(attacker,"bandit",true)
			end
		else
			setElementData(attacker,"humanity",getElementData(attacker,"humanity")+math.random(40,200))
			if getElementData(attacker,"humanity") > 5000 then
				setElementData(attacker,"humanity",5000)
			end
			if getElementData(attacker,"humanity") > 2000 then
				setElementData(attacker,"bandit",false)
			end
		end
		if getElementData(getLocalPlayer(),"blood") <= 0 then
			if not getElementData(getLocalPlayer(),"isDead") then
				triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),attacker,headshot,getWeaponNameFromID (weapon))
				setElementData(getLocalPlayer(),"isDead",true)
			end
		end
	elseif weapon == 54 or weapon == 63 or weapon == 49 or weapon == 51 then
		setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(100,1000))
		local number = math.random(1,5)
		if loss > 30 then
			setElementData(getLocalPlayer(),"brokenbone",true)
			setControlState ("jump",true)
		end
		if loss >= 100 then
			setElementData(getLocalPlayer(),"blood",49)
			setElementData(getLocalPlayer(),"bleeding",50)
		end
		local number = math.random(1,11)
		if number == 3 then
			setElementData(getLocalPlayer(),"pain",true)
		end
		-- Урон от кулаков
		if weapon == 0 and getElementType(attacker) == "player" then
			damage = 400
			setElementData(localPlayer,"blood",getElementData(localPlayer,"blood")-damage)
		end
		--[[Урон от транспорт
		if getElementType(attacker) == "vehicle" then
			local attack = getVehicleOccupant(attacker)
			if attack ~= localPlayer then
				damage = 24000
				setElementData(localPlayer,"blood",getElementData(localPlayer,"blood")-damage)
			end
		end]]
		if getElementData(getLocalPlayer(),"blood") <= 0 then
			if not getElementData(getLocalPlayer(),"isDead") == true then
				triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),attacker,headshot,getWeaponNameFromID (weapon))
				setElementData(getLocalPlayer(),"isDead",true)
			end
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer (), playerGetDamageDayZ )





function pedGetDamageDayZ ( attacker, weapon, bodypart, loss )
	cancelEvent()
	if attacker and getElementType(attacker) == "vehicle" then
		speedx, speedy, speedz = getElementVelocity ( attacker )
		actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)
		kmh = actualspeed * 180
		if kmh >= 20 then
			local vehkiller = getVehicleOccupant ( attacker )
			setElementData(source,"blood",0)
			if getElementData(source,"blood") <= 0 then
				triggerServerEvent("onZombieGetsKilled",source,vehkiller)
			end
		end
	end

	if attacker and attacker == getLocalPlayer() then
		damage = 100
		if weapon == 37 then
			return
		end
		if weapon == 63 or weapon == 51 or weapon == 19 then
			setElementData(source,"blood",0)
			if getElementData(source,"blood") <= 0 then
				killPed ( source, attacker, weapon, bodypart )
			end
		elseif weapon and weapon > 1 and attacker and getElementType(attacker) == "player" then
			damage = getWeaponDamage (weapon)
			if bodypart == 9 then
				headshot = true
				setElementData(source,"blood",getElementData(source,"blood")-getElementData(source,"blood"))
			end
			setElementData(source,"blood",getElementData(source,"blood")-math.random(damage*0.95,damage*1.25))
			if getElementData(source,"blood") <= 0 then
				triggerServerEvent("onZombieGetsKilled",source,attacker,headshot)
			end
		end
	end
end
addEventHandler ( "onClientPedDamage", getRootElement(), pedGetDamageDayZ )

function checkStats()
	if getElementData(getLocalPlayer(),"logedin") then
		if getElementData(getLocalPlayer(),"bleeding") > 20 then
			setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-getElementData(getLocalPlayer(),"bleeding"))
		else
			setElementData(getLocalPlayer(),"bleeding",0)
		end
		if getElementData(getLocalPlayer(),"blood") < 0 then
			if not getElementData(getLocalPlayer(),"isDead") then
				triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),false,false)
			end
		end
	end
end
setTimer(checkStats,3000,0)

function createBloodForBleedingPlayers ()
	if getElementData(getLocalPlayer(),"logedin") then
	local x,y,z = getElementPosition(getLocalPlayer())
		for i,player in ipairs(getElementsByType("player")) do
			local bleeding = getElementData(player,"bleeding") or 0
			if bleeding > 0 then
				local px,py,pz = getPedBonePosition (player,3)
				local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
				if bleeding > 600 then
					number = 5
				elseif bleeding > 300 then
					number = 3
				elseif bleeding > 100 then
					number = 1
				else
					number = 0
				end
				if pdistance <= 120 then
					fxAddBlood ( px,py,pz,0,0,0,number, 1 )
				end
			end
		end
	end
end
setTimer(createBloodForBleedingPlayers,300,0)

function checkBrokenbone()
	if getElementData(getLocalPlayer(),"logedin") then
		if getElementData(getLocalPlayer(),"brokenbone") then
			toggleControl ( "jump", false )
			toggleControl ( "sprint", false )
		else
			toggleControl ( "jump", true )
			toggleControl ( "sprint", true )
		end
	end
end
setTimer(checkBrokenbone,1400,0)

function setPain()
	if getElementData(getLocalPlayer(),"logedin") then
		if getElementData(getLocalPlayer(),"pain") then
			local x,y,z = getElementPosition(getLocalPlayer())
			createExplosion (x,y,z+15,8,false,1.0,false)
			local x, y, z, lx, ly, lz = getCameraMatrix()
			x, lx = x + 1, lx + 1
			setCameraMatrix(x,y,z,lx,ly,lz)
			setCameraTarget (getLocalPlayer())
		end
	end
end
setTimer(setPain,1500,0)

function checkCold()
	if getElementData(getLocalPlayer(),"logedin") then
		if getElementData(getLocalPlayer(),"temperature") <= 34 then
			setElementData(getLocalPlayer(),"cold",true)
			setElementData(getLocalPlayer(), "grip",1)
		end
	end
end
setTimer(checkCold,3000,0)

function setCold()
	if getElementData(getLocalPlayer(),"logedin") then
		if getElementData(getLocalPlayer(),"cold") then
			local x,y,z = getElementPosition(getLocalPlayer())
			createExplosion (x,y,z+15,8,false,0.5,false)
			local x, y, z, lx, ly, lz = getCameraMatrix() -- Get the current location and lookat of camera
		end
	end
end
setTimer(setCold,1500,0)

function checkPlayerSickness ()
if getElementData(getLocalPlayer(),"logedin") then
	if getElementData(getLocalPlayer(),"sick") == 60 then
			setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(123,185))
		end
	end
end
setTimer ( checkPlayerSickness, 5000,0)

function checkInfection1()
if getElementData(getLocalPlayer(),"logedin") then
    if getElementData(getLocalPlayer(),"infection_zom") == 1 then
	   setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(232,481))
    end
  end
end
setTimer(checkInfection1,15000,0)

function checkInfection2()
if getElementData(getLocalPlayer(),"logedin") then
    if getElementData(getLocalPlayer(),"infection_zom") == 2 then
	   setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(431,683))
    end
  end
end
setTimer(checkInfection2,25000,0)

function checkInfection3()
if getElementData(getLocalPlayer(),"logedin") then
    if getElementData(getLocalPlayer(),"infection_zom") == 3 then
	   setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(732,981))
    end
  end
end
setTimer(checkInfection3,35000,0)

function infectionSound()
    if getElementData(getLocalPlayer(), "logedin") then
		local x, y, z = getElementPosition ( getLocalPlayer ( ) )
        if getElementData(getLocalPlayer(),"infection_zom") >= 1 then
		local soun = math.random(0,2)
		cough = playSound3D("sounds/cough_"..soun..".ogg", x, y, z, false)
		setSoundMaxDistance(cough,20)

        end
    end
end
setTimer (infectionSound,30000, 0)

setTimer(function()
    if getElementData(getLocalPlayer(),"logedin") then
		if getElementData(getLocalPlayer(),"grip") == 1 then
			setPedAnimation(getLocalPlayer(),"FOOD","EAT_Vomit_P")
			local x,y,z = getElementPosition(getLocalPlayer())

			local sound = playSound3D("sounds/sneezing.mp3",x,y,z,false)
			setSoundMaxDistance(sound,20)
			setTimer(function()
				setPedAnimation(getLocalPlayer())
			end,1000,1)
		end
    end
end,90000,0)
--[[
function checkPlayerSickness ()
if getElementData(getLocalPlayer(),"logedin") then
			setElementData(getLocalPlayer(),"sick",getElementData(getLocalPlayer(),"sick")-1)
		end
	end
setTimer ( checkPlayerSickness, 300000,0)
]]
playTrapSoundClient = function()
            local x,y,z = getElementPosition ( source )
            local trap = playSound3D ( "sounds/trap.ogg", x, y, z,false)
			setSoundMaxDistance(trap,20)
 end
 addEvent("playTrapSound", true)
 addEventHandler("playTrapSound", getRootElement(), playTrapSoundClient)

function playTrapSound_voul()
    if getElementData(getLocalPlayer(), "logedin") then
        local x,y,z = getElementPosition ( source )
		local voul = math.random(0,4)
		voul = playSound3D("sounds/scream_short_"..voul..".ogg", x, y, z, false)
		setSoundMaxDistance(voul,20)
		local animR = math.random(1,4)
		if animR == 1 then
		setPedAnimation(getLocalPlayer(), "ped", "KO_shot_face")
		elseif animR == 2  then
		setPedAnimation(getLocalPlayer(), "CRACK", "crckdeth3")
		elseif animR == 3  then
		setPedAnimation(getLocalPlayer(), "ped", "KO_shot_stom")
		elseif animR == 4  then
        setPedAnimation(getLocalPlayer(), "CRACK", "crckdeth2")
        end
		setTimer(function()
		setPedAnimation(getLocalPlayer())
		end,2000,1)
    end
	end
addEvent("playTrapSound_voul", true)
addEventHandler("playTrapSound_voul", getRootElement(),playTrapSound_voul)



local screenWidth,screenHeight = guiGetScreenSize()
function updateIcons ()
	if getElementData(getLocalPlayer(),"logedin") then
		--Nametags
		local x,y,z = getElementPosition(getLocalPlayer())
		for i,player in ipairs(getElementsByType("player")) do
			setPlayerNametagShowing ( player, false )
			if player ~= getLocalPlayer() then
			local vehicle = getPedOccupiedVehicle(player)
				local px,py,pz = getElementPosition (player)
				local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
				if pdistance <= 2 then
					--Get screenposition
					local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.95, 0.06 )
					if sx and sy then
					--Draw Игровой ник
					if getElementData(player,"bandit") then
						text = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' ).." (BANDYTA)"
					else
						text = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' )
					end
					local w = dxGetTextWidth(text,1.02,"default-bold")
					dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 255, 255, 255, 200 ), 1.02, "default-bold" )
					end
				end
			end
		end
		if not playerTarget then return end
		local x,y,z = getElementPosition(playerTarget)
		local x,y,distance = getScreenFromWorldPosition (x,y,z+0.5)
		distance = 20
		if getElementData(playerTarget,"bandit") then
			text = string.gsub(getPlayerName(playerTarget), '#%x%x%x%x%x%x', '' ).." (BANDYTA)"
		else
			text = string.gsub(getPlayerName(playerTarget), '#%x%x%x%x%x%x', '' )
		end
		local w = dxGetTextWidth(text,distance*0.033,"default-bold")
		--dxDrawText (text,x-(w/2),y,x-(w/2), y, tocolor (  255, 255, 255, 200 ), distance*0.033, "default-bold" )
	end
end
addEventHandler ( "onClientRender", getRootElement(), updateIcons )

playerTarget = false
function targetingActivated ( target )
	if ( target ) and getElementType(target) == "player" then
		playerTarget = target
	else
		playerTarget = false
	end
end
addEventHandler ( "onClientPlayerTarget", getRootElement(), targetingActivated )

function dayZDeathInfo()
    fadeCamera(false, 1.0, 0, 0, 0 )
    showDayZDeathScreen()
    if isElement(comaBackground) then
        destroyElement(comaBackground)
    end
    setTimer(function()
        guiSetText(deadText, "Odrodzisz się za 10 sekund.")
        local number = 10
        setTimer(function()
            number = number-1
            guiSetText(deadText, "Odrodzisz się za "..number.." sekund.")
            if number < 1 then
                guiSetVisible(deadBackground,false)
                if isElement(deadBackground) then
                    destroyElement(deadBackground)
                end
            end
        end, 1000, 10)
    end,5000,1)
end
addEvent("onClientPlayerDeathInfo",true)
addEventHandler("onClientPlayerDeathInfo",getRootElement(),dayZDeathInfo)

function showDayZDeathScreen()
    fadeCamera(true, 1.5)
    deadBackground = guiCreateStaticImage(0,0,1,1,"images/dead.jpg",true)
    deadText = guiCreateLabel(0,0.8,1,0.2,"Zginąłeś!",true,deadBackground)
    guiLabelSetHorizontalAlign(deadText, "center", false)
    guiLabelSetVerticalAlign(deadText, "center")
	guiLabelSetColor ( deadText, 249,60,4 )
end
--[[
function showWhiteScreen ( attacker, weapon, bodypart )
if weapon ~= 17 then
whitescreen = guiCreateStaticImage(0,0,1,1,"images/white.png",true)
setTimer(destroyElement,1000,1,whitescreen)
end
end
]]
theTexts = {}
theTextTimer = {}
function startRollMessage(text, r, g, b)
	if #theTexts == 4 then
		destroyTextItem()
	end
	table.insert(theTexts,{text,r,g,b})
	checkTimers()
end
addEvent("onRollMessageStart", true)
addEventHandler("onRollMessageStart", getLocalPlayer(), startRollMessage)

function startRollMessage2(head,text, r, g, b)
	if #theTexts == 4 then
		destroyTextItem()
	end
	table.insert(theTexts,{text,r,g,b})
	checkTimers()
end
addEvent("displayClientInfo", true)
addEventHandler("displayClientInfo", getLocalPlayer(), startRollMessage2)

function destroyTextItem ()
	table.remove(theTexts,1)
end

function checkTimers ()
	if isTimer(theTextTimer["destroy"]) then
		killTimer(theTextTimer["destroy"])
	end
	theTextTimer["destroy"] = setTimer(destroyTextItem,7000,4)
end

local screenWidth, screenHeight = guiGetScreenSize()
local boxSpace = dxGetFontHeight(1,"default-bold")+dxGetFontHeight(1,"default-bold")*0.3

addEventHandler("onClientRender", getRootElement(),
function()
	for id, value in pairs(theTexts) do
		dxDrawingColorText(value[1],screenWidth*0.30125, screenHeight-id*boxSpace+0.998, screenWidth*0.7, screenHeight-(id-1)*boxSpace, tocolor(0,0,0,255),170, 1.0, "sans", "center", "center")
		dxDrawingColorText(value[1],screenWidth*0.3, screenHeight-id*boxSpace, screenWidth*0.7, screenHeight-(id-1)*boxSpace, tocolor(255,255,255,255),170, 1.0, "sans", "center", "center")
	end
end)

function setVolume()
	value = 0
	if getPedMoveState (getLocalPlayer()) == "stand" then
		value = 0
	elseif getPedMoveState (getLocalPlayer()) == "walk" then
		value = 20
	elseif getPedMoveState (getLocalPlayer()) == "powerwalk" then
		value = 40
	elseif getPedMoveState (getLocalPlayer()) == "jog" then
		value = 80
	elseif getPedMoveState (getLocalPlayer()) == "sprint" then
		value = 100
	elseif getPedMoveState (getLocalPlayer()) == "crouch" then
		value = 0
	elseif not getPedMoveState (getLocalPlayer()) then
		value = 20
	end
	if isPedInVehicle (getLocalPlayer()) then
		value = 100
	end
	if value > 100 then
		value = 100
	end
	setElementData(getLocalPlayer(),"volume",value)
end
setTimer(setVolume,300,0)

function setVisibility()
	value = 0
	if getPedMoveState (getLocalPlayer()) == "stand" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "walk" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "powerwalk" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "jog" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "sprint" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "crouch" then
		value = 20
	elseif not getPedMoveState (getLocalPlayer()) then
		value = 20
	end
	if isPedInVehicle (getLocalPlayer()) then
		value = 0
	end
	setElementData(getLocalPlayer(),"visibly",value)
end
setTimer(setVisibility,300,0)

bindKey("aim_weapon","both",function (_,state)
	if getPedWeaponSlot(getLocalPlayer()) == 6 and getElementData(getLocalPlayer(),"selectedWeapon") ~= "Lee Enfield" or getPedWeaponSlot(getLocalPlayer()) == 9 then
		if state == "down" then
			alpha = 0
		elseif state == "up" then
			alpha = 255
		end
		for i,v in pairs (clothSlots) do
			local object = getElementData(getLocalPlayer(),i.."Object" )
			if object and isElement ( object ) then
				setElementAlpha ( object, alpha )
			end
		end
	end
end)

local weaponObject = {
	["2423"] = true,
	["2426"] = true,
	["2431"] = true,
	["2434"] = true,
	["2439"] = true,
	["2441"] = true,
	["2444"] = true,
	["2266"] = true,
	}

local weaponObject2 = {
	["1731"] = true,
	["1712"] = true,

}

bindKey("aim_weapon","both",function (_,state)
	if getPedWeaponSlot(getLocalPlayer()) == 6 or getPedWeaponSlot(getLocalPlayer()) == 9 then
		if state == "down" then
			alpha = 0
		elseif state == "up" then
			alpha = 255
		end
		for _, obj in ipairs(getElementsByType ("object",root,true)) do
			if isElementAttachedToBone(obj) then
				local id = getElementModel(obj)
				if weaponObject[""..tostring(id)] then
					setElementAlpha(obj,alpha)
					break
				end
			end
		end
	end
end)


bindKey("aim_weapon","both",function (_,state)
	if getPedWeaponSlot(getLocalPlayer()) == 6 or getPedWeaponSlot(getLocalPlayer()) == 9 then
		if state == "down" then
			alpha = 0
		elseif state == "up" then
			alpha = 255
		end
		for _, obj in ipairs(getElementsByType ("object",root,true)) do
			if isElementAttachedToBone(obj) then
				local id = getElementModel(obj)
				if weaponObject2[""..tostring(id)] then
					setElementAlpha(obj,alpha)
					break
				end

			end
		end
	end
end)

local details = {
	{"Tire_inVehicle"},
	{"Engine_inVehicle"},
	{"Parts_inVehicle"},
}

--[[ Сситема поломки деталей
addEventHandler("onClientVehicleDamage",getRootElement(),function(attacker,weapon,loss,x,y,z,tyre)
	cancelEvent()
	local parent = getElementData(source,"parent")
	if getElementData(parent,"vehicle_armor") > 0 then
		if getElementData(parent,"vehicle_armor")-loss < 1 then
			local hp = math.floor(getElementData(parent,"vehicle_armor") - loss)
			if hp < 0 then hp = hp * -1 end
			setElementHealth(source,getElementHealth(source) - hp)
			setElementData(parent,"vehicle_armor",0)
			return true
		end
		setElementData(parent,"vehicle_armor",getElementData(parent,"vehicle_armor")-loss)
		return true
	end
	for _, data in ipairs (details) do
		if parent and isElement(parent) then
			local detail = getElementData(parent,data[1]) or 0
			if detail > 0 then
				local detail_dam = getElementData (parent,data[1].."dam") or 0
				if detail_dam >= 6 then
					local random = math.random(0.05,#details)
					local detale = getElementData(parent,details[random][1]) or 0
					if detale > 0 then
						setElementData(parent,details[random][1],detale - 1)
						setElementData(parent,details[random][1].."dam",0)
						checkVehicleMovable(source)
						break
					end
				else
					setElementData(parent, data[1].."dam", detail_dam+1)
					break
				end
			end
		end
	end
	setElementHealth (source,getElementHealth(source) - loss)
end)

]]
addEventHandler("onClientVehicleDamage",getRootElement(),function(attacker,weapon,loss,x,y,z,tyre)
	cancelEvent()
	local parent = getElementData(source,"parent")
	if getElementData(parent,"vehicle_armor") > 0 then
		if getElementData(parent,"vehicle_armor")-loss < 1 then
			local hp = math.floor(getElementData(parent,"vehicle_armor") - loss)
			if hp < 0 then hp = hp * -1 end
			setElementHealth(source,getElementHealth(source) - hp)
			setElementData(parent,"vehicle_armor",0)
			return true
		end
		setElementData(parent,"vehicle_armor",getElementData(parent,"vehicle_armor")-loss)
		return true
	end
	setElementHealth (source,getElementHealth(source) - loss)
end)

--Ракети на битр итд
w, h = guiGetScreenSize ()

local function getPositionFromElementOffset(element,offX,offY,offZ)
	local m = getElementMatrix ( element )  -- Get the matrix
	local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]  -- Apply transform
	local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2]
	local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3]
	return x, y, z                               -- Return the transformed point
end

local poses = {
 [601] = {0, 0, 0},
}

addEvent("cl_bulletSpawn", true)
addEventHandler("cl_bulletSpawn",getRootElement(),function(x, y, z, player)
	createProjectile(player,19,x,y,z+3)
end)


function fireBTR()
   setTimer(function()
    local veh = getPedOccupiedVehicle(localPlayer)
	if isElement(veh) and getElementModel(veh) == 601 then
		local xv,yv,zv = getElementVelocity(veh)
		local mid = getElementModel(veh)
		local x,y,z = getPositionFromElementOffset(veh, poses[mid][1],poses[mid][2],poses[mid][3]+math.abs(zv*5))
		x,y = x+xv*5, y+yv*5
		triggerServerEvent("sv_bulletSpawn", getRootElement(), x, y, z, localPlayer)
	end
	   end,1000,1)
end


function disableFireSwat ( theVehicle, seat )
	if ( getElementModel ( theVehicle ) == 601 ) then
		toggleControl ( "vehicle_fire", false )
	else
		toggleControl ( "vehicle_fire", true )
	end
end

addEventHandler ( "onClientPlayerVehicleEnter", getLocalPlayer(), disableFireSwat )

function disableFireSwat1 ( theVehicle, seat )
	if ( getElementModel ( theVehicle ) == 601 ) then
		toggleControl ( "lctrl_fire", false )
	else
		toggleControl ( "lctrl_fire", true )
	end
end
addEventHandler ( "onClientPlayerVehicleEnter", getLocalPlayer(), disableFireSwat1 )

function renderVehCross ()
    local veh = getPedOccupiedVehicle(localPlayer)
	if isElement(veh) and getElementModel(veh) == 601 then
		dxDrawImage (w/2-128, h/2-128,256,256,"images/shotgun.png",0,0,0)
	end
end
addEventHandler('onClientRender', root, renderVehCross )

function SwatFireEnter ( theVehicle, seat )
local col = getElementData(theVehicle,"parent")
    if ( getElementModel ( theVehicle ) == 601 ) then
	    if getElementData(col,"raket") > 0 then
			bindKey("mouse1","down",fireBTR)
			triggerEvent("displayClientInfo",getLocalPlayer(),"","W pojeździe jest "..getElementData(col,"raket").." rakiet.",0,255,0)
        else
			unbindKey("mouse1","down",fireBTR)
			triggerEvent("displayClientInfo",getLocalPlayer(),"","W pojeździe nie ma rakiet! (BGM-71)",255,22,0)
		end
    end
end
addEventHandler ( "onClientPlayerVehicleEnter", getLocalPlayer(), SwatFireEnter )

armedVehicles = {[601]=true}
--armedVehicles = {[425]=true, [520]=true, [476]=true, [447]=true, [430]=true, [432]=true, [464]=true, [407]=true, [601]=true}

function vehicleWeaponFire(key, keyState, vehicleFireType)
	local vehModel = getElementModel(getPedOccupiedVehicle(localPlayer))
	if (armedVehicles[vehModel]) then
		triggerEvent("onClientVehicleWeaponFire", localPlayer, vehicleFireType, vehModel)
	else
		return
	end
end
bindKey("vehicle_fire", "down", vehicleWeaponFire, "primary")
bindKey("vehicle_secondary_fire", "down", vehicleWeaponFire, "secondary")


function eventVehicleFire(theVehicle)
    local theVehicle = getPedOccupiedVehicle(getLocalPlayer())
	local col = getElementData(theVehicle,"parent")
	if getElementData(col,"raket") > 0 then
		bindKey("mouse1","down",fireBTR)
		setElementData(col,"raket",getElementData(col,"raket")- 1)
		local sound = playSound("sounds/hydraGunSound.ogg")
		setSoundVolume(sound, 0.6)
	end
	if getElementData(col,"raket") == 0 then
		unbindKey("mouse1","down",fireBTR)
		triggerEvent("displayClientInfo",getLocalPlayer(),"","W pojeździe nie ma rakiet!",255,22,0)
	end
end
addEvent("onClientVehicleWeaponFire", false)
addEventHandler("onClientVehicleWeaponFire", getLocalPlayer(), eventVehicleFire)
-------------------------------------------------

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

function getElementSpeed(element,unit)
    if (unit == nil) then unit = 0 end
    if (isElement(element)) then
        local x,y,z = getElementVelocity(element)
        if (unit=="кмч" or unit==1 or unit =='1') then
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100)
        else
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100 * 1.609344)
        end
    else
        return false
    end
end


lightState = 0

localPlayer = getLocalPlayer ()

addEventHandler("onClientVehicleEnter", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
			if seat == 0 then
				bindKey ( "l", "down", showLightState_panel )
				addEventHandler("onClientRender",root, showPanel_main )
				lightState = getVehicleOverrideLights ( source ) or 0
			end
		end
    end
)

addEventHandler("onClientVehicleExit", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
			if seat == 0 then
				removeEventHandler("onClientRender",root, showPanel_main )
				unbindKey ( "l", "down" )
				lightState = 0
			end
        end
    end
)


function showLightState_panel ()
	if lightState == 0 or lightState == 1 then
		lightState = 2
		setVehicleOverrideLights( getPedOccupiedVehicle ( localPlayer ), 2 )
	else
		setVehicleOverrideLights( getPedOccupiedVehicle ( localPlayer ), 1 )
		lightState = 0
	end
end

function showPanel_main ()
	if not getPedOccupiedVehicle ( localPlayer ) then
		removeEventHandler("onClientRender",root, showPanel_main )
		unbindKey ( "l", "down" )
		lightState = 0
		return true
	end
end

local color = {}
local radio = {}
local sounds = {}
local sW,sH = guiGetScreenSize()
addEventHandler("onClientRender",getRootElement(),function()
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	if veh then
		local parent = getElementData(veh,"parent")
		local eng_health = getElementData(parent,"Engine_inVehicledam") or 0
		local tire_health = getElementData(parent,"Tire_inVehicledam") or 0
		local parts_health = getElementData(parent,"Parts_inVehicledam") or 0
		local fuel = getElementData(parent,"fuel") or 0
		local maxfuel = getElementData(veh,"maxfuel")
		if maxfuel == false or nil then return end
		if fuel == false or nil then return end

		if fuel > maxfuel/2 then
			color.fuel_r = 0
			color.fuel_g = 255
			color.fuel_b = 0
		elseif fuel <= maxfuel/2 and fuel > 10 then
			color.fuel_r = 255
			color.fuel_g = 255
			color.fuel_b = 0
		elseif fuel < 10 then
			color.fuel_r = 255
			color.fuel_g = 0
			color.fuel_b = 0
		end
		--statusbar fuel
		if maxfuel == 140 then
		maxpalivo = -1.35
		elseif maxfuel == 100 then
		maxpalivo = -0.98
		elseif maxfuel == 80 then
		maxpalivo = -0.78
		elseif maxfuel == 60 then
		maxpalivo = -0.58
		elseif maxfuel == 50 then
		maxpalivo = -0.48
		elseif maxfuel == 30 then
		maxpalivo = -0.29
		elseif maxfuel == 0 then
		maxpalivo = -1.35
		end

		if lightState == 0 or lightState == 1 then
		color1,color2,color3 = 255,255,255
		dxDrawText ( " OFF",sW * 0.070,sH * 0.410-0.001,sW * 0.060,sH * 0.015, tocolor ( color1,color2,color3, 200 ), 1, "sans", "left", "top", false, false, true)
		else
		color1,color2,color3 = 215,200,105
		dxDrawText ( " ON",sW * 0.070,sH * 0.410-0.001,sW * 0.060,sH * 0.015, tocolor ( color1,color2,color3, 200 ), 1, "sans", "left", "top", false, false, true)
		end

		local speed = getElementSpeed(getPedOccupiedVehicle(getLocalPlayer()), "кмч")
        if not speed then return end
        dxDrawText ( "SPD "..speed,sW * 0.007,sH * 0.330-0.001,sW * 0.060,sH * 0.015, tocolor ( color1,color2,color3, 200 ), 1, "sans", "left", "top", false, false, true)
		local x,y,z = getElementPosition (getLocalPlayer())
		dxDrawText ( "ALT "..tostring(math.floor (z)),sW * 0.037,sH * 0.330-0.001,sW * 0.060,sH * 0.015, tocolor ( color1,color2,color3, 200 ), 1, "sans", "left", "top", false, false, true)

		--statusbar palivo
		local palivo = math.floor(getElementData(getElementData(veh,"parent"),"fuel") or 0)
		dxDrawBox(sW * 0.10,sH * 0.446,5,-105,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.10,sH * 0.446,5,palivo/maxpalivo,tocolor(255,255,0,100),tocolor(color1,color2,color3,50))
		-- statusbar armor
		local arm = math.floor(getElementData(getElementData(veh,"parent"),"vehicle_armor") or 0)
		dxDrawBox(sW * 0.12,sH * 0.446,5,-105,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.12,sH * 0.446,5,arm/-9.6,tocolor(0,0,255,100),tocolor(color1,color2,color3,50))
		-- statusbar health
		local health = math.floor(getElementHealth(veh) or 0)
		dxDrawBox(sW * 0.11,sH * 0.446,5,-105,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.11,sH * 0.446,5,health/-9.6,tocolor(0,255,0,100),tocolor(color1,color2,color3,50))
		-- box name detail
		dxDrawBox(sW * 0.005,sH * 0.330,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.005,sH * 0.350,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.005,sH * 0.370,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.005,sH * 0.390,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.005,sH * 0.430,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.005,sH * 0.410,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		-- box detail kolvo
		dxDrawBox(sW * 0.070,sH * 0.350,sW * 0.025,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.070,sH * 0.370,sW * 0.025,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.070,sH * 0.390,sW * 0.025,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.070,sH * 0.430,sW * 0.025,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		dxDrawBox(sW * 0.070,sH * 0.410,sW * 0.025,sH * 0.015,tocolor(0,0,0,100),tocolor(color1,color2,color3,50))
		-- box detail status
		--dxDrawBox(sW * 0.100,sH * 0.350,sW * 0.003,sH * 0.015,tocolor(color.engine_r,color.engine_g,color.engine_b,100),tocolor(255,255,255,50)) -- engine
		--dxDrawBox(sW * 0.100,sH * 0.370,sW * 0.003,sH * 0.015,tocolor(color.tire_r,color.tire_g,color.tire_b,100),tocolor(255,255,255,50)) -- tire
		--dxDrawBox(sW * 0.100,sH * 0.390,sW * 0.003,sH * 0.015,tocolor(color.parts_r,color.parts_g,color.parts_b,100),tocolor(255,255,255,50)) -- needparts
		--dxDrawBox(sW * 0.100,sH * 0.430,sW * 0.003,sH * 0.015,tocolor(color.fuel_r,color.fuel_g,color.fuel_b,100),tocolor(255,255,255,50)) -- fuel
		--dxDrawBox(sW * 0.100,sH * 0.410,sW * 0.003,sH * 0.015,tocolor(0,255,0,100),tocolor(255,255,255,50)) -- far
		-- text for box 1 name detail
		dxDrawText ("Akumulator",sW * 0.007,sH * 0.350-0.001,sW * 0.060,sH * 0.015,tocolor(color1,color2,color3,200),1,"sans")
		dxDrawText ("Koła",sW * 0.007,sH * 0.370-0.001,sW * 0.060,sH * 0.015,tocolor(color1,color2,color3,200),1,"sans")
		dxDrawText ("Świeca",sW * 0.007,sH * 0.390-0.001,sW * 0.060,sH * 0.015,tocolor(color1,color2,color3,200),1,"sans")
		dxDrawText ("Benzyna",sW * 0.007,sH * 0.430-0.001,sW * 0.060,sH * 0.015,tocolor(color1,color2,color3,200),1,"sans")
		dxDrawText ("Reflektory",sW * 0.007,sH * 0.410-0.001,sW * 0.060,sH * 0.015,tocolor(color1,color2,color3,200),1,"sans")
		-- text for box 2 kolvo detail
		dxDrawText ("".. math.floor(tostring(getElementData(getElementData(veh,"parent"),"Engine_inVehicle") or 0)) .."/".. tostring(getElementData(veh,"needengines")).. "",sW * 0.072,sH * 0.350-0.001,sW * 0.060,sH * 0.015,tocolor(color1,color2,color3,200),1,"sans") -- engine
		dxDrawText ("".. math.floor(tostring(getElementData(getElementData(veh,"parent"),"Tire_inVehicle") or 0)) .."/".. tostring(getElementData(veh,"needtires")).."",sW * 0.072,sH * 0.370-0.001,sW * 0.060,sH * 0.015,tocolor(color1,color2,color3,200),1,"sans") -- tire
		dxDrawText ("".. math.floor(tostring(getElementData(getElementData(veh,"parent"),"Parts_inVehicle") or 0)) .."/"..tostring(getElementData(veh,"needparts")).."",sW * 0.072,sH * 0.390-0.001,sW * 0.060,sH * 0.015,tocolor(color1,color2,color3,200),1,"sans") -- need parts
		dxDrawText ("".. math.floor(tostring(getElementData(getElementData(veh,"parent"),"fuel") or 0)).."/"..tostring(getElementData(veh,"maxfuel")).."",sW * 0.070,sH * 0.430-0.001,sW * 0.060,sH * 0.015,tocolor(color1,color2,color3,200),0.9,"sans") -- fuel
	end
end)

function dxDrawBox(x, y, w, h, rcolor, lcolor)
	dxDrawLine(x - 1, y - 1, x - 1, y + h, lcolor, 1)
	dxDrawLine(x + w, y - 1, x + w, y + h, lcolor, 1)
	dxDrawLine(x - 1, y + h, x + w, y + h, lcolor, 1)
	dxDrawLine(x - 1, y - 1, x + w, y - 1, lcolor, 1)
	dxDrawRectangle(x, y, w, h, rcolor)
end

addEventHandler("onClientResourceStart",resourceRoot,function()
	radio["WINDOW"] = guiCreateWindow((sW - 321) / 2, (sH - 258) / 2, 321, 258, "REDIO", false)
	guiWindowSetSizable(radio["WINDOW"], false)
	radio["BUTTON_PLAY"] = guiCreateButton(10, 229, 87, 19, "Włącz", false, radio["WINDOW"])
	radio["BUTTON_CLOSE"] = guiCreateButton(224, 229, 87, 19, "ZAMKNIJ", false, radio["WINDOW"])
	radio["GRIDLIST"] = guiCreateGridList(12, 32, 299, 187, false, radio["WINDOW"])
	radio["COLUMN"] = guiGridListAddColumn(radio["GRIDLIST"], "STACJE", 0.9)
	addEventHandler("onClientGUIClick",radio["BUTTON_CLOSE"],function()
		guiSetVisible(radio["WINDOW"],false)
		showCursor(false)
	end,false)
	addEventHandler("onClientGUIClick",radio["BUTTON_PLAY"],function()
		local inVehicle = getPedOccupiedVehicle(getLocalPlayer())
		local select = guiGridListGetItemText(radio["GRIDLIST"],guiGridListGetSelectedItem(radio["GRIDLIST"]),1)
		if inVehicle and select and getElementData(inVehicle,"vehicle:receiver") == false then
			for i, data in ipairs(playlist) do
				if select == data[1] then
					setElementData(inVehicle,"vehicle:directive",data[2])
					setElementData(inVehicle,"vehicle:receiver",true)
					guiSetText(radio["BUTTON_PLAY"],"Wyłącz")
					break
				end
			end
		else
			setElementData(inVehicle,"vehicle:receiver",false)
			setElementData(inVehicle,"vehicle:directive",nil)
			guiSetText(radio["BUTTON_PLAY"],"Włącz")
		end
	end,false)
	guiSetVisible(radio["WINDOW"],false)
end)

bindKey("[","down",function()
	local inVehicle = getPedOccupiedVehicle(getLocalPlayer())
	if inVehicle then
		guiSetVisible(radio["WINDOW"],not guiGetVisible(radio["WINDOW"]))
		showCursor(not isCursorShowing())
		guiGridListClear(radio["GRIDLIST"])
		for i, data in ipairs(playlist) do
			local row = guiGridListAddRow(radio["GRIDLIST"])
			guiGridListSetItemText(radio["GRIDLIST"],row,radio["COLUMN"],data[1],false,false)
		end
		if getElementData(inVehicle,"vehicle:receiver") == true then
			guiSetText(radio["BUTTON_PLAY"],"Wyłącz")
		else
			guiSetText(radio["BUTTON_PLAY"],"Włącz")
		end
	end
end)

addEventHandler( "onClientElementStreamIn", getRootElement( ),function ( )
	if getElementType( source ) == "vehicle" then
		if getElementData(source,"vehicle:receiver") == true then
			attach3DSound(source,getElementData(source,"vehicle:directive"))
		end
	end
end)

addEventHandler( "onClientElementStreamOut", getRootElement( ),function ( )
	if getElementType( source ) == "vehicle" then
		if getElementData(source,"vehicle:receiver") == true then
			detach3DSound(source)
		end
	end
end)

addEventHandler("onClientElementDataChange",getRootElement(),function(dataName)
	if getElementType(source) == "vehicle" then
		if dataName == "isExploded" and getElementData(source,"isExploded") == true and getElementData(source,"vehicle:receiver") == true then
			detach3DSound(source)
		end
		if dataName == "vehicle:receiver" and getElementData(source,"vehicle:receiver") == false then
			detach3DSound(source)
		end
		if dataName == "vehicle:receiver" and getElementData(source,"vehicle:receiver") == true then
			attach3DSound(source,getElementData(source,"vehicle:directive"))
		end
	end
end)

function detach3DSound(fromElement)
	if sounds[fromElement] ~= nil then
		local soundElement = sounds[fromElement]
		detachElements(soundElement,fromElement)
		stopSound(soundElement)
		sounds[fromElement] = nil
	end
end
addEvent("detach3DSound",true)
addEventHandler("detach3DSound",getRootElement(),detach3DSound)

function attach3DSound(toElement,directive)
	local x,y,z = getElementPosition(toElement)
	local soundElement = init3DSound(directive,x,y,z,toElement)
	sounds[toElement] = soundElement
end
addEvent("attach3DSound",true)
addEventHandler("attach3DSound",getRootElement(),attach3DSound)

function init3DSound(directive,x,y,z,toElement)
	local sound3d = playSound3D(directive,0,0,0)
	setSoundMinDistance(sound3d, 13)
	setSoundMaxDistance(sound3d,20)
	attachElements(sound3d,toElement,0,0,0)
	setElementData(toElement,"vehicle:directive",directive)
	setElementData(toElement,"vehicle:receiver",true)
	return sound3d
end

function updatePlayTime()
	if getElementData(getLocalPlayer(),"logedin") then
		local playtime = getElementData(getLocalPlayer(),"alivetime")
		setElementData(getLocalPlayer(),"alivetime",playtime+1)
	end
end
setTimer(updatePlayTime,60000,0)

local rotate = 0
function renderComa()
	if getElementData(getLocalPlayer(),"isDead") then
		local otComa = getTimestamp()
		setElementData(getLocalPlayer(),"inComa",false)
		triggerServerEvent("setPedComaAnimation",getLocalPlayer(),false)
		removeEventHandler("onClientRender",root,renderComa)
		setElementData(getLocalPlayer(),"notComa",otComa+30*1000)
	end
	if rotate == 180 then
		if not hourglass then
			hourglass = setTimer(function() rotate = rotate+4 killTimer(hourglass) hourglass = false end,1000,1)
		end
	elseif rotate == 360 then
		if not hourglass2 then
			hourglass2 = setTimer(function() rotate = 0 killTimer(hourglass2) hourglass2 = false end,1000,1)
		end
	else
		rotate = rotate+4
	end
	dxDrawImage((sW - 200) / 2, (sH - 200) / 2, 200, 200, "images/circle.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage((sW - 200) / 2, (sH - 200) / 2, 200, 200, "images/hourglass.png",rotate, 0, 0, tocolor(255, 255, 255, 255), false)
end

function checkBloodComa()
if getElementData(getLocalPlayer(),"logedin") then
	if getElementData(getLocalPlayer(),"blood") < 3000 then --
		if not getElementData(getLocalPlayer(),"inComa") and not getElementData(getLocalPlayer(),"isDead") then
			if getElementData(getLocalPlayer(),"notComa") > getTimestamp() then return end
			putPlayerInComa()
		end
	end
end
end
setTimer(checkBloodComa,7000,0)


function putPlayerInComa()
	if not getElementData(getLocalPlayer(),"inComa") and not getElementData(getLocalPlayer(),"isDead") then
		if isElementInWater(getLocalPlayer()) then return end
		setElementData(getLocalPlayer(),"inComa",true)
		triggerServerEvent("setPedComaAnimation",getLocalPlayer(),true)
		addEventHandler("onClientRender",root,renderComa)
		setTimer(finishComa,math.random(30,60)*1000,1)
	end
end

function finishComa()
	if getElementData(getLocalPlayer(),"inComa") and not getElementData(getLocalPlayer(),"isDead") then
		local otComa = getTimestamp()
		setElementData(getLocalPlayer(),"inComa",false)
		triggerServerEvent("setPedComaAnimation",getLocalPlayer(),false)
		removeEventHandler("onClientRender",root,renderComa)
		setElementData(getLocalPlayer(),"notComa",otComa+30*1000)
	end
end



function getTimestamp(year, month, day, hour, minute, second)
	local monthseconds = { 2678400, 2419200, 2678400, 2592000, 2678400, 2592000, 2678400, 2678400, 2592000, 2678400, 2592000, 2678400 }
	local timestamp = 0
	local datetime = getRealTime()
	year, month, day = year or datetime.year + 1900, month or datetime.month + 1, day or datetime.monthday
	hour, minute, second = hour or datetime.hour, minute or datetime.minute, second or datetime.second
	for i=1970, year-1 do timestamp = timestamp + (isLeapYear(i) and 31622400 or 31536000) end
	for i=1, month-1 do timestamp = timestamp + ((isLeapYear(year) and i == 2) and 2505600 or monthseconds[i]) end
	timestamp = timestamp + 86400 * (day - 1) + 3600 * hour + 60 * minute + second
	timestamp = timestamp - 3600
	if datetime.isdst then timestamp = timestamp - 3600 end
	return timestamp
end

function isLeapYear(year)
    if year then year = math.floor(year)
    else year = getRealTime().year + 1900 end
    return ((year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0)


end

function drawPlayersInTeam (x,y)
	local gangname = getElementData(getLocalPlayer(),"gang")
	if gangname then
		if gangname == "None" then return end
		for i, player in ipairs(getElementsByType("player")) do
			if gangname == getElementData(player,"gang") and player ~= localPlayer then
				local playerx,playery = getElementPosition ( player )
				local _,_,rotplayer = getElementRotation( player )
				if getDistanceBetweenPoints2D ( x,y,playerx,playery) < 200 then
					local markx, marky
					if x > 0 and y > 0 then
						markx, marky = centerleft+(math.abs(playerx/2)-math.abs(x/2)), centerleft-(math.abs(playery/2)-math.abs(y/2))
					elseif x < 0 and y < 0 then
						markx, marky = centerleft-(math.abs(playerx/2)-math.abs(x/2)), centerleft+(math.abs(playery/2)-math.abs(y/2))
					elseif x < 0 and y > 0 then
						markx, marky = centerleft-(math.abs(playerx/2)-math.abs(x/2)), centerleft-(math.abs(playery/2)-math.abs(y/2))
					elseif x > 0 and y < 0 then
						markx, marky = centerleft+(math.abs(playerx/2)-math.abs(x/2)), centerleft+(math.abs(playery/2)-math.abs(y/2))
					end
					dxDrawImage(markx-(playerSizeX/2), marky-(playerSizeY/2), playerSizeX, playerSizeY, playerTexture,-rotplayer, 0, 0, tocolor(0, 0, 255, 255))
				end
			end
		end
	else
		return true
	end
end

function createGPS()
if getElementData(getLocalPlayer(),"logedin") then
	local x,y = getElementPosition(getLocalPlayer())
    local _, _,camrot = getElementRotation(getCamera())
	dxSetRenderTarget(rr)
	dxDrawImageSection(0,0,xsize,xsize,1500+x/2-centerleft,1500-y/2-centerleft,xsize,xsize,mapTexture,0,0,0)
	drawPlayersInTeam(x,y)
	dxSetRenderTarget()
	dxSetRenderTarget(rr2)
	dxDrawImage(0,0,xsize,xsize,rr,camrot)
	dxSetRenderTarget()
	dxDrawImageSection(mapX+20,mapY-81,mapSizeX,mapSizeY,(xsize-mapSizeX)/2,(xsize-mapSizeY)/2,mapSizeX,mapSizeY,rr2,0,0,0)
	dxDrawImage(playerX-playerSizeX/2,playerY-playerSizeY/2,playerSizeX,playerSizeY,playerTexture,0,0,0,tocolor(255, 0, 0, 255))
	dxDrawImage(mapX+7,mapY-103,gpsX,gpsY,gpsTexture)
	end
end
--addEventHandler("onClientRender", getRootElement(), createGPS)

addEventHandler ( "onClientElementDataChange", getRootElement(),
function ( dataName, oldValue )
	if source == localPlayer and dataName == "GPS" then
		local newValue = getElementData ( localPlayer, "GPS" ) or 0
		oldValue = oldValue or 0
		if oldValue <= 0 and newValue > 0 then
			addEventHandler("onClientRender", getRootElement(), createGPS)
		elseif oldValue > 0 and newValue <= 0 then
			removeEventHandler("onClientRender", getRootElement(), createGPS)
		end
	end
end )




fixbag = {
		{"Granat dymny",17},
		{"Granat hukowy",18},
		{"Granat M67",16},
		{"Nóż myśliwski",4},
		{"Topór",8},
		{"Lornetka",43},
		{"Bejsbol",5},
		{"Kij golfowy",2},
		{"Piła spalinowa",9},
		{"Łopata",6},
		{"Pięść",0},

}


function renderHUD()
local weaponfix = getElementData(getLocalPlayer(),"currentweapon_1")
	if getElementData(getLocalPlayer(),"logedin") then
		local zone = getZoneName (getElementPosition(getLocalPlayer()))
		local x,y = guiGetScreenSize()
		local paint_color = tocolor(255,255,255)
		local hud_size = 1
		local font = "sans"
		local text_size = dxGetFontHeight ( hud_size, font )
		local screenWidth,screenHeight = guiGetScreenSize()
		local bX, bY = screenWidth/2,screenHeight/2
		clip = getPedAmmoInClip ( getLocalPlayer() )
		bala = getPedTotalAmmo ( getLocalPlayer() )-clip
		showPlayerHudComponent ("weapon", false )
		showPlayerHudComponent ("ammo", false)
		showPlayerHudComponent ("clock", false)
		if bala < 0 then
			bala = 0
		end
		local x, y = guiGetScreenSize ( )
		posy3= 5
		posx2= x-55 posy2= posy3+text_size posx3= x-55
		local weap = getElementData (localPlayer,"selectedWeapon")
		local ammotext = clip .." | "..bala
		local xlenght = x-20
		if weap then
		for _, fix in ipairs(fixbag) do
			if getPedWeapon(getLocalPlayer()) >= 18 and getPedWeapon(getLocalPlayer()) < 43 then
				dxDrawText(weap,posx2-289, posy3+text_size+1, xlenght, y,tocolor(0,0,0,255),hud_size,font,"right","top",false,false,false)
				dxDrawText(weap,posx3-290, posy3+text_size, xlenght, y,paint_color,hud_size,font,"right","top",false,false,false)
			elseif getPedWeapon(getLocalPlayer()) == fix[2]  then
				dxDrawText(fix[1],posx2-289, posy3+text_size+1, xlenght, y,tocolor(0,0,0,255),hud_size,font,"right","top",false,false,false)
				dxDrawText(fix[1],posx3-290, posy3+text_size, xlenght, y,paint_color,hud_size,font,"right","top",false,false,false)
			end
			if getPedWeapon(getLocalPlayer()) > 9 then
				dxDrawText(""..ammotext,posx3-289, posy2+text_size+1, xlenght, y,tocolor(0,0,0,255),hud_size,font,"right","top",false,false,false)
				dxDrawText(""..ammotext,posx3-290, posy2+text_size, xlenght, y,paint_color,hud_size,font,"right","top",false,false,false)
			end
		end
		end
		dxDrawText(zone, screenWidth * 0.01, screenHeight* 0.981, xlenght, y,tocolor(0,0,0,255),hud_size,font,"left","top",false,false,false)
		dxDrawText(zone, screenWidth * 0.01, screenHeight* 0.98, xlenght, y,paint_color,hud_size,font,"left","top",false,false,false)
		if getElementData(getLocalPlayer(),"Zegarek") >= 1 then
			local hour, minutes = getTime()
			if minutes < 10 then
				add0 = "0"
			else
				add0 = ""
			end
			local time = hour..":"..add0..""..minutes
			dxDrawText(time,x*0.93-1,posy2+text_size*2+1, xlenght, y,tocolor(0,0,0,255),hud_size+0.1,font,"right","top",false,false,false)
			dxDrawText(time,x*0.93,posy2+text_size*2, xlenght, y,paint_color,hud_size+0.1,font,"right","top",false,false,false)
		end
	end
end
addEventHandler("onClientRender",getRootElement(),renderHUD)

function shakeCamera(weapon)
	x,y,z = getPedBonePosition ( getLocalPlayer(), 26 )
	if weapon == 22 then
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 24 then
		createExplosion ( x,y,z + 10,12,false,0.2,false)
	elseif weapon == 25 then
		createExplosion ( x,y,z + 10,12,false,0.4,false)
	elseif weapon == 26 then
		createExplosion ( x,y,z + 10,12,false,0.5,false)
	elseif weapon == 27 then
		createExplosion ( x,y,z + 10,12,false,0.4,false)
	elseif weapon == 28 then
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 29 then
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 30 then
		createExplosion ( x,y,z+10,12,false,0.1,false)
	elseif weapon == 31 then
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 32 then
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 33 then
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 38 then
		createExplosion ( x,y,z + 10,12,false,0.5,false)
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), shakeCamera )
