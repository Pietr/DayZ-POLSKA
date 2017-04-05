addEvent("onOpened", true)

local sW, sH = guiGetScreenSize() 
local w = 
{ 	
	gridList = {},
	label = {},
	button = {}
}

addEventHandler("onClientResourceStart", resourceRoot,
function()
	w.main = guiCreateWindow(sW/2 - 179, sH/2 - 165, 700, 400, "NAMIOT ", false)
	guiWindowSetSizable(w.main, false)
	guiSetAlpha(w.main, 1.00)

	w.gridList.main = guiCreateGridList(10, 26, 690, 300, false, w.main)
	w.gridList.column1 = guiGridListAddColumn( w.gridList.main, "Transport", 0.25 )
	w.gridList.column2 = guiGridListAddColumn( w.gridList.main, "Pozycja X", 0.05 )
	w.gridList.column3 = guiGridListAddColumn( w.gridList.main, "Pozycja Y", 0.05 )
	w.gridList.column4 = guiGridListAddColumn( w.gridList.main, "Pozycja Z", 0.05 )
	w.gridList.column5 = guiGridListAddColumn( w.gridList.main, "Nick", 0.15 )
	w.gridList.column6 = guiGridListAddColumn( w.gridList.main, "Serial", 0.45 )
	w.button.tele = guiCreateButton(176, 350, 77, 37, "TP", false, w.main)
	w.button.close = guiCreateButton(263, 350, 77, 37, "Zamknij", false, w.main)

	guiSetFont(w.button.tele, "default-bold-small")
	guiSetProperty(w.button.tele, "NormalTextColour", "FFAAAAAA")
	guiSetFont(w.button.close, "default-bold-small")
	guiSetProperty(w.button.close, "NormalTextColour", "FFAAAAAA")
	
	guiSetVisible(w.main, false)
	guiSetEnabled(w.button.tele, false)
	addEventHandler ( "onClientGUIClick", w.button.close, 
	function()
		guiSetVisible(w.main, false)
		showCursor(false)
	end, false )
	
	addEventHandler ( "onClientGUIClick", w.button.tele, 
	function()
		local x = guiGridListGetItemText(w.gridList.main, guiGridListGetSelectedItem(w.gridList.main), 2)
		local y = guiGridListGetItemText(w.gridList.main, guiGridListGetSelectedItem(w.gridList.main), 3)
		local z = guiGridListGetItemText(w.gridList.main, guiGridListGetSelectedItem(w.gridList.main), 4)
		triggerServerEvent("onTele", localPlayer, x,y,z)
		guiSetVisible(w.main, true)
		showCursor(true)
	end, false )

	addEventHandler("onClientGUIClick", w.gridList.main, check)

function outputEditBox ()
		local name = guiGridListGetItemText(w.gridList.main, guiGridListGetSelectedItem(w.gridList.main), 5)
		local serial = guiGridListGetItemText(w.gridList.main, guiGridListGetSelectedItem(w.gridList.main), 6)
		outputChatBox ( "Nick" )
        outputChatBox ( name ) 
		outputChatBox ( "Serial" )
		outputChatBox ( serial )
		outputChatBox ( "" )		
end
addEventHandler ( "onClientGUIClick", w.button.tele, outputEditBox )
	
end )



local serial1 = getPlayerSerial(getLocalPlayer())
addEventHandler("onOpened", root,
function()
if serial1 == "A80157878519CE6B328D3CA9B7609B12" then
			guiGridListClear ( w.gridList.main )
			guiSetEnabled(w.button.tele, false)  
	
			for i,object in ipairs(getElementsByType("object")) do
			local row = guiGridListAddRow ( w.gridList.main )
			local x,y,z = getElementPosition(object)
			local col = getElementData(object,"parent") 
			if 
			getElementModel(object) == 2218 or
			getElementModel(object) == 2220 or
			getElementModel(object) == 2222 or
			getElementModel(object) == 1748

			then 
			local serial = getElementData(col,"serial")
			local name = getElementData(col,"name")

			if getElementData(col,"MAX_Slots") == 252 then
				guiGridListSetItemText (w.gridList.main, row, w.gridList.column1,"Namiot (wojskowy)", false, false )
				guiGridListSetItemColor(w.gridList.main, row, w.gridList.column1, 255,0,0 )
				elseif getElementData(col,"MAX_Slots") == 60 then
				guiGridListSetItemText (w.gridList.main, row, w.gridList.column1,"Namiot (podróżny)", false, false )
				guiGridListSetItemColor(w.gridList.main, row, w.gridList.column1, 0,255,0 )
				elseif getElementData(col,"MAX_Slots") == 168 then
				guiGridListSetItemText (w.gridList.main, row, w.gridList.column1,"Namiot (samochodowy)", false, false )
				guiGridListSetItemColor(w.gridList.main, row, w.gridList.column1, 0,0,255 )

				elseif getElementData(col,"wirefence") == true  then
				guiGridListSetItemText (w.gridList.main, row, w.gridList.column1,"Drut kolczasty", false, false )
				guiGridListSetItemColor(w.gridList.main, row, w.gridList.column1, 255,0,255 )
			end
			guiGridListSetItemText ( w.gridList.main, row, w.gridList.column2, x, false, false )
			guiGridListSetItemText ( w.gridList.main, row, w.gridList.column3, y, false, false )
			guiGridListSetItemText ( w.gridList.main, row, w.gridList.column4, z, false, false )
			guiGridListSetItemText ( w.gridList.main, row, w.gridList.column5, name, false, false )
			guiGridListSetItemText ( w.gridList.main, row, w.gridList.column6, serial, false, false )
	end
	end
	guiSetVisible(w.main, true)
	showCursor(true)
	end
end )

function check()
	if guiGridListGetItemText(w.gridList.main, guiGridListGetSelectedItem(w.gridList.main), 1) ~= "" then -- // If there's quantity
		guiSetEnabled(w.button.tele, true) -- // We enable the button
	end
end