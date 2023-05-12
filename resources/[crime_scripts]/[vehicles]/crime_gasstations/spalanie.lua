--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local time=getTickCount()
local isBike={[509]=true,[481]=true,[510]=true}

elektrytki = {
}
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
 
	return false
end
local function naliczaj(veh)
	if getTickCount()-time>5000 then
		time = getTickCount()
		if getElementData(veh,"vehicle:wlaczonelpg") == true then 
			fuel = getElementData(veh, "vehicle:lpgfuel") or 0
		else 
			fuel = getElementData(veh, "vehicle:fuel") or 0
		end
		local mileage = getElementData(veh,"vehicle:mileage") or 0
		local vx,vy,vz = getElementVelocity(veh)
		local spd=((vx^2 + vy^2 + vz^2)^(0.5)/2)
		if spd>0 then
			if getElementData(veh,"vehicle:wlaczonelpg") == true then 
				fuel = fuel-((spd*3)/3)
				setElementData(veh, "vehicle:lpgfuel", fuel)
			else 
				fuel = fuel-((spd*1.75)/3)
				setElementData(veh, "vehicle:fuel", fuel)
			end
			mileage = mileage+(spd * 1.25)
			setElementData(veh, "vehicle:mileage", mileage)
		end
	end
end

function rendering()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if not vehicle then return end
	if not getVehicleEngineState(vehicle) then return end
	if getElementData(vehicle,"vehicle:fuel") and getElementData(vehicle,"vehicle:fuel") or getElementData(vehicle,"vehicle:mileage") and getElementData(vehicle,"vehicle:mileage") then
		naliczaj(vehicle)
	end
end



addEventHandler("onClientVehicleEnter",root,function(p)
if p ~= localPlayer then return end
if isTimer(timer) then killTimer(timer) end
time=getTickCount()
timer = setTimer(rendering,5000,0)
end)
addEventHandler("onClientVehicleExit",root,function(p)
if p ~= localPlayer then return end
if isTimer(timer) then killTimer(timer) end
end)