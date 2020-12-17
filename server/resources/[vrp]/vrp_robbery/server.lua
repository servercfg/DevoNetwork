--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_robbery")

local banks = cfg.banks

local robbers = {}

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('es_bank:toofar')
AddEventHandler('es_bank:toofar', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent("pNotify:SendNotification", -1,{text = "Bankrøveriet blev aflyst: " .. banks[robb].nameofbank, type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)

RegisterServerEvent('es_bank:playerdied')
AddEventHandler('es_bank:playerdied', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:playerdiedlocal', source)
		robbers[source] = nil
		 TriggerClientEvent("pNotify:SendNotification", -1,{text = "Bankrøveriet blev aflyst: " .. banks[robb].nameofbank, type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	end
end)

RegisterServerEvent('es_bank:rob')
AddEventHandler('es_bank:rob', function(robb)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local cops = vRP.getUsersByPermission({cfg.permission})
	if vRP.hasPermission({user_id,cfg.permission}) then
		vRPclient.notify(player,{"~r~Politiet kan ikke røve banke."})
	else
		local ncops = cfg.cops
		if banks[robb].mincops ~= nil then
			ncops = banks[robb].mincops
		end
		if #cops >= ncops then
			if banks[robb] then
				local bank = banks[robb]

				if (os.time() - bank.lastrobbed) < cfg.seconds+cfg.cooldown and bank.lastrobbed ~= 0 then
					 TriggerClientEvent("pNotify:SendNotification", player,{text = "Denne bank er for nyligt blevet røvet, venligst vent: ^2" .. (cfg.seconds+cfg.cooldown - (os.time() - bank.lastrobbed)) .. "^0 seconds.", type = "warning", timeout = 5000, layout = "cenerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
					return
				end
				
				local message = "^7^*Røveri ved " .. bank.nameofbank .. " !"
		        TriggerEvent('dispatch', x, y, z, message)
						  
				 TriggerClientEvent("pNotify:SendNotification", -1,{text = "Bankrøveri igang ved " .. bank.nameofbank, type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				 TriggerClientEvent("pNotify:SendNotification", player, {text = "Du har startet et bankrøveri ved: " .. bank.nameofbank .. ", kom ikke for langt væk fra dette punkt!", type = "warning", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				 TriggerClientEvent("pNotify:SendNotification", player, {text = "Beskyt banken imens pengene bliver tømt 10 minutter og pengene er dine!", type = "warning", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				TriggerClientEvent('es_bank:currentlyrobbing', player, robb)
				banks[robb].lastrobbed = os.time()
				robbers[player] = robb
				local savedSource = player
				SetTimeout(cfg.seconds*1000, function()
					if(robbers[savedSource])then
						if(user_id)then
							vRP.giveInventoryItem({user_id,"dirty_money",bank.reward,true})
							 TriggerClientEvent("pNotify:SendNotification", -1,{text = "Bankrøveriet er ovre: " .. bank.nameofbank .. "!", type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
							TriggerClientEvent('es_bank:robberycomplete', savedSource, bank.reward)
						end
					end
				end)
			end
		else
			vRPclient.notify(player,{"~r~Ikke nok betjente i byen."})
		end
	end
end)