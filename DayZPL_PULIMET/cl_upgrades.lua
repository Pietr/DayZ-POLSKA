update_timer = nil
w, h = guiGetScreenSize ()
minigunAmmo = "51mm NATO" -- название патронов для пулемета
ammoInClip = 100 -- количество патронов в одной обойме пулемета
soundDist = 350 -- максимальная дальность звука пулемета

addEvent("cl_bulletSpawn2", true)
addEventHandler("cl_bulletSpawn2",getRootElement(),function(veh, weapon,player)
	local x,y,z = getElementPosition ( weapon )
 	local weaponReal = createWeapon("minigun", x,y,z)
	attachElements ( weaponReal, weapon, 1, 0, 0.35 )
	setWeaponProperty(weaponReal, "damage", 0)
	setElementCollisionsEnabled(weaponReal, false)
	setElementAlpha(weaponReal,0)
	local sound = playSound3D ( "19.wav", x, y, z )
	setSoundMaxDistance ( sound, soundDist )
	setElementData ( weaponReal, "owner", player )
	local aim = getElementData ( player, "attachedToWeapon_aim" )
	
	setWeaponTarget(weaponReal, aim[1],aim[2],aim[3])
	setWeaponProperty ( weaponReal, "weapon_range", 150 )
	setWeaponProperty ( weaponReal, "target_range", 150 )
	setWeaponState(weaponReal, "firing")
	setTimer ( fireCustomWeapInTime, 200, 1, weaponReal, player )
end)

function getPositionInfrontOfElement(x,y,rotation, meters)
    posX = x - math.sin(math.rad(rotation)) * meters
    posY = y + math.cos(math.rad(rotation)) * meters
    return posX, posY, posZ
end

function causeCustomWeaponDamage(hitElement)
	if hitElement then
		local owner = getElementData(source,"owner")
		if isElement (owner) and getElementData (owner, "attachedToWeapon_fire") then
			if hitElement == localPlayer then 
				setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-8000)
				if getElementData(getLocalPlayer(),"blood") <= 0 then
					if not getElementData(getLocalPlayer(),"isDead") then
						triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),owner,false,"пулемет")
						setElementData(getLocalPlayer(),"isDead",true)
					end
				end
			elseif owner == localPlayer then
				if getElementData (hitElement,"zombie") then
					setElementData(hitElement,"blood",getElementData(hitElement,"blood")-8000)
					if getElementData(hitElement,"blood") <= 0 then
						triggerServerEvent("onZombieGetsKilled",hitElement,owner,false)
					end
				elseif getElementType ( hitElement ) == "vehicle" then
					triggerServerEvent ( "causeVehicleDamageFromMG", localPlayer, hitElement ) 
				end
			end
		end
	end
end
addEventHandler("onClientWeaponFire", getRootElement(), causeCustomWeaponDamage)

function fireCustomWeapInTime (weapon, player)
	if isElement ( player ) and getElementData ( player, "attachedToWeapon_fire" ) then
		local aim = getElementData ( player, "attachedToWeapon_aim" )
		setWeaponTarget(weapon, aim[1],aim[2],aim[3])
		setWeaponState(weapon, "firing")
		local x,y,z = getElementPosition ( player )
		playSound3D ( "19.wav", x, y, z )
		setTimer ( function () local sound = playSound3D ( "19.wav", x, y, z ) setSoundMaxDistance ( sound, soundDist ) end, 100, 1 )
		setTimer ( fireCustomWeapInTime, 200, 1, weapon, player )
	else
		destroyElement ( weapon )
	end
end

function fireCustomVehWeapon ()
	if getElementData (localPlayer, "attachedToWeapon") then
		local veh = getElementData (localPlayer, "attachedToWeapon_v")
		if isElement ( veh ) then
			local weapon = getElementData ( veh, "weapon" )
			if isElement ( weapon ) and removeVehicleAmmo ( getElementData (veh,"parent") ) then
				local x, y, z = getWorldFromScreenPosition ( w/2, h/2, 50 )
				setElementData ( localPlayer, "attachedToWeapon_aim", {x, y, z} )
				setTimer ( updateWeaponTargetOnFire, 200, 1 )
				setElementData ( localPlayer, "attachedToWeapon_fire", true)
				triggerServerEvent("sv_bulletSpawn2", localPlayer, veh, weapon, {x, y, z})
			end
		end
	end
