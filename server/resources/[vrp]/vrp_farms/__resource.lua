dependency "vrp"

client_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    "cl_farm.lua"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "sv_farm.lua"
}