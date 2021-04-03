local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_custom_jobs")

RegisterServerEvent('taxi:payment')
AddEventHandler('taxi:payment', function (price)
  pay = math.ceil(tonumber(price))
  local user_id = vRP.getUserId({source})
  if not pay then
    pay = 20
  end
  local payment = math.random(2000,4000)
  vRP.giveMoney({user_id,payment})
  TriggerClientEvent('chatMessage', source, 'TAXI', { 255, 255, 0 }, "Du har fået "..tostring(payment).." kr. af kunden")
end)