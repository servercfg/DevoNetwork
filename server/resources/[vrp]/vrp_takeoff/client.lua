vRP = Proxy.getInterface("vRP")

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterCommand("maske", function(source, args, rawCommand)
    changeCloth("maske")
end)
RegisterCommand("hat", function(source, args, rawCommand)
    changeCloth("hat")
end)
RegisterCommand("jakke", function(source, args, rawCommand)
    changeCloth("jakke")
end)
RegisterCommand("tshirt", function(source, args, rawCommand)
    changeCloth("tshirt")
end)
RegisterCommand("bukser", function(source, args, rawCommand)
    changeCloth("bukser")
end)
RegisterCommand("slips", function(source, args, rawCommand)
    changeCloth("slips")
end)
RegisterCommand("sko", function(source, args, rawCommand)
    changeCloth("sko")
end)

local cloths =  {
    ["maske"] = {
        status = false,
        comp = 1,
        offdict = "misscommon@std_take_off_masks",
        offanim = "take_off_mask_rps",
        ondict = "mp_masks@on_foot",
        onanim = "put_on_mask",
    },
    ["hat"] = {
        status = false,
        prop = 0,
        offdict = "misscommon@std_take_off_masks",
        offanim = "take_off_mask_rps",
        ondict = "mp_masks@on_foot",
        onanim = "put_on_mask",
    },
    ["jakke"] = {
        status = false,
        comp = 11,
        offdict = "clothingshirt",
        offanim = "try_shirt_negative_a",
        ondict = "clothingshirt",
        onanim = "try_shirt_positive_a",
        start = 2500,
        stop = 2500
    },
    ["tshirt"] = {
        status = false,
        comp = 8,
        offdict = "clothingshirt",
        offanim = "try_shirt_negative_a",
        ondict = "clothingshirt",
        onanim = "try_shirt_positive_a",
        start = 2500,
        stop = 2500
    },
    ["bukser"] = {
        status = false,
        comp = 4,
        offdict = "clothingshoes",
        offanim = "try_shoes_positive_d",
        ondict = "clothingshoes",
        onanim = "try_shoes_positive_d",
        start = 2500,
        stop = 2500
    },
    ["slips"] = {
        status = false,
        comp = 7,
        offdict = "clothingtie",
        offanim = "try_tie_neutral_b",
        ondict = "clothingtie",
        onanim = "try_tie_neutral_b",
        start = 2500,
        stop = 2500
    },
    ["sko"] = {
        status = false,
        comp = 6,
        offdict = "clothingshoes",
        offanim = "try_shoes_positive_d",
        ondict = "clothingshoes",
        onanim = "try_shoes_positive_d",
        start = 2500,
        stop = 2500
    },
}
function changeCloth(cloth)
    if not vRP.isHandcuffed() then
        local ped = GetPlayerPed(-1)
        if cloths[cloth].status then
            loadAnimDict(cloths[cloth].ondict)
            TaskPlayAnim(ped, cloths[cloth].ondict, cloths[cloth].onanim, 2.0, 2.0, -1, 49, 0, 0, 0, 0)
            if cloths[cloth].start ~= nil then Citizen.Wait(cloths[cloth].start) else Citizen.Wait(1000) end
            if cloths[cloth].comp ~= nil then
                SetPedComponentVariation(ped, cloths[cloth].comp, cloths[cloth].cloth.draw, cloths[cloth].cloth.text, cloths[cloth].cloth.pal)
            elseif cloths[cloth].prop ~= nil then
                SetPedPropIndex(ped,cloths[cloth].prop,cloths[cloth].cloth.draw, cloths[cloth].cloth.text, true)
            end
            ClearPedTasks(ped)
            cloths[cloth].status = false
        else
            loadAnimDict(cloths[cloth].offdict)
            if cloths[cloth].comp ~= nil then
                cloths[cloth].cloth = {
                    draw = GetPedDrawableVariation(ped, cloths[cloth].comp),
                    text = GetPedTextureVariation(ped, cloths[cloth].comp),
                    pal = GetPedPaletteVariation(ped, cloths[cloth].comp),
                }
            elseif cloths[cloth].prop ~= nil then
                cloths[cloth].cloth = {
                    draw = GetPedPropIndex(ped,cloths[cloth].prop),
                    text = GetPedPropTextureIndex(ped,cloths[cloth].prop),
                }
            end
            TaskPlayAnim(ped, cloths[cloth].offdict, cloths[cloth].offanim, 2.0, 2.0, -1, 49, 0, 0, 0, 0)
            if cloths[cloth].stop ~= nil then Citizen.Wait(cloths[cloth].stop) else Citizen.Wait(1000) end
            if cloths[cloth].comp ~= nil then
                local text = 0
                local draw = 0
                if cloth == "jakke" or cloth == "tshirt" or cloth == "slips" then
                    text = 240
                    draw = 21
                    SetPedComponentVariation(ped, 3, 15, 0, 0)
                elseif cloth == "bukser" then
                    if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
                        draw = 56
                    else
                        draw = 21
                    end
                elseif cloth == "sko" then
                    if(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
                        draw = 35
                    else
                        draw = 34
                    end
                end
                SetPedComponentVariation(ped, cloths[cloth].comp, draw, text, 0)
            elseif cloths[cloth].prop ~= nil then
                ClearPedProp(ped,cloths[cloth].prop)
            end
            ClearPedTasks(ped)
            cloths[cloth].status = true
        end
    end
end