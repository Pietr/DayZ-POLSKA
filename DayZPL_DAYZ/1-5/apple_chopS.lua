
removedApple = {}
removedAppleLOD = {}


function onPlayerChopApple( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
	removeWorldModel( worldID, 3, worldX, worldY, worldZ, interior )
	table.insert(removedApple,{worldID, 3, worldX, worldY, worldZ, interior})
	removeWorldModel( worldLODID, 3, worldX, worldY, worldZ, interior )
	table.insert(removedAppleLOD,{worldLODID, 3, worldX, worldY, worldZ, interior})

	local _, _, rz = getElementRotation( client )
	local Apple = createObject( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ )
	setTimer( setElementCollisionsEnabled, 1000, 1, Apple, false )
	moveObject( Apple, 4000, worldX, worldY, worldZ ) 
	setTimer( destroyElement, 4000, 1, Apple )

	local x, y, z = getElementPosition(source)
	local item, itemString = getItemTablePosition("Jabłko")
  	local numberApple = 1 -- math.random(1,3)
  	
  	if numberApple == 1 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	elseif numberApple == 2 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	elseif numberApple == 3 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	end

end
addEvent( "onPlayerChopApple", true )
addEventHandler( "onPlayerChopApple", root, onPlayerChopApple )

function onServerRespawnApple( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
	removedTable = unpack(removedApple)
	removedTableLOD = unpack(removedAppleLOD)
	if removedTable ~= nil then
		restoreWorldModel(removedTable[1],removedTable[2],removedTable[3],removedTable[4],removedTable[5],removedTable[6])
	end
	if removedTableLOD ~= nil then
		restoreWorldModel(removedTableLOD[1],removedTableLOD[2],removedTableLOD[3],removedTableLOD[4],removedTableLOD[5],removedTableLOD[6])
	end
	removedApple = {}
	removedAppleLOD = {}
end
addEvent("onServerRespawnApple",true)
addEventHandler("onServerRespawnApple",root,onServerRespawnApple)