local vehicles = {
    -- Fotovogne
    {Model= "burrito3", X= -453.00729370117, Y= -144.88781738281, Z= 37.048791503906, A= 27.267488479614},
    {Model= "burrito3", X= 343.28149414063, Y= -741.33166503906, Z= 28.22426376343, A= 341.26953125},
    {Model= "burrito3", X= 583.68109130859, Y= -1038.8240966797, Z= 35.892339324951, A= 276.79147338867},
    {Model= "burrito3", X= 1159.4560546875, Y= 603.40740966797, Z= 97.600476074219, A= 143.62663269043},
    {Model= "burrito3", X= 2419.0642089844, Y= 3944.5319824219, Z= 35.251952362061, A= 315.15115356445},
    {Model= "burrito3", X= -196.72119140625, Y= 6163.0190429688, Z= 30.325545883179, A= 314.62280273438},
    {Model= "burrito3", X= 1667.8442382813, Y= 1360.7210693359, Z= 86.216006469727, A= 169.68803405762},
    {Model= "burrito3", X= 2234.185546875, Y= 2738.4643554688, Z= 44.230134735107, A= 297.9485168457},

}

RegisterNetEvent("dn_carplacer:place")
AddEventHandler("dn_carplacer:place", function()
    for _, item in pairs(vehicles) do
        RequestModel(GetHashKey(item.Model));
        while not HasModelLoaded(GetHashKey(item.Model)) do
            RequestModel(GetHashKey(item.Model));
            Wait(1)
        end
        local vehicle = CreateVehicle(GetHashKey(item.Model), item.X, item.Y, item.Z, item.A, false, false)
        FreezeEntityPosition(vehicle,true)
        SetVehicleDoorsLocked(vehicle,1)
    end
end)