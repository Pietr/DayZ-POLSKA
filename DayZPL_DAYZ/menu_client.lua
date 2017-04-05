toggleControl ("look_behind",false) --Забрали mouse3
local theTableMenuScroll = {}
function startRollMessageMenu(text, r, g, b, data)
	table.insert(theTableMenuScroll,{text,r,g,b,data})
end

function getVehicleAddonInfos (id)
	for i,veh in ipairs(vehicleAddonsInfo) do
		if veh[1] == id then
			return veh[2],veh[3], veh[4]
		end
	end
end

function dxDrawingColorTextMenuScroll(str, ax, ay, bx, by, color, alpha, scale, font, alignX, alignY)
    if alignX then
        if alignX == "center" then
        elseif alignX == "right" then
            local w = dxGetTextWidth(str:gsub("#%x%x%x%x%x%x",""), scale, font)
            ax = bx - w
        end
    end
    if alignY then
        if alignY == "center" then
            local h = dxGetFontHeight(scale, font)
            ay = ay + (by-ay)/2 - h/2
        elseif alignY == "bottom" then
            local h = dxGetFontHeight(scale, font)
            ay = by - h
        end
    end
    local pat = "(.-)#(%x%x%x%x%x%x)"
    local s, e, cap, col = str:find(pat, 1)
    local last = 1
    while s do
    if cap == "" and col then color = tocolor(tonumber("0x"..col:sub(1, 2)), tonumber("0x"..col:sub(3, 4)), tonumber("0x"..col:sub(5, 6)), alpha) end
        if s ~= 1 or cap ~= "" then
            local w = dxGetTextWidth(cap, scale, font)
            dxDrawText(cap, ax, ay, ax + w, by, color, scale, font)
            ax = ax + w
            color = tocolor(tonumber("0x"..col:sub(1, 2)), tonumber("0x"..col:sub(3, 4)), tonumber("0x"..col:sub(5, 6)), alpha)
        end
        last = e + 1
        s, e, cap, col = str:find(pat, last)
    end
    if last <= #str then
        cap = str:sub(last)
        local w = dxGetTextWidth(cap, scale, font)
        dxDrawText(cap, ax, ay, ax + w, by, color, scale, font)
    end
end

local boxSpace = dxGetFontHeight(1,"default-bold")+dxGetFontHeight(1,"default-bold")*0.1


local optionsTable = {
["player"] = {
	{"Opatrz"},
	{"Daj leki przeciwbólowe"},
	{"Wstrzyknij morfinę"},
	},
}

