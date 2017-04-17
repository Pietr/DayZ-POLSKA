sX, sY = guiGetScreenSize ()
loginFont = dxCreateFont ("files/font.ttf", 17)
rememberMe = true
registerWindow = false
renderedLogin = true
showCursor (false)
showChat (false)
main_sound = nil

buttonLight = 18
button2Light = 18
userLight = 175
passLight = 175
rememberLight = 18

--[[setTimer (function ()
	local username, password = loadLoginFromXML()
	if not (username ~= "" or password ~= "") then
		remember = true
		guiSetText (userEdit, tostring(username))
		guiSetText (passEdit, tostring(password))
	else
		remember = false
		guiSetText (userEdit, tostring(username))
		guiSetText (passEdit, tostring(password))
	end
	setElementData (localPlayer, "loginState", true)
end, 1000, 1)]]

function createguis()
	userEdit = guiCreateEdit (sX/2-(520/2)+100, sY/2-(380/2)+135, 370, 50, "", false)
	passEdit = guiCreateEdit (sX/2-(520/2)+100, sY/2-(380/2)+200, 370, 50, "", false)
	userEditR = guiCreateEdit (sX/2-(400/2)+70, sY/2-(290/2)+80, 300, 40, "", false)
	passEditR = guiCreateEdit (sX/2-(400/2)+70, sY/2-(290/2)+130, 300, 40, "", false)
	passConfirmEditR = guiCreateEdit (sX/2-(400/2)+70, sY/2-(290/2)+180, 300, 40, "", false)
	
	local username, password = loadLoginFromXML()
	if not (username ~= "" or password ~= "") then
		remember = true
		guiSetText (userEdit, tostring(username))
		guiSetText (passEdit, tostring(password))
	else
		remember = false
		guiSetText (userEdit, tostring(username))
		guiSetText (passEdit, tostring(password))
	end
end

texts = {
	loginTitle = "Witaj, zaloguj się",
	registerTitle = "Rejestracja",
	loginButton = "Zaloguj",
	registerButton = "Rejestr.",
	cancelButton = "Anuluj",
	rememberText = "Zapamiętaj"
}
	

function gui ()
	if registerWindow then
		guiSetVisible (userEdit, false)
		guiSetVisible (passEdit, false)
		guiSetVisible (userEditR, true)
		guiSetVisible (passEditR, true)
		guiSetVisible (passConfirmEditR, true)
	else 
		guiSetVisible (userEdit, true)
		guiSetVisible (passEdit, true)
		guiSetVisible (userEditR, false)
		guiSetVisible (passEditR, false)
		guiSetVisible (passConfirmEditR, false)
	end
end
--addEventHandler ("onClientRender", root, gui)

