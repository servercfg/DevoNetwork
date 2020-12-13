local firstSpawn = true
local componentScroller = 0
local subComponentScroller = 0
local textureScroller = 0
local paletteScroller = 0
local removeScroller = 0
local opacityScroller = 0
local colourScroller = 0

local checkperm = false
function OpenClothes()
    Menu.SetupMenu("clothing_main","Tøjbutik")
    Menu.Switch(nil, "clothing_main")
    for k,v in pairs(menu_options) do
        Menu.addOption("clothing_main", function()
            if(Menu.Option(v.name))then
                if v.name == "Private Modeller" or v.name == "Politi Tøj" or v.name == "EMS Tøj" or v.name == "Hemmeligt" then
                    if checkperm == false then
                        checkperm = true
                        TriggerServerEvent("ftn-clothing:hasaccess", v.name)
                        SetTimeout(3000, function()
                            checkperm = false
                        end)
                    else
                        TriggerEvent("pNotify:SendNotification",{
                            text = "Du skal vente med at prøve igen!",
                            type = "error",
                            timeout = 3000,
                            layout = "centerRight",
                            queue = "global",
                            animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
                        })
                    end
                else
                    v.f(v.name,v.param)
                end
            end
        end)
    end
end

RegisterNetEvent('ftn-clothing:access')
AddEventHandler('ftn-clothing:access', function(menuname)
    Menu.Switch(nil, "clothing_main")
    for k,v in pairs(menu_options) do
        if v.name == menuname then
            v.f(menuname,v.param)
        end
    end
end)

function listModels(title, table)
    Menu.SetupMenu("clothing_models", title)
    Menu.Switch("clothing_main", "clothing_models")
    for k,v in pairs(table) do
        Menu.addOption("clothing_models", function()
            if(Menu.Option(v))then
                TriggerEvent("clothes:changemodel", v)
            end
        end)
    end
end

