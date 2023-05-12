--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--


addEvent("engine", true)
addEventHandler("engine", getRootElement(),function()
    local veh = getPedOccupiedVehicle(source)
local recznySalon = getElementData(veh,"vehicle.selling")
			if recznySalon then 
            	triggerClientEvent(source, "addNoti", source, "Nie posiadasz kluczy do tego pojazdu!.", "error" ) return end
	local e = getVehicleEngineState(veh)
	if getElementData(veh,"vehicle:wlaczonelpg") == true and getElementData(veh,"vehicle:lpgfuel") < 1 then return end
	if getElementData(veh,"vehicle:wlaczonelpg") == false and getElementData(veh,"vehicle:fuel") < 1 then return end
if e == false then
	setVehicleEngineState(veh,true)
	triggerClientEvent(source, "addNoti", source, "Uruchamiasz silnik.", "info" )
else
	setVehicleEngineState(veh,false)
	triggerClientEvent(source, "addNoti", source, "Gasisz silnik.", "info" )
end
end)

addEvent("maska", true)
addEventHandler("maska", getRootElement(),function()
	local veh = getPedOccupiedVehicle(source)
	local recznySalon = getElementData(veh,"vehicle.selling")
	if recznySalon then triggerClientEvent(source, "addNoti", source, "Nie posiadasz kluczy do tego pojazdu!.", "error" ) return end
	local ratio = getVehicleDoorOpenRatio (veh,0)
	if ratio == 0 then 
		setVehicleDoorOpenRatio (veh,0, 1, 2500 )
		triggerClientEvent(source, "addNoti", source, "Otwierasz maskę.", "info" )
	else
		setVehicleDoorOpenRatio (veh,0, 0, 2500 )
		triggerClientEvent(source, "addNoti", source, "Zamykasz maskę.", "info" )
	end
end)

addEvent("typpaliwa", true)
addEventHandler("typpaliwa", getRootElement(),function()
	local veh = getPedOccupiedVehicle(source)
	local recznySalon = getElementData(veh,"vehicle.selling")
	if recznySalon then triggerClientEvent(source, "addNoti", source, "Nie posiadasz kluczy do tego pojazdu!.", "error" )  return end
	if getElementData(veh,"vehicle:lpg") == 1 then 
		local sx,sy,sz = getElementVelocity(veh)
		local km = math.ceil(((sx^2+sy^2+sz^2)^(0.5))*155)
	if km > 10 then triggerClientEvent(source, "addNoti", source, "Nie zrobisz tego przy takiej prędkości.", "error" ) return end
		if getElementData(veh,"vehicle:wlaczonelpg") == true then 
			local typpaliwa = getElementData(veh,"vehicle:typsilnika") or "Benzyna"
			setElementData(veh,"vehicle:wlaczonelpg",false)
			triggerClientEvent(source, "addNoti", source, "Przełączyłeś pojazd na "..typpaliwa..".", "info" )
		else
			setElementData(veh,"vehicle:wlaczonelpg",true)
			triggerClientEvent(source, "addNoti", source, "Przełączyłeś pojazd na LPG.", "info" )
		end
	end
end)

addEvent("naped", true)
addEventHandler("naped", getRootElement(),function()
	local veh = getPedOccupiedVehicle(source)
	local recznySalon = getElementData(veh,"vehicle.selling")
	if recznySalon then triggerClientEvent(source, "addNoti", source, "Nie posiadasz kluczy do tego pojazdu!.", "error" )  return end
	if getElementData(veh,"vehicle:naped") == 1 then 
		local sx,sy,sz = getElementVelocity(veh)
		local km = math.ceil(((sx^2+sy^2+sz^2)^(0.5))*155)
	if km > 10 then triggerClientEvent(source, "addNoti", source, "Nie zrobisz tego przy takiej prędkości.", "error" ) return end
		local hand = getVehicleHandling(veh)
		if hand["driveType"] == "fwd" then
			triggerClientEvent(source, "addNoti", source, "Przełączyłeś napęd na RWD.", "info" )
			setVehicleHandling(veh,"driveType","rwd")
		end 
		if hand["driveType"] == "rwd" then
			triggerClientEvent(source, "addNoti", source, "Przełączyłeś napęd na AWD", "info" )
			setVehicleHandling(veh,"driveType","awd")
		end 
		if hand["driveType"] == "awd" then
			triggerClientEvent(source, "addNoti", source, "Przełączyłeś napęd na FWD", "info" )
			setVehicleHandling(veh,"driveType","fwd")
		end 
	end
end)

