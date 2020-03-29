--
-- Created by IntelliJ IDEA.
-- User: Sling
-- Date: 26-03-2019
-- Time: 20:27
-- Made for CiviliansNetwork
--

local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

local isCarsPlaced = false
local defaultcars = {

}
local fotovogne = {

}

local basiccost = 5000

RegisterServerEvent('cn-fotovogn:betal')
AddEventHandler('cn-fotovogn:betal', function(speed,limit,veh)
	local source = source
	local user_id = vRP.getUserId({source})
	local percent = speed/limit
	local tax = basiccost * percent
    if percent > 1.3 then
        tax = tax*1.5
    end
    tax = math.floor(tax)
    local payment = vRP.tryBankPaymentOrDebt({user_id,tax})
	if payment ~= false then
		if payment == "paid" then
			TriggerClientEvent("pNotify:SendNotification", source,{text = "<b style='color:#ED2939'>Fotovogn</b><br /><br />Du kørte " .. speed .. "km/t hvor du må køre "..limit.." km/t <br /><b style='color:#26ff26'>Bøde</b>: " .. tax .." DKK", type = "error", queue = "fart", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
		else
			TriggerClientEvent("pNotify:SendNotification", source,{text = "<b style='color:#ED2939'>Fotovogn</b><br /><br />Du kørte " .. speed .. "km/t hvor du må køre "..limit.." km/t <br /><b style='color:#26ff26'>Bøde</b>: " .. tax .." DKK".."<br>Nuværende gæld: <b style='color: #DB4646'>"..format_thousands(payment).." DKK</b>", type = "error", queue = "fart", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
		end
    end
    TriggerClientEvent("cn-fotovogn:sendalert",-1,veh,tax,speed)
end)

RegisterServerEvent('cn-fotovogn:sendvogn')
AddEventHandler('cn-fotovogn:sendvogn', function(veh,list)
	fotovogne[veh] = list
	TriggerClientEvent("cn-fotovogn:sendvogn",-1,fotovogne)
    if isCarsPlaced == false then isCarsPlaced = true end
end)

RegisterServerEvent('cn-fotovogn:removevogn')
AddEventHandler('cn-fotovogn:removevogn', function(veh)
    fotovogne[veh] = nil
    TriggerClientEvent("cn-fotovogn:sendvogn",-1,fotovogne)
end)

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
		TriggerClientEvent('cn-fotovogn:sendvogn', source, fotovogne)
        if isCarsPlaced == false then
            TriggerClientEvent('cn-fotovogn:createdefault', source, defaultcars)
        end
	end
end)


--[[RegisterServerEvent('qweqweqewqwqeqweeqwqewqewqeweqwqewqweqeqewewq')
AddEventHandler('qweqweqewqwqeqweeqwqewqewqeweqwqewqweqeqewewq', function()
    TriggerClientEvent('cn-fotovogn:createdefault', -1, defaultcars)
end)]]

function format_thousands(v)
    local s = string.format("%d", math.floor(v))
    local pos = string.len(s) % 3
    if pos == 0 then pos = 3 end
    return string.sub(s, 1, pos)
            .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
end