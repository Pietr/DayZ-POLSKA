--[[
Ресурс блокирует использование +с бага на 100% + блокировка макросов (автоматический +с баг).
Приседание активируется через 1 секунду после выстрела. Пожалуйста не изменяйте или не модифицируйте скрипт.

local crouch
local timer

function clientResourceStart( )
	crouch = isControlEnabled( "crouch" )
end

addEventHandler( "onClientResourceStart", resourceRoot, clientResourceStart )

function clientResourceStop( )
	toggleCrouch( crouch )
end

addEventHandler( "onClientResourceStop", resourceRoot, clientResourceStop )

function clientPlayerWasted( )
	toggleCrouch( crouch )
end

addEventHandler( "onClientPlayerWasted", localPlayer, clientPlayerWasted )

function clientPlayerWeaponFire( )
	toggleCrouch( false )
	
	timer = setTimer( toggleCrouch, 1000, 1, crouch )
end

addEventHandler( "onClientPlayerWeaponFire", localPlayer, clientPlayerWeaponFire )

function toggleCrouch( switch )
	if ( isTimer( timer ) ) then
		killTimer( timer )
	end
	
	timer = nil
	
	toggleControl( "crouch", switch )
end
]]--

local screenW, screenH = guiGetScreenSize()
-- compass
addEventHandler( "onClientPreRender", root,function()
	if not getElementData(getLocalPlayer(),"logedin") or getKeyState( "b" ) == false or getElementData(getLocalPlayer(),"Kompas") < 1 then return end
	local _,_,camrot = getElementRotation(getCamera())
	dxDrawImage(screenW*0.834,screenH*0.563,180,180,"images/compass/radar.png",-camrot,0,0,tocolor(255,255,255,255))
	dxDrawImage(screenW*0.77,screenH*0.490,470,330,"images/compass/compas.png",-90,0,0,tocolor(255,255,255,255))
	dxDrawText ("".. math.floor(camrot) .. "°", screenW*0.825,screenH*0.71,196.0,364.0,tocolor(255,255,255,255),1,"sans","left","top",false,false,true)
end)

local antirelog_time = 10 --Время антирелога (В секундах)
local xs, ys = guiGetScreenSize ()
local sess_id = 0
local going_timer = nil
local going_time = 10

addEventHandler( "onClientRender", root,
function()
drawAntirelogTimer()
end
)

function drawAntirelogTimer ()
if isTimer ( going_timer ) and getElementData ( localPlayer, "antiRelogWork" ) then
dxDrawText ( "Anty-Relog: "..going_time, 0, ys-ys/4, xs, ys, tocolor ( 250, 0, 0 ), 1.01, "default-bold", "center", "top" )
dxDrawText ( "Nie wychodź z serwera!", 0, ys-ys/4+15, xs, ys, tocolor ( 250, 0, 0 ), 1.01, "default-bold", "center", "top" )
end
end

function cancelPedDamage ( attacker, weapon )
if isElement ( attacker ) and getElementType ( attacker ) == "player" and weapon > 0 and weapon ~= 17 then
	if source == localPlayer then
		going_time = antirelog_time
		if not isTimer ( going_timer ) then
			going_timer = setTimer ( checkAntiRelogTime, 1000, 0 )
		end
		setElementData ( source, "antiRelogWork", true )
		end
	end
end
addEventHandler ( "onClientPlayerDamage", localPlayer, cancelPedDamage )

function wastedMessage ( killer, weapon, bodypart )
	if isTimer ( going_timer ) then
		killTimer ( going_timer )
	end 
	going_timer = nil
	setElementData ( localPlayer, "antiRelogWork", false )
end
addEventHandler ( "onClientPlayerWasted", getLocalPlayer(), wastedMessage )

function checkAntiRelogTime ()
	local vx,vy,vz = getElementVelocity ( localPlayer )
	if vx == 0 and vy == 0 and vz == 0 then
		going_time = going_time-1
		if going_time == 0 then
			setElementData ( localPlayer, "antiRelogWork", false )
			killTimer ( going_timer )
			going_timer = nil
		end
	else
		going_time = 10
	end
end