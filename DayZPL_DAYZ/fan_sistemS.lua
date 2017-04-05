local spawnPositions = {
	{-278.6669921875,-2882.1572265625,32.104232788086},
	{-958.5595703125,-2887.9912109375,64.82421875},
	{-1816.9375,-2748.18359375,1.7327127456665},
	{-2816.166015625,-2439.0546875,2.4004096984863},
	{-2941.5673828125,-1206.2373046875,2.7848854064941},
	{-2911.51171875,-895.22265625,2.4013109207153},
	{-2185.6669921875,2957.380859375,11.474840164185},
	{272.2265625,2928.505859375,1.3713493347168},
	{2803.943359375,595.9365234375,7.7612648010254},
	{2883.7509765625,-178.4658203125,3.2714653015137},
	{-233.46484375,-1735.8173828125,1.5520644187927},
	{-1056.8720703125,2939.068359375,42.311294555664},
}

function sexovaginal(quitType)
     if quitType == "Quit" or quitType == "Timed out" then
       local antirelogtimer = getElementData ( source, "antiRelogWork" )
       if antirelogtimer then
        local acon = getPlayerAccount(source)
         if (acon) then
         setAccountData(acon,'blood',-5)
         setAccountData ( acon, "antiRelogWork", false )
         end 
       end 
     end
end
--addEvent( "sexoatempo", true )
addEventHandler ( "onPlayerQuit", getRootElement(), sexovaginal )

unbagMarkers = {}
unbagTimers = {}

function onMarkerLeave(player)
    if source ~= unbagMarkers[player] then return end
	if isElement(player) then
		destroyElement(unbagMarkers[player])
		destroyElement(unbagTimers[player])
		killTimer(unbagTimers[player])
		unbagMarkers[player] = false
		unbagTimers[player] = false
	end
end

function unBagCommand(player)
    if isElement(player) then
	    if not unbagMarkers[player] then
		    local x,y,z = getElementPosition(player)
			setElementFrozen(player,true)
		    unbagMarkers[player] = createMarker(x,y,z-0.5,"cylinder",1.5,255,0,0,220,player)
			unbagTimers[player] = setTimer(unBagTexture,60000,1,player)
			addEventHandler("onPlayerMarkerLeave",unbagMarkers[player],onMarkerLeave)
			outputChatBox("Musisz odczekać 1 minutę",player,255,0,0)
		else
		    destroyElement(unbagMarkers[player])
		    killTimer(unbagTimers[player])
		    unbagMarkers[player] = false
		    unbagTimers[player] = false
			setElementFrozen(player,false)
			outputChatBox("Akcja została anulowana",player,255,255,255)
		end
	end
end
addCommandHandler("unbug",unBagCommand)

function unBagTexture(player)
    if isElement(player) and isElement(unbagMarkers[player]) then
	    destroyElement(unbagMarkers[player])
		killTimer(unbagTimers[player])
		unbagMarkers[player] = false
		unbagTimers[player] = false
		local number = math.random(table.size(spawnPositions))
		local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
		setElementPosition(player,x,y,z)
		outputChatBox("Pomyślnie teleportowano poza tekstury",player,255,0,0)
		setElementFrozen(player,false)
	end
end

function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end



--Пинг кик
function kickPing()
    for i, player in ipairs(getElementsByType("player")) do
	if getElementData(player,"logedin") then
        if (getPlayerPing(player) >= 500) then
            kickPlayer(player, "Ping powyżej 500")
        end
    end
	end
end
 setTimer(kickPing, 6000, 0)
 
 
 local nearbyPlayers = {} 
 addEventHandler( 'onPlayerVoiceStart', root, 
         function() 
               local chatRadius = 20 -- Дальность чата 
               local posX, posY, posZ = getElementPosition( source ) 
               local chatSphere = createColSphere( posX, posY, posZ, chatRadius ) 
               nearbyPlayers = getElementsWithinColShape( chatSphere, "player" ) 
               destroyElement( chatSphere ) 
               local empty = exports.voice:getNextEmptyChannel ( ) 
               exports.voice:setPlayerChannel(source, empty) 
                for index, player in ipairs (nearbyPlayers) do 
                       exports.voice:setPlayerChannel(player, empty) 
                end 
         end) 

 addEventHandler("onPlayerVoiceStop",root, 
         function() 
              exports.voice:setPlayerChannel(source) 
              for index, player in ipairs (nearbyPlayers) do 
                       exports.voice:setPlayerChannel(player) 
              end 
               nearbyPlayers = {} 
         end)