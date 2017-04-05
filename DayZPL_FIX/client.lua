
sec = {{{{{{},{},{},{}}}}}}			


local sx, sy = guiGetScreenSize ( )
local currentList = { }
-- Tables
local main = {}
local read = { }
local add = {
    button = {},
    edit = {}
} local remove = {
    button = {}
}

main.window = guiCreateWindow( ( sx / 2 - 710 / 2 ), ( sy / 2 - 610 / 2 ), 710, 610, "Обновления сервера", false)
guiWindowSetMovable ( main.window, false )
guiWindowSetSizable(main.window, false)
guiSetVisible ( main.window, false )
main.grid = guiCreateGridList(9, 26, 691, 519, false, main.window)
guiGridListSetSortingEnabled ( main.grid, false )
guiGridListAddColumn(main.grid, "Дата", 0.18)
guiGridListAddColumn(main.grid, "Обновления", 0.58)
guiGridListAddColumn(main.grid, "Разработчик", 0.2)
main.close = guiCreateButton(529, 555, 171, 40, "Zamknij", false, main.window)
main.readmore = guiCreateButton(353, 555, 171, 40, "Открыть в новом окне", false, main.window)
guiCreateLabel(11, 551, 236, 34, "Группа вк.\nhttps://vk.com/mta_union", false, main.window)

add.window = guiCreateWindow( ( sx / 2 - 482 / 2 ), ( sy / 2 - 571 / 2 ), 482, 571, "Сервер обновлений - Admin Manager", false)
guiWindowSetSizable(add.window, false)
guiSetVisible ( add.window, false )
guiCreateLabel(10, 32, 145, 15, "Дата (MM/DD/YYYY):", false, add.window)
add.edit['date'] = guiCreateEdit(9, 53, 454, 28, "", false, add.window)
guiCreateLabel(10, 103, 145, 15, "Обновления:", false, add.window)
add.edit['update'] = guiCreateMemo(13, 125, 450, 294, "", false, add.window)
guiCreateLabel(10, 449, 145, 15, "Разработчик:", false, add.window)
add.edit['author'] = guiCreateEdit(9, 468, 454, 28, "", false, add.window)
add.button['add'] = guiCreateButton(12, 508, 143, 44, "Добавить обновление", false, add.window)
add.button['cancel'] = guiCreateButton(165, 508, 143, 44, "Zamknij", false, add.window)
add.button['remove'] = guiCreateButton(320, 508, 143, 44, ">> Удалить панель >>", false, add.window)

remove.window = guiCreateWindow( ( sx / 2 - 552 / 2 ), ( sy / 2 - 533 / 2 ), 552, 533, "Сервер обновлений / Удалить обновление", false)
guiWindowSetSizable(remove.window, false)
guiSetVisible ( remove.window, false )
remove.grid = guiCreateGridList(10, 28, 532, 443, false, remove.window)
guiGridListAddColumn(remove.grid, "Дата", 0.18)
guiGridListAddColumn(remove.grid, "Обновления", 0.58)
guiGridListAddColumn(remove.grid, "Разработчик", 0.2)
remove.button['remove'] = guiCreateButton(376, 481, 166, 36, "Удалить", false, remove.window)
guiSetProperty(remove.button['remove'], "NormalTextColour", "FFFF0000")
remove.button['back'] = guiCreateButton(10, 481, 166, 36, "<< Назад <<", false, remove.window)

read.window = guiCreateWindow( ( sx / 2 - 407 / 2 ), ( sy / 2 - 397 / 2 ), 407, 397, "Прочитать больше", false)
guiWindowSetSizable(read.window, false)
guiSetVisible ( read.window, false )
guiSetAlpha ( read.window, 1 )
guiWindowSetMovable ( read.window, false )
read.date = guiCreateLabel(9, 35, 275, 25, "Данные: Загрузка ..", false, read.window)
read.author = guiCreateLabel(9, 70, 388, 25, "Разработчик: Загрузка ...", false, read.window)
guiCreateLabel(9, 105, 388, 25, "Обновления:", false, read.window)
read.update = guiCreateMemo(9, 127, 388, 253, "Загрузка ..", false, read.window)
guiMemoSetReadOnly(read.update, true)
read.close = guiCreateButton(294, 25, 103, 35, "Выход", false, read.window)