function customise(title)
    Menu.SetupMenu("clothing_customise", title)
    Menu.Switch("clothing_main", "clothing_customise")
    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") or GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01") then
        componentScroller = 0
        subComponentScroller = GetPedDrawableVariation(GetPlayerPed(-1), componentScroller)
        textureScroller = GetPedTextureVariation(GetPlayerPed(-1), componentScroller)
        paletteScroller = GetPedPaletteVariation(GetPlayerPed(-1), componentScroller)
        Menu.addOption("clothing_customise", function()
            if(Menu.ScrollBarString({"Ansigt","Maske","Hår","Hænder","Bukser","Tasker","Sko","Smykker","Undertøj","Skudsikker Vest","Mærkater","Bluse"}, componentScroller, function(cb)  componentScroller = cb end)) then
                subComponentScroller = GetPedDrawableVariation(GetPlayerPed(-1), componentScroller)
                textureScroller = GetPedTextureVariation(GetPlayerPed(-1), componentScroller)
                paletteScroller = GetPedPaletteVariation(GetPlayerPed(-1), componentScroller)
            end
        end)
        Menu.addOption("clothing_customise", function()
            if(Menu.ScrollBarInt("Components", subComponentScroller, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentScroller), function(cb)  subComponentScroller = cb end)) then
                if componentScroller == 0 then
                    SetPedHeadBlendData(GetPlayerPed(-1), subComponentScroller, subComponentScroller, 0, subComponentScroller, subComponentScroller, 0, 0.5, 0.5, 0.0, false)
                end
                SetPedComponentVariation(GetPlayerPed(-1), componentScroller, 0, 240, 0)
                SetPedComponentVariation(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, paletteScroller)
                textureScroller = 0
                paletteScroller = 0
            end
        end)
        Menu.addOption("clothing_customise", function()
            local textureMax = 0
            if componentScroller == 2 then textureMax = GetNumHairColors() else textureMax = GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentScroller, subComponentScroller) end
            if(Menu.ScrollBarInt("Textures", textureScroller, textureMax, function(cb)  textureScroller = cb end)) then
                if componentScroller == 2 then
                    SetPedComponentVariation(GetPlayerPed(-1), componentScroller, subComponentScroller, 0, 1)
                    SetPedHairColor(GetPlayerPed(-1), textureScroller, textureScroller)
                    player_data.clothing.textures[3] = textureScroller
                else
                    SetPedComponentVariation(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, paletteScroller)
                end
            end
        end)
        Menu.addOption("clothing_customise", function()
            if(Menu.ScrollBarInt("Colour Palette", paletteScroller, 2, function(cb)  paletteScroller = cb end)) then
                SetPedComponentVariation(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, paletteScroller)
            end
        end)
        Menu.addOption("clothing_customise", function()
            if(Menu.Option("Remove Undershirt"))then
                SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
            end
        end)
        Menu.addOption("clothing_customise", function()
            if(Menu.Option("Randomize"))then
                SetPedRandomComponentVariation(GetPlayerPed(-1), true)
            end
        end)
    else
        componentScroller = 0
        subComponentScroller = GetPedDrawableVariation(GetPlayerPed(-1), componentScroller)
        textureScroller = GetPedTextureVariation(GetPlayerPed(-1), componentScroller)
        paletteScroller = GetPedPaletteVariation(GetPlayerPed(-1), componentScroller)
        Menu.addOption("clothing_customise", function()
            local precomponentTable = {"Ansigt","Ingen","Hår","Bluse","Bukser","Ingen","Ingen","Ingen","Smykker","Ingen","Ingen","Ingen"}
            local componentTable = {}
            for i = 0, 11 do
                if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), i) ~= 0 and GetNumberOfPedDrawableVariations(GetPlayerPed(-1), i) ~= false then
                    componentTable[i+1] = precomponentTable[i+1]
                else
                    componentTable[i+1] = "Empty slot"
                end
            end
            if(Menu.ScrollBarString(componentTable, componentScroller, function(cb)  componentScroller = cb end)) then
                subComponentScroller = GetPedDrawableVariation(GetPlayerPed(-1), componentScroller)
                textureScroller = GetPedTextureVariation(GetPlayerPed(-1), componentScroller)
                paletteScroller = GetPedPaletteVariation(GetPlayerPed(-1), componentScroller)
            end
        end)
        Menu.addOption("clothing_customise", function()
            if(Menu.ScrollBarInt("Components", subComponentScroller, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentScroller), function(cb)  subComponentScroller = cb end)) then
                SetPedComponentVariation(GetPlayerPed(-1), componentScroller, 0, 240, 0)
                SetPedComponentVariation(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, paletteScroller)
                textureScroller = 0
                paletteScroller = 0
            end
        end)
        Menu.addOption("clothing_customise", function()
            if(Menu.ScrollBarInt("Textures", textureScroller, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentScroller, subComponentScroller), function(cb)  textureScroller = cb end)) then
                if componentScroller == 2 then player_data.clothing.textures[3] = textureScroller end
                SetPedComponentVariation(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, paletteScroller)
            end
        end)
        Menu.addOption("clothing_customise", function()
            if(Menu.ScrollBarInt("Colour Palette", paletteScroller, 2, function(cb)  paletteScroller = cb end)) then
                SetPedComponentVariation(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, paletteScroller)
            end
        end)
        Menu.addOption("clothing_customise", function()
            if(Menu.Option("Randomize"))then
                SetPedRandomComponentVariation(GetPlayerPed(-1), true)
            end
        end)
    end
end

