local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_holdup")

local stores = cfg.holdups

local robbers = {}

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

AddEventHandler("playerDropped", function()
	if(robbers[source])then
		local bossepis = robbers[source]
		local homoseksuelt = stores[bossepis].nameofstore
		TriggerClientEvent('vrp_holdup:han:kan:ikke:fucking:rp', source)
		robbers[source] = nil
		TriggerClientEvent("pNotify:SendNotification", -1,{text = "Røveri afbrudt ved: " .. homoseksuelt, type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)

RegisterServerEvent('vrp_holdup:toofar')
AddEventHandler('vrp_holdup:toofar', function(robb)
	if(robbers[source])then
		TriggerClientEvent('vrp_holdup:toofarlocal', source)
		robbers[source] = nil
		  TriggerClientEvent("pNotify:SendNotification", -1,{text = "Røveri afbrudt ved: " .. stores[robb].nameofstore, type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)

RegisterServerEvent('vrp_holdup:playerdied')
AddEventHandler('vrp_holdup:playerdied', function(robb)
	if(robbers[source])then
		TriggerClientEvent('vrp_holdup:playerdiedlocal', source)
		robbers[source] = nil
		  TriggerClientEvent("pNotify:SendNotification", -1,{text = "Røveri afbrudt ved: " .. stores[robb].nameofstore, type = "info", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)

RegisterServerEvent('vrp_holdup:rob')
AddEventHandler('vrp_holdup:rob', function(robb,x,y,z)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  local cops = vRP.getUsersByPermission({cfg.permission})
  if vRP.hasPermission({user_id,cfg.permission}) then
	TriggerClientEvent("pNotify:SendNotification", player,{text = "Du kan ikke røve butikken som betjent.", type = "error", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
  else
    if #cops >= cfg.cops then
	  if stores[robb] then
		  local store = stores[robb]

		  if (os.time() - store.lastrobbed) <  cfg.seconds+cfg.cooldown and store.lastrobbed ~= 0 then
			  TriggerClientEvent("pNotify:SendNotification", player,{text = "Vent venligt: "..(cfg.seconds+cfg.cooldown - (os.time() - store.lastrobbed)).." sekunder.", type = "error", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			  return
		  end

		  local message = "^7^*Røveri ved " .. store.nameofstore .. " !"
		  TriggerEvent('dispatch', x, y, z, message)

		  TriggerClientEvent("pNotify:SendNotification", -1,{text = "Butiksrøveri ved "..store.nameofstore.."!", type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		  TriggerClientEvent("pNotify:SendNotification", source,{text = "Du startede et røveri, forlad ikke butikken!", type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		  TriggerClientEvent("pNotify:SendNotification", source,{text = "Hold butikken i 5 minutter og pengene er dine!", type = "info", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		  TriggerClientEvent('vrp_holdup:currentlyrobbing', player, robb)
		  stores[robb].lastrobbed = os.time()
		  robbers[player] = robb
		  local savedSource = player
		  SetTimeout(cfg.seconds*1000, function()
			  if(robbers[savedSource])then
				  if(user_id)then
					  vRP.giveInventoryItem({user_id,"dirty_money",store.reward,true})
					  TriggerClientEvent("pNotify:SendNotification", -1,{text = "Røveri ved "..store.nameofstore.." blev afsluttet, røverne slap væk med ca. "..store.reward.." i kontanter</br>", type = "warning", queue = "global", timeout = 5000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
					  TriggerClientEvent('vrp_holdup:robberycomplete', savedSource, store.reward)
				  end
			  end
		  end)		
	  end
    else
     TriggerClientEvent("pNotify:SendNotification", player,{text = "Der skal være min. <b>" ..cfg.cops.."</b> betjente på, før du kan røve denne butik", type = "error", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
  end
end)