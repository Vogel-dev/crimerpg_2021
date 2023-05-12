--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

--local x,y,z = 1822.87, -1402.43, 13.43
--local blip = createBlip(x, y, 20, 19, 0, 0, 0, 0, 0, 0, 200)


addEvent("wyszukajpojazdy", true)
addEventHandler("wyszukajpojazdy", root, function()
    local uid=getElementData(source,"player:uid")
    local org=getElementData(source,"player:organization") or ""
    if not uid then return end
    if org ~= "" then 
        resultddaa = exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE parking=1 AND (ownedPlayer=? OR ownedGroup=?);", uid, org)
    else 
        resultddaa = exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=? AND parking=1", uid)
    end
    if #resultddaa > 0 then
        triggerClientEvent(source, "przecho:dotabeli", source, resultddaa)
    end
end)


addEvent("wyszukajinfo", true)
addEventHandler("wyszukajinfo", root, function(dokladniej)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? AND parking=1", dokladniej)
    if #result > 0 then
        triggerClientEvent(source, "pokazto", source, result)
    end
end)


addEvent("oddajcar", true)
addEventHandler("oddajcar", root, function(el,md)
    if getElementType(el) == "player" then
        local veh=getPedOccupiedVehicle(el)
        local vehasddsad=getPedOccupiedVehicle(el)
        if not veh then return end
        if getVehicleController(veh) ~= el then return end
        local id=getElementData(veh,"vehicle:id")
        if not id then return end
        if isTimer(timeroddania) then return end
        setElementFrozen(veh,true)
		local skingracza = getElementData(el,"skinxd")
		if skingracza then
		setElementModel(el, skingracza)
        end
        triggerClientEvent(el, "addNoti", el, "Pojazd został zaparkowany na parkingu.", "info" )
        toggleControl(el,"enter_exit",false)
			setElementFrozen(veh,false)
			local id=getElementData(veh,"vehicle:id")
			if not id then return end
            local test = exports["crime_vehicles"]:onSaveVehicle(vehasddsad)
            destroyElement(veh)
            exports["crime_database"]:dbSet("UPDATE crime_vehicles SET parking=1 WHERE id=?", id)
            toggleControl(el,"enter_exit",true)
	elseif getElementType(el) == "vehicle" then
		local peds= getVehicleOccupants(el)
		if #peds > 0 then return end
		local id=getElementData(el,"vehicle:id")
        if not id then return end
        if isTimer(timeroddania) then return end
        timeroddania=setTimer(function()
			setElementFrozen(el,false)
			local id=getElementData(el,"vehicle:id")
			if not id then return end
            local costam = exports["crime_vehicles"]:onSaveVehicle(el)
            destroyElement(el)
            exports["crime_database"]:dbSet("UPDATE crime_vehicles SET parking=1 WHERE id=?", id)
        end, 3000, 1)
		setElementFrozen(el,true)
		setVehicleLocked(el,true)
    end
end)

addEvent("onParkingVehicleSpawn", true)
addEventHandler("onParkingVehicleSpawn", root, function(id, nick,x,y,z,rx,ry,rz)
    if not id then return end
    

    
	result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE parking=1 and not(police=1) AND id=?", id)

	for ile,vehicle in pairs(result) do
	vehicles=ile

    local spawn=exports["crime_vehicles"]:onRespawnVehicles(_,id,{x,y,z,rx,ry,rz},nick)
    if spawn then
	end
	end
end)