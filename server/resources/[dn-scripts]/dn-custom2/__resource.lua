resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

dependency "vrp"

client_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    "lib/enum.lua",
    "client/handsup.lua",
    "client/nowanted.lua",
    "client/pointfinger.lua",
    "client/scope.lua",
    "client/vinduerul.lua",
    "client/noweapondrops.lua",
    "client/ragdoll.lua",
    "client/crouch.lua",
    "client/autopilot.lua",
    "client/opgiv.lua",
}

server_scripts {
    "@vrp/lib/utils.lua",
    "server/revive.lua",
	"server/uptime.lua",
}