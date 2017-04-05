function startPlayerCrawlingAnimationS ()
	setPedAnimation ( source, animation_block, animation_name, -1, addit_opt, false, false, true )
	setElementData ( source, "liemove:crawling", true )
end

addEvent( "startPlayerCrawlingAnimation", true )
addEventHandler( "startPlayerCrawlingAnimation", getRootElement(), startPlayerCrawlingAnimationS )

function resetPlayerCrawlingAnimationS ()
	setPedAnimation ( source, false )
end
addEvent( "resetPlayerCrawlingAnimation", true )
addEventHandler( "resetPlayerCrawlingAnimation", getRootElement(), resetPlayerCrawlingAnimationS )