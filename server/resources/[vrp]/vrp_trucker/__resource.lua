
description "vrp_trucker"
--ui_page "ui/index.html"

dependency "vrp"

client_scripts{ 
  "lib/Proxy.lua",
  "lib/Tunnel.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}


--[[
__________         ___ ___                             .__               
\______   \___.__./   |   \ ___.__.______   ___________|__| ____   ____  
 |    |  _<   |  /    ~    <   |  |\____ \_/ __ \_  __ \  |/  _ \ /    \ 
 |    |   \\___  \    Y    /\___  ||  |_> >  ___/|  | \/  (  <_> )   |  \
 |______  // ____|\___|_  / / ____||   __/ \___  >__|  |__|\____/|___|  /
        \/ \/           \/  \/     |__|        \/                     \/ 
--]]
