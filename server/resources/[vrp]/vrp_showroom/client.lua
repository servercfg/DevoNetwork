vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")

function deleteVehiclePedIsIn()
	local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
	SetVehicleHasBeenOwnedByPlayer(v,false)
	SetEntityAsMissionEntity(v, false, true) -- set not as mission entity
	SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
	DeleteEntity(v)
end

local vehshop = {
	opened = false,
	title = "DevoNetwork Bilforhandler",
	currentmenu = "Main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.13,
		y = 0.08,
		width = 0.26,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["Main"] = {
			title = "Bilforhandler",
			name = "Main",
			buttons = {
				{name = "Biler", description = ''},
				{name = "Motorcykler", description = ''},
			}
		},
		["Biler"] = {
			title = "Biler",
			name = "Biler",
			buttons = {
				{name = "Eksklusiv", description = ''},
				{name = "Kompakte", description = ''},
				{name = "Coupéer", description = ''},
				{name = "Sedan", description = ''},
				{name = "Sports", description = ''},
				{name = "Sport klassikere", description = ''},
				{name = "Supers", description = ''},
				{name = "Muskel", description = ''},
				{name = "Offroad", description = ''},
				{name = "SUVer", description = ''},
				{name = "Varevogne", description = ''},
				{name = "Import - Find bilforhandler", description = ''},
				--{name = "cycles", description = ''},
			}
		},
		["Eksklusiv"] = {
			title = "Eksklusiv",
			name = "Eksklusiv",
			buttons = {
				{name = "Elegy Retro", costs = 455000, description = {}, model = "elegy"},
			}
		},
		["Kompakte"] = {
			title = "Kompakte",
			name = "Kompakte",
			buttons = {
				{name = "Blista", costs = 50000, description = {}, model = "blista"},
				{name = "Blista Compact", costs = 40000, description = {}, model = "blista2"},
				{name = "Brioso R/A", costs = 75000, description = {}, model = "brioso"},
				{name = "Dilettante", costs = 50000, description = {}, model = "Dilettante"},
				{name = "Issi", costs = 60000, description = {}, model = "issi2"},
				{name = "Issi Classic", costs = 40000, description = {}, model = "issi3"},
				{name = "Panto", costs = 60000, description = {}, model = "panto"},
				{name = "Prairie", costs = 75000, description = {}, model = "prairie"},
				{name = "Rhapsody", costs = 50000, description = {}, model = "rhapsody"},
			}
		},
		["Coupéer"] = {
			title = "Coupéer",
			name = "Coupéer",
			buttons = {
				{name = "Specter", costs = 2700000, description = {}, model = "specter"},
				{name = "Specter CTM", costs = 2700000, description = {}, model = "specter2"},
				{name = "Cognoscenti Cabrio", costs = 2300000, description = {}, model = "cogcabrio"},
				{name = "F620", costs = 2300000, description = {}, model = "f620"},
				{name = "Felon GT", costs = 1900000, description = {}, model = "felon2"},
				{name = "Jackal", costs = 1600000, description = {}, model = "jackal"},
				{name = "Oracle", costs = 1600000, description = {}, model = "oracle"},
				{name = "Oracle XS", costs = 1700000, description = {}, model = "oracle2"},
				{name = "Sentinel", costs = 900000, description = {}, model = "sentinel"},
				{name = "Sentinel XS", costs = 900000, description = {}, model = "sentinel2"},
				{name = "Windsor", costs = 2000000, description = {}, model = "windsor"},
				{name = "Windsor Drop", costs = 2200000, description = {}, model = "windsor2"},
				{name = "Zion", costs = 1100000, description = {}, model = "zion"},
				{name = "Zion Cabrio", costs = 1300000, description = {}, model = "zion2"},
			}
		},
		["Sports"] = {
			title = "Sports",
			name = "Sports",
			buttons = {
                {name = "Neon", costs = 1500000, description = {}, model = "neon"},
                {name = "Comet SR", costs = 1145000, description = {}, model = "comet5"},
                {name = "Comet", costs = 550000, description = {}, model = "comet3"},
                {name = "Pariah", costs = 1420000, description = {}, model = "pariah"},
                {name = "Banshee", costs = 105000, description = {}, model = "banshee"},
                {name = "Bestia GTS", costs = 610000, description = {}, model = "bestiagts"},
                {name = "Buffalo", costs = 750000, description = {}, model = "buffalo"},
                {name = "Buffalo S", costs = 960000, description = {}, model = "buffalo2"},
                {name = "Carbonizzare", costs = 195000, description = {}, model = "carbonizzare"},
                {name = "Coquette", costs = 138000, description = {}, model = "coquette"},
                {name = "Drift Tampa", costs = 995000, description = {}, model = "tampa2"},
                {name = "Feltzer", costs = 145000, description = {}, model = "feltzer2"},
                {name = "Furore GT", costs = 448000, description = {}, model = "furoregt"},
                {name = "Fusilade", costs = 650000, description = {}, model = "fusilade"},
                {name = "Jester", costs = 240000, description = {}, model = "jester"},
                {name = "Jester(Racerbil)", costs = 350000, description = {}, model = "jester2"},
                {name = "Kuruma", costs = 126350, description = {}, model = "kuruma"},
                {name = "Lynx", costs = 1735000, description = {}, model = "lynx"},
                {name = "Massacro", costs = 275000, description = {}, model = "massacro"},
                {name = "Massacro(Racecar)", costs = 385000, description = {}, model = "massacro2"},
                {name = "Omnis", costs = 701000, description = {}, model = "omnis"},
                {name = "Penumbra", costs = 600000, description = {}, model = "penumbra"},
                {name = "Rapid GT", costs = 132000, description = {}, model = "rapidgt"},
                {name = "Rapid GT Convertible", costs = 140000, description = {}, model = "rapidgt2"},
                {name = "Schafter V12", costs = 116000, description = {}, model = "schafter3"},
                {name = "Surano", costs = 100000, description = {}, model = "surano"},
                {name = "Tropos", costs = 816000, description = {}, model = "tropos"},
                {name = "Verkierer", costs = 695000, description = {}, model = "verlierer2"},
                {name = "Schlagen GT", costs = 1300000, description = {}, model = "Schlagen"},
                {name = "Khamelion", costs = 100000, description = {}, model = "khamelion"},
                {name = "Raptor", costs = 648000, description = {}, model = "raptor"},
                {name = "Ruston", costs = 430000, description = {}, model = "ruston"},
                {name = "Dominator GTX", costs = 725000, description = {}, model = "dominator3"},
				{name = "Sultan RS", costs = 450000, description = {}, model = "sultanrs"},
 
			}
		},
		["Sport klassikere"] = {
			title = "Sport klassikere",
			name = "Sport klassikere",
			buttons = {
				{name = "Rapid GT", costs = 885000, description = {}, model = "rapidgt3"},
                {name = "Retinue", costs = 615000, description = {}, model = "retinue"},
                {name = "Torero", costs = 998000, description = {}, model = "torero"},
                {name = "Cheetah Classic", costs = 865000, description = {}, model = "cheetah2"},
                {name = "GT500", costs = 785000, description = {}, model = "gt500"},
                {name = "Hermes", costs = 535000, description = {}, model = "hermes"},
                {name = "Casco", costs = 904000, description = {}, model = "casco"},
                {name = "Coquette Classic", costs = 665000, description = {}, model = "coquette2"},
                {name = "Pigalle", costs = 400000, description = {}, model = "pigalle"},
                {name = "Stinger", costs = 850000, description = {}, model = "stinger"},
                {name = "Stinger GT", costs = 875000, description = {}, model = "stingergt"},
                {name = "Stirling GT", costs = 975000, description = {}, model = "feltzer3"},
                {name = "Z-Type", costs = 950000, description = {}, model = "ztype"},
			}
		},
		["Supers"] = {
			title = "Supers",
			name = "Supers",
			buttons = {
                {name = "Adder", costs = 1000000, description = {}, model = "adder"},
                {name = "Nero", costs = 1440000, description = {}, model = "nero"},
                {name = "Entity XF", costs = 795000, description = {}, model = "entityxf"},
                {name = "Entity XXR", costs = 2305000, description = {}, model = "entity2"},
                {name = "811", costs = 1135000, description = {}, model = "pfister811"},
                {name = "Cyclone", costs = 1890000, description = {}, model = "cyclone"},
                {name = "Reaper", costs = 1595000, description = {}, model = "reaper"},
                {name = "Tyrant", costs = 2515000, description = {}, model = "tyrant"},
			}
		},
		["Muskel"] = {
			title = "Muskel",
			name = "Muskel",
			buttons = {
				{name = "Blade", costs = 160000, description = {}, model = "blade"},
				{name = "Buccaneer", costs = 190000, description = {}, model = "buccaneer"},
				{name = "Chino", costs = 225000, description = {}, model = "chino"},
				{name = "Coquette BlackFin", costs = 695000, description = {}, model = "coquette3"},
				{name = "Dominator", costs = 350000, description = {}, model = "dominator"},
				{name = "Dukes", costs = 162000, description = {}, model = "dukes"},
				{name = "Hotknife", costs = 190000, description = {}, model = "hotknife"},
				{name = "Faction", costs = 136000, description = {}, model = "faction"},
				{name = "Nightshade", costs = 585000, description = {}, model = "nightshade"},
				{name = "Picador", costs = 100000, description = {}, model = "picador"},
				{name = "Sabre Turbo", costs = 500000, description = {}, model = "sabregt"},
				{name = "Tampa", costs = 375000, description = {}, model = "tampa"},
				{name = "Virgo", costs = 195000, description = {}, model = "virgo"},
			}
		},
		["Offroad"] = {
			title = "Offroad",
			name = "Offroad",
			buttons = {
				{name = "Kamacho", costs = 315000, description = {}, model = "kamacho"},
				{name = "Riata", costs = 325000, description = {}, model = "riata"},
				{name = "Streiter", costs = 235000, description = {}, model = "streiter"},
				{name = "Bifta", costs = 75000, description = {}, model = "bifta"},
				{name = "Blazer", costs = 10000, description = {}, model = "blazer"},
				{name = "Brawler", costs = 715000, description = {}, model = "brawler"},
				{name = "Bubsta 6x6", costs = 375000, description = {}, model = "dubsta3"},
				{name = "Dune Buggy", costs = 200000, description = {}, model = "dune"},
				{name = "Rebel", costs = 220000, description = {}, model = "rebel2"},
				{name = "Nagasaki Street Blazer", costs = 35000, description = {}, model = "blazer4"},
			}
		},
		["SUVer"] = {
			title = "SUVer",
			name = "SUVer",
			buttons = {
                {name = "Baller", costs = 60000, description = {}, model = "baller"},
                {name = "Baller 2", costs = 90000, description = {}, model = "baller2"},
                {name = "Baller LE", costs = 149000, description = {}, model = "baller3"},
                {name = "Baller LE LWD", costs = 247000, description = {}, model = "baller4"},
                {name = "Dubsta", costs = 1245000, description = {}, model = "dubsta"},
                {name = "Dubsta 2", costs = 249000, description = {}, model = "dubsta2"},
                {name = "Toros", costs = 498000, description = {}, model = "toros"},
                {name = "Contender", costs = 250000, description = {}, model = "contender"},
                {name = "XLS", costs = 253000, description = {}, model = "xls"},
                {name = "Rocoto", costs = 85000, description = {}, model = "rocoto"},
			}
		},
		["Varevogne"] = {
			title = "Varevogne",
			name = "Varevogne",
			buttons = {
				{name = "Moonbeam", costs = 450000, description = {}, model = "moonbeam2"},
				{name = "Yosemite", costs = 285000, description = {}, model = "yosemite"},
				{name = "Bison", costs = 130000, description = {}, model = "bison"},
				{name = "Bobcat XL", costs = 123000, description = {}, model = "bobcatxl"},
				{name = "Gang Burrito", costs = 245000, description = {}, model = "gburrito"},
				{name = "Journey", costs = 150000, description = {}, model = "journey"},
				{name = "Minivan", costs = 300000, description = {}, model = "minivan"},
				{name = "Paradise", costs = 250000, description = {}, model = "paradise"},
				{name = "Rumpo", costs = 130000, description = {}, model = "rumpo"},
				{name = "Surfer", costs = 110000, description = {}, model = "surfer"},
				{name = "Youga", costs = 160000, description = {}, model = "youga"},
				{name = "Granger", costs = 315000, description = {}, model = "granger"},
			}
		},
		["Import - Find bilforhandler"] = {
			title = "Import - Find bilforhandler",
			name = "Import - Find bilforhandler",
			buttons = {
                {name = "Mercedes GT 63", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "rmodgt63"},
				{name = "Mercedes-Benz A45", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "a45amg"},
				{name = "Mercedes-Benz S500", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "s500w222"},
				{name = "Mercedes-Benz G65 AMG", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "g65amg"},
				{name = "Ferrari California", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "fc15"},
				{name = "Porsche 718 Boxster", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "718boxster"},
				{name = "Porsche Panamera", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "panamera17turbo"},
				{name = "BMW I8", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "i8"},
				{name = "BMW S1000", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "bmws"},
				{name = "Yamaha R1", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "r1"},
				{name = "BMW M6", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "m6f13"},
				{name = "BMW X6M", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "x6m"},
				{name = "Chevrolet Corvette C7", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "c7"},
				{name = "BMW M5", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "bmci"},
				{name = "Chevrolet Camaro", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "zl12017"},
				{name = "Jeep SRT-8", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "srt8"},
				{name = "Jeep DEMONHAWK", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "demonhawk"},
				{name = "Audi S8", costs = 0, description = {"Find en bilforhandler for at købe denne bil"}, model = "audis8om"},
			}
		},
		["Sedan"] = {
			title = "Sedan",
			name = "Sedan",
			buttons = {
				{name = "Raiden", costs = 2500000, description = {}, model = "raiden"},
				{name = "Asea", costs = 200000, description = {}, model = "asea"},
				{name = "Cognoscenti", costs = 2200000, description = {}, model = "cognoscenti"},
				{name = "Cognoscenti 55", costs = 2000000, description = {}, model = "cog55"},
				{name = "Glendale", costs = 400000, description = {}, model = "glendale"},
				{name = "Ingot", costs = 85000, description = {}, model = "ingot"},
				{name = "Intruder", costs = 120000, description = {}, model = "intruder"},
				{name = "Premier", costs = 150000, description = {}, model = "premier"},
				{name = "Primo", costs = 100000, description = {}, model = "primo"},
				{name = "Primo Custom", costs = 200000, description = {}, model = "primo2"},
				{name = "Regina", costs = 100000, description = {}, model = "regina"},
				{name = "Stanier", costs = 100000, description = {}, model = "stanier"},
				{name = "Stratum", costs = 100000, description = {}, model = "stratum"},
				{name = "Super Diamond", costs = 1250000, description = {}, model = "superd"},
				{name = "Surge", costs = 240000, description = {}, model = "surge"},
				{name = "Tailgater", costs = 600000, description = {}, model = "tailgate"},
				{name = "Warrener", costs = 320000, description = {}, model = "warrener"},
				{name = "Washington", costs = 150000, description = {}, model = "washingt"},
			}
		},
		["Motorcykler"] = {
			title = "Motorcykler",
			name = "Motorcykler",
			buttons = {
				{name = "Akuma", costs = 90000, description = {}, model = "AKUMA"},
				{name = "Bagger", costs = 50000, description = {}, model = "bagger"},
				{name = "Bati 801", costs = 150000, description = {}, model = "bati"},
				{name = "Bati 801RR", costs = 150000, description = {}, model = "bati2"},
				{name = "BF400", costs = 195000, description = {}, model = "bf400"},
				{name = "Carbon RS", costs = 180000, description = {}, model = "carbonrs"},
				{name = "Cliffhanger", costs = 325000, description = {}, model = "cliffhanger"},
				{name = "Double T", costs = 112000, description = {}, model = "double"},
				{name = "Faggio", costs = 14000, description = {}, model = "faggio2"},
				{name = "Knallert", costs = 18000, description = {}, model = "faggio"},
				{name = "Gargoyle", costs = 220000, description = {}, model = "gargoyle"},
				--{name = "Daemon", costs = 100000, description = {}, model = "daemon"},
				{name = "Innovation", costs = 190000, description = {}, model = "innovation"},
				{name = "PCJ-600", costs = 90000, description = {}, model = "pcj"},
				{name = "Zombie Chobber", costs = 385000, description = {}, model = "zombieb"},
				{name = "Vindicator", costs = 600000, description = {}, model = "vindicator"},
				{name = "Sanchez", costs = 100000, description = {}, model = "sanchez"},
				{name = "Nightblade", costs = 400000, description = {}, model = "nightblade"},
			}
		},
	}
}
local fakecar = {model = '', car = nil}
local vehshop_locations = {
	{entering = {-34.106288909912,-1102.6079101563,25.422351837158}, inside = {-46.56327,-1097.382,25.99875, 120.1953}, outside = {-15.97952747345,-1101.6713867188,26.676162719727}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false
local Rotation = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if vehshop.opened == true then
            DisableControlAction(1, 71, true)
            DisableControlAction(1, 72, true)
            DisableControlAction(1, 142, true)
            DisableControlAction(0, 21, true)
            DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
            DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
        end
    end
end)

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function DrawText3D(x,y,z, text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	if onScreen then
		SetTextScale(0.40, 0.40)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
		local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0150, 0.035+ factor, 0.04, 0, 0, 0, 80)
	end
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

Citizen.CreateThread(function()
	vehSR_ShowVehshopBlips(true)
end)

function vehSR_ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,326)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Bilforhandler")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipScale(blip,0.6)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 2 then
						Rotation = Rotation - 0.2
						if Rotation <= 0 then
							Rotation = 360
						end
						DrawText3D(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3]+1, "Tryk ~g~E ~w~for at tilgå kataloget")
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
	return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "Main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end
