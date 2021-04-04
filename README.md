## DevoNetwork
Her findes filerne fra DevoNetwork, som er blevet udgivet. Jeg har valgt at skrive herunder, hvor man kan ændre navne, billeder og lign. for at "personliggøre" sin server.

## Credit
CREDIT FOR SERVEREN, GÅR TIL **OLSEN1157**

## Vigtigt
- Jeg anbefalder at få købt et *FiveM Element Club LicenseKey*, ellers vil visse funktioner ikke virke.<br>
- FIL FORMAT OG STØRRELSEN PÅ BILLEDERNE, MÅ IKKE BLIVE ÆNDRET!!!<br>
- Jeg kan ikke garantere alle steder hvor der står *DevoNetwork* er herunder. Resten må i selv finde, hvis der er mere. Skulle i finde mere, må i gerne kontakte mig.
- Et par resources er blevet fjernet, grundet ophavsret. I må leve uden :)

## Husk
- Mappen *SERVER* indeholder alle serverfilerne. Den indeholder også filen *RunServer1* som starter serveren.
- Filen SQL skal ligges ind på databasen. Søg på Youtube hvis du ikke ved hvordan. Husk at ændre database konfigurationerne inde på *server/server.cfg* og *server/resources/[vrp]/vrp/cfg/base.lua*. Whitelist kan også slåes fra inde på base.lua ved at skrive *false* ved `linje 12`
- Husk at download artifacts fra https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/ og smid dem ind i mappen *server*
- Husk at skift STEAM WEBAPI KEY for, at steam virker. Kan ændres inde på *server/server.cfg*. Lav et API key her: https://steamcommunity.com/dev/apikey
- Porten på serveren er som standard *:30001*

## Ændres

**LOGO ÆNDRES:**<br>
server/logo.png

**LICENSEKEY(Husk FiveM Element Club):**<br>
server/server.cfg

**ÆNDRE NAVN, BANNER OG TAGS, DISCORD:**<br>
server/server.cfg<br>
server/server_global_settings.cfg

**GCPHONE:**<br>
server/resources/[dn-scripts]/gcphone/html/static/config/config.json<br>
server/resources/[dn-scripts]/gcphone/html/static/img/background

**DISCLAIMER:**<br>
server/resources/[dn-scripts]/dn-disclaimer/ui/img/bg-img.png

**DISCORD:**<br>
*Under navnet på folk som er inde på serveren på discord
vil der stå DevoNetwork andet end du deaktivere denne resource
eller ændre botten.*<br>
server/resources/[dn-scripts]/dn-discord

**INFO:**<br>
server/resources/[dn-scripts]/dn-info/img/header.png

**LOADINGSCREEN:**<br>
server/resources/[dn-scripts]/dn-loadingscreen/Loading.mp3<br>
server/resources/[dn-scripts]/dn-loadingscreen/Loading.ogg<br>
server/resources/[dn-scripts]/dn-loadingscreen/loading.png

**KOMMANDOEN /discord:**<br>
server/resources/[Misc]/discord

**F9 Menu navn:**<br>
*På `linje 151` findes `menudata.name = "DevoNetwork"`.
Der er der mulighed for at ændre navnet*<br>
server/resources/[vrp]/vrp/modules/gui.lua

**LOGO I WPROMPT**<br>
*Når den sorte boks popper op du kan skrive i, er der et lille
logo. Det kan ændres ved at skifte linket på `linje 173`. Husk det
skal være samme størrelse som det der er allerede.*<br>
server/resources/[vrp]/vrp/gui/design.css

**LOGO I TOPPEN AF SKÆRMEN INGAME:**<br>
server/resources/[Misc]/logo/ui/img/logo.png

**BESKED NÅR MAN JOINER:**<br>
*Server navnet ændres på `linje 6`.*<br>
server/resources/[vrp]/vrp/cfg/lang/da.lua

**SERVERNAVN OVER MAPPET INDE PÅ ESC:**<br>
*Server navnet ændres på `linje 6`.*<br>
server/resources/[dn-scripts]/dn-ui/bare.lua
