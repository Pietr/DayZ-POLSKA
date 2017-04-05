checkGateMarker = createMarker ( 1713.3000488281, -1709.1999511719, -54, "cylinder", 10, 0, 0, 0, 0 ) -- місце маркера
function onPoliceShapeHit ( thePlayer, matchingDimension )
	if ( getElementType ( thePlayer ) == "player" ) then
	end
end


function createGate ()
	gatePolice = createObject ( 2004, 1713.5999755859, -1713, -50.1,0,0,59.476440429688 ) -- де ворота мають бути 
end
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createGate )


function gateCheckingTeam ( thePlayer, matchingDimension ) 
--if getTeamName ( getPlayerTeam ( thePlayer ) ) ==''then
	moveObject ( gatePolice, 3000, 1712.0999755859, -1715.4000244141, -50.1 ) -- Де ворота мають бути коли відкриті
--end
end
addEventHandler ( "onMarkerHit", checkGateMarker, gateCheckingTeam )

function onLeave ( thePlayer, matchingDimension )
	setTimer ( movingBackPolice, 500, 1, thePlayer ) -- час закриття 
end
addEventHandler ( "onMarkerLeave", checkGateMarker, onLeave )

function movingBackPolice ()
	moveObject ( gatePolice, 2000, 1713.5999755859, -1713, -50.1) -- Де ворота будуть коли закриті
end
