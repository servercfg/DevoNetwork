
--Made by Skovsbøll#3650
-- Add an event handler for the 'chatMessage' event
AddEventHandler( 'chatMessage', function( source, n, msg )

    msg = string.lower( msg )
    
    -- Check to see if a client typed in /dv
    if ( msg == "/revive" or msg == "/reviveme" ) then 
    
        -- Cancel the chat message event (stop the server from posting the message)
        CancelEvent() 
        
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        if vRP.hasPermission({user_id,"staff.revive"}) then
        -- Trigger the client event 
        TriggerClientEvent( 'revive', source )
        end
    end
end )