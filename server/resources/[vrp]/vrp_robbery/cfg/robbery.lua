cfg = {}

cfg.blips = false -- enable blips

cfg.seconds = 900 -- seconds to rob

cfg.cooldown = 3600 -- time between robbaries

cfg.cops = 4 -- minimum cops online
cfg.permission = "police.robbery" -- permission given to cops

cfg.banks = { -- list of banks
	["fleeca"] = { 
	  position = {['x']=147.04908752441,['y']=-1044.9448242188,['z']=29.36802482605}, 
	  nameofbank = "Fleeca Bank (Centrum)",
	  reward = 30000 + math.random(200000,400000),
		lastrobbed = 0
	},
	["fleeca2"] = { 
	  position = {['x'] = -2957.6674804688,['y']=481.45776367188,['z']=15.697026252747}, 
	  nameofbank = "Fleeca Bank (Motorvej)", 
	  reward = 15000 + math.random(200000,400000),
		lastrobbed = 0
	},
	["fleeca3"] = {
      position = {['x'] = -1211.99548,['y']=-336.12524,['z']=37.79077},
      nameofbank = "Fleeca Bank (Vinewood Hills)",  
      reward = 17500 + math.random(200000,400000),
      lastrobbed = 0
	},
    ["fleeca4"] = {
      position = {['x'] = -354.452575683594,['y']=-53.8204879760742,['z']=49.0463104248047},
      nameofbank = "Fleeca Bank (Burton)",
      reward = 17500 + math.random(200000,400000),
      lastrobbed = 0
	},
    ["fleeca5"] = {
      position = {['x'] = 309.967376708984,['y']=-283.033660888672,['z']=54.1745223999023},
      nameofbank = "Fleeca Bank (Alta)",
      reward = 17500 + math.random(200000,400000),
      lastrobbed = 0
	},
	["fleeca6"] = {
      position = {['x'] = 1176.86865234375,['y']=2711.91357421875,['z']=38.097785949707},
      nameofbank = "Fleeca Bank (Desert)",
      reward = 17500 + math.random(200000,400000),
      lastrobbed = 0
	},
	["blainecounty"] = { 
	  position = {['x'] = -107.06505584717,['y']=6474.8012695313,['z']=31.62670135498}, 
	  nameofbank = "Blaine County Savings (Paleto Bay)", 
	  reward = 17500 + math.random(200000,400000),
	  lastrobbed = 0
	},
	["pacific"] = { 
	  position = {['x']=263.15411376953,['y']=214.57843017578,['z']=101.68337249756}, 
	  nameofbank = "Nationalbanken", 
	  reward = 100000 + math.random(500000,1500000),
	  lastrobbed = 0
	}
}