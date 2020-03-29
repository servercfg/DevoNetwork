cfg = {}

cfg.blips = false -- enable blips

cfg.seconds = 300 -- seconds to rob

cfg.cooldown = 900 -- time between robbaries

cfg.cops = 2 -- minimum cops online
cfg.permission = "police.robbery" -- permission given to cops

cfg.holdups = { -- list of stores
	["paleto_twentyfourseven"] = {
		position = { ['x'] = 1734.48046875, ['y'] = 6420.38134765625, ['z'] = 35.1272314453125 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "7/11 (Paleto Bay)",
		lastrobbed = 0 -- this is always 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { ['x'] = 1960.8177490234, ['y'] = 3748.9423828125, ['z'] =32.343738555908},
		reward = 7500 + math.random(25000,50000),
		nameofstore = "7/11 (Sandy Shores)",
		lastrobbed = 0
	},
	["bar_one"] = {
		position = { ['x'] = 1986.1240234375, ['y'] = 3053.8747558594, ['z'] = 47.215171813965 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "Yellow Jack. (Sandy Shores)",
		lastrobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = { ['x'] = -709.17022705078, ['y'] = -904.21722412109, ['z'] = 19.215591430664 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "7/11 (Little Seoul)",
		lastrobbed = 0
	},
	["southlossantos_gasstop"] = {
		position = { ['x'] = 28.7538948059082, ['y'] = -1339.8212890625, ['z'] = 29.4970436096191 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "Limited LTD Tankstation. (South Los Santos)",
		lastrobbed = 0
	},
	["southlossantos_twentyfourseven"] = {
		position = { ['x'] = -43.1531448364258, ['y'] = -1748.75244140625, ['z'] = 29.4209976196289 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "7/11 (South Los Santos)",
		lastrobbed = 0
	},
	["vinewood_twentyfourseven"] = {
		position = { ['x'] = 378.030487060547, ['y'] = 332.944427490234, ['z'] = 103.566375732422 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "7/11 (Vinewood)",
		lastrobbed = 0
	},
	["sandyshores_twentyfourseven"] = {
		position = { ['x'] = 2673.32006835938, ['y'] = 3286.4150390625, ['z'] = 55.241138458252 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "7/11 (Sandy Shores)",
		lastrobbed = 0
	},
	["grapeseed_gasstop"] = {
		position = { ['x'] = 1707.52648925781, ['y'] = 4920.05126953125, ['z'] = 42.0636787414551 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "Limited LTD Tankstation. (Grapeseed)",
		lastrobbed = 0
	},
	["morningwood_robsliquor"] = {
		position = { ['x'] = -1479.22424316406, ['y'] = -375.097686767578, ['z'] = 39.1632804870605 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "Rob's Liquor. (Morning Wood)",
		lastrobbed = 0
	},
	["chumash_robsliquor"] = {
		position = { ['x'] = -2959.37524414063, ['y'] = 387.556365966797, ['z'] = 14.043158531189 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "Rob's Liquor. (Chumash)",
		lastrobbed = 0
	},
	["delperro_robsliquor"] = {
		position = { ['x'] = -1220.14123535156, ['y'] = -915.712158203125, ['z'] = 11.3261671066284 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "Rob's Liquor. (Del Perro)",
		lastrobbed = 0
	},
	["eastlossantos_gasstop"] = {
		position = { ['x'] = 1160.06237792969, ['y'] = -314.061828613281, ['z'] = 69.2050628662109 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "Limited LTD Tankstation. (East Los Santos)",
		lastrobbed = 0
	},
	["tongva_gasstop"] = {
		position = { ['x'] = -1829.00427246094, ['y'] = 798.903076171875, ['z'] = 138.186706542969 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "Limited LTD Tankstation. (Tongva Valley)",
		lastrobbed = 0
	},
	["tataviam_twentyfourseven"] = {
		position = { ['x'] = 2549.400390625, ['y'] = 385.048309326172, ['z'] = 108.622955322266 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = "7/11 (Tataviam Mountains)",
		lastrobbed = 0
	},
	["rockford_jewlery"] = {
		position = { ['x'] = -621.989135742188, ['y'] = -230.804443359375, ['z'] = 38.0570297241211 },
		reward = 7500 + math.random(25000,50000),
		nameofstore = " Vangelico Juvelbutik. (Rockford Hills)",
		lastrobbed = 0
	}
}