local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- title (optional): group display name
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["ledelse"] = {
    _config = {
		onjoin = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Ledelse rank tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onleave = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Ledelse rank frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end
	},
		"blacklisted.weapons",
		"blacklisted.vehicles",
		"player.group.add.staff",
		"player.group.remove.staff",
		"player.givemoney",
		"player.whitelist",
		"anticheese.bypass",
        "player.unwhitelist",
		"player.noclip",
		"player.giveitem",
		"player.ban",
		"vehicle.repair",
		"player.kick",
		"player.unban",
		"staff.seizable",
		"fire.start",
		"police.seize.items",
		"police.seize.weapons",
		"player.coords",
		"player.coordsnoheading",
		"admin.besked",
		"admin.revive",
		"player.unlockvehicle",
		"player.repairvehicle",
		"player.deletevehicle",
		"staff.gun",
		"player.spawnvehicle",
		"admin.easy_unjail",
		"admin.spikes",
		"player.tptowaypoint",
		"player.tptome",
		"player.tpto",
		"player.tptocoords",
		"player.freeze",
		"staff.chat",
		"admin.tickets",
		"player.list",
		"admin.godmode",
		"admin.revive",
		"ledelse.fix",
		"staff.revive",
		"Mekaniker.dv",
		"staff.chattitle"
  },
  ["OssieErSej"] = {
    _config = {
		onjoin = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "OssieErSej rank tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onleave = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "OssieErSej rank frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end
    },
		"player.ban",
		"player.unban",
	},
	["Hitman"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Hitman rank tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Hitman rank frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
			"hitman.door",
			"hitman.clothing",
			"hitman.weapon",
		},

    ["Admin"] = {
    _config = {
		onjoin = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Admin rank tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onleave = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Admin rank frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end
    },
		"player.deletevehicle",
		"player.ban",
        "player.unban",
		"player.group.add.staff",
		"player.group.remove.staff",
		"admin.besked",
		"player.coords",
		"admin.tickets",
		"anticheese.bypass",
		"staff.gun",
		"player.unlockvehicle",
		"admin.announce",
		"player.kick",
		"police.menu",
		"staff.seizable",
		"player.repairvehicle",
		"police.seize.weapons",
		"police.seize.items",
		"police.easy_cuff",
		"admin.revive",
		"player.tptowaypoint",
		"player.list",
		"player.tptome",
		"player.tptocoords",
		"player.tpto",
		"player.freeze",
		"staff.chat",
		"player.noclip",
		"admin.revive",
		"ledelse.fix",
		"staff.revive",
		"Mekaniker.dv",
		"staff.chattitle"
  },
  ["Staff"] = {
    _config = {
		onjoin = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Staff rank tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onleave = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Staff rank frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end
    },
		"player.deletevehicle",
		"player.ban",
		"admin.besked",
		"player.coords",
		"admin.tickets",
		"player.ban",
		"staff.gun",
		"anticheese.bypass",
		"player.unlockvehicle",
		"admin.announce",
		"player.kick",
		"police.menu",
		"staff.seizable",
		"player.repairvehicle",
		"police.seize.weapons",
		"police.seize.items",
		"police.easy_cuff",
		"admin.revive",
		"player.tptowaypoint",
		"player.list",
		"player.tptome",
		"player.tptocoords",
		"player.tpto",
		"player.freeze",
		"staff.chat",
		"player.noclip",
		"admin.revive",
		"ledelse.fix",
		"staff.revive",
		"Mekaniker.dv",
		"staff.chattitle"
  },
  ["Supporter"] = {
    _config = {
		onjoin = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Supporter rank tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onleave = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Supporter rank frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end
    },
		"admin.tickets",
		"player.deletevehicle",
		"admin.besked",
		"admin.revive",
		"player.coords",
		"admin.announce",
		"player.kick",
		"player.tptowaypoint",
		"anticheese.bypass",
		"player.list",
		"player.tptome",
		"player.tptocoords",
		"player.unlockvehicle",
		"player.tpto",
		"player.freeze",
		"staff.chat",
		"player.noclip",
		"staff.chattitle"
  },
    ["P-Supporter"] = {
    _config = {
		onjoin = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Prøve Supporter rank tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onleave = function(player) 
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Prøve Supporter rank frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end
    },
		"admin.tickets",
		"player.deletevehicle",
		"admin.besked",
		"admin.revive",
		"player.coords",
		"player.tptowaypoint",
		"anticheese.bypass",
		"player.list",
		"player.tptome",
		"player.tptocoords",
		"player.tpto",
		"staff.chat",
		"player.noclip",
		"staff.chattitle"
  },
    ["Whitelist"] = {
   "player.whitelist",
   "player.unwhitelist"
  },
      ["Ban"] = {
		"player.ban"
  },
      ["Gruppe"] = {
    "player.group.add.staff",
	"player.group.remove.staff"
  },
  -- the group user is auto added to all logged players
  ["user"] = {
    "player.phone",
    "player.calladmin",
    "player.coords",
    "police.askid",
    "police.store_weapons",
    "user.askid",
    "police.seizable", -- can be seized
	--"user.firstaid",
	"player.player_menu",
	"player.check",
    "player.store_armor",
    "player.store_weapons",
    "player.fix_haircut",
    "player.loot",
	"player.store_money",
	"player.strip",
	"player.drag",
	"player.putoutveh",
    "player.putinveh"
  },
    ["Barn"] = {
    "barn.cloakroom",
    "player.phone",
    "player.calladmin",
    "player.coords",
    "police.askid",
    "police.store_weapons",
    "user.askid",
    "police.seizable", -- can be seized
	--"user.firstaid",
	"player.player_menu",
	"player.check",
    "player.store_armor",
    "player.store_weapons",
    "player.fix_haircut",
    "player.loot",
	"player.store_money",
	"player.strip",
	"player.drag",
	"player.putoutveh",
    "player.putinveh"
  },
        ["Michael"] = {
    "michael.cloakroom",
    "player.phone",
    "player.calladmin",
    "player.coords",
    "police.askid",
    "police.store_weapons",
    "user.askid",
    "police.seizable", -- can be seized
	--"user.firstaid",
	"player.player_menu",
	"player.check",
    "player.store_armor",
    "player.store_weapons",
    "player.fix_haircut",
    "player.loot",
	"player.store_money",
	"player.strip",
	"player.drag",
	"player.putoutveh",
    "player.putinveh"
  },
      ["Trevor"] = {
    "trevor.cloakroom",
    "player.phone",
    "player.calladmin",
    "player.coords",
    "police.askid",
    "police.store_weapons",
    "user.askid",
    "police.seizable", -- can be seized
	--"user.firstaid",
	"player.player_menu",
	"player.check",
    "player.store_armor",
    "player.store_weapons",
    "player.fix_haircut",
    "player.loot",
	"player.store_money",
	"player.strip",
	"player.drag",
	"player.putoutveh",
    "player.putinveh"
  },
  ["EMS-Job"] = {
					_config = {
				gtype = "job",
				onjoin = function(player)
						TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu EMS.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				end,
				onspawn = function(player) end,
				onleave = function(player) vRPclient.stopMission(player) end
		},
	"emergency.revive",
	"player.deletevehicle",
	"emergency.shop",
	"emergency.service",
	"emergency.market",
	"emergency.putinveh",
	"emergency.besked",
	"emergency.getoutveh",
	"emergency.drag",
	"ems.doors",
	"emergency.heal",
	"emergency.garage",
	"emergency.cloakroom",
	"emergency.menu",
	"delivery.medic",
	"mission.emergency.transfer",
	"ems.whitelisted",
	"emergency.taser",
	"ems.loadshop"
},
  ["Politi-Job"] = {
				_config = {
				gtype = "job",
				onjoin = function(player)
						TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Politi.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				end,
				onspawn = function(player) end,
				onleave = function(player) vRPclient.stopMission(player) end
		},
	"cop.whitelisted",
	"ems.doors",
	"police.weapons"
},
["DBE Chef"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu DBE Chef.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
    "police.menu",
	"police_pc",
    "politi.market",
	"police.vehicle",
	"police.fine",
	"police.easy_jail",
	"police.menu_interaction",
	"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.seize.weapons",
    "police.seize.items",
    "police.seize.vehicles",
	"police.spikes",
	"dbe.doors",
    "police.drag",
	"police.license",
	"police.carsearch",
	"police.cprsearch",
	"police.service",
	"dbe.cloakroom",
	"dbe.cloakroom",
	"dbe.garage",
	"police.pc",
    "police.loadshop",
	"police.bodyarmor",
	"dbechef.paycheck",
	"police.weapons",
    "police.wanted",
    "police.announce",
	"police.cloakroom",
    "police.askid",
	"police.onduty"
  },
