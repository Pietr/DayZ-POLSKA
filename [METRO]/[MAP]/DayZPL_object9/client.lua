addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('object.txd',true)
engineImportTXD(txd, 13657)
local dff = engineLoadDFF('object.dff', 0)
engineReplaceModel(dff, 13657)
local col = engineLoadCOL('object.col')
engineReplaceCOL(col, 13657)
engineSetModelLODDistance(13657, 500)
end)