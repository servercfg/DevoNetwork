local cfg = {}

-- define customization parts
local parts = {
	["Ansigt"] = 0,
	["Maske"] = 1,
	["Hår"] = 2,
	["Hånd"] = 3,
	["Vest"] = 9,
	["Bukser"] = 4,
	["T-Shirt"] = 8,
	["Sko"] = 6,
	["Jakke"] = 11,
	["Rygmærke"] = 10,
	["Hatte"] = "p0",
	["Briller"] = "p1",
	["Øre"] = "p2",
	["Ure"] = "p6"
}

-- changes prices (any change to the character parts add amount to the total price)
cfg.drawable_change_price = 50
cfg.texture_change_price = 50

-- skinshops list {parts,x,y,z,hidden}
cfg.skinshops = {
}

return cfg