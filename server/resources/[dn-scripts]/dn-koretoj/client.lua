--
-- Created by IntelliJ IDEA.
-- User: Djyss
-- Date: 09/05/2017
-- Time: 09:55
-- To change this template use File | Settings | File Templates.
--




local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "KØRETØJSMENU",
    menu_subtitle = "",
    color_r = 225,
    color_g = 0,
    color_b = 0,
}

local vehicleenginestatus = true
local mainmenu = "CloseMenu"
------------------------------------------------------------------------------------------------------------------------

-- Base du menu
function PersonnalMenu()
    options.menu_subtitle = ""
    ClearMenu()
    mainmenu = "CloseMenu"
    Menu.addButton("Motorkontrol", "moteur", nil)
    Menu.addButton("Døre og funkioner", "portieres", nil)
    Menu.addButton("Luk Menu", "CloseMenu", nil)
end

function moteur()
    options.menu_subtitle = ""
    ClearMenu()
    mainmenu = "PersonnalMenu"
    if vehicleenginestatus then
        Menu.addButton("Sluk motor", "toggleEngine", nil)
    else
        Menu.addButton("Tænd motor", "toggleEngine", nil)
    end
    Menu.addButton("Tilbage", "PersonnalMenu", nil)
end

function portieres()
    options.menu_subtitle = ""
    ClearMenu()
    mainmenu = "PersonnalMenu"
    Menu.addButton("Alle døre", "all", nil)
    Menu.addButton("Motorhjelm", "capot", nil)
    Menu.addButton("Bagklap", "coffre", nil)
    Menu.addButton("De forreste døre", "avant", nil)
    Menu.addButton("De bagerste døre", "arriere", nil)
    Menu.addButton("Tilbage", "PersonnalMenu", nil)
end

function avant()
    options.menu_subtitle = ""
    ClearMenu()
    mainmenu = "portieres"
    Menu.addButton("Frontdøren til venstre", "avantgauche", nil)
    Menu.addButton("Frontdøren til højre", "avantdroite", nil)
    Menu.addButton("Tilbage", "portieres", nil)
end

function arriere()
    options.menu_subtitle = ""
    ClearMenu()
    mainmenu = "portieres"
    Menu.addButton("Bagdøren til venstre", "arrieregauche", nil)
    Menu.addButton("Bagdøren til højre", "arrieredroite", nil)
    Menu.addButton("Tilbage", "portieres", nil)
end

function CloseMenu()
    Menu.hidden = not Menu.hidden
end

------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------
function drawTxt(options)
    SetTextFont(options.font)
    SetTextProportional(0)
    SetTextScale(options.scale, options.scale)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(0)
    SetTextEntry('STRING')
    AddTextComponentString(options.text)
    DrawRect(options.xBox,options.y,options.width,options.height,0,0,0,150)
    DrawText(options.x - options.width/2 + 0.005, options.y - options.height/2 + 0.0028)
