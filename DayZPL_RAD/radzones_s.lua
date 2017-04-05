function loadRadZones ()
	local radzones = getElementsByType ( "radzone" )
	for i,radzoneNum in ipairs(radzones) do
		local radzone = createColSphere ( tonumber(getElementData ( radzoneNum, "posX" )), tonumber(getElementData ( radzoneNum, "posY" )), tonumber(getElementData ( radzoneNum, "posZ" )), tonumber(getElementData ( radzoneNum, "size" )) )
		setElementData ( radzone, "radZone", true )
		setElementData ( radzone, "level", tonumber(getElementData ( radzoneNum, "level" )) )
		--createObject ( 2079, tonumber(getElementData ( radzoneNum, "posX" )), tonumber(getElementData ( radzoneNum, "posY" )), tonumber(getElementData ( radzoneNum, "posZ" )), 0, 0, math.random ( 0,360 ) ) -- 322
		--local bomb = createObject ( 1636, tonumber(getElementData ( radzoneNum, "posX" )), tonumber(getElementData ( radzoneNum, "posY" )), tonumber(getElementData ( radzoneNum, "posZ" )), math.random ( 280,350 ), math.random ( 0,360 ), math.random ( 0,360 ) )
		--setObjectScale ( bomb, 3 )
		--createBlip ( tonumber(getElementData ( radzoneNum, "posX" )), tonumber(getElementData ( radzoneNum, "posY" )), tonumber(getElementData ( radzoneNum, "posZ" )) )
	end	
end

addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), loadRadZones )
 
function radShapeEntered ( player, level )
	if getElementData ( player, "inRadZone" ) == false and getElementModel ( player ) ~= 244 and getElementModel ( player ) ~= 257 and not getElementData ( player, "norLiveKileld" ) then
		local resistance = checkRadSafeSkin ( player )
		setTimer ( givePlayerRadZone, 1000, 1, player, level )
		setElementData ( player, "radZoneID", source )
		givePlayerRadiation ( player, level )
		setElementData ( player, "inRadZone", true )
		triggerClientEvent ( player, "changeRadZoneLabelS", getRootElement(), 1, math.floor(level-level/100*resistance) )
	end
end

function radShapeEscaped ( player )
	--if getElementData ( player, "inRadZone" ) == true then
		triggerClientEvent ( player, "changeRadZoneLabelS", getRootElement(), 2 )
		setElementData ( player, "inRadZone", false )
		setElementData ( player, "radZoneID", false )
---	end
end

radSafeSkins = { -- [ид скина] = процент сопротивления радиации;
	[72] = 100,
	[56] = 100,
}

clothSlots = { -- слоты одежки, защищающей от радиации 
	["clothHeadN"] = {-- голова
		["Maska"] = 50,
	},
	["clothBody"] = { -- грудная клетка
		["Противоударный бронежилет"] = 5,
	},
}

function givePlayerRadiation ( player, quant )
	local curr = getElementData ( player, "radiation" ) or 0
	local resistance = checkRadSafeSkin ( player )
	local resistance2 = checkRadSafeCloth ( player )
	local reduce = resistance+resistance2
	if reduce > 100 then
		reduce = 100
	end
	if reduce > 0 then
		quant = math.floor(quant - quant/100*reduce)
	else
		quant = quant
		setElementData(player,"blood",getElementData(player,"blood")-quant)
	end
	if curr+quant <= 999 then
		setElementData ( player, "radiation", curr + quant )
	elseif curr+quant > 999 then
		setElementData ( player, "radiation", 999 )
	end
end

function checkTemperature()
	for i,player in ipairs(getElementsByType("player")) do
	local curr = getElementData ( player, "radiation" )
		if getElementData(player,"logedin") then
		if curr >= 600 then
		setElementData(player,"blood",getElementData(player,"blood")-math.random(60,261) )
		end
		end
	end	
end
setTimer(checkTemperature,10000,0)

function checkRadSafeSkin ( player )
	local model = getElementModel ( player )
	if radSafeSkins[model] then
		return radSafeSkins[model]
	else
		return 0
	end
end

function checkRadSafeCloth ( player )
	local reduce = 0
	for i, v in pairs ( clothSlots ) do
		local slot_cloth = getElementData ( player, i )
		if slot_cloth then
			for cloth, res in pairs (v) do
				if slot_cloth == cloth then
					reduce = reduce+res
					break
				end
			end
		end
	end
	return reduce
end

function givePlayerRadZone ( player, level)
	if getElementData ( player, "inRadZone" ) then
		if isElement ( getElementData ( player, "radZoneID" ) ) then
			if isElementWithinColShape ( player, getElementData ( player, "radZoneID" ) ) then
				givePlayerRadiation ( player, level )
				setTimer ( givePlayerRadZone, 1000, 1, player, level )
			else
				setElementData ( player, "radZoneID", false )
			end
		end
	end
end

function radZoneEnter ( hitter, matchingDimension )
	if getElementData ( source, "radZone" ) then
		if getElementType ( hitter ) == "player" then
			radShapeEntered ( hitter, getElementData ( source, "level" ) )	
		end
	end
end
addEventHandler ( "onColShapeHit", getRootElement(), radZoneEnter )
 
function radZoneExit ( hitter, matchingDimension )
	if getElementData ( source, "radZone" ) then
		if getElementType ( hitter ) == "player" then
			radShapeEscaped ( hitter )	
		end
	end
end
addEventHandler ( "onColShapeLeave", getRootElement(), radZoneExit )