
local cfg = {}

-- define market types like garages and weapons
-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the market)

cfg.market_types = {
	["7-Eleven"] = {
		_config = {blipid=52, blipcolor=2},
		-- list itemid => price
		-- Drinks
		["milk"] = 5,
		["water"] = 20,
		["coffee"] = 20,
		["tea"] = 20,
		["icetea"] = 15,
		["orangejuice"] = 15,
		["gocagola"] = 20,
		["redgull"] = 30,
		["cone"] = 10,
		["vodka"] = 65,
		--Food
		["bread"] = 15,
		["donut"] = 10,
		["tacos"] = 20,
		["sandwich"] = 35,
		["kebab"] = 50,
		["pdonut"] = 50,
		-- Ting der skal købes for at kunne bruge emoten
		["cigaretpakke"] = 40,
		["ol"] = 25,
		["strips"] = 2500,
		["pose"] = 5000
	},
	["7-Eleven2"] = {
		_config = {},
		-- list itemid => price
		-- Drinks
		["milk"] = 5,
		["water"] = 20,
		["coffee"] = 20,
		["tea"] = 20,
		["icetea"] = 15,
		["orangejuice"] = 15,
		["gocagola"] = 20,
		["redgull"] = 30,
		["cone"] = 10,
		["vodka"] = 65,
		--Food
		["bread"] = 15,
		["donut"] = 10,
		["tacos"] = 20,
		["sandwich"] = 35,
		["kebab"] = 50,
		["pdonut"] = 50,
		-- Ting der skal købes for at kunne bruge emoten
		["cigaretpakke"] = 40,
		["ol"] = 25,
		["strips"] = 2500,
		["pose"] = 5000
	},
	["emsshop"] = {
		_config = {permissions = {"emergency.market"}},
		["medkit"] = 0,
		["water"] = 5,
		["bread"] = 5,
		["lægerapport"] = 0,
		["bandage"] = 0,
		["medicin"] = 0,
		["donut"] = 10
	},
	["dvsshop"] = {
		_config = {permissions = {"dvs.shop"}},
		["strips"] = 500
	},

	["Bilka"] = {
		_config = {blipid=52, blipcolor=68},
		["water"] = 15,
		["natrium"] = 70,
		["sølvpapir"] = 20,
		["kniv"] = 55,
		["chromium"] = 500,
		["nickel"] = 500,
		["milk"] = 5,
		["water"] = 20,
		["coffee"] = 20,
		["tea"] = 20,
		["icetea"] = 15,
		["orangejuice"] = 15,
		["gocagola"] = 20,
		["redgull"] = 30,
		["cone"] = 10,
		["vodka"] = 65,
		--Mad
		["bread"] = 15,
		["donut"] = 10,
		["tacos"] = 20,
		["sandwich"] = 35,
		["kebab"] = 50,
		["pdonut"] = 50,
		--Ting der skal haves for at lave emoten
		["kikkert"] = 550,
		["cigaretpakke"] = 40,
		["hammer"] = 250,
		["fiskestang"] = 1150,
		["repairkit2"] = 1500,
		["kort"] = 175,
		["ol"] = 25,
		["strips"] = 2500,
		["pose"] = 250,
		["puzzlespil1"] = 1000,
		["puzzlespil2"] = 2000,
		["puzzlespil3"] = 3000,
		["puzzlespil4"] = 4000
	},

	["Fængslet"] = {
		_config = {},
		["bread"] = 1,
		["water"] = 1
	},

	["Burger Shot"] = {
		_config = {blipid=106,blipcolor=60},
		["bigmac"] = 80,
		["cct"] = 28,
		["sodavand"] = 25,
		["cheeseburger"] = 20,
		["hamburger"] = 20,
	},

	["Sorte Marked"] = {
		_config = {blipid=0, blipcolor=0},
		["eddikesyre"] = 200,
		["p2np"] = 200,
		["isopropanol"] = 200,
		["h2so4"] = 250,
	},

	["Pizzeria"] = {
		_config = {blipid=483, blipcolor=64}, --
		["pizza"] = 25
	},
	
		["Cartel"] = {
		_config = {permissions = {"cartel.market"}},
		["key_cartel"] = 0
	},

	["Lost"] = {
		_config = {permissions = {"lost.ledelse"}},
		["key_lost"] = 0
	},

	["Lost Bar"] = {
		_config = {permissions = {"lost.market"}},
		["vodka"] = 75,
		["romogcola"] = 100,
		["sure"] = 100,
		["ginogtonic"] = 100,
		["tequilla"] = 100,
		["sexbeach"] = 100,
		["whisky"] = 100,
		["gin"] = 100,
		["vodkajuice"] = 100,
		["kinder"] = 25,

	},

	["Telefon shoppen"] = {
		_config = {blipid=606, blipcolor=77}, --
		["oneplus"] = 4499,
		["samsung"] = 4999,
		["iphone"] = 6999
	},

	["Politiet"] = {
		_config = {permissions = {"police.loadshop"}}, -- -361.39273071289,275.39370727539,86.421989440918
		["milk"] = 7,
		["water"] = 5,
		["coffee"] = 12,
		["tea"] = 4,
		["kikkert"] = 200,
		["icetea"] = 8,
		["orangejuice"] = 6,
		["gocagola"] = 8,
		["redgull"] = 17,
		["medkit"] = 0,
		["bread"] = 5,
		["donut"] = 13,
		["tacos"] = 26,
		["sandwich"] = 13,
		["kebab"] = 46,
		["pdonut"] = 10,
		["cigaretpakke"] = 20
	},

	["Værktøjskasser"] = {
		_config = {permissions = {"repair.loadshop"}},
		["repairkit"] = 25,
		["kebab"] = 50,
		["kikkert"] = 550
	},

	["Stripklubben"] = {
		_config = {},
		-- list itemid => price
		-- Drinks
		["vodka"] = 75,
		["romogcola"] = 100,
		["sure"] = 100,
		["ginogtonic"] = 100,
		["tequilla"] = 100,
		["sexbeach"] = 100,
		["whisky"] = 100,
		["gin"] = 100,
		["vodkajuice"] = 100,
		["kinder"] = 25,

	},
	["Mekaniker"] = {
		_config = {permissions = {"repair.loadshop"}},
		["kebab"] = 46,
		["water"] = 5,
		["sandwich"] = 13,
	},
	
	["Yacht Bar"] = {
		_config = {},
		["vodka"] = 75,
		["tequilla"] = 100,
		["whisky"] = 100,
		["gin"] = 100,
	},

	["Dykker Udstyr"] = {
		_config = {},
		["dive"] = 5000,
	},
}

