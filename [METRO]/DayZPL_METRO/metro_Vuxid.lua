local IntEnter = createMarker( 2461.6000976563, -1976, -53.1, "cylinder", 1, 130, 0, 0, 170 )
function Int( player ) 
if (source == IntEnter) then 
if getElementType(player) == "player" then 
fadeCamera ( player, false, 1, 0, 0, 0 ) 
setTimer ( fadeCamera, 1000, 1, player, true, 1 ) 
setTimer ( setElementPosition, 1000, 1, player, 2486.7182617188, -1954.8331298828, 13.41307258606 ) -- коорды выхода в интерьер
toggleControl ( player, "fire", true ) 
end 
end 
end 
addEventHandler ("onMarkerHit", getRootElement() ,Int )