function renderLoginPanel ()
	username = guiGetText (userEdit)
	password = guiGetText (passEdit)

	dxDrawRectangle (sX/2-(520/2), sY/2-(380/2), 520, 380, tocolor (255, 255, 255, 50), false)
	dxDrawEmptyRec (sX/2-(520/2), sY/2-(380/2), 520, 380, tocolor (255, 255, 255, 150), 1, false)
	dxDrawRectangle (sX/2-(520/2)+20, sY/2-(380/2)+20, 480, 65, tocolor (18, 18, 18, 255), false)
	dxDrawText (texts.loginTitle, sX/2-(520/2)+45, sY/2-(380/2)+20, sX/2-(520/2)+500, sY/2-(380/2)+85, tocolor (255, 255, 255, 255), 1, loginFont, "left", "center")
	
	dxDrawRectangle (sX/2-(520/2)+20, sY/2-(380/2)+85, 480, 210, tocolor (255, 255, 255, 200), false)
	dxDrawRectangle (sX/2-(520/2)+20, sY/2-(380/2)+295, 480, 60, tocolor (255, 255, 255, 150), false)
	
	dxDrawRectangle (sX/2-(520/2)+50, sY/2-(380/2)+135, 420, 50, tocolor (userLight, userLight, userLight, 255), true)
	dxDrawEmptyRec (sX/2-(520/2)+50, sY/2-(380/2)+135, 419, 50, tocolor (102, 102, 102, 255), 1, true)
	dxDrawText (username, sX/2-(520/2)+110, sY/2-(380/2)+135, sX/2-(520/2)+470, sY/2-(380/2)+185, tocolor (18, 18, 18, 255), 1, loginFont, "left", "center", true, false, true)
	dxDrawImage (sX/2-(520/2)+50+10, sY/2-(380/2)+135+10, 30, 30, "files/username.png", 0, 0, 0, tocolor (255, 255, 255, 255), true)
	dxDrawEmptyRec (sX/2-(520/2)+50, sY/2-(380/2)+135, 50, 50, tocolor (102, 102, 102, 255), 1, true)
	
	dxDrawRectangle (sX/2-(520/2)+50, sY/2-(380/2)+200, 420, 50, tocolor (passLight, passLight, passLight, 255), true)
	dxDrawEmptyRec (sX/2-(520/2)+50, sY/2-(380/2)+200, 419, 50, tocolor (102, 102, 102, 255), 1, true)
	dxDrawText (string.gsub (password, "%C", "•"), sX/2-(520/2)+110, sY/2-(380/2)+200, sX/2-(520/2)+470, sY/2-(380/2)+250, tocolor (18, 18, 18, 255), 1, loginFont, "left", "center", true, false, true)
	dxDrawImage (sX/2-(520/2)+50+10, sY/2-(380/2)+210, 30, 30, "files/password.png", 0, 0, 0, tocolor (255, 255, 255, 255), true)
	dxDrawEmptyRec (sX/2-(520/2)+50, sY/2-(380/2)+200, 50, 50, tocolor (102, 102, 102, 255), 1, true)

	dxDrawEmptyRec (sX/2-(520/2)+20, sY/2-(380/2)+295, 479, 60, tocolor (102, 102, 102, 200), 1, false)
	dxDrawEmptyRec (sX/2-(520/2)+20, sY/2-(380/2)+85, 479, 270, tocolor (18, 18, 18, 255), 1, false)
	
	dxDrawRectangle (sX/2-(520/2)+390, sY/2-(380/2)+305, 100, 40, tocolor (buttonLight, buttonLight, buttonLight, 255), false)
	dxDrawEmptyRec (sX/2-(520/2)+390, sY/2-(380/2)+305, 99, 40, tocolor (0, 0, 0, 255), 1, false)
	dxDrawText (texts.loginButton, sX/2-(520/2)+390, sY/2-(380/2)+305, sX/2-(520/2)+490, sY/2-(380/2)+345, tocolor (255, 255, 255, 255), 1, loginFont, "center", "center")
	
	dxDrawRectangle (sX/2-(520/2)+270, sY/2-(380/2)+305, 110, 40, tocolor (button2Light, button2Light, button2Light, 255), false)
	dxDrawEmptyRec (sX/2-(520/2)+270, sY/2-(380/2)+305, 109, 40, tocolor (0, 0, 0, 255), 1, false)
	dxDrawText (texts.registerButton, sX/2-(520/2)+270, sY/2-(380/2)+305, sX/2-(520/2)+380, sY/2-(380/2)+345, tocolor (255, 255, 255, 255), 1, loginFont, "center", "center")
	
	dxDrawRectangle (sX/2-(520/2)+50, sY/2-(380/2)+315, 20, 20, tocolor (rememberLight, rememberLight, rememberLight, 255), false)
	dxDrawText (texts.rememberText, sX/2-(520/2)+210, sY/2-(380/2)+335, sX/2-(520/2)+50, sY/2-(380/2)+315, tocolor (18, 18, 18, 255), 0.6, loginFont, "center", "center")
	if rememberMe then
		dxDrawRectangle (sX/2-(520/2)+55, sY/2-(380/2)+320, 10, 10, tocolor (175, 175, 175, 255), false)
	end
end

addEventHandler("onClientResourceStart", resourceRoot, function()
	showChat ( false )
	setPlayerHudComponentVisible ( "radar", false )
	setPlayerHudComponentVisible ( "area_name", false )
	setCameraMatrix(6237, -2027, 40, 6269, -2029, 27)
	main_sound = playSound ( "files/login_track.mp3", true)
	setFlyingCamera()
end
)

function toggleRemember (button, state, absoluteX, absoluteY, wx, wy, wz, clickedElement)
	if state == "down" and renderedLogin then
		if isMouseInPosition (sX/2-(520/2)+50, sY/2-(380/2)+315, 20, 20) then
			rememberMe = not rememberMe
		end
	end
end
addEventHandler ("onClientClick", getRootElement(), toggleRemember)

function buttonClickRegister (button, state, absoluteX, absoluteY, wx, wy, wz, clickedElement)
	if state == "down" and renderedLogin and not registerWindow then
		if isMouseInPosition (sX/2-(520/2)+270, sY/2-(380/2)+305, 110, 40) then
			setTimer (function () registerWindow = true end, 1500, 1)
			addEventHandler ("onClientRender", root, renderRegisterWindow)
		end
	end
	if state == "down" and registerWindow then
		if isMouseInPosition (sX/2-(xScale/2)+260, sY/2-(yScale/2)+235, 110, 40) then
			triggerServerEvent ("registerPlayer", getLocalPlayer (), usernameR, passwordR, passwordConfirmR)
		end
	end
