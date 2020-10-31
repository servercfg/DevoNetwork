


local dname = "Server Status"
local dmessage = " **Server 1 er på vej op!** ```IP: 54.37.88.10:30001``` @here "
PerformHttpRequest('https://discordapp.com/api/webhooks/640613874143461406/4SPKRpZgfSCYo2AoAwQ1zrfO4D4C_F_RqVmV5K6onBv8uxH4hdOXEEqvM-sRm1AFGo5a', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })

