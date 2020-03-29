--[[
https://discord.gg/hYrzyXd
]]

description 'AntiCheat'

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
    'anticheat-cl.lua'
}
server_scripts {
	'@es_extended/locale.lua',
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/en.lua',
	'config.lua',
    'anticheat-sv.lua'
}

dependencies {
	'essentialmode',
	'async'
}
