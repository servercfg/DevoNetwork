local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_banking")
isTransfer = false


AddEventHandler("vRP:playerSpawn",function(user_id,source,last_login) 
    local bankbalance = vRP.getBankMoney({user_id})
  local wallet = vRP.getMoney({user_id})
    TriggerClientEvent('banking:updateBalance', source, bankbalance, wallet)
end)

RegisterServerEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
  local user_id = vRP.getUserId({source})
  local bankbalance = vRP.getBankMoney({user_id})
  local wallet = vRP.getMoney({user_id})
  TriggerClientEvent('banking:updateBalance', source, bankbalance, wallet)
end)

-- HELPER FUNCTIONS
function bankBalance(player)
  return vRP.getBankMoney({vRP.getUserId({player})})
end

function deposit(player, amount)
  local user_id = vRP.getUserId({player})
  local bankbalance = bankBalance(player)
  local new_balance = bankbalance + math.abs(amount)
  local wallet = vRP.getMoney({user_id})
  local new_wallet = wallet - math.abs(amount)

  TriggerClientEvent("banking:updateBalance", source, new_balance, new_wallet)
  vRP.tryDeposit({user_id,math.floor(math.abs(amount))})
end

function withdraw(player, amount)
  local user_id = vRP.getUserId({player})
  local bankbalance = bankBalance(player)
  local new_balance = bankbalance - math.abs(amount)
  local wallet = vRP.getMoney({user_id})
  local new_wallet = wallet + math.abs(amount)

  TriggerClientEvent("banking:updateBalance", source, new_balance, new_wallet)
  vRP.tryWithdraw({user_id,math.floor(math.abs(amount))})
end

function transfer (fPlayer, tPlayer, amount)
  local bankbalance = bankBalance(fPlayer)
  local bankbalance2 = bankBalance(tPlayer)
  local new_balance = bankbalance - math.abs(amount)
  local new_balance2 = bankbalance2 + math.abs(amount)
  local wallet = vRP.getMoney({user_id})

  local user_id = vRP.getUserId({fPlayer})
  local user_id2 = vRP.getUserId({tPlayer})

  vRP.setBankMoney({user_id, new_balance})
  vRP.setBankMoney({user_id2, new_balance2})

  TriggerClientEvent("banking:updateBalance", fPlayer, new_balance, wallet)
  TriggerClientEvent("banking:updateBalance", tPlayer, new_balance2, wallet)
end

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

AddEventHandler("chatMessage", function(s, n, m)
  local message = string.lower(m)
  local user_id = vRP.getUserId({s})
  local source = vRP.getUserSource({user_id})
  local bankbalance = vRP.getBankMoney({user_id})
  local wallet = vRP.getMoney({user_id})

  command = splitString(message)

  if command[1] == "/balance" then
    TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har "..bankbalance..",- DKK", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    TriggerClientEvent("banking:updateBalance", source, bankbalance, wallet)
    CancelEvent()
  end
  
  if command[1] == "/bank" then
    TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har "..bankbalance..",- DKK", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    TriggerClientEvent("banking:updateBalance", source, bankbalance, wallet)
    CancelEvent()
  end

  if command[1] == "/indsæt" then
    local amount = tonumber(command[2])
    TriggerClientEvent('bank:deposit', s, amount)
    CancelEvent()
  end

  if command[1] == "/hæv" then
    local amount = tonumber(command[2])
    TriggerClientEvent('bank:withdraw', s, amount)
    CancelEvent()
  end
  
end)

RegisterServerEvent('bank:update')
AddEventHandler('bank:update', function()
  local user_id = vRP.getUserId({source})
  local source = vRP.getUserSource({user_id})
  local bankbalance = vRP.getBankMoney({user_id})
  local wallet = vRP.getMoney({user_id})
  TriggerClientEvent("banking:updateBalance", source, bankbalance, wallet)
end)

