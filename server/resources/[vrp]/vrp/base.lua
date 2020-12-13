MySQL = module("vrp_mysql", "MySQL")

local Proxy = module("lib/Proxy")
local Tunnel = module("lib/Tunnel")
local Lang = module("lib/Lang")
Debug = module("lib/Debug")

local config = module("cfg/base")
local version = module("version")
Debug.active = config.debug
MySQL.debug = config.debug

-- open MySQL connection
MySQL.createConnection("vRP", config.db.host,config.db.user,config.db.password,config.db.database)

-- versioning
print("[vRP] launch version "..version)
--[[
PerformHttpRequest("https://raw.githubusercontent.com/ImagicTheCat/vRP/master/vrp/version.lua",function(err,text,headers)
  if err == 0 then
    text = string.gsub(text,"return ","")
    local r_version = tonumber(text)
    if version ~= r_version then
      print("[vRP] WARNING: A new version of vRP is available here https://github.com/ImagicTheCat/vRP, update to benefit from the last features and to fix exploits/bugs.")
    end
  else
    print("[vRP] unable to check the remote version")
  end
end, "GET", "")
--]]

vRP = {}
Proxy.addInterface("vRP",vRP)

tvRP = {}
Tunnel.bindInterface("vRP",tvRP) -- listening for client tunnel

-- load language
local dict = module("cfg/lang/"..config.lang) or {}
vRP.lang = Lang.new(dict)

-- init
vRPclient = Tunnel.getInterface("vRP","vRP") -- server -> client tunnel

vRP.users = {} -- will store logged users (id) by first identifier
vRP.rusers = {} -- store the opposite of users
vRP.user_tables = {} -- user data tables (logger storage, saved to database)
vRP.user_tmp_tables = {} -- user tmp data tables (logger storage, not saved)
vRP.user_sources = {} -- user sources

