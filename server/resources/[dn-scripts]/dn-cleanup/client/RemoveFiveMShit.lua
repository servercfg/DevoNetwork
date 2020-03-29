Citizen.CreateThread(function()
    -- Other stuff normally here, stripped for the sake of only scenario stuff
    local SCENARIO_TYPES = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL", -- Zancudo Small Planes
        "WORLD_VEHICLE_MILITARY_PLANES_BIG", -- Zancudo Big Planes
    }
    local SCENARIO_GROUPS = {
        "LSA_Planes", -- LSIA planes
        "GRAPESEED_PLANES", -- Sandy Shores planes
        "Grapeseed_Planes", -- Sandy Shores planes
        "SANDY_PLANES", -- Grapeseed planes
        "ng_planes", -- Far up in the skies jets
    }
    local SUPPRESSED_MODELS = {
        "SHAMAL", -- They spawn on LSIA and try to take off
        "LUXOR", -- They spawn on LSIA and try to take off
        "LUXOR2", -- They spawn on LSIA and try to take off
        "JET", -- They spawn on LSIA and try to take off and land, remove this if you still want em in the skies
        "LAZER", -- They spawn on Zancudo and try to take off
        "TITAN", -- They spawn on Zancudo and try to take off
        "BARRACKS", -- Regularily driving around the Zancudo airport surface
        "BARRACKS2", -- Regularily driving around the Zancudo airport surface
        "CRUSADER", -- Regularily driving around the Zancudo airport surface
        "RHINO", -- Regularily driving around the Zancudo airport surface
        "AIRTUG", -- Regularily spawns on the LSIA airport surface
        "RIPLEY", -- Regularily spawns on the LSIA airport surface
        "HYDRA",
        "BUZZARD",
        "VALKYRIE",
        "VALKYRIE2",
        "BUZZARD2",
        "SAVAGE",
        "ANNIHILATOR"
    }

    while true do
        for _, sctyp in next, SCENARIO_TYPES do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, SCENARIO_GROUPS do
            SetScenarioGroupEnabled(scgrp, false)
        end
        for _, model in next, SUPPRESSED_MODELS do
            SetVehicleModelIsSuppressed(GetHashKey(model), true)
        end
        Wait(1)
    end
end)