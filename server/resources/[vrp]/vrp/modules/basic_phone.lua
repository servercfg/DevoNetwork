-- basic phone module
local lang = vRP.lang
local cfg = module("cfg/phone")
local htmlEntities = module("lib/htmlEntities")
local services = cfg.services
local announces = cfg.announces

local sanitizes = module("cfg/sanitizes")

--Discord
local DiscordWebhook = 'https://discordapp.com/api/webhooks/611240065565458452/tko6rmGc6OWJ2ytoz3XGb1jIs66l5dEsUC1vXU3zkYVdC7DyHZSrTgQ1WEgmhhEydQb1'
-- PerformHttpRequest(DiscordWebhook, function(Error, Content, Head) end, 'POST', json.encode({username = "Distrikt "..GetConvar("servernumber"), content = '**Indlæser...** | Status: Ny dag'}), { ['Content-Type'] = 'application/json' })

-- get phone directory data table
function vRP.getPhoneDirectory(user_id)
    local data = vRP.getUserDataTable(user_id)
    if data then
        if data.phone_directory == nil then
            data.phone_directory = {}
        end

        return data.phone_directory
    else
        return {}
    end
end

function vRP.sendServiceAlert(sender, service_name,x,y,z,msg)
  local service = services[service_name]
  local answered = false
  if service then
    local players = {}
    for k,v in pairs(vRP.rusers) do
      local player = vRP.getUserSource(tonumber(k))
      -- check user
      if vRP.hasPermission(k,service.alert_permission) and player ~= nil then
        table.insert(players,player)
      end
    end

    -- send notify and alert to all listening players
    for k,v in pairs(players) do
      --vRPclient.notify(v,{service.alert_notify..msg})
      --TriggerClientEvent("pNotify:SendNotification",v,{text = ""..msg.."", type = "info", queue = "global", timeout = 5000, layout = "bottomCenter", animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      TriggerClientEvent("pNotify:SendNotification",v,{text = ""..msg.."", type = "info", queue = "global", timeout = 5000, layout = "centerRight", animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, sounds = { sources = {"panikknap.ogg"}, volume = 0.1, conditions = {"docVisible"}}})
      -- add position for service.time seconds
      vRPclient.addBlip(v,{x,y,z,service.blipid,service.blipcolor,"("..service_name..") "..msg}, function(bid)
        SetTimeout(service.alert_time*1000,function()
          vRPclient.removeBlip(v,{bid})
        end)
      end)

      -- call request
      if sender ~= nil then
        vRP.request(v,lang.phone.service.ask_call({service_name, htmlEntities.encode(msg)}), 30, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              vRPclient.notify(sender,{service.answer_notify})
              vRPclient.setGPS(v,{x,y})
              answered = true
            else
              vRPclient.notify(v,{lang.phone.service.taken()})
            end
          end
        end)
      elseif sender == nil then
        vRP.request(v,lang.phone.service.ask_call({service_name, htmlEntities.encode(msg)}), 30, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              vRPclient.setGPS(v,{x,y})
              answered = true
            else
              vRPclient.notify(v,{lang.phone.service.taken()})
            end
          end
        end)
      end
    end
  end
end

function vRP.sendServiceAlertr(sender, service_name,x,y,z,msg)
  local service = services[service_name]
  local answered = false
  if service then
    local players = {}
    for k,v in pairs(vRP.rusers) do
      local player = vRP.getUserSource(tonumber(k))
      -- check user
      if vRP.hasPermission(k,service.alert_permission) and player ~= nil then
        table.insert(players,player)
      end
    end

    -- send notify and alert to all listening players
    for k,v in pairs(players) do
      --vRPclient.notify(v,{service.alert_notify..msg})
      --TriggerClientEvent("pNotify:SendNotification",v,{text = ""..msg.."", type = "info", queue = "global", timeout = 5000, layout = "bottomCenter", animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      TriggerClientEvent("pNotify:SendNotification",v,{text = ""..msg.."", type = "info", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      -- add position for service.time seconds
      vRPclient.addBlip(v,{x,y,z,service.blipid,service.blipcolor,"("..service_name..") "..msg}, function(bid)
        SetTimeout(service.alert_time*1000,function()
          vRPclient.removeBlip(v,{bid})
        end)
      end)

      -- call request
      if sender ~= nil then
        vRP.request(v,lang.phone.service.ask_call({service_name, htmlEntities.encode(msg)}), 30, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              vRPclient.notify(sender,{service.answer_notify})
              vRPclient.setGPS(v,{x,y})
              answered = true
            else
              vRPclient.notify(v,{lang.phone.service.taken()})
            end
          end
        end)
      elseif sender == nil then
        vRP.request(v,lang.phone.service.ask_call({service_name, htmlEntities.encode(msg)}), 30, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              vRPclient.setGPS(v,{x,y})
              answered = true
            else
              vRPclient.notify(v,{lang.phone.service.taken()})
            end
          end
        end)
      end
    end
  end
end

function vRP.changeContact(user_id,nphone,number,phone)
    local data = vRP.getUserDataTable(user_id)
    if data then
        if data.phone_directory ~= nil then
            local phone_directory = data.phone_directory
            phone_directory[nphone] = number
            if nphone ~= phone then
                phone_directory[phone] = nil
            end
            data.phone_directory = phone_directory
        end
    end
end
function vRP.removeContact(user_id,name)
    local data = vRP.getUserDataTable(user_id)
    if data then
        if data.phone_directory ~= nil then
            local phone_directory = data.phone_directory
            if phone_directory[name] ~= nil then
                phone_directory[name] = nil
                data.phone_directory = phone_directory
            end
        end
    end
end
function vRP.addContact(user_id,name,number)
    local data = vRP.getUserDataTable(user_id)
    if data then
        if data.phone_directory ~= nil then
            local phone_directory = data.phone_directory
            phone_directory[name] = number
            data.phone_directory = phone_directory
        end
    end
end
function vRP.deleteAllContact(user_id)
    local data = vRP.getUserDataTable(user_id)
    if data then
        if data.phone_directory ~= nil then
            data.phone_directory = {}
        end
    end
end
-- get directory name by number for a specific user
function vRP.getPhoneDirectoryName(user_id, phone)
    local directory = vRP.getPhoneDirectory(user_id)
    for k,v in pairs(directory) do
        if v == phone then
            return k
        end
    end

    return "ukendt"
end

-- build announce menu
local announce_menu = {name=lang.phone.announce.title(),css={top="75px",header_color="rgba(133,189,191,0.75)"}}

-- nest menu
announce_menu.onclose = function(player) vRP.openMenu(player, phone_menu) end

local function ch_announce_alert(player,choice) -- alert a announce
    local announce = announces[choice]
    local user_id = vRP.getUserId(player)
    if announce and user_id ~= nil then
        if announce.permission == nil or vRP.hasPermission(user_id,announce.permission) then
            vRP.prompt(player,lang.phone.announce.prompt(),"",function(player, msg)
                msg = sanitizeString(msg,sanitizes.text[1],sanitizes.text[2])
                if string.len(msg) > 10 and string.len(msg) < 1000 then
                    if announce.price <= 0 or vRP.tryFullPayment(user_id, announce.price) then -- try to pay the announce
                        TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.paid({announce.price})}, type = "success", queue = "global",timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})

                        msg = htmlEntities.encode(msg)
                        msg = string.gsub(msg, "\n", "<br />") -- allow returns

                        -- send announce to all
                        local users = vRP.getUsers()
                        for k,v in pairs(users) do
                            vRPclient.announce(v,{announce.image,msg})
                        end
                    else
                        TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.not_enough()}, type = "error", queue = "global",timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    end
                else
                    TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.invalid_value()}, type = "error", queue = "global",timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                end
            end)
        else
            TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.not_allowed()}, type = "error", queue = "global",timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
    end
end

for k,v in pairs(announces) do
    announce_menu[k] = {ch_announce_alert,lang.phone.announce.item_desc({v.price,v.description or ""})}
end

local function ch_announce(player, choice)
    vRP.openMenu(player,announce_menu)
end
