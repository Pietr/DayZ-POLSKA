--[[
Resource name : (Mw)InformationSpot
Resource author : CrazyK
Resource description : This script allows you to create Information spots around the map which will contain some helpful informations.
Resource version : 1.0.0
Other credits : 69_black_69 for the 3D Info pickup mod : http://www.gtagarage.com/mods/show.php?id=16842
]]--

local screenW, screenH = guiGetScreenSize()
local information_spots = {
--  {Tittle , text , positionX, positionY, positionZ, Interior , Dimension},
	{"Hospital","This is an hospital , you will be respawned here each time you die, you can also buy medical kits that will increase your health progress by 15% once you use it.",2041.73950, -1410.47131, 17.1640,0,0},
	{"Ammunation","This is an ammunation , here you can purchase weapons legally or you can buy it from an arms dealer for a cheaper price.",1364,-1284,13,0,0},
	{"Hospital","This is an hospital , you will be respawned here each time you die, you can also buy medical kits that will increase your health progress by 15% once you use it.",2292,-2091.3994,-49.9,0,0},
	{"Hospital","This is an hospital , you will be respawned here each time you die, you can also buy medical kits that will increase your health progress by 15% once you use it.",2378.6001,-2157,-51.7,0,0},
	{"Hospital","This is an hospital , you will be respawned here each time you die, you can also buy medical kits that will increase your health progress by 15% once you use it.",2257.1006,-2134.2002,-49.9,0,0},
	{"Hospital","This is an hospital , you will be respawned here each time you die, you can also buy medical kits that will increase your health progress by 15% once you use it.",2347.80005,-2196.6001,-49.7,0,0},
	{"Hospital","This is an hospital , you will be respawned here each time you die, you can also buy medical kits that will increase your health progress by 15% once you use it.",2191.8999,-2182.8,-51.8,0,0},
	{"Hospital","This is an hospital , you will be respawned here each time you die, you can also buy medical kits that will increase your health progress by 15% once you use it.",2291,-2257.5,-51.3,0,0},
}

for i, v in ipairs ( information_spots ) do
	local tittle,text,x, y, z, int, dim = unpack ( v )
	local information_spot	= createPickup(x, y, z,3, 1239, 0, 1)
    setElementData(information_spot,"tittle",tittle)
    setElementData(information_spot,"text",text)
	setElementInterior(information_spot,int)
	setElementDimension(information_spot,dim)
	addEventHandler ( "onClientPickupHit", information_spot, function ( daPlayer, matchingdimension) 
		if ( daPlayer == localPlayer and matchingdimension and isPedOnGround(daPlayer) and not isPedInVehicle(daPlayer)) then
		    function displayINFORMATIONS()
	   local le_tittre = getElementData(information_spot,"tittle")
       local le_texte = getElementData(information_spot,"text")
        dxDrawRectangle(screenW * 0.2881, screenH * 0.4544, screenW * 0.4238, screenH * 0.1003, tocolor(0, 0, 0, 115), false)
        dxDrawText(le_texte, (screenW * 0.2881) - 1, (screenH * 0.4661) - 1, (screenW * 0.7119) - 1, (screenH * 0.5482) - 1, tocolor(0, 0, 0, 115), 1.00, "default-bold", "center", "top", false, true, false, false, false)
        dxDrawText(le_texte, (screenW * 0.2881) + 1, (screenH * 0.4661) - 1, (screenW * 0.7119) + 1, (screenH * 0.5482) - 1, tocolor(0, 0, 0, 115), 1.00, "default-bold", "center", "top", false, true, false, false, false)
        dxDrawText(le_texte, (screenW * 0.2881) - 1, (screenH * 0.4661) + 1, (screenW * 0.7119) - 1, (screenH * 0.5482) + 1, tocolor(0, 0, 0, 115), 1.00, "default-bold", "center", "top", false, true, false, false, false)
        dxDrawText(le_texte, (screenW * 0.2881) + 1, (screenH * 0.4661) + 1, (screenW * 0.7119) + 1, (screenH * 0.5482) + 1, tocolor(0, 0, 0, 115), 1.00, "default-bold", "center", "top", false, true, false, false, false)
        dxDrawText(le_texte, screenW * 0.2881, screenH * 0.4661, screenW * 0.7119, screenH * 0.5482, tocolor(204, 204, 204, 149), 1.00, "default-bold", "center", "top", false, true, false, false, false)
        dxDrawLine(screenW * 0.2881, screenH * 0.4544, screenW * 0.7119, screenH * 0.4531, tocolor(189, 189, 189, 90), 2, false)
        dxDrawText(le_tittre, (screenW * 0.2881) - 1, (screenH * 0.4141) - 1, (screenW * 0.7119) - 1, (screenH * 0.4674) - 1, tocolor(79, 79, 79, 149), 1.40, "pricedown", "center", "bottom", false, false, false, false, false)
        dxDrawText(le_tittre, (screenW * 0.2881) + 1, (screenH * 0.4141) - 1, (screenW * 0.7119) + 1, (screenH * 0.4674) - 1, tocolor(79, 79, 79, 149), 1.40, "pricedown", "center", "bottom", false, false, false, false, false)
        dxDrawText(le_tittre, (screenW * 0.2881) - 1, (screenH * 0.4141) + 1, (screenW * 0.7119) - 1, (screenH * 0.4674) + 1, tocolor(79, 79, 79, 149), 1.40, "pricedown", "center", "bottom", false, false, false, false, false)
        dxDrawText(le_tittre, (screenW * 0.2881) + 1, (screenH * 0.4141) + 1, (screenW * 0.7119) + 1, (screenH * 0.4674) + 1, tocolor(79, 79, 79, 149), 1.40, "pricedown", "center", "bottom", false, false, false, false, false)
        dxDrawText(le_tittre, screenW * 0.2881, screenH * 0.4141, screenW * 0.7119, screenH * 0.4674, tocolor(204, 204, 204, 149), 1.40, "pricedown", "center", "bottom", false, false, false, false, false)
	end
	addEventHandler("onClientRender", root,displayINFORMATIONS)
	end
	end)
	addEventHandler ( "onClientPickupLeave", information_spot, function ( daPlayer, matchingdimension) 
		if ( daPlayer == localPlayer and matchingdimension )  then
removeEventHandler("onClientRender", root,displayINFORMATIONS)
end
end)
end

--[[Replace Information's pickup]]--
informationpickup_txd = engineLoadTXD("models/info.txd")
engineImportTXD(informationpickup_txd, 1239)
informationpickup_dff = engineLoadDFF("models/info.dff",1239)
engineReplaceModel(informationpickup_dff,1239)
