--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local x,y,z = 1986.50, -1086.23, 25.02
local blip = createBlip(x, y, 20, 52, 0, 0, 0, 0, 0, 0, 200)

addEvent("plantacja:dajinfo", true)
addEventHandler("plantacja:dajinfo", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	local result = exports['crime_database']:dbGet('SELECT * FROM crime_users ORDER BY gornikpkt DESC LIMIT 6', nazwaorg)
	local resultdwa = exports['crime_database']:dbGet('SELECT * FROM crime_users WHERE id=?', uid)
    triggerClientEvent(source, "plantacja:oddajinfo", source, result,resultdwa)
end)

addEvent("plantacja:kupulepszenie", true)
addEventHandler("plantacja:kupulepszenie", root, function(ulid, cena)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	if not ulid then return end 
	if not cena then return end 
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=? ", uid)
    if #result > 0 then
		if result[1].gornikpkt < cena then triggerClientEvent(source, "addNoti", source, "Nie stać cię na to ulepszenie.", "error" ) return end 
		exports["crime_database"]:dbSet("UPDATE crime_users SET gornikul"..ulid.."=?, gornikpkt=gornikpkt-? WHERE id=? LIMIT 1",1, cena, uid)
		triggerEvent("plantacja:dajinfo", source)
		triggerClientEvent(source, "addNoti", source, "Zakupiłeś ulepszenie za "..cena.." pkt.", "success" )
	end
end)

addEvent("plantacja:dodajpunkt", true)
addEventHandler("plantacja:dodajpunkt", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	exports["crime_database"]:dbSet("UPDATE crime_users SET gornikpkt=gornikpkt+1 WHERE id=? LIMIT 1",uid)
end)

addEvent("plantacja:animka", true)
addEventHandler("plantacja:animka", root, function(stan)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	if stan == "wlacz" then 
		setPedAnimation(source, "COP_AMBIENT", "Copbrowse_nod")
	else 
		setPedAnimation ( source, false)
	end
end)

addEvent("plantacja:wywiez",true)
addEventHandler("plantacja:wywiez", root, function(kilogramy,ulepszenie)
	if not kilogramy then return end 
		kilo = kilogramy
	if ulepszenie == 1 then veh=createVehicle(422,1992.31, -1090.12, 24.63, 359.6, 4.2, 89.7)
	elseif ulepszenie == 0 then veh=createVehicle(492,1992.68, -1089.82, 24.44, 0.2, 4.4, 90.7) end
	triggerClientEvent(root, "ghostmode", root, veh, "on")
	if not veh then return end
	if veh then
		setElementData(source,"player:pracadorywczna","Plantacja2")
		setElementData(veh,"vehicle:mileage",math.random(50000,100000))
		setElementData(veh,"vehicle:fuel",100)
		setElementDimension(source,0)
		setElementInterior(veh,0)
		setElementInterior(source,0)
		warpPedIntoVehicle(source,veh)
		setElementData(veh,"vehicle:job","plantacja")
		setElementData(veh,"vehicle:kilogramsysad",kilo)
		triggerClientEvent(source, "plantacja:wieziejuz", source)
	end
end)

addEventHandler("onPlayerQuit", root, function()
	local veh=getPedOccupiedVehicle(source)
	if not veh then return end
	if getVehicleController(veh) ~= source then return end
	if getElementData(veh,"vehicle:job") == "plantacja" then
		destroyElement(veh)
	end
end)

addEventHandler("onPlayerWasted", root, function()
	local veh=getPedOccupiedVehicle(source)
	if not veh then return end
	if getVehicleController(veh) ~= source then return end
	if not getElementData(veh,"vehicle:job") == "plantacja" then return end
	destroyElement(veh)
end)

addEventHandler("onVehicleStartExit", resourceRoot, function()
	cancelEvent()
end)

addEvent("plantacja:vehdel", true)
addEventHandler("plantacja:vehdel", root, function(veh)
	destroyElement(veh)
end)


addEvent("plantacja:hajs", true)
addEventHandler("plantacja:hajs", root, function(value)
	if not tonumber(value) then return end
	if not getElementData(source,"player:logged") then return end
	local uid = getElementData(source,"player:uid")
	local hajs = getPlayerMoney(source)
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
		triggerClientEvent(source, "addNoti", source, "Otrzymujesz "..formatujnaprzecinki(dostanie).." PLN za dostarczenie towaru.", "money" )
		exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"PLANTACJA",dostanie,hajs,hajs+dostanie)
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
		triggerClientEvent(source, "addNoti", source, "Otrzymujesz "..formatujnaprzecinki(dostanie).." PLN za dostarczenie towaru.", "money" )
		exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"PLANTACJA",dostanie,hajs,hajs+dostanie)
	end
end)

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

