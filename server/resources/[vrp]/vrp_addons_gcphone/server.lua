local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_addons_gcphone")

local PhoneNumbers        = {}

RegisterServerEvent('vrp_addons_gcphone:startCall')
AddEventHandler('vrp_addons_gcphone:startCall', function (number, message, coords)
  local source = source
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})

  vRPclient.notify(player,{"Anmoder om "..number})
end)