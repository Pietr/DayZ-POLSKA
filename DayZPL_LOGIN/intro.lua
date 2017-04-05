local sw,sh = guiGetScreenSize()

relaxAlpha = 0
relaxAlphaState = 1

function changeRelaxAlpha ()
	if relaxAlphaState == 0 then
		relaxAlpha = relaxAlpha-3
		if relaxAlpha < 3 then
			relaxAlpha = true
			relaxAlpha = 0
			relaxAlphaState = -1
		end
	elseif relaxAlphaState == 1 then
		relaxAlpha = relaxAlpha+3
		if relaxAlpha > 245 then
			relaxAlphaState = -1
			relaxAlpha = 255
			setTimer (function() relaxAlphaState = 0 end, 4000, 1)
		end
	end
end


function changeQuoteAlpha ()
	if fadeIn then
		radAlpha = radAlpha-5
		if radAlpha < 5 then
			fadeIn = false
			fadeOut = true
		end
	end
	if fadeOut then
		radAlpha = radAlpha+5
		if radAlpha > 245 then
			radAlpha = 255
			fadeOut = false
			fadeIn = true
		end
	end
end

local aspect = sw/sh
local sizeX, sizeY = 713/1700*sw, 1000*sh/1000
if aspect <= 1.4 then
	sizeX, sizeY = 713*sw/(aspect*1000), 1000*sh/(aspect*1000)
end



function setFlyingCamera ()
	fadeCamera (true)
	progress = 0
	currentPoses = math.random(1,#camerasPos)
	xp, yp, zp, xlat, ylat, zlat = camerasPos[currentPoses][1],camerasPos[currentPoses][2],camerasPos[currentPoses][3],camerasPos[currentPoses][4],camerasPos[currentPoses][5],camerasPos[currentPoses][6]
	addEventHandler ( "onClientRender", root, flyCamera )
end

local progress = 0
local currentPoses = 1
local faded = false

camerasPos = {
	{ 2279.2001953125,-2085.3,-50.299999237061, 	  2378.2001953125,-2156.8994140625,-50.299999237061},
	{ 2247,-2122.6000976563,-50.59999847412,      2337.3999023438,-2189.1000976563,-50.599998474121},
	{ 2181.6000976563,-2174.6000976563,-50.099998474121,     2281.1999511719,-2248.3000488281,-50.099998474121},
}


local isMenuVisuble = false


function flyCamera()
	progress = progress+0.0006+0.0004
	if progress > 0.95  then
		progress = progress-0.0006-0.0004
		zlat = zlat+0.00002
	    if not isMenuVisuble then
			isMenuVisuble = true
			startShowingMenu()
		end
	elseif progress > 0.60  then
		zlat = zlat-0.002
		
	elseif progress > 0.59  then
		progress = progress+0.0005+0.0004
	elseif progress > 0.57  then
		progress = progress-0.0005-0.0004
		
	elseif progress > 0.35  then
		progress = progress+0.0005+0.0004
	elseif progress > 0.34  then
		progress = progress-0.0005-0.0004
		
	elseif progress > 0.07  then
		progress = progress+0.0005+0.0004
	elseif progress > 0.06  then
		progress = progress-0.0005-0.0004

	end
	
	local x,y,z = interpolateBetween ( xp, yp, zp, xlat, ylat, zlat, progress, "Linear" )
	setCameraMatrix ( x,y,z,xlat, ylat, zlat)
end


function startShowingMenu ()
	startInfoWindow()
end