addEvent ( "Updates:onPanelChangeState", true )
addEventHandler ( "Updates:onPanelChangeState", root, function ( window, ag1 )
	if ( window == 'main' ) then
		if ( guiGetVisible ( add.window ) ) then
			guiSetVisible ( add.window, false )
			showCursor ( false )
		end if ( guiGetVisible ( remove.window ) ) then
			guiSetVisible ( remove.window, false )
			showCursor ( false )
		end
		guiSetVisible ( main.window, true )
		showCursor ( true )
		guiGridListClear ( main.grid )
		if ( type ( ag1 ) == 'table' ) then
			currentList = { }

			local updates = { }
			for index, variable in ipairs ( ag1 ) do
				local lol = updates
				updates = { }
				table.insert ( updates, { variable['Date_'], variable['Name'], variable['Developer'] } )
				for i, v in ipairs ( lol ) do
					table.insert ( updates, v )
				end
			end
			for i,v in ipairs ( updates ) do
				local row = guiGridListAddRow ( main.grid )
				guiGridListSetItemText ( main.grid, row, 1, tostring ( v[1] ), false, false )
				guiGridListSetItemText ( main.grid, row, 2, tostring (v[2] ), false, false )
				guiGridListSetItemText ( main.grid, row, 3, tostring (v[3] ), false, false )
			end
			currentList = updates
		else
			guiGridListSetItemText ( main.grid, guiGridListAddRow ( main.grid ), 2, "Не удалось загрузить обновления", true, true )
		end
	elseif ( window == 'manager' ) then
		if ( guiGetVisible ( remove.window ) ) then return end
		if ( guiGetVisible ( main.window ) ) then
			guiSetVisible ( main.window, false )
			showCursor ( false )
		end if ( guiGetVisible ( read.window ) ) then
			guiSetVisible ( read.window, false )
		end
		
		guiSetVisible ( add.window, true )
		showCursor ( true )
		guiSetText ( add.edit['author'], getPlayerName ( localPlayer ) )
		local time = getRealTime ( )
		local day = time.monthday
		local month = time.month + 1
		local year = time.year + 1900
		if ( day < 10 ) then
			day = 0 .. day
		end if ( month < 10 ) then
			month = 0 .. month
		end
		guiSetText ( add.edit['date'], table.concat ( { month, day, year }, "/" ) )
		guiSetInputMode ( "no_binds_when_editing" )
	end
end )

addEventHandler ( 'onClientGUIClick', root, function ( btn )
	if ( btn == 'left' ) then

		if ( source == main.readmore ) then
			local row, col = guiGridListGetSelectedItem ( main.grid )
			if ( row ~= -1 and col ~= 0 ) then
				guiSetVisible ( read.window, true )
				guiBringToFront ( read.window )
				guiSetText ( read.date, "Дата: "..guiGridListGetItemText ( main.grid, row, 1 ) )
				guiSetText ( read.update, guiGridListGetItemText ( main.grid, row, 2 ) )
				guiSetText ( read.author, "Разработчик: "..guiGridListGetItemText ( main.grid, row, 3 ) )
			else
				outputChatBox ( "Выберите обновление.", 255, 0, 0 )
			end
		elseif ( source == read.close ) then
			guiSetVisible ( read.window, false )
		elseif ( source == main.close ) then
			guiGridListClear ( main.grid )
			guiSetVisible ( main.window, false )
			showCursor ( false )
			if ( guiGetVisible ( read.window ) ) then
				guiSetVisible ( read.window, false )
			end
		

		elseif ( source == add.button['cancel'] ) then
			guiSetVisible ( add.window, false )
			showCursor ( false )
		elseif ( source == add.button['add'] ) then
			local date, update, author = guiGetText ( add.edit['date'] ), guiGetText ( add.edit['update'] ), guiGetText ( add.edit['author'] )
			if ( date ~= '' and update ~= '' and author ~= '' ) then
				triggerServerEvent ( "Updates:onServerEvent", localPlayer, 'addUpdate', { date, update, author } )
			else
				outputChatBox ( "Вам необходимо ввести всю информацию.", 255, 0, 0 )
			end
		elseif ( source == add.button['remove'] ) then
			guiSetVisible ( add.window, false )
			guiSetVisible ( remove.window, true )
			guiGridListClear ( remove.grid )
			if ( currentList and #currentList > 0 ) then
				for index, var in ipairs ( currentList ) do
					local row = guiGridListAddRow ( remove.grid )
					guiGridListSetItemText ( remove.grid, row, 1, var[1], false, false )
					guiGridListSetItemText ( remove.grid, row, 2, var[2], false, false )
					guiGridListSetItemText ( remove.grid, row, 3, var[3], false, false )
				end
			else
				guiGridListSetItemText ( remove.grid, guiGridListAddRow ( remove.grid ), 2, "Пожалуйста, используйте / обновления, а затем вернуться к этой панели.", true, true )
				guiGridListSetItemColor ( remove.grid, 0, 2, 255, 0, 0 )
			end
		-- remove panel
		elseif ( source == remove.button['back'] ) then
			guiSetVisible ( remove.window, false )
			guiSetVisible ( add.window, true )
		elseif ( source == remove.button['remove'] ) then
			local row, col = guiGridListGetSelectedItem ( remove.grid )
			if ( row ~= -1 and col ~= 0 ) then
				local date = guiGridListGetItemText ( remove.grid, row, 1 )
				local update = guiGridListGetItemText ( remove.grid, row, 2 )
				local author = guiGridListGetItemText ( remove.grid, row, 3 )
				
				for index, var in ipairs ( currentList ) do
					if ( var[1] == date and var[2] == update and var[3] == author ) then
						table.remove ( currentList, index )
						break
					end
				end
				guiGridListClear ( remove.grid )
				if ( #currentList > 0 ) then
					for index, var in ipairs ( currentList ) do
						local row = guiGridListAddRow ( remove.grid )
						guiGridListSetItemText ( remove.grid, row, 1, var[1], false, false )
						guiGridListSetItemText ( remove.grid, row, 2, var[2], false, false )
						guiGridListSetItemText ( remove.grid, row, 3, var[3], false, false )
					end
				else 
					guiGridListSetItemText ( remove.grid, guiGridListAddRow ( remove.grid ), 2, "Обновления не найдены.", true, true )
				end
				triggerServerEvent ( 'Updates:onServerEvent', localPlayer, 'removeUpdate', { date, update, author } )
			end
		end
	end
end )
