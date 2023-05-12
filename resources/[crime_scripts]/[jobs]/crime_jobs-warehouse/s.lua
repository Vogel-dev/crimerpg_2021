--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local x,y,z = 1889.77, -1864.58, 13.58
local blip = createBlip(x, y, 20, 52, 0, 0, 0, 0, 0, 0, 200)

------Wejscie------
-- local marker=createMarker(1890.05, -1792.11, 13.55-0.9, "corona", 1.5, 0, 255, 0,1)
-- setElementData(marker,"mpod",true)
-- setElementData(marker,"mtekst","Magazyn\nWejście")
-- addEventHandler("onMarkerHit", marker, function(el,md)
-- 	if getElementType(el) == "vehicle" then return end
-- 	if getPedOccupiedVehicle(el) then return end
--             fadeCamera ( el, false, 2.5, 0, 0, 0 )
--             setTimer ( fadeCamera, 2500, 1, el, true, 2.5)
-- 	setTimer ( function()
-- 		setElementPosition(el,1864.34, -1775.47, -66.44)
-- setElementDimension(el,0)
-- setElementInterior(el,0)
-- 	end, 2500, 1 )
-- end) 

-- ------Wyjscie------
-- local marker=createMarker(1866.94, -1775.89, -66.44-0.9, "corona", 1.5, 255, 0, 0,1)
-- setElementData(marker,"mpod",true)
-- setElementData(marker,"mtekst","Magazyn\nWyjście")
-- addEventHandler("onMarkerHit", marker, function(el,md)
-- 	if getElementType(el) == "vehicle" then return end
-- 	if getPedOccupiedVehicle(el) then return end
-- 	if getElementData(el,"player:pracadorywczna") == "Magazynier" then triggerClientEvent(el, 'alerts:create_alert', root, 'error', 'Zwolnij się z pracy magazyniera!') return end

--             fadeCamera ( el, false, 2.5, 0, 0, 0 )
--             setTimer ( fadeCamera, 2500, 1, el, true, 2.5)
-- 	setTimer ( function()
--  setElementPosition(el,1892.01, -1794.14, 13.55)
-- setElementDimension(el,0)
-- setElementInterior(el,0)
-- 	end, 2500, 1 )
-- end)

local mule = {
	{482,1896.81, -1868.59, 13.62, 0.7, 0.7, 269.3,2, 15, 15, 15}
}

for i,v in pairs(mule) do 
	local mules = createVehicle(v[1], v[2], v[3], v[4], v[5], v[6], v[7])
	-- createObject( int modelid, float x, float y, float z, [ float rx, float ry, float rz, bool isLowLOD = false ] )
	local skrzynia = createObject(1578,1893.45, -1868.38, 12.56)
	local skrzynia2 = createObject(1578,1893.45, -1867.88, 12.56)
	local skrzynia3 = createObject(1578,1893.45, -1868.98, 12.56)
    setElementFrozen(mules,true)
	setVehicleLocked(mules,true)
	setVehicleVariant(mules, v[8], 255)
	setVehicleDoorOpenRatio( mules, 4, 90)
	setVehicleDoorOpenRatio( mules, 5, 90)
	setVehicleColor(mules,v[9], v[10], v[11])
end

addEvent("magazynier:dajinfo", true)
addEventHandler("magazynier:dajinfo", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	local result = exports['crime_database']:dbGet('SELECT * FROM crime_users ORDER BY magazynierpkt DESC LIMIT 6', nazwaorg)
	local resultdwa = exports['crime_database']:dbGet('SELECT * FROM crime_users WHERE id=?', uid)
    triggerClientEvent(source, "magazynier:oddajinfo", source, result,resultdwa)
end)

addEvent("magazynier:dodajpunkt", true)
addEventHandler("magazynier:dodajpunkt", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	exports["crime_database"]:dbSet("UPDATE crime_users SET magazynierpkt=magazynierpkt+1 WHERE id=? LIMIT 1",uid)
end)

addEvent("magazynier:kupulepszenie", true)
addEventHandler("magazynier:kupulepszenie", root, function(ulid, cena)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	if not ulid then return end 
	if not cena then return end 
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=? ", uid)
    if #result > 0 then
		if result[1].magazynierpkt < cena then triggerClientEvent(source, "addNoti", source, "Nie stać cię na to ulepszenie.", "error" ) return end 
		exports["crime_database"]:dbSet("UPDATE crime_users SET magazynierul"..ulid.."=?, magazynierpkt=magazynierpkt-? WHERE id=? LIMIT 1",1, cena, uid)
		triggerEvent("magazynier:dajinfo", source)
		triggerClientEvent(source, "addNoti", source, "Zakupiłeś ulepszenie za "..cena.." pkt.", "success" )
	end
end)

