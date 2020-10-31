function drawRct(x,y,width,height,r,g,b,a)
    DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        drawRct(0.0140, 0.968, 0.1430,0.031, 15, 15, 15,250)        
    end
end)

