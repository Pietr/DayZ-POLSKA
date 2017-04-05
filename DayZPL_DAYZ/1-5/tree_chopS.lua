
removedTrees = {}
removedTreesLOD = {}


function onPlayerChopTree( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
	removeWorldModel( worldID, 3, worldX, worldY, worldZ, interior )
	table.insert(removedTrees,{worldID, 3, worldX, worldY, worldZ, interior})
	removeWorldModel( worldLODID, 3, worldX, worldY, worldZ, interior )
	table.insert(removedTreesLOD,{worldLODID, 3, worldX, worldY, worldZ, interior})

	local _, _, rz = getElementRotation( client )
	local tree = createObject( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ )
	setTimer( setElementCollisionsEnabled, 1000, 1, tree, false )
	moveObject( tree, 4000, worldX, worldY, worldZ ) 
	setTimer( destroyElement, 4000, 1, tree )

	local x, y, z = getElementPosition(source)
	local item, itemString = getItemTablePosition("Drewno")
  	local numberWood = math.random(1,3)
  	
  	if numberWood == 1 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	elseif numberWood == 2 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	elseif numberWood == 3 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	end

end
addEvent( "onPlayerChopTree", true )
addEventHandler( "onPlayerChopTree", root, onPlayerChopTree )

function onServerRespawnTrees( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
	removedTable = unpack(removedTrees)
	removedTableLOD = unpack(removedTreesLOD)
	if removedTable ~= nil then
		restoreWorldModel(removedTable[1],removedTable[2],removedTable[3],removedTable[4],removedTable[5],removedTable[6])
	end
	if removedTableLOD ~= nil then
		restoreWorldModel(removedTableLOD[1],removedTableLOD[2],removedTableLOD[3],removedTableLOD[4],removedTableLOD[5],removedTableLOD[6])
	end
	removedTrees = {}
	removedTreesLOD = {}
end
addEvent("onServerRespawnTrees",true)
addEventHandler("onServerRespawnTrees",root,onServerRespawnTrees)