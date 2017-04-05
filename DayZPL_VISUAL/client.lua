


local screenWidth,screenHeight = guiGetScreenSize()


function gui ()
local screenWidth,screenHeight = guiGetScreenSize()
Panel = guiCreateStaticImage(0.9,0.4,0.07,0.07,"greenWindowLib/center.png",true)

UP1 = guiCreateStaticImage(0.91, 0.38, 0.05, 0.02, "greenWindowLib/up.png", true) 
RIGHTUP1 = guiCreateStaticImage(0.96,0.38, 0.01, 0.02, "greenWindowLib/kut-up.png", true) 
RIGHTDOWN1 = guiCreateStaticImage(0.96, 0.47, 0.01, 0.02, "greenWindowLib/right-down.png", true)
DOWN1 = guiCreateStaticImage(0.91, 0.47, 0.05, 0.02, "greenWindowLib/down.png", true)
LEFTDOWN1 = guiCreateStaticImage(0.90, 0.47, 0.01, 0.02, "greenWindowLib/kut-down.png", true)
LEFTUP1 = guiCreateStaticImage(0.90, 0.38, 0.01, 0.02, "greenWindowLib/left-up.png", true)


guiSetAlpha(Panel,0.8)

guiSetAlpha(UP1,0.8)
guiSetAlpha(RIGHTUP1,0.8)
guiSetAlpha(RIGHTDOWN1,0.8)
guiSetAlpha(DOWN1,0.8)
guiSetAlpha(LEFTDOWN1,0.8)
guiSetAlpha(LEFTUP1,0.8)

guiSetVisible(UP1,false)
guiSetVisible(RIGHTUP1,false)
guiSetVisible(RIGHTDOWN1,false)
guiSetVisible(DOWN1,false)
guiSetVisible(LEFTDOWN1,false)
guiSetVisible(LEFTUP1,false)

icons = guiCreateCheckBox(10, 30, 60, 18, "IKONY", true, false, Panel)
addEventHandler ("onClientGUIClick",icons, HandleTheRendering ,false)

chat = guiCreateCheckBox(75, 30, 60, 18, "CHAT", true, false, Panel)
addEventHandler ("onClientGUIClick",chat, showchats ,false)

guiSetVisible (Panel,false)


end
addEventHandler ("onClientResourceStart", resourceRoot, gui)



function cursor ()
			guiSetVisible(Panel,not guiGetVisible (Panel))
			
			guiSetVisible(UP1,not guiGetVisible(UP1))
			guiSetVisible(RIGHTUP1,not guiGetVisible(RIGHTUP1))
			guiSetVisible(DOWN1,not guiGetVisible(DOWN1))
			guiSetVisible(RIGHTDOWN1,not guiGetVisible(RIGHTDOWN1))
			guiSetVisible(LEFTDOWN1,not guiGetVisible(LEFTDOWN1))	
			guiSetVisible(LEFTUP1,not guiGetVisible(LEFTUP1))	
			
			showCursor(not isCursorShowing())
			
end
bindKey ("F3", "down", cursor)



local isChatVisible = true 
function showchats()
    if isChatVisible then 
        showChat(false)
        isChatVisible = false
    else
        showChat(true)
        isChatVisible = true
    end
end
addEventHandler("onClientGUIClick", getRootElement(), showchats, false)

--Иконки
function HandleTheRendering ( )
 if render then
    removeEventHandler ( "onClientRender", root, renderStats )
    render = false
 else
   addEventHandler ( "onClientRender", root, renderStats )
   render = true
 end
end
addEventHandler ( "onClientResourceStart", resourceRoot, HandleTheRendering )  

