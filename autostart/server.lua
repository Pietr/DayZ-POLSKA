-- [[ Automatically start all resources with "addon_" in name ]] --
local l = 1
function loadAddons(res)
	for resourceKey, resourceValue in ipairs(getResources()) do
		local name = getResourceName(resourceValue)
		if string.find(name, "DayZPL_") then
			if l < 180 then
				--[[if not isObjectInACLGroup ( "resource." .. name, aclGetGroup ( "Admin" ) ) then
					aclGroupAddObject (aclGetGroup("Admin"), "resource."..name)
				 end]]
				outputServerLog(l..". "..name)
				startResource(resourceValue)
				l = l+1
			else
				l = l+1
				outputServerLog("koniec, "..l..". "..name)
			end
		end
	end
end
addEventHandler("onResourceStart", resourceRoot, loadAddons)