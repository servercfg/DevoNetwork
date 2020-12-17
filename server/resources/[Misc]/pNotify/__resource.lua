resource_manifest '44febabe-d386-4d18-afbe-5e627f4af937'

description "Simple Notification Script using https://notifyjs.com/"

ui_page "html/index.html"

client_script "cl_notify.lua"

export "SetQueueMax"
export "SendNotification"

files {
    "html/index.html",
    "html/pNotify.js",
    "html/noty.js",
    "html/noty.css",
    "html/themes.css",
    "html/phone.ogg",
    "html/handjern.ogg",
    "html/Sikkerhedssele_on.mp3",
    "html/Sikkerhedssele_off.mp3",
    "html/panikknap.ogg",
    "html/carsound.mp3",
	"html/cash.ogg",
	"html/twitternotfiy.ogg",
	"html/mobilepay.ogg"
}

