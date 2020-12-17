DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/632962816277610516/-TjR1HFhKCC8-LWt0pf2ArluqgNVVoxX0spqohys7zjEhWVPD0prbWL8eKExMrGp05w0w2523'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/632962816277610516/-TjR1HFhKCC8-LWt0pf2ArluqgNVVoxX0spqohys7zjEhWVPD0prbWL8eKExMrGp05w0'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/632962816277610516/-TjR1HFhKCC8-LWt0pf2ArluqgNVVoxX0spqohys7zjEhWVPD0prbWL8eKExMrGp05w0sdass249'

SystemAvatar = 'https://devonetwork.dk/assets/img/Logo.png'

UserAvatar = 'https://devonetwork.dk/assets/img/Logo.png'

SystemName = 'SYSTEM'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'', '**OOC:**'},
				   {'/twt', '**Twitter: ([ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				   {'/me', '**ME:**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/AnyCommand',
					   '/AnyCommand2',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'https://discordapp.com/api/webhooks/603167259799846962/f9St4s4UJTzmtLKlOQ8pdxm6XVDDlEdslwcaLffUp0ObxmYS-N5PD3Z66WPgGfRHQQsa'},
					  {'/AnotherCommand2', 'https://discordapp.com/api/webhooks/603167259799846962/f9St4s4UJTzmtLKlOQ8pdxm6XVDDlEdslwcaLffUp0ObxmYS-N5PD3Z66WPgGfRHQQsa'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

