local htmlEntities = module("lib/htmlEntities")
local Tools = module("lib/Tools")
local lang = vRP.lang
local cfg = module("cfg/admin")

-- this module define some admin menu functions
local player_lists = {}

local function ch_list(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil and vRP.hasPermission(user_id,"player.list") then
        if player_lists[player] then -- hide
            player_lists[player] = nil
            vRPclient.removeDiv(player,{"user_list"})
        else -- show
            local content = ""
            local count = 0
            for k,v in pairs(vRP.rusers) do
                count = count+1
                local source = vRP.getUserSource(k)
                vRP.getUserIdentity(k, function(identity)
                    if source ~= nil then
                        if identity then
                            content = content.."("..k..") <span class=\"pseudo\">"..vRP.getPlayerName(source).."</span> - <span class=\"name\">"..htmlEntities.encode(identity.firstname).." "..htmlEntities.encode(identity.name).."</span> CPR: <span class=\"reg\">"..identity.registration.."</span> TLF: <span class=\"phone\">"..identity.phone.."</span><br>"
                        end
                    end

                    -- check end
                    count = count-1
                    if count == 0 then
                        player_lists[player] = true
                        local css = [[
				.div_user_list{ 
				  margin: auto; 
				  padding: 8px; 
				  width: 650px; 
				  margin-top: 90px; 
				  background: black; 
				  color: white; 
				  font-weight: bold; 
				  font-size: 16px;
				  font-family: arial;
				} 

				.div_user_list .pseudo{ 
				  color: rgb(0,255,125);
				}

				.div_user_list .endpoint{ 
				  color: rgb(255,0,0);
				}

				.div_user_list .name{ 
				  color: #309eff;
				}

				.div_user_list .reg{ 
				  color: rgb(0,125,255);
				}
							  
				.div_user_list .phone{ 
				  color: rgb(211, 0, 255);
				}
            ]]
                        vRPclient.setDiv(player,{"user_list", css, content})
                    end
                end)
            end
        end
    end
end

local function ch_whitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.whitelist") then
    vRP.prompt(player,"ID: ","",function(player,id)
      id = parseInt(id)
      vRP.setWhitelisted(id,true)

      local dname = "[ ID: ".. tostring(user_id).. " ] - Server | Whitelist"
      local dmessage = "**[ ID: ".. tostring(user_id).. " ]** Tilføjede whitelist til **[ ID: " .. tostring(id).. " ]**."
      PerformHttpRequest('https://discordapp.com/api/webhooks/640566915512795167/x8270VUnSIHDOc6NJR-GAJnDqgxK1l1CQQvOKUEiMtv32L1ut1RYjWdkR9-5R1qdhxW1', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })


      TriggerClientEvent("pNotify:SendNotification", player,{text = "ID " ..id.. " blev whitelisted", type = "success", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end)
  end
end

local function ch_unwhitelist(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unwhitelist") then
    vRP.prompt(player,"ID: ","",function(player,id)
      id = parseInt(id)
      vRP.isDD(id, function(DD)
      	if not DD then
      		vRP.setWhitelisted(id,false)
      	end
      end)

      local dname = "[ ID: ".. tostring(user_id).. " ] - Server | Unwhitelist"
      local dmessage = "**[ ID: ".. tostring(user_id).. " ]** Fjernede whitelist Fra **[ ID: " .. tostring(id).. " ]**."
      PerformHttpRequest('https://discordapp.com/api/webhooks/640566915512795167/x8270VUnSIHDOc6NJR-GAJnDqgxK1l1CQQvOKUEiMtv32L1ut1RYjWdkR9-5R1qdhxW1', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })

      TriggerClientEvent("pNotify:SendNotification", player,{text = "ID " ..id.. " blev unwhitelisted", type = "success", queue = "global", timeout = 3000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end)
  end
end

local function ch_addgroup(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add") then
        vRP.prompt(player,"Spiller ID: ","",function(player,id)
            id = parseInt(id)
            local checkid = vRP.getUserSource(tonumber(id))
            if checkid ~= nil then
                vRP.prompt(player,"Job: ","",function(player,group)
                    if group == " " or group == "" or group == null or group == 0 or group == nil then
                        TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et job.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    else
                        if group == "Staff" or group == "ledelse" or group == "Head Admin" or group == "Senior Admin" or group == "Admin" or group == "Moderator" or group == "Supporter" then
                            TriggerClientEvent("pNotify:SendNotification", player,{text = "Du har ikke rettigheder til at tildele rangen "..group, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        else
                            vRP.addUserGroup(id,group)
                            TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev ansat som "..group, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        end
                    end
                end)
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = "ID "..id.." er ugyldigt eller ikke online.", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        end)
    end
end

local function ch_removegroup(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove") then
        vRP.prompt(player,"Spiller ID: ","",function(player,id)
            id = parseInt(id)
            local checkid = vRP.getUserSource(tonumber(id))
            local checkid = vRP.getUserSource(tonumber(id))
            if checkid ~= nil then
                vRP.prompt(player,"Job: ","",function(player,group)
                    if group == " " or group == "" or group == null or group == 0 or group == nil then
                        TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et job.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    else
                        if group == "Staff" or group == "ledelse" or group == "Head Admin" or group == "Senior Admin" or group == "Admin" or group == "Moderator" or group == "Supporter" then
                            TriggerClientEvent("pNotify:SendNotification", player,{text = "Du har ikke rettigheder til at fyre rangen "..group, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        else
                            vRP.isDD(id, function(DD)
      							if not DD then
                            		vRP.removeUserGroup(id,group)
                            	end
                            end)

                            TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev fyret som "..group, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        end
                    end
                end)
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = "ID "..id.." er ugyldigt eller ikke online.", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        end)
    end
end

local function ch_addgroup_staff(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil and vRP.hasPermission(user_id,"player.group.add.staff") then
        vRP.prompt(player,"Spiller ID: ","",function(player,id)
            id = parseInt(id)
            local checkid = vRP.getUserSource(tonumber(id))
            if checkid ~= nil then
                vRP.prompt(player,"Job: ","",function(player,group)
                    if group == " " or group == "" or group == null or group == 0 or group == nil then
                        TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et job/rang.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    else
                        vRP.addUserGroup(id,group)

                        local dname = "Server "..GetConvar("servernumber", "1") .."- Addgroup"
                        local dmessage = "**".. tostring(user_id).. "** tilføjede gruppe **[ ".. tostring(group).. " ]** til **" .. tostring(id).. "**"
                        PerformHttpRequest('https://discordapp.com/api/webhooks/640566742116204544/fA-HYtSDvkoRBBgTqyc_kMLRYfB_pN6KhR67pDYNash57MKHTusFEmTzXoWLU8kOWW_h', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })

                        TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev ansat som "..group, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    end
                end)
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = "ID "..id.." er ugyldigt eller ikke online.", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        end)
    end
end

local function ch_removegroup_staff(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil and vRP.hasPermission(user_id,"player.group.remove.staff") then
        vRP.prompt(player,"Spiller ID: ","",function(player,id)
            id = parseInt(id)
            local checkid = vRP.getUserSource(tonumber(id))
            if checkid ~= nil then
                vRP.prompt(player,"Job: ","",function(player,group)
                    if group == " " or group == "" or group == null or group == 0 or group == nil then
                        TriggerClientEvent("pNotify:SendNotification",player,{text = "Du angav ikke et job/rang.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    else
                        vRP.isDD(id, function(DD)
      						if not DD then
                        		vRP.removeUserGroup(id,group)
                        	end
                        end)

                        local dname = "Server "..GetConvar("servernumber", "1") .." Removegroup"
                        local dmessage = "**".. tostring(user_id).. "** fjernet gruppe **[ ".. tostring(group).. " ]** fra **" .. tostring(id).. "**"
                        PerformHttpRequest('https://discordapp.com/api/webhooks/640566742116204544/fA-HYtSDvkoRBBgTqyc_kMLRYfB_pN6KhR67pDYNash57MKHTusFEmTzXoWLU8kOWW_h', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })

                        TriggerClientEvent("pNotify:SendNotification", player,{text = id.." blev fyret som "..group, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    end
                end)
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = "ID "..id.." er ugyldigt eller ikke online.", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        end)
    end
end

local function ch_seize(player,choice)
    local user_id = vRP.getUserId(player)
    local seized_items = {}
    if user_id ~= nil then
        vRPclient.getNearestPlayer(player, {5}, function(nplayer)
            local nuser_id = vRP.getUserId(nplayer)
            if nuser_id ~= nil and vRP.hasPermission(nuser_id, "staff.seizable") then
                vRP.getUserIdentity(user_id, function(identity_cop)
                    vRP.getUserIdentity(nuser_id, function(identity_civ)
                        if identity_cop and identity_civ then
                            local cop_name = identity_cop.firstname
                            local cop_lname = identity_cop.name
                            local civ_name = identity_civ.firstname
                            local civ_lname = identity_civ.name
                            table.insert(seized_items, "**"..cop_name.." "..cop_lname.." ("..user_id..")** beslaglagde følgende genstande fra **"..civ_name.." "..civ_lname.." ("..nuser_id..")**: \n")
                            for k,v in pairs(cfg.removeable_items) do -- transfer seizable items
                                local amount = vRP.getInventoryItemAmount(nuser_id,v)
                                if amount > 0 then
                                    local item = vRP.items[v]
                                    if item then -- do transfer
                                        if vRP.tryGetInventoryItem(nuser_id,v,amount,true) then
                                            table.insert(seized_items, "- "..amount.."x "..vRP.getItemName(v).."\n")
                                            TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.police.menu.seize.seized({item.name,amount})}, type = "info", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                        end
                                    end
                                end
                            end
                            PerformHttpRequest('https://discordapp.com/api/webhooks/640566742116204544/fA-HYtSDvkoRBBgTqyc_kMLRYfB_pN6KhR67pDYNash57MKHTusFEmTzXoWLU8kOWW_h', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0").." - Seize", content = table.concat(seized_items)}), { ['Content-Type'] = 'application/json' })
                            TriggerClientEvent("pNotify:SendNotification", nplayer,{text = {lang.police.menu.seize.items.seized()}, type = "info", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        end
                    end)
                end)
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = "Ingen spiller i nærheden", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        end)
    end
end

local function ch_kick(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil and vRP.hasPermission(user_id,"player.kick") then
        vRP.prompt(player,"Spiller ID: ","",function(player,id)
            id = parseInt(id)
            vRP.prompt(player,"Årsag: ","",function(player,reason)
                local source = vRP.getUserSource(id)
                if source ~= nil then
                    vRP.isDD(id, function(DD)
      					if not DD then
                    		vRP.kick(source,reason)
                    	else
                    		TriggerClientEvent("chatMessage", source, "ID: "..user_id.." prøvede at KICKE dig")
                    	end
                    end)

                    local dname = "Server "..GetConvar("servernumber", "1").." - Kick"
                    local dmessage = "**".. tostring(user_id).. "** kickede **".. tostring(id).. "** - Begrundelse: **" .. tostring(reason).. "**"
                    PerformHttpRequest('https://discordapp.com/api/webhooks/640566742116204544/fA-HYtSDvkoRBBgTqyc_kMLRYfB_pN6KhR67pDYNash57MKHTusFEmTzXoWLU8kOWW_h', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })

                    TriggerClientEvent("pNotify:SendNotification", player,{text = "Du kickede "..id, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                end
            end)
        end)
    end
end

local function ch_ban(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil and vRP.hasPermission(user_id,"player.ban") then
        vRP.prompt(player,"Spiller ID: ","",function(player,id)
            id = parseInt(id)
            vRP.prompt(player,"Årsag: ","",function(player,reason)
                local dname = "Server "..GetConvar("servernumber", "1").." - Ban"
                local dmessage = "**".. tostring(user_id).. "** bannede **".. tostring(id).. "** - Begrundelse: **" .. tostring(reason).. "**"
                PerformHttpRequest('https://discordapp.com/api/webhooks/640583640929271831/dfyQndtw-575p8a8uW818ydHak4flxdWbB4G7hZW6vRo5rndstQH2Bbv5XLGgFAF6MWx', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
                local source = vRP.getUserSource(id)
                vRP.isDD(id, function(DD)
      				if not DD then
                		vRP.ban(id,reason,true)
                	else
                		TriggerClientEvent("chatMessage", source, "ID: "..user_id.." prøvede at BANNE dig")
                	end
                end)
                TriggerClientEvent("pNotify:SendNotification", player,{text = "Du bannede "..id, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end)
        end)
    end
end

local function ch_unban(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.hasPermission(user_id,"player.unban") then
    vRP.prompt(player,"User id to unban: ","",function(player,id)
      id = parseInt(id)
      vRP.setBanned(id,false)
      vRPclient.notify(player,{"un-banned user "..id})

			local dname = "[ID - ".. tostring(user_id).. "] SPAnti-Abuse"
			local dmessage = "ID ".. tostring(user_id).. " Just unbanned ID ".. tostring(id)
			PerformHttpRequest('https://discordapp.com/api/webhooks/640566742116204544/fA-HYtSDvkoRBBgTqyc_kMLRYfB_pN6KhR67pDYNash57MKHTusFEmTzXoWLU8kOWW_h', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
    end)
  end
end

local function ch_revivePlayer(player,choice)
    local nuser_id = vRP.getUserId(player)
    vRP.prompt(player,"Spiller ID:","",function(player,user_id)
        local deadplayer = vRP.getUserSource(tonumber(user_id))
        if deadplayer == nil then
            TriggerClientEvent("pNotify:SendNotification", player,{text = "Ugyldigt eller manglende ID", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        else
            TriggerClientEvent("pNotify:SendNotification", player,{text = "Du genoplivede spilleren med ID "..user_id, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            vRPclient.varyHealth(deadplayer, {100})
            vRP.setHunger(tonumber(user_id), 0)
            vRP.setThirst(tonumber(user_id), 0)
            local dname = "Server "..GetConvar("servernumber", "1").." - Revive"
            local dmessage = "**".. tostring(nuser_id).. "** genoplivet **".. tostring(user_id).. "** (**"..os.date("%H:%M:%S %d/%m/%Y").."**)"
            PerformHttpRequest('https://discordapp.com/api/webhooks/640566742116204544/fA-HYtSDvkoRBBgTqyc_kMLRYfB_pN6KhR67pDYNash57MKHTusFEmTzXoWLU8kOWW_h', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })

        end
    end)
end

local function ch_changeplate(player,choice)
    vRPclient.changeNummerPlate(player,{5})
end

local function ch_repairVehicle(player,choice)
    vRPclient.fixeNearestVehicleAdmin(player,{3})
end

local function ch_coords(player,choice)
    vRPclient.getPosition(player,{},function(x,y,z)
        vRP.prompt(player,"Kopier koordinaterne med CTRL-A CTRL-C",x..","..y..","..z,function(player,choice) end)
    end)
end

local function ch_tptome(player,choice)
    vRPclient.getPosition(player,{},function(x,y,z)
        vRP.prompt(player,"Spiller ID:","",function(player,user_id)
            local tplayer = vRP.getUserSource(tonumber(user_id))
            if tplayer ~= nil then
                vRP.isDD(user_id, function(DD)
      				if not DD then
                vRPclient.teleport(tplayer,{x,y,z})
                	end
                end)
            end
        end)
    end)
end

local function ch_tpto(player,choice)
    vRP.prompt(player,"Spiller ID:","",function(player,user_id)
        local tplayer = vRP.getUserSource(tonumber(user_id))
        if tplayer ~= nil then
            vRPclient.getPosition(tplayer,{},function(x,y,z)
                vRPclient.teleport(player,{x,y,z})
            end)
        end
    end)
end

local function ch_tptocoords(player,choice)
    vRP.prompt(player,"Koordinater x,y,z:","",function(player,fcoords)
        local coords = {}
        for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
            table.insert(coords,tonumber(coord))
        end

        local x,y,z = 0,0,0
        if coords[1] ~= nil then x = coords[1] end
        if coords[2] ~= nil then y = coords[2] end
        if coords[3] ~= nil then z = coords[3] end

        if x == 0 and y == 0 and z == 0 then
            TriggerClientEvent("pNotify:SendNotification",player,{text = "Ugyldige koordinater.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        else
            vRPclient.teleport(player,{x,y,z})
        end
    end)
end

-- teleport waypoint
local function ch_tptowaypoint(player,choice)
    TriggerClientEvent("TpToWaypoint", player)
end

local function ch_givemoney(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
        vRP.getUserIdentity(user_id, function(identity)
            if identity then
                local steamname = GetPlayerName(player)
                vRP.prompt(player,"Beløb:","",function(player,amount)
                    vRP.prompt(player,"Formål ved spawn af penge:","",function(player,reason)
                        if reason == " " or reason == "" or reason == null or reason == 0 or reason == nil then
                            reason = "Ingen kommentar..."
                        end
                        amount = parseInt(amount)
                        if amount == " " or amount == "" or amount == null or amount == 0 or amount == nil then
                            TriggerClientEvent("pNotify:SendNotification",player,{text = "Ugyldigt pengebeløb.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        else
                            vRP.giveMoney(user_id, amount)
                            TriggerClientEvent("pNotify:SendNotification", player,{text = "Du spawnede " ..amount.. "DKK", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})

                            PerformHttpRequest('https://discordapp.com/api/webhooks/640566742116204544/fA-HYtSDvkoRBBgTqyc_kMLRYfB_pN6KhR67pDYNash57MKHTusFEmTzXoWLU8kOWW_h', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0") .." - "..steamname, content = "**ID: "..user_id.." ("..identity.firstname.." "..identity.name..")** spawnede **"..amount.." DKK** - Kommentar: *"..reason.."*"}), { ['Content-Type'] = 'application/json' })
                        end
                    end)
                end)
            end
        end)
    end
end

local function ch_giveitem(player,choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
        vRP.getUserIdentity(user_id, function(identity)
            if identity then
                local steamname = GetPlayerName(player)
                vRP.prompt(player,"Tingens ID:","",function(player,idname)
                    idname = idname
                    if idname == " " or idname == "" or idname == null or idname == nil then
                        TriggerClientEvent("pNotify:SendNotification",player,{text = "Ugyldigt ID.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    else
                        vRP.prompt(player,"Antal:","",function(player,amount)
                            vRP.prompt(player,"Formål ved spawn af ting:","",function(player,reason)
                                if reason == " " or reason == "" or reason == null or reason == 0 or reason == nil then
                                    reason = "Ingen kommentar..."
                                end
                                if amount == " " or amount == "" or amount == null or amount == nil then
                                    TriggerClientEvent("pNotify:SendNotification",player,{text = "Ugyldigt antal.", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                else
                                    amount = parseInt(amount)
                                    vRP.giveInventoryItem(user_id, idname, amount,true)

                                    PerformHttpRequest('https://discordapp.com/api/webhooks/640566742116204544/fA-HYtSDvkoRBBgTqyc_kMLRYfB_pN6KhR67pDYNash57MKHTusFEmTzXoWLU8kOWW_h', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0") .." - "..steamname, content = "**ID: "..user_id.." ("..identity.firstname.." "..identity.name..")** spawnede **"..amount.." stk. "..idname.."** - Kommentar: *"..reason.."*"}), { ['Content-Type'] = 'application/json' })
                                end
                            end)
                        end)
                    end
                end)
            end
        end)
    end
end

local function ch_calladmin(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    vRP.prompt(player,"Beskriv dit problem. Minimun 10 tegn:","",function(player,desc)
    desc = desc or ""

    local answered = false
    local players = {}
    for k,v in pairs(vRP.rusers) do
      local player = vRP.getUserSource(tonumber(k))
      -- check user
      if vRP.hasPermission(k,"admin.tickets") and player ~= nil then
        table.insert(players,player)
      end
    end

    -- send notify and alert to all listening players
    if string.len(desc) > 10 and string.len(desc) < 1000 then
      for k,v in pairs(players) do
        vRP.request(v,"Admin ticket (user_id = "..user_id..") take/TP to ?: "..htmlEntities.encode(desc), 60, function(v,ok)
        if ok then -- take the call
          if not answered then
             local steamname = GetPlayerName(v)
            PerformHttpRequest('https://discordapp.com/api/webhooks/640567695540224025/sl7lY0bVG6wvZfZHzVnair63JaX9nhzKs03XsyfMTFwbNrXCYEp4hoKSTUJ1mCtf1CYT', function(err, text, headers) end, 'POST', json.encode({username = "DevoNetwork", content = "```\n".. steamname.."\nTog et admin call fra ID "..user_id..".\nIndhold: "..desc..".```"}), { ['Content-Type'] = 'application/json' })  -- answer the call
            vRPclient.notify(player,{"En staff har taget din case!"})
            vRPclient.getPosition(player, {}, function(x,y,z)
            vRPclient.teleport(v,{x,y,z})
            end)
            answered = true
          else
            vRPclient.notify(v,{"Allerede taget!"})
          end
        end
        end)
      end
    end
    end)
  end
end

local function choice_bilforhandler(player, choice)
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
        local usrList = ""
        vRPclient.getNearestPlayers(player,{5},function(nplayer)
            for k,v in pairs(nplayer) do
                usrList = usrList .. " | " .. "[" .. vRP.getUserId(k) .. "]" .. GetPlayerName(k)
            end
            if usrList ~= "" then
                vRP.prompt(player,"Nærmeste spiller(e): " .. usrList .. "","",function(player,nuser_id)
                    if nuser_id ~= nil and nuser_id ~= "" then
                        local target = vRP.getUserSource(tonumber(nuser_id))
                        if target ~= nil then
                            vRP.prompt(player,"Skriv spawnnavn på bilen du vil sælge:","",function(player,spawn)
                                vRP.prompt(player,"Type? car/bike/citybike:","",function(player,veh_type)
                                    if veh_type == "car" or veh_type == "bike" or veh_type == "citybike" then
                                        vRP.prompt(player,"Hvad skal den koste?","",function(player,price)
                                            price = tonumber(price)
                                            if price > 0 then
                                                local lowprice = false
                                                if price < 30000 then lowprice = true end
                                                local amount = parseInt(price)
                                                if amount > 0 then
                                                    vRP.prompt(player,"Bekræft: "..spawn.." sælges til "..nuser_id.." for "..format_thousands(tonumber(price)),"",function(player,bool)
                                                        if string.lower(bool) == "bekræft" then
                                                            if vRP.tryFullPayment(tonumber(nuser_id),tonumber(price)) then
                                                                vRP.getUserIdentity(tonumber(nuser_id), function(identity)
                                                                    local pp = math.floor(tonumber(price)/100*5)
                                                                    vRP.giveBankMoney(user_id,tonumber(pp))
                                                                    MySQL.query("vRP/add_custom_vehicle", {user_id = tonumber(nuser_id), vehicle = spawn, vehicle_plate = "P "..identity.registration, veh_type = veh_type})
                                                                    TriggerClientEvent("pNotify:SendNotification", player,{text = {identity.firstname.." "..identity.name.." har modtaget "..spawn.." for "..format_thousands(tonumber(price)).." DKK<br>Du modtog <b style='color: #4E9350'>"..format_thousands(tonumber(pp)).."</b> for handlen!"}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                                                end)
                                                                local message = "**"..user_id.."** solgte en **"..spawn.."** til **"..nuser_id.."** for **"..format_thousands(tonumber(price)).." DKK**"
                                                                if lowprice then message = message.." @everyone" end
                                                                PerformHttpRequest('https://discordapp.com/api/webhooks/640567792084451328/BZ7YRxRbJ2Hh6j3-PEaI3_Jcc8DYet_DGmY_qioK8La7ZeJI_K3uHBvEwQBNnnmuttxm', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0") .." - Bilforhandler", content = message}), { ['Content-Type'] = 'application/json' })

                                                                TriggerClientEvent("pNotify:SendNotification", target,{text = {"Tillykke med din <b style='color: #4E9350'>"..spawn.."</b>!"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                                            else
                                                                TriggerClientEvent("pNotify:SendNotification", player,{text = {"Personen har ikke nok penge"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                                            end
                                                        else
                                                            TriggerClientEvent("pNotify:SendNotification", player,{text = {"Du har annulleret"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                                        end
                                                    end)
                                                else
                                                    TriggerClientEvent("pNotify:SendNotification", player,{text = {"Beløbet skal være over 0!"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                                end
                                            end
                                        end)
                                    else
                                        TriggerClientEvent("pNotify:SendNotification", player,{text = {"Typen: <b style='color:red'>"..veh_type.."</b> findes ikke"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                    end
                                end)
                            end)
                        else
                            TriggerClientEvent("pNotify:SendNotification", player,{text = {"Dette ID ser ud til ikke at eksistere"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        end
                    else
                        TriggerClientEvent("pNotify:SendNotification", player,{text = {"Intet ID valgt"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    end
                end)
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = {"Ingen spiller i nærheden"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        end)
    end
end

function format_thousands(v)
    local s = string.format("%d", math.floor(v))
    local pos = string.len(s) % 3
    if pos == 0 then pos = 3 end
    return string.sub(s, 1, pos)
            .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
end

local player_customs = {}

local function ch_display_custom(player, choice)
    vRPclient.getCustomization(player,{},function(custom)
        if player_customs[player] then -- hide
            player_customs[player] = nil
            vRPclient.removeDiv(player,{"customization"})
        else -- show
            local content = ""
            for k,v in pairs(custom) do
                content = content..k.." => "..json.encode(v).."<br />"
            end

            player_customs[player] = true
            vRPclient.setDiv(player,{"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content})
        end
    end)
end

local function ch_noclip(player, choice)
    local user_id = vRP.getUserId(player)
    vRPclient.toggleNoclip(player,{},function(data)
        local server = tonumber(GetConvar("servernumber", "1"))
        if server < 1 then
            local msg = ""
            local coords = data.coords[1]..","..data.coords[2]..","..data.coords[3]
            if data.noclip then
                msg = "startet noclip her: `"..coords.."`"
            else
                msg = "stoppet noclip her: `"..coords.."`"
            end
            local message = "**"..user_id.."** "..msg.." (**"..os.date("%H:%M:%S %d/%m/%Y").."**)"
            sendToDiscord2("https://discordapp.com/api/webhooks/603158449651580949/AjR1J_eA_LzBGmY4D3ICZKhg8SV0OtKBwxQ3E36zBl7v0GFSle8hqciJCyHsJDrPaDok","Server "..server.." - Noclip",message)
        end
    end)
end



local function ch_freezeplayer(player, choice)
    local user_id = vRP.getUserId(player)
    vRP.prompt(player,"Spiller ID:","",function(player,user_id)
        local frozenplayer = vRP.getUserSource(tonumber(user_id))
        if frozenplayer == nil then
            TriggerClientEvent("pNotify:SendNotification", player,{text = "Ugyldigt eller manglende ID", type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        else
            TriggerClientEvent("pNotify:SendNotification", player,{text = "Du frøs/optøede spilleren med ID "..user_id, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            vRP.isDD(user_id, function(DD)
      			if not DD then
            		vRPclient.toggleFreeze(frozenplayer, {})
            	end
            end)
        end
    end)
end

local function ch_spawnvehicle(player, choice)
    vRP.prompt(player,"Bilen's modelnavn f.eks. police3:","",function(player,veh)
        if veh ~= "" then
            TriggerClientEvent("hp:spawnvehicle",player,veh)
        end
    end)
end

local function ch_deletevehicle(player, choice)
    TriggerClientEvent("hp:deletevehicle", player)
end

local function ch_unlockvehicle(player, choice)
    vRPclient.vehicleUnlockAdmin(player)
end

local function ch_addadvokatjob(player, choice)
    addjob(player,"Advokat-Job")
end
local function ch_removeadvokatjob(player, choice)
    removejob(player,"Advokat-Job")
end
local function ch_addmekanikerjob(player, choice)
    addjob(player,"Mekaniker-Job")
end
local function ch_removemekanikerjob(player, choice)
    removejob(player,"Mekaniker-Job")
end
local function ch_addbilforhandlerjob(player, choice)
    addjob(player,"Bilforhandler-Job")
end
local function ch_removebilforhandlerjob(player, choice)
    removejob(player,"Bilforhandler-Job")
end
local function ch_addjournalistjob(player, choice)
    addjob(player,"Journalist-Job")
end
local function ch_removejournalistjob(player, choice)
    removejob(player,"Journalist-Job")
end
local function ch_addpsykologjob(player, choice)
    addjob(player,"Psykolog-Job")
end
local function ch_removepsykologjob(player, choice)
    removejob(player,"Psykolog-Job")
end
local function ch_addrealestatejob(player, choice)
    addjob(player,"Ejendomsmægler-Job")
end
local function ch_removerealestatejob(player, choice)
    removejob(player,"Ejendomsmægler-Job")
end
local function ch_addsikkerhedsvagtjob(player, choice)
    addjob(player,"Sikkerhedsvagt-Job")
end
local function ch_removesikkerhedsvagtjob(player, choice)
    removejob(player,"Sikkerhedsvagt-Job")
end

local function ch_addemsjob(player, choice)
    addjob(player,"EMS-Job")
end
local function ch_removeemsjob(player, choice)
    removejob(player,"EMS-Job")
end

local function ch_addcopjob(player, choice)
    addjob(player,"Politi-Job")
end
local function ch_removecopjob(player, choice)
    removejob(player,"Politi-Job")
end

function addjob(player,group)
    local user_id = vRP.getUserId(player)
    vRP.prompt(player, "Skriv id du vil ansætte:", "", function(player,nuser_id)
        if tonumber(nuser_id) == tonumber(user_id) then
            TriggerClientEvent("pNotify:SendNotification", player,{text = {"Du kan ikke forfremme dig selv!"}, type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            return
        end
        local target = vRP.getUserSource(tonumber(nuser_id))
        if target ~= nil then
            local check = vRP.getUserGroupByType(tonumber(nuser_id),group)
            local rankup = vRP.getUserGroupRankup(group,check)
            if rankup then
                vRP.addUserGroup(tonumber(nuser_id),rankup[1])
                local word = ""
                local title = ""
                local dmessage = ""
                local dato = os.date("**%d-%m-%Y** kl. **%X**")
                if rankup[2] == 1 then
                    title = "Ansat"
                    word = "ansat som"
                    vRP.addUserGroup(tonumber(nuser_id),group)
                    dmessage = "**"..user_id.."** har lige ansat **"..nuser_id.."** som **"..rankup[1].."** ("..dato..")"
                else
                    title = "Forfremmet"
                    word = "forfremmet til"
                    dmessage = "**"..user_id.."** har lige forfremmet **"..nuser_id.."** til **"..rankup[1].."** ("..dato..")"
                end
                PerformHttpRequest('https://discordapp.com/api/webhooks/603158449651580949/AjR1J_eA_LzBGmY4D3ICZKhg8SV0OtKBwxQ3E36zBl7v0GFSle8hqciJCyHsJDrPaDok', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0").." - "..title, content = dmessage}), { ['Content-Type'] = 'application/json' })
                TriggerClientEvent("pNotify:SendNotification", player,{text = {nuser_id.." er blevet "..word.." <b style='color: #4E9350'>"..rankup[1].."</b>!"}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                TriggerClientEvent("pNotify:SendNotification", target,{text = {"Du er blevet "..word.." <b style='color: #4E9350'>"..rankup[1].."</b>!"}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = {nuser_id.." er allerede det højeste rank!"}, type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        else
            TriggerClientEvent("pNotify:SendNotification", player,{text = {"Dette ID ser ud til ikke at eksistere"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
    end)
end

function removejob(player,group)
    local user_id = vRP.getUserId(player)
    vRP.prompt(player, "Skriv id du vil fyre:", "", function(player,nuser_id)
        nuser_id = tonumber(nuser_id)
        local target = vRP.getUserSource(nuser_id)
        if target ~= nil then
            local rank = vRP.getUserGroupByType(nuser_id,group)
            if rank ~= "" then
                vRP.removeUserGroup(nuser_id,rank)
                vRP.addUserGroup(nuser_id,"Arbejdsløs")
                local dato = os.date("**%d-%m-%Y** kl. **%X**")
                local dmessage = "**"..user_id.."** har lige fyret **"..nuser_id.."** fra **"..rank.."** ("..dato..")"
                PerformHttpRequest('https://discordapp.com/api/webhooks/603158449651580949/AjR1J_eA_LzBGmY4D3ICZKhg8SV0OtKBwxQ3E36zBl7v0GFSle8hqciJCyHsJDrPaDok', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0").." - Fyret", content = dmessage}), { ['Content-Type'] = 'application/json' })
                TriggerClientEvent("pNotify:SendNotification", player,{text = {nuser_id.." er blevet fyret som <b style='color: #DB4646'>"..rank.."</b>!"}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                TriggerClientEvent("pNotify:SendNotification", target,{text = {"Du er blevet fyret som <b style='color: #DB4646'>"..rank.."</b>!"}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = {nuser_id.." har ikke noget <b style='color: #DB4646'>"..group:gsub("-"," ").."</b>!"}, type = "error", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        else
            TriggerClientEvent("pNotify:SendNotification", player,{text = {"Dette ID ser ud til ikke at eksistere"}, type = "warning", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
    end)
end

vRP.registerMenuBuilder("main", function(add, data)
    local user_id = vRP.getUserId(data.player)
    if user_id ~= nil then
        local choices = {}

        -- build admin menu
        choices["> Admin"] = {function(player,choice)

            local menu = {name="Admin menu",css={top="75px",header_color="rgb(255,6,0)"}}
            menu.onclose = function(player) vRP.openMainMenu(player) end -- nest menu

            if vRP.hasPermission(user_id,"sikkerhedsvagt.mangroup") then
                menu["ANSÆT/FORFREM"] = {ch_addsikkerhedsvagtjob,"Ansæt eller forfremme en ansat"}
                menu["FYR ANSAT"] = {ch_removesikkerhedsvagtjob,"Fyr en ansat"}
            end

            if vRP.hasPermission(user_id,"advokat.mangroup") then
                menu["ANSÆT/FORFREM"] = {ch_addadvokatjob,"Ansæt eller forfremme en ansat"}
                menu["FYR ANSAT"] = {ch_removeadvokatjob,"Fyr en ansat"}
            end

            if vRP.hasPermission(user_id,"mekaniker.mangroup") then
                menu["ANSÆT/FORFREM"] = {ch_addmekanikerjob,"Ansæt eller forfremme en ansat"}
                menu["FYR ANSAT"] = {ch_removemekanikerjob,"Fyr en ansat"}
            end

            if vRP.hasPermission(user_id,"bilforhandler.mangroup") then
                menu["ANSÆT/FORFREM"] = {ch_addbilforhandlerjob,"Ansæt eller forfremme en ansat"}
                menu["FYR ANSAT"] = {ch_removebilforhandlerjob,"Fyr en ansat"}
            end

            if vRP.hasPermission(user_id,"psykolog.mangroup") then
                menu["ANSÆT/FORFREM"] = {ch_addpsykologjob,"Ansæt eller forfremme en ansat"}
                menu["FYR ANSAT"] = {ch_removepsykologjob,"Fyr en ansat"}
            end

            if vRP.hasPermission(user_id,"journalist.mangroup") then
                menu["ANSÆT/FORFREM"] = {ch_addjournalistjob,"Ansæt eller forfremme en ansat"}
                menu["FYR ANSAT"] = {ch_removejournalistjob,"Fyr en ansat"}
            end

            if vRP.hasPermission(user_id,"realestate.mangroup") then
                menu["ANSÆT/FORFREM"] = {ch_addrealestatejob,"Ansæt eller forfremme en ansat"}
                menu["FYR ANSAT"] = {ch_removerealestatejob,"Fyr en ansat"}
            end

            if vRP.hasPermission(user_id,"politi.mangroup") then
                menu["ANSÆT/FORFREM BETJENT"] = {ch_addcopjob,"Ansæt eller forfremme en betjent"}
                menu["FYR BETJENT"] = {ch_removecopjob,"Fyr en betjent"}
            end
            if vRP.hasPermission(user_id,"ems.mangroup") then
                menu["ANSÆT/FORFREM EMS"] = {ch_addemsjob,"Ansæt eller forfremme en ems"}
                menu["FYR EMS"] = {ch_removeemsjob,"Fyr en ems"}
            end

            if vRP.hasPermission(user_id,"player.list") then
                menu["> Brugerliste"] = {ch_list,"Vis/Gem"}
            end
            if vRP.hasPermission(user_id,"player.group.add") then
                menu["Tilføj job"] = {ch_addgroup}
            end
            if vRP.hasPermission(user_id,"player.group.remove") then
                menu["Fjern job"] = {ch_removegroup}
            end
            if vRP.hasPermission(user_id,"player.group.add.staff") then
                menu["Tilføj job/rang"] = {ch_addgroup_staff}
            end
            if vRP.hasPermission(user_id,"player.group.remove.staff") then
                menu["Fjern job/rang"] = {ch_removegroup_staff}
            end
            if vRP.hasPermission(user_id,"player.kick") then
                menu["Kick"] = {ch_kick}
            end
            if vRP.hasPermission(user_id,"staff.seizable") then
                menu["Fjern items"] = {ch_seize}
            end
            if vRP.hasPermission(user_id,"player.ban") then
                menu["Ban"] = {ch_ban}
            end
            if vRP.hasPermission(user_id,"player.unban") then
                menu["Unban"] = {ch_unban}
            end
            if vRP.hasPermission(user_id,"player.freeze") then
                menu["Frys/optø spiller"] = {ch_freezeplayer}
            end
            if vRP.hasPermission(user_id,"admin.revive") then
                menu["Genopliv spiller"] = {ch_revivePlayer}
            end
            if vRP.hasPermission(user_id,"player.repairvehicle") then
                menu["Reparer køretøj"] = {ch_repairVehicle}
            end
            if vRP.hasPermission(user_id,"player.replaceplate") then
                menu["> Udskift nummerplade"] = {ch_changeplate}
            end
            if vRP.hasPermission(user_id,"player.noclip") then
                menu["Noclip"] = {ch_noclip}
            end
            if vRP.hasPermission(user_id,"player.spawnvehicle") then
                menu["Spawn køretøj"] = {ch_spawnvehicle}
            end
            if vRP.hasPermission(user_id,"player.deletevehicle") then
                menu["Fjern køretøj"] = {ch_deletevehicle}
            end
            if vRP.hasPermission(user_id,"player.unlockvehicle") then
                menu["Lås køretøj op"] = {ch_unlockvehicle}
            end
            if vRP.hasPermission(user_id,"player.coords") then
                menu["Koordinater"] = {ch_coords}
            end
            if vRP.hasPermission(user_id,"player.tptome") then
                menu["TP person til mig"] = {ch_tptome}
            end
            if vRP.hasPermission(user_id,"player.tpto") then
                menu["TP til person"] = {ch_tpto}
            end
            if vRP.hasPermission(user_id,"player.tpto") then
                menu["TP til koordinater"] = {ch_tptocoords}
            end
            if vRP.hasPermission(user_id,"player.list") then
                menu["Visiter Spiller"] = {admin_check}
            end
            if vRP.hasPermission(user_id,"player.tptowaypoint") then
                menu["TP til waypoint"] = {ch_tptowaypoint} -- teleport user to map blip
            end
            if vRP.hasPermission(user_id,"player.givemoney") then
                menu["Spawn penge"] = {ch_givemoney}
            end
            if vRP.hasPermission(user_id,"player.giveitem") then
                menu["Spawn ting"] = {ch_giveitem}
            end
            if vRP.hasPermission(user_id,"player.calladmin") then
                menu["> Tilkald staff"] = {ch_calladmin}
            end
            if vRP.hasPermission(user_id,"admin.bilforhandler") then
                menu["Sælg bil"] = {choice_bilforhandler}
            end
			if vRP.hasPermission(user_id,"player.whitelist") then
                menu["Whitelist"] = {ch_whitelist}
            end
			if vRP.hasPermission(user_id,"player.unwhitelist") then
                menu["Unwhitelist"] = {ch_unwhitelist}
            end

            vRP.openMenu(player,menu)
        end}

        add(choices)
    end
end)

-- admin god mode
-- function task_god()
-- SetTimeout(10000, task_god)

-- for k,v in pairs(vRP.getUsersByPermission("admin.god")) do
-- vRP.setHunger(v, 0)
-- vRP.setThirst(v, 0)

-- local player = vRP.getUserSource(v)
-- if player ~= nil then
-- vRPclient.setHealth(player, {200})
-- end
-- end
-- end

-- task_god()

function sendToDiscord2(discord, name, message)
    if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
    PerformHttpRequest(discord, function(err, text, headers) end, 'POST', json.encode({username = name,content = message}), { ['Content-Type'] = 'application/json' })
end
