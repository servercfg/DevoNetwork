HaveBagOnHead = false

RegisterNetEvent('vrp:putOnBag') --This event put head bag on nearest player
AddEventHandler('vrp:putOnBag', function()
  if not HaveBagOnHead then
    local playerPed = GetPlayerPed(-1)
    Item = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true) -- Create head bag object!
    AttachEntityToEntity(Item, playerPed, GetPedBoneIndex(playerPed, 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- Attach object to head
    SetNuiFocus(false,false)
    SendNUIMessage({type = 'openGeneral'})
    HaveBagOnHead = true
  else
    DeleteEntity(Item)
    SetEntityAsNoLongerNeeded(Item)
    SendNUIMessage({type = 'closeAll'})
    HaveBagOnHead = false
  end
end)    

AddEventHandler('vRP:playerSpawn', function() --This event delete head bag when player is spawn again
  DeleteEntity(Item)
  SetEntityAsNoLongerNeeded(Item)
  SendNUIMessage({type = 'closeAll'})
  HaveBagOnHead = false
end)
