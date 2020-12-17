local weatherType = "XMAS"

Citizen.CreateThread(function()
    while true 
    do        
    	SetWeatherTypePersist(weatherType)
    	SetWeatherTypeNowPersist(weatherType)
    	SetWeatherTypeNow(weatherType)
    	SetOverrideWeather(weatherType)
    	Citizen.Wait(0)
    end
end)