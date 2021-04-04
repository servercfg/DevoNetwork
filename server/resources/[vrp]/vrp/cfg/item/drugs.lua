local items = {}

local function play_drink(player)
	local seq = {
		{"mp_player_intdrink","intro_bottle",1},
		{"mp_player_intdrink","loop_bottle",1},
		{"mp_player_intdrink","outro_bottle",1}
	}

	vRPclient.playAnim(player,{true,seq,false})
end

local pills_choices = {}
pills_choices["> Indtag"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"pills",1) then
			vRPclient.varyHealth(player,{20})
			vRPclient.notify(player,{"~g~ Indtager piller"})
			play_drink(player)
			vRP.closeMenu(player)
		end
	end
end}

local function play_smoke(player)
	local seq2 = {
		{"mp_player_int_uppersmoke","mp_player_int_smoke_enter",1},
		{"mp_player_int_uppersmoke","mp_player_int_smoke",1},
		{"mp_player_int_uppersmoke","mp_player_int_smoke",1},
		{"mp_player_int_uppersmoke","mp_player_int_smoke_exit",1}
	}

	vRPclient.playAnim(player,{true,seq2,false})
end

local smoke_choices = {}
smoke_choices["> Ryg"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"joint",1) then
			vRP.varyHunger(user_id,(20))
			vRPclient.notify(player,{"~g~ Ryger joint"})
			vRPclient.playMovement(player,{"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false})
			vRPclient.playScreenEffect(player, {"DMT_flight", 60})

			play_smoke(player)
			vRP.closeMenu(player)
		end
	end
end}

local function play_smell(player)
	local seq3 = {
		{"mp_player_intdrink","intro_bottle",1},
		{"mp_player_intdrink","loop_bottle",1},
		{"mp_player_intdrink","outro_bottle",1}
	}

	vRPclient.playAnim(player,{true,seq3,false})
end

local smell_choices = {}
smell_choices["> Snif"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"kokain",1) then
			vRP.varyThirst(user_id,(20))
			vRPclient.notify(player,{"~g~ Snif kokain"})
			vRPclient.playMovement(player,{"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false})
			vRPclient.playScreenEffect(player, {"DMT_flight", 60})
			play_smell(player)
			vRP.closeMenu(player)
		end
	end
end}

local function play_lsd(player)
	local seq4 = {
		{"mp_player_intdrink","intro_bottle",1},
		{"mp_player_intdrink","loop_bottle",1},
		{"mp_player_intdrink","outro_bottle",1}
	}

	vRPclient.playAnim(player,{true,seq4,false})
end

local lsd_choices = {}
lsd_choices["> Tag"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"lsd",1) then
			vRP.varyThirst(user_id,(20))
			vRPclient.notify(player,{"~g~ Tag lsd"})
			vRPclient.playMovement(player,{"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false})
			vRPclient.playScreenEffect(player, {"DMT_flight", 120})
			play_lsd(player)
			vRP.closeMenu(player)
		end
	end
end}

local sblomst_choices = {}
sblomst_choices["> Spis"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"lsd",1) then
			vRP.varyThirst(user_id,(20))
			vRPclient.notify(player,{"~g~ Spiser blomster"})
			vRPclient.playMovement(player,{"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false})
			vRPclient.playScreenEffect(player, {"DMT_flight", 120})
			play_lsd(player)
			vRP.closeMenu(player)
		end
	end
end}

local kblomst_choices = {}
kblomst_choices["> Spis"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"kblomst",1) then
			vRP.varyThirst(user_id,(20))
			vRPclient.notify(player,{"~g~ Spiser Kogte blomster"})
			vRPclient.playMovement(player,{"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false})
			vRPclient.playScreenEffect(player, {"DMT_flight", 120})
			play_lsd(player)
			vRP.closeMenu(player)
		end
	end
end}

local ssblomst_choices = {}
ssblomst_choices["> Snif"] = {function(player,choice)
	local user_id = vRP.getUserId(player)
	if user_id ~= nil then
		if vRP.tryGetInventoryItem(user_id,"ssblomst",1) then
			vRP.varyThirst(user_id,(20))
			vRPclient.notify(player,{"~g~ Sniffer snittet blomster"})
			vRPclient.playMovement(player,{"MOVE_M@DRUNK@SLIGHTLYDRUNK",true,true,false,false})
			vRPclient.playScreenEffect(player, {"DMT_flight", 60})
			play_smell(player)
			vRP.closeMenu(player)
		end
	end
end}


items["pills"] = {"Smertestillende","En Smertestillende pille",function(args) return pills_choices end,0.1}
items["joint"] = {"Joint","En dejlig ryger",function(args) return smoke_choices end,0.10}
items["kokain"] = {"Kokain","Lidt kokain",function(args) return smell_choices end,0.01}
items["lsd"] = {"LSD","Lidt lsd",function(args) return lsd_choices end,0.01}

items["sblomst"] = {"Sjælden blomster","Ulovligt! Sjælden blomst godt fundet",function(args) return sblomst_choices end,0.01}
items["kblomst"] = {"Kogte blomster","Ulovligt! Kan sælges senere hen",function(args) return kblomst_choices end,0.01}
items["ssblomst"] = {"Snittet blomster","Ulovligt! Kan sælges senere hen",function(args) return ssblomst_choices end,0.01}


return items