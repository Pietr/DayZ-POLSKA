checkGateMarker = createMarker ( 2539.6999511719, 2821.6999511719, 8.6000003814697, "cylinder", 5, 0, 0, 0, 0 ) -- місце маркера
function onPoliceShapeHit ( thePlayer, matchingDimension )
	if ( getElementType ( thePlayer ) == "player" ) then
	end
end


function createGate ()
	gatePolice = createObject ( 3095, 2539.3000488281, 2822.6999511719, 9.8000001907349,0,90.499877929688,0 ) -- де ворота мають бути 
end
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createGate )


function gateCheckingTeam ( thePlayer, matchingDimension ) 
--if getTeamName ( getPlayerTeam ( thePlayer ) ) ==''then
	moveObject ( gatePolice, 3000, 2539.3000488281, 2816, 9.8000001907349 ) -- Де ворота мають бути коли відкриті
--end
end
addEventHandler ( "onMarkerHit", checkGateMarker, gateCheckingTeam )

function onLeave ( thePlayer, matchingDimension )
	setTimer ( movingBackPolice, 500, 1, thePlayer ) -- час закриття 
end
addEventHandler ( "onMarkerLeave", checkGateMarker, onLeave )

function movingBackPolice ()
	moveObject ( gatePolice, 2000, 2539.3000488281, 2822.6999511719, 9.8000001907349) -- Де ворота будуть коли закриті
end
