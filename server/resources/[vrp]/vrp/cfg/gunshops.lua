
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {


	["Golfklubben"] = {
		_config = {blipid=109,blipcolor=49},
		["WEAPON_GOLFCLUB"] = {"Golf kølle", 1500,0,""}
	}
}
-- list of gunshops positions

cfg.gunshops = {
	{"Golfklubben", -1366.7252197266,56.652606964111,54.098461151123,true}
}

return cfg