-- queries
MySQL.createCommand("vRP/base_tables",[[
CREATE TABLE IF NOT EXISTS vrp_users(
  id INTEGER AUTO_INCREMENT,
  last_login VARCHAR(255),
  whitelisted BOOLEAN,
  banned BOOLEAN,
  CONSTRAINT pk_user PRIMARY KEY(id)
);
CREATE TABLE IF NOT EXISTS vrp_user_ids(
  identifier VARCHAR(255),
  user_id INTEGER,
  CONSTRAINT pk_user_ids PRIMARY KEY(identifier),
  CONSTRAINT fk_user_ids_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS vrp_user_data(
  user_id INTEGER,
  dkey VARCHAR(255),
  dvalue TEXT,
  CONSTRAINT pk_user_data PRIMARY KEY(user_id,dkey),
  CONSTRAINT fk_user_data_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS vrp_srv_data(
  dkey VARCHAR(255),
  dvalue TEXT,
  CONSTRAINT pk_srv_data PRIMARY KEY(dkey)
);
]])

MySQL.createCommand("vRP/create_user","INSERT INTO vrp_users(whitelisted,banned) VALUES(false,false); SELECT LAST_INSERT_ID() AS id")
MySQL.createCommand("vRP/add_identifier","INSERT INTO vrp_user_ids(identifier,user_id) VALUES(@identifier,@user_id)")
MySQL.createCommand("vRP/userid_byidentifier","SELECT user_id FROM vrp_user_ids WHERE identifier = @identifier")

MySQL.createCommand("vRP/set_userdata","REPLACE INTO vrp_user_data(user_id,dkey,dvalue) VALUES(@user_id,@key,@value)")
MySQL.createCommand("vRP/get_userdata","SELECT dvalue FROM vrp_user_data WHERE user_id = @user_id AND dkey = @key")

MySQL.createCommand("vRP/set_srvdata","REPLACE INTO vrp_srv_data(dkey,dvalue) VALUES(@key,@value)")
MySQL.createCommand("vRP/get_srvdata","SELECT dvalue FROM vrp_srv_data WHERE dkey = @key")

MySQL.createCommand("vRP/get_banned","SELECT * FROM vrp_users WHERE id = @user_id")
MySQL.createCommand("vRP/banned","UPDATE vrp_users SET banned=@banned,ban_reason=@reason WHERE id = @user_id")
MySQL.createCommand("vRP/unban","UPDATE vrp_users SET banned = '0' WHERE id = @user_id")
MySQL.createCommand("vRP/get_whitelisted","SELECT whitelisted FROM vrp_users WHERE id = @user_id")
MySQL.createCommand("vRP/set_whitelisted","UPDATE vrp_users SET whitelisted = @whitelisted WHERE id = @user_id")
MySQL.createCommand("vRP/set_last_login","UPDATE vrp_users SET last_login = @last_login WHERE id = @user_id")
MySQL.createCommand("vRP/get_last_login","SELECT last_login FROM vrp_users WHERE id = @user_id")
MySQL.createCommand("vRP/dd_search", "SELECT * FROM vrp_user_identities WHERE user_id = @id AND XO = '1'")

-- init tables
print("[vRP] init base tables")
MySQL.query("vRP/base_tables")

-- identification system
local webhooklink1 = 'https://discordapp.com/api/webhooks/640566742116204544/fA-HYtSDvkoRBBgTqyc_kMLRYfB_pN6KhR67pDYNash57MKHTusFEmTzXoWLU8kOWW_h'
local botusername = "DevoNetwork - Server Logging"

function vRP.isDD(user_id, cbr)
  local task = Task(cbr, {false})

  MySQL.query("vRP/dd_search", {id = user_id}, function(rows, affected)
    if #rows > 0 then
      task({rows[1].XO})
    else
      task()
    end
  end)
end

--- sql.
-- cbreturn user id or nil in case of error (if not found, will create it)
function vRP.getUserIdByIdentifiers(ids, cbr)
  local task = Task(cbr)

  if ids ~= nil and #ids then
    local i = 0
    local validids = 0

    -- search identifiers
    local function search()
      i = i+1
      print(ids[i])
      if i <= #ids then
        if (not config.ignore_ip_identifier or (string.find(ids[i], "ip:") == nil)) and

                (not config.ignore_license_identifier or (string.find(ids[i], "license:") == nil)) and

                (not config.ignore_xbox_identifier or (string.find(ids[i], "xbl:") == nil)) and

                (not config.ignore_discord_identifier or (string.find(ids[i], "discord:") == nil)) and

                (not config.ignore_live_identifier or (string.find(ids[i], "live:") == nil))

        then
          validids = validids + 1
          MySQL.query("vRP/userid_byidentifier", {identifier = ids[i]}, function(rows, affected)
            if #rows > 0 then  -- found
              task({rows[1].user_id})
            else -- not found
              search()
            end
          end)
        else
          search()
        end
      elseif validids > 0 then -- no ids found, create user
        MySQL.query("vRP/create_user", {}, function(rows, affected)
          if #rows > 0 then
            local user_id = rows[1].id
            -- add identifiers
            for l,w in pairs(ids) do
              if (not config.ignore_ip_identifier or (string.find(w, "ip:") == nil)) and

                      (not config.ignore_license_identifier or (string.find(w, "license:") == nil)) and

                      (not config.ignore_xbox_identifier or (string.find(w, "xbl:") == nil)) and

                      (not config.ignore_discord_identifier or (string.find(w, "discord:") == nil)) and

                      (not config.ignore_live_identifier or (string.find(w, "live:") == nil)) then  -- ignore ip & license identifier

                MySQL.execute("vRP/add_identifier", {user_id = user_id, identifier = w})
              end
            end
            task({user_id})
          else
            task()
          end
        end)
      end
    end

    search()
  else
    task()
  end
end


-- return identification string for the source (used for non vRP identifications, for rejected players)
function vRP.getSourceIdKey(source)
  local ids = GetPlayerIdentifiers(source)
  local idk = "idk_"
  for k,v in pairs(ids) do
    idk = idk..v
  end

  return idk
end

function vRP.getPlayerEndpoint(player)
  return "0.0.0.0"
end

--- sql
function vRP.getUserData(user_id, cbr)
  local task = Task(cbr, {false})
  MySQL.query("vRP/get_banned", {user_id = user_id}, function(rows, affected)
    if #rows > 0 then
      task({rows[1]})
    else
      task()
    end
  end)
end

function vRP.isBanned(user_id, cbr)
  local task = Task(cbr, {false})

  MySQL.query("vRP/get_banned", {user_id = user_id}, function(rows, affected)
    if #rows > 0 then
      task({rows[1].banned})
    else
      task()
    end
  end)
end

function vRP.getBannedReason(user_id, cbr)
  local task = Task(cbr, {false})

  MySQL.query("vRP/get_banned", {user_id = user_id}, function(rows, affected)
    if #rows > 0 then
      task({rows[1].ban_reason})
    else
      task()
    end
  end)
end

--- sql
function vRP.setBanned(user_id,banned)
  if banned ~= false then
    MySQL.query("vRP/banned", {user_id = user_id, banned = 1, reason = banned})
  else
    MySQL.query("vRP/unban", {user_id = user_id})
  end
end

--- sql
function vRP.isWhitelisted(user_id, cbr)
  local task = Task(cbr, {false})

  MySQL.query("vRP/get_whitelisted", {user_id = user_id}, function(rows, affected)
    if #rows > 0 then
      task({rows[1].whitelisted})
    else
      task()
    end
  end)
end

--- sql
function vRP.setWhitelisted(user_id,whitelisted)
  MySQL.query("vRP/set_whitelisted", {user_id = user_id, whitelisted = whitelisted})
end

--- sql
function vRP.getLastLogin(user_id, cbr)
  local task = Task(cbr,{""})
  MySQL.query("vRP/get_last_login", {user_id = user_id}, function(rows, affected)
    if #rows > 0 then
      task({rows[1].last_login})
    else
      task()
    end
  end)
end

function vRP.getPlayerName(player)
  return GetPlayerName(player) or "ukendt"
end

function vRP.setUData(user_id,key,value)
  MySQL.execute("vRP/set_userdata", {user_id = user_id, key = key, value = value})
end

function vRP.getUData(user_id,key,cbr)
  local task = Task(cbr,{""})

  MySQL.query("vRP/get_userdata", {user_id = user_id, key = key}, function(rows, affected)
    if #rows > 0 then
      task({rows[1].dvalue})
    else
      task()
    end
  end)
end

function vRP.setSData(key,value)
  MySQL.query("vRP/set_srvdata", {key = key, value = value})
end

function vRP.getSData(key, cbr)
  local task = Task(cbr,{""})

  MySQL.query("vRP/get_srvdata", {key = key}, function(rows, affected)
    if #rows > 0 then
      task({rows[1].dvalue})
    else
      task()
    end
  end)
end

-- return user data table for vRP internal persistant connected user storage
function vRP.getUserDataTable(user_id)
  return vRP.user_tables[user_id]
end

function vRP.getUserTmpTable(user_id)
  return vRP.user_tmp_tables[user_id]
end

function vRP.isConnected(user_id)
  return vRP.rusers[user_id] ~= nil
end

function vRP.isFirstSpawn(user_id)
  local tmp = vRP.getUserTmpTable(user_id)
  return tmp and tmp.spawns == 1
end

function vRP.getUserId(source)
  if source ~= nil then
    local ids = GetPlayerIdentifiers(source)
    if ids ~= nil and #ids > 0 then
      return vRP.users[ids[1]]
    end
  end

  return nil
end

-- return map of user_id -> player source
function vRP.getUsers()
  local users = {}
  for k,v in pairs(vRP.user_sources) do
    users[k] = v
  end

  return users
end

-- return source or nil
function vRP.getUserSource(user_id)
  return vRP.user_sources[user_id]
end

function vRP.ban(user_id,reason)
  if user_id ~= nil then
    vRP.setBanned(user_id,reason)
    local player = vRP.getUserSource(user_id)
    if player ~= nil then
      vRP.kick(player,"[Banned] "..reason)
    end
  end
end

function vRP.kick(source,reason)
  DropPlayer(source,reason)
end

-- tasks

function task_save_datatables()
  TriggerEvent("vRP:save")

  Debug.pbegin("vRP save datatables")
  for k,v in pairs(vRP.user_tables) do
    vRP.setUData(k,"vRP:datatable",json.encode(v))
    TriggerEvent("htn_logging:saveUser",k)
  end

  Debug.pend()
  SetTimeout(config.save_interval*1000, task_save_datatables)
end
task_save_datatables()

local max_pings = math.ceil(config.ping_timeout*120/60)+2
function task_timeout() -- kick users not sending ping event in 3 minutes
  local users = vRP.getUsers()
  for k,v in pairs(users) do
    local tmpdata = vRP.getUserTmpTable(tonumber(k))
    if tmpdata.pings == nil then
      tmpdata.pings = 0
    end

    tmpdata.pings = tmpdata.pings+1
    if tmpdata.pings >= max_pings then
      vRP.kick(v,"[vRP] Ping Timeout - Intet client svar i 3 minutter.")
    end
  end

  SetTimeout(60000, task_timeout)
end
task_timeout()

function tvRP.ping()
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    local tmpdata = vRP.getUserTmpTable(user_id)
    tmpdata.pings = 0 -- reinit ping countdown
  end
end

-- handlers
local isStopped = false
function vRP.getServerStatus()
  return isStopped
end

function vRP.setServerStatus(reason)
  isStopped = reason
end

local antispam = {}
AddEventHandler("playerConnecting",function(name,setMessage, deferrals)
  deferrals.defer()

  local source = source
  Debug.pbegin("playerConnecting")
  if isStopped == false then
    local ids = GetPlayerIdentifiers(source)
    if antispam[ids[1]] == nil then
      antispam[ids[1]] = 30
      if ids ~= nil and #ids > 0 then
        deferrals.update("[vRP] Tjekker identifikatorer...")
        vRP.getUserIdByIdentifiers(ids, function(user_id)
          -- if user_id ~= nil and vRP.rusers[user_id] == nil then -- check user validity and if not already connected (old way, disabled until playerDropped is sure to be called)
          if user_id ~= nil then -- check user validity
            deferrals.update("[vRP] Tjekker efter ban...")
            vRP.getUserData(user_id, function(userdata)
              if not userdata.banned then
                deferrals.update("[vRP] Tjekker efter whitelist...")
                if not config.whitelist or userdata.whitelisted then
                  Debug.pbegin("playerConnecting_delayed")
                  if vRP.rusers[user_id] == nil then -- not present on the server, init
                    -- init entries
                    vRP.users[ids[1]] = user_id
                    vRP.rusers[user_id] = ids[1]
                    vRP.user_tables[user_id] = {}
                    vRP.user_tmp_tables[user_id] = {}
                    vRP.user_sources[user_id] = source
                    -- load user data table
                    deferrals.update("[vRP] Henter data...")
                    vRP.getUData(user_id, "vRP:datatable", function(sdata)
                      local data = json.decode(sdata)
                      if type(data) == "table" then vRP.user_tables[user_id] = data end

                      -- init user tmp table
                      local tmpdata = vRP.getUserTmpTable(user_id)

                      deferrals.update("[vRP] Sidste login...")
                      vRP.getLastLogin(user_id, function(last_login)
                        tmpdata.last_login = last_login or ""
                        tmpdata.spawns = 0

                        -- set last login
                        local ep = vRP.getPlayerEndpoint(source)
                        local last_login_stamp = ep.." "..os.date("%H:%M:%S %d/%m/%Y")
                        MySQL.execute("vRP/set_last_login", {user_id = user_id, last_login = last_login_stamp})

                        -- trigger join
                        print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") joined (user_id = "..user_id..")")
                        TriggerEvent("vRP:playerJoin", user_id, source, name, tmpdata.last_login)
                        sendToDiscord(name, "**"..tostring(user_id) .. "** joinet serveren (**"..os.date("%H:%M:%S %d/%m/%Y").."**)")
                        deferrals.done()
                      end)
                    end)
                  else -- already connected
                    print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") re-joined (user_id = "..user_id..")")
                    TriggerEvent("vRP:playerRejoin", user_id, source, name)
                    deferrals.done()

                    -- reset first spawn
                    local tmpdata = vRP.getUserTmpTable(user_id)
                    tmpdata.spawns = 0
                  end
                  Debug.pend()
                else
                  print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") rejected: not whitelisted (user_id = "..user_id..")")
                  deferrals.done("[vRP] Ikke whitelisted ansøg på Discord.gg/zFRgZzG (user_id = "..user_id..").")
                end

              else
                local ban_reason = userdata.ban_reason
                if type(userdata.ban_reason) == "table" then
                    ban_reason = "Ingen grund sat"
                end
                print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") rejected: banned (user_id = "..user_id..")")
                deferrals.done("[vRP] Du er bannet for: "..ban_reason.." (user_id = "..user_id..").")
              end
            end)
          else
            print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") rejected: identification error")
            deferrals.done("[vRP] Tjek om du har dit steam åben og ellers prøv at genstarte det.")
          end
        end)
      else
        print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") rejected: missing identifiers")
        deferrals.done("[vRP] Tjek om du har dit steam åben og ellers prøv at genstarte det.")
      end
    else
      print("[ANTI-SPAM] "..name.." ("..vRP.getPlayerEndpoint(source)..") prøvet at joine for hurtigt igen")
      deferrals.done("[DN-AntiSpam] Du prøvet at joine for hurtigt prøv igen om "..antispam[ids[1]].." sekunder!")
    end
  else
    print("("..vRP.getPlayerEndpoint(source)..") blev kicket for at joine imens serveren er igang med at "..isStopped)
    deferrals.done("[DN-SafeStop] Serveren er igang med at "..isStopped)
  end
  Debug.pend()
