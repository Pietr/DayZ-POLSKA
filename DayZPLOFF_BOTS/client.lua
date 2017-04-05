


function isMyPingTheLowest()
	local players = getElementsByType("player")
	local yes = true
	for i, player in ipairs(players) do
		if getPlayerPing(getLocalPlayer()) > getPlayerPing(player) then
			yes = false
		end
	end
	if yes == true then
		return true
	else
		return false
	end
end
function findRotation(x1,y1,x2,y2)
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	if t < 0 then t = t + 360 end
	return t
end
addEventHandler("onClientPedDamage", getRootElement(),
	function(attacker)
		if getElementData(source, "type") == "ped.sniper.npc" and getElementData(attacker, "type") == "ped.sniper.npc" then
			cancelEvent()
		end
	end
)
setTimer(
	function()
		if isMyPingTheLowest() then
			for i, peds in ipairs(getElementsByType("ped")) do
				if getElementData(peds, "type") == "ped.sniper.npc" then
					local x, y, z = getElementPosition(peds)
					local lowest = nil
					local player = nil
					for i, players in ipairs(getElementsByType("player")) do
						local px, py, pz = getElementPosition(players)
						if getDistanceBetweenPoints3D(x, y, z, px, py, pz) < 100 then
							if lowest == nil then
								lowest = getDistanceBetweenPoints3D(x, y, z, px, py, pz)
								player = players
							else
								if getDistanceBetweenPoints3D(x, y, z, px, py, pz) < lowest then
									lowest = getDistanceBetweenPoints3D(x, y, z, px, py, pz)
									player = players
								end
							end
						end
					end
					if isElement(player) then
						triggerServerEvent("sniperTakeDecision", getRootElement(), peds, player)
					end
				end
			end
		end
	end
, 1500, 0)


addEvent("sniperTakeDecisionClient", true)
addEventHandler("sniperTakeDecisionClient", getRootElement(),
	function(sniperPedID, aimPlayer)
		local x, y, z = getElementPosition(sniperPedID)
		local px, py, pz = getElementPosition(aimPlayer)
		setPedAimTarget(sniperPedID, px, py, pz)
		local rotZ = findRotation(x, y, px, py)
		setPedRotation(sniperPedID, rotZ)
		setPedControlState(sniperPedID, "aim_weapon", true)
		setPedControlState(sniperPedID, "fire", true)
		setTimer(
			function()
				if isElement(sniperPedID) then
					setPedControlState(sniperPedID, "fire", false)
					setPedControlState(sniperPedID, "aim_weapon", false)
				end
			end
		, 2000, 1)--50 на снайперки ЗАЖИМ
	end
)