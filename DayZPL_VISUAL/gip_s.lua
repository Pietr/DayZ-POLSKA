--[[
/**
	@ ��������: Give ������
	@ �������: ON/OFF_BASS
*/
]]

addEvent("onGIPGive", true)

local aclGroup -- // Minimum group in order to access give GUI.
local isConfigOkay = true -- // Checking if script works correctly.

-- // Adding required information in order to make the addon work correctly. --
addEventHandler("onResourceStart", resourceRoot,
function()
	call (getResourceFromName("DayZ"), "addAddonInfo", "GIP", "Give-an-Item Panel")
	aclGroup = get("aclMinimumGroup")
	if string.find(aclGroup, ",") then
		aclGroup = split(aclGroup, ',')
	end
	if type(aclGroup) == "string" then
		if not aclGetGroup(aclGroup) then 
			outputError("Error config meta.xml. Bad ACL Group. Resource will not work") 
			isConfigOkay = false
			return 
		end
	else
		for i, val in ipairs(aclGroup) do
			if not aclGetGroup(aclGroup[i]) then
				outputError("Error config meta.xml. Bad ACL Group. Resource will not work") 
				isConfigOkay = false
				return
			end
		end
	end
end )

-- // Handling /give command. --
addCommandHandler("give",
function(pSource)
	
	if not isConfigOkay then return end
	if type(aclGroup) == "string" then
		if not isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(pSource)), aclGetGroup(aclGroup)) then return end
		triggerClientEvent(pSource, "onGIPOpened", pSource)
	else
		for i, _ in ipairs(aclGroup) do
			if isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(pSource)), aclGetGroup(aclGroup[i])) then
				triggerClientEvent(pSource, "onGIPOpened", pSource)
				break
			end
		end
	end
end )

-- // Function to inform. --
function outputError(msg)
	outputDebugString(msg, 1)
	outputChatBox(msg, root, 255, 0, 0, true)
end

-- // Give handler. --
addEventHandler("onGIPGive", root,
function(pName, item, quantity)
	setElementData(getPlayerFromName(pName), item, quantity)
	outputChatBox("Дал "..quantity.." "..item.." игроку "..pName, source, 255, 255, 0)
	outputChatBox("Администратор выдал вам "..quantity.." "..item, getPlayerFromName(pName), 255, 255, 0)
end )