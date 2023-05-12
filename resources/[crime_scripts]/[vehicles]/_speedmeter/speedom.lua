--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1366/sx

local font1 = dxCreateFont("Digital.ttf", 58/zmienna)
local font2 = dxCreateFont("Digital.ttf", 15/zmienna)
local font3 = dxCreateFont("f.ttf", 15/zmienna)
local screenW, screenH = guiGetScreenSize()
licznikxdxd = false

function formatujnaprzecinki(amount) 
	local formatted = amount 
	while true do   
	  formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)",'%1,%2') 
	  if (k==0) then 
		break 
	  end 
	end 
	return formatted 
  end

  
  
function licznik()
		local veh=getPedOccupiedVehicle(localPlayer)
			if not veh then return end
			if getElementData(localPlayer,"mabw") == true then return end
			if getElementData(localPlayer,"hudoff") == true then return end
			

			if getElementData(veh,"vehicle:wlaczonelpg") == true then 
				paliwo = getElementData(veh,"vehicle:lpgfuel") or 0
			else 
				paliwo = getElementData(veh,"vehicle:fuel") or 0
			end
			local przebieg = getElementData(veh,"vehicle:mileage") or 0
			local salon = getElementData(veh, "silnik") or ""			
			silnikxd = salon

        local predkoscxd = getVehicleRPM(getPedOccupiedVehicle(localPlayer))
		local predkosc = getElementSpeed(getPedOccupiedVehicle(localPlayer),"km/h")
		local r,g,b = 200, 200, 200
		local pr,pg,pb = 200, 200, 200
		local liniakm = 108* ( predkoscxd / 11000 )
		if liniakm > 108 then
		liniakm = 108
		end
		

		
		if paliwo < 10 then 
			pr, pg, pb = 200,0,0
		end
        -- dxDrawImage(1074/zmienna, 736/zmienna, 108/zmienna, 27/zmienna, "linew.png", 0, 0, 0, tocolor(200, 200, 200, 155), false)
        -- dxDrawImage(1074/zmienna, 736/zmienna, liniakm/zmienna, 27/zmienna, "lineo.png", 0, 0, 0, tocolor(r, g, b, 255), false)
		-- dxDrawImage(0/zmienna,0/zmienna,1366/zmienna,768/zmienna, "speed.png", 0, 0, 0, tocolor(200, 200, 200, 255), false)
		
		if isElementFrozen(veh) == true then
			dxDrawImage(1325/zmienna, 731/zmienna, 36/zmienna, 37/zmienna, "brakeo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		else 
			dxDrawImage(1325/zmienna, 731/zmienna, 36/zmienna, 37/zmienna, "brakew.png", 0, 0, 0, tocolor(200, 200, 200, 255), false)
		end
		if getVehicleEngineState(veh) == true then
			dxDrawImage(1289/zmienna, 731/zmienna, 36/zmienna, 37/zmienna, "engineo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		else 
			dxDrawImage(1289/zmienna, 731/zmienna, 36/zmienna, 37/zmienna, "enginew.png", 0, 0, 0, tocolor(200, 200, 200, 255), false)
		end
		if getVehicleOverrideLights(veh) == 2 then	
			dxDrawImage(1253/zmienna, 731/zmienna, 36/zmienna, 37/zmienna, "lighto.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		else 
			dxDrawImage(1253/zmienna, 731/zmienna, 36/zmienna, 37/zmienna, "lightw.png", 0, 0, 0, tocolor(200, 200, 200, 255), false)
		end
		
		-- dxDrawText("000", (1181 + 1)/zmienna, (658 + 1)/zmienna, (1311 + 1)/zmienna, (732 + 1)/zmienna, tocolor(0, 0, 0, 155), 1.00, font1, "center", "center", false, false, false, false, false)
        -- dxDrawText("000", 1181/zmienna, 658/zmienna, 1311/zmienna, 732/zmienna, tocolor(55, 55, 55, 155), 1.00, font1, "center", "center", false, false, false, false, false)
		
		
		dxDrawText(formatujnaprzecinki(string.format("%03d", predkosc)), 1181/zmienna + 1, 658/zmienna + 1, 1311/zmienna + 1, 732/zmienna + 1, tocolor(0, 0, 0, 255), 1.00, font1, "center", "center", false, false, false, false, false)
        dxDrawText(formatujnaprzecinki(string.format("%03d", predkosc)), 1181/zmienna, 658/zmienna, 1311/zmienna, 732/zmienna, tocolor(r, g, b, 255), 1.00, font1, "center", "center", false, false, false, false, false)
		
		
        dxDrawText("km/h", 1307/zmienna + 1, 702/zmienna + 1, 1352/zmienna + 1, 736/zmienna + 1, tocolor(0, 0, 0, 255), 1.00, font2, "left", "center", false, false, false, false, false)
        dxDrawText("km/h", 1307/zmienna, 702/zmienna, 1352/zmienna, 736/zmienna, tocolor(r, g, b, 255), 1.00, font2, "left", "center", false, false, false, false, false)
		
        dxDrawText(silnikxd, 1136/zmienna + 1, 684/zmienna + 1, 1181/zmienna + 1, 718/zmienna + 1, tocolor(0, 0, 0, 255), 1.00, font2, "right", "center", false, false, false, false, false)
        dxDrawText(silnikxd, 1136/zmienna, 684/zmienna, 1181/zmienna, 718/zmienna, tocolor(200, 200, 200, 255), 1.00, font2, "right", "center", false, false, false, false, false)
		if getElementData(getPedOccupiedVehicle(localPlayer),"vehicle:id") then 
			local silnik = getElementData(getPedOccupiedVehicle(localPlayer),"vehicle:silnik")
			local silnik = string.format("%.1f", silnik)
			local cylindry = getElementData(getPedOccupiedVehicle(localPlayer),"vehicle:cylindry")
			dxDrawText(silnik.." V"..cylindry, 1307/zmienna + 1, 663/zmienna + 1, 1352/zmienna + 1, 678/zmienna + 1, tocolor(0, 0, 0, 255), 1.00, font2, "left", "center", false, false, false, false, false)
        	dxDrawText(silnik.." V"..cylindry, 1307/zmienna, 663/zmienna, 1352/zmienna, 678/zmienna, tocolor(200, 200, 200, 255), 1.00, font2, "left", "center", false, false, false, false, false)
		end
        dxDrawText(formatujnaprzecinki(string.format("%03d", paliwo)).." L", 1307/zmienna + 1, 678/zmienna + 1, 1352/zmienna + 1, 712/zmienna + 1, tocolor(0, 0, 0, 255), 1.00, font2, "left", "center", false, false, false, false, false)
        dxDrawText(formatujnaprzecinki(string.format("%03d", paliwo)).." L", 1307/zmienna, 678/zmienna, 1352/zmienna, 712/zmienna, tocolor(pr, pg, pb, 255), 1.00, font2, "left", "center", false, false, false, false, false)
		
        dxDrawText(formatujnaprzecinki(string.format("%06d", przebieg)).." km", 1094/zmienna + 1, 758/zmienna + 1, 1241/zmienna + 1, 736/zmienna + 1, tocolor(0, 0, 0, 255), 1.00, font2, "right", "center", false, false, false, false, false)
        dxDrawText(formatujnaprzecinki(string.format("%06d", przebieg)).." km", 1094/zmienna, 758/zmienna, 1241/zmienna, 736/zmienna, tocolor(200, 200, 200, 255), 1.00, font2, "right", "center", false, false, false, false, false)
end




addEventHandler("onClientVehicleEnter", root,
	function(thePlayer)
		if thePlayer == localPlayer then
			if licznikxdxd == true then return end
			addEventHandler("onClientRender", root, licznik)
			licznikxdxd = true
		end
	end
)

addEventHandler("onClientVehicleStartExit", root,
	function(thePlayer)
		if thePlayer == localPlayer then
			removeEventHandler("onClientRender", root, licznik)
			licznikxdxd = false
		end
	end
)

addEventHandler("onClientResourceStart", getResourceRootElement( getThisResource() ),
	function ()
		local veh=getPedOccupiedVehicle(localPlayer)
		if veh then
		if licznikxdxd == true then return end
        addEventHandler("onClientRender", root, licznik)
		end
	end
)

addEventHandler("onClientResourceStop", getResourceRootElement( getThisResource() ),
	function ()
		local veh=getPedOccupiedVehicle(localPlayer)
		if veh then
		if licznikxdxd == true then return end
        removeEventHandler("onClientRender", root, licznik)
		licznikxdxd = false
		end
	end
)




function getVehicleRPM(vehicle)
local vehicleRPM = 0
    if (vehicle) then  
        if (getVehicleEngineState(vehicle) == true) then
            if getVehicleCurrentGear(vehicle) > 0 then             
                vehicleRPM = math.floor(((getElementSpeed(vehicle, "km/h") / getVehicleCurrentGear(vehicle)) * 160) + 0.5) 
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9000) then
                    vehicleRPM = math.random(9000, 9900)
                end
            else
                vehicleRPM = math.floor((getElementSpeed(vehicle, "km/h") * 160) + 0.5)
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9000) then
                    vehicleRPM = math.random(9000, 9900)
                end
            end
        else
            vehicleRPM = 0
        end

        return tonumber(vehicleRPM)
    else
        return 0
    end
end

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