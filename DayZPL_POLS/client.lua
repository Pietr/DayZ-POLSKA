local lie = false
local changeNotAvail = false
local ignorLie = true

function getCameraRotation ()
    local px, py, pz, lx, ly, lz = getCameraMatrix()
    local rotz = 6.2831853071796 - math.atan2 ( ( lx - px ), ( ly - py ) ) % 6.2831853071796
    local rotx = math.atan2 ( lz - pz, getDistanceBetweenPoints2D ( lx, ly, px, py ) )
    rotx = math.deg(rotx)
    rotz = -math.deg(rotz)	
    return rotx, 180, rotz
end

function updateCameraLie()
	local state = getControlState ( "forwards" )
	local state_back = getControlState ( "backwards" )
	local x, y, z = getElementPosition ( localPlayer )
	local zG = getGroundPosition ( x, y, z )
	local rot2_x, rot_y, rot2_z = getCameraRotation()
	local anim_blockP, anim_nameP = getPedAnimation ( localPlayer )
	if ignorLie and ((z-zG) > 2 or (anim_blockP ~= animation_block and anim_nameP ~= animation_name)) then
		lie = false
		setElementData ( localPlayer, "liemove:crawling", false )
		triggerServerEvent ("resetPlayerCrawlingAnimation",localPlayer)
		removeEventHandler ( "onClientRender", root, updateCameraLie )
		return
	end
	if state and lie then
		if tostring(anim_nameP) ~= "CS_Dead_Guy" then
			lie = false
			setElementData ( localPlayer, "liemove:crawling", false )
		end
		if isLineOfSightClear ( x, y, z, x - math.sin(math.rad(-rot2_z)) * 1, y + math.cos(math.rad(-rot2_z)) * 1, z ) then
			setElementRotation ( localPlayer, 0,0,-rot2_z )
			setElementPosition ( localPlayer, x - math.sin(math.rad(-rot2_z)) * move_speed, y + math.cos(math.rad(-rot2_z)) * move_speed, z, false)
		end
	elseif state_back and lie then
		if tostring(anim_nameP) ~= "CS_Dead_Guy" then
			lie = false
			setElementData ( localPlayer, "liemove:crawling", false )
		end
		if isLineOfSightClear ( x, y, z, x + math.sin(math.rad(-rot2_z)) * 1, y - math.cos(math.rad(-rot2_z)) * 1, z ) then
			setElementRotation ( localPlayer, 0, 0, -rot2_z )
			setElementPosition ( localPlayer, x + math.sin(math.rad(-rot2_z)) * move_speed, y - math.cos(math.rad(-rot2_z)) * move_speed, z, false)
		end
	end
end


function startMovingLie()
	if changeNotAvail then return true end
	changeNotAvail = true
	setTimer ( function () changeNotAvail = false end, 2000, 1 )
	if getPedMoveState ( localPlayer ) ~= "stand" then return true end
	if lie then
		setElementData ( localPlayer, "liemove:crawling", false )
		triggerServerEvent ("resetPlayerCrawlingAnimation",localPlayer)
		removeEventHandler ( "onClientRender", root, updateCameraLie )
		lie = false
	else
		triggerServerEvent ("startPlayerCrawlingAnimation",localPlayer)
		addEventHandler ( "onClientRender", root, updateCameraLie )
		lie = true
		ignorLie = false
		setTimer ( function () ignorLie = true end, 1000, 1 )
	end
end
bindKey ( ",", "down", startMovingLie )

addEventHandler( "onClientElementStreamIn", getRootElement( ),
    function ( )
        if getElementType( source ) == "player" then
            if getElementData ( source, "liemove:crawling" ) then
				setPedAnimation ( source, animation_block, animation_name, -1, addit_opt, false, false, true )
			end
        end
    end
);
