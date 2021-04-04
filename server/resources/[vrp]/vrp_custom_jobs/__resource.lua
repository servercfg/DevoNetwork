resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
dependency 'vrp'

client_scripts{
    "cl_taxi.lua"
}

server_scripts{
    "@vrp/lib/utils.lua",
    "sv_taxi.lua"
}
