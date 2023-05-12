--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

-- local x,y,z = 2325.29, -1995.97, 13.55
-- local blip = createBlip(x, y, 20, 25, 0, 0, 0, 0, 0, 0, 200)

addEvent("tuning:dajinfo", true)
addEventHandler("tuning:dajinfo", root, function()
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	local idpojazdu = getElementData(getPedOccupiedVehicle(source),"vehicle:id")
	if not idpojazdu then return end
	local result = exports['crime_database']:dbGet('SELECT * FROM crime_vehicles WHERE id=?', idpojazdu)
	triggerClientEvent(source, "tuning:oddajinfo", source, result)
end)

addEvent("tuning:restartauta", true)
addEventHandler("tuning:restartauta", root, function(veh)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	local test = exports["crime_vehicles"]:onSaveVehicle(veh)
	destroyElement(veh)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET parking=1 WHERE id=?", id)
	local nick = getPlayerName(source)
	local spawn=exports["crime_vehicles"]:onRespawnVehicles(_,id,{1759.79, -1678.89, 13.36, 359.9, 0.0, 90.4},nick)
end)

addEvent("tuning:neon", true)
addEventHandler("tuning:neon", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].neon == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET neon=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zdemontowałeś neony.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś neony za  "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:maskowanie", true)
addEventHandler("tuning:maskowanie", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].zamaskowany == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET zamaskowany=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zdemontowałeś maskowanie.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś maskowanie za "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:karbon", true)
addEventHandler("tuning:karbon", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].karbon == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET karbon=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zdemontowałeś karbowanie.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś karbowanie za "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:naped", true)
addEventHandler("tuning:naped", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].naped == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET naped=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zdemontowałeś układ zmiany napędu.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś układ zmiany napędu za "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:zawieszenie", true)
addEventHandler("tuning:zawieszenie", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].zawieszenie == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET zawieszenie=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zdemontowałeś regulowane zawieszenie.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś regulowane zawieszenie za "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:silnik", true)
addEventHandler("tuning:silnik", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
	if #result > 0 then
		if kolor == 0.2 then 
			if result[1].silnik >= 4.01 then triggerClientEvent(source, "addNoti", source, "Posiadasz maksymalną pojemność.", "error" )return end 
		elseif kolor == -0.2 then 
			if result[1].silnik <= 1.01 then triggerClientEvent(source, "addNoti", source, "Posiadasz minimalną pojemność.", "error" ) return end 
		end
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET silnik=silnik+? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0.2 then 
		triggerClientEvent(source, "addNoti", source, "Zwiększyłeś pojemność silnika o 0.2", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zmniejszyłeś pojemnośc silnika o 0.2", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:cylindry", true)
addEventHandler("tuning:cylindry", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
	if #result > 0 then
		if kolor == 2 then 
			if result[1].cylindry >= 16 then triggerClientEvent(source, "addNoti", source, "Posiadasz maksymalną liczbę cylindrów.", "error" ) return end 
		elseif kolor == -2 then 
			if result[1].cylindry <= 4 then triggerClientEvent(source, "addNoti", source, "Posiadasz minimalną liczbe cylindrów.", "error" ) return end 
		end
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET cylindry=cylindry+? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 2 then 
		triggerClientEvent(source, "addNoti", source, "Zwiększyłeś liczbę cylindrów o 2", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zmniejszyłeś liczbę cylindrów o 2", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:klakson", true)
addEventHandler("tuning:klakson", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].klakson == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET klakson=? WHERE id=? LIMIT 1",kolor, id)
	triggerClientEvent(source, "addNoti", source, "Zmieniłes dzwięk klaksonu za "..cena.." PLN", "success" )
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:trakcja", true)
addEventHandler("tuning:trakcja", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
	if #result > 0 then
		if kolor == 1 then 
			if result[1].trakcja >= 3 then triggerClientEvent(source, "addNoti", source, "Posiadasz maksymalnie ulepszone.", "error" ) return end 
		elseif kolor == -1 then 
			if result[1].trakcja <= 0 then triggerClientEvent(source, "addNoti", source, "Posiadasz najgorszą wersję.", "error" ) return end 
		end
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET trakcja=trakcja+? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 1 then 
		triggerClientEvent(source, "addNoti", source, "Ulepszyłes trakcję.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Pogorszyłeś trakcję.", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:chiptuning", true)
addEventHandler("tuning:chiptuning", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
	if #result > 0 then
		if kolor == 1 then 
			if result[1].chiptuning >= 3 then triggerClientEvent(source, "addNoti", source, "Posiadasz maksymalnie ulepszone.", "error" ) return end 
		elseif kolor == -1 then 
			if result[1].chiptuning <= 0 then triggerClientEvent(source, "addNoti", source, "Posiadasz najgorszą wersję.", "error" ) return end 
		end
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET chiptuning=chiptuning+? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 1 then 
		triggerClientEvent(source, "addNoti", source, "Ulepszyłeś chiptuning.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Pogorszyłeś chiptuning.", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:tarcze", true)
addEventHandler("tuning:tarcze", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
	if #result > 0 then
		if kolor == 1 then 
			if result[1].tarcze >= 3 then triggerClientEvent(source, "addNoti", source, "Posiadasz maksymalnie ulepszone.", "error" ) return end 
		elseif kolor == -1 then 
			if result[1].tarcze <= 0 then triggerClientEvent(source, "addNoti", source, "Posiadasz najgorszą wersję.", "error" ) return end 
		end
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET tarcze=tarcze+? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 1 then 
		triggerClientEvent(source, "addNoti", source, "Ulepszyłeś tarczę.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Pogorszyłes tarczę.", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:bak", true)
addEventHandler("tuning:bak", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
	if #result > 0 then
		if kolor == 25 then 
			if result[1].bak >= 100 then triggerClientEvent(source, "addNoti", source, "Nie zwiększysz pojemności bardziej.", "error" ) return end 
		elseif kolor == -25 then 
			if result[1].bak <= 25 then triggerClientEvent(source, "addNoti", source, "Nie zmniejszysz pojemności bardziej.", "error" ) return end 
		end
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET bak=bak+? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 25 then 
		triggerClientEvent(source, "addNoti", source, "Zwiększyłeś pojemność.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zmniejszyłeś pojemność.", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:lpg", true)
addEventHandler("tuning:lpg", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].lpg == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET lpg=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zdemontowałeś butlę LPG.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś butlę LPG za "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:atrapa", true)
addEventHandler("tuning:atrapa", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].atrapa == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET atrapa=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zdemontowałeś atrapę.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś atrapę za "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:us1", true)
addEventHandler("tuning:us1", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].us1 == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET us1=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś US1.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś US1 za "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:us2", true)
addEventHandler("tuning:us2", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].us2 == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET us2=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś US2.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś US2 za "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)

addEvent("tuning:us3", true)
addEventHandler("tuning:us3", root, function(veh, kolor, cena)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	if not kolor then return end
	if not cena then return end 
	local id = getElementData(veh,"vehicle:id")
	if not id then return end 
	if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy", "error" ) return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", id)
    if #result > 0 then
		if result[1].us3 == kolor then triggerClientEvent(source, "addNoti", source, "Posiadasz już tę część.", "error" ) return end 
    end
	takePlayerMoney(source,cena)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET us3=? WHERE id=? LIMIT 1",kolor, id)
	if kolor == 0 then 
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś US3.", "success" )
	else
		triggerClientEvent(source, "addNoti", source, "Zamontowałeś US3 za "..cena.." PLN", "success" )
	end
	triggerEvent("tuning:dajinfo",source)
	setElementData(veh,"coszmienial",true)
end)