function accessories(title)
    Menu.SetupMenu("clothing_accessories", title)
    Menu.Switch("clothing_main", "clothing_accessories")
    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") or GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01") then
        componentScroller = 0
        subComponentScroller = GetPedPropIndex(GetPlayerPed(-1), componentScroller)
        textureScroller = GetPedPropTextureIndex(GetPlayerPed(-1), componentScroller)
        Menu.addOption("clothing_accessories", function()
            if(Menu.ScrollBarString({"Hjelme","Briller","Øringe","Tom Plads","Tom Plads","Tom Plads","Venstre håndled","Højre håndled"}, componentScroller, function(cb)  componentScroller = cb end)) then
                subComponentScroller = GetPedPropIndex(GetPlayerPed(-1), componentScroller)
                textureScroller = GetPedPropTextureIndex(GetPlayerPed(-1), componentScroller)
            end
        end)
        Menu.addOption("clothing_accessories", function()
            if(Menu.ScrollBarInt("Components", subComponentScroller, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), componentScroller), function(cb)  subComponentScroller = cb end)) then
                SetPedPropIndex(GetPlayerPed(-1), componentScroller, 0, 240, 0)
                SetPedPropIndex(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, false)
                textureScroller = 0
            end
        end)
        Menu.addOption("clothing_accessories", function()
            if(Menu.ScrollBarInt("Textures", textureScroller, GetNumberOfPedPropTextureVariations(PlayerPedId(), componentScroller, subComponentScroller), function(cb)  textureScroller = cb end)) then
                SetPedPropIndex(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, false)
            end
        end)
        Menu.addOption("clothing_accessories", function()
            if(Menu.ScrollBarStringSelect({"Slet Hjelme","Slet briller","Slet Øringe","Slet Venstre håndled","Slet Højre håndled"}, removeScroller, function(cb)  removeScroller = cb end)) then
                if removeScroller ~= 3 and removeScroller ~= 4 then
                    ClearPedProp(GetPlayerPed(-1), tonumber(removeScroller))
                elseif removeScroller == 3 then
                    ClearPedProp(GetPlayerPed(-1), 6)
                else
                    ClearPedProp(GetPlayerPed(-1), 7)
                end
            end
        end)
        Menu.addOption("clothing_accessories", function()
            if(Menu.Option("Randomize"))then
                SetPedRandomProps(GetPlayerPed(-1))
            end
        end)
    else
        local precomponentTable = {"Hjelme","Briller","Øringe","Tom Plads","Tom Plads","Tom Plads","Venstre håndled","Højre håndled"}
        local componentTable = {}
        for i = 0, 7 do
            if GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), i) ~= 0 and GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), i) ~= false then
                componentTable[i+1] = precomponentTable[i+1]
            else
                componentTable[i+1] = "Empty slot"
            end
        end
        componentScroller = 0
        subComponentScroller = GetPedDrawableVariation(GetPlayerPed(-1), componentScroller)
        textureScroller = GetPedTextureVariation(GetPlayerPed(-1), componentScroller)
        Menu.addOption("clothing_accessories", function()
            if(Menu.ScrollBarString(componentTable, componentScroller, function(cb)  componentScroller = cb end)) then
                subComponentScroller = GetPedPropIndex(GetPlayerPed(-1), componentScroller)
                textureScroller = GetPedPropTextureIndex(GetPlayerPed(-1), componentScroller)
            end
        end)
        Menu.addOption("clothing_accessories", function()
            if(Menu.ScrollBarInt("Components", subComponentScroller, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), componentScroller), function(cb)  subComponentScroller = cb end)) then
                SetPedPropIndex(GetPlayerPed(-1), componentScroller, 0, 240, 0)
                SetPedPropIndex(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, false)
                textureScroller = 0
            end
        end)
        Menu.addOption("clothing_accessories", function()
            if(Menu.ScrollBarInt("Textures", textureScroller, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentScroller, subComponentScroller), function(cb)  textureScroller = cb end)) then
                SetPedPropIndex(GetPlayerPed(-1), componentScroller, subComponentScroller, textureScroller, false)
            end
        end)
        Menu.addOption("clothing_accessories", function()
            if(Menu.ScrollBarStringSelect({"Slet Hjelme","Slet briller","Slet Øringe","Slet Venstre håndled","Slet Højre håndled"}, removeScroller, function(cb)  removeScroller = cb end)) then
                if removeScroller ~= 3 and removeScroller ~= 4 then
                    ClearPedProp(GetPlayerPed(-1), tonumber(removeScroller))
                elseif removeScroller == 3 then
                    ClearPedProp(GetPlayerPed(-1), 6)
                else
                    ClearPedProp(GetPlayerPed(-1), 7)
                end
            end
        end)
        Menu.addOption("clothing_accessories", function()
            if(Menu.Option("Randomize"))then
                SetPedRandomProps(GetPlayerPed(-1))
            end
        end)
    end
