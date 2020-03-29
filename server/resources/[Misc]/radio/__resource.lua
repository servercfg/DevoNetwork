resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_02_POP" { url = "https://live-bauerdk.sharp-stream.com/thevoice_dk_mp3?direct=true&listenerid=undefined&amsparams=playerid:SBS_RP_WEB;skey:1556369463;&awparams=loggedin:false;&aw_0_req.gdpr=true", volume = 0.2, name = "The Voice" }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "https://live-bauerdk.sharp-stream.com/nova_dk_mp3?direct=true&listenerid=undefined&amsparams=playerid:SBS_RP_WEB;skey:1556369827;&awparams=loggedin:false;&aw_0_req.gdpr=true", volume = 0.2, name = "NOVA" }
supersede_radio "RADIO_04_PUNK" { url = "https://live-bauerdk.sharp-stream.com/radio100_dk_mp3?direct=true&listenerid=undefined&amsparams=playerid:SBS_RP_WEB;skey:1556369964;&awparams=loggedin:false;&aw_0_req.gdpr=true", volume = 0.2, name = "Radio 100" }
supersede_radio "RADIO_05_TALK_01" { url = "https://live-bauerdk.sharp-stream.com/popfm_dk_mp3?direct=true&listenerid=undefined&amsparams=playerid:SBS_RP_WEB;skey:1556369964;&awparams=loggedin:false;&aw_0_req.gdpr=true", volume = 0.2, name = "Pop FM" }
supersede_radio "RADIO_01_CLASS_ROCK" { url = "https://live-bauerdk.sharp-stream.com/myrock_dk_mp3?direct=true&listenerid=undefined&amsparams=playerid:SBS_RP_WEB;skey:1556369966;&awparams=loggedin:false;&aw_0_req.gdpr=true", volume = 0.2, name = "myROCK" }
supersede_radio "RADIO_06_COUNTRY" { url = "https://live-bauerdk.sharp-stream.com/radiosoft_dk_mp3?direct=true&listenerid=undefined&amsparams=playerid:SBS_RP_WEB;skey:1556369963;&awparams=loggedin:false;&aw_0_req.gdpr=true", volume = 0.2, name = "Radio Soft" }
supersede_radio "RADIO_07_DANCE_01" { url = "http://89.249.7.68/abc", volume = 0.2, name = "Radio ABC" }

files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
