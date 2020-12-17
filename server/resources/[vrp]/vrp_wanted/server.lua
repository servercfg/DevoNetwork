MySQL = module("vrp_mysql", "MySQL")
local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_wanted")

MySQL.createCommand("vRP/wanted_column", [[
CREATE TABLE IF NOT EXISTS vrp_wanted(
  user_id INTEGER,
  wantedreason VARCHAR(100),
  wantedby INTEGER,
  timestamp INTEGER,
  count INTEGER
);
]])

MySQL.createCommand("vRP/set_wanted", "INSERT INTO vrp_wanted(user_id,wantedreason,wantedby,timestamp,count) VALUES(@user_id,@reason,@by,@timestamp,@count)")
MySQL.createCommand("vRP/get_wanted", "SELECT user_id,wantedreason,count,wantedby,timestamp FROM vrp_wanted WHERE user_id = @user_id")
MySQL.createCommand("vRP/update_wanted", "UPDATE vrp_wanted SET wantedreason = @reason, wantedby = @by, count = @count WHERE user_id = @user_id")
MySQL.createCommand("vRP/remove_wanted", "DELETE FROM vrp_wanted WHERE user_id = @user_id")
MySQL.createCommand("vRP/get_player_id","SELECT user_id,registration,phone,firstname,name,age FROM vrp_user_identities WHERE firstname = @firstname AND name = @name")

MySQL.execute("vRP/wanted_column")

function vRP.efterlysPers(user_id,nuser_id,grund)
	local player = vRP.getUserSource({user_id})
	local time = os.time()
	MySQL.query("vRP/get_wanted", {user_id = nuser_id}, function(rows, affected)
		if #rows > 0 then
			vRP.request({player,"Denne person er allerde efterlyst, vil du tilføje til hans efterlysning?",25,function(player,ok)
				if ok then
					for k,v in pairs(rows) do
						local ncount = v.count + 1
						local nygrund = v.wantedreason.."<br />"..ncount..": "..grund
						vRP.getUserIdentity({user_id, function(identity)
							local firstname = identity.firstname
							local lastname = identity.name
							local name = firstname .." ".. lastname
							print(name)
							if name ~= v.wantedby then
								local pers = v.wantedby.." & "..name
							else
								local pers = name
							end
							print(pers)

							MySQL.execute("vRP/update_wanted", {user_id = nuser_id, reason = nygrund, by = pers, count = ncount})
						end})
					end
				end
			end})
		else
			vRP.getUserIdentity({user_id, function(identity)
				local firstname = identity.firstname
				local lastname = identity.name
				local name = firstname .." ".. lastname
				print(name)
				local time = os.time()
				local grund = "<br />1: "..grund
				local count = 1
				MySQL.execute("vRP/set_wanted", {user_id = nuser_id, reason = grund, by = name, timestamp = time, count = count})
			end})
		end
	end)
end

local function ch_getwanted(player,choice)
	vRP.prompt({player,"CPR-nummer:","",function(player, cpr)
		vRP.getUserByRegistration({cpr, function(nuser_id)
			if nuser_id ~= nil then
				MySQL.query("vRP/get_wanted", {user_id = nuser_id}, function(rows, affected)
					vRP.getUserIdentity({nuser_id, function(identity)
						local firstname = identity.firstname
						local lastname = identity.name
						local navn = firstname .." ".. lastname
						local cpr = identity.registration
						local alder = identity.age
						if #rows > 0 then
							local efterlyst = "<b style='color:#ff0000'>Efterlyst</b>"
							for k,v in pairs(rows) do
								local wantedtime = os.date('%d-%m-%Y %H:%M:%S', v.timestamp)
								if #rows == 1 then
									local content = "<strong>Navn: </strong>"..navn.."<br /><strong>CPR: </strong>"..cpr.."<br /><strong>Alder: </strong>"..alder.."<br /><br /><strong>Status: </strong>"..efterlyst.."<br /><br /><strong>Grund: </strong>"..v.wantedreason.."<br /><br /><strong>Efterlyst af: </strong>"..v.wantedby.."<br /><strong>Dato på efterlysning: </strong>"..wantedtime.."<br />"
									vRPclient.setDiv(player,{"wanted_menu",".div_wanted_menu{ background-color: rgba(0,0,0,0.75); color: white; font-weight: bold; width: 500px; padding: 10px; margin: auto; margin-top: 150px; }",content})
									--
									vRP.request({player,"Fjern Register", 1000, function(player,ok)
										vRPclient.removeDiv(player,{"wanted_menu"})
									end})
								end
							end
						else
							local efterlyst = "<b style='color:#33cc33'>Ikke Efterlyst</b>"
							local content = "<strong>Navn: </strong>"..navn.."<br /><strong>CPR: </strong>"..cpr.."<br /><strong>Alder: </strong>"..alder.."<br /><br /><strong>Status: </strong>"..efterlyst.."<br />"
							vRPclient.setDiv(player,{"wanted_menu",".div_wanted_menu{ background-color: rgba(0,0,0,0.75); color: white; font-weight: bold; width: 500px; padding: 10px; margin: auto; margin-top: 150px; }",content})
							--
							vRP.request({player,"Fjern Register", 1000, function(player,ok)
								vRPclient.removeDiv(player,{"wanted_menu"})
							end})
						end
					end})
				end)
			end
		end})
	end})