end

bindKey ("mouse1", "down", fireCustomVehWeapon)

function removeVehicleAmmo ( veh )
	if isElement ( veh ) then
		local cur_temp_ammo = getElementData ( veh, "temp_ammo" ) or 0
		local main_ammo = getElementData ( veh, minigunAmmo ) or 0
		if cur_temp_ammo > 0 then
			setElementData ( veh, "temp_ammo", cur_temp_ammo - 1 )
			return true
		elseif main_ammo > 0 then
			setElementData ( veh, "temp_ammo", ammoInClip )
			setElementData ( veh, minigunAmmo, main_ammo - 1 )
			return true
		else
			return false
		end
	end
end

function updateWeaponTargetOnFire ()
	if getKeyState ("mouse1") and getElementData (localPlayer,"attachedToWeapon") then
		local veh = getElementData ( localPlayer, "attachedToWeapon_v" ) 
		if isElement (veh) and getElementHealth (veh) > 0 then
			if not removeVehicleAmmo ( getElementData (veh,"parent") ) then setElementData ( localPlayer, "attachedToWeapon_fire", false); triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","В машине нет патронов для пулемета",255,22,0) return true end
			local x, y, z = getWorldFromScreenPosition ( w/2, h/2, 75 )
			setElementData ( localPlayer, "attachedToWeapon_aim", {x, y, z} )
			setTimer ( updateWeaponTargetOnFire, 200, 1 )
		else
			setElementData ( localPlayer, "attachedToWeapon_fire", false)
		end
	else
		setElementData ( localPlayer, "attachedToWeapon_fire", false)
	end
end


function getIntoMacineGun ()
	local veh_col = getElementData ( localPlayer, "currentCol" )
	if getElementData ( localPlayer, "attachedToWeapon" ) then
		triggerServerEvent ( "detachPlayerFromMinigun", localPlayer)
		removeEventHandler('onClientRender', root, renderVehCross )
		if isTimer (update_timer) then
			killTimer ( update_timer )
		end
		return true
	end
	if isElement ( veh_col ) then
		local veh = getElementData ( veh_col, "parent" )
		if isElement ( veh ) then
			if isElement ( getElementData ( veh, "weapon" ) ) and not isElement(getElementData ( veh, "playerOnWeapon" )) then
				triggerServerEvent ( "attachPlayerToMinigun", localPlayer, veh)
				setElementData (localPlayer,"attachedToWeapon",true)
				addEventHandler('onClientRender', root, renderVehCross )
				setTimer ( function () update_timer = setTimer ( updatePlayerWeapon, 50, 0 ) end, 500, 1 )
			end
		end
	end
end

bindKey ( "h", "down", getIntoMacineGun)

function updatePlayerWeapon ()
	if getElementData (localPlayer, "attachedToWeapon") then
		local veh = getElementData (localPlayer, "attachedToWeapon_v")
		if isElement ( veh ) and getElementHealth ( veh ) > 0 then
			local x, y, z, lx, ly, lz = getCameraMatrix ()
			local rot = findRotation ( x,y,lx,ly )
			local rot2_x, rot_y, rot2_z = getCameraRotation()
			setElementRotation ( localPlayer, 0, 0, rot, "default", true )
			triggerServerEvent ("rotatePlayerWeapon",localPlayer,rot,rot2_x)
		end
	else
		killTimer ( update_timer )
	end
end


function renderVehCross ()
	if getElementData (localPlayer,"attachedToWeapon") then
		dxDrawImage (w/2-32, h/2-32,64,64,"shotgun.png",0,0,0)
	else
		removeEventHandler('onClientRender', root, renderVehCross )
	end
end

function findRotation(x1,y1,x2,y2)
 
  local t = -math.deg(math.atan2(x2-x1,y2-y1))
  if t < 0 then t = t + 360 end;
  return t;
end

function getCameraRotation ()
    local px, py, pz, lx, ly, lz = getCameraMatrix()
    local rotz = 6.2831853071796 - math.atan2 ( ( lx - px ), ( ly - py ) ) % 6.2831853071796
    local rotx = math.atan2 ( lz - pz, getDistanceBetweenPoints2D ( lx, ly, px, py ) )
    rotx = math.deg(rotx)
    rotz = -math.deg(rotz)	
    return rotx, 180, rotz
end
