localPlayer = getLocalPlayer ()
ambisound = nil

soundnum = {}
soundnum["night"] = 12 -- количество звуков ночи
soundnum["day"] = 49 -- количество звуков дня

mintime = 15 -- минимальный промежуток времени в скундах между звуками
maxtime = 30 -- максимальный промежуток времени в секундах между звуками

function playAmbiSound()
	if (getElementData (localPlayer, "hideTable") or {}).surround then return true end
	local hour, minutes = getTime()
	local daytime = "night"
	if hour > 5 and hour < 21 then
		daytime = "day"
	end
	ambisound = playSound (daytime.."/"..math.random(1,soundnum[daytime])..".wav")
	setSoundVolume(ambisound, 0.3)
end

playAmbiSound ()

addEventHandler ( "onClientResourceStart",  getResourceRootElement(getThisResource()), 
	function ()
		setTimer ( playAmbiSound, math.random(mintime,maxtime)*1000, 0 )
	end)
	
addEventHandler("onClientExplosion", getRootElement(), function(x,y,z, theType)
	if(explosionEnabled)then
		if(theType == 0)then--Grenade
			local explSound = playSound3D("explosion1.wav", x,y,z)
			setSoundMaxDistance(explSound, 150)
		elseif(theType == 4 or theType == 5 or theType == 6 or theType == 7)then 
			local explSound = playSound3D("explosion3.wav", x,y,z)
			setSoundMaxDistance(explSound, 150)
		end
	end
end)