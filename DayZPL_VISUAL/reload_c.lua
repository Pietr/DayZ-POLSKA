local reloading = false
local blockedTasks = 
{
	"TASK_SIMPLE_IN_AIR",
	"TASK_SIMPLE_JUMP",
	"TASK_SIMPLE_LAND",
	"TASK_SIMPLE_GO_TO_POINT",
	"TASK_SIMPLE_NAMED_ANIM",
	"TASK_SIMPLE_CAR_OPEN_DOOR_FROM_OUTSIDE",
	"TASK_SIMPLE_CAR_GET_IN",
	"TASK_SIMPLE_CLIMB", 
	"TASK_SIMPLE_SWIM",
	"TASK_SIMPLE_HIT_HEAD",
	"TASK_SIMPLE_FALL",
	"TASK_SIMPLE_GET_UP"
}

local function reloadWeapon()
	local task = getPedSimplestTask (localPlayer) 
	for idx, badTask in ipairs(blockedTasks) do
		if (task == badTask) then
			return true
		end
	end
	if reloading == true then
		triggerServerEvent("relWep", resourceRoot)
		reloading = false
	end	
end
addCommandHandler("Reload weapon", function()
	clip = getPedAmmoInClip(getLocalPlayer())
	total = getPedTotalAmmo(getLocalPlayer())-clip
	if total < 1 then return end
	if reloading == true then return true end
	setTimer(reloadWeapon,100, 1)
	reloading = true
end)
bindKey("r", "down", "Reload weapon")
