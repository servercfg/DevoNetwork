--==--==--==--
-- Broken Veh Script by Pegi16/Antwanr942!
-- This script may **NOT** be re-released without permission from myself.
-- However feel free to edit it and use it as you wish.
-- Enjoy :)
--==--==--==--

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(10) -- [[Usually 1 however the difference between the two is un-noticable.]]
        for theveh in EnumerateVehicles() do -- [[Gets every single vehicle that exists... I think.]]
            if GetEntityHealth(theveh) == 0 then -- [[If the vehicle is destroyed continue.]]
                SetEntityAsMissionEntity(theveh, false, false) -- [[Sets the entity as mission entity for further use.]]
                DeleteEntity(theveh) -- [[Once set as mission entity it will be deleted.]]
            end
		end
    end
end)

--==--==--==--
-- Entity Enumerator by IllidanS4 [https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2]
--==--==--==--

local entityEnumerator = {
	__gc = function(enum)
	    if enum.destructor and enum.handle then
		    enum.destructor(enum.handle)
	    end
	    enum.destructor = nil
	    enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
	    local iter, id = initFunc()
	    if not id or id == 0 then
	        disposeFunc(iter)
		    return
	    end
	  
	    local enum = {handle = iter, destructor = disposeFunc}
	    setmetatable(enum, entityEnumerator)
	  
	    local next = true
	    repeat
		    coroutine.yield(id)
		    next, id = moveFunc(iter)
	    until not next
	  
	    enum.destructor, enum.handle = nil, nil
	    disposeFunc(iter)
	end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

--==--==--==--
-- End :(
--==--==--==--