-- Bank Deposit
RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
  if not amount then return end
    local user_id = vRP.getUserId({source})
    local source = vRP.getUserSource({user_id})
    local wallet = vRP.getMoney({user_id})
    local rounded = math.ceil(tonumber(amount))

    if(string.len(rounded) >= 9) then
      vRPclient.notify(user_id,{"~r~Beløb for højt."})
    else
      local bankbalance = vRP.getBankMoney({user_id})
      local newbalance = bankbalance + rounded
      if(rounded <= wallet) then
        TriggerClientEvent("banking:updateBalance", source, bankbalance, wallet)  
        TriggerClientEvent("banking:addBalance", source, rounded)
        TriggerClientEvent("pNotify:SendNotification", source,{text = "Du indsatte <b style='color: #4E9350'>"..math.floor(rounded).." DKK</b>.", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    
        deposit(source, rounded)
      else
        TriggerClientEvent("pNotify:SendNotification", user_id,{text = "Du har ikke nok penge i pungen.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      end
    end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
  if not amount then return end
    local user_id = vRP.getUserId({source})
    local source = vRP.getUserSource({user_id})
    local rounded = round(tonumber(amount), 0)
    if(string.len(rounded) >= 9) then
      vRPclient.notify(user_id,{"~r~Beløb for højt."})
    else
      local bankbalance = vRP.getBankMoney({user_id})
      local wallet = vRP.getMoney({user_id})
      local newbalance = bankbalance - rounded
      if(tonumber(rounded) <= tonumber(bankbalance)) then
        TriggerClientEvent("banking:updateBalance", source, newbalance, wallet)
        TriggerClientEvent("banking:removeBalance", source, rounded)
        TriggerClientEvent("pNotify:SendNotification", source,{text = "Du hævede <b style='color: #4E9350'>"..math.floor(rounded).." DKK</b>.", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        withdraw(source, rounded)
      else
        TriggerClientEvent("pNotify:SendNotification", user_id,{text = "Du har ikke nok penge på kontoen.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      end
    end
end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(fromPlayer, toPlayer, amount)
  local user_id = vRP.getUserId({source})
  local fPlayer = vRP.getUserSource({user_id})
  local wallet = vRP.getMoney({user_id})

  if tonumber(fPlayer) == tonumber(toPlayer) then
	TriggerClientEvent("pNotify:SendNotification", fPlayer,{text = "Du kan ikke overføre penge til dig selv.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    CancelEvent()
  else
    local rounded = round(tonumber(amount), 0)
    if(string.len(rounded) >= 9) then
		TriggerClientEvent("pNotify:SendNotification", source,{text = "Beløbet er for højt.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		CancelEvent()
    else
      local bankbalance = vRP.getBankMoney({user_id})
      local newbalance = bankbalance - rounded
      if(tonumber(rounded) <= tonumber(bankbalance)) then
        TriggerClientEvent("banking:updateBalance", fPlayer, newbalance, wallet)
        TriggerClientEvent("banking:removeBalance", fPlayer, rounded)
        local user_id2 = vRP.getUserId({toPlayer})
        local bankbalance2 = vRP.getBankMoney({user_id2})
		local newbalance2 = bankbalance2 + rounded
        
        transfer(fPlayer, toPlayer, rounded)
        
		TriggerClientEvent("pNotify:SendNotification", fPlayer,{text = "Overførte: <b style='color: #DB4646'>"..math.floor(rounded).." DKK</b>.", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        TriggerClientEvent("pNotify:SendNotification", fPlayer,{text = "Ny saldo: <b style='color: #FFC832'>"..math.floor((bankbalance - rounded)).." DKK</b>.", type = "info", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        
        TriggerClientEvent("banking:updateBalance", toPlayer, newbalance2, wallet)
        TriggerClientEvent("banking:addBalance", toPlayer, rounded)
        
		TriggerClientEvent("pNotify:SendNotification", toPlayer,{text = "Modtog: <b style='color: #4E9350'>"..math.floor(rounded).." DKK</b>.", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        TriggerClientEvent("pNotify:SendNotification", toPlayer,{text = "Ny saldo: <b style='color: #FFC832'>"..math.floor((bankbalance2 - rounded)).." DKK</b>.", type = "info", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		
        CancelEvent()
      else
        TriggerClientEvent("pNotify:SendNotification", fPlayer,{text = "Du har ikke nok penge på kontoen.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      end
    end    
  end
end)
