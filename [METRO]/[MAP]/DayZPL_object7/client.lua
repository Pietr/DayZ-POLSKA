addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('object.txd',true)
engineImportTXD(txd, 13660)
local dff = engineLoadDFF('object.dff', 0)
engineReplaceModel(dff, 13660)
local col = engineLoadCOL('object.col')
engineReplaceCOL(col, 13660)
engineSetModelLODDistance(13660, 500)
end)