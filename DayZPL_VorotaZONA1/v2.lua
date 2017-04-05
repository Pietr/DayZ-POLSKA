checkGateMarker = createMarker ( 213.80000305176, 1876.6999511719, 12, "cylinder", 12, 0, 0, 0, 0 ) -- місце маркера
function onPoliceShapeHit ( thePlayer, matchingDimension )
	if ( getElementType ( thePlayer ) == "player" ) then
	end
end


function createGate ()
	gatePolice = createObject ( 14491, 214, 1876.5, 11.89999961853,0,0,0 ) -- де ворота мають бути 
end
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createGate )


function gateCheckingTeam ( thePlayer, matchingDimension ) 
--if getTeamName ( getPlayerTeam ( thePlayer ) ) ==''then
	moveObject ( gatePolice, 3000, 214, 1876.5, 6 ) -- Де ворота мають бути коли відкриті
--end
end
addEventHandler ( "onMarkerHit", checkGateMarker, gateCheckingTeam )

function onLeave ( thePlayer, matchingDimension )
	setTimer ( movingBackPolice, 500, 1, thePlayer ) -- час закриття 
end
addEventHandler ( "onMarkerLeave", checkGateMarker, onLeave )

function movingBackPolice ()
	moveObject ( gatePolice, 2000, 214, 1876.5, 11.89999961853) -- Де ворота будуть коли закриті
end