end
addEventHandler ("onClientClick", getRootElement(), buttonClickRegister)

function buttonLogin (button, state, absoluteX, absoluteY, wx, wy, wz, clickedElement)
	if state == "down" and renderedLogin and not registerWindow then
		if isMouseInPosition (sX/2-(520/2)+390, sY/2-(380/2)+305, 100, 40) then
			triggerServerEvent ("loginPlayer", getLocalPlayer (), username, password, remember)
		end
	end
end
addEventHandler ("onClientClick", getRootElement(), buttonLogin)

function buttonClickCancel (button, state, absoluteX, absoluteY, wx, wy, wz, clickedElement)
	if state == "down" and renderedLogin and registerWindow then
		if isMouseInPosition (sX/2-(xScale/2)+150, sY/2-(yScale/2)+235, 100, 40) then
			removeEventHandler ("onClientRender", root, renderRegisterWindow)
			xScale = 0
			yScale = 0
			registerWindow = false
		end
	end
end
addEventHandler ("onClientClick", getRootElement(), buttonClickCancel)

function closeRegister ()
	removeEventHandler ("onClientRender", root, renderRegisterWindow)
	registerWindow = false
end
addEvent("closeRegister", true)
addEventHandler("closeRegister", localPlayer, closeRegister)

function closePanel ()
	addEventHandler ("onClientRender", root, closePanel_)
	saveLoginToXML()
end
addEvent("closePanel", true)
addEventHandler("closePanel", localPlayer, closePanel)

function closePanel_ ()
	guiSetVisible (userEdit, false)
	guiSetVisible (passEdit, false)
	guiSetVisible (userEditR, false)
	guiSetVisible (passEditR, false)
	guiSetVisible (passConfirmEditR, false)
	removeEventHandler ("onClientRender", root, closePanel_)
	removeEventHandler ("onClientRender", root, renderLoginPanel)
	removeEventHandler ("onClientRender", root, renderRegisterWindow)
	removeEventHandler ("onClientRender", root, gui)
	registerWindow = false
	renderedLogin = false
	showCursor (false)
	showChat (true)
	setElementData (localPlayer, "loginState", false)
end

-- Register Window

xScale = 0
yScale = 0

userEditRLight = 125
passEditRLight = 125
passConfirmEditRLight = 125

registerRLight = 18
cancelRLight = 18

function renderRegisterWindow ()
	usernameR = guiGetText (userEditR)
	passwordR = guiGetText (passEditR)
	passwordConfirmR = guiGetText (passConfirmEditR)
	xScale = xScale + 5
	yScale = yScale + 5
	if xScale >= 400 then
		xScale = 400
	end
	if yScale >= 290 then
		yScale = 290
	end
	dxDrawRectangle (sX/2-(xScale/2), sY/2-(yScale/2), xScale, yScale, tocolor (200, 200, 200, 255), true)
	dxDrawEmptyRec (sX/2-(xScale/2), sY/2-(yScale/2), xScale-1, yScale, tocolor (255, 255, 255, 255), 1, true)
	if xScale >= 400 and yScale >= 250 then
		dxDrawRectangle (sX/2-(xScale/2)+10, sY/2-(yScale/2)+10, 380, 50, tocolor (18, 18, 18, 255), true)
		dxDrawEmptyRec (sX/2-(xScale/2)+10, sY/2-(yScale/2)+10, 379, 50, tocolor (0, 0, 0, 255), 1, true)
		dxDrawText (texts.registerTitle, sX/2-(xScale/2)+25, sY/2-(yScale/2)+10, sX/2-(xScale/2)+390, sY/2-(yScale/2)+60, tocolor (255, 255, 255, 255), 1, loginFont, "left", "center", true, false, true)
		
		dxDrawRectangle (sX/2-(xScale/2)+30, sY/2-(yScale/2)+80, 340, 40, tocolor (userEditRLight, userEditRLight, userEditRLight, 255), true)
		dxDrawEmptyRec (sX/2-(xScale/2)+30, sY/2-(yScale/2)+80, 40, 40, tocolor (102, 102, 102, 255), 1, true)
		dxDrawEmptyRec (sX/2-(xScale/2)+30, sY/2-(yScale/2)+80, 340, 40, tocolor (102, 102, 102, 255), 1, true)
		dxDrawImage (sX/2-(xScale/2)+35, sY/2-(yScale/2)+85, 30, 30, "files/username.png", 0, 0, 0, tocolor (255, 255, 255, 255), true)
		dxDrawText (usernameR, sX/2-(xScale/2)+80, sY/2-(yScale/2)+80, sX/2-(xScale/2)+370, sY/2-(yScale/2)+120, tocolor (18, 18, 18, 255), 1, loginFont, "left", "center", true, false, true)
		
		
		dxDrawRectangle (sX/2-(xScale/2)+30, sY/2-(yScale/2)+130, 340, 40, tocolor (passEditRLight, passEditRLight, passEditRLight, 255), true)
		dxDrawEmptyRec (sX/2-(xScale/2)+30, sY/2-(yScale/2)+130, 40, 40, tocolor (102, 102, 102, 255), 1, true)
		dxDrawEmptyRec (sX/2-(xScale/2)+30, sY/2-(yScale/2)+130, 340, 40, tocolor (102, 102, 102, 255), 1, true)
		dxDrawImage (sX/2-(xScale/2)+35, sY/2-(yScale/2)+135, 30, 30, "files/password.png", 0, 0, 0, tocolor (255, 255, 255, 255), true)
		dxDrawText (string.gsub (passwordR, "%C", "•"), sX/2-(xScale/2)+80, sY/2-(yScale/2)+130, sX/2-(xScale/2)+370, sY/2-(yScale/2)+170, tocolor (18, 18, 18, 255), 1, loginFont, "left", "center", true, false, true)
		
		dxDrawRectangle (sX/2-(xScale/2)+30, sY/2-(yScale/2)+180, 340, 40, tocolor (passConfirmEditRLight, passConfirmEditRLight, passConfirmEditRLight, 255), true)
		dxDrawEmptyRec (sX/2-(xScale/2)+30, sY/2-(yScale/2)+180, 40, 40, tocolor (102, 102, 102, 255), 1, true)
		dxDrawEmptyRec (sX/2-(xScale/2)+30, sY/2-(yScale/2)+180, 340, 40, tocolor (102, 102, 102, 255), 1, true)
		dxDrawImage (sX/2-(xScale/2)+35, sY/2-(yScale/2)+185, 30, 30, "files/password.png", 0, 0, 0, tocolor (255, 255, 255, 255), true)
		dxDrawText (string.gsub (passwordConfirmR, "%C", "•"), sX/2-(xScale/2)+80, sY/2-(yScale/2)+180, sX/2-(xScale/2)+370, sY/2-(yScale/2)+220, tocolor (18, 18, 18, 255), 1, loginFont, "left", "center", true, false, true)
		
		dxDrawRectangle (sX/2-(xScale/2)+260, sY/2-(yScale/2)+235, 110, 40, tocolor (registerRLight, registerRLight, registerRLight, 255), true)
		dxDrawEmptyRec (sX/2-(xScale/2)+260, sY/2-(yScale/2)+235, 109, 40, tocolor (0, 0, 0, 255), 1, false)
		dxDrawText (texts.registerButton, sX/2-(xScale/2)+260, sY/2-(yScale/2)+235, sX/2-(xScale/2)+370, sY/2-(yScale/2)+275, tocolor (255, 255, 255, 255), 1, loginFont, "center", "center", true, false, true) -- Register Text
		
		dxDrawRectangle (sX/2-(xScale/2)+150, sY/2-(yScale/2)+235, 100, 40, tocolor (cancelRLight, cancelRLight, cancelRLight, 255), true)
		dxDrawEmptyRec (sX/2-(xScale/2)+150, sY/2-(yScale/2)+235, 99, 40, tocolor (0, 0, 0, 255), 1, true)
		dxDrawText (texts.cancelButton, sX/2-(xScale/2)+150, sY/2-(yScale/2)+235, sX/2-(xScale/2)+250, sY/2-(yScale/2)+275, tocolor (255, 255, 255, 255), 1, loginFont, "center", "center", true, false, true) -- Cancel Text
	end
end


function dxDrawEmptyRec (startX, startY, endX, endY, color, width, postGUI)
	dxDrawLine (startX, startY, startX+endX, startY, color, width, postGUI)
	dxDrawLine (startX, startY, startX, startY+endY, color, width, postGUI)
	dxDrawLine (startX, startY+endY, startX+endX, startY+endY,  color, width, postGUI)
	dxDrawLine (startX+endX, startY, startX+endX, startY+endY, color, width, postGUI)
end

