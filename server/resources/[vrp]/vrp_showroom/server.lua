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
z
    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_showroom")
Gclient = Tunnel.getInterface("vRP_garages","vRP_showroom")

local cfg = module("vrp_showroom","cfg/config")
local vehgarage = cfg.showgarage


-- vehicle db / garage and lscustoms compatibility
MySQL.createCommand("vRP/showroom_columns", [[
ALTER TABLE vrp_user_vehicles ADD veh_type varchar(255) NOT NULL DEFAULT 'default' ;
ALTER TABLE vrp_user_vehicles ADD vehicle_plate varchar(255) NOT NULL;
]])
--MySQL.query("vRP/showroom_columns")

MySQL.createCommand("vRP/add_custom_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,vehicle_plate,veh_type) VALUES(@user_id,@vehicle,@vehicle_plate,@veh_type)")

-- SHOWROOM
RegisterServerEvent('veh_SR:CheckMoneyForVeh')
AddEventHandler('veh_SR:CheckMoneyForVeh', function(vehicle, price ,veh_type)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
        vRP.prompt({player,"Er du sikker på, at du vil købe dette køretøj? (godkend/afvis)","",function(player,answer)
            if string.lower(answer) == "godkend" then
                if #pvehicle > 0 then
                    TriggerClientEvent("pNotify:SendNotification", player,{text = "Du ejer allerede dette køretøj!", type = "warning", queue = "global", timeout = 3000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
                else
                    for i=1, #vehgarage.vehicles do
                        if vehgarage.vehicles[i].model == vehicle and vehgarage.vehicles[i].costs == price then
                            if price > 5000 then
                                if vRP.tryFullPayment({user_id,price}) then
                                    vRP.getUserIdentity({user_id, function(identity)
                                        MySQL.query("vRP/add_custom_vehicle", {user_id = user_id, vehicle = vehicle, vehicle_plate = "P "..identity.registration, veh_type = veh_type})
                                    end})

                                    TriggerClientEvent('veh_SR:CloseMenu', player, vehicle, veh_type)
                                    TriggerClientEvent("pNotify:SendNotification", player,{text = "Betalte "..format_thousand(price).." DKK", type = "info", queue = "global", timeout = 3000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
                                    PerformHttpRequest('https://discordapp.com/api/webhooks/640569272447401985/ouWv3ALWUbpzPDva3FpJAgNcSbQylsBY9CskZUPWWtydZxffu8GeL3uC78zuWbigWC3x', function(err, text, headers) end, 'POST', json.encode({username = "Server "..GetConvar("servernumber", "0").." - Showroom", content = "**"..user_id.."** har lige købt en **"..vehicle.."** for: **"..format_thousand(price).."**"}), { ['Content-Type'] = 'application/json' })
                                else
                                    TriggerClientEvent("pNotify:SendNotification", player,{text = "Ikke nok penge!", type = "warning", queue = "global", timeout = 3000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
                                end
                            end
                        end
                    end
                end
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = "Betalingen afbrudt, da du ikke godkendte.", type = "error", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        end})
    end)
end)

function format_thousand(v)
    local s = string.format("%d", math.floor(v))
    local pos = string.len(s) % 3
    if pos == 0 then pos = 3 end
    return string.sub(s, 1, pos)
            .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
end