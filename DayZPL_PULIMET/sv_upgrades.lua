addEvent("sv_bulletSpawn2", true)
addEventHandler("sv_bulletSpawn2",getRootElement(),function(veh, weapon)
	triggerClientEvent("cl_bulletSpawn2", getRootElement(), veh, getElementData ( veh, "weapon2"),source)
end)

addEvent("kilLDayZPlayer", true)
addEventHandler("kilLDayZPlayer",getRootElement(),function()
	if isElement ( getElementData ( source, "attachedToWeapon_v") ) then
		setElementData ( getElementData ( source, "attachedToWeapon_v"), "playerOnWeapon", nil )
	end
	setElementData ( source, "attachedToWeapon", false )
	setElementData ( source, "attachedToWeapon_v", nil )
	setElementData ( source, "attachedToWeapon_w", nil )
	toggleControl (source,"fire", true)
	setElementCollisionsEnabled ( source, true )
end)

addEventHandler ( "onVehicleExplode", getRootElement(), function()
	local wep = getElementData(source, "weapon")
	local weap2 = getElementData ( source, "weapon2" ) 
	if isElement(wep) then
		destroyElement(wep)
		destroyElement(weap2)
		local player = getElementData (source, "playerOnWeapon")
		if isElement (player) then
			detachElements ( player, getElementData ( source, "attachedToWeapon_w" ) )
			setElementData ( player, "attachedToWeapon", false )
			setElementData ( player, "attachedToWeapon_v", nil )
			setElementData ( player, "attachedToWeapon_w", nil )
			setPedAnimation ( player, false )
			toggleControl (player,"fire", true)
			setElementCollisionsEnabled ( player, true )
		end
	end
end)


function outputChange(dataName,oldValue)
	if getElementType(source) == "colshape" and getElementData (source, "vehicle") then
		local veh = getElementData ( source, "parent" )
		if isElement ( veh ) and weapOff[getElementModel (veh)] then
			if dataName == minigun_name then
				local player = getElementData (veh, "playerOnWeapon")
				local new_value = getElementData ( source, dataName ) or 0
				local weap = getElementData ( veh, "weapon" ) 
				if new_value <= 0 then
					if isElement (player) then
						detachElements ( player, getElementData ( player, "attachedToWeapon_w" ) )
						setElementData ( player, "attachedToWeapon", false )
						setElementData ( player, "attachedToWeapon_v", nil )
						setElementData ( player, "attachedToWeapon_w", nil )
						setPedAnimation ( player )
						toggleControl (player,"fire", true)
						setElementCollisionsEnabled ( player, true )
					end
					if isElement ( weap ) then
						destroyElement ( weap )
					end
					local weap2 = getElementData ( veh, "weapon2" ) 
					if isElement ( weap2 ) then
						destroyElement ( weap2 )
					end
				elseif not isElement (weap) then
					createVehicleMinigun (veh)
				end
			end
		end
	end
end
addEventHandler("onElementDataChange",getRootElement(),outputChange)


addEvent("detachPlayerFromMinigun", true)
addEventHandler("detachPlayerFromMinigun",getRootElement(),function()
	detachElements ( source, getElementData ( source, "attachedToWeapon_w" ) )
	if isElement ( getElementData ( source, "attachedToWeapon_v") ) then
		setElementData ( getElementData ( source, "attachedToWeapon_v"), "playerOnWeapon", nil )
	end
	setElementData ( source, "attachedToWeapon", false )
	setElementData ( source, "attachedToWeapon_v", nil )
	setElementData ( source, "attachedToWeapon_w", nil )
	setPedAnimation ( source, false )
	toggleControl (source,"fire", true)
	setElementCollisionsEnabled ( source, true )
end)