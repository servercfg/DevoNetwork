
local cfg = {}
-- define garage types with their associated vehicles
-- (vehicle list: https://wiki.fivem.net/wiki/Vehicles)

-- each garage type is an associated list of veh_name/veh_definition
-- they need a _config property to define the blip and the vehicle type for the garage (each vtype allow one vehicle to be spawned at a time, the default vtype is "default")
-- this is used to let the player spawn a boat AND a car at the same time for example, and only despawn it in the correct garage
-- _config: vtype, blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.rent_factor = 0 -- 10% of the original price if a rent
cfg.sell_factor = 0 -- sell for 75% of the original price

cfg.garage_types = {

	["Taxa"] = {
		_config = {vtype="default", blipid=198, blipcolor=5, permissions = {"taxi.garage"}},
		["taxi"] = {"Taxa", 0, ""}
	},

	["Politi Båd Garage"] = {
		_config = {vtype="boat", permissions = {"police.garage"}},
		["predator"] = {"Politi Båd", 0, ""}
	},

	["Både"] = {
		_config = {vtype="boat",blipid=427,blipcolor=4},
		["seashark"] = {"Jetski",0, ""},
		["jetmax"] = {"jetmax",0, ""},
		["suntrap"] = {"suntrap",0, ""},
		["sr650fly"] = {"Sr650fly",0, ""}
	},

	["Helikopter Politiet"] = {
		_config = {vtype="helicopter", permissions = {"police.garage"}},
		["polmav"] = {"Politi Helikopter",0,""}
	},

	["Helikopter EMS"] = {
		_config = {vtype="helicopter",blipid=0,blicolor=0, permissions = {"emergency.garage"}},
		["emshelikopter"] = {"EMS Helikopter",0,""}
	},

	["Politi Garage"] = {
		_config = {vtype="default", permissions = {"police.garage"}},
		["devo1"] = {"Volkswagen arteon", 0, ""},
		["devo3"] = {"Insignia", 0, ""},
		["devo4"] = {"Volkswagen amarok", 0, ""},
		["devo5"] = {"2016 Touran", 0, ""},
		["devo6"] = {"2015 Passat", 0, ""},
		["devo7"] = {"Audi S4", 0, ""},
		["devo8"] = {"Audi S5", 0, ""},
		["devo9"] = {"Volvo V60", 0, ""},
		["devo10"] = {"BMW S40I", 0, ""},
		["devo11"] = {"Audi A6", 0, ""},
		["devo12"] = {"Volvo XC60", 0, ""},
		["devo13"] = {"2016 Touran [Civil]", 0, ""},
		["devo16"] = {"Audi S4 [Civil]", 0, ""},
		["devo17"] = {"Audi S5 [Civil]", 0, ""},
		["devo18"] = {"Volvo XC60 [Civil]", 0, ""},
		["policeb1"] = {"MC 1", 0, ""},
		["policeb2"] = {"MC 2", 0, ""},
		["policeb3"] = {"MC 3", 0, ""}
	},

	["DBE Garage"] = {
		_config = {vtype="default", permissions = {"dbe.garage"}},
		["Devo14"] = {"Mercedes AMG C63 [Civil]", 0, ""},
		["Devo15"] = {"Audi A7 [Civil]", 0, ""}
	},

	["EMS Bil"] = {
		_config = {vtype="default", permissions = {"emergency.garage"}},
		["akut1"] = {"BMW X5 [Akut Læge]", 0, ""},
		["ambulance1"] = {"Ambulance1", 0, ""},
		["ambulance2"] = {"Ambulance2", 0, ""},
		["ambulance3"] = {"Specialambulance", 0, ""},
		["emsmc"] = {"Læge MC", 0, ""},
		["firetruk"] = {"Brandbil", 0, ""},
		["mercedesems1"] = {"Mercedes", 0, ""},
		["paramedic"] = {"Audi [Paramedic]", 0, ""},
		["tems1"] = {"TEMS", 0, ""},
		["teslambu"] = {"Tesla", 0, ""},
		["trailersmall"] = {"Trailer", 0, ""}
	},

	["Værksted"] = {
		_config = {vtype="default",blipid=402,blipcolor=4, permissions = {"repair.loadshop"}},
		["flatbed"] = {"Lastvogn", 0, ""},
		["flatbed3"] = {"Flatbed", 0, ""},
		["towtruck"] = {"Tow Truck", 0, ""}
	},

	["Minebilen"] = {
		_config = {vtype="default",blipid=318,blipcolor=4},
		["tiptruck"] = {"Minebilen", 0,""},
	},

	["Skraldevogn"] = {
		_config = {vtype="default",blipid=318,blipcolor=4, permissions = {"skralde.vehicle"}},
		["trash"] = {"Skraldevogn", 0,""},
	},

	["Lastbil garage"] = {
		_config = {vtype="default",blipid=477,blipcolor=4,permissions={"trucker.vehicle"}},
		["phantom"] = {"Phantom",0, ""},
		["packer"] = {"Packer",0, ""}
	},

	["Pizza Job"] = {
		_config = {vtype="default",blipid=56,blipcolor=17,permissions={"delivery.vehicle"}},
		["vwcaddy"] = {"Volkswagen Caddy",0, ""}
	},
		
	["Våbenhandler Garage"] = {
		_config = {vtype="default", permissions = {"våben.garage"}},
		["caddy3"] = {"Caddy",0,""}
	},

	["Cykel garage"] = {
		_config = {vtype="default",blipid=226,blipcolor=69},
		["bmx"] = {"BMX",0, ""},
		["cruiser"] = {"Cruiser",0, ""},
		["fixter"] = {"Fixter",0, ""},
		["Scorcher"] = {"Scorcher Mountain Bike",0, ""},
		["tribike"] = {"Racer cykel #1",0, ""},
		["tribike2"] = {"Racer cykel #2",0, ""},
		["tribike3"] = {"Racer cykel #3	",0, ""},
	}

}

-- {garage_type,x,y,z}
cfg.garages = {
	{"DBE Garage",-0.98299741744995,-704.61834716797,32.338085174561},
	{"Politi Båd Garage",-738.80834960938,-2788.3461914063,-0.62692016363144},
	{"Politi Båd Garage",650.94604492188,-1845.4201660156,8.0595712661743},
	{"Politi Båd Garage",-792.35516357422,-1500.3491210938,-0.47498399019241},
	{"Politi Båd Garage",-689.23419189453,6177.9765625,-0.45267567038536},
	{"Politi Garage", 449.77325439453,-1018.7691040039,28.513710021973},
	{"Politi Garage", 1863.0129394531,3704.1630859375,33.439643859863},
	{"Politi Garage", -452.27276611328,5994.9067382813,31.340549468994},
	{"Politi Garage", -991.66143798828,-2983.0874023438,13.945066452026},
	{"Helikopter Politiet",449.51892089844,-987.99310302734,43.691665649414},
	{"Helikopter Politiet",-475.13912963867,5988.3642578125,31.336708068848},
	{"Helikopter Politiet",1866.1794433594,3648.2150878906,35.77840423584},
	{"Helikopter Politiet",-1145.9259033203,-2864.4560546875,13.946004867554}, 
	{"Helikopter EMS",351.30996704102,-588.32525634766,74.165664672852}, 
	{"Helikopter EMS",1849.9605712891,3638.923828125,35.77840423584}, 
	{"Helikopter EMS",-475.13912963867,5988.3642578125,31.336708068848},
	{"Helikopter EMS",-1145.9259033203,-2864.4560546875,13.946004867554}, 
    {"EMS Bil",1842.958984375,3706.4206542969,33.601928710938},
	{"EMS Bil",-262.59860229492,6338.517578125,32.329288482666},
	{"EMS Bil",326.12588500977,-549.32189941406,28.743782043457},
	{"EMS Bil",-991.66143798828,-2983.0874023438,13.945066452026},
	{"Værksted",-182.30268859863,-1289.5889892578,31.295980453491},
	{"Værksted",1773.6405029297,3344.4948730469,40.905914306641},
	{"Både",-2013.9351806641,-1041.3424072266,-0.4406553208828},
	{"Både",-785.62957763672,-1498.5974121094,-0.086649641394615},
	{"Både",1571.1760253906,3845.3767089844,30.856819152832},
	{"Både",-1806.4201660156,-988.86822509766,0.074662901461124},
	{"Både",3845.25390625,4445.0776367188,-0.017860990017653},
	{"Taxa", 915.24536132813,-165.7215423584,74.482749938965},
	{"Minebilen", 496.79681396484,-1970.5522460938,24.905403137207},
	{"Skraldevogn", 1540.0747070313,-2093.2795410156,77.100486755371},
	{"Lastbil garage",160.06260681152,6407.921875,31.162828445435},
	{"Cykel garage",256.87316894531,-783.86700439453,30.507152557373},
	{"Cykel garage",462.85556030273,-127.6795425415,62.341796875},
	{"Pizza Job", 412.62152099609,107.33561706543,100.92472076416},
	{"Våbenhandler Garage", 882.95849609375,-3240.84375,-98.276229858398},
}

return cfg
