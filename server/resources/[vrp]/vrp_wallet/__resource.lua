resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_scripts {
	"@vrp/lib/utils.lua",
	'server.lua'
}

client_scripts {
	'lib/Tunnel.lua',
	'lib/Proxy.lua',
	'client.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/style.css',
	'html/app.js',
	'html/font/edosz.ttf',
	'html/img/bg/moon.png',
	'html/img/bg/crop.jpg',
	'html/img/icon_money/bank.png',	
	'html/img/icon_money/wallet.png'
	
}