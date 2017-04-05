checkGateMarker = createMarker ( 2497.8999023438, 2772.3999023438, 10.800000190735, "cylinder", 22, 0, 0, 0, 0 ) -- місце маркера
function onPoliceShapeHit ( thePlayer, matchingDimension )
	if ( getElementType ( thePlayer ) == "player" ) then
	end
end


function createGate ()
	gatePolice = createObject ( 2076, 2496.7998046875, 2773.1005859375, 9.1999998092651,0,90,0 ) -- де ворота мають бути 
end
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createGate )


function gateCheckingTeam ( thePlayer, matchingDimension ) 
--if getTeamName ( getPlayerTeam ( thePlayer ) ) ==''then
	moveObject ( gatePolice, 3000, 2496.7998046875, 2773.1005859375, -2 ) -- Де ворота мають бути коли відкриті
--end
end
addEventHandler ( "onMarkerHit", checkGateMarker, gateCheckingTeam )

function onLeave ( thePlayer, matchingDimension )
	setTimer ( movingBackPolice, 500, 1, thePlayer ) -- час закриття 
end
addEventHandler ( "onMarkerLeave", checkGateMarker, onLeave )

function movingBackPolice ()
	moveObject ( gatePolice, 2000, 2496.7998046875, 2773.1005859375, 9.1999998092651) -- Де ворота будуть коли закриті
end
