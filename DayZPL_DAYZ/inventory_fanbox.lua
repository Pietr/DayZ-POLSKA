--
--
--
--
--
--

local screenWidth,screenHeight = guiGetScreenSize()
local button = dxCreateTexture ( "inventory/butoff.png" )
local button2 = dxCreateTexture ( "inventory/butclick.png" )
local buttArrow = dxCreateTexture ( "inventory/buttArrow.png" )
local buttArrowDown = dxCreateTexture ( "inventory/buttArrowDown.png" )
inventoryShow = false
bX, bY = screenWidth/2,screenHeight/2
loot = false

inventory = {}
inventoryWeap = {}
inventoryWeap.main = {}
inventoryWeap.addit = {}
inventoryWeap.spec = {}
inventoryWeap.ammo = {}
rucksakSelectionLabels = {}

foodInventory={}
toolInventory={}
gearName = ''
loot = false

prevY = 0
prevYPos = 0
itOff = 0
heightLabel = ((screenHeight/2+90)-5*(#inventory-9))-(screenHeight/2-235)

local clicked=false
scrollLabelSelected = false

mainWeaponSelection = false
additWeaponSelection = false
selectedMainWeapon = 0
selectedAdditWeapon = 0
selectedItemLabel = 0
selectedFoodLabelID = 0
selectedToolLabelID = 0
selectedSpecLabelID = 0
foodLabelSelected = false
specLabelSelected = false
toolLabelSelected = false

itemLabels = {}
itemLabelsButtons = {}
foodLabelsButtons={}
toolLabelsButtons={}

function getThisItemInLoot (name)
	local loot = isPlayerInLoot()
	if isElement(loot) then
		local item = getElementData ( loot, name )
		return item or 0
	else
		return 0
	end
end

function removeItemFromInventory (name)
	for i, weap in ipairs ( inventoryWeap.main ) do
		if name == weap[1] then
			if selectedMainWeapon == i then
				selectedMainWeapon = 0
			elseif selectedMainWeapon > i then
				selectedMainWeapon = selectedMainWeapon-1
			end
			table.remove ( inventoryWeap.main, i ) 
		end
	end
	for i, weap in ipairs ( inventoryWeap.addit ) do
		if name == weap[1] then
			if selectedMainWeapon == i then
				selectedMainWeapon = 0
			elseif selectedMainWeapon > i then
				selectedMainWeapon = selectedMainWeapon-1
			end
			table.remove ( inventoryWeap.addit, i ) 
		end
	end
	for i, weap in ipairs ( inventoryWeap.spec ) do
		if name == weap[1] then
			table.remove ( inventoryWeap.spec, i )
		end
	end
	for i, weap in ipairs ( foodInventory ) do
		if name == weap[1] then
			table.remove ( foodInventory, i )
		end
	end
	for i, weap in ipairs ( toolInventory ) do
		if name == weap[1] then
			table.remove ( toolInventory, i )
		end
	end
end


function placeItemsInInventory()
	local loot = isPlayerInLoot()
	inventory = {}
	inventoryWeap = {}
	inventoryWeap.main = {}
	inventoryWeap.addit = {}
	inventoryWeap.spec = {}

	foodInventory={}
	toolInventory={}
	
	if getElementData ( localPlayer, "Inventory_Setting" ) == 1 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Weapons['Primary Weapon'] ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end
	if getElementData ( localPlayer, "Inventory_Setting" ) == 1 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Weapons['Secondary Weapon'] ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end
	if getElementData ( localPlayer, "Inventory_Setting" ) == 2 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Ammo ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end
	if getElementData ( localPlayer, "Inventory_Setting" ) == 1 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Weapons['Specially Weapon'] ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end
	if getElementData ( localPlayer, "Inventory_Setting" ) == 3 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Food ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end

	if getElementData ( localPlayer, "Inventory_Setting" ) == 4 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Medical ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end

	if getElementData ( localPlayer, "Inventory_Setting" ) == 5 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Items ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end

	if getElementData ( localPlayer, "Inventory_Setting" ) == 6 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Toolbelt ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end

	if getElementData ( localPlayer, "Inventory_Setting" ) == 7 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Cloth ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end
	
	if getElementData ( localPlayer, "Inventory_Setting" ) == 7 or getElementData ( localPlayer, "Inventory_Setting" ) == 8 then
	for i, weap in ipairs ( inventoryItems.Skin ) do
		local inLoot = getThisItemInLoot (weap[1]) or 0
		local inInventory = getElementData ( localPlayer, weap[1] ) or 0
		if inLoot > 0 or inInventory > 0 then
			table.insert ( inventory, {weap[1],inLoot,inInventory,weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end
	end
	
    for i, weap in ipairs ( inventoryItems.Food ) do
        if getElementData ( localPlayer, weap[1] ) and getElementData ( localPlayer, weap[1] ) >= 1 then
            table.insert ( foodInventory, {weap[1],weap[3],weap[4],weap[5],weap[6],weap[7]} )
        end
    end
	for i, weap in ipairs ( inventoryItems.Toolbelt ) do
		if getElementData ( localPlayer, weap[1] ) and getElementData ( localPlayer, weap[1] ) >= 1 then
			table.insert ( toolInventory, {weap[1],weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end

	for i, weap in ipairs ( inventoryItems.Medical ) do
		if getElementData ( localPlayer, weap[1] ) and getElementData ( localPlayer, weap[1] ) >= 1 then
			table.insert ( inventoryWeap.spec, {weap[1],weap[3],weap[4],weap[5],weap[6],weap[7]} )
		end
	end

		for i, weap in ipairs ( inventoryItems.Weapons['Primary Weapon'] ) do
		if getElementData ( localPlayer, weap[1] ) and getElementData ( localPlayer, weap[1] ) >= 1 then
			table.insert ( inventoryWeap.main, {weap[1],weap[3],weap[4],weap[5]} )
			if getElementData(localPlayer, "currentweapon_1") == weap[1] then
				selectedMainWeapon = #inventoryWeap.main
			end
		end
	end
		for i, weap in ipairs ( inventoryItems.Weapons['Secondary Weapon'] ) do
		if getElementData ( localPlayer, weap[1] ) and getElementData ( localPlayer, weap[1] ) >= 1 then
			table.insert ( inventoryWeap.addit, {weap[1],weap[3],weap[4],weap[5],weap[6],weap[7]} )
			if getElementData(localPlayer, "currentweapon_2") == weap[1] then
				selectedAdditWeapon = #inventoryWeap.addit
			end
		end
	end

end

function testoLabClick (but, state, x, y)
	clicked = false
end

addEventHandler( "onClientMouseWheel", root,
    function ( up_down )
        if up_down == 1 then
			if itOff > 0 then
				itOff = itOff-1
				prevY = prevY+5
				guiSetPosition ( testoLab, screenWidth/2-13, screenHeight/2-235-prevY, false )
			end
		else
			if itOff+9 < #inventory then
				itOff = itOff+1
				prevY = prevY-5
				guiSetPosition ( testoLab, screenWidth/2-13, screenHeight/2-235-prevY, false )
			end
		end
    end
)

function testoLabMove (x,y)
	if clicked then
		local newPrevY = prevY+prevYPos-y
		local tempVal = math.abs(prevY)-math.abs(newPrevY)
		if ( ( tempVal > 0 and prevY <= 0 ) or ( tempVal < 0 and itOff+9<#inventory ) ) and tempVal ~= 0 and prevY < 3 and prevY+newPrevY < 0 then
			prevY=newPrevY
			itOff = math.floor(math.abs(prevY/5))
			prevYPos = y
			guiSetPosition ( testoLab, screenWidth/2-13, screenHeight/2-235-prevY, false )
		end
	end
end

function buttonLabelEntered ( )
	if getElementData ( source, 'scrollLabel' )then
		scrollLabelSelected = true
	--	stopAdditWeaponSelection ()
	--	stopMainWeaponSelection ()
		if selectedItemLabel ~= 0 then
			exports.imageButton:setImageButtonVisible ( itemLabelsButtons[selectedItemLabel][1].name, false )
			exports.imageButton:setImageButtonVisible ( itemLabelsButtons[selectedItemLabel][2].name, false )
			selectedItemLabel = 0
		end
	end
end

function buttonLabelLeaved ( )
	if getElementData ( source, 'scrollLabel' ) then
		scrollLabelSelected = false
	end
end

function checkOnButton ()
	if scrollLabelSelected then
		local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
		prevYPos = screeny*screenHeight
		clicked = true
	end
end

local inventoryButtAllowed = true

function showInventoryManual ()
	if not inventoryShow then
		initInventory ()
	end
end

function unshowInventoryManual ()
	if inventoryShow then
		closeInventory ()
	end
end


function initInventory ()
	if inventoryButtAllowed and getElementData(getLocalPlayer(), "logedin") and getElementData ( localPlayer, "Inventory" ) == 1 then
		inventoryButtAllowed = false
		setTimer ( function () inventoryButtAllowed = true end, 100, 1 )
		if not inventoryShow then
			inventoryShow = true
			loot = false
			placeItemsInInventory ()
			loot = isPlayerInLoot()
			if loot then
				gearName = getElementData(getLocalPlayer(), "lootname") 
			end

			testoLab = guiCreateLabel ( screenWidth/2-16, screenHeight/2-235, 0.1, heightLabel, '', false )
			setElementData ( testoLab, 'scrollLabel', true )
			bindKey ( 'mouse1', 'down', checkOnButton )
			bindKey ( 'mouse1', 'up', testoLabClick )
			heightLabel = ((screenHeight/2+90)-5*(#inventory-9))-(screenHeight/2-235)
			addEventHandler ( "onClientMouseMove", testoLab, testoLabMove, false )
			addEventHandler( "onClientMouseEnter", testoLab, buttonLabelEntered, false )
			addEventHandler( "onClientMouseLeave", testoLab, buttonLabelLeaved, false )
			
			exports.imageButton:createImageButton ( 'mainWeap', screenWidth/2+568,screenHeight/2-310, 64, 64, 0, ':DayZPL_DAYZ/inventory/butoff.png', ':DayZPL_DAYZ/inventory/butclick.png' )
			exports.imageButton:createImageButton ( 'secWeap', screenWidth/2+568,screenHeight/2-240, 64, 64, 0, ':DayZPL_DAYZ/inventory/butoff.png', ':DayZPL_DAYZ/inventory/butclick.png' )
			
			exports.imageButton:createImageButton ( 'Inventory_1', screenWidth/2-675,screenHeight/2+300, 89, 32, 0, ':DayZPL_DAYZ/inventory/icon1.png', ':DayZPL_DAYZ/inventory/icon1_on.png' )
			exports.imageButton:createImageButton ( 'Inventory_2', screenWidth/2-590,screenHeight/2+300, 32, 32, 0, ':DayZPL_DAYZ/inventory/icon2.png', ':DayZPL_DAYZ/inventory/icon2_on.png' )
			exports.imageButton:createImageButton ( 'Inventory_3', screenWidth/2-550,screenHeight/2+300, 44, 32, 0, ':DayZPL_DAYZ/inventory/icon3.png', ':DayZPL_DAYZ/inventory/icon3_on.png' )
			exports.imageButton:createImageButton ( 'Inventory_4', screenWidth/2-500,screenHeight/2+300, 35, 32, 0, ':DayZPL_DAYZ/inventory/icon4.png', ':DayZPL_DAYZ/inventory/icon4_on.png' )
			exports.imageButton:createImageButton ( 'Inventory_5', screenWidth/2-450,screenHeight/2+300, 32, 32, 0, ':DayZPL_DAYZ/inventory/icon5.png', ':DayZPL_DAYZ/inventory/icon5_on.png' )
			exports.imageButton:createImageButton ( 'Inventory_6', screenWidth/2-400,screenHeight/2+300, 32, 32, 0, ':DayZPL_DAYZ/inventory/icon6.png', ':DayZPL_DAYZ/inventory/icon6_on.png' )
			exports.imageButton:createImageButton ( 'Inventory_7', screenWidth/2-350,screenHeight/2+300, 32, 32, 0, ':DayZPL_DAYZ/inventory/icon7.png', ':DayZPL_DAYZ/inventory/icon7_on.png' )
			exports.imageButton:createImageButton ( 'Inventory_8', screenWidth/2-307,screenHeight/2+300, 34, 32, 0, ':DayZPL_DAYZ/inventory/icon8.png', ':DayZPL_DAYZ/inventory/icon8_on.png' )
			exports.imageButton:createImageButton ( 'Inventory_OLD', screenWidth/2+148+70,screenHeight/2+320, 64, 64, 0, ':DayZPL_DAYZ/inventory/old.png', ':DayZPL_DAYZ/inventory/old_on.png' )
			addEventHandler ( "onClientRender", root, renderDisplay )
			--Панель луту
			local yOff = 0
			for i = 1, 9 do -- 385 и 350
				local createdLabel = guiCreateLabel ( bX-675, bY-315+yOff, 400, 64, '', false )
				setElementData ( createdLabel, 'itemLabel', true )
				setElementData ( createdLabel, 'id', i )
				addEventHandler( "onClientMouseEnter", createdLabel, itemLabelEntered, false )
				addEventHandler( "onClientMouseLeave", createdLabel, itemLabelLeaved, false )
				addEventHandler( "onClientGUIDoubleClick", createdLabel, itemLabelClicked, false )
				local butt1 = exports.imageButton:createImageButton ( 'arrow'..i, bX-675, bY-315+yOff, 23, 64, 0, ':DayZPL_DAYZ/inventory/buttArrow.png', ':DayZPL_DAYZ/inventory/buttArrowDown.png' )
				local butt2 = exports.imageButton:createImageButton ( 'arrowRev'..i, bX-297, bY-315+yOff, 23, 64, 180, ':DayZPL_DAYZ/inventory/buttArrow.png', ':DayZPL_DAYZ/inventory/buttArrowDown.png' )
				exports.imageButton:setImageButtonVisible ( 'arrow'..i, false )
				exports.imageButton:setImageButtonVisible ( 'arrowRev'..i, false )
				table.insert ( itemLabelsButtons, { butt1, butt2 } )
				table.insert ( itemLabels, createdLabel )
				yOff = yOff+64
			end
						--Панель їжі
				xOff = 148
				for i = 1,6 do 
				xOff = xOff+70
                local createdLabel = guiCreateLabel ( bX+xOff, bY+110, 64, 64, '', false )
                setElementData ( createdLabel, 'foodLabel', true )
                setElementData ( createdLabel, 'id', i )
                addEventHandler( "onClientMouseEnter", createdLabel, itemLabelEntered, false )
                addEventHandler( "onClientMouseLeave", createdLabel, itemLabelLeaved, false )
                addEventHandler ( "onClientGUIDoubleClick", createdLabel, rightItemClicked, false )
                table.insert ( foodLabelsButtons, createdLabel )
            end
			--Панель инструменти
				xOff = 148
				for i = 1,6 do 
				xOff = xOff+70
				local createdLabel = guiCreateLabel ( bX+xOff, bY+250, 64, 64, '', false )
				setElementData ( createdLabel, 'toolLabel', true )
				setElementData ( createdLabel, 'id', i )
				addEventHandler( "onClientMouseEnter", createdLabel, itemLabelEntered, false )
				addEventHandler( "onClientMouseLeave", createdLabel, itemLabelLeaved, false )
				addEventHandler ( "onClientGUIDoubleClick", createdLabel, rightItemClicked, false )
				table.insert ( toolLabelsButtons, createdLabel )
			end
			--Панель медикаменти
				xOff = 148
				for i = 1,6 do
				xOff = xOff+70
				local createdLabel = guiCreateLabel ( bX+xOff, bY-30, 64, 64, '', false )
				setElementData ( createdLabel, 'specLabel', true )
				setElementData ( createdLabel, 'id', i )
				addEventHandler( "onClientMouseEnter", createdLabel, itemLabelEntered, false )
				addEventHandler( "onClientMouseLeave", createdLabel, itemLabelLeaved, false )
				addEventHandler ( "onClientGUIDoubleClick", createdLabel, rightItemClicked, false )
				table.insert ( toolLabelsButtons, createdLabel )
			end
			showCursor ( true )
		else
			closeInventory ()
		end
	end
end

function closeInventory() 
	showCursor ( false )
			unbindKey ( 'mouse1', 'down', checkOnButton )
			unbindKey ( 'mouse1', 'up', testoLabClick )
			if isElement (testoLab) then
				destroyElement ( testoLab )
			end
			for i, label in ipairs ( itemLabels ) do
				if isElement ( label ) then
					destroyElement ( label )
				end
			end
			for i, label in ipairs ( itemLabelsButtons ) do
				if isElement ( label ) then
					destroyElement ( label )
				end
			end
			for i, label in ipairs ( foodLabelsButtons ) do
				if isElement ( label ) then
					destroyElement ( label )
				end
			end
			for i, label in ipairs ( toolLabelsButtons ) do
				if isElement ( label ) then
					destroyElement ( label )
				end
			end
			for i = 1, 9 do
				exports.imagebutton:destroyImageButtonByName('arrow'..i)
				exports.imagebutton:destroyImageButtonByName('arrowRev'..i)
			end

			removeEventHandler ( "onClientRender", root, renderDisplay )
			exports.imagebutton:destroyImageButtonByName ('mainWeap')
			exports.imagebutton:destroyImageButtonByName ('secWeap')


			
			exports.imagebutton:destroyImageButtonByName ('Inventory_1')
			exports.imagebutton:destroyImageButtonByName ('Inventory_2')
			exports.imagebutton:destroyImageButtonByName ('Inventory_3')
			exports.imagebutton:destroyImageButtonByName ('Inventory_4')
			exports.imagebutton:destroyImageButtonByName ('Inventory_5')
			exports.imagebutton:destroyImageButtonByName ('Inventory_6')
			exports.imagebutton:destroyImageButtonByName ('Inventory_7')
			exports.imagebutton:destroyImageButtonByName ('Inventory_8')
			exports.imagebutton:destroyImageButtonByName ('Inventory_OLD')
			
			inventory = {}
			inventoryWeap = {}
			inventoryWeap.main = {}
			inventoryWeap.addit = {}
			inventoryWeap.spec = {}

			foodInventory={}
			toolInventory={}


			prevY = 0
			prevYPos = 0
			itOff = 0
			loot = false
			clicked=false
			scrollLabelSelected = false

			mainWeaponSelection = false
			additWeaponSelection = false
			selectedMainWeapon = 0
			selectedAdditWeapon = 0
			selectedItemLabel = 0
			selectedFoodLabelID = 0
			selectedToolLabelID = 0
			selectedSpecLabelID = 0
			foodLabelSelected = false
			specLabelSelected = false
			toolLabelSelected = false

			itemLabels = {}
			itemLabelsButtons = {}
			foodLabelsButtons={}
			toolLabelsButtons={}
			inventoryShow = false
end
addEvent("closeInventory",true)
addEventHandler("closeInventory",getLocalPlayer(),closeInventory)

itemLabelClickAvail = true

function itemLabelClicked ()
	if getElementData ( source, 'itemLabel' ) then
		if isPlayerInLoot () then
			startRollMessage2("Inventory", "Proszę zamknąć inwentarz!", 255, 22, 0)
			return false
		end
		if not itemLabelClickAvail then return false end
		itemLabelClickAvail = false
		setTimer ( function () itemLabelClickAvail = true end, 100, 1 )

		local name, info = getInventoryInfosForRightClickMenu ( inventory[getElementData ( source, 'id' )+itOff][1] )
		if ( getElementData ( localPlayer, name ) or 0 ) <= 0 then
			return true
		end
		if name == "Zapałki" then
			if getElementData(getLocalPlayer(),"Drewno") == 0 then return end
		end
		if name == "Bandaż" then
			if getElementData(getLocalPlayer(),"bleeding") == 0 then return end
		end	
		if name == "Płyn fizjologiczny" then
			if getElementData(getLocalPlayer(),"blood") > 10500 then return end
		end	
		if name == "Termofor" then
			if getElementData(getLocalPlayer(),"temperature") > 35 then return end
		end	
		if name == "Morfina" then
			if not getElementData(getLocalPlayer(),"brokenbone") then return end
		end	
		if name == "Sardynki w puszce (✖)" 
		or name == "Puszka spaghetti (✖)"
		or name == "Konserwa z tuńczyka (✖)" 
		or name == "Brzoskwinie w puszce (✖)" 
		or name == "Puszka bekonu (✖)" then
		if getElementData(getLocalPlayer(),"Otwieracz") == 0  then return end
		end		
		if info then
			playerUseItem(name, info)
			setTimer(placeItemsInInventory, 100, 1)
		end
	end
end

function rightItemClicked ()
	local id = getElementData ( source, 'id' )
	if getElementData ( source, 'foodLabel' ) then
		local name = foodInventory[id][1]
		if name == "Manierka"
		or name == "Butelka wody"
				
		or name == "Puszka Coca-Coli"
		or name == "Puszka Pepsi"
		or name == "Kwas chlebowy"
		or name == "Puszka Sprite"
		or name == "Водка"
		then
		playerUseItem ( name, 'Выпить' )
		elseif name == "Sardynki w puszce (✖)" 
		or name == "Puszka spaghetti (✖)"
		or name == "Konserwa z tuńczyka (✖)" 
		or name == "Brzoskwinie w puszce (✖)" 
		or name == "Puszka bekonu (✖)" 
		then
		playerUseItem ( name, 'Вскрыть' )
		else
		playerUseItem ( name, 'Съесть' )
		end
		setTimer(placeItemsInInventory, 100, 1)
		
	elseif getElementData ( source, 'toolLabel' ) then
		local name = toolInventory[id][1]
		for i,itemInfo in ipairs(inventoryItems.Toolbelt) do
			if name == itemInfo[1] then
				if #itemInfo >= 6 then
				if name == "Zapałki" then 
					if getElementData(getLocalPlayer(),"Drewno") <= 0 then 
						return
					end
				end
					playerUseItem ( name, itemInfo[8] )
				end
			end
		end
	elseif getElementData ( source, 'specLabel' ) then
		local name = inventoryWeap.spec[id][1]
		for i,itemInfo in ipairs(inventoryItems.Medical) do
			if name == itemInfo[1] then
				if #itemInfo >= 6 then
				if name == "Bandaż" then
					if getElementData(getLocalPlayer(),"bleeding") == 0 then
						return
					end
				end	
				if name == "Płyn fizjologiczny" then
					if getElementData(getLocalPlayer(),"blood") > 10500 then
						return
					end
				end	
				if name == "Termofor" then
					if getElementData(getLocalPlayer(),"temperature") > 35 then
						return
					end
				end	
				if name == "Środki przeciwbólowe" then
					if not getElementData(getLocalPlayer(),"pain") then
						return
					end
				end	
				if name == "Morfina" then
					if not getElementData(getLocalPlayer(),"brokenbone") then
						return
					end
				end	
				if name == "Paczka krwii" then
				return
				end	
					playerUseItem ( name, itemInfo[8] )
				end
			end
		end
	end
end

function stopMainWeaponSelection ()
	mainWeaponSelection = false
	for i, label in  ipairs(mainWeapSelectionLabels) do
		if isElement ( label ) then
			destroyElement ( label )
			label = nil
		end
	end
end

function stopAdditWeaponSelection ()
	additWeaponSelection = false
	for i, label in  ipairs(additWeapSelectionLabels) do
		if isElement ( label ) then
			destroyElement ( label )
			label = nil
		end
	end
end



function itemLabelEntered ()
	if getElementData ( source, 'itemLabel' ) then
		local id = getElementData ( source, 'id' )
		if selectedItemLabel ~= 0 then
			exports.imageButton:setImageButtonVisible ( itemLabelsButtons[selectedItemLabel][1].name, false )
			exports.imageButton:setImageButtonVisible ( itemLabelsButtons[selectedItemLabel][2].name, false )
		end
		if id <= #inventory then
			selectedItemLabel = id
			exports.imageButton:setImageButtonVisible ( itemLabelsButtons[id][1].name, true )
			exports.imageButton:setImageButtonVisible ( itemLabelsButtons[id][2].name, true )
		end
	elseif getElementData ( source, 'foodLabel' ) then
		foodLabelSelected = true
		selectedFoodLabelID = getElementData ( source, 'id' )
	elseif getElementData ( source, 'toolLabel' ) then
		toolLabelSelected = true
		selectedToolLabelID = getElementData ( source, 'id' )
	elseif getElementData ( source, 'specLabel' ) then
		specLabelSelected = true
		selectedSpecLabelID = getElementData ( source, 'id' )
	end
end

function itemLabelLeaved ()
	if getElementData ( source, 'itemLabel' ) then
		--local id = getElementData ( source, 'id' )
		--exports.imageButton:setImageButtonVisible ( itemLabelsButtons[id][1].name, false )
		--exports.imageButton:setImageButtonVisible ( itemLabelsButtons[id][2].name, false )
		--selectedItemLabel = 0
	elseif getElementData ( source, 'foodLabel' ) then
		foodLabelSelected = false
		selectedFoodLabelID = 0
	elseif getElementData ( source, 'toolLabel' ) then
		toolLabelSelected = false
		selectedToolLabelID = 0
	elseif getElementData ( source, 'specLabel' ) then
		specLabelSelected = false
		selectedSpecLabelID = 0
	end
end





NameWindow = dxCreateFont("inventory/fanbox.otf", 22)
fanboxInfo = dxCreateFont("inventory/loot.otf", 14)
fanboxStata = dxCreateFont("inventory/fanbox.otf", 14)
fanbox = dxCreateFont("inventory/loot.otf", 10)
Button = dxCreateFont("inventory/fanbox.otf", 16)
fanboxInfoLoot = dxCreateFont("inventory/loot.otf", 16)
fanboxIn = dxCreateFont("inventory/loot.otf", 12)

function renderDisplay ( )
	dxDrawImage ( bX-700, bY-400, 450, 800, "inventory/FAN_1.png" ) -- Лут <
	dxDrawImage ( bX-250, bY-397, 450, 794, "inventory/FAN_2.png" ) -- Пед
	dxDrawImage ( bX+200, bY-400, 450, 800, "inventory/FAN_1.png" ) -- Лут >
	dxDrawRectangle (bX-693, bY-325, 436, 2, tocolor (132,132,132,75)) -- Лут < Полоска
	dxDrawRectangle (bX-245, bY-325, 440, 2, tocolor (132,132,132,75)) -- Пед Полоска
	dxDrawRectangle (bX+207, bY-325, 436, 2, tocolor (132,132,132,75)) -- Лут > Полоска
	dxDrawText ( 'INWENTARZ', bX-500, bY-375, bX-300,  bY-280, tocolor (255,255,255,255), 1, NameWindow )-- РЕЧІ
	dxDrawText ( 'STAN', bX-60, bY-375, bX-300,  bY-280, tocolor (255,255,255,255), 1, NameWindow )-- СТАТУС
	dxDrawText ( 'PRZEDMIOTY', bX+365, bY-375, bX-300,  bY-280, tocolor (255,255,255,255), 1, NameWindow )-- ИНВЕНТАРЬ
	dxDrawImage ( bX-682, bY-315, 415, 800, "inventory/FAN_3.png" ) -- Фон лута

	if loot then
		placeItemsInInventory ()
		local curLootItems = getLootCurrentSlots(loot) or 0 
		local maxLootItems = getLootMaxAviableSlots(loot) or 0
		if maxLootItems > 0 then
		    dxDrawText ( ''..curLootItems .. '/' .. maxLootItems, bX-327, bY-363, bX-300,  bY-280, tocolor ( 132,132,132,255), 1, fanboxInfo,"right" )--Найдений лут
			dxDrawImage ( bX-292, bY-368, 25, 25, "inventory/box.png" ) -- слот
			dxDrawText ( gearName, bX-680, bY-363, bX-300,  bY-280, tocolor ( 132,132,132,255), 1, fanboxInfo)--Назва обэкту
		end
	end
	
	dxDrawText (getPlayerCurrentSlots() .. '/' .. getPlayerMaxAviableSlots()..'', bX+560, bY-363, bX-300,  bY-280, tocolor ( 132,132,132,255), 1, fanboxInfo)--Твій лут
	dxDrawImage ( bX+610, bY-368, 30, 30, "inventory/masa.png" ) -- маса
	
	--local itScroll = (bY+90)-5*(#inventory-11)
	--dxDrawLine ( bX-10, bY-235-prevY, bX-10, itScroll-prevY, tocolor ( 80, 60, 40, 255 ), 15 )
	
	dxDrawRectangle (bX-674, bY+284, 402, 9, tocolor (132,132,132,255)) -- ПОЛОСКА ПОЛЗУНКА
	
	if getElementData ( localPlayer, "Inventory_Setting") == 1 then
	dxDrawText ( 'BROŃ', bX-500, bY+345, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX-500, bY+370, 37,  2, tocolor (132,132,132,175))
	elseif getElementData ( localPlayer, "Inventory_Setting") == 2 then
	dxDrawText ( 'AMUNICJA', bX-515, bY+345, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX-515, bY+370, 72,  2, tocolor (132,132,132,175))
	elseif getElementData ( localPlayer, "Inventory_Setting") == 3 then
	dxDrawText ( 'ŻYWNOŚĆ', bX-515, bY+345, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX-515, bY+370, 72,  2, tocolor (132,132,132,175))
	elseif getElementData ( localPlayer, "Inventory_Setting") == 4 then
	dxDrawText ( 'Leki', bX-515, bY+345, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX-515, bY+370, 32,  2, tocolor (132,132,132,175))
	elseif getElementData ( localPlayer, "Inventory_Setting") == 5 then
	dxDrawText ( 'RÓŻNE', bX-500, bY+345, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX-500, bY+370, 48,  2, tocolor (132,132,132,175))
	elseif getElementData ( localPlayer, "Inventory_Setting") == 6 then
	dxDrawText ( 'Narzędzia', bX-515, bY+345, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX-515, bY+370, 80,  2, tocolor (132,132,132,175))
	elseif getElementData ( localPlayer, "Inventory_Setting") == 7 then
	dxDrawText ( 'ODZIEŻ', bX-500, bY+345, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX-500, bY+370, 50,  2, tocolor (132,132,132,175))
	elseif getElementData ( localPlayer, "Inventory_Setting") == 8 then
	dxDrawText ( 'WSZYSTKO', bX-490, bY+345, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX-490, bY+370, 73,  2, tocolor (132,132,132,175))
	end
	
SkinImages = {
{100,"inventory/skin_1.png"},
{101,"inventory/skin_2.png"},
{102,"inventory/skin_3.png"},
{103,"inventory/skin_4.png"},
{104,"inventory/skin_5.png"},
{105,"inventory/skin_6.png"},
{106,"inventory/skin_25.png"},
{107,"inventory/skin_7.png"},
{108,"inventory/skin_8.png"},
{109,"inventory/skin_9.png"},
{110,"inventory/skin_10.png"},
{111,"inventory/skin_11.png"},
{112,"inventory/skin_12.png"},
{113,"inventory/skin_13.png"},
{114,"inventory/skin_14.png"},
{115,"inventory/skin_15.png"},
{116,"inventory/skin_16.png"},
{117,"inventory/skin_17.png"},
{118,"inventory/skin_18.png"},
{120,"inventory/skin_19.png"},
{121,"inventory/skin_20.png"},
{122,"inventory/skin_21.png"},
{123,"inventory/skin_22.png"},
{124,"inventory/skin_23.png"},
{125,"inventory/skin_24.png"},
}

	for _, skin in ipairs(SkinImages) do
	if getElementData ( localPlayer, "skin") == skin[1] then
	dxDrawImage ( bX-215, bY-250, 242, 312, skin[2] ) 
	end
	end
	
clothHead = {
		{"Beret wojskowy - czerwony","icons/201.union"},
		{"Beret - czarny","icons/202.union"},
		{"Beret ONZ - ciemno niebieski","icons/203.union"},
		{"Beret - zielony","icons/204.union"},
		{"Beret sił obronnych - beżowy","icons/295.union"},

		{"Panama - czarna","icons/121.union"},
		{"Panama - niebieska","icons/118.union"},
		{"Panama kamuflaż DPM","icons/114.union"},
		{"Panama kamuflaż DĄB","icons/117.union"},
		{"Panama kamuflaż FLECKTARN","icons/115.union"},
		{"Panama - błękitna","icons/122.union"},
		{"Panama - zielona","icons/116.union"},
		{"Panama - pomarańczowa","icons/119.union"},
		{"Panama - czerwona","icons/113.union"},
		{"Panama - beżowa","icons/120.union"},
		
		{"Kaptur z kamuflażem №1","icons/155.union"},
		{"Kaptur z kamuflażem №2","icons/156.union"},
		{"Kaptur z kamuflażem №3","icons/154.union"},
		
		{"Hełm militarny - zielony","icons/111.union"},
		{"Hełm militarny - czarny","icons/112.union"},
		{"Шлем Горка Е (SWAT","icons/112.union"},
		{"Hełm militarny z kamuflażem","icons/299.union"},
		
		{"Husta operacyjna - niebieska","icons/166.union"},
		{"Husta operacyjna - zielona","icons/307.union"},
		{"Husta operacyjna - biała","icons/308.union"},
		
		{"Hełm balistyczny - zielony","icons/3.union"},
		{"Hełm balistyczny - czarny","icons/2.union"},
		{"Hełm balistyczny - niebieski","icons/1.union"},
		{"Hełm balistyczny z kamuflażem №1","icons/298.union"},
		{"Hełm balistyczny z kamuflażem №2","icons/296.union"},
		{"Hełm balistyczny z kamuflażem №3","icons/297.union"},
				
		{"Kapelusz kowbojski - brązowy","icons/191.union"},
		{"Kapelusz kowbojski - czarny","icons/193.union"},
		{"Kapelusz kowbojski - ciemny brąz","icons/194.union"},
		{"Kapelusz kowbojski - zielony","icons/192.union"},
		{"Kapelusz kowbojski - szary","icons/300.union"},
		{"Kapelusz kowbojski - biały","icons/301.union"},
		
		{"Czapka z dzianiny - brązowa","icons/160.union"},
		{"Czapka z dzianiny - czarna","icons/163.union"},
		{"Czapka z dzianiny - niebieska","icons/158.union"},
		{"Czapka z dzianiny - ciemno-brązowa","icons/157.union"},
		{"Czapka z dzianiny - zielona","icons/162.union"},
		{"Czapka z dzianiny - szara","icons/159.union"},
		{"Czapka z dzianiny - czerwona","icons/161.union"},
		
		{"Beret z daszkiem - ciemna kratka","icons/144.union"},
		{"Beret z daszkiem - ciemny","icons/145.union"},
		{"Beret z daszkiem - niebieski","icons/139.union"},
		{"Beret z daszkiem - brązowa kratka","icons/143.union"},
		{"Beret z daszkiem - brązowy","icons/140.union"},
		{"Beret z daszkiem - szary","icons/141.union"},
		{"Czapka - szara","icons/142.union"},
		{"Beret z daszkiem - czerwony","icons/138.union"},
		
		{"Kask - czarny","icons/302.union"},
		{"Kask - niebieski","icons/108.union"},
		{"Kask - jasno zielony","icons/303.union"},
		{"Kask - zielony","icons/109.union"},
		{"Kask - pomarańczowy","icons/105.union"},
		{"Kask - czerwony","icons/106.union"},
		{"Kask - biały","icons/107.union"},
		{"Kask - żółty","icons/110.union"},
		
		{"Kask strażacki - czarny","icons/304.union"},
		{"Kask strażacki - czerwony","icons/104.union"},
		{"Kask strażacki - biały","icons/103.union"},
		{"Kask strażacki - żółty","icons/102.union"},
		
		{"Hełm pilota - czarny","icons/306.union"},
		{"Hełm pilota - biały","icons/153.union"},
		{"Hełm pilota - zielony","icons/305.union"},
		
		{"Медециньска шапка Синяя","icons/166.union"},
		{"Медециньска шапка Зелёная","icons/307.union"},
		{"Медециньска шапка Белая","icons/308.union"},
		
		{"Czapka oficerska","icons/190.union"},
		{"Furażerka","icons/205.union"},
		{"Czapka policyjna","icons/213.union"},
		
		{"Bejsbolówka №1","icons/137.union"},
		{"Bejsbolówka №2","icons/129.union"},
		{"Bejsbolówka №3","icons/130.union"},
		{"Bejsbolówka №4","icons/132.union"},
		{"Bejsbolówka №5","icons/133.union"},
		{"Bejsbolówka №6","icons/131.union"},
		{"Bejsbolówka №7","icons/134.union"},
		{"Bejsbolówka №8","icons/135.union"},
		
		{"Czapka z nausznikami - czarna","icons/123.union"},
		{"Czapka z nausznikami - niebieska","icons/125.union"},
		{"Czapka z nausznikami - zielona","icons/124.union"},
		
		{"Chusta z kamuflażem - DĄB","icons/183.union"},
		{"Chusta - czarna","icons/184.union"},
		{"Chusta - fioletowa","icons/186.union"},
		{"Chusta - czerwona","icons/187.union"},
		{"Chusta - żółta","icons/188.union"},
		{"Chusta - zielona","icons/185.union"},
		
		{"Podwijana czapka - czarna","icons/220.union"},
		{"Podwijana czapka - brązowa","icons/219.union"},
		{"Podwijana czapka - zielona","icons/216.union"},
		{"Podwijana czapka - czerwona","icons/217.union"},
		{"Podwijana czapka - niebieska","icons/218.union"},
	
		{"Pilotka ze słuchawkami","icons/206.union"},
		
		{"Czapka z pomponem - czarna","icons/175.union"},
		{"Czapka z pomponem - niebieska","icons/177.union"},
		{"Czapka z pomponem - brązowa","icons/178.union"},
		{"Czapka z pomponem - czerwona","icons/176.union"},
		{"Czapka z pomponem - zielona","icons/174.union"},	
}

clothHeadN = {
		{"Kominiarka z czaszką - czarna","icons/94.union"},
		{"Kominiarka - beżowa","icons/97.union"},
		{"Kominiarka - czarna","icons/100.union"},
		{"Kominiarka - niebieska","icons/98.union"},
		{"Kominiarka - zielona","icons/99.union"},
		{"Kominiarka - różowa","icons/95.union"},
		{"Kominiarka - biała","icons/96.union"},
		{"Kominiarka z kamuflażem","icons/293.union"},

		
		{"Maska Dallas","icons/128.union"},
		{"Maska Hoxton","icons/126.union"},
		{"Maska Wilka","icons/127.union"},
		
		{"Maska","icons/189.union"},
		
		{"Kask motocyklowy №1","icons/152.union"},
		{"Kask motocyklowy №2","icons/148.union"},
		{"Kask motocyklowy №3","icons/149.union"},
		{"Kask motocyklowy №4","icons/146.union"},
		{"Kask motocyklowy №5","icons/151.union"},
		{"Kask motocyklowy №6","icons/147.union"},
		{"Kask motocyklowy №7","icons/150.union"},
		
		{"Bandana - kamuflaż (głęboka)","icons/198.union"},
		{"Bandana - czarna","icons/196.union"},
		{"Bandana - fioletowa","icons/199.union"},
		{"Bandana - czerwona","icons/197.union"},
		{"Bandana - żółta","icons/294.union"},
		{"Bandana - zielona","icons/195.union"},
}

clothEis = {
		{"Okulary dizajnerskie","icons/212.union"},
		{"Okulary pilotki","icons/17.union"},
}

clothBody = {
		{"Kamizelka z futerału i kieszeniami","icons/209.union"}, -- 10
		{"Kamizelka wstrząsoodporna","icons/200.union"},
		{"Kamizelka PRESS","icons/164.union"},
		--12
		{"Kamizelka o dużej pojemności - czarna","icons/211.union"},
		{"Kamizelka o dużej pojemności - oliwkowa","icons/210.union"},
		{"Kamizelka o dużej pojemności","icons/309.union"},
		--8
		{"Kamizelka - czarna","icons/310.union"},
		{"Kamizelka kamuflaż DPM","icons/312.union"},
		{"Kamizelka - oliwkowa","icons/311.union"},
		{"Kamizelka - TANK","icons/313.union"},
		
		{"Kamizelka PRESS - niebieska","icons/165.union"},
		--8
		{"Kamizelka o dużej pojemności №2 - czarna","icons/181.union"},
		{"Kamizelka o dużej pojemności №2 - kamuflaż DPM","icons/180.union"},
		{"Kamizelka o dużej pojemności №2 - oliwkowa","icons/182.union"},
		{"Kamizelka o dużej pojemności №2 - TANK","icons/179.union"},
		
		{"Kamizelka zbrojna z kamuflażem - PRESS","icons/314.union"},
		--12
		{"Kamizelka o dużej pojemności - oliwkowy kamuflaż","icons/316.union"},
		--16
		{"Kamizelka SMERSH","icons/14.union"},
		--8
		{"Kamizelka o dużej pojemności - brązowa","icons/317.union"},
		
		{"Kamizelka zbrojna z kamuflażem - PRESS №2","icons/315.union"},
		--8
		{"Kamizelka zbrojna z kamuflażem №1","icons/318.union"},
		{"Kamizelka zbrojna z kamuflażem №2","icons/319.union"},
}
		
clothGila = {
		{"Płaszcz z kamuflażem №1","icons/18.union"},
		{"Płaszcz z kamuflażem №2","icons/207.union"},
		{"Płaszcz z kamuflażem №3","icons/208.union"},
}

Rukzak = {
	{1,"icons/43.union"}, -- Зелёный альпинистский рюкзак
	{2,"icons/7.union"},  -- Красный альпинистский рюкзак
	{3,"icons/44.union"},  -- Оранжевый альпинистский рюкзак
	{4,"icons/42.union"},  -- Синий альпинистский рюкзак
	{5,"icons/284.union"},  -- Камуфляжный альпинистский рюкзак
	{6,"icons/226.union"},  -- Рюкзак Тортилла №1
	{7,"icons/285.union"},  -- Рюкзак Тортилла №2
	{8,"icons/286.union"},  -- Рюкзак Тортилла №3
	{9,"icons/287.union"},  -- Рюкзак Тортилла №4
	{10,"icons/7.union"},  -- Охотничий рюкзак №1
	{11,"icons/290.union"},  -- Охотничий рюкзак №2
	{12,"icons/291.union"},  -- Охотничий рюкзак №3
	{13,"icons/289.union"},  -- Охотничий рюкзак №4
	{14,"icons/288.union"},  -- Охотничий рюкзак №5
	{15,"icons/169.union"},  -- Жёлтый герморюкзак
	{16,"icons/171.union"},  -- Зелёный герморюкзак
	{17,"icons/173.union"},  -- Красный герморюкзак
	{18,"icons/170.union"},  -- Оранжевый герморюкзак
	{19,"icons/168.union"},  -- Синий герморюкзак
	{20,"icons/172.union"},  -- Чёрный герморюкзак
	{21,"icons/41.union"},  -- Зеленый рюкзак «Taloon»
	{22,"icons/39.union"},  -- Оранжевый рюкзак «Taloon»
	{23,"icons/38.union"},  -- Синий рюкзак «Taloon»
	{24,"icons/40.union"},  -- Фиолетовый рюкзак «Taloon»
	{25,"icons/292.union"},  -- Камуфляжный рюкзак «Taloon»
	{26,"icons/92.union"},  -- Камуфляжный рюкзак «M53 Boulder»
	{27,"icons/91.union"},  -- Чёрный рюкзак «M53 Boulder»
	{28,"icons/93.union"},  -- Зеленый рюкзак «M53 Boulder»
	{29,"icons/215.union"},  -- Ранец СМЕРШ
	{30,"icons/222.union"},  -- Самодельная сумка
	{31,"icons/223.union"},  -- Кожаная сумка
	{32,"icons/221.union"},  -- Сумка из натуральной кожи
	{33,"icons/251.union"}, -- Самодельный рюкзак
	{34,"icons/224.union"},  -- Самодельный кожаный рюкзак
	{35,"icons/167.union"}, --Детский портфель
	{36,"icons/225.union"},  -- Рюкзак Койот
		
}


	dxDrawRectangle (bX-233, bY+135, 64,  64, tocolor (132,132,132,75))--Голова
	dxDrawRectangle (bX-162, bY+135, 64,  64, tocolor (132,132,132,75))--Шия
	dxDrawRectangle (bX-92, bY+135, 64,  64, tocolor (132,132,132,75))--Очки
	dxDrawRectangle (bX-22, bY+135, 64,  64, tocolor (132,132,132,75))--Рюкзак
	dxDrawRectangle (bX+49, bY+135, 64,  64, tocolor (132,132,132,75))--Жилет
	dxDrawRectangle (bX+120, bY+135, 64,  64, tocolor (132,132,132,75))--Гиля
	
	
	--Голова
	for _, clothHead in ipairs(clothHead) do
	if getElementData ( getLocalPlayer(), "clothHead",false) == clothHead[1] then
		dxDrawImage ( bX-233, bY+135, 64, 64, clothHead[2] )
	end
	end
	--Шия
	for _, clothHeadN in ipairs(clothHeadN) do
	if getElementData ( getLocalPlayer(), "clothHeadN",false) == clothHeadN[1] then
		dxDrawImage ( bX-162, bY+135, 64, 64, clothHeadN[2] )
	end
	end
	--Очки
	for _, clothEis in ipairs(clothEis) do
	if getElementData ( getLocalPlayer(), "clothEis",false) == clothEis[1] then
		dxDrawImage ( bX-92, bY+135, 64, 64, clothEis[2] )
	end
	end
	--Рюкзак
	for _, Rukzak in ipairs(Rukzak) do
	if getElementData ( getLocalPlayer(), "Rukzak",false) == Rukzak[1] then
		dxDrawImage ( bX-22, bY+135, 64, 64, Rukzak[2] )
	end
	end
	--Жилет
	for _, clothBody in ipairs(clothBody) do
	if getElementData ( getLocalPlayer(), "clothBody",false) == clothBody[1] then
		dxDrawImage ( bX+49, bY+135, 64, 64, clothBody[2] )
	end
	end
	--Гиля
	for _, clothGila in ipairs(clothGila) do
	if getElementData ( getLocalPlayer(), "clothGila",false) == clothGila[1] then
		dxDrawImage ( bX+120, bY+135, 64, 64, clothGila[2] )
	end
	end
	
	if getElementData ( getLocalPlayer(), "clothHead") == false then 
	dxDrawImage (bX-227, bY+140, 50,  50, "inventory/stat_1.png" ) --Голова
	end
	
	if getElementData ( getLocalPlayer(), "clothHeadN") == false then 
	dxDrawImage (bX-157, bY+140, 50,  50, "inventory/stat_2.png" ) --Шия
	end
	
	if getElementData ( getLocalPlayer(), "clothEis")  == false then 
	dxDrawImage (bX-87, bY+140, 50,  50, "inventory/stat_5.png" ) --Очки
	end
	
	if getElementData ( getLocalPlayer(), "Rukzak") == 0 then
	dxDrawImage (bX-17, bY+140, 50,  50, "inventory/stat_4.png" ) --Рюкзак
	end
	
	if getElementData ( getLocalPlayer(), "clothBody") == false  then 
	dxDrawImage (bX+54, bY+140, 50,  50, "inventory/stat_3.png" ) --Жилет
	end
	
	if getElementData ( getLocalPlayer(), "clothGila") == false then 
	dxDrawImage (bX+127, bY+140, 50,  50, "inventory/stat_6.png" ) --Гиля
	end
	
		-- Начало инфы о предмете
	--Инфа з панелі лута
	if  selectedItemLabel > 0 then 
		if selectedItemLabel <= #inventory then
			dxDrawText ( inventory[selectedItemLabel+itOff][1], bX-230, bY+220, screenWidth, screenHeight, tocolor ( 255,10,10,150), 1, fanboxInfoLoot )
			dxDrawText ( inventory[selectedItemLabel+itOff][7], bX-230, bY+340, screenWidth, screenHeight, tocolor ( 132,132,132,175), 1, fanboxInfo )
			dxDrawText ( inventory[selectedItemLabel+itOff][8], bX-230, bY+360, screenWidth, screenHeight, tocolor ( 255,255,255,175), 1, fanboxIn )
			local sizeX = 200
			local offX = -50
			if inventory[selectedItemLabel+itOff][5]/inventory[selectedItemLabel+itOff][6] == 1 then
				offX = 0
				sizeX = 100
			end
			dxDrawImage ( bX+35+offX, bY+245, sizeX, 100, 'icons/'..inventory[selectedItemLabel+itOff][4] )
		end
		
	elseif foodLabelSelected then
		if selectedFoodLabelID <= #foodInventory then
			dxDrawText ( foodInventory[selectedFoodLabelID][1], bX-230, bY+220, screenWidth, screenHeight, tocolor ( 255,10,10,150), 1, fanboxInfoLoot )
			dxDrawText ( foodInventory[selectedFoodLabelID][5], bX-230, bY+340, screenWidth, screenHeight, tocolor ( 132,132,132,175), 1, fanboxInfo )
			dxDrawText ( foodInventory[selectedFoodLabelID][6], bX-230, bY+360, screenWidth, screenHeight, tocolor ( 255,255,255,175), 1, fanboxIn )
			dxDrawImage ( bX-40+offX, bY+245, 100, 100, 'icons/'..foodInventory[selectedFoodLabelID][2] )
		end
	elseif toolLabelSelected then
		if selectedToolLabelID <= #toolInventory then
			dxDrawText ( toolInventory[selectedToolLabelID][1], bX-230, bY+220, screenWidth, screenHeight, tocolor ( 255,10,10,150), 1, fanboxInfoLoot )
			dxDrawText ( toolInventory[selectedToolLabelID][5], bX-230, bY+340, screenWidth, screenHeight, tocolor ( 132,132,132,175), 1, fanboxInfo )
			dxDrawText ( toolInventory[selectedToolLabelID][6], bX-230, bY+360, screenWidth, screenHeight, tocolor ( 255,255,255,175), 1, fanboxIn )
			dxDrawImage ( bX-40+offX, bY+245, 100, 100, 'icons/'..toolInventory[selectedToolLabelID][2] )
		end
	elseif specLabelSelected then
		if selectedSpecLabelID <= #inventoryWeap.spec then
			dxDrawText ( inventoryWeap.spec[selectedSpecLabelID][1], bX-230, bY+220, screenWidth, screenHeight, tocolor ( 255,10,10,150), 1, fanboxInfoLoot )
			dxDrawText ( inventoryWeap.spec[selectedSpecLabelID][5], bX-230, bY+340, screenWidth, screenHeight, tocolor ( 132,132,132,175), 1, fanboxInfo )
			dxDrawText ( inventoryWeap.spec[selectedSpecLabelID][6], bX-230, bY+360, screenWidth, screenHeight, tocolor ( 255,255,255,175), 1, fanboxIn )
			dxDrawImage ( bX-40+offX, bY+245, 100, 100, 'icons/'..inventoryWeap.spec[selectedSpecLabelID][2] )
		end
		
	
	end

	

statsTable = {
		"pełny",
		"energiczny",
		"głodny",
		"pragnienie",
		"niedobór",
		"odwodniony",
		"zatrucie",
		"zakażenie",
		"złamanie",
		"hipotermia",
		"pijany",
		"narkotyki",
		"krwawienie",
		"grypa",
		"ból",
		"zmęczony",
}

colors1 = {
		75,
		165,
		95,
		210,
		200,
		30,
		215,
}	
colors2 = {
		120,
		145,
		25,
		105,
		10,
		45,
		115,
}	
colors3 = {
		45,
		50,
		25,
		30,
		10,
		200,
		140,
}	
		local tmptable = {}
		local setcolor1 = {}
		local setcolor2 = {}
		local setcolor3 = {}

		
		--сыт
		if getElementData(getLocalPlayer(), "food") >= 60 and getElementData(getLocalPlayer(), "food") <= 100 then
			table.insert (tmptable,1)
			table.insert (setcolor1,1)
			table.insert (setcolor2,1)
			table.insert (setcolor3,1)
		end
		--энергичный
		if getElementData(getLocalPlayer(), "thirst") >= 60 and getElementData(getLocalPlayer(), "thirst") <= 100 then
			table.insert (tmptable,2)
			table.insert (setcolor1,1)
			table.insert (setcolor2,1)
			table.insert (setcolor3,1)
		end
		--голодный
		if getElementData(getLocalPlayer(), "food") >= 20 and getElementData(getLocalPlayer(), "food") <= 60 then
			table.insert (tmptable,3)
			table.insert (setcolor1,2)
			table.insert (setcolor2,2)
			table.insert (setcolor3,2)
		end
		--жажда
		if getElementData(getLocalPlayer(), "thirst") >= 20 and getElementData(getLocalPlayer(), "thirst") <= 60 then
			table.insert (tmptable,4)
			table.insert (setcolor1,2)
			table.insert (setcolor2,2)
			table.insert (setcolor3,2)
		end
		--нехватка
		if getElementData(getLocalPlayer(), "food") >= 1 and getElementData(getLocalPlayer(), "food") <= 20 then
			table.insert (tmptable,5)
			table.insert (setcolor1,3)
			table.insert (setcolor2,3)
			table.insert (setcolor3,3)
		end
		--обезвоженный
		if getElementData(getLocalPlayer(), "thirst") >= 1 and getElementData(getLocalPlayer(), "thirst") <= 20 then
			table.insert (tmptable,6)
			table.insert (setcolor1,3)
			table.insert (setcolor2,3)
			table.insert (setcolor3,3)
		end
		--отравлення
		if getElementData(getLocalPlayer(), "sick") == 60 then
			table.insert (tmptable,7)
			table.insert (setcolor1,3)
			table.insert (setcolor2,3)
			table.insert (setcolor3,3)
		end
		--отравлення
		if getElementData(getLocalPlayer(), "infection_zom") >= 1 then
			table.insert (tmptable,8)
			table.insert (setcolor1,3)
			table.insert (setcolor2,3)
			table.insert (setcolor3,3)
		end
		if getElementData(getLocalPlayer(), "brokenbone", true) then
			table.insert (tmptable,9)
			table.insert (setcolor1,3)
			table.insert (setcolor2,3)
			table.insert (setcolor3,3)
		end
		if getElementData(getLocalPlayer(), "cold", true) then
			table.insert (tmptable,10)
			table.insert (setcolor1,6)
			table.insert (setcolor2,6)
			table.insert (setcolor3,6)
		end
		if 0 < getElementData(getLocalPlayer(), "bleeding") then
			table.insert (tmptable,13)
			table.insert (setcolor1,3)
			table.insert (setcolor2,3)
			table.insert (setcolor3,3)
		end
		if getElementData(getLocalPlayer(), "grip") == 1 then
			table.insert (tmptable,14)
			table.insert (setcolor1,3)
			table.insert (setcolor2,3)
			table.insert (setcolor3,3)
		end
		if getElementData(getLocalPlayer(), "pain", true) then
			table.insert (tmptable,15)
			table.insert (setcolor1,3)
			table.insert (setcolor2,3)
			table.insert (setcolor3,3)
		end
		if getElementData(getLocalPlayer(), "sleep") <= 150 then
			table.insert (tmptable,16)
			table.insert (setcolor1,3)
			table.insert (setcolor2,3)
			table.insert (setcolor3,3)
		end

		for i = 1, #tmptable do 
			for i = 1, #setcolor1 do 
				for i = 1, #setcolor2 do 
					for i = 1, #setcolor3 do 
			local textw = dxGetTextWidth(statsTable[tmptable[i]],1,fanboxStata)-75
			dxDrawText(statsTable[tmptable[i]], bX+(10+textw), bY-415+60*i, bX+180, bY-250, tocolor(205,205,205,150), 1, fanboxStata, "center", "center", false, false, true, false, false)
							dxDrawRectangle(    bX+(50), bY-347+30*i, 140, 25, tocolor(colors1[setcolor1[i]],colors2[setcolor2[i]],colors3[setcolor3[i]],175))
					end
			end
			end
		end
		
	-- отрисовка статсов
	
	-- Конец инфы о предмете
	
	
	dxDrawRectangle (bX+148+70, bY+-310, 414,  64, tocolor (255, 10, 10, 12))--Основна оружка
	dxDrawRectangle (bX+148+70, bY+-240, 414,  64, tocolor (255, 10, 10, 12))--Другорядна оружка
	dxDrawRectangle (bX+148+70, bY+-170, 414,  64, tocolor (255, 10, 10, 12))--Другорядна оружка
	

	dxDrawText ( 'Leki', bX+300+95, bY-100, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX+300+95, bY-75, 32,  2, tocolor (255,255,255,175))
	dxDrawImage ( bX+335+70, bY-70, 35, 31, 'inventory/icon4.png')
	

	dxDrawText ( 'żywność', bX+305+90, bY+40, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX+305+90, bY+65, 72,  2, tocolor (255,255,255,175))
	dxDrawImage ( bX+335+70, bY+70, 44, 32, 'inventory/icon3.png')
	

	dxDrawText ( 'Narzędzia', bX+300+80, bY+180, bX-300,  bY-280, tocolor ( 255,255,255,175), 1, Button )
	dxDrawRectangle (bX+300+80, bY+205, 80,  2, tocolor (255,255,255,175))
	dxDrawImage ( bX+335+70, bY+210, 35, 31, 'inventory/icon6.png')
	
	dxDrawImage (bX+148+420, bY+320, 64,  64, "inventory/logo.png" ) --LOGO
	
--Місце їжі

	xPos = 148
	for i = 1, 6 do 
	xPos = xPos+70
	dxDrawRectangle (bX+xPos, bY+110, 64, 64, tocolor (132,132,132,75)) 
	end
	
	yOff = 0
	xPos = 148
	local foodMax = 6
	if foodMax > #foodInventory then foodMax = #foodInventory end
	for i = 1, foodMax do 
	xPos = xPos+70
	dxDrawImage ( bX+xPos, bY+110, 64, 64, 'icons/'..foodInventory[i][2] )
	end
	
	xOff = 148
	for i = 1,6 do 
	xOff = xOff+70
		dxDrawRectangle (bX+xOff, bY+250, 64, 64, tocolor (132,132,132,75)) 
	end
	
	local toolMax = 6
	if toolMax > #toolInventory then toolMax = #toolInventory end
	xOff = 148
	for i = 1, toolMax do 
	xOff = xOff+70
		dxDrawImage ( bX+xOff, bY+250, 64, 64, 'icons/'..toolInventory[i][2] )
	end
	
	xOff = 148
	for i = 1,6 do
		xOff = xOff+70
		dxDrawRectangle (bX+xOff, bY-30, 64, 64, tocolor (132,132,132,75)) 
	end
	
	local speclMax = 6
	if speclMax > #inventoryWeap.spec then speclMax = #inventoryWeap.spec end
	xOff = 148
	for i = 1, speclMax do
		xOff = xOff+70
		dxDrawImage ( bX+xOff, bY-30, 64, 64, 'icons/'..inventoryWeap.spec[i][2] )
	end
	
--------------------------------
--ОРУЖКА
	if selectedMainWeapon > 0 then
		dxDrawRectangle (bX+148+70, bY-310, 128, 64, tocolor (50,50,50,125))--Основна оружка []
		dxDrawImage ( bX+148+70, bY-310, 128, 64, 'icons/'..inventoryWeap.main[selectedMainWeapon][2] )
		dxDrawText(inventoryWeap.main[selectedMainWeapon][1],bX+148+75+128, bY+-310, bX+180, bY-250, tocolor(255,255,255,150), 1, Button)
	end
	
	if selectedAdditWeapon > 0 then
		if inventoryWeap.addit[selectedAdditWeapon] then
			local sizeX = 128
			local Name = 64
			local offX = -32
			if inventoryWeap.addit[selectedAdditWeapon][3]/inventoryWeap.addit[selectedAdditWeapon][4] == 1 then
				sizeX = 64
				Name = 0
				offX = 0
			end
			dxDrawRectangle (bX+148+70, bY-240, sizeX, 64, tocolor (50,50,50,125))
			dxDrawImage ( bX+148+70, bY-240, sizeX, 64, 'icons/'..inventoryWeap.addit[selectedAdditWeapon][2] )
			dxDrawText(inventoryWeap.addit[selectedAdditWeapon][1],bX+288+Name, bY+-240, bX+180, bY-250, tocolor(255,255,255,150), 1, Button)
		else
			selectedAdditWeapon = 0
		end
	end
	
	local weapon3 = getElementData(getLocalPlayer(),"currentweapon_3")
	if weapon3 == "Lornetka" then
	dxDrawRectangle (bX+148+70, bY+-170, 64, 64, tocolor (50,50,50,125))
	dxDrawImage ( bX+148+70, bY+-170, 64, 64, 'icons/13.union')
	dxDrawText(weapon3,bX+288, bY+-170, bX+180, bY-250, tocolor(255,255,255,150), 1, Button)
	elseif weapon3 == "Granat M67" then
	dxDrawRectangle (bX+148+70, bY+-170, 64, 64, tocolor (50,50,50,125))
	dxDrawImage ( bX+148+70, bY+-170, 64, 64, 'icons/85.union')
	dxDrawText(weapon3,bX+288, bY+-170, bX+180, bY-250, tocolor(255,255,255,150), 1, Button)
	elseif weapon3 == "Granat dymny" then
	dxDrawRectangle (bX+148+70, bY+-170, 64, 64, tocolor (50,50,50,125))
	dxDrawImage ( bX+148+70, bY+-170, 64, 64, 'icons/82.union')
	dxDrawText(weapon3,bX+288, bY+-170, bX+180, bY-250, tocolor(255,255,255,150), 1, Button)
	elseif weapon3 == "Granat hukowy" then
	dxDrawRectangle (bX+148+70, bY+-170, 64, 64, tocolor (50,50,50,125))
	dxDrawImage ( bX+148+70, bY+-170, 64, 64, 'icons/327.union')
	dxDrawText(weapon3,bX+288, bY+-170, bX+180, bY-250, tocolor(255,255,255,150), 1, Button)
	end
	
	
	if mainWeaponSelection then
		local yOff = 32
		for i = 1, #inventoryWeap.main do
		
			yOff = yOff+32
			dxDrawRectangle (bX+148+70, bY-310+yOff, 414-64, 35, tocolor ( 0,0,0,255 ) ) -- осн. оружие
			dxDrawText ( inventoryWeap.main[i][1], bX-180, bY-310+yOff, screenWidth, screenHeight, tocolor ( 255,255,255,150), 1, Button,"center")
		end
	end

	if additWeaponSelection then
		local yOff = 32
		for i = 1, #inventoryWeap.addit do
		
			yOff = yOff+32
			dxDrawRectangle (bX+148+70, bY-240+yOff, 414-64, 35, tocolor ( 0,0,0,255 ) )
			dxDrawText ( inventoryWeap.addit[i][1], bX-180, bY-240+yOff, screenWidth, screenHeight, tocolor (255,255,255,150),1, Button,"center")
		end
	end
	
	--Конец оружия
	--МЕНЮ ЛУТА
	yOff = 0
	local mainMax = 9
	if mainMax > #inventory then mainMax = #inventory end
	for i = 1, mainMax do
		if inventory[i+itOff][2] == 0 and inventory[i+itOff][3] == 0 then  inventory[i+itOff][2] = 1 end
		if inventory[i+itOff][5]/inventory[i+itOff][6] == 1 then
			offX = 64
		else
			offX = 128
		end
		
		if selectedItemLabel == i then
			dxDrawRectangle (bX-675, bY-315+yOff, 400, 64, tocolor ( 255, 10, 10, 50 ) )
		end
		
		dxDrawImage ( bX-620, bY-315+yOff, offX, 64, 'icons/'..inventory[i+itOff][4] )
		dxDrawText ( inventory[i+itOff][1], bX-600+offX, bY-292+yOff, screenWidth, screenHeight, tocolor ( 255,255,255,255), 1, fanbox )
		
		if inventory[i+itOff][2] > 0 then
			dxDrawText ( inventory[i+itOff][2], bX-640, bY-292+yOff, screenWidth, screenHeight, tocolor ( 255,100,100,255), 1, fanbox )
		end
		if inventory[i+itOff][3] > 0 then
			dxDrawText ( inventory[i+itOff][3], bX-320, bY-292+yOff, screenWidth, screenHeight, tocolor ( 255,255,255,255), 1, fanbox)
		end
		yOff = yOff+64
	end
	-------------------------МЕНЮ ЛУТА
end

mainWeapSelectionLabels = {}
additWeapSelectionLabels = {}

function showWeaponSelect (button)
	if button.name == 'Inventory_1' then
		setElementData ( localPlayer, "Inventory_Setting",1)
		placeItemsInInventory ()
		itOff = 0
		selectedItemLabel = 9
	elseif button.name == 'Inventory_2' then
		setElementData ( localPlayer, "Inventory_Setting",2)
		placeItemsInInventory ()
		itOff = 0
		selectedItemLabel = 9
	elseif button.name == 'Inventory_3' then
		setElementData ( localPlayer, "Inventory_Setting",3)
		placeItemsInInventory ()
		itOff = 0
		selectedItemLabel = 9
	elseif button.name == 'Inventory_4' then
		setElementData ( localPlayer, "Inventory_Setting",4)
		placeItemsInInventory ()
		itOff = 0
		selectedItemLabel = 9
	elseif button.name == 'Inventory_5' then
		setElementData ( localPlayer, "Inventory_Setting",5)
		placeItemsInInventory ()
		itOff = 0
		selectedItemLabel = 9
	elseif button.name == 'Inventory_6' then
		setElementData ( localPlayer, "Inventory_Setting",6)
		placeItemsInInventory ()
		itOff = 0
		selectedItemLabel = 9
	elseif button.name == 'Inventory_7' then
		setElementData ( localPlayer, "Inventory_Setting",7)
		placeItemsInInventory ()
		itOff = 0
		selectedItemLabel = 9
	elseif button.name == 'Inventory_8' then
		setElementData ( localPlayer, "Inventory_Setting",8)
		placeItemsInInventory ()
		itOff = 0
		selectedItemLabel = 9
	elseif button.name == 'Inventory_OLD' then
		setElementData ( localPlayer, "Inventory",0)
		placeItemsInInventory ()
		closeInventory()

	elseif button.name == 'mainWeap' then
		if not mainWeaponSelection then
			stopAdditWeaponSelection ()
			if #inventoryWeap.main > 1 or selectedMainWeapon == 0 then
				mainWeaponSelection = true
				yOff = 32
				for i = 1, #inventoryWeap.main do
					yOff = yOff+32
					local createdLabel = guiCreateLabel ( bX+148+70, bY-310+yOff, 414-64, 35, '', false )
					setElementData ( createdLabel, 'mainWeapSelection', true )
					setElementData ( createdLabel, 'id', i )
					addEventHandler ( "onClientGUIClick", createdLabel, weapSelectionLabelClicked, false )
					table.insert ( mainWeapSelectionLabels, createdLabel )
					placeItemsInInventory ()
				end
			end
		else
			stopMainWeaponSelection ()
		end
	elseif button.name == 'secWeap' then
		if not additWeaponSelection then
			stopMainWeaponSelection ()
			if #inventoryWeap.addit > 1 or selectedAdditWeapon == 0 then
				additWeaponSelection = true
				yOff = 32
				for i = 1, #inventoryWeap.addit do
					yOff = yOff+32
					local createdLabel = guiCreateLabel ( bX+148+70, bY-240+yOff, 414-64, 35, '', false )
					setElementData ( createdLabel, 'additWeapSelection', true )
					setElementData ( createdLabel, 'id', i )
					addEventHandler ( "onClientGUIClick", createdLabel, weapSelectionLabelClicked, false )
					table.insert ( additWeapSelectionLabels, createdLabel )
					placeItemsInInventory ()
				end
			end
		else
			stopAdditWeaponSelection()
		end
	
	
	 elseif string.find(button.name, 'arrowRev' ) then
        if loot then
            stopAdditWeaponSelection ()
            stopMainWeaponSelection ()
            if inventory [selectedItemLabel+itOff][2] > 0 then
                moveItemInInventory ()
            end
        end
    elseif string.find(button.name, 'arrow' ) then
        stopAdditWeaponSelection ()
        stopMainWeaponSelection ()
        if inventory [selectedItemLabel+itOff][3] > 0 then
            moveItemOutOfInventory ( inventory [selectedItemLabel+itOff][1] )
			placeItemsInInventory ()
        end
		
	end
end


addEvent ( "imageButtonClicked", true )
addEventHandler ( 'imageButtonClicked', root, showWeaponSelect)

function checkItemPlus(itemName)
	local itemPlus = 1
	if itemName == "M1911 Mag" then
		itemPlus = 7
	elseif itemName == "M9 SD Mag" then
		itemPlus = 15
	elseif itemName == ".45ACP" then
		itemPlus = 7
	elseif itemName == "PDW Mag" then
		itemPlus = 30
	elseif itemName == "MP5 SD" then
		itemPlus = 20
	elseif itemName == "АК" then
		itemPlus = 30
	elseif itemName == "STANAG SD" then
		itemPlus = 20
	elseif itemName == "1866 Slug" then
		itemPlus = 7
	elseif itemName == "2Rnd. Slug" then
		itemPlus = 2
	elseif itemName == "M1014 Slug" then
		itemPlus = 7
	elseif itemName == "M24" then
		itemPlus = 5
	elseif itemName == "Lee Enfield Mag" then
		itemPlus = 10
	elseif itemName == "M136 Rocket" then
		itemPlus = 0
	end
	return itemPlus
end


moveItemInInventory = function()
    local itemName = inventory [selectedItemLabel+itOff][1]
    if isPlayerInLoot() then
        if getElementData(isPlayerInLoot(), itemName) and getElementData(isPlayerInLoot(), itemName) >= 1 then
            if not isToolbeltItem(itemName) then
                if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then
                    if not playerMovedInInventory then
                        triggerEvent("onPlayerMoveItemInInventory", getLocalPlayer(), itemName, isPlayerInLoot())
                        playerMovedInInventory = true
                        setTimer(function()
                            playerMovedInInventory = false
                        end, 100, 1)
                    else
                        startRollMessage2("Inventory", "Zwolnij trochę!", 255, 22, 0)
                        return true
                    end
                else
                    startRollMessage2("Inventory", "Inwentarz jest pełny!", 255, 22, 0)
                    return true
                end
            else
                playerMovedInInventory = true
                 setTimer(function()
                     playerMovedInInventory = false
                end, 100, 1)
                triggerEvent("onPlayerMoveItemInInventory", getLocalPlayer(), itemName, isPlayerInLoot())
            end
        end
    end
    if isPlayerInLoot() then
        local col = getElementData(getLocalPlayer(), "currentCol")
        setTimer(placeItemsInInventory, 100, 1)
    end
end
function weapSelectionLabelClicked ()
	if getElementData ( source, 'mainWeapSelection' ) then
		local id = getElementData ( source, 'id' )
		local ammoData, weapID = getWeaponAmmoType(inventoryWeap.main[id][1])
		if getElementData(localPlayer, ammoData) <= 0 then
			triggerEvent("displayClientInfo", getLocalPlayer(), "broń", "Nie masz amunicji do tej broni!", 22, 255, 0)
			return true
		end
		mainWeaponSelection = false
		selectedMainWeapon = id
		triggerServerEvent("onPlayerRearmWeapon", getLocalPlayer(), inventoryWeap.main[id][1], 1)
		for i, label in  ipairs(mainWeapSelectionLabels) do
			if isElement ( label ) then
				destroyElement ( label )
			end
		end
	elseif getElementData ( source, 'additWeapSelection' ) then
		local id = getElementData ( source, 'id' )
		local ammoData, weapID = getWeaponAmmoType(inventoryWeap.addit[id][1])
		if getElementData(localPlayer, ammoData) <= 0 then
			triggerEvent("displayClientInfo", getLocalPlayer(), "broń", "Nie masz amunicji do tej broni!", 22, 255, 0)
			return true
		end
		additWeaponSelection = false
		selectedAdditWeapon = id
		triggerServerEvent("onPlayerRearmWeapon", getLocalPlayer(), inventoryWeap.addit[id][1], 2)
		for i, label in  ipairs(additWeapSelectionLabels) do
			if isElement ( label ) then
				destroyElement ( label )
			end
		end
	end
end

bindKey("J", "down", initInventory)

function isThereSomeoneInLoot ()
	local loot = isPlayerInLoot()
	local playersTable = getElementsWithinColShape ( loot, 'player' )
	for i, player in ipairs ( playersTable ) do
		if player ~= localPlayer then
			return true
		end
	end
	if not playersTable then
		return true
	end
	return false
end