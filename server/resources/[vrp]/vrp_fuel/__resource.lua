client_script 'config.lua'
server_script 'config.lua'


ui_page 'notifs/index.html'

client_scripts {
	'map.lua',
	'client.lua',
	'GUI.lua',
	'models_c.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'server.lua'
}

--[[
__________         ___ ___                             .__               
\______   \___.__./   |   \ ___.__.______   ___________|__| ____   ____  
 |    |  _<   |  /    ~    <   |  |\____ \_/ __ \_  __ \  |/  _ \ /    \ 
 |    |   \\___  \    Y    /\___  ||  |_> >  ___/|  | \/  (  <_> )   |  \
 |______  // ____|\___|_  / / ____||   __/ \___  >__|  |__|\____/|___|  /
        \/ \/           \/  \/     |__|        \/                     \/ 
--]]
