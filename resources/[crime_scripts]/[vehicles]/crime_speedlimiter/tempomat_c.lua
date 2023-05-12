--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function ogranicznik()
	if isCursorShowing() or isPedDoingGangDriveby(localPlayer) then return end
	local v=getPedOccupiedVehicle(localPlayer)
	if not v then return end
	if getVehicleEngineState(v) == false then return end
	if getVehicleController(v)~=localPlayer then return end
	
	if getElementData(v,"ogranicznik") then 
		if getElementData(v,"publiczny") == true then return end 
		setElementData(v,"ogranicznik",false)
		exports.crime_gui:addNoti("Wyłączyłeś ogranicznik.", "info")
	else
		local predkosc = getElementSpeed(v, "km/h")
		setElementData(v,"ogranicznik",predkosc)
		exports.crime_gui:addNoti("Ustawiłeś ogranicznik na "..math.floor(predkosc).."km/h.", "info")
	end
end
bindKey("mouse1","down", ogranicznik)

-- function asystent()
-- 	if isCursorShowing() or isPedDoingGangDriveby(localPlayer) then return end
-- 	local v=getPedOccupiedVehicle(localPlayer)
-- 	if not v then return end
-- 	if getVehicleEngineState(v) == false then return end
-- 	if getVehicleController(v)~=localPlayer then return end
	
-- 	if getElementData(localPlayer,"naprzod") == true then
-- 		setPedControlState (localPlayer, "accelerate", false )
-- 		setElementData(localPlayer,"naprzod",false)
-- 		exports.crime_gui:addNoti("Wyłączyłeś asystenta jazdy.", "info")
-- 		timers = getTimers ( 500.5 )
-- 		for timerKey, timerValue in ipairs(timers) do
-- 			killTimer ( timerValue )
-- 		end
-- 	else
-- 		setPedControlState (localPlayer, "accelerate", true )
-- 		setElementData(localPlayer,"naprzod",true)
-- 		exports.crime_gui:addNoti("Włączyłeś asystenta jazdy, możesz puścić przycisk 'W'.", "info")
-- 		local  tajmereks = setTimer(function()
-- 			if getVehicleEngineState(v) == true then
-- 				setPedControlState (localPlayer, "accelerate", true )
-- 			else
-- 				setPedControlState (localPlayer, "accelerate", false )
-- 			end
-- 		end, 500.2, 0)
-- 	end
-- end

-- bindKey("mouse2","down", asystent)

function tempomat()
	local v=getPedOccupiedVehicle(localPlayer)
	if not v then return end
	if not getElementData(v,"ogranicznik") then return end
	local ograniczenie=getElementData(v,"ogranicznik")
	local vm=getElementModel(v)
	if getVehicleController(v)~=localPlayer then return end
	if not isVehicleOnGround(v) then return end
	local vx,vy,vz=getElementVelocity(v)
	if not getVehicleEngineState(v) then
		if getDistanceBetweenPoints2D(0,0,vx,vy)<0.1 then
			vx,vy=0,0
			setElementVelocity(v,vx,vy,vz)
			return
		end
	end
	if getElementModel(v) == 462 then ograniczenie = 80 end
	if not ograniczenie then return end
	local actualspeed = getElementSpeed(v, "km/h")
	if actualspeed>ograniczenie then
		setElementVelocity(v,vx*0.95,vy*0.95,vz*0.95)
	end
end
addEventHandler("onClientRender",root,tempomat)


function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end