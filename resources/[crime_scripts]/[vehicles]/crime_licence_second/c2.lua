--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local licenseBlip
local licenseTarget
local licenseMarker
local licenseVehicle
local licenseCategory

local categoryPositions={
	["A"]={
		-- {1777.02, -1900.32, 13.16, 359.4, 0.0, 178.7, "Podejdź przodem a następnie wycofaj."},
		{1650.89, -1526.95, 13.35},
		{1655.83, -1544.43, 13.19},
		{1680.79, -1550.17, 13.19},
		{1704.85, -1531.44, 13.19},
		{1705.12, -1489.29, 13.19},
		{1679.21, -1477.43, 13.19},
		{1664.10, -1477.37, 13.19},
		{1659.71, -1454.19, 13.19},
		{1638.29, -1438.19, 13.19},
		{1607.75, -1424.05, 13.29},
		{1609.50, -1357.15, 15.64},
		{1610.65, -1310.70, 17.09},
		{1577.56, -1297.92, 17.08},
		{1467.23, -1297.01, 13.22},
		{1452.25, -1343.61, 13.19},
		{1452.39, -1426.81, 13.19},
		{1442.12, -1505.48, 13.19},
		{1427.21, -1580.64, 13.17},
		{1481.43, -1594.73, 13.19},
		{1603.70, -1594.67, 13.31},
		{1652.39, -1594.77, 13.20},
		{1660.66, -1571.03, 13.20},
		{1660.62, -1531.22, 13.19},
		{1643.24, -1522.74, 13.37},
	},
	["C"]={
		{1650.62, -1526.63, 13.35},
		{1660.05, -1499.04, 13.19},
		{1672.02, -1482.05, 13.19},
		{1696.56, -1485.50, 13.19},
		{1698.23, -1531.86, 13.19},
		{1667.81, -1544.96, 13.19},
		{1655.90, -1579.14, 13.19},
		{1676.02, -1594.16, 13.19},
		{1687.58, -1646.34, 13.19},
		{1686.79, -1720.51, 13.19},
		{1713.78, -1734.32, 13.19},
		{1751.75, -1711.41, 13.19},
		{1751.67, -1674.39, 13.19},
		{1751.86, -1613.43, 13.19},
		{1775.90, -1610.57, 13.17},
		{1813.07, -1614.50, 13.18},
		{1825.03, -1582.09, 13.16},
		{1838.56, -1535.66, 13.19},
		{1853.10, -1479.91, 13.19},
		{1830.19, -1458.88, 13.18},
		{1772.37, -1445.53, 13.18},
		{1723.44, -1438.41, 13.19},
		{1670.12, -1438.68, 13.19},
		{1617.01, -1438.60, 13.19},
		{1544.97, -1438.50, 13.19},
		{1465.20, -1438.51, 13.19},
		{1451.57, -1456.73, 13.17},
		{1442.18, -1505.97, 13.19},
		{1431.81, -1545.23, 13.18},
		{1426.47, -1610.20, 13.19},
		{1426.87, -1669.41, 13.19},
		{1427.02, -1723.95, 13.19},
		{1463.40, -1734.63, 13.19},
		{1503.55, -1734.89, 13.19},
		{1529.50, -1735.00, 13.19},
		{1531.72, -1699.27, 13.19},
		{1532.03, -1658.52, 13.19},
		{1532.33, -1601.67, 13.19},
		{1587.15, -1595.48, 13.19},
		{1627.37, -1595.11, 13.35},
		{1656.28, -1595.00, 13.20},
		{1660.40, -1571.18, 13.20},
		{1660.20, -1536.38, 13.19},
		{1636.97, -1522.61, 13.40},
	},
	["B"]={
		{1650.62, -1526.63, 13.35},
		{1660.05, -1499.04, 13.19},
		{1672.02, -1482.05, 13.19},
		{1696.56, -1485.50, 13.19},
		{1698.23, -1531.86, 13.19},
		{1667.81, -1544.96, 13.19},
		{1655.90, -1579.14, 13.19},
		{1676.02, -1594.16, 13.19},
		{1687.58, -1646.34, 13.19},
		{1686.79, -1720.51, 13.19},
		{1713.78, -1734.32, 13.19},
		{1751.75, -1711.41, 13.19},
		{1751.67, -1674.39, 13.19},
		{1751.86, -1613.43, 13.19},
		{1775.90, -1610.57, 13.17},
		{1813.07, -1614.50, 13.18},
		{1825.03, -1582.09, 13.16},
		{1838.56, -1535.66, 13.19},
		{1853.10, -1479.91, 13.19},
		{1830.19, -1458.88, 13.18},
		{1772.37, -1445.53, 13.18},
		{1723.44, -1438.41, 13.19},
		{1670.12, -1438.68, 13.19},
		{1617.01, -1438.60, 13.19},
		{1544.97, -1438.50, 13.19},
		{1465.20, -1438.51, 13.19},
		{1451.57, -1456.73, 13.17},
		{1442.18, -1505.97, 13.19},
		{1431.81, -1545.23, 13.18},
		{1426.47, -1610.20, 13.19},
		{1426.87, -1669.41, 13.19},
		{1427.02, -1723.95, 13.19},
		{1463.40, -1734.63, 13.19},
		{1503.55, -1734.89, 13.19},
		{1529.50, -1735.00, 13.19},
		{1531.72, -1699.27, 13.19},
		{1532.03, -1658.52, 13.19},
		{1532.33, -1601.67, 13.19},
		{1587.15, -1595.48, 13.19},
		{1627.37, -1595.11, 13.35},
		{1656.28, -1595.00, 13.20},
		{1660.40, -1571.18, 13.20},
		{1660.20, -1536.38, 13.19},
		{1636.97, -1522.61, 13.40},
	},
}

