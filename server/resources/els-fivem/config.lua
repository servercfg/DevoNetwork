vcf_files = {
	"akut1.xml",
	"ambulance1.xml",
	"ambulance2.xml",
	"ambulance3.xml",
	"devo1.xml",
	"devo2.xml",
	"devo3.xml",
	"devo4.xml",
	"devo5.xml",
	"devo6.xml",
	"devo7.xml",
	"devo8.xml",
	"devo9.xml",
	"devo10.xml",
	"devo11.xml",
	"devo12.xml",
	"devo13.xml",
	"devo14.xml",
	"devo15.xml",
	"devo16.xml",
	"devo17.xml",
	"devo18.xml",
	"policeb1.xml",
	"policeb2.xml",
	"policeb3.xml",
	"emsmc.xml",
	"policeb1.xml",
	"policeb2.xml",
	"policeb3.xml",
	"firetruk.xml",
	"mercedesems1.xml",
	"paramedic.xml",
	"tems1.xml",
	"TESLAMBU.xml"
}

pattern_files = {
	"WIGWAG.xml",
	"WIGWAG3.xml",
	"FAST.xml",
	"COMPLEX.xml",
	"BACKFOURTH.xml",
	"BACKFOURTH2.xml",
	"T_ADVIS_RIGHT_LEFT.xml",
	"T_ADVIS_LEFT_RIGHT.xml",
	"T_ADVIS_BACKFOURTH.xml",
	"WIGWAG5.xml"
}

modelsWithTrafficAdvisor = {
	"akut1.xml",
	"ambulance1.xml",
	"ambulance2.xml",
	"ambulance3.xml",
	"devo1.xml",
	"devo2.xml",
	"devo3.xml",
	"devo4.xml",
	"devo5.xml",
	"devo6.xml",
	"devo7.xml",
	"devo8.xml",
	"devo9.xml",
	"devo10.xml",
	"devo11.xml",
	"devo12.xml",
	"devo13.xml",
	"devo14.xml",
	"devo15.xml",
	"devo16.xml",
	"devo17.xml",
	"devo18.xml",
	"policeb1.xml",
	"policeb2.xml",
	"policeb3.xml",
	"emsmc.xml",
	"firetruk.xml",
	"mercedesems1.xml",
	"paramedic.xml",
	"tems1.xml",
	"TESLAMBU.xml"
}

modelsWithFireSiren =
{
    "FIRETRUK",
}

modelsWithAmbWarnSiren =
{   
    "AMBULANCE",
    "FIRETRUK",
    "LGUARD",
}

stagethreewithsiren = false
playButtonPressSounds = true
vehicleStageThreeAdvisor = {
	"akut1.xml",
	"ambulance1.xml",
	"ambulance2.xml",
	"ambulance3.xml",
	"devo1.xml",
	"devo2.xml",
	"devo3.xml",
	"devo4.xml",
	"devo5.xml",
	"devo6.xml",
	"devo7.xml",
	"devo8.xml",
	"devo9.xml",
	"devo10.xml",
	"devo11.xml",
	"devo12.xml",
	"devo13.xml",
	"devo14.xml",
	"devo15.xml",
	"devo16.xml",
	"devo17.xml",
	"devo18.xml",
	"policeb1.xml",
	"policeb2.xml",
	"policeb3.xml",
	"emsmc.xml",
	"firetruk.xml",
	"mercedesems1.xml",
	"paramedic.xml",
	"tems1.xml",
	"TESLAMBU.xml"
}


vehicleSyncDistance = 150
envirementLightBrightness = 1.0

build = "master"

shared = {
	horn = 86,
}

keyboard = {
	modifyKey = 132,
	stageChange = 85,
	guiKey = 243,
	takedown = 245,
	siren = {
		tone_one = 157,
		tone_two = 158,
		tone_three = 160,
		dual_toggle = 164,
		dual_one = 165,
		dual_two = 159,
		dual_three = 161,
	},
	pattern = {
		primary = 246,
		secondary = 303,
		advisor = 182,
	},
}

controller = {
	modifyKey = 73,
	stageChange = 80,
	takedown = 74,
	siren = {
		tone_one = 173,
		tone_two = 85,
		tone_three = 172,
	},
}