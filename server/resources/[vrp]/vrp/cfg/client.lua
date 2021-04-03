-- client-side vRP configuration

local cfg = {}

cfg.iplload = true

cfg.voice_proximity = 8.0 -- default voice proximity (outside)
cfg.voice_proximity_vehicle = 8.0
cfg.voice_proximity_inside = 8.0

cfg.gui = {
  anchor_minimap_width = 0,
  anchor_minimap_left = 0,
  anchor_minimap_bottom = 0,
  anchor_health_width = 0,
  anchor_health_left = 0,
  anchor_health_bottom = 0
}

-- gui controls (see https://wiki.fivem.net/wiki/Controls)
-- recommended to keep the default values and ask players to change their keys
cfg.controls = {
  phone = {
    -- PHONE CONTROLS
    up = {3,172},
    down = {3,173},
    left = {3,174},
    right = {3,175},
    select = {3,176},
    cancel = {3,177},
    open = {3,56} -- INPUT_PHONE, open general menu F9
  },
  request = {
    yes = {1,166}, -- Michael, F5
    no = {1,167} -- Franklin, F6
  }
}

-- disable menu if handcuffed
cfg.handcuff_disable_menu = true

-- when health is under the threshold, player is in coma
-- set to 0 to disable coma
cfg.coma_threshold = 100

-- maximum duration of the coma in minutes
cfg.coma_duration = 10

-- if true, a player in coma will not be able to open the main menu
cfg.coma_disable_menu = false

-- see https://wiki.fivem.net/wiki/Screen_Effects
cfg.coma_effect = "DeathFailMPIn"

-- if true, vehicles can be controlled by others, but this might corrupts the vehicles id and prevent players from interacting with their vehicles
cfg.vehicle_migration = true

return cfg