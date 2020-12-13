cfg = {}
cfg.showself = false -- True: shows your own id and blip
cfg.distance = 15 -- Max distance for id

cfg.default = {r = 255, g = 255, b = 255} -- Colors for default id
cfg.talker = {r = 255, g = 255, b = 255} -- Colors for talker id

cfg.showteam = false -- True: shows team colored id to everyone, not just team members
cfg.hideteam = false -- True: hides team colored id to everyone, make them use the cfg.default color for id
cfg.blips = { -- Groups blip display (set the teams in cfg/blips.lua)
 
 ["Politi-Job"] = {
    id = {r = 54, g = 155, b = 240}, -- Colors for group id and vrp_cmd team chat color
	sprite = 1, -- Sprite for group blip
	colour = 38, -- Colour for group blip
	distance = 999999 -- Max distance for group blip
  },
  ["EMS-Job"] = {
    id = {r = 240, g = 54, b = 54},
	sprite = 1,
	colour = 1,
	distance = 999999
  },
}

-- Link for blip colours: http://i.imgur.com/Hvyx6cE.png
-- Link for blip sprites: https://marekkraus.sk/gtav/blips/list.html