
description "vRP holdup"

dependency "vrp"

client_scripts{ 
  "cfg/holdup.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "cfg/holdup.lua",
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
