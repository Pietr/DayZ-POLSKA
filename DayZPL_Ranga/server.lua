local allowedAdmins={
	["A80157878519CE6B328D3CA9B7609B12"]=true,--Мой сериал
	["E82E605B8538056F2F9F04406E950843"]=true,
}

addCommandHandler("ranga",function(pl)
	if allowedAdmins[getPlayerSerial(pl)]==true then
		local tab={}
		local groups=aclGroupList()
		for i,v in ipairs(groups) do
			table.insert(tab,aclGroupGetName(v))
		end
		triggerClientEvent(pl,"showPermPanel",pl,tab)
	end
end)

addEvent("setPermissionsForAcc",true)
addEventHandler("setPermissionsForAcc",getRootElement(),function(serial,group,days)
	if allowedAdmins[getPlayerSerial(client)]==true then
		local ticks=getTickCount()
		local acc=getAccount(serial)
		if not acc then outputChatBox("Nie można znaleźć tego konta!",client,255,0,0) return end
		aclGroupAddObject(aclGetGroup(group),"user."..serial)
		local lostperm=getAccountData(acc,"lostperm")or false
		if lostperm then
			lostperm=fromJSON(lostperm)
		else
			lostperm={}
		end
		lostperm[group]=ticks+days*86400000
		setAccountData(acc,"lostperm",toJSON(lostperm))
		outputChatBox("Nadałeś uprawnienia na określony czas!",client,0,255,0)
	end
end)

addEventHandler("onPlayerLogin",getRootElement(),function()
	local acc=getPlayerAccount(source)
	local ticks=getTickCount()
	local lostperm=getAccountData(acc,"lostperm")or false
	if lostperm then
		local nlp={}
		lostperm=fromJSON(lostperm)
		for i,data in pairs(lostperm) do
			if data<=ticks then
				aclGroupRemoveObject(aclGetGroup(group),"user"..getAccountName(acc))
			else
				nlp[i]=data
			end
		end
		lostperm=nil
		setAccountData(acc,"lostperm",toJSON(nlp))
	end
end)