local events = {
  'esx_ambulancejob:revive',
  'esx_society:openBossMenu',
  'esx_truckerjob:pay',
  'esx_joblisting:setJob',
  'esx_policejob:handcuff',
  'esx_policejob:OutVehicle,',
  'esx_weashop:buyItem',
  'esx:spawnVehicle',
  'esx_vehicleshop:putStockItems',
  'esx_slotmachine:sv:2',
  'AdminMenu:giveCash',
  'AdminMenu:giveBank',
  'AdminMenu:giveDirtyMoney',
  'NB:recruterplayer',
}


for i=1, #events, 1 do
  AddEventHandler(events[i], function()
    TriggerServerEvent('613cd851-bb4c-4825-8d4a-423caa7bf2c3', events[i])
  end)
end

