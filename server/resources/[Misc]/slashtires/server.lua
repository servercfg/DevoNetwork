-- DU SKAL IKKE ÆNDRE NOGET HERINDE, MED MINDRE DU VED HVAD DU LAVER I FORHOLD TIL CLIENT.LUA

RegisterServerEvent("SlashTires:TargetClient")
AddEventHandler("SlashTires:TargetClient", function(client, tireIndex)
	TriggerClientEvent("SlashTires:SlashClientTire", client, tireIndex)
end)