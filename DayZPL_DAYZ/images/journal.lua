

JournalTable = {
	window = {},
	image = {},
    label = {},
	memo = {},
	button = {},
}

local font = {}
local isJournalOpen = false
local isWriting = false
font[1] = guiCreateFont("images/needhelp.ttf",35)
font[2] = guiCreateFont("images/needhelp.ttf",30)

function showJournal()
	if getElementData(localPlayer,"logedin") then
		if not isJournalOpen then
			isJournalOpen = true
			showCursor(true)
			playSound("images/journal.wav",false)
			guiSetVisible(JournalTable.image[1],true)
			guiSetText(JournalTable.label[1],"Живу уже "..getElementData(localPlayer,"alivetime").."м")
			addEventHandler("onClientMouseEnter",JournalTable.label[5],writeSelected,false)
			addEventHandler("onClientMouseLeave",JournalTable.label[5],writeDeselected,false)
			addEventHandler("onClientGUIClick",JournalTable.label[5],openWriteJournal,false)
			addEventHandler("onClientGUIClick",JournalTable.button[1],writeIntoJournal,false)
			addEventHandler("onClientGUIClick",JournalTable.button[2],closeWriteJournal,false)
		else
			isJournalOpen = false
			showCursor(false)
			guiSetVisible(JournalTable.image[1],false)
			removeEventHandler("onClientMouseEnter",JournalTable.label[5],writeSelected)
			removeEventHandler("onClientMouseLeave",JournalTable.label[5],writeDeselected)
			removeEventHandler("onClientGUIClick",JournalTable.label[5],openWriteJournal)
			removeEventHandler("onClientGUIClick",JournalTable.button[1],writeIntoJournal)
			removeEventHandler("onClientGUIClick",JournalTable.button[2],closeWriteJournal)
		end
	end
end
addCommandHandler("fanbox",showJournal)
bindKey("o","down","fanbox")

function writeSelected()
	guiLabelSetColor(JournalTable.label[5],255,0,0)
end

function writeDeselected (b,s)
	guiLabelSetColor(JournalTable.label[5],0,0,0)
end
function initJournal()
	JournalTable.image[1] = guiCreateStaticImage(0.10, 0.06, 0.80, 0.90, "images/journal_page1.png", true)
	JournalTable.label[1] = guiCreateLabel(0.09, 0.09, 0.40, 0.06, "Живу уже 0м", true, JournalTable.image[1])
	guiLabelSetColor(JournalTable.label[1], 0, 0, 0)
	guiLabelSetHorizontalAlign(JournalTable.label[1], "left", true)
	guiSetFont(JournalTable.label[1],font[1])
	JournalTable.label[2] = guiCreateLabel(0.09, 0.15, 0.40, 0.06, "Живу в ЮНИОН", true, JournalTable.image[1])
	guiLabelSetColor(JournalTable.label[2], 0, 0, 0)
	guiLabelSetHorizontalAlign(JournalTable.label[2], "left", true)
	guiSetFont(JournalTable.label[2],font[1])

	JournalTable.label[3] = guiCreateLabel(0.09, 0.27, 0.40, 0.64,"", true, JournalTable.image[1])
	guiLabelSetColor(JournalTable.label[3], 0, 0, 0)
	guiLabelSetHorizontalAlign(JournalTable.label[3], "left", true)
	guiSetFont(JournalTable.label[3],font[2])

	JournalTable.label[4] = guiCreateLabel(0.51, 0.11, 0.39, 0.82, "", true, JournalTable.image[1])
	guiLabelSetColor(JournalTable.label[4],0,0,0)
	guiLabelSetHorizontalAlign(JournalTable.label[4], "left", true)
	guiSetFont(JournalTable.label[4],font[2])

	JournalTable.label[5] = guiCreateLabel(0.51, 0.89, 0.21, 0.05, "Написать в журнал", true, JournalTable.image[1])
	guiLabelSetColor(JournalTable.label[5],0,0,0)
	guiLabelSetHorizontalAlign(JournalTable.label[5], "left", true)
	guiSetFont(JournalTable.label[5],font[2])
	
	JournalTable.window[1] = guiCreateWindow(0.24, 0.14, 0.52, 0.80, "Написать в журнал", true)
	guiWindowSetMovable(JournalTable.window[1], false)
	guiWindowSetSizable(JournalTable.window[1], false)

	JournalTable.memo[1] = guiCreateMemo(0.03, 0.17, 0.95, 0.59, "", true, JournalTable.window[1])
	JournalTable.label[6] = guiCreateLabel(0.04, 0.10, 0.91, 0.08, "Запись в журнале: Только на Русском!", true, JournalTable.window[1])
	guiLabelSetVerticalAlign(JournalTable.label[1], "center")
	JournalTable.button[1] = guiCreateButton(0.17, 0.92, 0.19, 0.06, "Сохранить", true, JournalTable.window[1])
	JournalTable.button[2] = guiCreateButton(0.63, 0.92, 0.19, 0.06, "Отмена", true, JournalTable.window[1])    
	
	guiSetVisible(JournalTable.image[1],false)
	guiSetVisible(JournalTable.window[1],false)
	
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),initJournal)