-------------------------------------------------------------
fading = 0
fading2 = "up"
fadingA = 0
fading2A = "up"
function renderStats()
	if getElementData(getLocalPlayer(),"logedin") then
	if fading >= 0 and fading2 == "up" then
      fading = fading + 5
    elseif fading <= 255 and fading2 == "down" then
      fading = fading - 5
    end
    if fading == 0 then
      fading2 = "up"
    elseif fading == 255 then
      fading2 = "down"
    end



	if fadingA >= 0 and fading2A == "up" then
      fadingA = fadingA + 2
    elseif fadingA <= 255 and fading2A == "down" then
      fadingA = fadingA - 2
    end
    if fadingA == 0 then
      fading2A = "up"
    elseif fadingA == 255 then
      fading2A = "down"
    end
	
    if getElementData(getLocalPlayer(), "brokenbone", true) then
    dxDrawImage(screenWidth * 0.83, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/brokenbone.png", 0, 0, 0, tocolor(255, 255, 255,255))
    end

	------------------------------- TEMPERATURA -------------------------------
	 dxDrawImage(screenWidth * 0.8598, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/temperature/frame.png", 0, 0, 0, tocolor(255, 255, 255, 200))
	 

  
    if getElementData(getLocalPlayer(), "temperature") <=35 then
	elementtemp2 = dxDrawImage(screenWidth * 0.86, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/temperature/34.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end
  
    if getElementData(getLocalPlayer(), "temperature") >= 35 and getElementData(getLocalPlayer(), "temperature") <=36 then
	elementtemp2 = dxDrawImage(screenWidth * 0.86, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/temperature/35.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

    if getElementData(getLocalPlayer(), "temperature") >= 36 and getElementData(getLocalPlayer(), "temperature") <=37 then
	elementtemp4 = dxDrawImage(screenWidth * 0.86, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/temperature/36.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

    if getElementData(getLocalPlayer(), "temperature") >= 37 and getElementData(getLocalPlayer(), "temperature") <=38 then
	elementtemp = dxDrawImage(screenWidth * 0.86, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/temperature/37.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

    if getElementData(getLocalPlayer(), "temperature") >= 38 then
	elementtemp = dxDrawImage(screenWidth * 0.86, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/temperature/38.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end
	
	if getElementData(getLocalPlayer(), "grip") == 1 then
	elementtemp5 = dxDrawImage(screenWidth * 0.8598, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/temperature/grip.png", 0, 0, 0, tocolor(255, 255, 255, fadingA))
    end
	
	if getElementData(getLocalPlayer(), "cold", true) then
	elementtemp5 = dxDrawImage(screenWidth * 0.8598, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/temperature/infection.png", 0, 0, 0, tocolor(255, 255, 255, fadingA))
    end
    ------------------------------- SEDE -------------------------------

	 dxDrawImage(screenWidth *  0.92, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/drink/frame.png", 0, 0, 0, tocolor(255, 255, 255, 200))
   
   	if getElementData(getLocalPlayer(), "thirst") >= 10 and getElementData(getLocalPlayer(), "thirst") <= 20 then
	elementdrink = dxDrawImage(screenWidth * 0.92, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/drink/15.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "thirst") >= 20 and getElementData(getLocalPlayer(), "thirst") <= 40 then
	elementdrink = dxDrawImage(screenWidth * 0.92, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/drink/40.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "thirst") >= 40 and getElementData(getLocalPlayer(), "thirst") <= 60 then
	elementdrink4 = dxDrawImage(screenWidth * 0.92, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/drink/60.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "thirst") >= 60 and getElementData(getLocalPlayer(), "thirst") <= 80 then
	elementdrink2 = dxDrawImage(screenWidth * 0.92, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/drink/80.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "thirst") >= 80 then
	elementdrink1 = dxDrawImage(screenWidth * 0.92, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/drink/100.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

    ------------------------------- BLOOD -------------------------------

      dxDrawImage(screenWidth * 0.8896, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/blood/0.png", 0, 0, 0, tocolor(255, 255, 255, 200))

	if getElementData(getLocalPlayer(), "blood") >= 8000 and getElementData(getLocalPlayer(), "blood") <= 12000 then
	elementblood1 = dxDrawImage(screenWidth * 0.89, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/100.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "blood") >= 6000 and getElementData(getLocalPlayer(), "blood") <= 8000 then
    elementblood2 = dxDrawImage(screenWidth * 0.89, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/80.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "blood") >= 4000 and getElementData(getLocalPlayer(), "blood") <= 6000 then
	elementblood3 = dxDrawImage(screenWidth * 0.89, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/50.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "blood") >= 2000 and getElementData(getLocalPlayer(), "blood") <= 4000 then
	elementblood4 = dxDrawImage(screenWidth * 0.89, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/30.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "blood") >= 1000 and getElementData(getLocalPlayer(), "blood") <= 2000 then
	elementblood = dxDrawImage(screenWidth * 0.89, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/10.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "blood") <= 1000 then
	elementblood1 = dxDrawImage(screenWidth * 0.89, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/blood/10.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end


    ------------------------------- FOME -------------------------------
        dxDrawImage(screenWidth * 0.95, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/eat/frame.png", 0, 0, 0, tocolor(255, 255, 255, 200))

	if getElementData(getLocalPlayer(), "food") >= 10 and getElementData(getLocalPlayer(), "food") < 20 then
	elementfood1 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/eat/10.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "food") >= 20 and getElementData(getLocalPlayer(), "food") < 40 then
	elementfood2 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/eat/25.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "food") >= 40 and getElementData(getLocalPlayer(), "food") < 60 then
	elementfood2 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/eat/50.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "food") >= 60 and getElementData(getLocalPlayer(), "food") < 80 then
	elementfood4 = dxDrawImage(screenWidth * 0.95, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/eat/70.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end

	if getElementData(getLocalPlayer(), "food") >= 80 then
	elementfood = dxDrawImage(screenWidth * 0.95, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/eat/100.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end
	------------------------------- SICK -------------------------------

	if getElementData(getLocalPlayer(), "sick") == 60 then
	elementfood = dxDrawImage(screenWidth * 0.95, screenHeight * 0.87, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/sick.png", 0, 0, 0, tocolor(255, 255, 255, 200))
    end
	if getElementData(getLocalPlayer(), "sick") == 60 then
	dxDrawImage(screenWidth * 0.95, screenHeight * 0.87, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/sick2.png", 0, 0, 0, tocolor(255, 255, 255,fading))
    end
	------------------------------- INFECTION_ZOM -------------------------------
	if getElementData(getLocalPlayer(), "infection_zom") == 1 then
	dxDrawImage(screenWidth * 0.8896, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/infection1.png", 0, 0, 0, tocolor(255, 255, 255,fadingA))
    end
	if getElementData(getLocalPlayer(), "infection_zom") == 2 then
	dxDrawImage(screenWidth * 0.8896, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/infection2.png", 0, 0, 0, tocolor(255, 255, 255,fading))
    end
	if getElementData(getLocalPlayer(), "infection_zom") == 3 then
	dxDrawImage(screenWidth * 0.8896, screenHeight * 0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/infection3.png", 0, 0, 0, tocolor(255, 255, 255,fading))
    end
------------------------------------------------------------------- 
    if 0 < getElementData(getLocalPlayer(), "bleeding") then
	dxDrawImage(screenWidth * 0.883, screenHeight *  0.893, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/blood/medic.png", 0, 0, 0, tocolor(255, 255, 255,fading))
    end
	
	dxDrawRectangle(screenWidth * 0.05, screenHeight *  0.945, screenHeight * 0.2, screenHeight * 0.006, tocolor(255, 255, 255, 100), false)
	dxDrawRectangle(screenWidth * 0.05, screenHeight *  0.945, (getElementData(localPlayer,"sleep")) / 400 * screenHeight * 0.2, screenHeight * 0.005, tocolor(255, 255, 255, 200), false)
	
	dxDrawImage(screenWidth * 0.02, screenHeight * 0.923, screenHeight * 0.056, screenHeight * 0.056, "images/armaDayZicons/run/run.png", 0, 0, 0, tocolor(255, 255, 255,200))
    local run = getElementData(getLocalPlayer(), "volume") / 20
    if run > 1 then
      dxDrawImage(screenWidth * 0.007, screenHeight *  0.923, screenHeight * 0.055, screenHeight * 0.055, "images/armaDayZicons/run/level_" .. run .. ".png", 0, 0, 0, tocolor(255, 255, 255,200))
    end
	
	end
	end

local ping = getPlayerPing(getLocalPlayer())
local x, y = guiGetScreenSize ( )

r,g,b=0,0,0
alpha=150


local root = getRootElement()
local counter = 0
local fps = 0
local starttick
local currenttick
addEventHandler("onClientRender",root,
	function()
		if not starttick then
			starttick = getTickCount()
		end
		counter = counter + 1
		currenttick = getTickCount()
		if currenttick - starttick >= 1000 then
		fps=counter
		setElementData(getLocalPlayer(),"FPS",fps)
			counter = 0
			starttick = false
		end
		local Text = "FPS:"..fps.." | PING:"..getPlayerPing(getLocalPlayer())
		
		local floatText = dxGetTextWidth ( Text )
		dxDrawText ( Text, x-floatText, 1, 100, 100, tocolor ( 255, 255, 255, 255 ), 0.9, "default","right" )
	end
)

function setPINGFPS()
setElementData(getLocalPlayer(),"FPS",fps)
end
setTimer(setPINGFPS,1000,0)

