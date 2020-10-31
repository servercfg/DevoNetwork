resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'vrp_prisonwork'


server_scripts {
  '@vrp/lib/utils.lua',
  'config.lua',
  'server/main.lua',
}

client_scripts {
  'lib/Proxy.lua',
  'lib/Tunnel.lua',
  'config.lua',
  'client/main.lua'
}