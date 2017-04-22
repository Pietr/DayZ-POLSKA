local IntEnter = createMarker( -1515.3376464844,2510.8605957031,36.41875, "cylinder", 1, 130, 0, 0, 170 )
function Int( player ) 
if (source == IntEnter) then 
if getElementType(player) == "player" then 
fadeCamera ( player, false, 1, 0, 0, 0 ) 
setTimer ( fadeCamera, 1000, 1, player, true, 1 ) 
setTimer ( setElementPosition, 1000, 1, player, -1519.7601318359,2526.5856933594,55.6875 ) -- коорды выхода в интерьер
toggleControl ( player, "fire", true ) 
end 
end 
end 
addEventHandler ("onMarkerHit", getRootElement() ,Int )