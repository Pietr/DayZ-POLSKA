
removedPisoks = {}
removedPisoksLOD = {}


function onPlayerChopPisok( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
	removeWorldModel( worldID, 3, worldX, worldY, worldZ, interior )
	table.insert(removedPisoks,{worldID, 3, worldX, worldY, worldZ, interior})
	removeWorldModel( worldLODID, 3, worldX, worldY, worldZ, interior )
	table.insert(removedPisoksLOD,{worldLODID, 3, worldX, worldY, worldZ, interior})

	local _, _, rz = getElementRotation( client )
	local Pisok = createObject( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ )
	setTimer( setElementCollisionsEnabled, 1000, 1, Pisok, false )
	moveObject( Pisok, 4000, worldX, worldY, worldZ ) 
	setTimer( destroyElement, 4000, 1, Pisok )

	local x, y, z = getElementPosition(source)
	local item, itemString = getItemTablePosition("Piasek")
  	local numberPisochok = 1
  	
  	if numberPisochok == 1 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	elseif numberPisochok == 2 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	elseif numberPisochok == 3 then
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
		createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
	end

end
addEvent( "onPlayerChopPisok", true )
addEventHandler( "onPlayerChopPisok", root, onPlayerChopPisok )

function onServerRespawnPisoks( worldID, worldX, worldY, worldZ, worldRX, worldRY, worldRZ, worldLODID, interior )
	removedTable = unpack(removedPisoks)
	removedTableLOD = unpack(removedPisoksLOD)
	if removedTable ~= nil then
		restoreWorldModel(removedTable[1],removedTable[2],removedTable[3],removedTable[4],removedTable[5],removedTable[6])
	end
	if removedTableLOD ~= nil then
		restoreWorldModel(removedTableLOD[1],removedTableLOD[2],removedTableLOD[3],removedTableLOD[4],removedTableLOD[5],removedTableLOD[6])
	end
	removedPisoks = {}
	removedPisoksLOD = {}
end
addEvent("onServerRespawnPisoks",true)
addEventHandler("onServerRespawnPisoks",root,onServerRespawnPisoks)