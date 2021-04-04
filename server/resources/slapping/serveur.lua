RegisterServerEvent('RebornProject:SyncSon_Serveur')
AddEventHandler('RebornProject:SyncSon_Serveur', function()
    TriggerClientEvent('RebornProject:SyncSon_Client', -1, source)
end)

RegisterServerEvent('RebornProject:SyncGiffle')
AddEventHandler('RebornProject:SyncGiffle', function(netID)
    TriggerClientEvent('RebornProject:SyncAnimation', netID)
end)