function isMouseInPosition (x, y, width, height)
    if (not isCursorShowing ()) then
        return false
    end
 
    local sx, sy = guiGetScreenSize ()
    local cx, cy = getCursorPosition ()
    local cx, cy = (cx * sx), (cy * sy)
    if (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height) then
        return true
    else
        return false
    end
end

setTimer (function ()
	if not registerWindow then
		if isMouseInPosition (sX/2-(520/2)+390, sY/2-(380/2)+305, 100, 40) then
			buttonLight = 50
		else
			buttonLight = 18
		end
		if isMouseInPosition (sX/2-(520/2)+270, sY/2-(380/2)+305, 110, 40) then
			button2Light = 50
		else
			button2Light = 18
		end
		if isMouseInPosition (sX/2-(520/2)+50, sY/2-(380/2)+135, 420, 50) then
			userLight = 210
		else
			userLight = 175
		end
		if isMouseInPosition (sX/2-(520/2)+50, sY/2-(380/2)+200, 420, 50) then
			passLight = 210
		else
			passLight = 175
		end
		if isMouseInPosition (sX/2-(520/2)+50, sY/2-(380/2)+315, 20, 20) then
			rememberLight = 50
		else
			rememberLight = 18
		end
	end
end, 50, 0)

setTimer (function ()
	if registerWindow then
		if isMouseInPosition (sX/2-(xScale/2)+30, sY/2-(yScale/2)+80, 340, 40) then
			userEditRLight = 175
		else
			userEditRLight = 125
		end
		if isMouseInPosition (sX/2-(xScale/2)+30, sY/2-(yScale/2)+130, 340, 40) then
			passEditRLight = 175
		else
			passEditRLight = 125
		end
		if isMouseInPosition (sX/2-(xScale/2)+30, sY/2-(yScale/2)+180, 340, 40) then
			passConfirmEditRLight = 175
		else
			passConfirmEditRLight = 125
		end
		if isMouseInPosition (sX/2-(xScale/2)+150, sY/2-(yScale/2)+235, 100, 40) then
			cancelRLight = 50
		else
			cancelRLight = 18
		end
		if isMouseInPosition (sX/2-(xScale/2)+260, sY/2-(yScale/2)+235, 110, 40) then
			registerRLight = 50
		else
			registerRLight = 18
		end
		if isMouseInPosition (sX/2-(50/2)-80, sY/2+250, 50, 50) then
			idiomLight1 = 50
		else
			idiomLight1 = 18
		end
	end
end, 50, 0)

function cNotification (nTitle, nMessage)
	if nTitle == "Login" then
		texts.loginTitle = nMessage
	elseif nTitle == "Register" then
		texts.registerTitle = nMessage
	end
end
addEvent ("cNotification",true)

function loadLoginFromXML()
	local xml_save_log_File = xmlLoadFile ("files/xml/userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("files/xml/userdata.xml", "login")
    end
    local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
    local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
    if usernameNode and passwordNode then
        return xmlNodeGetValue(usernameNode), xmlNodeGetValue(passwordNode)
    else
		return "", ""
    end
    xmlUnloadFile ( xml_save_log_File )
end
 
 
function saveLoginToXML(username, password)
    local xml_save_log_File = xmlLoadFile ("files/xml/userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("files/xml/userdata.xml", "login")
    end
	if (username ~= "") then
		local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
		if not usernameNode then
			usernameNode = xmlCreateChild(xml_save_log_File, "username")
		end
		xmlNodeSetValue (usernameNode, tostring(username))
	end
	if (password ~= "") then
		local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
		if not passwordNode then
			passwordNode = xmlCreateChild(xml_save_log_File, "password")
		end		
		xmlNodeSetValue (passwordNode, tostring(password))
	end
    xmlSaveFile(xml_save_log_File)
    xmlUnloadFile (xml_save_log_File)
end
addEvent("saveLoginToXML", true)
addEventHandler("saveLoginToXML", getRootElement(), saveLoginToXML)



function resetSaveXML()
fileDelete ("files/xml/userdata.xml")
end
addEvent("resetSaveXML", true)
addEventHandler("resetSaveXML", getRootElement(), resetSaveXML)
addEventHandler ("cNotification",getRootElement (),cNotification)

hideLoginWindow = function(accountName, pass)
  -- showLoginWindow(false)
  -- toggleSavePassword(accountName, pass)
	removeEventHandler ( "onClientRender", root, flyCamera )
	setCameraTarget(localPlayer)
	if isElement ( main_sound ) then
		stopSound ( main_sound )
	end
end

addEvent("onPlayerDoneLogin", true)
addEventHandler("onPlayerDoneLogin", getRootElement(), hideLoginWindow)