end
function DisplayHelpText(str)
    SetTextComponentFormat('STRING')
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
function notifs(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString( msg )
    DrawNotification(false, false)
end

--------------------------------------------------- NUI CALLBACKS ------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function limiter(vit)
    speed = vit/3.6
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)

    local vehicleModel = GetEntityModel(vehicle)
    local float Max = GetVehicleMaxSpeed(vehicleModel)

    if (vit == 0) then
        SetEntityMaxSpeed(vehicle, Max)
        TriggerEvent("pNotify:SendNotification",{text = "Fartbegrænser deaktiveret",type = "success",timeout = (3000),layout = "bottomRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    else
        SetEntityMaxSpeed(vehicle, speed)
        TriggerEvent("pNotify:SendNotification",{text = "Fartbegrænser aktiveret til | <b style='color: #4E9350'>"..vit.. "</b> KM/T",type = "success",timeout = (3000),layout = "bottomRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
end

function all()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
        if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then
            SetVehicleDoorShut(playerVeh, 5, false)
            SetVehicleDoorShut(playerVeh, 4, false)
            SetVehicleDoorShut(playerVeh, 3, false)
            SetVehicleDoorShut(playerVeh, 2, false)
            SetVehicleDoorShut(playerVeh, 1, false)
            SetVehicleDoorShut(playerVeh, 0, false)
        else
            SetVehicleDoorOpen(playerVeh, 5, false)
            SetVehicleDoorOpen(playerVeh, 4, false)
            SetVehicleDoorOpen(playerVeh, 3, false)
            SetVehicleDoorOpen(playerVeh, 2, false)
            SetVehicleDoorOpen(playerVeh, 1, false)
            SetVehicleDoorOpen(playerVeh, 0, false)
            frontleft = true
        end
    end
end

function capot()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
        if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then
            SetVehicleDoorShut(playerVeh, 4, false)
        else
            SetVehicleDoorOpen(playerVeh, 4, false)
            frontleft = true
        end
    end
end

function coffre()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
        if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then
            SetVehicleDoorShut(playerVeh, 5, false)
        else
            SetVehicleDoorOpen(playerVeh, 5, false)
            frontleft = true
        end
    end
end

function avantgauche()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
        if GetVehicleDoorAngleRatio(playerVeh, 0) > 0.0 then
            SetVehicleDoorShut(playerVeh, 0, false)
        else
            SetVehicleDoorOpen(playerVeh, 0, false)
            frontleft = true
        end
    end
end

function avantdroite()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
        if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then
            SetVehicleDoorShut(playerVeh, 1, false)
        else
            SetVehicleDoorOpen(playerVeh, 1, false)
            frontleft = true
        end
    end
end

function arrieredroite()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
        if GetVehicleDoorAngleRatio(playerVeh, 3) > 0.0 then
            SetVehicleDoorShut(playerVeh, 3, false)
        else
            SetVehicleDoorOpen(playerVeh, 3, false)
            frontleft = true
        end
    end
end

function arrieregauche()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if ( IsPedSittingInAnyVehicle( playerPed ) ) then
        if GetVehicleDoorAngleRatio(playerVeh, 2) > 0.0 then
            SetVehicleDoorShut(playerVeh, 2, false)
        else
            SetVehicleDoorOpen(playerVeh, 2, false)
            frontleft = true
        end
    end
end

function SendNotification(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

------------------------------------------------------------------------------------------------------------------------
function drawMenuRight(txt,x,y,selected)
    local menu = personnelmenu.menu
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(menu.scale, menu.scale)
    SetTextRightJustify(1)
    if selected then
        SetTextColour(0, 0, 0, 255)
    else
        SetTextColour(255, 255, 255, 255)
    end
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(txt)
    DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

--------------------------------------------------------------------------------------------
Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedInAnyVehicle(GetPlayerPed(-1)) then

            if IsControlJustPressed(1, 311) then
                PersonnalMenu() -- Menu to draw
                Menu.hidden = not Menu.hidden -- Hide/Show the menu
            elseif IsControlJustPressed(1, Keys["BACKSPACE"]) and Menu.hidden == false then
                _G[mainmenu]()
            end
            Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
            if IsEntityDead(PlayerPedId()) then
                PlayerIsDead()
                -- prevent the death check from overloading the server
                playerdead = true
            end
        end
    end
end)

RegisterCommand("motor", function()
    toggleEngine(false)
end)

function toggleEngine(bool)
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
    if veh ~= 0 then
        vehicleenginestatus = not vehicleenginestatus
        if vehicleenginestatus == true then
        TriggerEvent("pNotify:SendNotification",{text = "✅ Motor tændt",type = "success",timeout = (3000),layout = "bottomRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    else
            SetVehicleEngineOn(veh, false)
            TriggerEvent("pNotify:SendNotification",{text = "⛔️ Motor slukket",type = "error",timeout = (3000),layout = "bottomRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
    else
        TriggerEvent("pNotify:SendNotification",{text = "Du skal sidde i et køretøj",type = "error",timeout = (3000),layout = "bottomRight",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
    if bool == nil then moteur() end
end

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/motor', 'Bruges til og slukke eller tænde for motoren!')
    while true do
        Citizen.Wait(1)
        local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
        if veh ~= 0 then
            if GetPedInVehicleSeat(veh, 0) then
                if vehicleenginestatus == true then
                    SetVehicleEngineOn(veh, true)
                else
                    SetVehicleEngineOn(veh, false)
                end
            end
        else
            if vehicleenginestatus == false then vehicleenginestatus = true end
        end
    end
end)


local working
------------------------------------------------------------------------------------------------------------------------
