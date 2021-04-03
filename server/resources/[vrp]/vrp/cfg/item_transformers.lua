
local cfg = {}

-- define static item transformers
-- see https://github.com/ImagicTheCat/vRP to understand the item transformer concept/definition

cfg.item_transformers = {
	---------------------------------------STYRKETRÆNING / FITNESS---------------------------------------
	{
		name="Styrketræning", -- menu name
		r=255,g=125,b=0, -- color
		max_units=500,
		units_per_minute=100,
		x=-1202.96252441406,y=-1566.14086914063,z=4.61040639877319,
		radius=7.5, height=1.5, -- area
		recipes = {
			["Træn styrke"] = { -- action name
				description="Øger din styrke. Maks styrke du kan løfte er 60 KG", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={}, -- items taken per unit
				products={}, -- items given per unit
				aptitudes={ -- optional
					["physical.strength"] = 0.4 -- "group.aptitude", give 1 exp per unit  -- -1196.8203125,-891.90307617188,13.995157241821
				}
			}
		}
	},
	{
		name="Styrketræning", -- menu name 
		r=255,g=125,b=0, -- color
		max_units=500,
		units_per_minute=100,
		x=-232.18557739258,y=6266.46875,z=31.489267349243,
		radius=7.5, height=1.5, -- area
		recipes = {
			["Træn styrke"] = { -- action name
				description="Øger din styrke. Maks styrke du kan løfte er 60 KG", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={}, -- items taken per unit
				products={}, -- items given per unit
				aptitudes={ -- optional
					["physical.strength"] = 0.4 -- "group.aptitude", give 1 exp per unit
				}
			}
		}
	},
		{
		name="Styrketræning", -- menu name
		r=255,g=125,b=0, -- color
		max_units=500,
		units_per_minute=100,
		x=1641.8634033203,y=2530.0207519531,z=45.564880371094,
		radius=10, height=1.5, -- area
		recipes = {
			["Træn styrke"] = { -- action name
				description="Øger din styrke. Maks styrke du kan løfte er 60 KG", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={}, -- items taken per unit
				products={}, -- items given per unit
				aptitudes={ -- optional
					["physical.strength"] = 0.4 -- "group.aptitude", give 1 exp per unit
				}
			}
		}
	},
			{
		name="Styrketræning", -- menu name
		r=255,g=125,b=0, -- color
		max_units=500,
		units_per_minute=100,
		x=1668.23046875,y=2578.7934570313,z=45.587001800537,
		radius=3, height=1.5, -- area
		recipes = {
			["Træn styrke"] = { -- action name
				description="Øger din styrke. Maks styrke du kan løfte er 60 KG", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={}, -- items taken per unit
				products={}, -- items given per unit
				aptitudes={ -- optional
					["physical.strength"] = 0.4 -- "group.aptitude", give 1 exp per unit
				}
			}
		}
	},

	---------------------------------------SALG AF SKUNK---------------------------------------
	--[[{
		name="Salg af Skunk", -- menu name
		permissions = {"kriminel.adgang"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=500,
		x=140.55741882324,y=-1920.6635742188,z=21.006200790405,
		radius=2, height=1.5, -- area
		recipes = {
			["Sælg Skunk"] = { -- action name
				description="Sælger Skunk til kriminelle", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["skunk"] = 1
				}, -- items taken per unit
				products={
					["dirty_money"] = 200
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},]]
	{
		name="Salg af Skunk", -- menu name
		permissions = {"kriminel.adgang"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=500,
		x=227.24546813965,y=-1983.5355224609,z=19.717468261719,
		radius=2, height=1.5, -- area
		recipes = {
			["Sælg Skunk"] = { -- action name
				description="Sælger Skunk til kriminelle", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["skunk"] = 1
				}, -- items taken per unit
				products={
					["dirty_money"] = 200
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},


	---------------------------------------KOKAIN SALG---------------------------------------
	--[[{
		name="Salg af Kokain", -- menu name
		permissions = {"kriminel.adgang"},
		r=0,g=255,b=0, -- color
		max_units=2000,
		units_per_minute=50,
		x=137.48420715332,y=314.54223632813,z=112.13865661621,
		radius=5, height=1.5, -- area
		recipes = {
			["Sælg Kokain"] = { -- action name
				description="Sælger Kokain, til kriminelle", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["kokain"] = 1
				}, -- items taken per unit
				products={
					["dirty_money"] = 400

				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},]]
	---------------------------------------HAK STÅL--------------------------------------
	{
		name="Stål", -- menu name
		permissions = {"miner.adgang"},
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=2947.2155761719,y=2726.4255371094,z=47.437828063965,
		radius=3, height=1.5, -- area
		recipes = {
			["Hak Stål"] = { -- action name
				description="Hakker Stål", -- action description
				work=2,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={

				}, -- items taken per unit
				products={
					["steel"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	---------------------------------------Våben craft--------------------------------------
	-- Frame
	{
		name="Våben rammer", -- menu name
		permissions = {"weapons.dealer"},
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=884.07495117188,y=-3207.4787597656,z=-98.196212768555,
		radius=1, height=1.5, -- area
		recipes = {
			["Lav SNS Ramme"] = { -- action name
				description="Laver SNS Ramme", -- action description
				work=14,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 14,
					["stainless"] = 6
				}, -- items taken per unit
				products={
					["snsframe"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Pistol Ramme"] = { -- action name
				description="Laver Pistol Ramme", -- action description
				work=16,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 18,
					["stainless"] = 8
				}, -- items taken per unit
				products={
					["pistolframe"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Heavy Pistol Ramme"] = { -- action name
				description="Laver Heavy Pistol Ramme", -- action description
				work=18,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["guldbar"] = 5,
					["aluminiumbar"] = 24,
					["stainless"] = 10
				}, -- items taken per unit
				products={
					["heavypistolframe"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Pistol .50 Ramme"] = { -- action name
				description="Laver Pistol .50 Ramme", -- action description
				work=20,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 30,
					["stainless"] = 12
				}, -- items taken per unit
				products={
					["pistol50frame"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	-- Barrel
	{
		name="Våben løb", -- menu name
		permissions = {"weapons.dealer"},
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=887.48895263672,y=-3209.7124023438,z=-98.196220397949,
		radius=1, height=1.5, -- area
		recipes = {
			["Lav SNS Løb"] = { -- action name
				description="Laver SNS Løb", -- action description
				work=14,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 8,
					["stainless"] = 1
				}, -- items taken per unit
				products={
					["snsbarrel"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Pistol Løb"] = { -- action name
				description="Laver Pistol Løb", -- action description
				work=16,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 12,
					["stainless"] = 2
				}, -- items taken per unit
				products={
					["pistolbarrel"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Heavy Pistol Løb"] = { -- action name
				description="Laver Heavy Pistol Løb", -- action description
				work=18,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 12,
					["stainless"] = 3
				}, -- items taken per unit
				products={
					["heavypistolbarrel"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Pistol .50 Løb"] = { -- action name
				description="Laver Pistol .50 Løb", -- action description
				work=20,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 18,
					["stainless"] = 4
				}, -- items taken per unit
				products={
					["pistol50barrel"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	-- Trigger
	{
		name="Våben aftrækker", -- menu name
		permissions = {"weapons.dealer"},
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=888.76751708984,y=-3207.2253417969,z=-98.196212768555,
		radius=1, height=1.5, -- area
		recipes = {
			["Lav SNS Aftrækker"] = { -- action name
				description="Laver SNS Aftrækker", -- action description
				work=14,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 3,
					["stainless"] = 3
				}, -- items taken per unit
				products={
					["snstrigger"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Pistol Aftrækker"] = { -- action name
				description="Laver Pistol Aftrækker", -- action description
				work=16,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 4,
					["stainless"] = 3
				}, -- items taken per unit
				products={
					["pistoltrigger"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Heavy Pistol Aftrækker"] = { -- action name
				description="Laver Heavy Pistol Aftrækker", -- action description
				work=18,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 4,
					["stainless"] = 3
				}, -- items taken per unit
				products={
					["heavypistoltrigger"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Pistol .50 Aftrækker"] = { -- action name
				description="Laver Pistol .50 Aftrækker", -- action description
				work=20,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["aluminiumbar"] = 5,
					["stainless"] = 3
				}, -- items taken per unit
				products={
					["pistol50trigger"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	-- Crafting
	{
		name="Våben samling", -- menu name
		permissions = {"weapons.dealer"},
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=884.93872070313,y=-3199.9479980469,z=-98.196197509766,
		radius=1, height=1.5, -- area
		recipes = {
			["Saml SNS"] = { -- action name
				description="Saml SNS", -- action description
				work=100,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["snsframe"] = 1,
					["snsbarrel"] = 1,
					["snstrigger"] = 1,
				}, -- items taken per unit
				products={
					["wbody|WEAPON_SNSPISTOL"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Saml Pistol"] = { -- action name
				description="Saml Pistol", -- action description
				work=120,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["pistolframe"] = 1,
					["pistolbarrel"] = 1,
					["pistoltrigger"] = 1,
				}, -- items taken per unit
				products={
					["wbody|WEAPON_PISTOL"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Saml Heavy Pistol"] = { -- action name
				description="Saml Heavy Pistol", -- action description
				work=140,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["heavypistolframe"] = 1,
					["heavypistolbarrel"] = 1,
					["heavypistoltrigger"] = 1,
				}, -- items taken per unit
				products={
					["wbody|WEAPON_HEAVYPISTOL"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Saml Pistol .50"] = { -- action name
				description="Saml Pistol .50", -- action description
				work=160,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["pistol50frame"] = 1,
					["pistol50barrel"] = 1,
					["pistol50trigger"] = 1,
				}, -- items taken per unit
				products={
					["wbody|WEAPON_PISTOL50"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	-- Crafting Ammo
	{
		name="Våben ammunition", -- menu name
		permissions = {"weapons.dealer"},
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=891.794921875,y=-3197.0197753906,z=-98.196197509766,
		radius=1, height=1.5, -- area
		recipes = {
			["Lav SNS Ammo"] = { -- action name
				description="Laver SNS Ammo", -- action description
				work=14,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["gunpowder"] = 4,
					["steel"] = 2,
				}, -- items taken per unit
				products={
					["wammo|WEAPON_SNSPISTOL"] = 50
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Pistol Ammo"] = { -- action name
				description="Laver Pistol Ammo", -- action description
				work=16,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["gunpowder"] = 6,
					["steel"] = 3,
				}, -- items taken per unit
				products={
					["wammo|WEAPON_PISTOL"] = 50
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Heavy Pistol Ammo"] = { -- action name
				description="Laver Pistol Ammo", -- action description
				work=18,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["gunpowder"] = 8,
					["steel"] = 4,
				}, -- items taken per unit
				products={
					["wammo|WEAPON_HEAVYPISTOL"] = 50
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav Pistol .50 Ammo"] = { -- action name
				description="Laver Pistol .50 Ammo", -- action description
				work=20,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["gunpowder"] = 10,
					["steel"] = 5,
				}, -- items taken per unit
				products={
					["wammo|WEAPON_PISTOL50"] = 50
				}, -- items given per unit
				aptitudes={ -- optional

				}
			},
			["Lav sortkrudt"] = { -- action name
				description="Laver sortkrudt", -- action description
				work=3,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["sulfur"] = 2,
					["kul"] = 1,
				}, -- items taken per unit
				products={
					["gunpowder"] = 1,
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	{
		name="Svovl", -- menu name
		permissions = {"miner.adgang"},
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=2980.8439941406,y=2789.3623046875,z=40.735729217529,
		radius=3, height=1.5, -- area
		recipes = {
			["Hak svovl"] = { -- action name
				description="Hakker svovl", -- action description
				work=2,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={

				}, -- items taken per unit
				products={
					["sulfur"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	---------------------------------------HAK GULD---------------------------------------
	{
		name="Guldore", -- menu name
		permissions = {"miner.adgang"},
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=2936.8337402344,y=2744.1533203125,z=43.41520690918,
		radius=3, height=1.5, -- area
		recipes = {
			["Hak Guldore"] = { -- action name
				description="Hakker Guldore", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={

				}, -- items taken per unit
				products={
					["guldmalm"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	---------------------------------------Smelt metal---------------------------------------
	{
		name="Smelt metal", -- menu name'
		permissions = {"miner.adgang"},
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=20,
		x=1087.8717041016,y=-2001.9053955078,z=30.880701065063,
		radius=5, height=1.5, -- area
		recipes = {
			["Lav rustfri stål"] = { -- action name
				description="Laver rustfri stål", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["steel"]=2,
					["chromium"]=1,
					["nickel"]=1
				}, -- items taken per unit
				products={
					["stainless"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	---------------------------------------PLUK VINDRUER---------------------------------------
	{
		name="Vindruer", -- menu name
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=-1868.3781738281,y=2177.0966796875,z=113.31826019287,
		radius=5, height=1.5, -- area
		recipes = {
			["Pluk Vindruer"] = { -- action name
				description="Plukker vindruer", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
				}, -- items taken per unit
				products={
					["vindruer"] = 10
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	---------------------------------------SALG AF VINDRUER---------------------------------------
	{
		name="Sælg Vindruer", -- menu name
		r=0,g=255,b=0, -- color
		max_units=1000,
		units_per_minute=50,
		x=1087.6127929688,y=6508.7119140625,z=21.055513381958,
		radius=5, height=1.5, -- area
		recipes = {
			["Sælg Vindruer"] = { -- action name
				description="Sælger vindruer", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=120, -- money earned per unit
				reagents={
					["vindruer"] = 10
				}, -- items taken per unit
				products={
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	---------------------------------------HUG TRÆ---------------------------------------
	{
		name="Hug træ", -- menu name
		permissions = {"skovhugger.adgang"},
		r=0,g=255,b=0, -- color
		max_units=200,
		units_per_minute=5,
		x=-1586.6834716797,y=4700.263671875,z=45.322353363037,
		radius=7.5, height=1.5, -- area
		recipes = {
			["Hugger træer"] = { -- action name
				description="Hugger træ", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
				}, -- items taken per unit
				products={
					["træ"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	---------------------------------------LAV PLANKER---------------------------------------
	{
		name="Lav Planker", -- menu name
		permissions = {"skovhugger.adgang"},
		r=0,g=255,b=0, -- color
		max_units=200,
		units_per_minute=5,
		x=-525.5380859375,y=5290.7846679688,z=74.174438476563,
		radius=5, height=1.5, -- area
		recipes = {
			["Laver Planker"] = { -- action name
				description="Laver Planker", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={
					["træ"] = 2
				}, -- items taken per unit
				products={
					["planke"] = 1
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},
	---------------------------------------SÆLG PLANKER---------------------------------------
	{
		name="Sælg Planker", -- menu name
		permissions = {"skovhugger.adgang"},
		r=0,g=255,b=0, -- color
		max_units=200,
		units_per_minute=5,
		x=27.032907485962,y=3636.0126953125,z=40.029407501221,
		radius=5, height=1.5, -- area
		recipes = {
			["Sælg Planker"] = { -- action name
				description="Sælg Planker", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=200, -- money earned per unit
				reagents={
					["planke"] = 1
				}, -- items taken per unit
				products={
				}, -- items given per unit
				aptitudes={ -- optional

				}
			}
		}
	},

	---------------------------------------FÆLD TRÆER 1---------------------------------------
	{
		name="Fæld træer 1",
		permissions = {"skovhugger.adgang"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=35,
		x=-471.65469360352,y=5579.6635742188,z=71.06226348877,
		radius=12, height=4,
		recipes = {
			["Fæld træet"] = {
				description="Fæld træet her",
				work=1,
				in_money=0,
				out_money=0,
				reagents={},
				products={
					["logs"] = 2
				}, -- items given per unit
				aptitudes={

				}
			}
		}
	},
	---------------------------------------FÆLD TRÆER 2---------------------------------------
	{
		name="Fæld træer 2",
		permissions = {"skovhugger.adgang"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=35,
		x=-556.00494384766,y=5852.3452148438,z=32.465419769287,
		radius=12, height=4,
		recipes = {
			["Fæld træet"] = {
				description="Fæld træet her",
				work=1,
				in_money=0,
				out_money=0,
				reagents={
				},
				products={
					["logs"] = 3
				}, -- items given per unit
				aptitudes={

				}
			}
		}
	},
	---------------------------------------FÆLD TRÆER (HEMMELIG)---------------------------------------
	{
		name="Fæld træer 3 (Hemmelig)",
		permissions = {"skovhugger.adgang"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=35,
		x=-618.98742675781,y=5942.626953125,z=21.707723617554,
		radius=12, height=4,
		recipes = {
			["Fæld træet"] = {
				description="Fæld træet her",
				work=1,
				in_money=0,
				out_money=0,
				reagents={
				},
				products={
					["logs"] = 6
				}, -- items given per unit
				aptitudes={
				}
			}
		}
	},
	---------------------------------------OMSÆRING AF TRÆ (HEMMELIG)---------------------------------------
	{
		name="Omskær træ 1 (Hemmelig)",
		permissions = {"skovhugger.adgang"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=35,
		x=-475.5412902832,y=5304.0541992188,z=86.496353149414,
		radius=12, height=4,
		recipes = {
			["Omskær træet"] = {
				description="omskær træet her",
				work=1,
				in_money=0,
				out_money=0,
				reagents={
					["logs"] = 2
				},
				products={
					["fplanke"] = 6
				}, -- items given per unit
				aptitudes={
				}
			}
		}
	},
	---------------------------------------OMSKÆRING AF TRÆ---------------------------------------
	{
		name="Omskær træ 1",
		permissions = {"skovhugger.adgang"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=35,
		x=-532.38616943359,y=5293.0532226563,z=74.195243835449,
		radius=12, height=4,
		recipes = {
			["Omskær træet"] = {
				description="omskær træet her",
				work=1,
				in_money=0,
				out_money=0,
				reagents={
					["logs"] = 2
				},
				products={
					["fplanke"] = 4
				}, -- items given per unit
				aptitudes={
				}
			}
		}
	},
	---------------------------------------SALG AF TRÆ---------------------------------------
	{
		name="Sælg træ ",
		permissions = {"skovhugger.adgang"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=35,
		x=-307.99395751953,y=-1198.5562744141,z=24.629217147827,
		radius=12, height=4,
		recipes = {
			["Sælg træet"] = {
				description="sælg træet her",
				work=1,
				in_money=0,
				out_money=4000,
				reagents={
					["fplanke"] = 5
				},
				products={}, -- items given per unit
				aptitudes={
				}
			}
		}
	},
	---------------------------------------GENBRUG MEKANIKER ROD---------------------------------------

	{
		name="Genbrug mekaniker rod", -- menu name
		permissions = {"mekaniker.adgang"},
		r=255,g=255,b=255, -- color
		max_units=1000,
		units_per_minute=1000,
		x=-467.84881591797,y=-1717.9417724609,z=18.689134597778,
		radius=2, height=1.5, -- area
		recipes = {
			["Genbruger rod"] = { -- action name
				description="Sælg dit mekaniker rod til fabrikken.", -- action description
				work=0.2,
				in_money=0, -- money taken per unit
				out_money=210, -- money earned per unit
				reagents={
					["rod"] = 1,
				}, -- items taken per unit
				products={}, -- items given per unit},
				aptitudes={}, -- optional = 1 -- "group.aptitude", give 1 exp per unit
			}
		}
	},
	---------------------------------------BANDE SALGSTED---------------------------------------

	{
		name="Saml Burgere", -- menu name
		permissions = {"burger.service"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=250,
		x=-1196.1903076172,y=-895.19641113281,z=13.995164871216, -- -1196.1903076172,-895.19641113281,13.995164871216
		radius=0.5, height=1.5, -- area
		recipes = {
			["Samler Burgere"] = { -- action name
				description="Saml burgere", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=0, -- money earned per unit
				reagents={}, -- items taken per unit
				products={
					["burger"] = 1
				}, -- items given per unit
				aptitudes={},
			}
		}
	},

	{
		name="Sælg Burgere", -- menu name
		permissions = {"burger.service"},
		r=0,g=255,b=0, -- color
		max_units=500,
		units_per_minute=250,
		x=-1196.6019287109,y=-891.68939208984,z=13.995153427124, -- -1196.6019287109,-891.68939208984,13.995153427124
		radius=0.5, height=1.5, -- area
		recipes = {
			["Sælger Burgere"] = { -- action name
				description="Sælg burgere", -- action description
				work=1,
				in_money=0, -- money taken per unit
				out_money=225, -- money earned per unit
				reagents={
					["burger"] = 1
				}, -- items taken per unit
				products={}, -- items given per unit
				aptitudes={},
			}
		}
	},
}

-- ---------------------------------------BURGERSHOT---------------------------------------
	--{
		--name="Saml Burgere", -- menu name
		--permissions = {"burger.service"},
		--r=0,g=255,b=0, -- color
		--max_units=500,
		--units_per_minute=250,
		--x=-1196.1630859375,y=--895.02136230469,z=13.995162963867, -- -1196.1630859375,-895.02136230469,13.995162963867
		--radius=2, height=1.5, -- area
		--recipes = {
			--["Samler Burgere"] = { -- action name
			--	description="Saml Burgere sammen", -- action description
			--	work=1,
			--	in_money=0, -- money taken per unit
			--	out_money=0, -- money earned per unit
			--	reagents={
			--	}, -- items taken per unit
			--	products={
			--		["burger"] = 1
			--	} -- items given per unit
			--}
		--}
	--},

	--{
	--	name="Sælg Burgere", -- menu name
	--	permissions = {"burger.service"},
	--	r=0,g=255,b=0, -- color
	--	max_units=500,
	--	units_per_minute=250, -- 
	--	x=-1196.7990722656,y=-891.90124511719,z=13.995162963867, -- -1196.7990722656,-891.90124511719,13.995162963867
	--	radius=2, height=1.5, -- area
	--	recipes = {
	--		["Samler Burgere"] = { -- action name
	---			description="Saml Burgere sammen", -- action description
		--		work=1,
		--		in_money=0, -- money taken per unit
		--		out_money=225, -- money earned per unit
		--		reagents={
		--			["burger"] = 1
		--		}, -- items taken per unit
		--		products={
		--		} -- items given per unit
		--	}
		--}
	--},

-- define transformers randomly placed on the map
cfg.hidden_transformers = {
}

-- time in minutes before hidden transformers are relocated (min is 5 minutes)
cfg.hidden_transformer_duration = 5*24*60 -- 5 days

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
	infos = {},
	positions = {},
	interval = 60, -- interval in minutes for the reseller respawn
	duration = 10, -- duration in minutes of the spawned reseller
	blipid = 133,
	blipcolor = 2
}

return cfg