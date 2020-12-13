Citizen.CreateThread(function()
	while true do
	    localcalc()
		monthcalc()
		hourcalc()
		minutecalc()
		Wait(1)
		SetTextFont(0)
		SetTextProportional(1)
		SetTextScale(0.23, 0.23)
		SetTextColour(255, 255, 255, 255)
		SetTextRightJustify(true)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(day .. ". " .. month .. " | " .. hour .. ":" .. minute)
		DrawText(0.5, 0.05)
	end
end)

function localcalc()
    year, month, day, hour, minute, second = GetLocalTime()
end

function monthcalc()
    if month == 1 then
	    month = "Januar"
    elseif month == 2 then
	    month = "Februar"
    elseif month == 3 then
	    month = "Marts"
    elseif month == 4 then
	    month = "April"
    elseif month == 5 then
	    month = "Maj"
    elseif month == 6 then
	    month = "Juni"
    elseif month == 7 then
	    month = "Juli"
    elseif month == 8 then
	    month = "August"
    elseif month == 9 then
	    month = "September"
    elseif month == 10 then
	    month = "Oktober"
    elseif month == 11 then
        month = "November"
    elseif month == 12 then
	    month = "December"
	end
end

function hourcalc()
    if hour == 0 then
	    hour = "00"
    end
	if hour == 1 then
	    hour = "01"
    end
	if hour == 2 then
	    hour = "02"
    end
	if hour == 3 then
	    hour = "03"
    end
	if hour == 4 then
	    hour = "04"
    end
	if hour == 5 then
	    hour = "05"
    end
	if hour == 6 then
	    hour = "06"
    end
	if hour == 7 then
	    hour = "07"
    end
	if hour == 8 then
	    hour = "08"
    end
	if hour == 9 then
	    hour = "09"
    end
end

function minutecalc()
    if minute == 0 then
	    minute = "00"
    end
	if minute == 1 then
	    minute = "01"
    end
	if minute == 2 then
	    minute = "02"
    end
	if minute == 3 then
	    minute = "03"
    end
	if minute == 4 then
	    minute = "04"
    end
	if minute == 5 then
	    minute = "05"
    end
	if minute == 6 then
	    minute = "06"
    end
	if minute == 7 then
	    minute = "07"
    end
	if minute == 8 then
	    minute = "08"
    end
	if minute == 9 then
	    minute = "09"
    end
end
