addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('object1.txd',true)
engineImportTXD(txd, 13599)
local dff = engineLoadDFF('object1.dff', 0)
engineReplaceModel(dff, 13599)
local col = engineLoadCOL('object1.col')
engineReplaceCOL(col, 13599)
engineSetModelLODDistance(13599, 500)
local txd = engineLoadTXD('object2.txd',true)
engineImportTXD(txd, 1936)
local dff = engineLoadDFF('object2.dff', 0)
engineReplaceModel(dff, 1936)
local col = engineLoadCOL('object2.col')
engineReplaceCOL(col, 1936)
engineSetModelLODDistance(1936, 500)
local txd = engineLoadTXD('object3.txd',true)
engineImportTXD(txd, 13603)
local dff = engineLoadDFF('object3.dff', 0)
engineReplaceModel(dff, 13603)
local col = engineLoadCOL('object3.col')
engineReplaceCOL(col, 13603)
engineSetModelLODDistance(13603, 500)
end)