function showClientMenuItem(arg1,arg2,arg3,arg4)
    theTableMenuScroll = {}
    setElementData(localPlayer,"usedItemTrue", false)
    numberMenuScroll = 1
	if getElementData(localPlayer,"playerZombie") then return end
    if arg1 == "Take" then
	    startRollMessageMenu("Zabierz: "..arg2,238,118,0,arg2)
	    setElementData(localPlayer,"usedItemTrue", true)
    end
    if arg1 == "stop" then
        disableMenu()
	    refreshLoot(false)
    end
    if arg1 == "Helicrashsite" then
	    startRollMessageMenu("Przeszukaj",255,255,255,"helicrashsite")
	    setElementData(localPlayer,"usedItemTrue", true)
    end
    if arg1 == "Hospitalbox" then
	    startRollMessageMenu("Przeszukaj",255,255,255,"hospitalbox")
	    setElementData(localPlayer,"usedItemTrue", true)
    end
	if arg1 == "Carhelpbox" then
	    startRollMessageMenu("Przeszukaj",255,255,255,"carhelpbox")
	    setElementData(localPlayer,"usedItemTrue", true)
    end
	if arg1 == "Weaponbox" then
	    startRollMessageMenu("Przeszukaj",255,255,255,"weaponbox")
	    setElementData(localPlayer,"usedItemTrue", true)
    end
	if arg1 == "wirefence" then
	    startRollMessageMenu("Zwiń drut kolczasty",255,255,255,"wirefence")
	    setElementData(localPlayer,"usedItemTrue", true)
    end	
	if arg1 == "Meshok10" then
	    startRollMessageMenu("Zwiń drut kolczasty",255,255,255,"Meshok10")
	    setElementData(localPlayer,"usedItemTrue", true)
    end
	if arg1 == "Meshok" then
	    startRollMessageMenu("Zbierz",255,255,255,"Meshok")
	    setElementData(localPlayer,"usedItemTrue", true)
    end
	if arg1 == "Pokr" then
	    startRollMessageMenu("Zbierz",255,255,255,"Pokr")
	    setElementData(localPlayer,"usedItemTrue", true)
    end
	if arg1 == "Esh" then
	    startRollMessageMenu("Zbierz",255,255,255,"Esh")
	    setElementData(localPlayer,"usedItemTrue", true)
    end
	if arg1 == "Esh10" then
	    startRollMessageMenu("Zbierz",255,255,255,"Esh10")
	    setElementData(localPlayer,"usedItemTrue", true)
    end
    if arg1 == "Vehicle" then
		setElementData(localPlayer,"usedItemTrue", true)
		if getElementData(getElementData(arg3,"parent"),"tent") then
			startRollMessageMenu("> Przeszukaj: "..getLootCurrentSlots(arg4).."/"..(getElementData(arg4,"MAX_Slots") or 0).." slotów",255,255,255,"object")
			startRollMessageMenu("Idź spać",255,255,255,"sleeptent")
			startRollMessageMenu("Złóż namiot",255,255,255,"tent")
			return
		end
		startRollMessageMenu("> Przeszukaj: "..getLootCurrentSlots(arg4).."/"..(getElementData(arg4,"MAX_Slots") or 0).." slotów",255,255,255,"vehicle")
		if getElementData(localPlayer,"Pełny kanister") >= 1 then
				if (getElementData(arg4,"fuel") or 0) < getVehicleMaxFuel(arg4) then
				startRollMessageMenu("> Zatankuj ("..tostring(math.floor(getElementData(arg4,"fuel") or 0)).."/"..getVehicleMaxFuel(arg4)..")",238,118,0,"FuelOne")
				setElementData(localPlayer,"usedItemTrue", true)
				setElementData(localPlayer,"isSetingTent",true)
				setTimer(function()
				setElementData(localPlayer,"isSetingTent",false)
				end,3000,1,localPlayer)
			end
			end
			if getElementData(localPlayer,"Pusty kanister") >= 1 then
			if (getElementData(arg4,"fuel") or 0) >= 20 then
				startRollMessageMenu("> Spuść benzynę ("..tostring(math.floor(getElementData(arg4,"fuel") or 0)).."/"..getVehicleMaxFuel(arg4)..")",238,118,0,"FuelTwo")
				setElementData(localPlayer,"usedItemTrue", true)
				setElementData(localPlayer,"isSetingTent",true)
				setTimer(function()
				setElementData(localPlayer,"isSetingTent",false)
				end,3000,1,localPlayer)
			end
			end
		if getElementData(localPlayer,"Narzędzia") >= 1 then
		startRollMessageMenu("> Zamontuj pancerz",255,255,255,"setArmor")
			local idcar = getElementModel (arg3)
			if idcar == 601 then
			startRollMessageMenu("> Uzupełnij rakiety BGM-71",255,255,255,"setRaket")
			end
			if getElementHealth(arg3) < 1000 and getElementHealth(arg3) >= 300 then
				startRollMessageMenu("> Napraw pojazd",255,255,255,"repairvehicle")
				setElementData(localPlayer,"usedItemTrue", true)
			end
			local tires,engine,parts,metal = getVehicleAddonInfos (getElementModel(arg3))
			if (getElementData(arg4,"Tire_inVehicle") or 0) < tires then
				startRollMessageMenu("> Zamontuj silnik ("..(getElementData(arg4,"Tire_inVehicle") or 0).."/"..tires..")",238,118,0,"TireOne")
				setElementData(localPlayer,"usedItemTrue", true)
				setElementData(localPlayer,"isSetingTent",true)
				setTimer(function()
				setElementData(localPlayer,"isSetingTent",false)
				end,3000,1,localPlayer)
			end
			if (getElementData(arg4,"Engine_inVehicle") or 0) < engine then
				startRollMessageMenu("> Zamontuj akumulator ("..(getElementData(arg4,"Engine_inVehicle") or 0).."/"..engine..")",238,118,0,"EngineOne")
				setElementData(localPlayer,"usedItemTrue", true)
				setElementData(localPlayer,"isSetingTent",true)
				setTimer(function()
				setElementData(localPlayer,"isSetingTent",false)
				end,3000,1,localPlayer)
			end
			if (getElementData(arg4,"Parts_inVehicle") or 0) < parts then
				startRollMessageMenu("> Zamontuj świecę ("..(getElementData(arg4,"Parts_inVehicle") or 0).."/"..parts..")",238,118,0,"PartsOne")
				setElementData(localPlayer,"usedItemTrue", true)
				setElementData(localPlayer,"isSetingTent",true)
				setTimer(function()
				setElementData(localPlayer,"isSetingTent",false)
				end,3000,1,localPlayer)
			end
			if (getElementData(arg4,"Tire_inVehicle") or 0) > 0 then
				startRollMessageMenu("> Zdemontuj koło ("..(getElementData(arg4,"Tire_inVehicle") or 0).."/"..tires..")",238,118,0,"TireTwo")
				setElementData(localPlayer,"usedItemTrue", true)
				setElementData(localPlayer,"isSetingTent",true)
				setTimer(function()
				setElementData(localPlayer,"isSetingTent",false)
				end,3000,1,localPlayer)
			end
			if (getElementData(arg4,"Engine_inVehicle") or 0) > 0 then
				startRollMessageMenu("> Zdemontuj akumulator ("..(getElementData(arg4,"Engine_inVehicle") or 0).."/"..engine..")",238,118,0,"EngineTwo")
				setElementData(localPlayer,"usedItemTrue", true)
				setElementData(localPlayer,"isSetingTent",true)
				setTimer(function()
				setElementData(localPlayer,"isSetingTent",false)
				end,3000,1,localPlayer)
			end
			if (getElementData(arg4,"Parts_inVehicle") or 0) > 0 then
				startRollMessageMenu("> Wykręć świecę ("..(getElementData(arg4,"Parts_inVehicle") or 0).."/"..parts..")",238,118,0,"PartsTwo")
				setElementData(localPlayer,"usedItemTrue", true)
				setElementData(localPlayer,"isSetingTent",true)
				setTimer(function()
				setElementData(localPlayer,"isSetingTent",false)
				end,3000,1,localPlayer)
			end
		end
	end
	if arg1 == "Player" then
	--1
	if getElementData(arg2,"bleeding") > 0 and getElementData(getLocalPlayer(),"Bandaż") >= 1 then
		startRollMessageMenu("Opatrz bandażem",255,255,255,"bandage")
		setElementData(localPlayer,"usedItemTrue", true)
	end	
	if getElementData(arg2,"blood") < 11900 and getElementData(getLocalPlayer(),"Paczka krwii") >= 1 then
		startRollMessageMenu("Przetocz krew",255,255,255,"giveblood")
		setElementData(localPlayer,"usedItemTrue", true)
	end
    end
	if arg1 == "Dead" then
		startRollMessageMenu("> Przeszukaj",255,255,255,"dead")
		startRollMessageMenu("> Godzina śmierci",255,255,255,"deadreason")
		setElementData(localPlayer,"usedItemTrue", true)
		
		if getElementData(localPlayer,"Łopata") >= 1 then
		startRollMessageMenu("> Ukryj ciało",255,255,255,"hidebody")
		end
		end
		--Костер
	if arg1 == "Fireplace" then
		if getElementData(getLocalPlayer(),"Surowe mięso") >= 1 then
			startRollMessageMenu("> Upiecz mięso",255,255,255,"fireplace")
			setElementData(localPlayer,"usedItemTrue", true)
		end
	end
	if arg1 == "patrol" then
		if getElementData(getLocalPlayer(),"Pusty kanister") >= 1 then
			startRollMessageMenu("> Napełnij kanister",255,255,255,"patrolstation")
			setElementData(localPlayer,"usedItemTrue", true)
		end
	end
	if arg1 == "Осмотреть" then
		startRollMessageMenu("> Przeszukaj",255,255,255,"itemloot")
		setElementData(localPlayer,"usedItemTrue", true)
	end
	numberMenuScroll = 1
