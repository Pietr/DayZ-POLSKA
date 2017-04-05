function disableSounds() 
    setAmbientSoundEnabled( "gunfire", false ) 
end 
addEventHandler("onClientResourceStart",root,disableSounds)

--[[




			["M1911"] = 2279,
			["M1911 z tłumikiem"] = 2280,
			["GLOCK 19"] = 2281,
			["GLOCK 19 z tłumikiem"] = 2282,
			["MAGNUM"] = 2283,
]]


weapons = {
	{"M4A1",1,5,"1"},
	{"M4A1 kamuflaż",1,5,"1"},
	{"M4A1 z tłumikiem",1,5,"2"},
	{"M4A1 kamuflaż z tłumikiem",1,5,"2"},
	{"AK-101",1,5,"3"},
	{"AK-101 z tłumikiem",1,5,"4"},
	{"AK-101 kamuflaż",1,5,"3"},
	{"AK-101 kamuflaż z tłumikiem",1,5,"4"},
	{"AKM",1,5,"5"},
	{"AKM z tłumikiem",1,5,"4"},
	{"AKM kamuflaż",1,5,"5"},
	{"AKM kamuflaż z tłumikiem",1,5,"4"},
	{"SVD",1,6,"6"},
	{"SVD kamuflaż",1,6,"6"},
	{"WSS Wintoriez",1,6,"4"},
	{"WSS Wintoriez kamuflaż",1,6,"4"},
	{"AUG",1,5,"8"},
	{"AUG z tłumikiem",1,5,"8"},
	{"AK-74",1,5,"9"},
	{"AK-74 z tłumikiem",1,5,"4"},
	{"Mosin–Nagant",1,6,"10"},
	{"Mosin–Nagant z kamuflażem",1,6,"10"},
	{"SKS",1,6,"11"},
	{"FN FAL",1,5,"12"},
	{"FN FAL z tłumikiem",1,5,"1"},
	{"WINCHESTER M70",1,6,"14"},
	{"IZH-43",1,3,"15"},
	{"MP-133",1,3,"16"},

	{"MP5",2,4,"17"},
	{"MP5 z tłumikiem",2,4,"18"},
	{"CZ61 SCORPION",2,4,"19"},
	{"UMP45",2,4,"20"},
	{"M1911",2,2,"21"},
	{"M1911 z tłumikiem",2,2,"22"},
	{"GLOCK 19",2,2,"23"},
	{"GLOCK 19 z tłumikiem",2,2,"22"},
	{"MAGNUM",2,2,"25"},

}

function playGunfireSound()
	local muzzleX, muzzleY, muzzleZ = getPedWeaponMuzzlePosition(source)
	local x,y,z = getElementPosition(source)
	local px,py,pz = getElementPosition(getLocalPlayer())
	local dist = getDistanceBetweenPoints2D(x,y,px,py)
	if dist > 300 then return end
	for i = 1, #weapons do
		if getElementData(source,"currentweapon_"..weapons[i][2]) == weapons[i][1] then
			if getPedWeaponSlot(source) == weapons[i][3] then
				local sound = playSound3D("sounds/"..weapons[i][4]..".wav", muzzleX, muzzleY, muzzleZ, false)
				setSoundMaxDistance(sound,300)
			end
		end
	end
end
addEventHandler("onClientPlayerWeaponFire", root, playGunfireSound)

--[[
0: WEAPONSLOT_TYPE_UNARMED
1: WEAPONSLOT_TYPE_MELEE
2: WEAPONSLOT_TYPE_HANDGUN
3: WEAPONSLOT_TYPE_SHOTGUN
4: WEAPONSLOT_TYPE_SMG (used for driveby's)
5: WEAPONSLOT_TYPE_RIFLE
6: WEAPONSLOT_TYPE_SNIPER
7: WEAPONSLOT_TYPE_HEAVY
8: WEAPONSLOT_TYPE_THROWN
9: WEAPONSLOT_TYPE_SPECIAL
10: WEAPONSLOT_TYPE_GIFT
11: WEAPONSLOT_TYPE_PARACHUTE
12: WEAPONSLOT_TYPE_DETONATOR

https://wiki.sa-mp.com/wiki/Weapons
]]