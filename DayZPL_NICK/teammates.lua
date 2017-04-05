function showTeam()
lp = getLocalPlayer()
    
    vehicles = getElementsByType("player")
    
    for _, team in ipairs(vehicles)do
            if getElementData(team, "gang") ~= "none" then 
            if team ~= getLocalPlayer() then
            if getElementData(team, "gang") == getElementData(lp, "gang") then
                    
        local x,y,z = getElementPosition(team)
        local cx,cy,cz = getElementPosition(getLocalPlayer())
        if getDistanceBetweenPoints3D(x,y,z, cx,cy,cz) <= 1000 then
            sX, sY, sZ = getScreenFromWorldPosition(x,y,z+1.2)
            if(sX and sY and sZ)then
                
                local color = tocolor(0,0,0)
                size = 1
                        
              --dxDrawText(getPlayerName(team), sX+27, sY-38, 25, 20, tocolor(0,0,0), size,"default-bold")
               -- dxDrawText(math.floor(getDistanceBetweenPoints3D(x,y,z, cx,cy,cz)).." m", sX+27, sY-18, 25, 20, tocolor(0,0,0), size,"default-bold")
				
               -- dxDrawText(getPlayerName(team), sX+25, sY-40, 25, 20, color, size,"default-bold")
               -- dxDrawText(math.floor(getDistanceBetweenPoints3D(x,y,z, cx,cy,cz)).." m", sX+25, sY-20, 25, 20, color, size,"default-bold")
				
				dxDrawText(getPlayerName(team),sX+1,sY-1,sX+1,sY-1,color,1,"default-bold","center","center")
				dxDrawText(getPlayerName(team),sX-1,sY+1,sX-1,sY+1,color,1,"default-bold","center","center")
				dxDrawText(getPlayerName(team),sX+1,sY+1,sX+1,sY+1,color,1,"default-bold","center","center")
				dxDrawText(getPlayerName(team),sX-1,sY-1,sX-1,sY-1,color,1,"default-bold","center","center")
				dxDrawText(getPlayerName(team),sX,sY,sX,sY,tocolor(255,255,255),1,"default-bold","center","center")

                        end
                    end
                end
            end
        end
    end
end
addEventHandler("onClientRender", getRootElement(), showTeam)
