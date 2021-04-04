local cfg = {}
-- LANG -- 
cfg.lang = {
  hoveringTextStart = "Tryk ~g~E~s~ for at samle ~r~",
  hoveringTextStop = "Tryk ~g~K~s~ for at stoppe med at samle ~r~",
  invehicle = "Stig ud af bilen for at høste"
}
-- LANG -- 

-- BUTTONS --
cfg.buttons = {
  start = 38, -- E
  stop = 311 -- K
}
-- BUTTONS --

-- ZONES --
-- pastebin.com/6mrYTdQv Scenarios
cfg.area_size = 3.0 -- Needs to be [number.0]
cfg.marker_size = 6.0 -- Needs to be [number.0]
cfg.marker_visibledist = 20
cfg.zone_types = {
  ["Skunk Farm"]  = { -- Has to be the same as the [cfg.zones_pos]
    _config = {animation="PROP_HUMAN_PARKING_METER"},
  },
  ["Kokainblad Farm"]  = { -- Has to be the same as the [cfg.zones_pos]
    _config = {animation="PROP_HUMAN_PARKING_METER"},
  },
  ["Opiumvalmue Farm"]  = { -- Has to be the same as the [cfg.zones_pos]
    _config = {animation="PROP_HUMAN_PARKING_METER"},
  }
}

cfg.zones_pos = {
  {"Skunk Farm",2224.2399902344,5577.0249023438,52.851993560791},
  {"Kokainblad Farm",2287.0676269531,4763.7192382813,37.800},
  {"Opiumvalmue Farm",-1691.7947998047,1959.1016845703,131.652}
}
-- ZONES --

return cfg

