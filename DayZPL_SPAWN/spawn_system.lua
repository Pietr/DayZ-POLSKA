
--Кнопки
marwinButtons = {}
function createMarwinButton(x,y,widht,height,text,bool,parent,image,info)
button = guiCreateStaticImage(x,y,widht,height,image..".png", bool,parent or nil)
table.insert(marwinButtons,button)
--guiBringToFront(button)
label = guiCreateLabel(0,0,1,1,text,bool,button)
--guiBringToFront(label)
setElementData(label,"parent",button)
setElementData(button,"info",info)
setElementData(button,"image",image)
--guiSetFont(label,font[1])
guiLabelSetVerticalAlign (label, "center")
guiLabelSetHorizontalAlign (label, "center")
addEventHandler("onClientMouseEnter",label,markButton,false)
addEventHandler("onClientMouseLeave",label,unmarkButton,false)
return label
end

function markButton ()
parent = getElementData(source,"parent")
image = getElementData(parent,"image")
guiStaticImageLoadImage (parent,image..".mouse.png")
setElementData(getLocalPlayer(),"clickedButton",parent)
end

function unmarkButton (b,s)
parent = getElementData(source,"parent")
image = getElementData(parent,"image")
guiStaticImageLoadImage(parent,image..".png")
setElementData(getLocalPlayer(),"clickedButton",false)
end

local player = getLocalPlayer()
function tempos ( player )
setTimer ( dayZDeathInfo, 15000, 1 ,player )
end
addEventHandler ( "onClientPlayerWasted", getLocalPlayer(), tempos )

function dayZDeathInfo ()
fanstudio = guiCreateStaticImage(0,0,1,1,"fon.union",true)

LV = createMarwinButton(0.23,0.17,0.248,0.241,"",true,fanstudio,"LV","1")
SF = createMarwinButton(0.23,0.37,0.271,0.269,"",true,fanstudio,"SF","1")
LS = createMarwinButton(0.23,0.63,0.248,0.241,"",true,fanstudio,"LS","1")

LVT = createMarwinButton(0.5,0.17,0.250,0.246,"",true,fanstudio,"LVt","1")
SFT = createMarwinButton(0.5,0.37,0.268,0.267,"",true,fanstudio,"SFt","1")
LST = createMarwinButton(0.5,0.63,0.273,0.273,"",true,fanstudio,"LSt","1")

showCursor (true)
end

--LV
addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
function ( )       
if (source == LV) then
local player = getLocalPlayer()         
local spawnPositions = {

 {1013.4131, 2836.7227, 25.982132},
 {941.17676, 1228.7578, 8.3374691},
 {2529.4121, 647.05859, 10.820313},
 {2954.248, 1568.6279, 38.502312},
 {2915.0332, 2745.0986, 20.254463},
 {2771.2422, 2934.6406, 23.995731},
 {2176.4707, 2673.2031, 10.820313},
 {1196.0781, 699.34668, 10.484993},
 {1908.4971, 594.77148, 10.820313},
 {2346.4053, 2901.9609, 17.685976},
 {1856.209, 2921.5684, 25.572714},
 {1169.9346, 2947.7129, 32.806831},
 
}

function tamanhas( tables )
local count = 0
for a in pairs( tables ) do
count = count + 1
end
return count
end 

local andrey = math.random(tamanhas(spawnPositions))
setElementPosition (player , spawnPositions[andrey][1],spawnPositions[andrey][2],spawnPositions[andrey][3]  )   
guiSetVisible ( fanstudio, false )
showCursor ( false )
end
end)



addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
function ( )
if (source == SF) then  
local player = getLocalPlayer() 
local spawnPositions = {

 {-2921.5684, -895.4248, 1.2120445},
 --{-2928.1045, -627.45117, 2.5279684},
 --{-2928.1045, -627.45117, 2.5279684},
 --{-2934.6406, 366.0127, 2.1309969},
 {-2934.6406, 836.60156, 8.1937256},
 {-2549.0195, 1333.333, 15.398688},
 {-2130.7187, 1333.333, 7.0390625},
 {-1483.6602, 1150.3271, 7.1875},
 
}

function tamanhas( tables )
local count = 0
for a in pairs( tables ) do
count = count + 1
end
return count
end 

local andrey = math.random(tamanhas(spawnPositions))
setElementPosition (player , spawnPositions[andrey][1],spawnPositions[andrey][2],spawnPositions[andrey][3]  )   -------lv
guiSetVisible ( fanstudio, false )
showCursor ( false )
end
end)


addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
function ( )
if (source == LS) then
local player = getLocalPlayer()
local spawnPositions = {

 {1418.3008, -2751.6338, 5.0629253},
 {2026.1436, -2745.0977, 6.8362617},
 {444.44434, -1856.209, 3.4550829},
 {156.8623, -1679.7383, 14.308892},
 {2856.209, -2176.4707, 3.6380274},
 {2901.9609, -1026.1436, 11.040665},
 {2888.8887, -503.26758, 12.163357},
 {2901.9609, 13.072266, 17.725962},
 
}
function tamanhas( tables )
local count = 0
for a in pairs( tables ) do
count = count + 1
end
return count
end 
local andrey = math.random(tamanhas(spawnPositions))
setElementPosition (player , spawnPositions[andrey][1],spawnPositions[andrey][2],spawnPositions[andrey][3]  )
guiSetVisible ( fanstudio, false )
showCursor ( false )
end
end)



addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
function ( )
if (source == LVT) then
local player = getLocalPlayer()
local spawnPositions = {

 {-1732.0264, 2588.2354, 102.93871},
 {-1366.0127, 1941.1768, 50.513702},
 {-529.41211, 1758.1699, 131.96465},
 {-745.09766, 2359.4775, 124.96001},
 {-1000, 2849.6729, 80.749229},
 {-437.9082, 2267.9736, 43.469685},
 {-1875.8174, 2176.4707, 4.3972225},
 {13.072266, 758.16992, 26.552092},
 {875.81738, 869.28125, 13.351563},
 
}
function tamanhas( tables )
local count = 0
for a in pairs( tables ) do
count = count + 1
end
return count
end 
local andrey = math.random(tamanhas(spawnPositions))
setElementPosition (player , spawnPositions[andrey][1],spawnPositions[andrey][2],spawnPositions[andrey][3]  )
guiSetVisible ( fanstudio, false )
showCursor ( false )
end
end)

addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
function ( )
if (source == SFT) then
local player = getLocalPlayer()
local spawnPositions = {

 {-2732.0264, -2457.5166, 2.9113407},
 {-2248.3662, -2784.3135, 26.672558},
 {-2339.8691, -2503.2676, 30.532322},
 {-1647.0586, -1980.3926, 92.17598},
 {-1732.0264, -1745.0977, 24.926292},
 {-1333.333, -2888.8887, 56.006104},
 {-1732.0264, -1764.7061, 33.237507},
 {-2117.6465, -1241.8301, 35.897964},
 {-1745.0977, -1385.6211, 71.5728},
 {-2156.8623, -640.52246, 49.504856},
 {-1555.5557, -888.88867, 179.96295},
 {-2777.7773, -686.27441, 38.014675},
 
}

function tamanhas( tables )
local count = 0
for a in pairs( tables ) do
count = count + 1
end
return count
end 

local andrey = math.random(tamanhas(spawnPositions))
setElementPosition (player , spawnPositions[andrey][1],spawnPositions[andrey][2],spawnPositions[andrey][3]  )   -------lv
guiSetVisible ( fanstudio, false )
showCursor ( false )
end
end)

addEventHandler ( "onClientGUIClick", getResourceRootElement(getThisResource()),
function ( )
if (source == LST) then
local player = getLocalPlayer()
local spawnPositions = {

 {-366.0127, -189.54199, 58.83474},
 {111.11133, -797.38574, 28.5627},
 {869.28125, -372.54883, 37.856243},
 {1542.4834, -627.45117, 82.98101},
 {2339.8691, -862.74512, 118.14668},
 {2633.9873, -39.21582, 45.986404},
 {2542.4834, 209.15039, 50.149029},
 {2013.0723, 392.15723, 22.114731},
 {986.92773, 359.47754, 19.98313},
 {346.40527, 111.11133, 5.0019798},
 {-516.33984, 294.11719, 2.4296875},
 
}

function tamanhas( tables )
local count = 0
for a in pairs( tables ) do
count = count + 1
end
return count
end 

local andrey = math.random(tamanhas(spawnPositions))
setElementPosition (player , spawnPositions[andrey][1],spawnPositions[andrey][2],spawnPositions[andrey][3]  )   -------lv
guiSetVisible ( fanstudio, false )
showCursor ( false )
end
end)
