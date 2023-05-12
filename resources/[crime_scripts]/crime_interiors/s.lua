-- Pruszkowska
-- Wejscie
------Wejscie------
local marker=createMarker(1558.80, -1622.11, 13.54-0.9, "corona", 1.5, 90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Klatka schodowa\nWejście")
addEventHandler("onMarkerHit", marker, function(el,md)
	if getElementType(el) == "vehicle" then return end
	if getPedOccupiedVehicle(el) then return end
            fadeCamera ( el, false, 2.5, 0, 0, 0 )
            setTimer ( fadeCamera, 2500, 1, el, true, 2.5)
	setTimer ( function()
		setElementPosition(el,2414.86, -1630.05, 19644.08)
setElementDimension(el,0)
setElementInterior(el,1)
	end, 2500, 1 )
end) 

------Wyjscie------
local marker=createMarker(2416.76, -1627.96, 19644.07-0.9, "corona", 1.5, 150, 0, 0,1)
setElementData(marker,"mpod",true)
setElementInterior(marker,1)
setElementData(marker,"mtekst","Klatka schodowa\nWyjście")
addEventHandler("onMarkerHit", marker, function(el,md)
	if getElementType(el) == "vehicle" then return end
    if getPedOccupiedVehicle(el) then return end

            fadeCamera ( el, false, 2.5, 0, 0, 0 )
            setTimer ( fadeCamera, 2500, 1, el, true, 2.5)
	setTimer ( function()
 setElementPosition(el,1560.48, -1622.05, 13.54)
setElementDimension(el,0)
setElementInterior(el,0)
	end, 2500, 1 )
end)

-- Sklep z bronią białą
-- Wejscie
------Wejscie------
local blip = createBlip(1367.12, -1284.30, 13.55, 56)
local marker=createMarker(1367.80, -1279.86, 13.55-0.9, "corona", 1.5, 90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Sklep z bronią\nWejście")
addEventHandler("onMarkerHit", marker, function(el,md)
	if getElementType(el) == "vehicle" then return end
	if getPedOccupiedVehicle(el) then return end
            fadeCamera ( el, false, 2.5, 0, 0, 0 )
            setTimer ( fadeCamera, 2500, 1, el, true, 2.5)
	setTimer ( function()
		setElementPosition(el,286.91, -39.04, 1001.52)
setElementDimension(el,0)
setElementInterior(el,1)
	end, 2500, 1 )
end) 

------Wyjscie------
local marker=createMarker(285.42, -41.30, 1001.52-0.9, "corona", 1.5, 150, 0, 0,1)
setElementData(marker,"mpod",true)
setElementInterior(marker,1)
setElementData(marker,"mtekst","Sklep z bronią\nWyjście")
addEventHandler("onMarkerHit", marker, function(el,md)
	if getElementType(el) == "vehicle" then return end
    if getPedOccupiedVehicle(el) then return end

            fadeCamera ( el, false, 2.5, 0, 0, 0 )
            setTimer ( fadeCamera, 2500, 1, el, true, 2.5)
	setTimer ( function()
 setElementPosition(el,1365.32, -1279.79, 13.55)
setElementDimension(el,0)
setElementInterior(el,0)
	end, 2500, 1 )
end)