local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			deleteVehiclePedIsIn()
			vRP.teleport({-17.242038726807,-1109.6545410156,26.672069549561,161.03179931641})
			vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawMenuTitle(txt,x,y)
	local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
function vehSR_tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end
function vehSR_Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.09, y - menu.height/2 + 0.0028)
end
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0,38) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "Kompakte" or vehshop.currentmenu == "Eksklusiv" or vehshop.currentmenu == "Coupéer" or vehshop.currentmenu == "Sedan" or vehshop.currentmenu == "Sports" or vehshop.currentmenu == "Sport klassikere" or vehshop.currentmenu == "Supers" or vehshop.currentmenu == "Muskel" or vehshop.currentmenu == "Offroad" or vehshop.currentmenu == "SUVer" or vehshop.currentmenu == "Varevogne" or vehshop.currentmenu == "Import - Find bilforhandler" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "Motorcykler" then
							if button.costs == 0 then
								vehSR_drawMenuRight("Find forhandler",vehshop.menu.x-0.01,y,selected)
							else
								vehSR_drawMenuRight(button.costs.." DKK",vehshop.menu.x,y,selected)
							end
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "Kompakte" or vehshop.currentmenu == "Eksklusiv" or vehshop.currentmenu == "Coupéer" or vehshop.currentmenu == "Sedan" or vehshop.currentmenu == "Sports" or vehshop.currentmenu == "Sport klassikere" or vehshop.currentmenu == "Supers" or vehshop.currentmenu == "Muskel" or vehshop.currentmenu == "Offroad" or vehshop.currentmenu == "SUVer" or vehshop.currentmenu == "Varevogne" or vehshop.currentmenu == "Import - Find bilforhandler" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "Motorcykler" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									DeleteEntity(fakecar.car)
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								local timer = 0
								while not HasModelLoaded(hash) and timer < 255 do
									Citizen.Wait(1)
									vehSR_drawTxt("Indlæser...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									RequestModel(hash)
									timer = timer + 1
								end
								if timer < 255 then
									local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
									while not DoesEntityExist(veh) do
										Citizen.Wait(1)
										vehSR_drawTxt("Indlæser...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									end
									FreezeEntityPosition(veh,true)
									SetEntityInvincible(veh,true)
									SetVehicleDoorsLocked(veh,4)
									--SetEntityCollision(veh,false,false)
									TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
									for i = 0,24 do
										SetVehicleModKit(veh,0)
										RemoveVehicleMod(veh,i)
									end
									fakecar = { model = button.model, car = veh}
								else
									timer = 0
									while timer < 50 do
										Citizen.Wait(1)
										vehSR_drawTxt("Vent venligst!",0,1,0.5,0.5,1.5,255,0,0,255)
										timer = timer + 1
									end
									if last_dir then
										if vehshop.selectedbutton < buttoncount then
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										else
											last_dir = false
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										end
									else
										if vehshop.selectedbutton > 1 then
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										else
											last_dir = true
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function vehSR_round(num, idp)
	if idp and idp>0 then
		local mult = 10^idp
		return math.floor(num * mult + 0.5) / mult
	end
	return math.floor(num + 0.5)
end
function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "Main" then
		if btn == "Biler" then
			vehSR_OpenMenu('Biler')
		elseif btn == "Motorcykler" then
			vehSR_OpenMenu('Motorcykler')
		end
	elseif this == "Biler" then
		if btn == "Sports" then
			vehSR_OpenMenu('Sports')
		elseif btn == "Sedan" then
			vehSR_OpenMenu('Sedan')
		elseif btn == "Kompakte" then
			vehSR_OpenMenu('Kompakte')
		elseif btn == "Eksklusiv" then
			vehSR_OpenMenu('Eksklusiv')
		elseif btn == "Coupéer" then
			vehSR_OpenMenu('Coupéer')
		elseif btn == "Sport klassikere" then
			vehSR_OpenMenu("Sport klassikere")
		elseif btn == "Supers" then
			vehSR_OpenMenu('Supers')
		elseif btn == "Muskel" then
			vehSR_OpenMenu('Muskel')
		elseif btn == "Offroad" then
			vehSR_OpenMenu('Offroad')
		elseif btn == "SUVer" then
			vehSR_OpenMenu('SUVer')
		elseif btn == "Varevogne" then
			vehSR_OpenMenu('Varevogne')
		elseif btn == "Import - Find bilforhandler" then
			vehSR_OpenMenu('Import - Find bilforhandler')
		end
	elseif this == "Kompakte" or this == "Eksklusiv" or this == "Coupéer" or this == "Sedan" or this == "Sports" or this == "Sport klassikere" or this == "Supers" or this == "Muskel" or this == "Offroad" or this == "SUVer" or this == "Varevogne" or this == "Import - Find bilforhandler" or this == "industrial" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.costs, "car")
	elseif this == "cycles" or this == "Motorcykler" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.costs, "bike")
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Biler" then
		vehshop.lastmenu = "Main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "Main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "Main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end


function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "Main" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "Kompakte" or vehshop.currentmenu == "Eksklusiv" or vehshop.currentmenu == "Coupéer" or vehshop.currentmenu == "Sedan" or vehshop.currentmenu == "Sports" or vehshop.currentmenu == "Sport klassikere" or vehshop.currentmenu == "Supers" or vehshop.currentmenu == "Muskel" or vehshop.currentmenu == "Offroad" or vehshop.currentmenu == "SUVer" or vehshop.currentmenu == "Varevogne" or vehshop.currentmenu == "Import" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "Motorcykler" then
		if DoesEntityExist(fakecar.car) then
			DeleteEntity(fakecar.car)
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end

function vehSR_stringstarts(String,Start)
	return string.sub(String,1,string.len(Start))==Start
end