addEvent("magazynier:skrzynia", true)
addEventHandler("magazynier:skrzynia", root, function(stan)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	if stan == "daj" then 
		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=? ", uid)
		if #result > 0 then
			ulepszenie = result[1].magazynierul2
		end
		if ulepszenie == 0 then 
			local skrzynia = createObject(1578,0,0,0)
			exports.bone_attach:attachElementToBone (skrzynia, source, 11, -0.2, 0.12, 0.1,90,10,0)
			setElementCollisionsEnabled(skrzynia,false)
			setObjectScale(skrzynia,0.8)
			setElementData(skrzynia,"magazynier:boxowner",source)
		elseif ulepszenie == 1 then 
			local skrzynia = createObject(1578,0,0,0)
			exports.bone_attach:attachElementToBone (skrzynia, source, 11, -0.2, 0.12, 0.1,90,10,0)
			setElementCollisionsEnabled(skrzynia,false)
			setObjectScale(skrzynia,0.95)
			setElementData(skrzynia,"magazynier:boxowner",source)
		end
	else 
		for i,v in pairs(getElementsByType("object")) do 
			if getElementData(v,"magazynier:boxowner") == source then 
				destroyElement(v)
			end
 		end
	end
end)

addEvent("magazynier:animka", true)
addEventHandler("magazynier:animka", root, function(stan)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	if stan == "wlacz" then 
		setPedAnimation(source, "CARRY", "crry_prtial", 1)  
	else 
		setPedAnimation ( source, "CARRY", "crry_prtial", -1, true, true )
		setTimer(setPedAnimation,50,1,source,false)
	end
end)

addEventHandler("onPlayerQuit", root, function()
	if not getElementData(source,"player:pracadorywczna") == "Magazynier" then return end
	for i,v in pairs(getElementsByType("object")) do 
		if getElementData(v,"magazynier:boxowner") == source then 
			destroyElement(v)
		end
	 end
end)

addEvent("magazynier:hajs", true)
addEventHandler("magazynier:hajs", root, function(value)
	if not tonumber(value) then return end
	if not getElementData(source,"player:logged") then return end
	local uid = getElementData(source,"player:uid")
	local hajs = getPlayerMoney(source)
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=? ", uid)
	if #result > 0 then
		ul2 = result[1].magazynierul2
	end
	if ul2 == 1 then 
		value=value*1.3
	elseif ul2 == 0 then 
		value=value
	end
	if getElementData(source,"player:premium") then 
		value = value*1.15
		local dostanie = math.floor(value*1)
		local podatek = math.floor(value*0.1)
		exports["crime_database"]:dbSet("UPDATE crime_users SET zarobki=zarobki+? WHERE id=? LIMIT 1",dostanie,uid)
		givePlayerMoney(source,dostanie)

		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_informations WHERE id=1 ")
		if #result > 0 then
			local query=exports["crime_database"]:dbSet("UPDATE crime_informations SET podatki=? WHERE id=?", result[1].podatki+podatek,  1)
		end
		triggerClientEvent(source, "addNoti", source, "Otrzymujesz "..formatujnaprzecinki(dostanie).." PLN za odłożenie towaru.", "money" )
		exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"MAGAZYN",dostanie,hajs,hajs+dostanie)
	else
		value = value
		local dostanie = math.floor(value*1)
		local podatek = math.floor(value*0.1)
		exports["crime_database"]:dbSet("UPDATE crime_users SET zarobki=zarobki+? WHERE id=? LIMIT 1",dostanie,uid)
		givePlayerMoney(source,dostanie)
		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_informations WHERE id=1 ")
		if #result > 0 then
			local query=exports["crime_database"]:dbSet("UPDATE crime_informations SET podatki=? WHERE id=?", result[1].podatki+podatek,  1)
		end
		triggerClientEvent(source, "addNoti", source, "Otrzymujesz "..formatujnaprzecinki(dostanie).." PLN za odłożenie towaru.", "money" )
		exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"MAGAZYN",dostanie,hajs,hajs+dostanie)
	end
end)

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end

function formatujnaprzecinki(amount) 
	local formatted = amount 
	while true do   
	  formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2') 
	  if (k==0) then 
		break 
	  end 
	end 
	return formatted 
  end

