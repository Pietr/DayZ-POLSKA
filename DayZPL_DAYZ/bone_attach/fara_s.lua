
--[[
addEvent("sv_createWeapon", true)
addEventHandler("sv_createWeapon", getRootElement(), function(item, loot, player)
	local veh = getElementData(loot,"parent")
	if getElementData(loot, "Reflektor") == 1 then
		setTimer ( function (veh) setVehicleLightState (veh, 1,  0 )  end, 1000, 1, veh ) 
	elseif getElementData(loot, "Reflektor") == 2 then
		setTimer ( function (veh) setVehicleLightState ( veh, 0,  0 )  end, 1000, 1, veh ) 
	 end
end)
addEvent("sv_destroyWeapon", true)
addEventHandler("sv_destroyWeapon", getRootElement(), function(item, loot, player)
	local veh = getElementData(loot,"parent")
	if getElementType(veh)~="vehicle" then return end
	if getElementData(loot, "Reflektor") == 0 then
	setTimer ( function (veh) setVehicleLightState ( veh, 0,  1 )  end, 1000, 1, veh ) 
	setTimer ( function (veh) setVehicleLightState ( veh, 1,  1 )  end, 1000, 1, veh ) 
end
end)
]]
--[[
setVehiclePanelState ( veh, 5, 0 ) Частини
Cars:
0: Front-left panel
1: Front-right panel
2: Rear-left panel
3: Rear-right panel
4: Windscreen
5: Front bumper
6: Rear bumper
Planes:
0: Ціле
1: побите
2: весить
3: відломане
4: цілий
5: цілий
6: цілий

setVehicleWheelStates(veh,1,1,1,1) -- Колеса
Cars:
(veh,1,1,1,1) -- пробиты
(veh,0,0,0,0) -- цылы
(veh,2,2,2,2) -- нема




VehiclesID = { [470]=true,[422]=true,[437]=true,[433]=true,[497]=true,[478]=true,[468]=true }
 
addEventHandler("onResourceStart",resourceRoot,
function ( )
    setTimer(
        function ( )
            for _,v in pairs ( getElementsByType("player") ) do
            local vehicle = getPedOccupiedVehicle(v)
            if not vehicle then return end
            if isElementInWater ( vehicle ) then
            if (  VehiclesID[getElementModel(vehicle)] ) then
            setTimer(
                function( )
                blowVehicle( vehicle )
                 end,30000,1)
                end
            end
        end
    end,250,0,v)
end
)
           
   ]]