end
addEvent("showClientMenuItem",true)
addEventHandler("showClientMenuItem",getLocalPlayer(),showClientMenuItem)

function PlayerScrollMenuLalitka (key,keyState,arg)
	if getElementData(localPlayer,"usedItemTrue") then
		if ( keyState == "down" ) then
			if arg == "up" then
				numberMenuScroll = numberMenuScroll-1
				if numberMenuScroll < 1 then
					numberMenuScroll = #theTableMenuScroll
				end
			elseif arg == "down" then
				numberMenuScroll = numberMenuScroll+1
				if numberMenuScroll > #theTableMenuScroll then
					numberMenuScroll = 1
				end
			end
		end
	end
end
bindKey ( "mouse_wheel_up", "down", PlayerScrollMenuLalitka, "up" )
bindKey ( "mouse_wheel_down", "down", PlayerScrollMenuLalitka, "down" )


function disableMenu()
	theTableMenuScroll = {}
	setElementData(localPlayer,"usedItemTrue", false)
	setNewbieInfo (false,"","")
end
addEvent("disableMenu",true)
addEventHandler("disableMenu",getLocalPlayer(),disableMenu)

function refreshMenuCar()
	idd = numberMenuScroll
	theTableMenuScroll = {}
	setElementData(localPlayer,"usedItemTrue", false)
	setNewbieInfo (false,"","")
	showClientMenuItem("Vehicle",nil,getElementData(getElementData(localPlayer,"currentCol"),"parent"),getElementData(localPlayer,"currentCol"))
	numberMenuScroll = idd
end
addEvent("refreshMenuCar",true)
addEventHandler("refreshMenuCar",getLocalPlayer(),refreshMenuCar)

function getPlayerInCol(tab)
	for theKey,thePlayer in ipairs(tab) do
		if thePlayer ~= getLocalPlayer() then
			return true
		end
	end
	return false
end


