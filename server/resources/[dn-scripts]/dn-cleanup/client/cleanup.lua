--------------------------------
-- CleanUp --
--------------------------------

--GetClosestObjectOfType(x, y, z, radius, modelHash, false, p6, p7)
local objectslist = {
	307771752,
	-1184516519,
	1230099731,
	406416082,
	242636620,
	627816582,
	-136782495,
	304890764,
	-- ROCKERBORG
	-1340926540,
	-2021659595,
	232216084,
	1452552716,
	322493792,
	-46303329,
	-1738103333,
	1120812170,
	-1919073083,
	-2073573168,
	757019157,
	438342263,
	1096997751,
	-861197080,
	-1829764702,
	897494494,
	-940719073
}

Citizen.CreateThread(function()
	while true do
		local player = GetPlayerPed(-1)
		local pos = GetEntityCoords(player)
		
		local handle, object = FindFirstObject()
		local success
		
		
		if has_value(objectslist, GetEntityModel(object)) then
			RemoveObject(object)
		end
		repeat 
			success, object = FindNextObject(handle)
			
			if has_value(objectslist, GetEntityModel(object)) then
				RemoveObject(object)
			end
		until not success
		
		EndFindObject(handle)
		
		Citizen.Wait(500)
	end
end)

function RemoveObject(object)
	SetEntityAsMissionEntity(object,  false,  true)
	DeleteObject(object)
end

function has_value (tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	
	return false
end