end 

local function ch_efterlyscpr(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		vRP.prompt({player,"CPR-nummer:","",function(player, cpr)
			if cpr ~= nil and cpr ~= "" then
				vRP.getUserByRegistration({cpr, function(nuser_id)
					if nuser_id ~= nil then
						vRP.prompt({player,"Grund:","",function(player, grund)
							if grund ~= nil and grund ~= "" then
								vRP.efterlysPers(user_id,nuser_id,grund)
							else
								vRPclient.notify(player,{"Du skal skrive en grund!"})
							end
						end})
					else
						vRPclient.notify(player,{"Ugyldigt CPR-nummer"})
					end
				end})
			else
				vRPclient.notify(player,{"Ugyldigt CPR-nummer"})
			end
		end})
	end
end

local function ch_efterlys(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		vRP.prompt({player,"Fulde Navn (med mellemrum mellem første & efternavn):","",function(player, snavn)
			if snavn ~= nil and snavn ~= "" then
                navn = stringSplit(snavn, " ")
                local firstname = navn[1]
                local name = navn[2]
				if navn[1] == nil or navn[1] == "" or navn[2] == nil or navn[2] == "" then
					vRPclient.notify(player,{"Ugyldigt navn."})
					return
				end


				MySQL.query("vRP/get_player_id", {firstname = firstname, name = name}, function(rows, affected)
					if #rows > 0 then
						local identity = rows[1]
						local nuser_id = identity.user_id
						vRP.prompt({player,"Grund:","",function(player, grund)
							vRP.efterlysPers(user_id,nuser_id,grund)
						end})
					else
						vRPclient.notify(player,{"Kunne ikke finde dette navn i regiseret."})
					end
				end)
			else
				vRPclient.notify(player,{"Ugyldigt navn."})
			end
		end})
	end
end

local function ch_efterlysnp(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		vRP.prompt({player,"Nummerplade (med P og mellemrum):","",function(player, nummerplade)
			if nummerplade ~= nil and nummerplade ~= "" then
				local reg = nummerplade:gsub("P ", "")
				vRP.getUserByRegistration({reg, function(nuser_id)
					if nuser_id ~= nil then
						vRP.prompt({player,"Grund:","",function(player, grund)
							vRP.efterlysPers(user_id,nuser_id,grund)
						end})
					else
						vRPclient.notify(player,{"Kunne ikke finde denne nummerplade i registeret."})
					end
				end})
			else
				vRPclient.notify(player,{"Ugyldigt nummerplade."})
			end
		end})
	end
end

local function ch_fjernwanted(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil then
		vRP.prompt({player,"ID: ","",function(player, nuser_id)
			if nuser_id ~= nil and nuser_id ~= "" then
				MySQL.execute("vRP/remove_wanted", {user_id = nuser_id})
			else
				vRPclient.notify(player,{"Ugyldigt ID."})
			end
		end})
	end
end
					
vRP.registerMenuBuilder({"police", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		if(vRP.hasPermission({user_id, "police.drag"}))then
			choices["Efterlys"] = {function(player,choice)
				vRP.buildMenu({"eBoks", {player = player}, function(menu)
					menu.name = "eBoks"
					menu.css={top="75px",header_color="rgba(235,0,0,0.75)"}
					menu.onclose = function(player) vRP.openMainMenu({player}) end

					menu["Søg i register"] = {ch_getwanted,"Søg i efterlysnings registeret."}
					menu["Efterlys en person"] = {ch_efterlys,"Efterlys en person."}
					menu["Efterlys en nummerplade"] = {ch_efterlysnp,"Efterlys en nummerplade"}
					menu["Efterlys et CPR-nr"] = {ch_efterlyscpr,"Efterlys et CPR-nummer"}

					if(vRP.hasPermission({user_id, "police.drag"}))then
						menu["Fjern efterlysning"] = {ch_fjernwanted,"Fjern en efterlysning."}
					end

					vRP.openMenu({player, menu})
				end})
			end, "Efterlysnings Menu"}
		end
		add(choices)
	end
end})

function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end