addEvent("onTele", true)



addCommandHandler("tent",
function(pSource)

triggerClientEvent(pSource, "onOpened", pSource)
end )


function outputError(msg)
	outputDebugString(msg, 1)
	outputChatBox(msg, root, 255, 0, 0, true)
end

addEventHandler("onTele", root,
function(x,y,z)
	setElementPosition(source, x,y,z+4,true)
	--outputChatBox(x..y..z, source, 255, 255, 0)
end )


