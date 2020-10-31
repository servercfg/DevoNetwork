--
-- Created by IntelliJ IDEA.
-- User: Sling
-- Date: 21-03-2019
-- Time: 17:35
-- Made for CiviliansNetwork
--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")


vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_revive")

AddEventHandler( 'chatMessage', function( source, n, msg )
    msg = string.lower( msg )
    if msg == "/revive" then
        CancelEvent()
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        if vRP.hasPermission({user_id,"admin.revive"}) then
            vRPclient.setHealth(player, {200})
            vRP.setHunger({user_id,0})
            vRP.setThirst({user_id,0})
        end
    end
end)