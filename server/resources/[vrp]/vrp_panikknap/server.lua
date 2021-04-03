--[[              
  /     \  _____     __| _/  ____   \______   \ ___.__.   ____    /     \  _____   _______ |  | __  ____  ________
 /  \ /  \ \__  \   / __ | _/ __ \   |    |  _/<   |  |  /  _ \  /  \ /  \ \__  \  \_  __ \|  |/ /_/ __ \ \___   /
/    Y    \ / __ \_/ /_/ | \  ___/   |    |   \ \___  | (  <_> )/    Y    \ / __ \_ |  | \/|    < \  ___/  /    / 
\____|__  /(____  /\____ |  \___  >  |______  / / ____|  \____/ \____|__  /(____  / |__|   |__|_ \ \___  >/_____ \
        \/      \/      \/      \/          \/  \/                      \/      \/              \/     \/       \/
------------------------CREDITS------------------------
--   Copyright 2019 ©oMarkez. All rights reserved    --
-------------------------------------------------------
]]

local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterNetEvent("vrp_panikknap:panik")
AddEventHandler("vrp_panikknap:panik", function(coords)
    local user_id = vRP.getUserId({source})

    if vRP.hasPermission({user_id, cfg.permission}) then
        PerformHttpRequest('https://discordapp.com/api/webhooks/641322652782559242/HfycRe6qpwcQnugQRLNzj824wXNiFT6pkLzuUow400E2LNyAYtL11hjlPxiCJWStUxDj', function(err, text, headers) end, 'POST', json.encode({username = "Panikknap logs", content = "ID: **"..user_id.."** har trykket panikknap"}), { ['Content-Type'] = 'application/json' })
        vRP.sendServiceAlert({source, cfg.service, coords.x, coords.y, coords.z, cfg.msg})
    end
end)

RegisterNetEvent("vrp_panikknap:gps")
AddEventHandler("vrp_panikknap:gps", function(coords)
    local user_id = vRP.getUserId({source})

    if vRP.hasPermission({user_id, cfg.permission}) then
        PerformHttpRequest('https://discordapp.com/api/webhooks/641322652782559242/HfycRe6qpwcQnugQRLNzj824wXNiFT6pkLzuUow400E2LNyAYtL11hjlPxiCJWStUxDj', function(err, text, headers) end, 'POST', json.encode({username = "Panikknap logs", content = "ID: **"..user_id.."** har sendt gps"}), { ['Content-Type'] = 'application/json' })
        vRP.sendServiceAlertr({source, cfg.service, coords.x, coords.y, coords.z, cfg.msg2})
    end
end)