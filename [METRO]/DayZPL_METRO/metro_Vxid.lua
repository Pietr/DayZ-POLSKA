local IntEnter = createMarker( 2485.3999023438, -1958.1999511719, 12.7, "cylinder", 1, 130, 0, 0, 170 )
function Int( player ) 
if (source == IntEnter) then 
if getElementType(player) == "player" then 
fadeCamera ( player, false, 1, 0, 0, 0 ) 
setTimer ( fadeCamera, 1000, 1, player, true, 1 ) 
setTimer ( setElementPosition, 1000, 1, player, 2458.2055664063, -1975.4075927734, -52.1171875 ) -- коорды выхода в интерьер
toggleControl ( player, "fire", true ) 
end 
end 
end 
addEventHandler ("onMarkerHit", getRootElement() ,Int )