
local cfg = {}

-- exp notes:
-- levels are defined by the amount of xp
-- with a step of 5: 5|15|30|50|75 (by default)
-- total exp for a specific level, exp = step*lvl*(lvl+1)/2
-- level for a specific exp amount, lvl = (sqrt(1+8*exp/step)-1)/2

-- define groups of aptitudes
--- _title: title of the group
--- map of aptitude => {title,init_exp,max_exp}
---- max_exp: -1 for infinite exp
cfg.gaptitudes = {
	["physical"] = {
		_title = "Fysik",
		["strength"] = {"Styrke", 30, 105} -- required, level 3 to 6 (by default, can carry 10kg per level)
	},
	["science"] = {
		_title = "Viden",
		--["chemicals"] = {"Studere kemikalier", 0, -1}, -- example
		--["mathematics"] = {"Studere matematik", 0, -1}, -- example
		["mechanic"] = {"Reparation af køretøj", 0, 30} -- example
	}
}

return cfg
