local cfg = {}

-- PCs positions
cfg.pcs = {
	{1855.1077880859,3696.8918457031,34.286670684814},
	{441.00912475586,-978.44665527344,30.689594268799},
	{-449.14297485352,6012.7451171875,31.71639251709},
	{459.73251342773,-989.140625,24.914873123169}
}

-- vehicle tracking configuration
cfg.trackveh = {
	min_time = 300, -- min time in seconds
	max_time = 600, -- max time in seconds
	service = "police" -- service to alert when the tracking is successful
}

-- wanted display
cfg.wanted = {
	blipid = 458,
	blipcolor = 38,
	service = "police"
}

-- illegal items (seize)
cfg.seizable_items = {
	"dirty_money",
	"kokain",
	"skunk",
	"hampblade",
	"kokainblade",
	"syre",
	"lsd",
	"samsung",
	"iphone",
	"oneplus",
	"wbody|WEAPON_VINTAGEPISTOL",
	"wammo|WEAPON_VINTAGEPISTOL",
	"wbody|WEAPON_PISTOL",
	"wammo|WEAPON_PISTOL",
	"wbody|WEAPON_PISTOL_MK2",
	"wammo|WEAPON_PISTOL_MK2",
	"wbody|WEAPON_MARKSMANPISTOL",
	"wammo|WEAPON_MARKSMANPISTOL",
	"wbody|WEAPON_SNSPISTOL",
	"wammo|WEAPON_SNSPISTOL",
	"wbody|WEAPON_REVOLVER",
	"wammo|WEAPON_REVOLVER",
	"wbody|WEAPON_HEAVYPISTOL",
	"wammo|WEAPON_HEAVYPISTOL",
	"wbody|WEAPON_MACHINEPISTOL",
	"wammo|WEAPON_MACHINEPISTOL",
	"wbody|WEAPON_PISTOL50",
	"wammo|WEAPON_PISTOL50",
	"wbody|WEAPON_MOLOTOV",
	"wammo|WEAPON_MOLOTOV",
	"wbody|WEAPON_PUMPSHOTGUN",
	"wammo|WEAPON_PUMPSHOTGUN",
	"wbody|WEAPON_ASSAULTSHOTGUN",
	"wammo|WEAPON_ASSAULTSHOTGUN",
	"wbody|WEAPON_SAWNOFFSHOTGUN",
	"wammo|WEAPON_SAWNOFFSHOTGUN",
	"wbody|WEAPON_ASSAULTRIFLE",
	"wammo|WEAPON_ASSAULTRIFLE",
	"wbody|WEAPON_CARBINERIFLE",
	"wammo|WEAPON_CARBINERIFLE",
	"wbody|WEAPON_HEAVYSNIPER",
	"wammo|WEAPON_HEAVYSNIPER",
	"wbody|WEAPON_SNIPERRIFLE",
	"wammo|WEAPON_SNIPERRIFLE",
	"wbody|WEAPON_GUSENBERG",
	"wammo|WEAPON_GUSENBERG",
	"wbody|WEAPON_STUNGUN",
	"wbody|WEAPON_COMBATPISTOL",
	"wammo|WEAPON_COMBATPISTOL",
	"wbody|WEAPON_COMBATPDW",
	"wammo|WEAPON_COMBATPDW",
	"wbody|WEAPON_CARBINERIFLE_MK2",
	"wammo|WEAPON_CARBINERIFLE_MK2",
	"wbody|WEAPON_HEAVYSNIPER_MK2",
	"wammo|WEAPON_HEAVYSNIPER_MK2",
	"wbody|WEAPON_SMG",
	"wammo|WEAPON_SMG",
	"wbody|WEAPON_MINISMG",
	"wammo|WEAPON_MINISMG",
	"wbody|WEAPON_MICROSMG",
	"wammo|WEAPON_MICROSMG",
	"wbody|WEAPON_BATTLEAXE",
	"wbody|WEAPON_BALL",
	"wbody|WEAPON_GOLFCLUB",
	"wbody|WEAPON_KNIFE",
	"wbody|WEAPON_BAT",
	"wbody|WEAPON_POOLCUE",
	"wbody|WEAPON_MACHETE",
	"wbody|WEAPON_CROWBAR",
	"wbody|WEAPON_SWITCHBLADE",
	"wbody|WEAPON_KNUCKLE",
	"wbody|WEAPON_WRENCH",
	"wbody|WEAPON_HAMMER"
}

-- jails {x,y,z,radius}
cfg.jails = {
	{459.485870361328,-1001.61560058594,24.914867401123,2.1},
	{459.305603027344,-997.873718261719,24.914867401123,2.1},
	{459.999938964844,-994.331298828125,24.9148578643799,1.6}
}
-- fines
-- map of name -> money
cfg.fines = {
	["Forstyrrelse af embedsmand i funktion."] = 3000,
	["Hasarderet kørsel"] = 5000,
	["Manglende kørekort under kørsel"] = 1000,
	["Hærværk"] = 5000,
	["Besiddelse af våben uden tilladelse"] = 20000,
	["Voldelig optræden/slagsmål."] = 1500,
	["Gadeuorden"] = 1000
}

return cfg