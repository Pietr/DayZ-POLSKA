GUIEditor = {
    edit = {},
    button = {},
    window = {},
    label = {},
    combobox = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        GUIEditor.window[1] = guiCreateWindow(330, 195, 399, 287, "Zmiana przywilejów", false)
        guiWindowSetSizable(GUIEditor.window[1], false)
		guiSetVisible(GUIEditor.window[1],false)
        GUIEditor.label[1] = guiCreateLabel(0.03, 0.08, 0.25, 0.06, "Nick:", true, GUIEditor.window[1])
        GUIEditor.edit[1] = guiCreateEdit(0.03, 0.14, 0.93, 0.09, "", true, GUIEditor.window[1])
        guiEditSetMaxLength(GUIEditor.edit[1], 33)
        GUIEditor.label[2] = guiCreateLabel(0.03, 0.23, 0.34, 0.06, "Przywilej:", true, GUIEditor.window[1])
        GUIEditor.combobox[1] = guiCreateComboBox(0.03, 0.30, 0.93, 0.52, "", true, GUIEditor.window[1])
        GUIEditor.label[3] = guiCreateLabel(0.03, 0.38, 0.48, 0.06, "Czas (0 - doż):", true, GUIEditor.window[1])
        GUIEditor.edit[2] = guiCreateEdit(0.03, 0.44, 0.23, 0.11, "", true, GUIEditor.window[1])
        GUIEditor.label[4] = guiCreateLabel(0.26, 0.46, 0.08, 0.07, "dni", true, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(0.03, 0.82, 0.48, 0.13, "Wyjdź", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
        GUIEditor.button[2] = guiCreateButton(0.52, 0.82, 0.46, 0.13, "Nadaj", true, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")    
		addEventHandler("onClientGUIChanged",getRootElement(),function()
			if source==GUIEditor.edit[2] then
				guiSetText(source,guiGetText(source):gsub("[^0-9]",""))
			end
		end)
		addEventHandler("onClientGUIClick",getRootElement(),function()
			if source==GUIEditor.button[1] then
				showCursor(false)
				guiSetVisible(GUIEditor.window[1],false)
			elseif source==GUIEditor.button[2] then
				local serial=guiGetText(GUIEditor.edit[1])
				local group=guiComboBoxGetItemText(GUIEditor.combobox[1], guiComboBoxGetSelected(GUIEditor.combobox[1]))
				local days=guiGetText(GUIEditor.edit[2])
				triggerServerEvent("setPermissionsForAcc",getRootElement(),serial,group,days)
			end
		end)
    end
)

addEvent("showPermPanel",true)
addEventHandler("showPermPanel",getRootElement(),function(list)
	guiComboBoxClear(GUIEditor.combobox[1])
	showCursor(true)
	guiSetVisible(GUIEditor.window[1],true)
	for i,data in ipairs(list) do
		guiComboBoxAddItem(GUIEditor.combobox[1],data)
	end
end)