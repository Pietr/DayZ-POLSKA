local models = {
	{400},
	{402},
	{403},
	{408},
	{411},
	{415},
	{416},
	--{417},
	{428},
	{433},
	{434},
	{435},
	{437},
	{439},
	{455},
	{463},
	{466},
	{468},
	{470},--
	{471},
	{487},--
	{489},
	{490},
	{495},
	{497},--
	{500},
	{514},
	{515},
	{522},
	{525},
	{542},
	{547},
	{545},
	{548},
	{553},--
  --{563},--
	{579},
	{582},
	{595},--
	{596},
	{601},	
}
--[[
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),function()
	for _, data in ipairs(replace) do
			engineImportTXD(engineLoadTXD("cars/"..data[1]..".txd"),data[1])
			engineReplaceModel(engineLoadDFF("cars/"..data[1]..".dff",0),data[1])
		end	

end)
]]
function replaceModel() 
	for i,model in ipairs(models) do			
		txd = engineLoadTXD("cars/"..model[1]..".txd")
		engineImportTXD(txd,model[1])
		dff = engineLoadDFF("cars/"..model[1]..".dff",0)
		engineReplaceModel(dff,model[1])				
	end
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),replaceModel)


