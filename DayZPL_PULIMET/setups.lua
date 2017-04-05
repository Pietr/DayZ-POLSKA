weapOff = {}
weapOff[554] = {-0.1, -1.9, -0.1, 0, 30, 60} -- так для разных моделей автомобилей делать. weapOff[ид модели] = {x,y,z, x rot, y rot, z rot } x rot, y rot и z rot лучше не трогай
weapOff[490] = {-0.1, -1.9, 0.3, 0, 30, 60}
weapOff[588] = {-0.1, 0.3, 1.9, 0, 30, 60}--582
weapOff[400] = {-0.1, 0.3, 1, 0, 30, 60}
weapOff[500] = {-0.1, -0.6, 0.35, 0, 30, 60}
weapOff[548] = {-0.1, -9.1, 0.17, 0, 30, 60}
weapOff[470] = {-0.1, 0.3, 1, 0, 30, 60}
weapOff[563] = {-0.8, 0, -0.8, 0, 30, 60}
weapOff[427] = {-0.1, -1, 2, 0, 30, 60}


veh_damage = 50 -- урон для автомобилей
minigun_name = "М134 Minigun" -- названеи предмета, который ставит на машину пулемет

addEvent("attachPlayerToMinigun", true)
addEventHandler("attachPlayerToMinigun",getRootElement(),function(veh)
	local mid = getElementModel ( veh )
	if weapOff[mid] then
		local weap = getElementData ( veh, "weapon" )
		setPedAnimation ( source, "SILENCED", "SilenceCrouchfire", 1, false, false, false, true )
		attachElements ( source, weap, -0.2, -0.5, 1, 0, 0, 90)
		setElementCollisionsEnabled ( source, false )
		setElementData ( source, "attachedToWeapon_v", veh )
		setElementData ( source, "currentCol", nil )
		setElementData ( source, "attachedToWeapon_w", weap )
		setElementData ( veh, "playerOnWeapon", source )
		toggleControl (source,"fire", false)
	end
end)

addEvent("rotatePlayerWeapon", true)
addEventHandler("rotatePlayerWeapon",getRootElement(),function(rot,rot2_x)
	if getElementData ( source, "attachedToWeapon" ) then
		local veh = getElementData ( source, "attachedToWeapon_v" )
		if isElement ( veh ) and getElementHealth ( veh ) > 0 then
			local weap = getElementData ( veh, "weapon" )
			local weap2 = getElementData ( veh, "weapon2" )
			local mid = getElementModel ( veh )
			if isElement ( weap ) then
				local _, _, veh_rot = getElementRotation (veh)
				setElementAttachedOffsets ( weap, weapOff[mid][1], weapOff[mid][2], weapOff[mid][3], 0, 0, rot-veh_rot+35)
				local _,_,_,_,lr,_ = getElementAttachedOffsets ( weap2 )
				if -rot2_x < 5 then
					setElementAttachedOffsets ( weap2, 0, -0.3, 0.9, weapOff[mid][4], -rot2_x+30, weapOff[mid][6])
				else
					setElementAttachedOffsets ( weap2, 0, -0.3, 0.9, weapOff[mid][4], lr, weapOff[mid][6])
				end
			end
		else
			setElementData ( source, "attachedToWeapon", false )
		end
	end
end)

function createVehicleMinigun (veh)
	local x,y,z = getElementPosition(veh)
	local mid = getElementModel(veh)
	if weapOff[mid] then
		local weapon = createObject ( 362, x+weapOff[mid][1],y+weapOff[mid][2],z+weapOff[mid][3])
		local weapon_base = createObject ( 1851, x+weapOff[mid][1],y+weapOff[mid][2],z)
		attachElements ( weapon_base, veh, weapOff[mid][1], weapOff[mid][2], weapOff[mid][3], 0, 0, 0)
		attachElements ( weapon, weapon_base, 0, -0.3, 0.9, weapOff[mid][4], weapOff[mid][5], weapOff[mid][6])
		setElementData(veh, "weapon", weapon_base)
		setElementData(veh, "weapon2", weapon)
		setElementData(veh, "playerOnWeapon", nil)
	end
end

addEvent("causeVehicleDamageFromMG", true)
addEventHandler("causeVehicleDamageFromMG",getRootElement(),function(veh)
	if isElement ( veh ) then
		setElementHealth ( veh, getElementHealth (veh) - veh_damage )
		if getElementHealth ( veh ) < 0 then
			setElementHealth ( veh, 0 )
		end
	end
end)
