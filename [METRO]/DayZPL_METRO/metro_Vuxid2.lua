local IntEnter = createMarker( 1604.9000244141, -1630.9000244141, -51.9, "cylinder", 1, 130, 0, 0, 170 )
function Int( player ) 
if (source == IntEnter) then 
if getElementType(player) == "player" then 
fadeCamera ( player, false, 1, 0, 0, 0 ) 
setTimer ( fadeCamera, 1000, 1, player, true, 1 ) 
setTimer ( setElementPosition, 1000, 1, player, 1678.0433349609, -1635.1282958984, 14.2265625 ) -- коорды выхода в интерьер
toggleControl ( player, "fire", true ) 
end 
end 
end 
addEventHandler ("onMarkerHit", getRootElement() ,Int )