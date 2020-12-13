
local cfg = {}

-- minimum capital to open a business
cfg.minimum_capital = 500000

-- capital transfer reset interval in minutes
-- default: reset every 24h
cfg.transfer_reset_interval = 24*60

-- commerce chamber {blipid,blipcolor}
cfg.blip = {408,69}

-- positions of commerce chambers
cfg.commerce_chambers = { --{x,y,z,showblip}
	{-125.87933349609,-640.81408691406,168.82032775879,false}
}


return cfg