addEvent("typzawieszenie", true)
addEventHandler("typzawieszenie", getRootElement(),function()
	local veh = getPedOccupiedVehicle(source)
	local recznySalon = getElementData(veh,"vehicle.selling")
	if recznySalon then triggerClientEvent(source, "addNoti", source, "Nie posiadasz kluczy do tego pojazdu!.", "error" )  return end
	if getElementData(veh,"vehicle:zawieszenie") == 1 then 
		local sx,sy,sz = getElementVelocity(veh)
		local km = math.ceil(((sx^2+sy^2+sz^2)^(0.5))*155)
		if km > 10 then triggerClientEvent(source, "addNoti", source, "Nie zrobisz tego przy takiej prędkości.", "error" ) return end
		local hand = getVehicleHandling(veh)
		local zawieszenie =  hand["suspensionForceLevel"]
		if tonumber(getElementData(veh,"vehicle:zawieszeniepoziom")) == -3 then
			setVehicleHandling(veh,"suspensionForceLevel",zawieszenie+1.6)
			setElementData(veh,"vehicle:zawieszeniepoziom",5)
		return end
		if tonumber(getElementData(veh,"vehicle:zawieszeniepoziom")) == -2 then
			setVehicleHandling(veh,"suspensionForceLevel",zawieszenie-0.2)
			setElementData(veh,"vehicle:zawieszeniepoziom",-3)
			return end
		if tonumber(getElementData(veh,"vehicle:zawieszeniepoziom")) == -1 then
			setVehicleHandling(veh,"suspensionForceLevel",zawieszenie-0.2)
			setElementData(veh,"vehicle:zawieszeniepoziom",-2)
			return end
		if tonumber(getElementData(veh,"vehicle:zawieszeniepoziom")) == 0 then
			setVehicleHandling(veh,"suspensionForceLevel",zawieszenie-0.2)
			setElementData(veh,"vehicle:zawieszeniepoziom",-1)
			return end
		if tonumber(getElementData(veh,"vehicle:zawieszeniepoziom")) == 1 then
			setVehicleHandling(veh,"suspensionForceLevel",zawieszenie-0.2)
			setElementData(veh,"vehicle:zawieszeniepoziom",0)
			return end
		if tonumber(getElementData(veh,"vehicle:zawieszeniepoziom")) == 2 then
			setVehicleHandling(veh,"suspensionForceLevel",zawieszenie-0.2)
			setElementData(veh,"vehicle:zawieszeniepoziom",1)
			return end
		if tonumber(getElementData(veh,"vehicle:zawieszeniepoziom")) == 3 then
			setVehicleHandling(veh,"suspensionForceLevel",zawieszenie-0.2)
			setElementData(veh,"vehicle:zawieszeniepoziom",2)
			return end
		if tonumber(getElementData(veh,"vehicle:zawieszeniepoziom")) == 4 then
			setVehicleHandling(veh,"suspensionForceLevel",zawieszenie-0.2)
			setElementData(veh,"vehicle:zawieszeniepoziom",3)
			return end
		if tonumber(getElementData(veh,"vehicle:zawieszeniepoziom")) == 5 then
			setVehicleHandling(veh,"suspensionForceLevel",zawieszenie-0.2)
			setElementData(veh,"vehicle:zawieszeniepoziom",4)
		end
	end
end)

