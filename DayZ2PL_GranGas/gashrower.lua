local throwInMinute = 30  -- максимальное количество выстрелов, минуту
local change_fire_button = "G" -- кнопка на которую будет меняться режим стрельбы


local throwAvail = true

grenadesConfig = { -- ["Название оружия"] = { grenadeName = "Название гранаты" },
	["М4А1 CCO"] = { grenadeName = "Granat hukowy", weapID = 31 },
}


function throwGrenade()
	if not throwAvail then return true end
	local weapon = getElementData ( localPlayer, "currentweapon_1")
	if weapon ~= getElementData ( localPlayer, "usingGrenadeThrower" ) then
		unbindKey ( "mouse1", "down", throwGrenade )
		return true
	end
	if grenadesConfig[weapon] and ( getElementData ( localPlayer, grenadesConfig[weapon].grenadeName ) or 0 ) > 0 and getPedWeapon ( localPlayer ) == grenadesConfig[weapon].weapID then
		throwAvail = false
		setElementData ( localPlayer, grenadesConfig[weapon].grenadeName, ( getElementData ( localPlayer, grenadesConfig[weapon].grenadeName ) or 1 ) - 1 )
		local xm, ym, zm = getPedWeaponMuzzlePosition ( localPlayer )
		local infx,infy,infz = getPositionInfrontOfLP ()
		local x, y, z, lx, ly, lz, roll, dof = getCameraMatrix ()
		local velx, vely = (infx-x)*0.2, (infy-y)*0.2
		createProjectile(getLocalPlayer(),17,xm,ym,zm-0.05,0,nil,0,0,0,velx, vely,lz-z+0.1)
		local uSound = playSound3D( 'sounds/wpn_grenadelauncher_fire_3d_01.wav', x, y, z ) 
		setTimer ( function () throwAvail = true end, 60/throwInMinute*1000, 1)
	else
		triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Nie masz gazu!",255,22,0)
	end
end

function getPositionInfrontOfLP()
    local posX, posY, posZ = getElementPosition(localPlayer)
    local _, _, rotation = getElementRotation(localPlayer)
	rotation = rotation-15
    posX = ( posX - math.sin(math.rad(rotation)) ) 
    posY = ( posY + math.cos(math.rad(rotation)) ) 
    return posX, posY, posZ
end

function playerUsedGrenadeThrower ( player )
	if isElement ( player ) then
		if getElementData ( player, "usingGrenadeThrower" ) and getElementData ( player, "usingGrenadeThrower" ) == getElementData ( localPlayer, "currentweapon_1") then
			return true
		else
			return false
		end
	else
		return false
	end
end

function changeFiringMode ()
	if getControlState ( "aim_weapon" ) then
		if getElementData ( localPlayer, "usingGrenadeThrower" ) then
			setElementData ( localPlayer, "usingGrenadeThrower", false )
			unbindKey ( "mouse1", "down", throwGrenade )
			toggleControl ( "fire", true )
			playSound ("sounds/itm_grenade_up.wav")
			triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Używasz: naboje",255,22,0)
		else
			local weapon = getElementData ( localPlayer, "currentweapon_1")
			if weapon and getPedWeapon (localPlayer) > 10 and grenadesConfig[weapon]  and ( getElementData ( localPlayer, grenadesConfig[weapon].grenadeName ) or 0 ) > 0 then 
				setElementData ( localPlayer, "usingGrenadeThrower", weapon )
				bindKey ( "mouse1", "down", throwGrenade )
				toggleControl ( "fire", false )
				playSound ("sounds/itm_grenade_up.wav")
				triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Używasz: gaz",255,22,0)
			else
				triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Nie masz gazu!",255,22,0)
			end
		end
	end
end

bindKey ( "g", "up", changeFiringMode )
