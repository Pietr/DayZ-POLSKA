local weapons = {
	 {fileName="drydock1_SFSe01", model=10841},
	 {fileName="drydock1_SFSe", model=10828},
	 {fileName="sfseland02", model=10851},
	 {fileName="paperchase02", model=14595},
	 {fileName="a51_spottower", model=3279},
     {fileName="bigjunction_05_sfse", model=10861},
     {fileName="blacksky_sfse", model=10871},
	 {fileName="wong_dish", model=3031},
	 {fileName="teere", model=16203},--Арми 16590
	 	 
}
function load()
    for index, weapon in pairs(weapons) do
        col = engineLoadCOL ( "col/"..weapon.fileName.. ".col", weapon.model )
        engineReplaceCOL ( col, weapon.model )
    end
end

addEventHandler("onClientResourceStart",resourceRoot,
function ()
        setTimer ( load, 1000, 1)
end)
