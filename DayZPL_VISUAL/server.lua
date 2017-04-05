

local badWords = {
"Мамка",
"маму",
"мамку",
"Мать",
"ебал",
"Ебал",
"пидарас",
"хуесос",
"пидор",
"Пидор",
"пидрила",
"сука",
"Сука",
"сУка",
"СУКА",
"ебанная",
"хуила",
"лох",
"пидр",
"уёбок",
"хуй",
"Хуй",
"гандон",
"отец",
"соси",
"сосал",
"ебитесь",
"Соси",
"Сосал",
"Ебитесь",
"выебок",
"Пизда",
"Залупа",
"нахуй",
"уебак",
"Уебак",
"Чёрт",
"отца",
"пизда",
"Мамку ебал",
"Мамаша",
"Мамашка",
"Мамашку",
"В кино водил",
}

function globalMessage(thePlayer, cmd, ...)
	antiChatSpam(thePlayer)
    local message = table.concat ( { ... }, " " )
	local name = getPlayerName(thePlayer)
    if isPlayerMuted ( thePlayer ) then
		outputChatBox ("#FF0000[ANTY-FLOD] #FFFFFFJesteś uciszony!", thePlayer, 255, 128, 22, true)
		return
	end
    if pregFind(message, "([0-9]{1,3})[^[:digit:]^[:cntrl:]]{1,3}([0-9]{1,3})[^[:digit:]^[:cntrl:]]{1,3}([0-9]{1,3})[^[:digit:]^[:cntrl:]]{1,3}([0-9]{1,3})") then
		outputChatBox("Reklama!", thePlayer, 255, 0, 0, true)
    	return
	end
	--[[
	for i,v in ipairs(badWords) do
	    if pregFind(message, v) then
			outputChatBox("Не матерись,не оскорбляй!", thePlayer, 255, 0, 0, true)
			setPlayerMuted(thePlayer, true)
            setTimer ( autoUnmute, 60000, 1, thePlayer)
    		return
	    end
	end
	]]
	if (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Admin"))) then
	    outputChatBox("#FFFAFA[ADMIN]#FF0000 "..name..": #ffffff"..message, getRootElement(), 255, 255, 255, true)
		outputServerLog("[ADMIN] "..getPlayerName(thePlayer)..":#ffffff  "..message)
		return
	elseif (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Moderator"))) then
	    outputChatBox("#FFFAFA[MOD-CHAT]#FF0000 "..name..": #ffffff"..message, getRootElement(), 255, 255, 255, true)
		outputServerLog("[MOD-CHAT] "..getPlayerName(thePlayer)..":#ffffff  "..message)
		return
	elseif (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Everyone"))) then
	    outputChatBox("#DF3131"..name..": #ffffff"..message, getRootElement(), 255, 255, 255, true)
        outputServerLog("[GRACZ]"..getPlayerName(thePlayer)..":#ffffff  "..message)
		return
	end
end
addCommandHandler("GC", globalMessage)

antiSpam = {} 
function antiChatSpam(source) 
    if isTimer(antiSpam[source]) then
        cancelEvent()  
        setPlayerMuted(source, true)
        setTimer ( autoUnmute, 60000, 1, source)
    else
        antiSpam[source] = setTimer(function(source) antiSpam[source] = nil end, 300, 1, source) 
    end
end

function autoUnmute ( player )
    if ( isElement ( player ) and isPlayerMuted ( player ) ) then
        setPlayerMuted ( player, false )
        outputChatBox ("#FF0000[ANTY-FLOD] #FFFFFFGracz: "..getPlayerName ( player ).." #FFFFFFzostał odciszony.",getRootElement(), 255, 0, 0,true )
    end
end



function checkForColorCodes(name)
  if string.find(name, "#%x%x%x%x%x%x") then
    cancelEvent(true, "Usuń kolor - #")
  end
end
addEventHandler("onPlayerConnect", root, checkForColorCodes)

addEventHandler ( 'onPlayerChangeNick',root, 
    function ( _,Nick )
        if string.find ( Nick,'#' ) then
            kickPlayer ( source,root,'usuń kolor z nicku! - #' )
        end
    end
)



