

statsLabel = {}

UP = guiCreateStaticImage(0.9, 0.18, 0.07, 0.02, "greenWindowLib/up.png", true) 
RIGHTUP = guiCreateStaticImage(0.97,0.18, 0.01, 0.02, "greenWindowLib/kut-up.png", true) 
RIGHT = guiCreateStaticImage(0.97, 0.2, 0.01, 0.15, "greenWindowLib/right.png", true)
RIGHTDOWN = guiCreateStaticImage(0.97, 0.35, 0.01, 0.02, "greenWindowLib/right-down.png", true)
DOWN = guiCreateStaticImage(0.9, 0.35, 0.07, 0.02, "greenWindowLib/down.png", true)

LEFTDOWN = guiCreateStaticImage(0.89, 0.35, 0.01, 0.02, "greenWindowLib/kut-down.png", true)
LEFT = guiCreateStaticImage(0.89, 0.2, 0.01, 0.15, "greenWindowLib/left.png", true)
LEFTUP = guiCreateStaticImage(0.89, 0.18, 0.01, 0.02, "greenWindowLib/left-up.png", true)

guiSetAlpha(UP,0.8)
guiSetAlpha(RIGHTUP,0.8)
guiSetAlpha(RIGHT,0.8)
guiSetAlpha(RIGHTDOWN,0.8)
guiSetAlpha(DOWN,0.8)

guiSetAlpha(LEFTDOWN,0.8)
guiSetAlpha(LEFT,0.8)
guiSetAlpha(LEFTUP,0.8)

statsWindows = guiCreateStaticImage(0.9,0.2,0.07,0.15,"greenWindowLib/center.png",true)
guiSetAlpha(statsWindows,0.8)
--Зомби  Killed
statsLabel["zombieskilled"] = guiCreateLabel(0.02,0.05,1,0.15,"Zabitych zombie: 0",true,statsWindows)
setElementData(statsLabel["zombieskilled"],"identifikation","zombieskilled")
--Убито выживших
statsLabel["murders"] = guiCreateLabel(0.02,0.25,1,0.15,"Morderstw: 0",true,statsWindows)
setElementData(statsLabel["murders"],"identifikation","murders")
--Кровь
statsLabel["blood"] = guiCreateLabel(0.02,0.85,1,0.15,"Krew: 12000",true,statsWindows)
setElementData(statsLabel["blood"],"identifikation","blood")
--Температура
statsLabel["temperature"] = guiCreateLabel(0.02,0.65,0.73,0.15,"Temperatura: 37°C",true,statsWindows)
setElementData(statsLabel["temperature"],"identifikation","temperature")
--Карма
statsLabel["humanity"] = guiCreateLabel(0.02,0.45,1,0.15,"Ludzkość: 2500",true,statsWindows)
setElementData(statsLabel["humanity"],"identifikation","humanity")


if getElementData(localPlayer,"logedin") then
guiSetVisible(statsWindows,true)
guiSetVisible(UP,true)
guiSetVisible(RIGHTUP,true)
guiSetVisible(RIGHT,true)
guiSetVisible(RIGHTDOWN,true)
guiSetVisible(DOWN,true)

guiSetVisible(LEFTDOWN,true)
guiSetVisible(LEFT,true)
guiSetVisible(LEFTUP,true)
else
guiSetVisible(statsWindows,false)
guiSetVisible(UP,false)
guiSetVisible(RIGHTUP,false)
guiSetVisible(RIGHT,false)
guiSetVisible(RIGHTDOWN,false)
guiSetVisible(DOWN,false)

guiSetVisible(LEFTDOWN,false)
guiSetVisible(LEFT,false)
guiSetVisible(LEFTUP,false)
end






function showDebugMonitor ()
	local visible = guiGetVisible(statsWindows)
	guiSetVisible(statsWindows,not visible)
end
bindKey("F5","down",showDebugMonitor)

function showDebugMonitor1 ()
	local visible = guiGetVisible(UP)
	guiSetVisible(UP,not visible)
end
bindKey("F5","down",showDebugMonitor1)

function showDebugMonitor2 ()
	local visible = guiGetVisible(RIGHTUP)
	guiSetVisible(RIGHTUP,not visible)
end
bindKey("F5","down",showDebugMonitor2)

function showDebugMonitor3 ()
	local visible = guiGetVisible(RIGHT)
	guiSetVisible(RIGHT,not visible)
end
bindKey("F5","down",showDebugMonitor3)

function showDebugMonitor4 ()
	local visible = guiGetVisible(RIGHTDOWN)
	guiSetVisible(RIGHTDOWN,not visible)
end
bindKey("F5","down",showDebugMonitor4)

function showDebugMonitor5 ()
	local visible = guiGetVisible(DOWN)
	guiSetVisible(DOWN,not visible)
end
bindKey("F5","down",showDebugMonitor5)

function showDebugMonitor6 ()
	local visible = guiGetVisible(LEFTDOWN)
	guiSetVisible(LEFTDOWN,not visible)
end
bindKey("F5","down",showDebugMonitor6)

function showDebugMonitor7 ()
	local visible = guiGetVisible(LEFT)
	guiSetVisible(LEFT,not visible)
end
bindKey("F5","down",showDebugMonitor7)

function showDebugMonitor7 ()
	local visible = guiGetVisible(LEFTUP)
	guiSetVisible(LEFTUP,not visible)
end
bindKey("F5","down",showDebugMonitor7)

function showDebugMintorOnLogin ()
	guiSetVisible(statsWindows,true)
	guiSetVisible(UP,true)
guiSetVisible(RIGHTUP,true)
guiSetVisible(RIGHT,true)
guiSetVisible(RIGHTDOWN,true)
guiSetVisible(DOWN,true)

guiSetVisible(LEFTDOWN,true)
guiSetVisible(LEFT,true)
guiSetVisible(LEFTUP,true)
end
addEvent("onClientPlayerDayZLogin", true)
addEventHandler("onClientPlayerDayZLogin", root, showDebugMintorOnLogin)

function refreshDebugMonitor()
	if getElementData(getLocalPlayer(),"logedin") then
		local value = getElementData(getLocalPlayer(),getElementData(statsLabel["zombieskilled"],"identifikation"))
		guiSetText(statsLabel["zombieskilled"],"Zabitych zombie: "..value)
		
		
		local value = getElementData(getLocalPlayer(),getElementData(statsLabel["murders"],"identifikation"))
		guiSetText(statsLabel["murders"],"Morderstw: "..value)
		
		local value = getElementData(getLocalPlayer(),getElementData(statsLabel["blood"],"identifikation"))
		guiSetText(statsLabel["blood"],"Krew: "..value)
		
		
		local value = getElementData(getLocalPlayer(),getElementData(statsLabel["temperature"],"identifikation"))
		guiSetText(statsLabel["temperature"],"Temp: "..math.round(value,2).."°C")
		
		local value = getElementData(getLocalPlayer(),getElementData(statsLabel["humanity"],"identifikation"))
		guiSetText(statsLabel["humanity"],"Ludzkość: "..value)
		
		
	end			
end
setTimer(refreshDebugMonitor,1000,0)
