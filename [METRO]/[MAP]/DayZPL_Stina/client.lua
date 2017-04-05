function ReplaceTexture()
txd0 = engineLoadTXD ('183.txd')
engineImportTXD (txd0, 3095)
end
addEventHandler( 'onClientResourceStart', getResourceRootElement(getThisResource()), ReplaceTexture)