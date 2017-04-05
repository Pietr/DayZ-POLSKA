addEvent ( "okAdd", true )
addBlip = function ( x, y, z, id )
	if ( x and y and z and id ) then
		theAdd = createBlip ( x, y, z, id )
		if theAdd then
			outputChatBox ( "Pomyślnie dodano", source, 0, 255, 0, false )
			local blipS = xmlLoadFile ( "blipSave.xml" ) or xmlCreateFile ( "blipSave.xml", "blip" )
			if blipS then
				local child_ = xmlCreateChild ( blipS, "Blip" )
				xmlNodeSetAttribute ( child_, "id", id )
				xmlNodeSetAttribute ( child_, "x", x )
				xmlNodeSetAttribute ( child_, "y", y )
				xmlNodeSetAttribute ( child_, "z", z )
				xmlSaveFile ( blipS )
				xmlUnloadFile ( blipS )
			end
		else
			outputChatBox ( "Ошибка!", source, 255, 0, 0, false )
		end
	end
end
addEventHandler ( "okAdd", root, addBlip )

addEventHandler ( "onResourceStart", resourceRoot,
	function ( )
		local getSave = xmlLoadFile ( "blipSave.xml" )
		if getSave then
			for _, v in ipairs ( xmlNodeGetChildren ( getSave ) ) do
				local x = xmlNodeGetAttribute ( v, "x" )
				local y = xmlNodeGetAttribute ( v, "y" )
				local z = xmlNodeGetAttribute ( v, "z" )
				local id = xmlNodeGetAttribute ( v, "id" )
				if ( x and y and z and id ) then
					createBlip ( x, y, z, id )
					outputChatBox ( "Tworzenie blipów", source, 0, 255, 0, false )
				else
					outputChatBox ( "Wystąpił błąd podczas pobierania ikon Blip!", source, 255, 0, 0, false )
				end
			end
			xmlUnloadFile ( getSave )
		end
	end
)

addEvent ( "getGroup", true )
addEventHandler ( "getGroup", root,
	function()
		if isObjectInACLGroup ( "user.".. getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Admin" ) ) then
			triggerClientEvent ( source, "yes", source )
		end
	end
)

addCommandHandler ( "db", 
	function ( playerSource )
		if not isObjectInACLGroup ( "user.".. getAccountName ( getPlayerAccount ( playerSource ) ), aclGetGroup ( "Admin" ) ) then
			return outputChatBox ( "Nie jesteś administratorem!", playerSource, 255, 0, 0, false )
		end
		for _, b in ipairs ( getElementsByType ( "blip", resourceRoot ) ) do
			destroyElement ( b )
		end
		local getSave = xmlLoadFile ( "blipSave.xml" )
		if getSave then
			for _, v in ipairs ( xmlNodeGetChildren ( getSave ) ) do
				xmlDestroyNode ( v )
			end
			xmlSaveFile ( getSave )
			xmlUnloadFile ( getSave )
		end
		outputChatBox ( "Было все очищено!", playerSource, 0, 255, 0, false)
	end
)