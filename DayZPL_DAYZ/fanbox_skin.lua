local shader = dxCreateShader("sounds/fanbox.fx",0, 0, true, 'ped')
local shader2 = dxCreateShader("sounds/fanbox.fx",0, 0, true, 'ped')



function FanboxSkinSistem()
if getElementData(getLocalPlayer(),"logedin") then

local Kurtka = getElementData(getLocalPlayer(),"Kurtka")
local KurtkaTXD = dxCreateTexture("skin/"..Kurtka..".png")
dxSetShaderValue(shader, "gTexture", KurtkaTXD)
engineApplyShaderToWorldTexture(shader, "camisa",getLocalPlayer())

local Shtani = getElementData(getLocalPlayer(),"Shtani")
local ShtaniTXD = dxCreateTexture("skin/"..Shtani.."s.png")
dxSetShaderValue(shader2, "gTexture", ShtaniTXD)
engineApplyShaderToWorldTexture(shader2, "calca",getLocalPlayer())

end
end
addEvent("setOdahSistem", true)
addEventHandler("setOdahSistem", getRootElement(), FanboxSkinSistem)







--Для машин 
--shader = dxCreateShader("ByAbdl/ScriptByAbdl.fx")
--[[
function sultanPaintjob3()
local texture1 = dxCreateTexture("ByAbdl/17.png")
for i,veh in ipairs(getElementsByType("vehicle")) do
local col = getElementData(veh,"parent")
if getElementData(col,"fuel") < 10 then
dxSetShaderValue(shader, "gTexture", texture1)
engineApplyShaderToWorldTexture(shader, "humvee_body",veh)
end
end
end
addEventHandler ( "onClientResourceStart", resourceRoot, sultanPaintjob3) 
]]


