function applyMods(res)
	if (res==getThisResource()) then

		local skin = engineLoadTXD ( "weapon/minigun.txd" )
		engineImportTXD ( skin, 1851 )
        local skin = engineLoadDFF ( "weapon/minigun.dff", 1851 )
        engineReplaceModel ( skin, 1851 )
		local skin = engineLoadTXD ( "weapon/minigun1.txd" )
		engineImportTXD ( skin, 362 )
        local skin = engineLoadDFF ( "weapon/minigun1.dff", 362 )
        engineReplaceModel ( skin, 362 )
		
	end
end
addEventHandler("onClientResourceStart", getRootElement(), applyMods)