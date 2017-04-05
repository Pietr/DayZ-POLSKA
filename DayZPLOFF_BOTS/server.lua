
tableZombie = {
 {-1112.2832, -1676.9189, 79.367188,285,"Nóż myśliwski"},
 {-1112.2832, -1672.9189, 79.367188,285,"Morfina"},
}

addEvent("sniperTakeDecision", true)
addCommandHandler("sniper",
	function(thePlayer, command)
	for _, v in ipairs(tableZombie) do
		local ped = createSniperPed(v[1], v[2], v[3],v[4])	
	end
	end
)
setTimer(
	function()
		for i, peds in ipairs(getElementsByType("ped")) do
			if getElementData(peds, "type") == "ped.sniper.npc"  then
				giveWeapon(peds, 31, 10000, true)
				setPedWeaponSlot(peds, 5)
			end
		end
	end
, 50, 0)
function createSniperPed(x, y, z,skin)
	local ped = createPed(skin, x, y, z)
	setTimer(
		function()
			if isElement(ped) then
				giveWeapon(ped, 31, 10000, true)
				setPedWeaponSlot(ped, 5)
				setElementData(ped, "type", "ped.sniper.npc")
				setElementFrozen(ped, true)
				setElementData(ped, "blood", 12000)
			end
		end
	, 5000, 1)

end

--[[

	local rdmangle = math.random( 1, 359 )
	setPedRotation( ped, rdmangle )
	setPedAnimation ( ped, "PED", "WALK_fatold", -1, true, true, true)
	
]]



addEventHandler("sniperTakeDecision", getRootElement(),
	function(sniperPedID, aimPlayer)
		setElementData(sniperPedID, "target", aimPlayer)
		triggerClientEvent("sniperTakeDecisionClient", getRootElement(), sniperPedID, aimPlayer)
	end
)

function destroyDeadZombie (ped,pedCol)
	destroyElement(ped)
	destroyElement(pedCol)
end

itemTableZombies = {
	{"Strój TTsKO",2976,0.15,0,1},
	{"AK-101",2976,0.15,0,1},
	{"AK-MAG",2976,0.15,0,10},
	{"Butelka wody",2976,0.15,0,1},
	{"Kamizelka o dużej pojemności - oliwkowa",2976,0.15,0,1},
	{"Okulary pilotki",2976,0.15,0,1},
	{"Hełm militarny - zielony",2976,0.15,0,1},
	{"Kominiarka - zielona",2976,0.15,0,1},
	{"Manierka",2976,0.15,0,1},
	{"Pieniądze",2976,0.15,0,7},
	{"Mapa",2976,0.15,0,1},
	{"GPS",2976,0.15,0,1},
	{"Дозиметр",2976,0.15,0,1},
}

zombieKilled = function(killer, headshot)
	if killer then
		setElementData(killer, "zombieskilled", getElementData(killer, "zombieskilled") + 1)
	end
	local skin = getElementModel(source)
	local x, y, z = getElementPosition(source)
	local ped = createPed(skin, x, y, z)
	local pedCol = createColSphere(x, y, z, 1.5)
	killPed(ped)
	setTimer(destroyDeadZombie,20000, 1, ped, pedCol)
	attachElements(pedCol, ped, 0, 0, 0)
	setElementData(pedCol, "parent", ped)
	setElementData(pedCol, "playername", "Zombie")
	setElementData(pedCol, "deadman", true)
	setElementData(ped, "deadzombie", true)
	setElementData(pedCol, "deadman", true)
	
	setTimer(createSniperPed,200000,1,x, y, z,skin)

	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	setElementData(pedCol,"deadreason","Похоже он мёртв. Время смерти: "..hours..":"..minutes..".")
			for i,item in ipairs(itemTableZombies) do
			if item[5] then
				setElementData(pedCol, item[1],math.random(1,item[5]))
			end
			end
			
			for i,v in ipairs(tableZombie) do
			if skin == v[4] then
				setElementData(pedCol, v[5],1)
			end
			end
			
	if isElement ( getElementData(source,"parent") ) then
		destroyElement(getElementData(source,"parent"))
    end
	local attaches = getAttachedElements ( source )
	if attaches then
		for ElementKey, ElementValue in ipairs ( attaches ) do
			if isElement ( ElementValue ) then
				if not getElementData ( ElementValue, "zRadZone" ) then
					destroyElement ( ElementValue )
				end
			end
		end
	end
	if isElement ( getElementData ( source, "zombieShape" ) ) then destroyElement ( getElementData ( source, "zombieShape" ) ) end
	if isElement ( getElementData ( source, "shapeFar" ) ) then destroyElement ( getElementData ( source, "shapeFar" ) ) end
	if isElement ( getElementData ( source, "shapeNear" ) ) then destroyElement ( getElementData ( source, "shapeNear" ) ) end
	destroyElement(source)
	if headshot == true then
		setPedHeadless( ped, true )
		setElementData(killer, "headshots", getElementData(killer, "headshots") + 1)
	end
end
addEvent("onZombieGetsKilled", true)
addEventHandler("onZombieGetsKilled", getRootElement(), zombieKilled)
