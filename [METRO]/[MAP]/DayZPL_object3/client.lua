addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('object.txd',true)
engineImportTXD(txd, 1852)
local dff = engineLoadDFF('object.dff', 0)
engineReplaceModel(dff, 1852)
local col = engineLoadCOL('object.col')
engineReplaceCOL(col, 1852)
engineSetModelLODDistance(1852, 500)
end)