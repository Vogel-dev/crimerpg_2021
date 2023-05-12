--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local x,y,z = 1071.73, -1312.93, 13.55
local blip = createBlip(x, y, 20, 61, 0, 0, 0, 0, 0, 0, 200)

------Wejscie------
local marker=createMarker(1071.73, -1312.93, 13.55-0.9, "corona", 1.5, 90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Sklep wielobranżowy\nWejście")
addEventHandler("onMarkerHit", marker, function(el,md)
	if getElementType(el) == "vehicle" then return end
	if getPedOccupiedVehicle(el) then return end
            fadeCamera ( el, false, 2.5, 0, 0, 0 )
            setTimer ( fadeCamera, 2500, 1, el, true, 2.5)
	setTimer ( function()
		setElementPosition(el,2290.89, -1718.46, 12.90)
setElementDimension(el,0)
setElementInterior(el,0)
	end, 2500, 1 )
end) 

------Wyjscie------
local marker=createMarker(2291.12, -1720.52, 12.90-0.9, "corona", 1.5, 200, 0, 0,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Sklep wielobranżowy\nWyjście")
addEventHandler("onMarkerHit", marker, function(el,md)
	if getElementType(el) == "vehicle" then return end
    if getPedOccupiedVehicle(el) then return end

            fadeCamera ( el, false, 2.5, 0, 0, 0 )
            setTimer ( fadeCamera, 2500, 1, el, true, 2.5)
	setTimer ( function()
 setElementPosition(el,1068.69, -1313.10, 13.55)
setElementDimension(el,0)
setElementInterior(el,0)
	end, 2500, 1 )
end)