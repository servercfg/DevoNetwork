resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

dependency "vrp"

client_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    "lib/enum.lua",
	"client/radar.lua",
    "client/stungun.lua",
    "client/dive.lua",
    "client/DriveByLimit.lua",
	"client/nowanted.lua",
}

server_scripts {
    "@vrp/lib/utils.lua",
    "server/dive.lua",
    "server/discord_support.lua",
}