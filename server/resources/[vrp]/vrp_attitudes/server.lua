local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPani = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_attitudes")
BMclient = Tunnel.getInterface("vrp_attitudes","vrp_attitudes")
vRPani = Tunnel.getInterface("vrp_attitudes","vrp_attitudes")
Tunnel.bindInterface("vrp_attitudes",vRPani)

local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp", "cfg/base")


-- REMEMBER TO ADD THE PERMISSIONS FOR WHAT YOU WANT TO USE
-- CREATES PLAYER SUBMENU AND ADD CHOICES
local ch_animation_menu = {function(player,choice)
	local user_id = vRP.getUserId({player})
	local menu = {}
	menu.name = "Gågange"
	menu.css = {top = "75px", header_color = "rgba(0,0,255,0.75)"}
    menu.onclose = function(player) vRP.openMainMenu({player}) end -- nest menu
	
    menu[">Stop"] = {function(player,choice)
        vRPani.resetMovement(player,{false})
    end}
	
	menu["Normal Mand"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@confident",true,true,false,false})
    end}

    menu["Normal Kvinde"] = {function(player,choice)
        vRPani.playMovement(player, {"move_f@heels@c",true,true,false,false})
    end}    
	
	menu["Depressiv Mand"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@depressed@a",true,true,false,false})
    end}	
	
	menu["Depressiv Kvinde"] = {function(player,choice)
        vRPani.playMovement(player, {"move_f@depressed@a",true,true,false,false})
    end}	
	
	menu["Forretning"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@business@a",true,true,false,false})
    end}	
	
	menu["Bestemme"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@brave@a",true,true,false,false})
    end}	
	
	menu["Casual"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@casual@a",true,true,false,false})
    end}	
	
	menu["Tyk"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@fat@a",true,true,false,false})
    end}	
	
	menu["Hippi"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@hipster@a",true,true,false,false})
    end}	
	
	menu["Såret"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@injured",true,true,false,false})
    end}	
	
	menu["Nervøs"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@hurry@a",true,true,false,false})
    end}
	
	menu["Hobo"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@hobo@a",true,true,false,false})
    end}	
	
	menu["Ulykkelig"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@sad@a",true,true,false,false})
    end}	
	
	menu["Muskel"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@muscle@a",true,true,false,false})
    end}
	
	menu["Gangster"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@shadyped@a",true,true,false,false})
    end}	
	
	menu["Træthed"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@buzzed",true,true,false,false})
    end}

    menu["Fuld/Træt"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@buzzed",true,true,false,false})
    end}

    menu["Presset"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@hurry_butch@a",true,true,false,false})
    end}	
	
	menu["Voldsom"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@money",true,true,false,false})
    end}	
	
	menu["Lunte"] = {function(player,choice)
        vRPani.playMovement(player, {"move_m@quick",true,true,false,false})
    end}	
	
	menu["Homoseksuel"] = {function(player,choice)
        vRPani.playMovement(player, {"move_f@maneater",true,true,false,false})
    end}	
	
	menu["Uforskammet"] = {function(player,choice)
        vRPani.playMovement(player, {"move_f@sassy",true,true,false,false})
    end}
	
	menu["Diva"] = {function(player,choice)
        vRPani.playMovement(player, {"move_f@arrogant@a",true,true,false,false})
    end}
	vRP.openMenu({player, menu})
	
end}


-- REGISTER MAIN MENU CHOICES
vRP.registerMenuBuilder({"main", function(add, data)
  local user_id = vRP.getUserId({data.player})
  if user_id ~= nil then
    local choices = {}
	
    choices["Bevægelse"] = ch_animation_menu -- opens player submenu
	
    add(choices)
  end
end})