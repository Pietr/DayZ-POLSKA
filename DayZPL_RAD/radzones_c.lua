radZoneLabel = nil
radZoneSoundTimer = nil
radZoneSound = nil
str_type = "low"
local radLevel = 0

function changeRadZoneLabel ( state, level )
	if state == 1 then
		radLevel = level
		if not isElement ( radZoneSound ) then
			--addEventHandler ( "onClientRender", root, renderRadInfo )
			str_type = "low"
			if level > 3 and level < 6 then
				str_type = "med"
			elseif level >= 6 then
				str_type = "hi"
			end
				if getElementData(getLocalPlayer(),"logedin") then
			if getElementData(getLocalPlayer(),"Dozymetr") >= 1 then
			radZoneSound = playSound ( "sounds/"..str_type.."/"..str_type.."_"..tostring(math.random(1,3))..".mp3" )
			if isElement ( radZoneSound ) then
				radZoneSoundTimer = setTimer ( changeRadZoneSound, getSoundLength ( radZoneSound )*1000, 1 )
			end
			
			end
			end
		end
	else
		--removeEventHandler ( "onClientRender", root, renderRadInfo )
		radLevel = 0
		if isTimer ( radZoneSoundTimer ) then killTimer ( radZoneSoundTimer ) end
		if isElement ( radZoneSound ) then destroyElement ( radZoneSound ) end
		if isElement ( radZoneLabel ) then
			guiSetVisible ( radZoneLabel, false )
		end
	end
end

addEvent( "changeRadZoneLabelS", true )
addEventHandler( "changeRadZoneLabelS", getRootElement(), changeRadZoneLabel )

function changeRadZoneSound ()

	if getElementData(getLocalPlayer(),"logedin") then
	if getElementData(getLocalPlayer(),"Dozymetr") >= 1 then
	
	if isElement ( radZoneSound ) then destroyElement ( radZoneSound ) end
	if getElementData ( localPlayer, "inRadZone" ) then
		radZoneSound = playSound ( "sounds/"..str_type.."/"..str_type.."_"..tostring(math.random(1,3))..".mp3" )
		if isElement ( radZoneSound ) then
			radZoneSoundTimer = setTimer ( changeRadZoneSound, getSoundLength ( radZoneSound )*1000, 1 )
		end
	end
	
	end
	end
end

screenWidth,screenHeight = guiGetScreenSize()

seperator = dxCreateTexture ( "glow_messages_radiation_seperator_right.dds", "argb" )
arrow = dxCreateTexture ( "glow_messages_radiation_seperator_arrow.dds", "argb" )
--[[
function renderRadInfo ( )

	dxDrawImage ( screenWidth-512, 0, 512, 128, seperator, 0, 0, 0, tocolor ( 255, 50, 50 ) )
	local maxRad = 1020
	local x = 295/maxRad*getElementData(localPlayer, "radiation" )-365
	dxDrawImage ( screenWidth+x, 20, 64, 32, arrow, 0, 0, 0, tocolor ( 255, 50, 50 ) ) -- -365 ноль -75 максимум
	dxDrawText ( "+"..tostring(radLevel).." РАД/СЕК", screenWidth, 52, screenWidth-50, screenHeight, tocolor ( 255, 50, 50 ), 2, "default-bold", "right" )

	if getElementData(getLocalPlayer(),"logedin") then
	
	local x,y = guiGetScreenSize()
	local screenWidth,screenHeight = guiGetScreenSize()
	local bX, bY = screenWidth/2,screenHeight/2
	local radiation =  getElementData(getLocalPlayer(),"radiation")
		
		if getElementData(getLocalPlayer(),"Dozymetr") >= 1 then
			dxDrawText(radiation.."+"..tostring(radLevel),x*0.05,y*0.52, xlenght, y,tocolor(0,0,0,175),2,"sans","center","top",false,false,false) 
		end
	end
	
end

]]
function renderRadInfo()
	if getElementData(getLocalPlayer(),"logedin") then
		local x,y = guiGetScreenSize()
		local screenWidth,screenHeight = guiGetScreenSize()
		local bX, bY = screenWidth/2,screenHeight/2
		local radiation =  getElementData(getLocalPlayer(),"radiation")
		if getElementData(getLocalPlayer(),"Dozymetr") >= 1 then
			dxDrawImage ( x*0.01,y*0.49,screenWidth* 0.080, screenWidth* 0.135, 'radiation.union')
			dxDrawText(radiation.."+"..tostring(radLevel),x*0.05,y*0.52, xlenght, y,tocolor(0,0,0,175),2,"sans","center","top",false,false,false) 
		end	
	end	
end

addEventHandler("onClientRender",getRootElement(),renderRadInfo)