isInFirePlace = false
function onPlayerTargetPickup (theElement)
	if getElementData(getLocalPlayer(),"isDead",true) then return end
	if theElement == getLocalPlayer() then
		if getElementData(source,"parent") == getLocalPlayer() then return end
		
		local player = getPlayerInCol(getElementsWithinColShape ( source, "player" ))-- проверка на лут
		if getPedOccupiedVehicle(getLocalPlayer()) then
			return
		end
		isInFirePlace = false
		setElementData(getLocalPlayer(),"isInFirePlace",false)
		if getElementData(source,"player") then
			showClientMenuItem("Player",getElementData(source,"parent"))
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			return
		end
		if player then
			return
		end
		if getElementData(source,"patrolstation") then
			showClientMenuItem("patrol")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			setNewbieInfo (true,"Заправка","Potrzeba: Pusty kanister",source)
			return
		end
		if getElementData(source,"fireplace") then
			showClientMenuItem("Fireplace")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			setNewbieInfo (true,"Fireplace","Potrzeba: Surowe mięso",source)
			isInFirePlace = true
			return
		end
		if getElementData(source,"deadman") then
			showClientMenuItem("Dead",getElementData(source,"playername"))
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Осмотреть","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"item") then
			showClientMenuItem("Take",getElementData(source,"item"))
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			setNewbieInfo (true,"Przedmiot","Podnieś\n"..getElementData(source,"item"),source)
			return
		end
		if getElementData(source,"helicrash") then
			showClientMenuItem("Helicrashsite","helicrash")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Осмотреть","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		
		if getElementData(source,"hospitalbox") then
			showClientMenuItem("Hospitalbox","hospitalbox")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Skrzynia","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"carhelpbox") then
			showClientMenuItem("Carhelpbox","carhelpbox")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Skrzynia","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"weaponbox") then
			showClientMenuItem("Weaponbox","weaponbox")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Skrzynia","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"wirefence") then
			showClientMenuItem("wirefence","wirefence")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Skrzynia","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"Meshok10") then
			showClientMenuItem("Meshok10","Meshok10")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Skrzynia","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"Meshok") then
			showClientMenuItem("Meshok","Meshok")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Skrzynia","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"Pokr") then
			showClientMenuItem("Pokr","Pokr")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Skrzynia","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"Esh") then
			showClientMenuItem("Esh","Esh")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Skrzynia","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"Esh10") then
			showClientMenuItem("Esh10","Esh10")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Przeszukaj")
			setNewbieInfo (true,"Skrzynia","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		if getElementData(source,"vehicle") then
			if not getElementData(source,"deadVehicle") then
				showClientMenuItem("Vehicle",(getVehicleName(getElementData(source,"parent"))),getElementData(source,"parent"),source)
				setElementData(getLocalPlayer(),"currentCol",source)
				setElementData(getLocalPlayer(),"loot",true)
				setElementData(getLocalPlayer(),"lootname","Przeszukaj")
				setNewbieInfo (true,"Przeszukaj","Naciśnij 'J' aby przeszukać.",source)
				return
			end
		end
		if getElementData(source,"itemloot") then
			showClientMenuItem("Осмотреть")
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Осмотреть")
			setElementData(getLocalPlayer(),"currentCol",source)
			setNewbieInfo (true,"Осмотреть","Naciśnij 'J' aby otworzyć inwentarz.",source)
			return
		end
		showClientMenuItem("stop")
	end
end
addEventHandler("onClientColShapeHit",getRootElement(),onPlayerTargetPickup)

function onPlayerTargetPickup (theElement)
	if theElement == getLocalPlayer() then
		local players = getElementsWithinColShape ( source, "player" )
		if players == getLocalPlayer() then end
		showClientMenuItem("stop")
		setElementData(getLocalPlayer(),"loot",false)
		setElementData(getLocalPlayer(),"currentCol",false)
		setElementData(getLocalPlayer(),"near_trader",false)
		setElementData(getLocalPlayer(),"near_trader_shape",nil )
		setNewbieInfo (false,"","")
		isInFirePlace = false
		setElementData(getLocalPlayer(),"isInFirePlace",false)
	end
end
addEventHandler("onClientColShapeLeave",getRootElement(),onPlayerTargetPickup)

local screenWidth, screenHeight = guiGetScreenSize()
local newbieShow = false
local newbieHead = "-"
local newbieText = "-"
local newbiePosition = 0,0,0

function setNewbieInfo (show,head,text,element)
	newbieShow = show
	newbieHead = head
	newbieText = text
	newbiePosition = element
end

addEventHandler("onClientRender", getRootElement(),function()
	local veh = getPedOccupiedVehicle (getLocalPlayer())
	if veh then
		disableMenu()
	else
		for id, value in pairs(theTableMenuScroll) do
			if id == numberMenuScroll then
				r1menu,g1menu,b1menu = 255,0,0
			else
				r1menu,g1menu,b1menu = 255,255,255
			end
			dxDrawRectangle ( 0, 250+id*boxSpace, screenWidth*0.2, boxSpace, tocolor (0,0,0,150) )
			dxDrawingColorTextMenuScroll(value[1],0, 250+id*boxSpace, 7, 250+(id+1)*boxSpace, tocolor(r1menu,g1menu,b1menu,170),170, 1, "sans", "center", "center")
		end
	end
	if getElementData(getLocalPlayer(),"isDead") == true then return end
	if newbieShow == false then return end
	local x,y,z = getElementPosition(newbiePosition)
	local x,y = getScreenFromWorldPosition (x,y,z)
	local length = dxGetTextWidth(newbieText,1,"default-bold")
	if x == false or y == false or z == false then return end
	dxDrawImage ( x,y,screenWidth*0.027, screenHeight*0.04, "images/items.png",tocolor(255,255,255))

	--[[
	
	--Vehicletags
		local x,y,z = getElementPosition(getLocalPlayer())
		for i,veh in ipairs(getElementsByType("vehicle")) do
			local px,py,pz = getElementPosition (veh)
			local vehID = getElementModel(veh)
			local vehicle = getPedOccupiedVehicle(getLocalPlayer())
			if veh ~= vehicle then
				if vehID ~= 548 then
					local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
					if pdistance <= 6 then
						local sx,sy = getScreenFromWorldPosition ( px, py, pz)
						if sx and sy then
							dxDrawImage ( sx+50,sy,screenWidth*0.027, screenHeight*0.04, "images/items.png",tocolor(255,255,255))
						end
					end
				end
			end
		end
]]
end)

function fireRaiseTemperature ()
	if isInFirePlace then
		if getElementData(getLocalPlayer(),"temperature") <= 38 then
			setElementData(getLocalPlayer(),"temperature",getElementData(getLocalPlayer(),"temperature")+0.2)
		end
	end
end
setTimer(fireRaiseTemperature,10000,0)

local guiTABLE = {}
local screenW, screenH = guiGetScreenSize()
addEventHandler("onClientResourceStart", resourceRoot,function()
	guiTABLE["WINDOW"] = guiCreateWindow((screenW - 293) / 2, (screenH - 115) / 2, 293, 115, "", false)
	guiTABLE["BUTTON_1"] = guiCreateButton(10, 79, 115, 24, "Да", false, guiTABLE["WINDOW"])
	guiTABLE["BUTTON_2"] = guiCreateButton(168, 79, 115, 24, "Нет", false, guiTABLE["WINDOW"])
	guiTABLE["LABEL"] = guiCreateLabel(9, 22, 274, 47, " Jeśli zwiniesz namiot\n To rzeczy, które się w nim znajdują zostana usunięte!\n Na pewno chcesz to zrobić?", false, guiTABLE["WINDOW"])

	guiSetFont(guiTABLE["LABEL"], "default-bold-small")  
	guiWindowSetSizable(guiTABLE["WINDOW"], false)
	guiSetVisible(guiTABLE["WINDOW"],false)
	
	addEventHandler("onClientGUIClick",guiTABLE["BUTTON_1"],button_removeTent)
	addEventHandler("onClientGUIClick",guiTABLE["BUTTON_2"],function()
		guiSetVisible(guiTABLE["WINDOW"],false)
		showCursor(false)
	end)
end)

unbindKey("mouse3","both")
function onPlayerPressMiddleMouse (key,keyState)
	if ( keyState == "down" ) then
		if not getElementData(localPlayer,"usedItemTrue") then return end
		local itemName = getMenuMarkedItem()
		if itemName == "helicrashsite" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Przeszukaj"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "itemloot" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Осмотреть"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "hospitalbox" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Przeszukaj"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "carhelpbox" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Przeszukaj"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "weaponbox" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Przeszukaj"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "wirefence" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("removeWirefence", getLocalPlayer(), getElementData(col, "parent"))
			disableMenu()
			return
		end
		if itemName == "Meshok10" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("removeMeshok10", getLocalPlayer(), getElementData(col, "parent"))
			disableMenu()
			return
		end
		if itemName == "Meshok" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("removeMeshok", getLocalPlayer(), getElementData(col, "parent"))
			disableMenu()
			return
		end
		if itemName == "Pokr" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("removePokr", getLocalPlayer(), getElementData(col, "parent"))
			disableMenu()
			return
		end
		if itemName == "Esh" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("removeEsh", getLocalPlayer(), getElementData(col, "parent"))
			disableMenu()
			return
		end
		if itemName == "Esh10" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("removeEsh10", getLocalPlayer(), getElementData(col, "parent"))
			disableMenu()
			return
		end
	    if itemName == "vehicle" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Przeszukaj ("..(getVehicleName(getElementData(col,"parent")) or "Namiot")..")"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "repairvehicle" then
			if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
				local col = getElementData(getLocalPlayer(),"currentCol")
				triggerServerEvent("repairVehicle",getLocalPlayer(),getElementData(col,"parent"))
			else
				startRollMessage2("Inventory", "Nie masz narzędzi!", 255, 0, 0 )
			end
			playSound ("sounds/5.mp3")
			disableMenu()
			return
		end
		if itemName == "setArmor" then
			if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
				if getElementData(getLocalPlayer(),"Pancerz sam.") < 1 then 
					triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Nie masz pancerzu!",255,0,0)
					disableMenu()
					refreshMenuCar()
					return
				end	
				local col = getElementData(getLocalPlayer(),"currentCol")
				if(getElementData(col,"vehicle_armor") or 0) > 0 then
					triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Ten samochód jest już wzmocniony!",255,0,0)
					disableMenu()
					refreshMenuCar()
					return
				end	
				triggerServerEvent("setArmourVehicle",getLocalPlayer(),getElementData(getLocalPlayer(),"currentCol"))
			else
				startRollMessage2("Inventory", "Nie masz narzędzi!", 255, 0, 0 )
			end
			disableMenu()
			refreshMenuCar()
			return
		end
		
		if itemName == "setRaket" then
			if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
				if getElementData(getLocalPlayer(),"BGM-71 TOW") < 1 then 
					triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Nie masz BGM-71!",255,0,0)
					disableMenu()
					refreshMenuCar()
					return
				end	
				local col = getElementData(getLocalPlayer(),"currentCol")
				if(getElementData(col,"raket") or 0) > 0 then
					triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Ten samochód ma już zamontowany BGM-71!",255,0,0)
					disableMenu()
					refreshMenuCar()
					return
				end	
				triggerServerEvent("setRaketVehicle",getLocalPlayer(),getElementData(getLocalPlayer(),"currentCol"))
			else
				startRollMessage2("Inventory", "Nie masz narzędzi!", 255, 0, 0 )
			end
			disableMenu()
			refreshMenuCar()
			return
		end
		
		if itemName == "FuelOne" then
			if (getElementData(getLocalPlayer(),"Pełny kanister") or 0) >= 1 then
				local col = getElementData(getLocalPlayer(),"currentCol")
				if getElementData(col,"fuel")+20 < getVehicleMaxFuel(col) then
					addingfuel = 20
				elseif getElementData(col,"fuel")+20 > getVehicleMaxFuel(col)+15 then
					triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Bak jest pełny!",255,0,0)
					disableMenu()
					return
				else
					addingfuel = getVehicleMaxFuel(col)-getElementData(col,"fuel")
				end
				setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant", -1,false,false,false,false)
				setElementData(getLocalPlayer(),"Pełny kanister",getElementData(getLocalPlayer(),"Pełny kanister")-1)
				setElementData(getLocalPlayer(),"Pusty kanister",(getElementData(getLocalPlayer(),"Pusty kanister") or 0)+1)
				setElementData(col,"fuel",getElementData(col,"fuel")+addingfuel)
				triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Napełniasz bak",255,222,173)
			else
				startRollMessage2("Inventory", "Nie masz pełnego kanistra!", 255, 0, 0 )
			end
			playSound ("sounds/7.ogg")
			refreshMenuCar()
			return
		end
		if itemName == "FuelTwo" then
			if (getElementData(getLocalPlayer(),"Pusty kanister") or 0) >= 1 then
				local col = getElementData(getLocalPlayer(),"currentCol")
				setElementData(getLocalPlayer(),"Pełny kanister",getElementData(getLocalPlayer(),"Pełny kanister")+1)
				setElementData(getLocalPlayer(),"Pusty kanister",(getElementData(getLocalPlayer(),"Pusty kanister") or 0)-1)
				setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant", -1,false,false,false,false)
				setElementData(col,"fuel",getElementData(col,"fuel")-20)
				triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Spuściłeś benzynę",255,222,173)
			else
				startRollMessage2("Inventory", "Nie masz pustego kanistra!", 255, 0, 0 )
			end
			refreshMenuCar()
			return
		end
		if itemName == "TireOne" then
			if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
				if (getElementData(getLocalPlayer(),"Koło") or 0) > 0 then	
					local col = getElementData(getLocalPlayer(),"currentCol")
					setElementData(col,"Tire_inVehicle",(getElementData(col,"Tire_inVehicle") or 0)+1)
					setElementData(getLocalPlayer(),"Koło",(getElementData(getLocalPlayer(),"Koło") or 0)-1)
					setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant", -1,false,false,false,false)
				else
					startRollMessage2("Inventory", "Nie masz koła!", 255, 0, 0 )
				end
			else
				startRollMessage2("Inventory", "Nie masz narzędzi!", 255, 0, 0 )
			end
			refreshMenuCar()
			return
		end
		if itemName == "TireTwo" then
			if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
				if getPlayerCurrentSlots() + 2 <= getPlayerMaxAviableSlots() then 
					local col = getElementData(getLocalPlayer(),"currentCol")
					if (getElementData(col,"Tire_inVehicle") or 0) > 0 then	
						local col = getElementData(getLocalPlayer(),"currentCol")
						setElementData(col,"Tire_inVehicle",(getElementData(col,"Tire_inVehicle") or 0)-1)
						setElementData(getLocalPlayer(),"Koło",(getElementData(getLocalPlayer(),"Koło") or 0)+1)
						setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant", -1,false,false,false,false)
					else
						startRollMessage2("Inventory", "Ten pojazd nie ma koła!", 255, 0, 0 )
					end
				else 
					startRollMessage2("Inventory", "Nie masz miejsca w ekwipunku!", 255, 0, 0 )
				end 
			else
				startRollMessage2("Inventory", "Nie masz narzędzi!", 255, 0, 0 )
			end
			refreshMenuCar()
			return
		end
		if itemName == "EngineOne" then
			if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
				if (getElementData(getLocalPlayer(),"Akumulator") or 0) > 0 then	
					local col = getElementData(getLocalPlayer(),"currentCol")
					setElementData(col,"Engine_inVehicle",(getElementData(col,"Engine_inVehicle") or 0)+1)
					setElementData(getLocalPlayer(),"Akumulator",(getElementData(getLocalPlayer(),"Akumulator") or 0)-1)
					setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant", -1,false,false,false,false)
				else
					startRollMessage2("Inventory", "Nie masz akumulatora!", 255, 0, 0 )
				end
			else
				startRollMessage2("Inventory", "Nie masz narzędzi!", 255, 0, 0 )
			end
			refreshMenuCar()
			return
		end
		if itemName == "EngineTwo" then
			if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
				if getPlayerCurrentSlots() + 5 <= getPlayerMaxAviableSlots() then 
					local col = getElementData(getLocalPlayer(),"currentCol")
					if (getElementData(col,"Engine_inVehicle") or 0) > 0 then	
						local col = getElementData(getLocalPlayer(),"currentCol")
						setElementData(col,"Engine_inVehicle",(getElementData(col,"Engine_inVehicle") or 0)-1)
						setElementData(getLocalPlayer(),"Akumulator",(getElementData(getLocalPlayer(),"Akumulator") or 0)+1)
						setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant", -1,false,false,false,false)
					else
						startRollMessage2("Inventory", "Ten pojazd nie ma akumulatora!", 255, 0, 0 )
					end
				else 
					startRollMessage2("Inventory", "Nie masz miejsca w ekwipunku!", 255, 0, 0 )
				end 
			else
				startRollMessage2("Inventory", "Nie masz narzędzi!", 255, 0, 0 )
			end
			refreshMenuCar()
			return
		end
		if itemName == "PartsOne" then
			if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
				if (getElementData(getLocalPlayer(),"Świeca") or 0) > 0 then	
					local col = getElementData(getLocalPlayer(),"currentCol")
					setElementData(col,"Parts_inVehicle",(getElementData(col,"Parts_inVehicle") or 0)+1)
					setElementData(getLocalPlayer(),"Świeca",(getElementData(getLocalPlayer(),"Świeca") or 0)-1)
					setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant", -1,false,false,false,false)
				else
					startRollMessage2("Inventory", "Nie masz świecy!", 255, 0, 0 )
				end
			else
				startRollMessage2("Inventory", "Nie masz narzędzi!", 255, 0, 0 )
			end
			refreshMenuCar()
			return
		end
		if itemName == "PartsTwo" then
			if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
				if getPlayerCurrentSlots() + 3 <= getPlayerMaxAviableSlots() then 
					local col = getElementData(getLocalPlayer(),"currentCol")
					if (getElementData(col,"Parts_inVehicle") or 0) > 0 then	
						local col = getElementData(getLocalPlayer(),"currentCol")
						setElementData(col,"Parts_inVehicle",(getElementData(col,"Parts_inVehicle") or 0)-1)
						setElementData(getLocalPlayer(),"Świeca",(getElementData(getLocalPlayer(),"Świeca") or 0)+1)
						setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant", -1,false,false,false,false)
					else
						startRollMessage2("Inventory", "Ten pojazd nie ma świecy!", 255, 0, 0 )
					end
				else 
					startRollMessage2("Inventory", "Nie masz miejsca w ekwipunku!", 255, 0, 0 )
				end 
			else
				startRollMessage2("Inventory", "Nie masz narzędzi!", 255, 0, 0 )
			end
			refreshMenuCar()
			return
		end
		if itemName == "tent" then
			guiSetVisible(guiTABLE["WINDOW"],true)
			showCursor(true)
			disableMenu()
			return
		end
		if itemName == "sleeptent" then
			fadeCamera(false,1)
			setElementFrozen(getLocalPlayer(),true)
			setTimer(function()
				setElementData(getLocalPlayer(),"sleep",400)
				fadeCamera(true,1)
				setElementFrozen(getLocalPlayer(),false)
			end,11*1000,1)
			disableMenu()
			return
		end
		--Костер
		if itemName == "fireplace" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("addPlayerCookMeat",getLocalPlayer())
			disableMenu()
			return
		end
		if itemName == "bandage" then
			local col = getElementData(getLocalPlayer(),"currentCol")
				triggerServerEvent("onPlayerGiveMedicObject",getLocalPlayer(),itemName,getElementData(col,"parent"))
				disableMenu()
			return
		end
		if itemName == "giveblood" then
			local col = getElementData(getLocalPlayer(),"currentCol")
				triggerServerEvent("onPlayerGiveMedicObject",getLocalPlayer(),itemName,getElementData(col,"parent"))
				disableMenu()
			return
		end
		if itemName == "dead" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Przeszukaj"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "hidebody" then 
			if getElementData ( localPlayer, "Łopata" ) then   
				--startRollMessage2("Inventory", "Вы прячите тело "..getElementData ( col, "playername" , 255, 0, 0 )
				triggerServerEvent ( "hideBodyClient", localPlayer )
				disableMenu()   
			else   
				startRollMessage2("Inventory", "Aby ukryć ciało, potrzeba łopaty!", 255, 0, 0 )
			return
			end
		end
		if itemName == "deadreason" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			outputChatBox(getElementData(col,"deadreason"),244,244,244,true)
			return
		end
		if itemName == "patrolstation" then
			local col = getElementData(getLocalPlayer(),"currentCol")
				setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant", -1,false,false,false,false)
				setElementData(getLocalPlayer(),"Pusty kanister",getElementData(getLocalPlayer(),"Pusty kanister")-1)
				setTimer ( function()
					setElementData(getLocalPlayer(),"Pełny kanister",(getElementData(getLocalPlayer(),"Pełny kanister") or 0)+1)
					triggerEvent ("displayClientInfo",getLocalPlayer(),"patrolstation","Zbiornik jest pełny!",255,0,0)
				end, 5000, 1 )
				disableMenu()
			return
		end
		if isToolbeltItem(itemName) then 
           local col = getElementData(getLocalPlayer(), "currentCol") 
           if #getElementsWithinColShape(col, "player") > 1 or getNetworkStats().packetlossLastSecond > 1 then        
                return        
            end 
            x, y, z = getElementPosition(getLocalPlayer()) 
            if pcount ~= nil and pcount < getTickCount() then 
                 pcount = getTickCount() + math.random(1800,2200)        
                 x, y, z = getElementPosition(getLocalPlayer()) 
                 return false 
               elseif pcount == nil then 
                 pcount = getTickCount() + math.random(1800,2200) 
                 x, y, z = getElementPosition(getLocalPlayer()) 
                 return false 
               end 
               local x1, y1, z1 = getElementPosition(getLocalPlayer()) 
               if x1 ~= x or y1 ~= y or z1 ~= z then 
                 pcount = nil 
               return false 
             end 
             pcount = nil 
             triggerServerEvent("onPlayerTakeItemFromGround", getLocalPlayer(), itemName, col) 
             disableMenu() 
             return 
           end        
              if itemName == "Рюкзак выжившего" or itemName == "Большой рюкзак" or itemName == "Камуфляжный рюкзак" or itemName == "Рюкзак снайпера" or itemName =="Плюшевый рюкзак" or itemName =="Рюкзак SK" or itemName =="Вместительный рюкзак" or itemName == "Военный рюкзак" then
          local col = getElementData(getLocalPlayer(),"currentCol") 
          triggerServerEvent("onPlayerTakeItemFromGround",getLocalPlayer(),itemName,col) 
          disableMenu() 
          return 
         end        
         if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then 
               local col = getElementData(getLocalPlayer(), "currentCol") 
               if #getElementsWithinColShape(col, "player") > 1 or getNetworkStats().packetlossLastSecond > 1 then        
                 return        
               end 
               x, y, z = getElementPosition(getLocalPlayer()) 
               if pcount ~= nil and pcount < getTickCount() then 
                 pcount = getTickCount() + math.random(1800,2200) 
                 x, y, z = getElementPosition(getLocalPlayer()) 
                 return false 
               elseif pcount == nil then 
                 pcount = getTickCount() + math.random(1800,2200) 
                 x, y, z = getElementPosition(getLocalPlayer()) 
                 return false 
               end 
               local x1, y1, z1 = getElementPosition(getLocalPlayer()) 
               if x1 ~= x or y1 ~= y or z1 ~= z then 
                 pcount = nil 
                 return false 
               end 
               pcount = nil 
               triggerServerEvent("onPlayerTakeItemFromGround", getLocalPlayer(), itemName, col) 
               disableMenu() 
            else 
             startRollMessage2("Inventory", "Inwentarz jest pełny!", 255, 22, 0) 
           end 
         end 
end 
bindKey ( "mouse3", "down", onPlayerPressMiddleMouse )
bindKey ( "-", "down", onPlayerPressMiddleMouse )

function button_removeTent()
	local col = getElementData(getLocalPlayer(),"currentCol")
	if getElementData ( col, "MAX_Slots" ) == 252 then
	triggerServerEvent("removeTent1", getLocalPlayer(), getElementData(col, "parent"))
	elseif getElementData ( col, "MAX_Slots" ) == 300 then
	triggerServerEvent("removeTent1", getLocalPlayer(), getElementData(col, "parent"))
	elseif getElementData ( col, "MAX_Slots" ) == 60 then
	triggerServerEvent("removeTent2", getLocalPlayer(), getElementData(col, "parent"))
	elseif getElementData ( col, "MAX_Slots" ) == 168 then
	triggerServerEvent("removeTent3", getLocalPlayer(), getElementData(col, "parent"))
	end
	guiSetVisible(guiTABLE["WINDOW"],false)
	showCursor(false)
end


function getMenuMarkedItem()
    for i,guiItem in ipairs(spalteGuiText) do
        if getElementData(guiItem,"markedMenuItem") then
            return getElementData(guiItem,"usedItem")
        end
    end
end

function playerPressedKey(button, press)
    if (press) then
        if button == "w" or button == "a" or button == "s" or button == "d" then
            local anim,anim2 = getPedAnimation (getLocalPlayer())
            if anim and anim == "SCRATCHING" and anim2 == "sclng_r" then
                triggerServerEvent("onClientMovesWhileAnimation",getLocalPlayer())
            end
        end
    end
end

function getMenuMarkedItem()
	for id, value in pairs(theTableMenuScroll) do
		if id == numberMenuScroll then
			return value[5]
		end
	end
end

addEvent("playMyMusic",true)
addEventHandler("playMyMusic", getRootElement(), function()
local sound = playSound("sounds/siren.mp3",false) 
setSoundVolume(sound, 1.0)
end)


addEvent("fireplaceSound",true)
addEventHandler("fireplaceSound",getRootElement(),function(x,y,z)
	fireSound = playSound3D("1-5/fire.mp3",x,y,z,true)
	setSoundMaxDistance(fireSound, 15)
end)


addEvent("fireplaceStop",true)
addEventHandler("fireplaceStop",getRootElement(),function()
	stopSound(fireSound)
	if isElement(fireSound) then
		destroyElement(fireSound)
	end
end)
   