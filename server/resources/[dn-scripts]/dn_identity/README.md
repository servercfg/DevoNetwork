# Asser Identitycard
Dette er idkort baseret på jsfour's resource @ https://github.com/jonassvensson4/jsfour-idcard.

Denne version indeholder kun kørekort og sygesikringsbevis, dog er begge designet til at ligne dem vi bruger i Danmark.

![Alt text](http://itseasy.dk/e5818b9e.png "Asser IdentityCard")

## LICENS
//Fra js-four ( forked )
Please don't sell or reupload this resource

## INSTALLATION
For at dette virker skal du have installeret både <a href="https://github.com/ESX-Org/es_extended">es_extended</a> og <a href="https://github.com/ESX-Org/esx_license">esx_license</a> på din server.

Klon git eller download masteren.

Tilføj: start asser-identitycard til din server.cfg.

## Brug
(Courtesy of Jsfour)
```
-- Look at your own ID-card
TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))

-- Show your ID-card to the closest person
local player, distance = ESX.Game.GetClosestPlayer()

if distance ~= -1 and distance <= 3.0 then
  TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
else
  ESX.ShowNotification('No players nearby')
end



-- Look at your own driver license
TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')

-- Show your driver license to the closest person
local player, distance = ESX.Game.GetClosestPlayer()

if distance ~= -1 and distance <= 3.0 then
  TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
else
  ESX.ShowNotification('No players nearby')
end


-- Look at your own firearms license
TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')

-- Show your firearms license to the closest person
local player, distance = ESX.Game.GetClosestPlayer()

if distance ~= -1 and distance <= 3.0 then
  TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
else
  ESX.ShowNotification('No players nearby')
end

-- A menu (THIS IS AN EXAMPLE)
function openMenu()
  ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = 'ID menu',
		elements = {
			{label = 'Check your ID', value = 'checkID'},
			{label = 'Show your ID', value = 'showID'},
      {label = 'Check your driver license', value = 'checkDriver'},
      {label = 'Show your driver license', value = 'showDriver'},
      {label = 'Check your firearms license', value = 'checkFirearms'},
      {label = 'Show your firearms license', value = 'showFirearms'},
		}
	},
	function(data, menu)
		if data.current.value == 'checkFirearms' then
			TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
		elseif data.current.value == 'showFirearms' then
			 if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
      else
        ESX.ShowNotification('No players nearby')
      end
		elseif data.current.value == 'checkID' then
			TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
    elseif data.current.value == 'showID' then
      local player, distance = ESX.Game.GetClosestPlayer()

      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
      else
        ESX.ShowNotification('No players nearby')
      end
    elseif data.current.value == 'checkDriver' then
      TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
    elseif data.current.value == 'showDriver' then
      local player, distance = ESX.Game.GetClosestPlayer()

      if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('identitycardd:show', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
      else
        ESX.ShowNotification('No players nearby')
      end
		end
	end,
	function(data, menu)
		menu.close()
	end
)
end
```