["DBE"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu DBE.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
    "police.menu",
	"police_pc",
    "politi.market",
	"police.vehicle",
	"police.fine",
	"police.easy_jail",
	"police.menu_interaction",
	"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.seize.weapons",
    "police.seize.items",
    "police.seize.vehicles",
	"police.spikes",
	"dbe.doors",
    "police.drag",
	"police.license",
	"police.carsearch",
	"police.cprsearch",
	"police.service",
	"dbe.cloakroom",
	"dbe.cloakroom",
	"dbe.garage",
	"police.pc",
    "police.loadshop",
	"police.bodyarmor",
	"dbe.paycheck",
	"police.weapons",
    "police.wanted",
    "police.announce",
	"police.cloakroom",
    "police.askid",
	"police.onduty"
  },
  ["AKS"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu AKS.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
    "police.menu",
	"police_pc",
    "politi.market",
	"police.vehicle",
	"police.fine",
	"police.easy_jail",
	"police.menu_interaction",
	"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.check",
    "police.seize.weapons",
    "police.seize.items",
    "police.seize.vehicles",
	"police.spikes",
    "police.drag",
	"police.license",
	"police.carsearch",
	"police.cprsearch",
	"police.service",
	"police.pc",
    "police.loadshop",
	"police.bodyarmor",
	"police.paycheck",
	"police.weapons",
    "police.wanted",
    "police.announce",
	"police.cloakroom",
    "police.askid",
    "-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
    "-police.store_weapons",
	"police.onduty"
  },
    ["Rigspolitichef"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Rigspolitichef.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
		"police.menu",
		"politi.ledelse.doors",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"police.easy_cuff",
		"police.easy_jail",
		"pd.key",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"politiledelse.paycheck",
		"police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
    ["Vicerigspolitichef"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Vicerigspolitichef.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
		"police.menu",
		"politi.ledelse.doors",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"pd.key",
		"police.easy_cuff",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"Vicerigspolitichef.paycheck",
		"police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
    ["Politidirektør"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Politidirektør.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
		"police.menu",
		"pd.key",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"police.easy_cuff",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"policedirector.paycheck",
		"police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
    ["Chefpolitiinspektør"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Chefpolitiinspektør.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
		"police.menu",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"police.easy_cuff",
		"pd.key",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"Chefpolitiinspekteer.paycheck",
		"police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
    ["Politiinspektør"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Politiinspektør.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
		"police.menu",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"police.easy_cuff",
		"pd.key",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"Politiinspekteer.paycheck",
		"police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
  ["Vicepolitiinspektør"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Vicepolitiinspektør.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
		"police.menu",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"pd.key",
		"bank.police",
		"police.announce",
		"police.check",
		"police.easy_cuff",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"Vicepolitiinspekteer.paycheck",
		"police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
    ["PolitiKommissær"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu PolitiKommissær.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_SMG = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
		"police.menu",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"pd.key",
		"police.announce",
		"police.check",
		"police.easy_cuff",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"PolitiKommisseer.paycheck",
		"police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
  ["Indsatsleder"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Indsatsleder.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
"police.menu",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"pd.key",
		"police.easy_cuff",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"Indsatsleder.paycheck",
	    "police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
  ["Politiassistent af 1. grad"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Politiassistent af 1. grad.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
"police.menu",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"pd.key",
		"police.easy_cuff",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"Politiassistent_af_1_grad.paycheck",
	    "police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
  ["Politiassistent"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Politiassistent.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
"police.menu",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"pd.key",
		"police.easy_cuff",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"Politiassistent.paycheck",
	    "police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
  ["Politibetjent"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Politibetjent.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
"police.menu",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"pd.key",
		"police.easy_cuff",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"Politibetjent.paycheck",
	    "police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
  ["Politielev"] = {
    _config = { 
		gtype = "Politi-Job",
		onjoin = function(player)
			vRPclient.setCop(player,{true})
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Politielev.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onspawn = function(player)
			vRPclient.setCop(player,{true})
			vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}}})
		end,
		onleave = function(player)
			vRPclient.setCop(player,{false})
			vRPclient.stopMission(player)
			vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
		end
    },
"police.menu",
		"police.putinveh",
		"politi.onduty",
		"police.carsearch",
		"player.deletevehicle",
		"police.bodyarmor",
		"bank.police",
		"police.announce",
		"police.check",
		"pd.key",
		"police.easy_cuff",
		"police.easy_jail",
		"police.easy_unjail",
		"police.getoutveh",
		"police.jail",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.seize.items",
		"police.seize.weapons",
		"police.fine",
		"police.service",
		"police.store_weapons",
		"police.store_money",
		"police.wanted",
		"police.besked",
		"police.drag",
		"police.easy_fine",
		"police.garage",
		"policeheli.garage",
		"police.loadshop",
		"police.menu_interaction",
		"police.spikes",
		"police.handcuff",
		"police.license",
		"Politielev.paycheck",
	    "police.cloakroom",
		"police.pc",
		"politi.duty",
		"police.weapons"
  },
	["Regionschef"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Regionschef.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"retsag.key",
		"emergency.besked",
		"emergency.getoutveh",
		"pd.key",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"regionschef.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
	["Viceregionschef"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Viceregionschef.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"retsag.key",
		"emergency.besked",
		"emergency.getoutveh",
		"pd.key",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"viceregionschef.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
	["Stationsleder"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Stationsleder.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"retsag.key",
		"emergency.besked",
		"emergency.getoutveh",
		"pd.key",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"stationsleder.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
	["Overlæge"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Overlæge.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"retsag.key",
		"emergency.besked",
		"emergency.getoutveh",
		"pd.key",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"overlaege.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
	["Paramedeciner"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Paramedeciner.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"retsag.key",
		"emergency.besked",
		"emergency.getoutveh",
		"pd.key",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"paramedeciner.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
	["Akutlæge"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Akutlæge.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"retsag.key",
		"emergency.besked",
		"emergency.getoutveh",
		"pd.key",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"akutlaege.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
	["Ambulanceredder"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Ambulanceredder.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"retsag.key",
		"emergency.besked",
		"emergency.getoutveh",
		"pd.key",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"ambulanceredder.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
	["AmbulanceElev"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu AmbulanceElev.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"retsag.key",
		"emergency.besked",
		"emergency.getoutveh",
		"pd.key",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"ambulanceelev.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
		["Viceregionschef"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Viceregionschef.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"pd.key",
		"emergency.besked",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"viceregionschef.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
		["Overlæge"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Overlæge.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"emergency.besked",
		"emergency.getoutveh",
		"pd.key",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"doctor.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
			["Læge"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Læge.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"pd.key",
		"emergency.shop",
		"emergency.service",
		"emergency.market",
		"emergency.putinveh",
		"emergency.besked",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"doctor.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
		["Paramediciner"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Paramediciner.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"pd.key",
		"emergency.market",
		"emergency.putinveh",
		"emergency.besked",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"paramediciner.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
		["Ambulanceredder"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Ambulanceredder.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"pd.key",
		"emergency.market",
		"emergency.putinveh",
		"emergency.besked",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"emergency.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
	["Ambulanceelev"] = {
		_config = {
			gtype = "EMS-Job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Ambulanceelev.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"player.deletevehicle",
		"emergency.shop",
		"emergency.service",
		"pd.key",
		"emergency.market",
		"emergency.putinveh",
		"emergency.besked",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.heal",
		"emergency.garage",
		"emergency.cloakroom",
		"emergencyelev.paycheck",
		"emergency.menu",
		"delivery.medic",
		"mission.emergency.transfer",
		"emergency.key",
		"ems.duty"
	},
	["Mekaniker"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Mekaniker.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"mekaniker.paycheck",
		"mekaniker.duty",
		"vehicle.repair",
		"mekaniker.adgang",
		"player.deletevehicle",
		"vehicle.replace",
		"repair.service",
		"repair.loadshop",
		"repair.besked",
		"repair.menu",
		"police.menu_interaction"
	},
	["Mekaniker Chef"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Mekaniker Chef.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"mekanikerchef.paycheck",
		"mekaniker.duty",
		"vehicle.repair",
		"mekaniker.adgang",
		"player.deletevehicle",
		"vehicle.replace",
		"repair.service",
		"repair.loadshop",
		"repair.besked",
		"repair.menu",
		"police.menu_interaction"
	},
		["Taxi Chauffør"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Taxi Chauffør.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"taxi.service",
		"taxi.garage",
		"taxi.paycheck",
		"taxi.besked",
		"mission.taxi.passenger"
	},
	["Burgershot Medarbejder"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Burgershot Medarbejder.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"burger.service",
		"burger.garage",
		"burger.paycheck",
		"mission.burger"
	},
	["Våbenhandler"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Våbenhandler.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"blacklisted.weapons",
		"weapons.dealer",
		"player.store_money",
		"våben.garage",
		"weapondealer.paycheck",
	},
		["Kriminel"] = {
		_config = {
	    gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Kriminel.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"kriminel.adgang",
		"nojob.paycheck"
	},
		["Advokat"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Advokat.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"advokat.paycheck",
		"retsag.key",
		"advokat.duty",
		"advokat.service",
	},
		["Miner"] = {
				_config = {
				gtype = "job",
				onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Miner.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"miner.adgang",
		"miner.paycheck"
	},

	["Skovhugger"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Skovhugger.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"skovhugger.tree",
		"miner.paycheck",
		"skovhugger.adgang"
	},
	["Skraldemand"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Skraldemand.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "skralde.vehicle",
	    "mission.skraldemand"
	},
	["Pizzabud"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Pizzabud.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"delivery.vehicle",
		"delivery.paycheck",
		"delivery.pizza"
	},
	["Farmer"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Farmer.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"farmer.farm",
	    "mission.farmer1",
	    "mission.farmer2"
	},
	["Lastbilchauffør"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Lastbilchauffør.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "delivery.trucker",
	    "trucker.vehicle",
		"trucker.paycheck"
	},
	["Hells Angels"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Hells Angels.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "hell.doors",
		"nojob.paycheck",
		"kriminel.adgang"
	},
	["Members Only"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Members Only.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "only.doors",
		"nojob.paycheck",
		"kriminel.adgang"
	},
	["Cartel"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Cartel.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "cartel.doors",
		"nojob.paycheck",
		"kriminel.adgang",
		"cartel.market"
	},
	["Lost Medlem"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Lost MC.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "lost.doors",
		"nojob.paycheck",
		"kriminel.adgang",
		"lost.market"
	},

	["Lost Ledelse"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu ledelse af Lost MC.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "lost.doors",
		"nojob.paycheck",
		"kriminel.adgang",
		"lost.ledelse",
		"lost.market"
	},

	["Ballas"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Ballas.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "ballas.doors",
		"nojob.paycheck",
		"kriminel.adgang",
	},
	["VatozLocos"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af VatozLocos.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"nojob.paycheck",
		"kriminel.adgang",
	},
	["Mafia"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Mafia.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "mafia.doors",
		"nojob.paycheck",
		"kriminel.adgang",
	},
	["MS-13"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af MS-13.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "ms13.doors",
		"nojob.paycheck",
		"kriminel.adgang",
	},
	["Royal Reapers"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Royal Reapers.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
	    "rr.doors",
		"nojob.paycheck",
		"kriminel.adgang",
	},
	["Bandidos"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Bandidos.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"nojob.paycheck",
		"kriminel.adgang",
	},
	["Black Army"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu medlem af Black Army.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"ba.paycheck",
		"kriminel.adgang",
	},
	["Auto Genbrug"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
		    TriggerClientEvent("pNotify:SendNotification", player,{text = "Du arbejder nu for Auto Genbrug.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
	},
	"auto.paycheck",
	},
	["Bilforhandler"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu en Bilforhandler.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"bilforhandler.duty",
		"bilforhandler.doors",
		"bilforhandler.paycheck",
		"player.spawnvehicle",
		"player.deletevehicle",
		"admin.bilforhandler",
	},
	["Bar Arbejder"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Bar Arbejder.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"nojob.paycheck",
		"kriminel.adgang",
		"stripklubben.doors"
	},
	["DVS"] = {
        _config = {
        gtype = "job",
         onjoin = function(player)
            TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu DVS.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end,
        onspawn = function(player) end,
	    onleave = function(player) vRPclient.stopMission(player) end
        },
        "dvs.cloakroom",
		"dvs.garage",
		"dvs.shop",
		"dvs.loadshop",
		"police.weapons",
		"dvs.paycheck",
		"dvs.doors",
	    "ems.doors"
    },
	["Arbejdsløs"] = {
		_config = {
		gtype = "job",
		onjoin = function(player)
			TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu Arbejdsløs.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end,
		onspawn = function(player) end,
		onleave = function(player) vRPclient.stopMission(player) end
		},
		"nojob.paycheck",
	}
}


-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
	[1] = { -- give superadmin and admin group to the first created user on the database
		"ledelse",
		"staff"
	}
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
	["Jobcenter"] = {
		_config = {x = 478.90264892578, y = -107.40859985352, z = 63.157897949219, blipid = 181, blipcolor = 4},
		"Taxi Chauffør",
		"Farmer",
		"Pizzabud",
		"Skraldemand",
		"Lastbilchauffør",
		"Burgershot Medarbejder",
		"Skovhugger",
		"Miner",
		"Kriminel",
		"Arbejdsløs"
	},
	["Politistation Los Santos"] = {
		_config = {x = 454.47848510742, y = -988.86291503906, z = 30.689605712891, blipid = 0, blipcolor = 0, permissions = {"cop.whitelisted"} },
		"Rigspolitichef",
		"Vicerigspolitichef",
		"Politidirektør",
		"Chefpolitiinspektør",
		"Politiinspektør",
		"VicePolitiinspektør",
		"PolitiKommissær",
		"Indsatsleder",
		"Politiassistent af 1. grad",
		"Politiassistent",
		"Politibetjent",
		"Politielev",
		"Arbejdsløs"
	},
	["Politistation Paleto Bay"] = {
		_config = {x =-436.83581542969, y = 6010.0556640625, z = 31.616243743896, blipid = 0, blipcolor = 0, permissions = {"cop.whitelisted"} },
		"Rigspolitichef",
		"Vicerigspolitichef",
		"Politidirektør",
		"Chefpolitiinspektør",
		"Politiinspektør",
		"VicePolitiinspektør",
		"PolitiKommissær",
		"Indsatsleder",
		"Politiassistent af 1. grad",
		"Politiassistent",
		"Politibetjent",
		"Politielev",
		"Arbejdsløs"
	},
	["Politistation Sandy Shores"] = {
		_config = {x = 1850.4310302734, y = 3685.8908691406, z = 34.286609649658, blipid = 0, blipcolor = 0, permissions = {"cop.whitelisted"} },
		"Rigspolitichef",
		"Vicerigspolitichef",
		"Politidirektør",
		"Chefpolitiinspektør",
		"Politiinspektør",
		"VicePolitiinspektør",
		"PolitiKommissær",
		"Indsatsleder",
		"Politiassistent af 1. grad",
		"Politiassistent",
		"Politibetjent",
		"Politielev",
		"Arbejdsløs"
	},
	["Hospital Los Santos"] = {
		_config = {x = 312.9475402832, y = -594.51129150391, z = 43.283985137939, blipid = 0, blipcolor = 0, permissions = {"ems.whitelisted"} },
		"Regionschef",
		"Viceregionschef",
		"Stationsleder",
		"Overlæge",
		"Paramedeciner",
		"Akutlæge",
		"Ambulanceredder",
		"AmbulanceElev",
		"Arbejdsløs"
	},
		["Hospital Paleto Bay"] = {
		_config = {x = -262.66879272461, y = 6311.8735351563, z = 32.436370849609, blipid = 0, blipcolor = 0, permissions = {"ems.whitelisted"} },
		"Regionschef",
		"Viceregionschef",
		"Stationsleder",
		"Overlæge",
		"Paramedeciner",
		"Akutlæge",
		"Ambulanceredder",
		"AmbulanceElev",
		"Arbejdsløs"
	}
}

return cfg