-- list of markets {type,x,y,z}

cfg.markets = {
	{"dvsshop",-76.58519744873,-816.85656738281,243.38589477539},
	{"Yacht Bar",-2096.5051269531,-1014.3815307617,8.9804601669312},
	{"Stripklubben",127.15741729736,-1284.2979736328,29.280485153198},
	{"7-Eleven2",-47.522762298584,-1756.85717773438,29.4210109710693},
	{"7-Eleven",25.7454013824463,-1345.26232910156,29.4970207214355},
	{"7-Eleven",1135.57678222656,-981.78125,46.4157981872559},
	{"7-Eleven",1163.53820800781,-323.541320800781,69.2050552368164},
	{"7-Eleven",374.190032958984,327.506713867188,103.566368103027},
	{"7-Eleven",2555.35766601563,382.16845703125,108.622947692871},
	{"7-Eleven",2676.76733398438,3281.57788085938,55.2411231994629},
	{"7-Eleven",1960.50793457031,3741.84008789063,32.3437385559082},
	{"7-Eleven",1393.23828125,3605.171875,34.9809303283691},
	{"7-Eleven",1166.18151855469,2709.35327148438,38.15771484375},
	{"7-Eleven",547.987609863281,2669.7568359375,42.1565132141113},
	{"7-Eleven",1698.30737304688,4924.37939453125,42.0636749267578},
	{"7-Eleven",1729.54443359375,6415.76513671875,35.0372200012207},
	{"7-Eleven",-3243.9013671875,1001.40405273438,12.8307056427002},
	{"7-Eleven",-2967.8818359375,390.78662109375,15.0433149337769},
	{"7-Eleven",-3041.17456054688,585.166198730469,7.90893363952637},
	{"7-Eleven",-1820.55725097656,792.770568847656,138.113250732422},
	{"7-Eleven",-1486.76574707031,-379.553985595703,40.163387298584},
	{"7-Eleven",-1223.18127441406,-907.385681152344,12.3263463973999},
	{"7-Eleven",-707.408996582031,-913.681701660156,19.2155857086182},
	{"7-Eleven", -411.5983581543,6066.6064453125,31.500135421753},
	{"emsshop", -252.66082763672,6327.5375976563,32.43371963501},
	{"emsshop", 312.19686889648,-597.19403076172,43.283985137939},
	{"Politiet", 436.2502746582,-986.72796630859,30.689582824707},
	{"Politiet", 1848.9240722656,3689.0354003906,34.286628723145},
	{"Politiet", 124.12853240967,-759.52447509766,242.15208435059},
	{"Telefon shoppen", 393.51669311523,-832.49298095703,29.291677474976},
	{"Værktøjskasser", -216.46533203125,-1318.8717041016,30.890382766724},
	{"Værktøjskasser", 1764.8836669922,3332.1391601563,41.438529968262},
	{"Værktøjskasser", 479.19229125977,-1326.2680664063,29.207492828369},
	{"Sorte Marked", 1099.7606201172,-3100.0666503906,-38.999954223633},
	{"Bilka", 68.886001586914,-1569.5915527344,29.597770690918},
	{"Dykker Udstyr", -1218.5515136719,-1516.1329345703,4.3798451423645},
	{"Burger Shot", -1193.6016845703,-892.486328125,13.995156288147},
	{"Mekaniker", 1767.8609619141,3333.7426757813,41.438529968262},
	{"Cartel", 1399.4537353516,1139.7747802734,114.33364105225},
	{"Lost", -576.16198730469,289.04977416992,79.176582336426}, -- -561.76690673828,289.60678100586,82.176307678223
	{"Lost Bar", -561.76690673828,289.60678100586,82.176307678223}, -- -565.20758056641,284.75729370117,85.377532958984
	{"Lost Bar", -565.20758056641,284.75729370117,85.377532958984} -- -565.20758056641,284.75729370117,85.377532958984
}

return cfg
