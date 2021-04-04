local cfg = {}

-- example of study transformer
local itemtr_study = {
	name="Bookcase", -- menu name
	r=0,g=255,b=0, -- color
	max_units=20,
	units_per_minute=10,
	x=0,y=0,z=0, -- pos (doesn't matter as home component)
	radius=1.1, height=1.5, -- area
	recipes = {
		["Chemicals book"] = { -- action name
			description="Read a chemicals book", -- action description
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={}, -- items given per unit
			aptitudes={ -- optional
				["science.chemicals"] = 1 -- "group.aptitude", give 1 exp per unit
			}
		},
		["Mathematics book"] = { -- action name
			description="Read a mathematics book", -- action description
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={}, -- items given per unit
			aptitudes={ -- optional
				["science.mathematics"] = 1 -- "group.aptitude", give 1 exp per unit
			}
		}
	}
}
local itemtr_laboratory = {
	name="workbench", -- menu name
	permissions = {"harvest.weed"}, -- job drug dealer required to use
	r=0,g=255,b=0, -- color
	max_units=1000,
	units_per_minute=200,
	x=0,y=0,z=0, -- pos (doesn't matter as home component)
	radius=1.1, height=1.5, -- area
	recipes = {
		["cocaine"] = { -- action name
			description="make cocaine", -- action description
			in_money=500, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={ -- items taken per unit
				["benzoilmetilecgonina"] = 1
			},
			products={ -- items given per unit
				["cocaine"] = 5
			},
			aptitudes={ -- optional
				["laboratory.cocaine"] = 5, -- "group.aptitude", give 1 exp per unit
				["science.chemicals"] = 10
			}
		},
		["weed"] = { -- action name
			description="make weed", -- action description
			in_money=500, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={ -- items taken per unit
				["seeds"] = 1
			},
			products={ -- items given per unit
				["weed"] = 5
			},
			aptitudes={ -- optional
				["laboratory.weed"] = 5, -- "group.aptitude", give 1 exp per unit
				["science.chemicals"] = 10
			}
		},
		-----------------
		["lsd"] = { -- action name
			description="make lsd", -- action description
			in_money=500, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={ -- items taken per unit
				["harness"] = 1
			},
			products={ -- items given per unit
				["lsd"] = 5
			},
			aptitudes={ -- optional
				["laboratory.lsd"] = 5, -- "group.aptitude", give 1 exp per unit
				["science.chemicals"] = 10
			}
		},
		---------------------------------------------
	}
}
------------------------------------------------ hacker

--local itemtr_hacker = {
--name="hacker", -- menu name
--r=0,g=255,b=0, -- color
--max_units=20,
--units_per_minute=10,
--x=0,y=0,z=0, -- pos (doesn't matter as home component)
--radius=1.1, height=1.5, -- area
--recipes = {
--["logic pdf"] = { -- action name
--description="Read a logic pdf", -- action description
--in_money=0, -- money taken per unit
--out_money=0, -- money earned per unit
--reagents={}, -- items taken per unit
--products={}, -- items given per unit
--aptitudes={ -- optional
--["hacker.logic"] = 10 -- "group.aptitude", give 1 exp per unit
--}
--},
--["c++ pdf"] = { -- action name
--description="Read a C++ pdf", -- action description
--in_money=0, -- money taken per unit
--out_money=0, -- money earned per unit
--reagents={}, -- items taken per unit
--products={}, -- items given per unit
--aptitudes={ -- optional
--["hacker.c++"] = 1 -- "group.aptitude", give 1 exp per unit
-- }
--},
--["lua pdf"] = { -- action name
-- description="Read a C++ pdf", -- action description
--in_money=0, -- money taken per unit
--out_money=0, -- money earned per unit
--reagents={}, -- items taken per unit
--products={}, -- items given per unit
--aptitudes={ -- optional
--["hacker.lua"] = 1 -- "group.aptitude", give 1 exp per unit
--}
--},
--["hacking"] = { -- action name
-- description="hacking a Credit card informations", -- action description
--in_money=0, -- money taken per unit
--out_money=0, -- money earned per unit
--reagents={}, -- items taken per unit
--products={
--["dirty_money"] = 5000
--}, -- items given per unit
--aptitudes={ -- optional
--["hacker.lua"] = 1, -- "group.aptitude", give 1 exp per unit
--["hacker.c++"] = 1, -- "group.aptitude", give 1 exp per unit
--["hacker.logic"] = 1, -- "group.aptitude", give 1 exp per unit
--["hacker.hacking"] = 1 -- "group.aptitude", give 1 exp per unit
--}
--},
--}
--}

-- default flats positions from https://github.com/Nadochima/HomeGTAV/blob/master/List

-- define the home slots (each entry coordinate should be unique for ALL types)
-- each slots is a list of home components
--- {component,x,y,z} (optional _config)
--- the entry component is required
cfg.slot_types = {
	["Modern_Apt"] = {
		{
			{"entry",-786.8663, 315.7642, 217.6385},
			{"chest",-260.3044128418,-710.51483154297,71.03263092041, _config = {weight=200}},
			{"wardrobe",-268.35028076172,-711.14282226563,74.130767822266},
			{"gametable",-261.54336547852,-705.24145507813,69.073661804199},
			{"itemtr", _config = itemtr_study, -271.51849365234,-699.15698242188,74.129493713379},
			--{"itemtr", _config = itemtr_laboratory, -277.80133056641,-706.42468261719,71.034538269043}
		}
	},
	["Modern_Apt_2"] = {
		{
			{"entry",-786.9563, 315.6229, 187.9136},
			{"chest",-35.461421966553,-580.32019042969,83.907508850098, _config = {weight=300}},
			{"wardrobe",-38.095764160156,-584.20355224609,83.918319702148},
			{"gametable",-22.326860427856,-590.53997802734,90.114852905273},
			{"itemtr", _config = itemtr_study, -40.551208496094,-577.00561523438,88.733131408691},
			{"itemtr", _config = itemtr_laboratory, -806.54052734375,171.15138244629,72.834892272949}
		}
	},
	["Modern_Apt_3"] = {
		{
			{"entry",-774.0126, 342.0428, 196.6864},
			{"chest",-260.3044128418,-710.51483154297,71.03263092041, _config = {weight=200}},
			{"wardrobe",-268.35028076172,-711.14282226563,74.130767822266},
			{"gametable",-261.54336547852,-705.24145507813,69.073661804199},
			{"itemtr", _config = itemtr_study, -271.51849365234,-699.15698242188,74.129493713379},
			--{"itemtr", _config = itemtr_laboratory, -277.80133056641,-706.42468261719,71.034538269043}
		}
	},
	["Random_Apt"] = {
		{
			{"entry",-18.354400634766,-591.35821533203,90.114837646484},
			{"chest",-35.461421966553,-580.32019042969,83.907508850098, _config = {weight=300}},
			{"wardrobe",-38.095764160156,-584.20355224609,83.918319702148},
			{"gametable",-22.326860427856,-590.53997802734,90.114852905273},
			{"itemtr", _config = itemtr_study, -40.551208496094,-577.00561523438,88.733131408691},
			{"itemtr", _config = itemtr_laboratory, -806.54052734375,171.15138244629,72.834892272949}
		}
	},
	["Luksus_Hus"] = {
		{
			{"entry",7.8511505126953,538.39593505859,176.02819824219},
			{"chest",-7.0777506828308,530.04364013672,175.03535461426, _config = {weight=250}},
			{"wardrobe",9.6222143173218,528.81146240234,170.61724853516},
			{"gametable",9.9531784057617,530.68579101563,174.64627075195}
		}
	},
	["Beach_Home"] = {
		{
			{"entry",-1150.8718261719,-1520.5780029297,10.632716178894},
			{"chest",-1150.8791503906,-1513.4345703125,10.632716178894, _config = {weight=100}},
			{"wardrobe",-1144.1768798828,-1515.9010009766,10.632717132568},
			{"gametable",-1159.3387451172,-1521.1745605469,10.632717132568},
			{"itemtr", _config = itemtr_study, -1156.8276367188,-1517.5168457031,10.632717132568}
		}
	},
	["Cheap_Home"] = {
		{
			{"entry",346.3893737793,-1012.9935302734,-99.196250915527},
			{"chest",351.87979125977,-998.93640136719,-99.19620513916, _config = {weight=200}},
			{"wardrobe",351.22573852539,-993.52227783203,-99.19620513916},
			{"gametable",340.52719116211,-996.14672851563,-99.196235656738},
			{"itemtr", _config = itemtr_study, 345.3010559082,-994.58178710938,-99.196235656738}
		}
	},
	["Cheap_Home_2"] = {
		{
			{"entry",346.60354614258,-1011.3212890625,-99.196258544922},
			{"chest",351.8489074707,-998.77160644531,-99.196182250977, _config = {weight=200}},
			{"wardrobe",351.22573852539,-993.52227783203,-99.19620513916},
			{"gametable",342.09689331055,-996.16009521484,-99.196166992188},
			{"itemtr", _config = itemtr_study, 345.21719360352,-995.52044677734,-99.196182250977}
		}
	},
	["Cheap_Home_3"] = {
		{
			{"entry",346.71133422852,-1011.7744140625,-99.196281433105},
			{"chest",351.42984008789,-998.90441894531,-99.196159362793, _config = {weight=200}},
			{"wardrobe",351.35720825195,-993.78961181641,-99.196151733398},
			{"gametable",340.46734619141,-996.14453125,-99.196159362793},
			{"itemtr", _config = itemtr_study, 345.1969909668,-995.84521484375,-99.196159362793}
		}
	},
	["mansion2"] = {
		{
			{"entry",7.6293659210205,537.90026855469,176.02813720703},
			{"chest",-11.527637481689,516.53375244141,174.62814331055, _config = {weight=200}},
			{"wardrobe",8.900839805603,528.54754638672,170.63502502441},
			{"gametable",0.80820995569229,534.32055664063,175.34242248535},
			{"itemtr", _config = itemtr_study, 2.0338447093964,526.91583251953,174.62788391113},
			--{"itemtr", _config = itemtr_laboratory, 4.887170791626,525.84631347656,170.61726379395}
		}
	},
	["trevor_trailer"] = {
		{
			{"entry",1972.5347900391,3817.2524414063,33.428737640381},
			{"chest",1972.7764892578,3819.447265625,33.428737640381, _config = {weight=200}},
			{"wardrobe",1969.2116699219,3814.6779785156,33.428745269775},
			{"gametable",1975.8670654297,3821.0249023438,33.44958114624},
			{"itemtr", _config = itemtr_study, 1970.9127197266,3818.9682617188,33.428722381592}
		}
	},
	["franklin_house"] = {
		{
			{"entry",-13.934011459351,-1438.681640625,31.101552963257},
			{"chest",-16.165374755859,-1430.3123779297,31.101528167725, _config = {weight=200}},
			{"wardrobe",-18.420257568359,-1438.7086181641,31.101554870605},
			{"gametable",-9.8388214111328,-1433.0078125,31.10181427002},
			--{"itemtr", _config = itemtr_study, -9.6672973632813,-1439.2152099609,31.101551055908}
		}
	},
	["Rich_flat"] = {
		{
			{"entry",117.25834655762,560.08666992188,184.30490112305},
			{"chest",118.02893829346,548.17034912109,184.09687805176, _config = {weight=300}},
			{"wardrobe",122.19967651367,549.14868164063,180.49728393555},
			{"gametable",123.65795898438,542.46752929688,183.92469787598},
			{"itemtr", _config = itemtr_study, 113.85709381104,569.33728027344,176.69169616699},
			--{"itemtr", _config = itemtr_laboratory, 122.04703521729,554.95385742188,184.29711914063}
		}
	},
	["Normal_flat"] = {
		{
			{"entry",342.23474121094,437.68603515625,149.380859375},
			{"chest",334.65530395508,428.56219482422,145.57086181641, _config = {weight=300}},
			{"wardrobe",-167.52639770508,488.09219360352,133.84378051758},
			{"gametable",1396.9838867188,1132.2958984375,114.33364868164},
			{"itemtr", _config = itemtr_study, 1397.9416503906,1153.2963867188,114.33358001709},
			--{"itemtr", _config = itemtr_laboratory, 339.99038696289,430.75555419922,149.38067626953}
		}
	},
	["Normal_flat2"] = {
		{
			{"entry",1088.803,-3188.257,-38.993},
			{"chest",1096.8107910156,-3192.9125976563,-38.993473052979, _config = {weight=200}},
			--{"wardrobe",-167.52639770508,488.09219360352,133.84378051758},
			-- {"gametable",1396.9838867188,1132.2958984375,114.33364868164},
			{"itemtr", _config = itemtr_study, 1397.9416503906,1153.2963867188,114.33358001709}
			--{"itemtr", _config = itemtr_laboratory, 339.99038696289,430.75555419922,149.38067626953}
		}
	},
	["Luksus_Lejligheder"] = {
		{
			{"entry",-603.997,58.954,98.200},
			{"chest",-621.32836914063,54.077121734619,97.599510192871, _config = {weight=300}},
			{"wardrobe",-594.59484863281,55.898021697998,96.999626159668}
			--  {"gametable",123.11248779297,544.15203857422,183.92468261719},
			--  {"itemtr", _config = itemtr_study, 125.08413696289,547.87701416016,184.09686279297},
			-- {"itemtr", _config = itemtr_laboratory, 119.1173324585,570.61010742188,176.69715881348}
		}
	},
	["Rich_Home"] = {
		{
			{"entry",996.933, -3200.605, -36.394},
			{"chest",1004.3666992188,-3194.6640625,-38.993160247803, _config = {weight=200}},
			--{"wardrobe",1402.2535400391,1135.0444335938,114.33364868164},
			--  {"gametable",329.27224731445,424.77600097656,148.99256896973},
			-- {"itemtr", _config = itemtr_study, 336.78369140625,431.45687866211,141.77076721191},
			{"itemtr", _config = itemtr_laboratory, 1399.5760498047,1147.2416992188,114.33366394043}
		}
	},
	["basic_flat"] = {
		{
			{"entry",-781.91949462891,326.05627441406,223.25764465332},
			{"chest",-773.718078613281,325.144409179688,223.266357421875, _config = {weight=200}},
			{"wardrobe",-760.885437011719,325.457153320313,217.061080932617},
			{"gametable",-755.40185546875,318.263214111328,221.875823974609},
			{"itemtr", _config = itemtr_study, -758.670104980469,315.048156738281,221.854904174805},
			--{"itemtr", _config = itemtr_laboratory, -772.294372558594,328.913177490234,223.261581420898}
		},
		{
			{"entry",-774.171,333.589,207.621},
			{"chest",-782.118591308594,332.147399902344,207.629608154297, _config = {weight=200}},
			{"wardrobe",-795.118469238281,331.631256103516,201.42431640625},
			{"gametable",-800.763427734375,338.574951171875,206.239105224609},
			{"itemtr", _config = itemtr_study, -797.283447265625,342.134338378906,206.21842956543},
			--{"itemtr", _config = itemtr_laboratory, -783.788635253906,328.553985595703,207.625396728516}
		},
		{
			{"entry",-774.171,333.589,159.998},
			{"chest",-782.66015625,332.523284912109,160.010223388672, _config = {weight=200}},
			{"wardrobe",-795.550964355469,332.229614257813,153.804931640625},
			{"gametable",-801.228942871094,339.106231689453,158.619750976563},
			{"itemtr", _config = itemtr_study, -797.896728515625,342.543273925781,158.599044799805},
			--{"itemtr", _config = itemtr_laboratory, -784.178588867188,328.916839599609,160.006057739258}
		},
		{
			{"entry",-596.689,59.139,108.030},
			{"chest",-604.427001953125,57.0807762145996,108.035743713379, _config = {weight=200}},
			{"wardrobe",-617.180358886719,56.9536590576172,101.830520629883},
			{"gametable",-623.078796386719,63.688045501709,106.645317077637},
			{"itemtr", _config = itemtr_study, -619.724853515625,67.1367950439453,106.624366760254},
			{"itemtr", _config = itemtr_laboratory, -605.9560546875,53.3968696594238,108.031196594238}
		},
		{
			{"entry",-1451.557,-523.546,69.556},
			{"chest",-1457.28601074219,-529.699523925781,69.565315246582, _config = {weight=200}},
			{"wardrobe",-1467.07995605469,-536.98583984375,63.3601188659668},
			{"gametable",-1476.12658691406,-534.873474121094,68.1748962402344},
			{"itemtr", _config = itemtr_study, -1475.36840820313,-530.117126464844,68.1540756225586},
			--{"itemtr", _config = itemtr_laboratory, -1456.35876464844,-533.55029296875,69.5607528686523}
		},
		{
			{"entry",-1452.185,-522.640,56.929},
			{"chest",-1457.3740234375,-529.737854003906,56.9376449584961, _config = {weight=200}},
			{"wardrobe",-1467.7158203125,-537.308349609375,50.732494354248},
			{"gametable",-1476.12670898438,-534.895751953125,55.547306060791},
			{"itemtr", _config = itemtr_study, -1475.39453125,-530.135192871094,55.5264129638672},
			{"itemtr", _config = itemtr_laboratory, -1456.32409667969,-533.43701171875,56.9333839416504}
		},
		{
			{"entry",-907.900,-370.608,109.440},
			{"chest",-914.79296875,-375.26416015625,109.448974609375, _config = {weight=200}},
			{"wardrobe",-926.047912597656,-381.470153808594,103.243774414063},
			{"gametable",-934.216979980469,-378.082336425781,108.05859375},
			{"itemtr", _config = itemtr_study, -932.810302734375,-373.413330078125,108.03776550293},
			--{"itemtr", _config = itemtr_laboratory, -914.430541992188,-379.17333984375,109.444869995117}
		},
		{
			{"entry",-921.124,-381.099,85.480},
			{"chest",-915.268737792969,-375.818084716797,85.4891815185547, _config = {weight=200}},
			{"wardrobe",-904.0673828125,-369.910552978516,79.2839508056641},
			{"gametable",-895.890075683594,-373.167846679688,84.0987701416016},
			{"itemtr", _config = itemtr_study, -897.224792480469,-377.828887939453,84.0779266357422},
			{"itemtr", _config = itemtr_laboratory, -915.567504882813,-371.905731201172,85.4850234985352}
		},
		{
			{"entry",-464.453,-708.617,77.086},
			{"chest",-466.566558837891,-700.528991699219,77.0956268310547, _config = {weight=200}},
			{"wardrobe",-466.892852783203,-687.88720703125,70.8903503417969},
			{"gametable",-459.870513916016,-682.054565429688,75.7051773071289},
			{"itemtr", _config = itemtr_study, -456.510467529297,-685.274841308594,75.6842498779297},
			--{"itemtr", _config = itemtr_laboratory, -470.110504150391,-699.137634277344,77.0915145874023}
		},
		{
			{"entry",-470.647,-689.459,53.402},
			{"chest",-469.077453613281,-697.664672851563,53.4144515991211, _config = {weight=200}},
			{"wardrobe",-468.939910888672,-710.398986816406,47.2093048095703},
			{"gametable",-475.543884277344,-716.226867675781,52.0241050720215},
			{"itemtr", _config = itemtr_study, -479.113037109375,-712.874938964844,52.0032043457031},
			--{"itemtr", _config = itemtr_laboratory, -465.526031494141,-699.133666992188,53.4103393554688}
		}
	},
	["other_flat"] = {
		{
			{"entry",-784.363,323.792,211.996},
			{"chest",-766.744384765625,328.375,211.396545410156, _config = {weight=500}},
			{"wardrobe",-793.502136230469,326.861846923828,210.796630859375},
			{"gametable",-781.973083496094,338.788482666016,211.231979370117},
			{"itemtr", _config = itemtr_study, -778.560241699219,333.439453125,211.197128295898},
			--{"itemtr", _config = itemtr_laboratory, -763.146362304688,326.994598388672,211.396560668945},
			--{"itemtr", _config = itemtr_hacker, -762.913757324219,332.328216552734,211.396484375}
		},
		{
			{"entry",-603.997,58.954,98.200},
			{"chest",-621.323669433594,54.2074241638184,97.5995330810547, _config = {weight=500}},
			{"wardrobe",-594.668823242188,55.5750961303711,96.9996185302734},
			{"gametable",-606.140441894531,43.8849754333496,97.4350128173828},
			{"itemtr", _config = itemtr_study, -608.968322753906,49.1769981384277,97.4001312255859},
			--{"itemtr", _config = itemtr_laboratory, -624.831909179688,55.5965461730957,97.5995635986328},
			--{"itemtr", _config = itemtr_hacker, -625.2353515625,50.4472694396973,97.5995254516602}
		},
		{
			{"entry",-1453.013,-539.629,74.044},
			{"chest",-1466.57763671875,-528.339294433594,73.4436492919922, _config = {weight=500}},
			{"wardrobe",-1449.85034179688,-549.231323242188,72.8437194824219},
			{"gametable",-1466.37182617188,-546.663757324219,73.279052734375},
			{"itemtr", _config = itemtr_study, -1463.84411621094,-541.1962890625,73.2442169189453},
			--{"itemtr", _config = itemtr_laboratory, -1467.62377929688,-524.550842285156,73.4436492919922},
			--{"itemtr", _config = itemtr_hacker, -1472.04296875,-527.374267578125,73.4436416625977}
		},
		{
			{"entry",-912.547,-364.706,114.274},
			{"chest",-926.693176269531,-377.596130371094,113.674102783203, _config = {weight=500}},
			{"wardrobe",-903.66650390625,-364.023223876953,113.074157714844},
			{"gametable",-908.407165527344,-379.825714111328,113.509590148926},
			{"itemtr", _config = itemtr_study, -913.553588867188,-376.692016601563,113.474617004395},
			--{"itemtr", _config = itemtr_laboratory, -930.571899414063,-378.051239013672,113.674072265625},
			--{"itemtr", _config = itemtr_hacker, -928.425598144531,-382.820159912109,113.67407989502}
		}
	},
	["plantation_flat"] = {
		{
			{"entry",1173.7135009766,-3196.6174316406,-39.007976531982},
			{"chest",1396.7132568359,3604.9682617188,38.941928863525, _config = {weight=500}},
			-- {"wardrobe",1395.5855712891,3616.0346679688,38.941928863525},
			{"gametable",1394.2917480469,3610.3530273438,38.941928863525}
			-- {"itemtr", _config = itemtr_laboratory, 1391.9298095703,3603.7819824219,38.941928863525}
		}
	},
	["rail_flat"] = {
		{
			{"entry",266.05401611328,-1007.4234008789,-101.00854492188},
			{"chest",262.87173461914,-1002.8824462891,-99.008644104004, _config = {weight=100}},
			{"wardrobe",259.77285766602,-1003.9440917969,-99.008644104004},
			{"gametable",258.46481323242,-997.28521728516,-99.008674621582}
		}
	},
		-- Ejendomsmægler Boliger
		["Ejendom3"] = {
			{
					{"entry",-1589.5002441406,-3231.388671875,26.312700271606},
					{"chest",-1559.0245361328,-3236.5554199219,26.336170196533, _config = {weight=300}},
					{"wardrobe",-1571.4625244141,-3224.1882324219,26.336175918579}
			}
		},
	["plantation_flat_3"] = {
		{
			{"entry",1066.1495361328,-3183.552734375,-39.16361618042},
			{"chest",1006.9019775391,-3154.5388183594,-38.907497406006, _config = {weight=500}},
			{"wardrobe",1009.9183959961,-3167.8459472656,-38.906856536865}
			-- {"gametable",2445.4145507813,4983.7612304688,46.809871673584}
		}
	}
}

-- define home clusters
cfg.homes = {
	["Lejligheder Nordbyen"] = {
		slot = "basic_flat",
		entry_point = {-635.665,44.155,42.697},
		buy_price = 500000,
		sell_price = 0,
		max = 30,
		blipid=475,
		blipcolor=60
	},
	["Lejligheder Midtbyen"] = {
		slot = "Random_Apt",
		entry_point = {291.36526489258,-1078.6138916016,29.404870986938},
		buy_price = 750000,
		sell_price = 0,
		max = 30,
		blipid=475,
		blipcolor=60
	},
	["Ejendom 3"] = {
		slot = "ejendom3",
		entry_point = {-1589.5002441406,-3231.388671875,26.312700271606},
		buy_price = 1000000000,
		sell_price = 0,
		max = 10,
		blipid=475,
		blipcolor=1,
		blip_hidden = true
	},
	["Strand Lejlighed"] = {
		slot = "Beach_Home",
		entry_point = {-1149.7492675781,-1522.0908203125,10.628053665161},
		buy_price = 800000,
		sell_price = 0,
		max = 10,
		blipid=475,
		blipcolor=60
	},
	["Billig Lejligheder"] = {
		slot = "Cheap_Home",
		entry_point = {-1582.3432617188,-278.03247070313,48.275653839111},
		buy_price = 250000,
		sell_price =0,
		max = 50,
		blipid=475,
		blipcolor=69
	},
	["Billig Lejligheder #2"] = {
		slot = "rail_flat",
		entry_point = {467.17126464844,-1590.0118408203,32.792224884033},
		buy_price = 150000,
		sell_price =0,
		max = 50,
		blipid=475,
		blipcolor=69
	},
	["Luksus Lejligheder"] = {
		slot = "Luksus_Lejligheder",
		entry_point = {-766.37530517578,-916.94781494141,21.297330856323},
		buy_price = 1750000,
		sell_price =0,
		max = 10,
		blipid=475,
		blipcolor=49
	},
	["Luksus Lejligheder #2"] = {
		slot = "Rich_flat",
		entry_point = {119.29936981201,564.16754150391,183.95928955078},
		buy_price = 1850000,
		sell_price =0,
		max = 10,
		blipid=475,
		blipcolor=49
	},
	["Luksus Lejligheder #3"] = {
		slot = "Normal_flat",
		entry_point = {346.63467407227,440.6315612793,147.70234680176},
		buy_price = 3750000,
		sell_price =0,
		max = 10,
		blipid=475,
		blipcolor=49
	}
}

return cfg