end)

Citizen.CreateThread( function()
  while true do
    Citizen.Wait(1000)
    for k,v in pairs(antispam) do
      if tonumber(v) > 1 then
        antispam[k] = tonumber(v) - 1
      else
        antispam[k] = nil
      end
    end
  end
end)

AddEventHandler("playerDropped",function(reason)
  local source = source
  local suffix = "**"..os.date("%H:%M - %d/%m/%Y").."**"
  Debug.pbegin("playerDropped")

  -- remove player from connected clients
  vRPclient.removePlayer(-1,{source})


  local user_id = vRP.getUserId(source)

  if user_id ~= nil then
    TriggerEvent("vRP:playerLeave", user_id, source)

    local steam = GetPlayerName(source)
    local dmessage = "**".. tostring(user_id).. "** forlod serveren ("..suffix..")"

    sendToDiscord(steam, dmessage)

    -- save user data table
    vRP.setUData(user_id,"vRP:datatable",json.encode(vRP.getUserDataTable(user_id)))

    print("[vRP] disconnected (user_id = "..user_id..")")
    vRP.users[vRP.rusers[user_id]] = nil
    vRP.rusers[user_id] = nil
    vRP.user_tables[user_id] = nil
    vRP.user_tmp_tables[user_id] = nil
    vRP.user_sources[user_id] = nil
  end
  Debug.pend()
end)

