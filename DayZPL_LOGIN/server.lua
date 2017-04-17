function loginPlayer (username, password, remember)
    if not (username == "") then
        if not (password == "") then
            local account = getAccount (username, password)
            if (account ~= false) then
				logIn (source, account, password)
				triggerClientEvent(source, "onPlayerDoneLogin", source, getAccountName (account), password)
				triggerEvent("onPlayerDayZLogin", getRootElement(), getAccountName ( account), password, source)
				triggerClientEvent (source, "closePanel", getRootElement ())
				triggerClientEvent (source, "cNotification", getRootElement (), "Login", "Succesfully logged in, welcome.")
				if remember == true then
					triggerClientEvent(source,"saveLoginToXML",getRootElement(),username,password)
				else
					triggerClientEvent(source,"resetSaveXML",getRootElement(),username,password)
				end
			else 
				triggerClientEvent (source, "cNotification", getRootElement (), "Login", "Zły login lub hasło")
            end
		else
			triggerClientEvent (source, "cNotification", getRootElement (), "Login", "Proszę wprowadzić hasło")
        end
	else
		triggerClientEvent (source, "cNotification", getRootElement (), "Login", "Proszę wprowadzić login")
    end
end
addEvent("loginPlayer", true)
addEventHandler("loginPlayer", getRootElement(), loginPlayer)

function registerPlayer (usernameR, passwordR, passwordConfirmR)
	local serial = getPlayerSerial (source)
	local otherAccounts = getAccountsBySerial (serial)
	if #otherAccounts <= 3 then
		if not (usernameR == "") then
			if not (passwordR == "") then
				if (passwordR == passwordConfirmR) then
					local account = getAccount (usernameR, passwordR)
					if (account == false) then
						local accountAdded = addAccount (tostring (usernameR),tostring (passwordR))
						if (accountAdded) then
							triggerClientEvent (source, "closeRegister", getRootElement ())
							triggerClientEvent (source, "cNotification", getRootElement (), "Login", "Poprawnie się zarejestrowałeś")
						else
							triggerClientEvent (source, "cNotification", getRootElement (), "Register", "Login jest zajęty")
						end
					else
						triggerClientEvent (source, "cNotification", getRootElement (), "Register", "Login jest zajęty")
					end
				else
					triggerClientEvent (source, "cNotification", getRootElement (), "Register", "Hasła nie pasują do siebie")
				end
			else
				triggerClientEvent (source, "cNotification", getRootElement (), "Register", "Wprowadź hasło")
			end
		else
			triggerClientEvent (source, "cNotification", getRootElement (), "Register", "Wprowadź login")
		end
	else
		triggerClientEvent (source, "cNotification", getRootElement (), "Register", "Osiągnąłeś limit rejestracji")
	end
end
addEvent("registerPlayer", true)
addEventHandler("registerPlayer", getRootElement(), registerPlayer)