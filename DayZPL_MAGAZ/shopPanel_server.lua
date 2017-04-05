setElementData(root, "moneyRPMagin", 0)
marker1 = createMarker(2599.5,2809.8000488281,9.8999996185303, "cylinder", 2,  0, 255, 0, 0 )    
marker2 = createMarker(-6529.7998046875,-120.599609375,4.0999999046326, "cylinder", 2,  0, 255, 0, 0 )  
--marker2 = createMarker(-2515, -637, 118, "cylinder", 2,  0, 255, 0, 0 )     
--marker3 = createMarker(2576.1342773438, 2788.0002441406,10, "cylinder", 2,  0, 255, 0, 0 )     
------------- OPen
function AbrirJanela1(hitPlayer)
	triggerClientEvent (hitPlayer,"openWindow",getRootElement(),hitPlayer)
end
addEventHandler("onMarkerHit",marker1,AbrirJanela1)

function AbrirJanela2(hitPlayer)
	triggerClientEvent (hitPlayer,"openWindow",getRootElement(),hitPlayer)
end
addEventHandler("onMarkerHit",marker2,AbrirJanela2)
--[[
function AbrirJanela3(hitPlayer)
	triggerClientEvent (hitPlayer,"openWindow",getRootElement(),hitPlayer)
end
addEventHandler("onMarkerHit",marker3,AbrirJanela3)
]]