end

function overlays(title)
    Menu.SetupMenu("clothing_overlays", title)
    Menu.Switch("clothing_main", "clothing_overlays")
    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") or GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01") then
        componentScroller = 0
        subComponentScroller = GetPedHeadOverlayValue(GetPlayerPed(-1), componentScroller)
        Menu.addOption("clothing_overlays", function()
            if(Menu.ScrollBarString({"pletter","Ansigtshår","Øjenbryn","Aging","Makeup","Rødme","Teint","Solskader","Læbestift","Mol/Fregner","Brysthår","Kropssmerter","Tilføj Kropssmerter"}, componentScroller, function(cb)  componentScroller = cb end)) then
                subComponentScroller = GetPedHeadOverlayValue(GetPlayerPed(-1), componentScroller)
            end
        end)
        Menu.addOption("clothing_overlays", function()
            if(Menu.ScrollBarInt("Components", subComponentScroller, GetNumHeadOverlayValues(GetPlayerPed(-1), componentScroller), function(cb)  subComponentScroller = cb end)) then
                SetPedHeadOverlay(GetPlayerPed(-1), componentScroller, subComponentScroller, 1.0)
                opacityScroller = 1.0
            end
        end)
        Menu.addOption("clothing_overlays", function()
            if(Menu.ScrollBarInt("Opacity", opacityScroller, 10, function(cb)  opacityScroller = cb end)) then
                SetPedHeadOverlay(GetPlayerPed(-1), componentScroller, subComponentScroller, tonumber(opacityScroller/10))
                player_data.overlays.opacity[componentScroller+1] = tonumber(opacityScroller/10)
            end
        end)
        Menu.addOption("clothing_overlays", function()
            if(Menu.ScrollBarInt("Colours", colourScroller, 63, function(cb)  colourScroller = cb end)) then
                local colourType = 0
                if componentScroller == 1 or componentScroller == 2 or componentScroller == 10 then colourType = 1 elseif componentScroller == 5 or componentScroller == 8 then colourType = 2 else colourType = 0 end
                SetPedHeadOverlayColor(GetPlayerPed(-1), componentScroller, colourType, colourScroller, colourScroller)
                player_data.overlays.colours[componentScroller+1] = {colourType = colourType, colour = colourScroller}
            end
        end)
    else
    end
end

function save()
    player_data.model = GetEntityModel(GetPlayerPed(-1))
    player_data.new = false
    for i = 0, 11 do
        player_data.clothing.drawables[i+1] = GetPedDrawableVariation(GetPlayerPed(-1), i)
        if i ~= 2 then
            player_data.clothing.textures[i+1] = GetPedTextureVariation(GetPlayerPed(-1), i)
        end
        player_data.clothing.palette[i+1] = GetPedPaletteVariation(GetPlayerPed(-1), i)
    end
    for i = 0, 7 do
        player_data.props.drawables[i+1] = GetPedPropIndex(GetPlayerPed(-1), i)
        player_data.props.textures[i+1] = GetPedPropTextureIndex(GetPlayerPed(-1), i)
    end
    for i = 0, 12 do
        player_data.overlays.drawables[i+1] = GetPedHeadOverlayValue(GetPlayerPed(-1), i)
    end

    if player_data.clothing.drawables[12] == 55 and GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then player_data.clothing.drawables[12] = 56 SetPedComponentVariation(GetPlayerPed(-1), 11, 56, 0, 2) end
    if player_data.clothing.drawables[12] == 48 and GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01") then player_data.clothing.drawables[12] = 49 SetPedComponentVariation(GetPlayerPed(-1), 11, 49, 0, 2) end

    TriggerServerEvent("clothes:save", player_data)
