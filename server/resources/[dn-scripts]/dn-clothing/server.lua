models = {}
RegisterServerEvent("clothes:firstspawn")
AddEventHandler("clothes:firstspawn",function()
	local source = source
	local identifier = getID("steam",source)
	if identifier ~= nil then
		if models[identifier] then
			TriggerClientEvent("clothes:spawn", source, models[identifier])
		else
			local default_models = {1413662315,-781039234,1077785853,2021631368,1423699487,1068876755,2120901815,-106498753,131961260,-1806291497,1641152947,115168927,330231874,-1444213182,1809430156,1822107721,2064532783,-573920724,-782401935,808859815,-1106743555,-1606864033,1004114196,532905404,1699403886,-1656894598,1674107025,-88831029,-1244692252,951767867,1388848350,1090617681,379310561,-569505431,-1332260293,-840346158}
			models[identifier] = {
				model = default_models[math.random(1,tonumber(#default_models))],
				new = true,
				clothing = {drawables = {0,0,0,0,0,0,0,0,0,0,0,0},textures = {2,0,1,1,0,0,0,0,0,0,0,0},palette = {0,0,0,0,0,0,0,0,0,0,0,0}},
				props = {drawables = {-1,-1,-1,-1,-1,-1,-1,-1}, textures = {-1,-1,-1,-1,-1,-1,-1,-1}},
				overlays = {drawables = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}, opacity = {1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0}, colours = {{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0},{colourType = 0, colour = 0}}},
			}
			saveModels()
			TriggerClientEvent("clothes:spawn", source, models[identifier])
		end
	end
end)

RegisterServerEvent("clothes:spawn")
AddEventHandler("clothes:spawn",function()
	local source = source
	local identifier = getID("steam",source)
	TriggerClientEvent("clothes:spawn", source, models[identifier])
end)

RegisterServerEvent("clothes:loaded")
AddEventHandler("clothes:loaded",function()
	-- Give weapons etc
end)

RegisterServerEvent("clothes:save")
AddEventHandler("clothes:save",function(player_data)
	local source = source
	local identifier = getID("steam",source)
	if identifier ~= nil and player_data ~= nil then
		models[identifier] = player_data
		saveModels()
		-- Give weapons etc
	end
end)

function loadModels()
    models = LoadResourceFile(GetCurrentResourceName(), "models.txt") or "[]"
    models = json.decode(models)
end

function saveModels()
	SaveResourceFile(GetCurrentResourceName(), "models.txt", json.encode(models), -1)
end

function getID(type, source)
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(tostring(v), 1, string.len("steam:")) == "steam:" and (type == "steam" or type == 1) then
            return v
        elseif string.sub(tostring(v), 1, string.len("license:")) == "license:" and (type == "license" or type == 2) then
            return v
        elseif string.sub(tostring(v), 1, string.len("ip:")) == "ip:" and (type == "ip" or type == 3) then
            return v
        end
    end
    return nil
end

loadModels()