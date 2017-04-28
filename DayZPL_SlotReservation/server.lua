----Locals---- 
local maxplayers = 80
local resonline = 0
-------------------------------   
  
----Functions--- 
function credits(pp) 
	local PlayerSerial = getPlayerSerial(source)
	local gtc = getPlayerCount() 
    if gtc == maxplayers+resonline+1 then 
	 if PlayerSerial == "A80157878519CE6B328D3CA9B7609B12" or PlayerSerial == "E82E605B8538056F2F9F04406E950843" or PlayerSerial == "1FFF705136AF698B22888A6BF243C971" or PlayerSerial == "5A37CE7FF08B70A079784DE25D2A5634" or PlayerSerial == "2EBDDE992278BC720029E3B74C210DF4" or PlayerSerial == "32745CDBDE44640B8CCAB1EE60A703E2" or PlayerSerial == "EB6681874B31366DE92AA64D420790E2" or PlayerSerial == "26A60E666DF6987295B4700E509F6D52" then 
			outputChatBox( "Dołączyłeś na zarezerwowanym slocie", source, 55, 125, 255 ) 
			resonline = resonline+1
        else 
			kickPlayer(source, "Niestety, ale reszta slotów jest zarezerwowana! Limit:"..maxplayers+resonline )
		end 
	end 
end 
addEventHandler("onPlayerJoin", root, credits) 
  
function ClearPlayerLeaving()
	local PlayerSerial = getPlayerSerial(source)
	 if PlayerSerial == "A80157878519CE6B328D3CA9B7609B12" or PlayerSerial == "E82E605B8538056F2F9F04406E950843" or PlayerSerial == "1FFF705136AF698B22888A6BF243C971" or PlayerSerial == "5A37CE7FF08B70A079784DE25D2A5634" or PlayerSerial == "2EBDDE992278BC720029E3B74C210DF4" or PlayerSerial == "32745CDBDE44640B8CCAB1EE60A703E2" or PlayerSerial == "EB6681874B31366DE92AA64D420790E2" or PlayerSerial == "26A60E666DF6987295B4700E509F6D52" then 
		resonline = resonline-1
		if resonline < 0 then resonline = 0 end
	end
end 
addEventHandler ( "onPlayerQuit", root, ClearPlayerLeaving ) 

function setslot(player, commandName, amount)
	--if not (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(source)), aclGetGroup("Admin"))) then return end
	if not amount then
		outputConsole ( "Syntax: res <max_slot>" )
		return
	end
	maxplayers = amount
	outputChatBox( "Limit slotów: "..maxplayers, source, 55, 125, 255 ) 
	outputChatBox( "Zajęte zarezerwowane: "..resonline, source, 55, 125, 255 ) 	
	outputChatBox( "Online: "..getPlayerCount().."/"..maxplayers+resonline, source, 55, 125, 255 ) 
end
addCommandHandler("setslot", setslot)

function getslot()
	--if not (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(source)), aclGetGroup("Admin"))) then return end
	outputChatBox( "Limit slotów: "..maxplayers, source, 55, 125, 255 ) 
	outputChatBox( "Zajęte zarezerwowane: "..resonline, source, 55, 125, 255 ) 	
	outputChatBox( "Online: "..getPlayerCount() .."/"..maxplayers+resonline, source, 55, 125, 255 ) 
end
addCommandHandler("getslot", getslot)