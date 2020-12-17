local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_kikkert")


--SERVER EVENTET--

    vRP.defInventoryItem({"kikkert","Kikkert","Bruges til at se ting på lang afstand",
        function(args)
            local choices = {}
            choices["> Brug"] = {function(player,choice)
                local user_id = vRP.getUserId({player})
                if user_id ~= nil then
                        if vRP.hasInventoryItem({user_id, "kikkert", 1, false}) then
                          TriggerClientEvent("pNotify:SendNotification", player,{text = "Brug<b style='color: #72AEE5'> musehjulet </b>til at zoome ind!", type = "warning", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
                          TriggerClientEvent('kikkert:Aktiver', player)
                    end
                vRP.closeMenu({player})
            end
        end,"Denne kikkert kan se meget langt!"}

        return choices
    end, 1.50
})
