checkGateMarker = createMarker ( 2242.6999511719, -1911.0999755859, -53.099998474121, "cylinder", 10, 0, 0, 0, 0 ) -- місце маркера
function onPoliceShapeHit ( thePlayer, matchingDimension )
	if ( getElementType ( thePlayer ) == "player" ) then
	end
end


function createGate ()
	gatePolice = createObject ( 2004, 2240, -1913.5, -50,0,0,253.49609375 ) -- де ворота мають бути 
end
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), createGate )


function gateCheckingTeam ( thePlayer, matchingDimension ) 

	moveObject ( gatePolice, 3000, 2239.1000976563, -1916.0999755859, -50 ) -- Де ворота мають бути коли відкриті

end
addEventHandler ( "onMarkerHit", checkGateMarker, gateCheckingTeam )

function onLeave ( thePlayer, matchingDimension )
	setTimer ( movingBackPolice, 500, 1, thePlayer ) -- час закриття 
end
addEventHandler ( "onMarkerLeave", checkGateMarker, onLeave )

function movingBackPolice ()
	moveObject ( gatePolice, 2000, 2240, -1913.5, -50) -- Де ворота будуть коли закриті
end


colsh=createColCuboid (2099.177734375,2172.2263183594,10.8203125, 14.8933, 14.0742, 3 )    
 function enter ( hitElement, matchingDimension )
if getElementType ( hitElement ) == "player" then
accountname = getAccountName(getPlayerAccount(hitElement))    
 elseif getElementType (hitElement) == "vehicle" then
local driver = getVehicleOccupant ( hitElement )
accountname = getAccountName(getPlayerAccount(driver))    
 end
if isObjectInACLGroup("user."..accountname, aclGetGroup("VIP")) then    
 moveObject (vhod, 1000, 2106.5, 2188.8237304688, 11)      
 end      
 end      
 addEventHandler ( "onColShapeHit", colsh, enter ) 