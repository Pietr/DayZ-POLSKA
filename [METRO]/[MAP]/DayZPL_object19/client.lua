addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('object.txd',true)
engineImportTXD(txd, 4254)
local dff = engineLoadDFF('object.dff', 0)
engineReplaceModel(dff, 4254)
local col = engineLoadCOL('object.col')
engineReplaceCOL(col, 4254)
engineSetModelLODDistance(4254, 500)
end)