addEvent("brake", true)
addEventHandler("brake", getRootElement(), function(sad)
    local veh = getPedOccupiedVehicle(source)
local recznySalon = getElementData(veh,"vehicle.selling")
if recznySalon then 
	triggerClientEvent(source, "addNoti", source, "Nie posiadasz kluczy do tego pojazdu.", "error" )
return end
local derby = getElementData(veh,"derby")
if derby then 
	triggerClientEvent(source, "addNoti", source, "Funkcja niedostępna na derbach.", "error" )
return end
if isElementFrozen(veh) == false then
    local sx,sy,sz = getElementVelocity(veh)
    local km = math.ceil(((sx^2+sy^2+sz^2)^(0.5))*155)
if km > 10 then triggerClientEvent(source, "addNoti", source, "Nie zrobisz tego przy takiej prędkości.", "error" ) return end
		setElementFrozen(veh, true)
		if sad == true then 
			triggerClientEvent(source, "addNoti", source, "Opuściłeś stopkę.", "info" )
		else
			triggerClientEvent(source, "addNoti", source, "Zaciągnąłeś ręczny.", "info" )
		end
else
        setElementFrozen(veh, false)
		if sad == true then 
			triggerClientEvent(source, "addNoti", source, "Podciągnąłeś stopkę.", "info" )
		else
			triggerClientEvent(source, "addNoti", source, "Spuściłeś ręczny.", "info" )
		end
end
end)

addEvent("lights",true)
addEventHandler("lights",getRootElement(),function()
    local veh = getPedOccupiedVehicle(source)
local recznySalon = getElementData(veh,"vehicle.selling")
			if recznySalon then 
                     triggerClientEvent(source, "addNoti", source, "Nie posiadasz kluczy do tego pojazdu!.", "error" )  return end
if getVehicleOverrideLights(veh) ~= 2 then
	setVehicleOverrideLights(veh,2)
	triggerClientEvent(source, "addNoti", source, "Zapalasz lampy.", "info" )
else
	setVehicleOverrideLights(veh,1)
	triggerClientEvent(source, "addNoti", source, "Gasisz lampy.", "info" )
end
end)

addEvent("exit",true)
addEventHandler("exit",getRootElement(),function()
	local veh = getPedOccupiedVehicle(source)

	
	for i=0,5 do
	setVehicleDoorOpenRatio ( veh, i, 0 - getVehicleDoorOpenRatio ( veh, i ), 2500 )
		local wysadzil = false
		for _, player in pairs(getVehicleOccupants(veh)) do
		if player ~= getVehicleController(veh) then
		if not getControlState (player, "enter_exit" ) then				
		setControlState(player,"enter_exit",true)
		setTimer(setControlState,200,1,player,"enter_exit",false)
		triggerClientEvent(source, "addNoti", source, "Wysadzasz pasażerów.", "info" )
		if not wysadzil then wysadzil = true end
end
end
end
end
end)

addEvent("doors",true)
addEventHandler("doors",root,function()
	local veh = getPedOccupiedVehicle(source)
local recznySalon = getElementData(veh,"vehicle.selling")
			if recznySalon then 
                     triggerClientEvent(source, "addNoti", source, "Nie posiadasz kluczy do tego pojazdu!.", "error" )  return end
if isVehicleLocked(veh) then
	 setVehicleLocked(veh,false)
	 triggerClientEvent(source, "addNoti", source, "Otwierasz pojazd.", "info" )
 else
	 setVehicleLocked(veh,true)
	 triggerClientEvent(source, "addNoti", source, "Zamykasz pojazd.", "info" )
end
end)

-- addEventHandler("onVehicleStartExit",root,function(player)
-- 	local veh = getPedOccupiedVehicle(player)
-- 	if veh then 
-- 		if isVehicleLocked(veh) then 
-- 			cancelEvent()
-- 			triggerClientEvent(player, "addNoti", player, "Najpierw otwórz zamek.", "error" )
-- 		end
-- 	end
-- end)