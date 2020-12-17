-- a basic gunshop implementation

local cfg = module("cfg/gunshops")
local lang = vRP.lang

local gunshops = cfg.gunshops
local gunshops_hidden = cfg.gunshops_hidden
local gunshop_types = cfg.gunshop_types

local gunshop_menus = {}

function vRP.updateArmor(armor)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    vRP.setUData(user_id,"vRP:bodyarmor",armor)
  end
end

-- build gunshop menus
for gtype,weapons in pairs(gunshop_types) do
  local gunshop_menu = {
    name=lang.gunshop.title({gtype}),
    css={top = "75px", header_color="rgba(255,0,0,0.75)"}
  }

  -- build gunshop items
  local kitems = {}

  -- item choice
  local gunshop_choice = function(player,choice)
    local weapon = kitems[choice][1]
    local price = kitems[choice][2]
    local price_ammo = kitems[choice][3]

    if weapon then
      local user_id = vRP.getUserId(player)
      if weapon == "ARMOR" then-- get player weapons to not rebuy the body
        -- payment
        if user_id ~= nil and vRP.tryFullPayment(user_id,price) then
          vRPclient.setArmour(player,{100,true})
          TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.paid({price})}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        else
          TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.not_enough()}, type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
      elseif weapon == "ARMOR1" then-- get player weapons to not rebuy the body
        -- payment
        if user_id ~= nil and vRP.tryFullPayment(user_id,price) then
          vRPclient.setArmour(player,{25,true})
          TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.paid({price})}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        else
          TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.not_enough()}, type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
      else
        -- get player weapons to not rebuy the body
        vRPclient.getWeapons(player,{},function(weapons)
          -- prompt amount
          vRP.prompt(player,lang.gunshop.prompt_ammo({choice}),"",function(player,amount)
            local amount = parseInt(amount)
            if amount > 250 then
              amount = 250
            end
            if amount >= 0 then
              local total = math.ceil(parseFloat(price_ammo)*parseFloat(amount))

              if weapons[string.upper(weapon)] == nil then -- add body price if not already owned
                total = total+price
              end

              if amount > 250 then amount = 250
              end

              -- payment
              if user_id ~= nil and vRP.tryFullPayment(user_id,total) then
                vRPclient.giveWeapons(player,{{
                  [weapon] = {ammo=amount}
                }})

                TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.paid({price})}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
              else
                TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.not_enough()}, type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
              end
            else
              TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.invalid_value()}, type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
          end)
        end)
      end
    end
  end

  -- add item options
  for k,v in pairs(weapons) do
    if k ~= "_config" then -- ignore config property
      kitems[v[1]] = {k,math.max(v[2],0),math.max(v[3],0)} -- idname/price/price_ammo
      gunshop_menu[v[1]] = {gunshop_choice,lang.gunshop.info({v[2],v[3],v[4]})} -- add description
    end
  end

  gunshop_menus[gtype] = gunshop_menu
end

local function build_client_gunshops(source)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    for k,v in pairs(gunshops) do
      local gtype,x,y,z,hidden = table.unpack(v)
      local group = gunshop_types[gtype]
      local menu = gunshop_menus[gtype]

      if group and menu then
        local gcfg = group._config

        local function gunshop_enter()
          local user_id = vRP.getUserId(source)
          if user_id ~= nil and vRP.hasPermissions(user_id,gcfg.permissions or {}) then
            vRP.openMenu(source,menu)
          end
        end

        local function gunshop_leave()
          vRP.closeMenu(source)
        end

        if hidden == true then
          vRPclient.addMarker(source,{x,y,z-0.87,0.7,0.7,0.5,0,255,125,125,150})
          vRP.setArea(source,"vRP:gunshop"..k,x,y,z,1,1.5,gunshop_enter,gunshop_leave)
        else
          vRPclient.addBlip(source,{x,y,z,gcfg.blipid,gcfg.blipcolor,lang.gunshop.title({gtype})})
          vRPclient.addMarker(source,{x,y,z-0.87,0.7,0.7,0.5,0,255,125,125,150})
          vRP.setArea(source,"vRP:gunshop"..k,x,y,z,1,1.5,gunshop_enter,gunshop_leave)
        end
      end
    end
  end
end

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
  if first_spawn then
    build_client_gunshops(source)
    SetTimeout(30000,function() -- increase this if you have problems with armor not saving
      vRP.getUData(user_id,"vRP:bodyarmor",function(armor)
        if armor ~= nil then
          vRPclient.setsArmour(source,{tonumber(armor),true})
        end
      end)
    end)
  end
end)
