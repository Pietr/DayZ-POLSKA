addEventHandler('onClientResourceStart', resourceRoot,
function()
local txd = engineLoadTXD('object1.txd',true)
engineImportTXD(txd, 1944)
local dff = engineLoadDFF('object1.dff', 0)
engineReplaceModel(dff, 1944)
local col = engineLoadCOL('object1.col')
engineReplaceCOL(col, 1944)
engineSetModelLODDistance(1944, 500)
local txd = engineLoadTXD('object2.txd',true)
engineImportTXD(txd, 3971)
local dff = engineLoadDFF('object2.dff', 0)
engineReplaceModel(dff, 3971)
local col = engineLoadCOL('object2.col')
engineReplaceCOL(col, 3971)
engineSetModelLODDistance(3971, 500)
local txd = engineLoadTXD('object3.txd',true)
engineImportTXD(txd, 1943)
local dff = engineLoadDFF('object3.dff', 0)
engineReplaceModel(dff, 1943)
local col = engineLoadCOL('object3.col')
engineReplaceCOL(col, 1943)
engineSetModelLODDistance(1943, 500)
end)