function openWriteJournal(button, state)
	if not isWriting then
		if button == "left" and state == "up" then
			guiSetVisible(JournalTable.window[1],true)
			guiBringToFront(JournalTable.window[1])
			isWriting = true
			guiSetVisible(JournalTable.image[1],false)
			guiSetInputEnabled(true)
		end
	else
		outputDebugString("Error")
	end
end

function closeWriteJournal()
	guiSetVisible(JournalTable.window[1],false) 
	showCursor(false) 
	isWriting = false
	isJournalOpen = false
	removeEventHandler("onClientMouseEnter",JournalTable.label[5],writeSelected)
	removeEventHandler("onClientMouseLeave",JournalTable.label[5],writeDeselected)
	removeEventHandler("onClientGUIClick",JournalTable.label[5],openWriteJournal)
	removeEventHandler("onClientGUIClick",JournalTable.button[1],writeIntoJournal)
	removeEventHandler("onClientGUIClick",JournalTable.button[2],closeWriteJournal)
	guiSetInputEnabled(false)
end

function writeIntoJournal()
	guiSetText(JournalTable.label[4],guiGetText(JournalTable.memo[1]))
	guiSetVisible(JournalTable.window[1],false)
	showCursor(false) 
	isWriting = false
	isJournalOpen = false
	removeEventHandler("onClientMouseEnter",JournalTable.label[5],writeSelected)
	removeEventHandler("onClientMouseLeave",JournalTable.label[5],writeDeselected)
	removeEventHandler("onClientGUIClick",JournalTable.label[5],openWriteJournal)
	removeEventHandler("onClientGUIClick",JournalTable.button[1],writeIntoJournal)
	removeEventHandler("onClientGUIClick",JournalTable.button[2],closeWriteJournal)
	triggerEvent("saveJournalOnQuit",localPlayer)
	guiSetInputEnabled(false)
end

function saveJournalOnQuit()
	if not fileExists("fanbox.txt") then
		fileCreate("fanbox.txt")
		local journalopen = fileOpen("fanbox.txt")
		fileWrite(journalopen,guiGetText(JournalTable.label[4]))
		fileClose(journalopen)
	else
		fileDelete("fanbox.txt")
		fileCreate("fanbox.txt")
		local journalopen = fileOpen("fanbox.txt")
		fileWrite(journalopen,guiGetText(JournalTable.label[4]))
		fileClose(journalopen)
	end
end
addEvent("saveJournalOnQuit",true)
addEventHandler("saveJournalOnQuit",root,saveJournalOnQuit)

function loadJournalOnJoin()
	if fileExists("fanbox.txt") then
		local journalfile = fileOpen("fanbox.txt")
		local journalsize = fileGetSize(journalfile)
		local journalread = fileRead(journalfile,journalsize)
		guiSetText(JournalTable.label[4],journalread)
		guiSetText(JournalTable.memo[1],journalread)
		fileClose(journalfile)
	end
end
addEventHandler("onClientPlayerSpawn",root,loadJournalOnJoin)


local spacer = "\n"
local spacercount = 0

function addJournalEntryOnDamage(attacker,weapon)
	if attacker then
		if getElementType(attacker) == "ped" then
			spacercount = spacercount+1
			if spacercount == 16 then
				guiSetText(JournalTable.label[3],"Зомби напал на меня.")
				spacercount = 0
			else
				guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..""..spacer.."Зомби напал на меня.")
			end
		elseif getElementType(attacker) == "player" then
			spacercount = spacercount+1
			if spacercount == 16 then
				guiSetText(JournalTable.label[3],"Someone shot me!")
				spacercount = 0
			else
				guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Кто-то стрелял в меня!")
			end
		end
	end
end
addEventHandler("onClientPlayerDamage",localPlayer,addJournalEntryOnDamage)

local thirststatus = false
local foodstatus = false
local bloodstatus1 = false
local bloodstatus2 = false
local bonestatus = false
local coldstatus = false
local murderstatus = false
local loginstatus = false
local humanitystatus = false
local ghilliestatus = false

function addJournalEntryOnStatus()
	if getElementData(localPlayer,"logedin") then
		if getElementData(localPlayer,"logedin") then
			if not loginstatus then
				local hour,minutes = getTime()
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"Проснулся в "..hour..":"..minutes..". Это не просто мечта...")
					loginstatus = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Проснулся в "..hour..":"..minutes..". Это не просто мечта...")
					loginstatus = true
				end
			end
		end
		if getElementData(localPlayer,"thirst") < 20 then
			if not thirststatus then
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"Я хочу пить.")
					thirststatus = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Я хочу пить.")
					thirststatus = true
				end
			end
		else
			thirststatus = false
		end
		if getElementData(localPlayer,"food") < 20 then
			if not foodstatus then
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"Я собираюсь умереть от голода ...")
					foodstatus = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Я собираюсь умереть от голода ...")
					foodstatus = true
				end
			end
		else
			foodstatus = false
		end
		if getElementData(localPlayer,"blood") < 6000 then
			if not bloodstatus1 then
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"У меня кружится голова.")
					bloodstatus1 = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."У меня кружится голова.")
					bloodstatus1 = true
				end
			end
		else
			bloodstatus1 = false
		end
		if getElementData(localPlayer,"blood") < 1000 then
			if not bloodstatus2 then
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"Не могу ... носить ... далее ... как это ...")
					bloodstatus2 = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Не могу ... носить ... далее ... как это ...")
					bloodstatus2 = true
				end
			end
		else
			bloodstatus2 = false
		end
		if getElementData(localPlayer,"brokenbone") then
			if not bonestatus then
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"Сломал ногу. Черт.")
					bonestatus = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Сломал ногу. Черт.")
					bonestatus = true
				end
			end
		else
			bonestatus = false
		end
		if getElementData(localPlayer,"cold") then
			if not coldstatus then
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"Я трясся, как сумасшедший. Должно быть холодно ...")
					coldstatus = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Я трясся, как сумасшедший. Должно быть холодно ...")
					coldstatus = true
				end
			end
		else
			coldstatus = false
		end
		if getElementData(localPlayer,"murders") == 1 then
			if not murderstatus then
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"Убил человек сегодня. Он чувствовал себя ... хорошо. Собираюсь ли я с ума?")
					murderstatus = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Убил человек сегодня. Он чувствовал себя ... хорошо. Собираюсь ли я с ума?")
					murderstatus = true
				end
			end
		else
			murderstatus = false
		end
		if getElementData(localPlayer,"humanity") <= 5000 then
			if not humanitystatus then
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"Я чувствую себя героем за помощь так много людей.")
					humanitystatus = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Я чувствую себя героем за помощь так много людей.")
					humanitystatus = true
				end
			end
		else
			humanitystatus = false
		end
		if getElementData(localPlayer,"skin") < 100 then
			if not ghilliestatus then
				spacercount = spacercount+1
				if spacercount == 16 then
					guiSetText(JournalTable.label[3],"Новая одежда.")
					ghilliestatus = true
					spacercount = 0
				else
					guiSetText(JournalTable.label[3],guiGetText(JournalTable.label[3])..spacer.."Новая одежда.")
					ghilliestatus = true
				end
			end
		else
			ghilliestatus = false
		end
	end
end
setTimer(addJournalEntryOnStatus,10000,0)