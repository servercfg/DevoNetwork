local testMode = true -- enables/disables car spawn command

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_taxa")
isTransfer = false

local taxiMeter = {}

-- HELPER FUNCTIONS
function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function splitString(str, sep)
  if sep == nil then sep = "%s" end

  local t={}
  local i=1

  for str in string.gmatch(str, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end

  return t
end


RegisterServerEvent('taxi:update')
AddEventHandler('taxi:update', function(veh)
  local user_id = vRP.getUserId({source})
  local source = vRP.getUserSource({user_id})

  local vehicle = veh
  TriggerClientEvent("taxi:updatefare", source, veh)
end)

RegisterServerEvent('taxi:syncmeter')
AddEventHandler('taxi:syncmeter', function(veh)
  local user_id = vRP.getUserId({source})
  local source = vRP.getUserSource({user_id})
  local vehicle = veh
  TriggerClientEvent("taxi:updatefare", source, veh)
end)


if testMode then
  AddEventHandler('chatMessage', function(source, n, message)
    local args = stringsplit(message, " ")
    if (args[1] == "/spawn") then
      CancelEvent()
      if (args[2] ~= nil) then
        local playerID = tonumber(source)
        local vehicleName = tostring(args[2])
        TriggerClientEvent('VehicleSpawn', playerID, vehicleName)
      else
        local event = 'chatMessage'
        local eventTarget = source
        local messageSender = "SYSTEM"
        local messageSenderColor = {200, 0, 0}
        local message = "Usage: /spawn <Vehicle_Name>  (for example /spawn polmav)"
        TriggerClientEvent(event, eventTarget, messageSender, messageSenderColor, message)
      end
    end
  end)
end

function stringsplit(inputstr, sep) if sep == nil then sep = "%s" end local t={} ; i=1 for str in string.gmatch(inputstr, "([^"..sep.."]+)") do t[i] = str i = i + 1 end return t end
