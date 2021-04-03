local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp_basic_mission", "cfg/missions")

-- load global and local languages
local glang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})
local lang = Lang.new(module("vrp_basic_mission", "cfg/lang/"..cfg.lang) or {})

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_mission")
Mclient = Tunnel.getInterface("vRP_basic_mission","vRP_basic_mission")

function task_mission()


  -- SKRALDEMAND
  for k,v in pairs(cfg.skraldemand) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.skraldemandstart({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.skraldemandstart({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                Mclient.CarModelCheck(player, {}, function(car)
                  if car then
                    Mclient.freezePedVehicle(player,{true})
                    TriggerClientEvent("pNotify:SendNotification", player,{text = {"Samler Skrald"}, type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    SetTimeout(5000, function()
                      vRP.nextMissionStep({player})
                      Mclient.freezePedVehicle(player,{false})
                      -- last step
                      if i == v.steps then
                        vRP.giveBankMoney({user_id,v.reward})
                        vRPclient.notify(player,{lang.money.received({v.reward})})
                        vRPclient.notify(player,"Det var det for nu!")
                      else
                        vRPclient.notify(player,"Kør til næste drstination.")
                      end
                    end)
                  else TriggerClientEvent("pNotify:SendNotification", player,{text = {"Du køre i det forkerte køretøj"}, type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                  end
                end)
              end,
              position = v.positions[math.random(1,#v.positions+1)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end

  -- FARMER
  for k,v in pairs(cfg.farmer1) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then -- Uncomment hasGroup by removing --[[ ]] to check for basic_menu Service button.
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.farmer1({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.farmer({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)

                  vRPclient.playAnim(player,{false,{task="PROP_HUMAN_PARKING_METER"},false})
                  SetTimeout(15000, function()
                    vRP.nextMissionStep({player})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveBankMoney({user_id,v.reward})
					  TriggerClientEvent("pNotify:SendNotification", player,{text = {glang.money.received({v.reward})}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    end
                  end)
              end,
              position = v.positions[math.random(1,#v.positions+1)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end

    -- FARMER2
  for k,v in pairs(cfg.farmer2) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then -- Uncomment hasGroup by removing --[[ ]] to check for basic_menu Service button.
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.farmer({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.farmer({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)

                  vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_GARDENER_PLANT"},false})
                  SetTimeout(15000, function()
                    vRP.nextMissionStep({player})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveBankMoney({user_id,v.reward})
					  TriggerClientEvent("pNotify:SendNotification", player,{text = {glang.money.received({v.reward})}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
                    end
                  end)
              end,
              position = v.positions[math.random(1,#v.positions+1)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end


  SetTimeout(60000,task_mission)
end
task_mission()
