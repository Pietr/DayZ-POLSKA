GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Label = {}
GUIEditor_Edit = {}
GUIEditor_Image = {}

function centerWindow(center_window)
    local screenW,screenH=guiGetScreenSize()
    local windowW,windowH=guiGetSize(center_window,false)
    local x,y = (screenW-windowW)/2,(screenH-windowH)/2
    guiSetPosition(center_window,x,y,false)
end

GUIEditor_Window[1] = guiCreateWindow(600,149,191,415,"Blip ID",false)
guiSetAlpha(GUIEditor_Window[1],1)
guiWindowSetSizable(GUIEditor_Window[1],false)
GUIEditor_Image[1] = guiCreateStaticImage(16,25,26,28,"images/Blipid5.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[2] = guiCreateStaticImage(106,25,30,32,"images/Blipid6.jpg",false,GUIEditor_Window[1])
GUIEditor_Label[1] = guiCreateLabel(49,25,45,29,"5",false,GUIEditor_Window[1])
GUIEditor_Label[2] = guiCreateLabel(143,32,46,33,"6",false,GUIEditor_Window[1])
GUIEditor_Image[3] = guiCreateStaticImage(15,64,29,28,"images/Blipid7.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[4] = guiCreateStaticImage(106,63,31,33,"images/Blipid11.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[5] = guiCreateStaticImage(15,101,30,36,"images/Blipid12.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[6] = guiCreateStaticImage(106,103,30,33,"images/Blipid13.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[7] = guiCreateStaticImage(106,140,32,33,"images/Blipid15.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[8] = guiCreateStaticImage(14,143,34,31,"images/Blipid17.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[9] = guiCreateStaticImage(11,181,36,35,"images/Blipid19.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[10] = guiCreateStaticImage(103,181,38,38,"images/Blipid20.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[11] = guiCreateStaticImage(13,222,35,32,"images/Blipid21.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[12] = guiCreateStaticImage(105,224,36,33,"images/Blipid23.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[13] = guiCreateStaticImage(12,261,37,26,"images/Blipid27.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[14] = guiCreateStaticImage(106,262,34,28,"images/Blipid30.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[15] = guiCreateStaticImage(11,295,37,31,"images/Blipid58.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[16] = guiCreateStaticImage(105,297,35,31,"images/Blipid59.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[17] = guiCreateStaticImage(11,333,38,32,"images/Blipid60.jpg",false,GUIEditor_Window[1])
GUIEditor_Image[18] = guiCreateStaticImage(103,335,34,31,"images/Blipid61.jpg",false,GUIEditor_Window[1])
GUIEditor_Button[1] = guiCreateButton(9,369,174,37,"اغلاق",false,GUIEditor_Window[1])
GUIEditor_Label[3] = guiCreateLabel(141,73,46,33,"11",false,GUIEditor_Window[1])
GUIEditor_Label[4] = guiCreateLabel(138,114,43,30,"13",false,GUIEditor_Window[1])
GUIEditor_Label[5] = guiCreateLabel(141,149,43,27,"15",false,GUIEditor_Window[1])
GUIEditor_Label[6] = guiCreateLabel(145,191,38,34,"20",false,GUIEditor_Window[1])
GUIEditor_Label[7] = guiCreateLabel(148,231,42,26,"23",false,GUIEditor_Window[1])
GUIEditor_Label[8] = guiCreateLabel(141,270,37,26,"30",false,GUIEditor_Window[1])
GUIEditor_Label[9] = guiCreateLabel(144,303,33,26,"59",false,GUIEditor_Window[1])
GUIEditor_Label[10] = guiCreateLabel(141,341,30,31,"61",false,GUIEditor_Window[1])
GUIEditor_Label[11] = guiCreateLabel(51,70,34,27,"7",false,GUIEditor_Window[1])
GUIEditor_Label[12] = guiCreateLabel(51,110,29,28,"12",false,GUIEditor_Window[1])
GUIEditor_Label[13] = guiCreateLabel(52,150,26,26,"17",false,GUIEditor_Window[1])
GUIEditor_Label[14] = guiCreateLabel(51,188,31,27,"19",false,GUIEditor_Window[1])
GUIEditor_Label[15] = guiCreateLabel(55,229,31,25,"21",false,GUIEditor_Window[1])
GUIEditor_Label[16] = guiCreateLabel(55,265,27,23,"27",false,GUIEditor_Window[1])
GUIEditor_Label[17] = guiCreateLabel(51,302,29,21,"58",false,GUIEditor_Window[1])
GUIEditor_Label[18] = guiCreateLabel(52,340,25,22,"60",false,GUIEditor_Window[1])



GUIEditor_Window[2] = guiCreateWindow(355,212,240,254,"Перевел для ice4engine.ru",false)
guiSetAlpha(GUIEditor_Window[2],1)
centerWindow(GUIEditor_Window[2])
GUIEditor_Edit[1] = guiCreateEdit(9,26,197,32,"",false,GUIEditor_Window[2])
GUIEditor_Label[19] = guiCreateLabel(217,34,32,29,"[X]",false,GUIEditor_Window[2])
GUIEditor_Edit[2] = guiCreateEdit(9,105,197,32,"",false,GUIEditor_Window[2])
GUIEditor_Edit[3] = guiCreateEdit(9,66,197,32,"",false,GUIEditor_Window[2])
GUIEditor_Label[20] = guiCreateLabel(217,75,32,29,"[Y]",false,GUIEditor_Window[2])
GUIEditor_Label[21] = guiCreateLabel(217,113,32,29,"[Z]",false,GUIEditor_Window[2])
GUIEditor_Edit[4] = guiCreateEdit(10,143,63,28,"",false,GUIEditor_Window[2])
GUIEditor_Label[22] = guiCreateLabel(81,150,32,29,"ID",false,GUIEditor_Window[2])
GUIEditor_Button[2] = guiCreateButton(113,142,114,32,"Координаты!",false,GUIEditor_Window[2])
GUIEditor_Button[3] = guiCreateButton(99,179,127,33,"BLIP иконки",false,GUIEditor_Window[2])
GUIEditor_Button[4] = guiCreateButton(9,179,85,36,"Zamknij",false,GUIEditor_Window[2])
GUIEditor_Button[5] = guiCreateButton(139,215,83,33,"Создания BLIP иконки",false,GUIEditor_Window[2])
GUIEditor_Label[23] = guiCreateLabel(13,221,118,31,"Ice4engine.ru",false,GUIEditor_Window[2])
guiSetVisible(GUIEditor_Window[1], false)
guiSetVisible(GUIEditor_Window[2], false)
guiWindowSetSizable(GUIEditor_Window[1], false)
guiWindowSetSizable(GUIEditor_Window[2], false)
addEventHandler("onClientResourceStart", resourceRoot,
function()
triggerServerEvent("getGroup", getLocalPlayer())
for i,l in ipairs ( getElementsByType( "gui-label",resourceRoot ) ) do
guiSetProperty( GUIEditor_Window[1], "CaptionColour", "FF00FFFF" )
guiSetProperty( GUIEditor_Window[2], "CaptionColour", "FF00FFFF" )
guiSetProperty( GUIEditor_Button[1], "NormalTextColour", "FF00FFFF" )
guiSetProperty( GUIEditor_Button[1], "HoverTextColour", "FFFFFF00" )
guiSetProperty( GUIEditor_Button[1], "PushedTextColour", "FFFF0000" )
guiSetProperty( GUIEditor_Button[2], "NormalTextColour", "FF00FFFF" )
guiSetProperty( GUIEditor_Button[2], "HoverTextColour", "FFFFFF00" )
guiSetProperty( GUIEditor_Button[2], "PushedTextColour", "FFFF0000" )
guiSetProperty( GUIEditor_Button[3], "NormalTextColour", "FF00FFFF" )
guiSetProperty( GUIEditor_Button[3], "HoverTextColour", "FFFFFF00" )
guiSetProperty( GUIEditor_Button[3], "PushedTextColour", "FFFF0000" )
guiSetProperty( GUIEditor_Button[4], "NormalTextColour", "FF00FFFF" )
guiSetProperty( GUIEditor_Button[4], "HoverTextColour", "FFFFFF00" )
guiSetProperty( GUIEditor_Button[4], "PushedTextColour", "FFFF0000" )
guiSetProperty( GUIEditor_Button[5], "NormalTextColour", "FF00FFFF" )
guiSetProperty( GUIEditor_Button[5], "HoverTextColour", "FFFFFF00" )
guiSetProperty( GUIEditor_Button[5], "PushedTextColour", "FFFF0000" )
guiSetProperty( GUIEditor_Edit[1], "NormalTextColour", "FFFF0000" )
guiSetProperty( GUIEditor_Edit[2], "NormalTextColour", "FFFF0000" )
guiSetProperty( GUIEditor_Edit[3], "NormalTextColour", "FFFF0000" )
guiSetProperty( GUIEditor_Edit[4], "NormalTextColour", "FFFF0000" )
guiLabelSetColor( l, 0, 255, 255 )
end
end
)





addEvent("yes", true)
addEventHandler("yes", root,
function()
bindKey("F4","down",bindOpen)
end
)



bindOpen = function()
guiSetVisible(GUIEditor_Window[2], not guiGetVisible(GUIEditor_Window[2]))
showCursor(guiGetVisible(GUIEditor_Window[2]))
guiSetInputEnabled (guiGetVisible(GUIEditor_Window[2]))
end


click = function()
if (source == GUIEditor_Button[3]) then
guiSetVisible(GUIEditor_Window[1], true)
guiBringToFront( GUIEditor_Window[1] )
elseif (source == GUIEditor_Button[1]) then
guiSetVisible(GUIEditor_Window[1], false)
elseif (source == GUIEditor_Button[2]) then
local x,y,z = getElementPosition( getLocalPlayer() )
guiSetText(GUIEditor_Edit[1], x)
guiSetText(GUIEditor_Edit[2], y)   
guiSetText(GUIEditor_Edit[3], z)
elseif (source == GUIEditor_Button[4]) then
guiSetVisible(GUIEditor_Window[2], not guiGetVisible(GUIEditor_Window[2]))
showCursor(guiGetVisible(GUIEditor_Window[2]))
guiSetInputEnabled (guiGetVisible(GUIEditor_Window[2]))
elseif (source == GUIEditor_Button[5]) then
local x = guiGetText(GUIEditor_Edit[1])
local y = guiGetText(GUIEditor_Edit[2])
local z = guiGetText(GUIEditor_Edit[3])
local id = guiGetText(GUIEditor_Edit[4])
triggerServerEvent("okAdd", getLocalPlayer(),x,y,z,id)
   end
end
addEventHandler("onClientGUIClick", root, click)