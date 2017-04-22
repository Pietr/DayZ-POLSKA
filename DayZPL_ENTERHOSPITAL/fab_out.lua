local IntEnter = createMarker( -2030.8234863281,2694.1159667969,59.304690551758, "cylinder", 1, 130, 0, 0, 170 )
function Int( player ) 
if (source == IntEnter) then 
if getElementType(player) == "player" then 
fadeCamera ( player, false, 1, 0, 0, 0 ) 
setTimer ( fadeCamera, 1000, 1, player, true, 1 ) 
setTimer ( setElementPosition, 1000, 1, player, -2055.6281738281,2648.0732421875,182.01374816895 ) -- коорды выхода в интерьер
toggleControl ( player, "fire", true ) 
end 
end 
end 
addEventHandler ("onMarkerHit", getRootElement() ,Int )