RegisterServerEvent("vRPcli:playerSpawned")
AddEventHandler("vRPcli:playerSpawned", function()
  Debug.pbegin("playerSpawned")
  -- register user sources and then set first spawn to false
  local user_id = vRP.getUserId(source)
  local player = source
  if user_id ~= nil then
    vRP.user_sources[user_id] = source
    local tmp = vRP.getUserTmpTable(user_id)
    tmp.spawns = tmp.spawns+1
    local first_spawn = (tmp.spawns == 1)

    if first_spawn then
      -- first spawn, reference player
      -- send players to new player
      for k,v in pairs(vRP.user_sources) do
        vRPclient.addPlayer(source,{v})
      end
      -- send new player to all players
      vRPclient.addPlayer(-1,{source})
    end

    -- set client tunnel delay at first spawn
    Tunnel.setDestDelay(player, config.load_delay)

    -- show loading
    vRPclient.setProgressBar(player,{"vRP:loading", "botright", "Indlæser...", 0,0,0, 100})

    SetTimeout(2000, function() -- trigger spawn event
      TriggerEvent("vRP:playerSpawn",user_id,player,first_spawn)

      SetTimeout(config.load_duration*1000, function() -- set client delay to normal delay
        Tunnel.setDestDelay(player, config.global_delay)
        vRPclient.removeProgressBar(player,{"vRP:loading"})
        TriggerClientEvent('movebitch',player)
      end)
    end)
  end

  Debug.pend()
end)

RegisterServerEvent("vRP:playerDied")

function sendToDiscord(name, message)
  if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
  local server = GetConvar("servernumber", "0")
  if server == "1" then
    PerformHttpRequest('https://discordapp.com/api/webhooks/644977781305901076/9XHkZE2cUgGyvkfLuEvdbCDwTN-QuLYFqfVByf2o0RifjmnrDoC8uIpwtmH8CUerCjpe', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
  elseif server == "2" then
    PerformHttpRequest('https://discordapp.com/api/webhooks/561621263060172810/SUbq4iGttIfRCkndibuvJE0yyYWMEj2AjYObhKRLFxRd87KmnnZ4tY7-I0SINw2o33J2', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
  elseif server == "3" then
    PerformHttpRequest('https://discordapp.com/api/webhooks/561621263060172810/SUbq4iGttIfRCkndibuvJE0yyYWMEj2AjYObhKRLFxRd87KmnnZ4tY7-I0SINw2o33J4', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
  end
end