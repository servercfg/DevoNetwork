local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

RegisterServerEvent('dispatch')
AddEventHandler('dispatch', function(x,y,z,message)
	local players = {}
	local users = vRP.getUsers({})
    for k,v in pairs(users) do
      	local player = vRP.getUserSource({k})
      	if player ~= nil then
      		local user_id = vRP.getUserId({player})
      		if vRP.hasGroup({user_id, "Politi-Job"}) or vRP.hasGroup({user_id, "EMS-Job"}) then
                table.insert(players,player)
            end
      	end
	end
	for k,v in pairs(players) do
  		TriggerClientEvent('notifyDispatch', v, x,y,z,message)
    end
end)

RegisterServerEvent('dispatchpolice')
AddEventHandler('dispatchpolice', function(x,y,z,message)
	local source = source
	local luser_id = vRP.getUserId({source})
	if vRP.hasGroup({luser_id, "Politi-Job"}) == false then
		local players = {}
		local users = vRP.getUsers({})
		for k,v in pairs(users) do
			local player = vRP.getUserSource({k})
			if player ~= nil then
				local user_id = vRP.getUserId({player})
				if vRP.hasGroup({user_id, "Politi-Job"}) then
					table.insert(players,player)
				end
			end
		end
		for k,v in pairs(players) do
			TriggerClientEvent('notifyDispatch', v, x,y,z,message)
		end
	end
end)

RegisterServerEvent('dispatchems')
AddEventHandler('dispatchems', function(x,y,z,message)
	local players = {}
	local users = vRP.getUsers({})
	for k,v in pairs(users) do
		local player = vRP.getUserSource({k})
		if player ~= nil then
			local user_id = vRP.getUserId({player})
			if vRP.hasGroup({user_id, "EMS-Job"}) then
				table.insert(players,player)
			end
		end
	end
	for k,v in pairs(players) do
		TriggerClientEvent('notifyDispatch', v, x,y,z,message)
	end
end)

--[[
RegisterServerEvent('dispatch2')
AddEventHandler('dispatch2', function(x,y,z,message)
  local players = {}
  local users = vRP.getUsers({})
  local isPolice = false

    for k,v in pairs(users) do
      
        local player = vRP.getUserSource({k})
        
        if player ~= nil then
          local user_id = vRP.getUserId({player})

          isPolice = vRP.hasPermission({user_id, "police.menu"})


          if isPolice then
            table.insert(players,player)
          end
        end
  end

  for k,v in pairs(players) do
      TriggerClientEvent('notifyDispatch', v, x,y,z,message)
    end
end)]]
