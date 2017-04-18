--[[
Автор: Larnet7
Skype: Larnet7
Ресурс для расстановки точек лута для мода DayZ
Бинд добавления точки: кнопка 2 на NumPad
Бинд удаления точки: кнопка 3 на NumPad
Команда выдачи координат: /getpos
Установка:,кинуть архив в папку [gameplay], прописать /refresh, /start possave
Рекомендации: Использовать в MapEditor в режиме F5. Не использовать бинд удаления на посторонних маркерах
Присутствует графический интерфейс добавленных точек (отображение маркером рандомного цвета)
Скачано с mta-resource.ru
]]--
window = guiCreateWindow(148, 124, 501, 373, "Позиции игрока:", false)--Окно
guiWindowSetSizable(window, false)--Не трогать
guiSetVisible(window, false)--Не трогать

Text = guiCreateMemo(9, 23, 483, 307, "", false, window)--Текстовое поле
guiMemoSetReadOnly(Text, true)--Не трогать

buttonClose = guiCreateButton(9, 332, 241, 31, "Zamknij", false, window)--Кнопка,кртытия
buttonClear = guiCreateButton(250, 331, 241, 31, "Wyczyść", false, window)--Кнопка очистки    
local spawnPositions={
"14",
"15",
"16",
"17",
"18",
"10",
"11",
"13",
"2",
"7",
}
function tamanhas( tables )
	local count = 0
	for c in pairs( tables ) do
		count = count + 1
	end
	return count
end 
a={}--Не трогать
c={}--Не трогать
function addPos()--Ничего не трогать до конца функции
	local x,y,z=getElementPosition(getLocalPlayer())
	local pos="{"..x..","..y..","..z.."},"
	local r=math.random(0,255)
	local g=math.random(0,255)
	local b=math.random(0,255)
	local theMarker = createMarker ( x, y, z, "corona", 1, r, g, b, 170 )
	table.insert(a,pos)
	table.insert(c,theMarker)
	outputChatBox("Punkt został dodany!")
end
bindKey("num_2","down",addPos)--Бинд кнопки для добавления позиции
--local newFile = fileCreate("fanbox.txt") 
function addPos2()--Ничего не трогать до конца функции
	local andrey = math.random(tamanhas(spawnPositions))
	local x,y,z=getElementPosition(getLocalPlayer())
	local pos="{"..x..","..y..","..z..",1,"..spawnPositions[andrey].."},"
	local r=math.random(0,255)
	local g=math.random(0,255)
	local b=math.random(0,255)
	local theMarker = createMarker ( x, y, z, "corona", 1, r, g, b, 170 )
	table.insert(a,pos)
	table.insert(c,theMarker)
	
	hFile = fileOpen("pos.txt", false) 
    if hFile then 
        local temp 
        while not fileIsEOF(hFile) do 
        temp = fileRead(hFile, 500) 
    end 
        fileWrite(hFile,'{'..x..','..y..','..z..',1,'..spawnPositions[andrey]..'},\n') 
    else 
        hFile = fileCreate('pos.txt') 
        fileWrite(hFile,'{'..x..','..y..','..z..',1,'..spawnPositions[andrey]..'},\n') 
    end 
    fileClose(hFile) 
	outputChatBox("Punkt zombie został dodany!")
end
bindKey("num_3","down",addPos2)--Бинд кнопки для добавления позиции

function outPut()--Ничего не трогать до конца функции
showCursor(true)
guiSetVisible(window, true)
guiSetText(Text,"")
	for i,pos in ipairs(a) do
		local text=guiGetText(Text)
		guiSetText(Text,text..pos)
	end
end
addCommandHandler("getpos",outPut)--Команда выдачи координат

function ClearPossitions()--Не трогать ничего
for i, v in ipairs ( a ) do
    while a[ i ] and not tonumber( a[ i ] ) do
        table.remove( a, i )
    end
end
for i,m in ipairs ( c ) do
	destroyElement(m)
end
for i, v in ipairs ( c ) do
    while c[ i ] and not tonumber( c[ i ] ) do
        table.remove( c, i )
    end
end
guiSetText(Text,"")
end
addEventHandler("onClientGUIClick",buttonClear,ClearPossitions)

function CloseWindow()--Функция,крытия
showCursor(false)
guiSetVisible(window, false)
guiSetText(Text,"")
end
addEventHandler("onClientGUIClick",buttonClose,CloseWindow)

function Delete (Key,KeyState)--Ничего не трогать
	if KeyState=="down" then
		addEventHandler("onClientMarkerHit", getRootElement(), delmarker)
	else
		removeEventHandler("onClientMarkerHit", getRootElement(), delmarker)
	end
end
bindKey("num_3","both",Delete)--Бинд удаления точки

function delmarker()--Функция удаления точки с лутом
	for i,m in ipairs(c) do
	 if source==m then
	    destroyElement(source)
		table.remove(c,i)
		table.remove(a,i)
	 end
	end
	outputChatBox("Punkt został usunięty!")
end