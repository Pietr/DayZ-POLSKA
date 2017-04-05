checkGateMarker = createMarker ( -30.700000762939, 2068.1000976563, 17.39999961853, "cylinder", 30, 0, 0, 0, 0 ) -- місце маркера
function onPoliceShapeHit ( thePlayer, matchingDimension )
	if ( getElementType ( thePlayer ) == "player" ) then
	end
end


function createGate ()
	gatePolice = createObject ( 2076, -31.700000762939, 2066.6999511719, 12.199999809265,90,0,90 ) -- де ворота мають бути 
end
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createGate )


function gateCheckingTeam ( thePlayer, matchingDimension ) 
--if getTeamName ( getPlayerTeam ( thePlayer ) ) ==''then
	moveObject ( gatePolice, 3000, -31.700000762939, 2066.6999511719, 5.1999998092651 ) -- Де ворота мають бути коли відкриті
--end
end
addEventHandler ( "onMarkerHit", checkGateMarker, gateCheckingTeam )

function onLeave ( thePlayer, matchingDimension )
	setTimer ( movingBackPolice, 500, 1, thePlayer ) -- час закриття 
end
addEventHandler ( "onMarkerLeave", checkGateMarker, onLeave )

function movingBackPolice ()
	moveObject ( gatePolice, 2000, -31.700000762939, 2066.6999511719, 12.199999809265) -- Де ворота будуть коли закриті
end
