addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('object.txd',true)
engineImportTXD(txd, 2189)
local dff = engineLoadDFF('object.dff', 0)
engineReplaceModel(dff, 2189)
local col = engineLoadCOL('object.col')
engineReplaceCOL(col, 2189)
engineSetModelLODDistance(2189, 500)
end)