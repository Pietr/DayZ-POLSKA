-- Decompiled by Anony
--[[
function enterPlayer()
	local username = tostring(getPlayerSerial(source))
	local account = getAccount(username)
	if (account == false) then
		account = addAccount(username,"o43'6Ap4=H")
		logIn(source,account,"o43'6Ap4=H")
		triggerClientEvent(source,"hideLoginWindow",getRootElement())
		triggerEvent("onPlayerDayZRegister",getRootElement(),username,"o43'6Ap4=H",source)
		return
	end
	if not logIn(source,account,"o43'6Ap4=H") then
		setAccountPassword(account,"o43'6Ap4=H")
		logIn(source,account,"o43'6Ap4=H")
	end
	triggerClientEvent(source,"hideLoginWindow",getRootElement())
	triggerEvent("onPlayerDayZLogin",getRootElement(),username,"o43'6Ap4=H",source)
end
addEvent("onRequestEnter",true)
addEventHandler("onRequestEnter",getRootElement(),enterPlayer)
]]
local root = getRootElement()
tryToLoginPlayer = function(username, password)
local username = tostring(getPlayerSerial(source))
  local account = getAccount(username, password)
  if account then
    local accountName = getAccountName(account)
    logIn(source, account, password)
    triggerClientEvent(source, "onPlayerDoneLogin", source, accountName, password)
    triggerEvent("onPlayerDayZLogin", getRootElement(), username, pass, source)
  else
    outputChatBox("[Login]#FF9900 Wrong Passwort or Username", source, 255, 255, 255, true)
  end
end

addEvent("onClientSendLoginDataToServer", true)
addEventHandler("onClientSendLoginDataToServer", root, tryToLoginPlayer)

symbols = {
"A","b","D","G","N","f","j","T","R","e","z","Z","X","x","V","v",'B','n','m','M','l','L','g','F','y','Y','U','u','p','P'

}

function createRandomPassword (sym_num)
	local pass = ""
	for i = 1, sym_num do
		if math.random (1,2) == 1 then
			pass = pass..tostring(math.random(0,9))
		else
			pass = pass..symbols[math.random(1,#symbols)]
		end
	end
	return pass
end

function loginPlayerBySeralServer(sex)
	local pl_acc = Account.getAllBySerial(source.serial)
	local pass = createRandomPassword (10)
	if #pl_acc == 0 then
		local login_name = tostring(getPlayerSerial(source))
		while getAccount ( login_name ) do
			login_name = tostring(getPlayerSerial(source))
		end
		--outputChatBox ( 'Ваш логин: '..login_name, source)
		theAccount = addAccount(login_name, pass )
		if theAccount then
			logIn(source,theAccount, pass)
			triggerEvent("onPlayerDayZRegister", getRootElement(), login_name, pass, source,sex)
			triggerClientEvent(source, "onPlayerDoneLogin", source, login_name, pass)
			--outputChatBox ( 'Выберитесь из самолета',source,255,255,255)
		else
			reason = "Unknown Error!"
			outputChatBox("[Login]#FF9900 " .. reason, source, 255, 255, 255, true)
		end
	else
		theAccount = pl_acc[1]
		if theAccount then
			setAccountPassword ( theAccount, pass )
			logIn(source,theAccount, pass)
			--outputChatBox ( 'Ваш логин: '..getAccountName (theAccount), source)
			triggerClientEvent(source, "onPlayerDoneLogin", source, getAccountName (theAccount), pass)
			triggerEvent("onPlayerDayZLogin", getRootElement(), getAccountName ( theAccount), pass, source)
		else
			reason = "Unknown Error!"
			outputChatBox("[Login]#FF9900 " .. reason, source, 255, 255, 255, true)
		end
	end
end

addEvent("loginPlayerBySeral", true)
addEventHandler("loginPlayerBySeral", getRootElement(), loginPlayerBySeralServer)

addEventHandler("onPlayerJoin", getRootElement(), function()
	--[[local pl_acc = Account.getAllBySerial(source.serial)
	if #pl_acc == 0 then
		source:setData ( "firstTime", true )
	end--]]
	fadeCamera(source, true)
	--setCameraMatrix(source, 1468.8785400391, -919.25317382813, 100.153465271, 1468.388671875, -918.42474365234, 99.881813049316)
end
)
