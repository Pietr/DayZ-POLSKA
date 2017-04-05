
removedPears = {}
removedPearsLOD = {}


function onPlayerChopPear( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
	removeWorldModel( worldID, 3, worldX, worldY, worldZ, interior )
	table.insert(removedPears,{worldID, 3, worldX, worldY, worldZ, interior})
	removeWorldModel( worldLODID, 3, worldX, worldY, worldZ, interior )
	table.insert(removedPearsLOD,{worldLODID, 3, worldX, worldY, worldZ, interior})

	local _, _, rz = getElementRotation( client )
	local pear = createObject( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ )
	setTimer( setElementCollisionsEnabled, 1000, 1, pear, false )
	moveObject( pear, 4000, worldX, worldY, worldZ ) 
	setTimer( destroyElement, 4000, 1, pear )

	local x, y, z = getElementPosition(source)
	local item, itemString = getItemTablePosition("Gruszka")
  	local numberPear = math.random(1,3)
  	
  	if numberPear == 1 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	elseif numberPear == 2 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	elseif numberPear == 3 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	end

end
addEvent( "onPlayerChopPear", true )
addEventHandler( "onPlayerChopPear", root, onPlayerChopPear )

function onServerRespawnPear( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
	removedTable = unpack(removedPears)
	removedTableLOD = unpack(removedPearsLOD)
	if removedTable ~= nil then
		restoreWorldModel(removedTable[1],removedTable[2],removedTable[3],removedTable[4],removedTable[5],removedTable[6])
	end
	if removedTableLOD ~= nil then
		restoreWorldModel(removedTableLOD[1],removedTableLOD[2],removedTableLOD[3],removedTableLOD[4],removedTableLOD[5],removedTableLOD[6])
	end
	removedPears = {}
	removedPearsLOD = {}
end
addEvent("onServerRespawnPear",true)
addEventHandler("onServerRespawnPear",root,onServerRespawnPear)