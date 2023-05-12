--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("org:dajinfo", true)
addEventHandler("org:dajinfo", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local nazwaorg = getElementData(source,"player:organization")
    if not nazwaorg then return end 
    local zgony = exports['crime_database']:dbGet('SELECT SUM(zgony) FROM `crime_users` WHERE org=?', nazwaorg)
    local saldo = exports['crime_database']:dbGet('SELECT saldo FROM crime_gangs WHERE code=?', nazwaorg)
    local kille = exports['crime_database']:dbGet('SELECT SUM(kille) FROM `crime_users` WHERE org=?', nazwaorg)
    local czlonkowie = exports['crime_database']:dbGet('SELECT COUNT(org) FROM `crime_users` WHERE org=?', nazwaorg)
    local lider = exports['crime_database']:dbGet('SELECT login FROM crime_users WHERE org=? AND orgrank=4 LIMIT 1', nazwaorg,4)
    local pojazdy = exports['crime_database']:dbGet('SELECT COUNT(ownedGroup) FROM `crime_vehicles` WHERE ownedGroup=?', nazwaorg)
    local najsad = exports['crime_database']:dbGet('SELECT login FROM crime_users WHERE org=? ORDER BY kille DESC LIMIT 1', nazwaorg)
    for i,v in pairs(najsad[1]) do 
        naj = v
    end
    for i,v in pairs(pojazdy[1]) do
        pojazdy = v
    end
    if lider[1] then 
        for i,v in pairs(lider[1]) do
            lider = v
        end
    end
    for i,v in pairs(czlonkowie[1]) do
        czlonkowie = v
    end
    for i,v in pairs(kille[1]) do
        kille = v
    end
    for i,v in pairs(saldo[1]) do
        saldo = v
    end
    for i,v in pairs(zgony[1]) do
        zgony = v
    end

    local resultludzie=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE org=? ORDER BY id", nazwaorg)
    local resultauta=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedGroup=? ORDER BY id", nazwaorg)
    local resultsaldo=exports["crime_database"]:dbGet("SELECT * FROM crime_gangs_balance WHERE org=? ORDER BY kiedy DESC", nazwaorg)
    local resulttoporg = exports['crime_database']:dbGet('SELECT * FROM crime_users WHERE org=? ORDER BY kille DESC LIMIT 7', nazwaorg)
    local resulttopserwer = exports['crime_database']:dbGet('SELECT * FROM crime_users ORDER BY kille DESC LIMIT 7', nazwaorg)
    triggerClientEvent(source, "org:oddajinfo", source, zgony, saldo, kille, czlonkowie, lider, pojazdy, naj, resultludzie, resultauta, resultsaldo, resulttoporg, resulttopserwer)
end)

addEvent("org:awans", true)
addEventHandler("org:awans", root, function(kto, ranga)
    if not kto then return end
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if ranga == "#FF0000VLider" then triggerClientEvent(source, "addNoti", source, "Wyżej nie awansujesz.", "error" ) return end
    if ranga == "#AA0000Lider" then triggerClientEvent(source, "addNoti", source, "Wyżej nie awansujesz.", "error" )return end
    exports["crime_database"]:dbSet("UPDATE crime_users SET orgrank=orgrank+1 WHERE id=? LIMIT 1",kto)
    triggerEvent("org:dajinfo", source)
    for i,v in pairs(getElementsByType("player")) do 
        if getElementData(v,"player:uid") == kto then 
            sad = v
			setTimer(function()
				triggerEvent("save:player",root,sad)
				triggerEvent("load:player",root,sad)
			end, 1000, 1)
        end
    end
end)

addEvent("org:degrad", true)
addEventHandler("org:degrad", root, function(kto, ranga)
    if not kto then return end
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if ranga == "#DDDDDDNowy" then triggerClientEvent(source, "addNoti", source, "Niżej nie zdegradujesz.", "error" ) return end
    if ranga == "#AA0000Lider" then triggerClientEvent(source, "addNoti", source, "Lidera nie zdegradujesz.", "error" ) return end
    exports["crime_database"]:dbSet("UPDATE crime_users SET orgrank=orgrank-1 WHERE id=? LIMIT 1",kto)
    triggerEvent("org:dajinfo", source)

    for i,v in pairs(getElementsByType("player")) do 
        if getElementData(v,"player:uid") == kto then 
            sad = v
			setTimer(function()
				triggerEvent("save:player",root,sad)
				triggerEvent("load:player",root,sad)
			end, 1000, 1)
        end
    end
end)

addEvent("org:wyrzuc", true)
addEventHandler("org:wyrzuc", root, function(kto, ranga)
    if not kto then return end
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if ranga == "#AA0000Lider" then triggerClientEvent(source, "addNoti", source, "Nie wyrzucisz lidera.", "error" ) return end
    exports["crime_database"]:dbSet("UPDATE crime_users SET orgrank=?, org=?, orgwplaty=? WHERE id=? LIMIT 1", 0, "", 0, kto)
    exports["crime_database"]:dbSet("UPDATE crime_vehicles SET ownedGroup=? WHERE ownedPlayer=?", "", kto)
    triggerEvent("org:dajinfo", source)
    for i,v in pairs(getElementsByType("player")) do 
        if getElementData(v,"player:uid") == kto then 
            sad = v
			setTimer(function()
				triggerEvent("save:player",root,sad)
				triggerEvent("load:player",root,sad)
			end, 1000, 1)
        end
    end
end)

