------------------------------------------
-- 		 	  Server Updates	 		--
------------------------------------------
-- Developer: Braydon Davis	(xXMADEXx)	--
-- File: server.lua						--
-- Copyright 2013 (C) RoS				--
-- All rights reserved.					--
------------------------------------------
sec = {{{{{{},{},{},{}}}}}}				--
------------------------------------------

function outputRoot ( msg, chatbox )
	outputDebugString ( msg )
	outputConsole ( msg )
	outputServerLog ( msg )
	if ( chatbox ) then
		outputChatBox ( msg )
	end
	return true
end


-- Connect database.
addEventHandler ( "onResourceStart", resourceRoot, function ( )
	local saveMode_ = string.lower ( saveMode )
	if ( saveMode_ == 'mysql' ) then
		dbc = dbConnect ( 'mysql', "host="..host..";dbname="..databaseName, username, password )
	elseif ( saveMode_ == 'sqlite' ) then
		dbc = dbConnect ( "sqlite", "updates.sql" )
	else
		return outputRoot ( "Server Updates: "..saveMode.." is an invalid saving method. Valid: MySQL | SQLite - Change in settings.lua." )
	end
	
	-- Check Database
	if ( dbc ) then
		outputRoot ( "Sever Updates: "..saveMode.." has successfully connected.", false )
		dbExec ( dbc, "CREATE TABLE IF NOT EXISTS Updates ( Date_ TEXT, Name TEXT, Developer TEXT, AddedBy TEXT )" )
	else
		outputRoot ( "Sever Updates: "..saveMode.." has failed to connected.", true )
	end
	
end )

function getUpdates ( )
	return dbPoll ( dbQuery ( dbc, "SELECT * FROM Updates LIMIT 70" ), -1 ) 
end

addCommandHandler ( "fix", function ( p )
	local updates = getUpdates ( )
	triggerClientEvent ( p, 'Updates:onPanelChangeState', p, 'main', updates )
end )


addCommandHandler ( "fixpanel", function ( p )
	local isAllowed = false;
	for _, acl in ipairs ( allowedACLS ) do
		if ( isPlayerInACL ( p, acl ) ) then
			isAllowed = true
			break
		end
	end
	if ( isAllowed ) then
		local updates = getUpdates ( )
		triggerClientEvent ( p, 'Updates:onPanelChangeState', p, 'manager', updates )
	end
end )

function addUpdate ( player, date, update, author )
	local accnt = getAccountName ( getPlayerAccount ( player ) )
	dbExec ( dbc, "INSERT INTO Updates ( Date_, Name, Developer, AddedBy ) VALUES ( ?, ?, ?, ? )", date, update, author, accnt )
	outputRoot ( "Server Updates: "..getPlayerName ( player ).." added an update.", false )
--	outputChatBox ( "news", root, 255, 0, 0 )
end

function removeUpdate ( player, date, update, author )
	dbExec ( dbc, "DELETE FROM Updates WHERE Date_=? AND Name=? AND Developer=?", date, update, author )
end

addEvent ( "Updates:onServerEvent", true )
addEventHandler ( "Updates:onServerEvent", root, function ( callBack, args )
	if ( callBack == 'addUpdate' ) then
		addUpdate ( source, unpack ( args ) ) 
	elseif ( callBack == 'removeUpdate' ) then
		removeUpdate ( source, unpack ( args ) )
	end
end )

function isPlayerInACL ( player, acl )
	local account = getPlayerAccount ( player )
	if ( isGuestAccount ( account ) ) then
		return false
	end
	if ( isObjectInACLGroup ( "user."..getAccountName ( account ), aclGetGroup ( acl ) ) ) then
		return true
	else
		return false
	end
end


-- Update Checker
if ( get ( "*_AutoUpdateCheck" ) == 'true' ) then 
	function checkForUpdate ( )
		callRemote ( "http://community.mtasa.com/mta/resources.php", function ( data, d )
				if d then
					local c_ver = tostring ( getResourceInfo ( getThisResource ( ), 'version' ) )..".0"
					if ( c_ver < d ) then
						outputChatBox ( "Server Updates: Resources is out dated. Please download the new version @" )
						outputChatBox ( "http://community.mtasa.com/index.php?p=resources&s=details&id=7942!", root )
						outputChatBox ( "Your Version: "..c_ver.." || Current: "..tostring ( d ) )
					end
				end
			end,
		'version', 'serverupdates' )
	end
	checkForUpdate ( )
	setTimer ( checkForUpdate, 600*1000, 0 ) -- check ever 10 mins
end 
