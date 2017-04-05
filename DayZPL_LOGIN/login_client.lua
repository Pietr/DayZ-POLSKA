-- By Fanbox

resourceRoot = getResourceRootElement(getThisResource())
localPlayer = getLocalPlayer()
sx, sy = guiGetScreenSize(), getThisResource()
main_sound = nil

addEventHandler("onClientResourceStart", resourceRoot, function()
	showChat ( false )
	setPlayerHudComponentVisible ( "radar", false )
	setPlayerHudComponentVisible ( "area_name", false )
	setCameraMatrix(6237, -2027, 40, 6269, -2029, 27)
	main_sound = playSound ( "login_track.mp3", true)
	if getElementData ( localPlayer, "firstTime") then
		playIntro()
	else
		setFlyingCamera()
	end
end
)
hideLoginWindow = function(accountName, pass)
  -- showLoginWindow(false)
  -- toggleSavePassword(accountName, pass)
	removeEventHandler ( "onClientRender", root, flyCamera )
	setCameraTarget(localPlayer)
end

addEvent("onPlayerDoneLogin", true)
addEventHandler("onPlayerDoneLogin", getRootElement(), hideLoginWindow)

screenWidth,screenHeight = guiGetScreenSize()
local buttArrow = dxCreateTexture ( "fanbox_play.png" )
local buttArrowDown = dxCreateTexture ( "fanbox_play_on.png" )
local helpB = dxCreateTexture ( "fanbox_help.png" )
local helpOnB = dxCreateTexture ( "fanbox_help_on.png" )
local infoB = dxCreateTexture ( "fanbox_info.png" )
local infoOnB = dxCreateTexture ( "fanbox_info_on.png" )
local newB = dxCreateTexture ( "fanbox_new.png" )
local newOnB = dxCreateTexture ( "fanbox_new_on.png" )
local mainAlpha = 0
setElementData ( root, "mainAlpha", 0)

function drawDayzLogo ()
	dxDrawImage ( screenWidth/5, screenHeight/12, 1310, 980, 'notepad.png', 0,0,0,tocolor (255,255,255,mainAlpha) )
	changeMainAlpha()
end

function changeMainAlpha ()
	if mainAlpha < 255 then
		mainAlpha = mainAlpha+5
		setElementData ( root, "mainAlpha", mainAlpha )
		if mainAlpha > 245 then
			mainAlpha = 255
		end
	end
end

function startInfoWindow ()
	showChat(false)
	--exports.imageButton:createImageButton ( 'play_button', screenWidth/2-456, screenHeight/2+178, 256, 96, 0, buttArrow, buttArrowDown, buttArrowDown )
	exports.imageButton:createImageButton ( 'play_button', screenWidth/5+175, screenHeight/12+300, 150, 69, 0, buttArrow, buttArrowDown, buttArrowDown )
	exports.imageButton:createImageButton ( 'info_button', screenWidth/5+175, screenHeight/12+400, 180, 68, 0, infoB, infoOnB, infoOnB )
	exports.imageButton:createImageButton ( 'help_button', screenWidth/5+175, screenHeight/12+500, 171, 70, 0, helpB, helpOnB, helpOnB )
	exports.imageButton:createImageButton ( 'new_button', screenWidth/5+175, screenHeight/12+600, 250, 71, 0, newB, newOnB, newOnB )
	addEventHandler ( "onClientRender", root, drawDayzLogo )
	addEvent ( "imageButtonClicked", true )
	addEventHandler ( 'imageButtonClicked', root, showWeaponSelect)
	showCursor ( true )
	showPlayerHudComponent ( 'radar', false )
end



showHelp = false
showInfo = false


function showWeaponSelect (button)
	if button.name == 'play_button' then
		playSound ( "list.mp3")
		if getElementData(localPlayer,"firstTime") and not rulesRead then
			rulesNotRead = true 
			return true
		end
		if getElementData(localPlayer,"firstTime") then
			showSexSelect ()
		else
			triggerServerEvent("loginPlayerBySeral", localPlayer)
			showCursor ( false )
			showChat(true)
			removeEventHandler ( 'imageButtonClicked', root, showWeaponSelect)
		end
		if isElement ( main_sound ) then
			stopSound ( main_sound )
		end
		exports.imagebutton:destroyImageButtonByName("play_button")
		exports.imagebutton:destroyImageButtonByName("info_button")
		exports.imagebutton:destroyImageButtonByName("help_button")
		exports.imagebutton:destroyImageButtonByName("new_button")
		removeEventHandler ( "onClientRender", root, drawDayzLogo )
		unShowRulesWindow()
		unShowHelpWindow()
	elseif button.name == 'info_button' then
		playSound ( "button.mp3")
		unShowRulesWindow ()
		if not helpWindowShowing then
			showHelpWindow()
		end
	elseif button.name == 'help_button' then
		playSound ( "button.mp3")
		unShowHelpWindow()
		if not rulesWindowShowing then
			showRulesWindow()
		end
	end
end


radAlpha = 255
fadeIn = true
fadeOut = false
rulesNotRead = false
helpWindowShowing = false
rulesRead = false

function changeRadAlpha ()
	if fadeIn then
		radAlpha = radAlpha-5
		if radAlpha < 5 then
			fadeIn = false
			fadeOut = true
		end
	end
	if fadeOut then
		radAlpha = radAlpha+5
		if radAlpha > 245 then
			radAlpha = 255
			fadeOut = false
			fadeIn = true
		end
	end
end