end

function DisplayHelpText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
		local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 20,20,20,150)
end

AddEventHandler("clothes:changemodel", function(skin)
    local model = GetHashKey(skin)
    if IsModelInCdimage(model) and IsModelValid(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        if skin ~= "mp_f_freemode_01" and skin ~= "mp_m_freemode_01" then 
            SetPedRandomComponentVariation(GetPlayerPed(-1), true)
        else
            SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
            SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
            SetPedComponentVariation(GetPlayerPed(-1), 11, 6, 1, 0)
        end
        SetModelAsNoLongerNeeded(model)
    else
    end
end)

RegisterNetEvent("clothes:spawn")
AddEventHandler("clothes:spawn", function(data)
    player_data = data
    local model = player_data.model
    if IsModelInCdimage(model) and IsModelValid(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        if skin ~= "mp_f_freemode_01" and skin ~= "mp_m_freemode_01" then 
            SetPedRandomComponentVariation(GetPlayerPed(-1), true)
        else
            SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
            SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
            SetPedComponentVariation(GetPlayerPed(-1), 11, 6, 1, 0)
        end
        SetModelAsNoLongerNeeded(model)
        if not player_data.new then
            TriggerEvent("clothes:setComponents")
        else
            TriggerServerEvent("clothes:loaded")
        end
    end
end)

AddEventHandler("clothes:setComponents", function()
    if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") or GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01") then
        for i = 0, 11 do
            if i == 0 then
                SetPedHeadBlendData(GetPlayerPed(-1), player_data.clothing.drawables[i+1], player_data.clothing.drawables[i+1], 0, player_data.clothing.drawables[i+1], player_data.clothing.drawables[i+1], 0, 0.5, 0.5, 0.0, false)
            elseif i == 2 then
                SetPedComponentVariation(GetPlayerPed(-1), i, player_data.clothing.drawables[i+1], 0, 1)
                SetPedHairColor(GetPlayerPed(-1), player_data.clothing.textures[i+1], player_data.clothing.textures[i+1])
            else
                SetPedComponentVariation(GetPlayerPed(-1), i, player_data.clothing.drawables[i+1], player_data.clothing.textures[i+1], player_data.clothing.palette[i+1])
            end
        end
        for i = 0, 7 do
            SetPedPropIndex(GetPlayerPed(-1), i, player_data.props.drawables[i+1], player_data.props.textures[i+1], false)
        end
        for i = 0, 12 do
            SetPedHeadOverlay(GetPlayerPed(-1), i, player_data.overlays.drawables[i+1], player_data.overlays.opacity[i+1])
            SetPedHeadOverlayColor(GetPlayerPed(-1), i, player_data.overlays.colours[i+1].colourType, player_data.overlays.colours[i+1].colour, player_data.overlays.colours[i+1].colour)
        end
    else
        for i = 0, 11 do
            SetPedComponentVariation(GetPlayerPed(-1), i, player_data.clothing.drawables[i+1], player_data.clothing.textures[i+1], player_data.clothing.palette[i+1])
        end
        for i = 0, 7 do
            SetPedPropIndex(GetPlayerPed(-1), i, player_data.props.drawables[i+1], player_data.props.textures[i+1], false)
        end
    end
    TriggerServerEvent("clothes:loaded")
end)

AddEventHandler("playerSpawned", function()
    if firstSpawn then
        firstSpawn = false
        TriggerServerEvent("clothes:firstspawn")
    else
        TriggerServerEvent("clothes:spawn")
    end
end)
