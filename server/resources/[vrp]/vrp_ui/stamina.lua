function drawRct(x,y,width,height,r,g,b,a)
    DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)    
        local run = GetPlayerSprintTimeRemaining(PlayerId())
		drawRct(0.085, 0.984, 0.035, 0.011, 128, 128, 128, 255)
        drawRct(0.085, 0.984,run/287, 0.011, 135, 220, 220, 200)   
	end
end)