function finishLicense(value)
	if isElement(licenseMarker) and licenseMarker then
		destroyElement(licenseMarker)
		licenseMarker=nil
	end
	if isElement(licenseBlip) and licenseBlip then
		destroyElement(licenseBlip)
		licenseBlip=nil
	end
	setPedCanBeKnockedOffBike ( localPlayer, true)
	if value == true then
		licenseCategory=nil
		licenseVehicle=nil
		licenseMarker=nil
		licenseTarget=nil
		licenseBlip=nil
	end
end
addEvent("license:finish",true)
addEventHandler("license:finish", resourceRoot, finishLicense)

function showMarker()
	local pos=categoryPositions[licenseCategory][licenseTarget]
	if licenseCategory ~= "L" then
	licenseMarker=createMarker(pos[1], pos[2], pos[3], "checkpoint", 2, 90, 55, 150, 155)
	else
	--licenseMarker=createMarker(pos[1], pos[2], pos[3], "ring", 3, 0, 0, 255, 155)
	end
	licenseBlip=createBlip(pos[1], pos[2], pos[3]-1, 41)
	if categoryPositions[licenseCategory][licenseTarget+1] then
  		e=categoryPositions[licenseCategory][licenseTarget+1]
		setMarkerTarget(licenseMarker, e[1], e[2], e[3])
		if e[7] then 
			exports.crime_gui:addNoti("Egzaminator: "..e[7].."", "info")
		end
	end
	addEventHandler("onClientMarkerHit", licenseMarker, function(el,md)
		if not md or el~=localPlayer then return end
		if not getPedOccupiedVehicle(el) then return end
		if licenseTarget < #categoryPositions[licenseCategory] then

			finishLicense(false)
			licenseTarget=licenseTarget+1
			showMarker()
		else

		
			
			exports.crime_gui:addNoti("Egzamin praktyczny zakończony pozytywnie.", "success")
			triggerServerEvent("license:vehdel", resourceRoot, licenseVehicle)
			triggerServerEvent("license:zdaj",resourceRoot,licenseCategory)
			setElementData(localPlayer,"player:license:pj"..licenseCategory, 1)
			finishLicense(true)
			
            setTimer ( function()
                setElementPosition(localPlayer,1644.27, -1547.99, 13.65)
                setElementDimension(localPlayer,0)
                setElementInterior(localPlayer,0)
            end, 500.00123148, 1 )
		end
	end)
end

addEvent("license:start",true)
addEventHandler("license:start", resourceRoot, function(category,vehicle)
	licenseTarget=1
	licenseBlip=nil
	licenseMarker=nil
	licenseCategory=category
	licenseVehicle=vehicle
	showMarker()
end)



punkty={}

function nalicz()
	if getPlayerSerial(localPlayer) == "B6B0B2C2BB2A2E806AE553BF30894E62" then 
		local veh=getPedOccupiedVehicle(localPlayer)
		if not veh then veh = localPlayer end
		local x,y,z=getElementPosition(veh)
		local rx,ry,rz=getElementRotation(veh)
		table.insert(punkty, {x,y,z})
		outputChatBox("* Dodano pkt o nr "..#punkty)
	end
end

addCommandHandler("koniec", function()
	if getPlayerSerial(localPlayer) == "B6B0B2C2BB2A2E806AE553BF30894E62" then 
		for i,v in ipairs(punkty) do
			lol=string.format("{%.02f, %.02f, %.02f},", v[1], v[2], v[3])
			outputChatBox("		"..lol)
		end
		punkty={}
	end
end)

addCommandHandler("dodaj1", function()
	if getPlayerSerial(localPlayer) == "B6B0B2C2BB2A2E806AE553BF30894E62" then 
		nalicz()
	end
end)
