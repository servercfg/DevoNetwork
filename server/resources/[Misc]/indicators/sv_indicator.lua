RegisterServerEvent('IndicatorL')
RegisterServerEvent('IndicatorR')
RegisterServerEvent('IndicatorB')
 
AddEventHandler('IndicatorL', function(IndicatorL)
    local netID = source
    TriggerClientEvent('updateIndicators', -1, netID, 'left', IndicatorL)
end)
 
AddEventHandler('IndicatorR', function(IndicatorR)
    local netID = source
    TriggerClientEvent('updateIndicators', -1, netID, 'right', IndicatorR)
end)

AddEventHandler('IndicatorB', function(IndicatorB)
    local netID = source
    TriggerClientEvent('updateIndicators', -1, netID, 'both', IndicatorB)
end)