addEvent("org:zapros", true)
addEventHandler("org:zapros", root, function(uidzapros)
    if not uidzapros then return end
    uidzapros = tonumber(uidzapros)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local org = getElementData(source,"player:organization")
    local nick = getPlayerName(source)
    twojstary = false
    for i,v in pairs(getElementsByType("player")) do 
        if getElementData(v,"player:uid") == uidzapros then
            if getElementData(v,"player:organization") then triggerClientEvent(source, "addNoti", source, "Ta osoba nalezy już do organizacji.", "error" ) return end
            triggerClientEvent(v, "addNoti", v, "Zostałeś zaproszony do organizacji "..org.." przez: "..removeHex(nick).." wpisz /org-dolacz aby dołączyć.", "info" )
            setElementData(v,"player:zaproszenie",org)
            local nickdwa = getPlayerName(v)
            triggerClientEvent(source, "addNoti", source, "Zaprosiłeś "..removeHex(nickdwa).." do organizacji.", "info" )
            twojstary = true
        end
    end
    if twojstary == false then triggerClientEvent(source, "addNoti", source, "Nie znaleziono takiego gracza online.", "error" ) return end
end)

function orgdolacz(plr)
    local uid=getElementData(plr,"player:uid")
    if not uid then return end
    if not getElementData(plr,"player:zaproszenie") then triggerClientEvent(plr, "addNoti", plr, "Nie masz żadnego zaproszenia do organizacji.", "error" ) return end
    exports["crime_database"]:dbSet("UPDATE crime_users SET orgrank=?, org=?, orgwplaty=? WHERE id=? LIMIT 1", 1, getElementData(plr,"player:zaproszenie"), 0, uid)
    triggerClientEvent(plr, "addNoti", plr, "Dołączyłeś do organizacji "..getElementData(plr,"player:zaproszenie")..".", "success" )
    setElementData(plr,"player:zaproszenie",false)
    sad = plr
    setTimer(function()
        triggerEvent("save:player",root,sad)
        triggerEvent("load:player",root,sad)
    end, 1000, 1)
end
addCommandHandler("org-dolacz", orgdolacz)


addEvent("org:opusc", true)
addEventHandler("org:opusc", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    triggerClientEvent(source, "addNoti", source, "Opuściłeś organizację.", "info" )
    exports["crime_database"]:dbSet("UPDATE crime_users SET orgrank=?, org=?, orgwplaty=? WHERE id=? LIMIT 1", 0, "", 0, uid)
    exports["crime_database"]:dbSet("UPDATE crime_vehicles SET ownedGroup=? WHERE ownedPlayer=?", "", uid)
    sad = source
    setTimer(function()
        triggerEvent("save:player",root,sad)
        triggerEvent("load:player",root,sad)
    end, 1000, 1)
end)

addEvent("org:usun", true)
addEventHandler("org:usun", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local org = getElementData(source,"player:organization")
    triggerClientEvent(source, "addNoti", source, "Usunałeś organizację.", "info" )
    exports["crime_database"]:dbSet("UPDATE crime_users SET orgrank=?, org=?, orgwplaty=? WHERE org=?", 0, "", 0, org)
    exports["crime_database"]:dbSet("UPDATE crime_vehicles SET ownedGroup=? WHERE ownedGroup=?", "", org)
    exports["crime_database"]:dbSet("DELETE FROM crime_gangs WHERE code=?",org)
    exports["crime_database"]:dbSet("DELETE FROM crime_gangs_balance WHERE org=?",org)
    for i,v in pairs(getElementsByType("player")) do 
        if getElementData(v,"player:organization") == org then 
            triggerEvent("save:player",root,v)
            triggerEvent("load:player",root,v)
        end
    end
    for i,v in pairs(getElementsByType("vehicle")) do 
        if getElementData(v,"vehicle:ownedGroup") == org then  
            setElementData(v,"vehicle:ownedGroup",false)
        end
    end
end)

addEvent("org:wplac", true)
addEventHandler("org:wplac", root, function(kwota)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if not kwota then return end
    local org = getElementData(source,"player:organization")
    local kto = getPlayerName(source)
    if kwota > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz takiej sumy pieniędzy.", "error" ) return end
    takePlayerMoney(source,kwota)
    triggerClientEvent(source, "addNoti", source, "Wpłaciłeś "..kwota.." PLN na saldo organizacji "..org..".", "money" )
    exports["crime_database"]:dbSet("UPDATE crime_gangs SET saldo=saldo+? WHERE code=? LIMIT 1", kwota, org)
    exports["crime_database"]:dbSet("UPDATE crime_users SET orgwplaty=orgwplaty+? WHERE id=? LIMIT 1", kwota, uid)
    exports["crime_database"]:dbSet("INSERT INTO crime_gangs_balance (kto, ile, org) VALUES (?,?,?)", removeHex(kto), kwota, org)
    triggerEvent("org:dajinfo", source)
end)

addEvent("org:wyplac", true)
addEventHandler("org:wyplac", root, function(kwota)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if not kwota then return end
    local org = getElementData(source,"player:organization")
    local kto = getPlayerName(source)
    local saldoorg = exports['crime_database']:dbGet('SELECT saldo FROM crime_gangs WHERE code=?', org)
    for i,v in pairs(saldoorg[1]) do
        saldoorg = v
    end
    if not saldoorg then return end 
    if saldoorg < kwota then triggerClientEvent(source, "addNoti", source, "Organizacja nie posiada tyle pieniędzy.", "error" ) return end
    givePlayerMoney(source,kwota)
    triggerClientEvent(source, "addNoti", source, "Wypłaciłeś "..kwota.." PLN z organizacji "..org..".", "money" )
    exports["crime_database"]:dbSet("UPDATE crime_gangs SET saldo=saldo-? WHERE code=? LIMIT 1", kwota, org)
    exports["crime_database"]:dbSet("INSERT INTO crime_gangs_balance (kto, ile, org) VALUES (?,?,?)", removeHex(kto), -kwota, org)
    triggerEvent("org:dajinfo", source)
end)

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end