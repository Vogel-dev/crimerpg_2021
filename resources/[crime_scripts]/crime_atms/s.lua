--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("onPlayerRequestATMInfo", true)
addEventHandler("onPlayerRequestATMInfo", resourceRoot, function()
	local dbid=getElementData(client,"player:uid")
	if not dbid then
		triggerClientEvent(client,"doFillATMInfo", resourceRoot, false)
		return
	end
	local sr=exports["crime_database"]:dbGet("SELECT bank_money FROM crime_users WHERE id=? LIMIT 1",dbid)
	if not sr or #sr < 1 then
		triggerClientEvent(client,"doFillATMInfo", resourceRoot, false)
		return
	end
	local sr=sr[1]
	triggerClientEvent(client,"doFillATMInfo", resourceRoot, true, tonumber(sr.bank_money))
end)

function onPlayerRequestATMInfotest(client)
	local dbid=getElementData(client,"player:uid")
	if not dbid then
		triggerClientEvent(client,"doFillATMInfo", resourceRoot, false)
		return
	end
	local sr=exports["crime_database"]:dbGet("SELECT bank_money FROM crime_users WHERE id=? LIMIT 1",dbid)
	if not sr or #sr < 1 then
		triggerClientEvent(client,"doFillATMInfo", resourceRoot, false)
		return
	end
	local sr=sr[1]
	triggerClientEvent(client,"doFillATMInfo", resourceRoot, true, tonumber(sr.bank_money))
end

addEvent("bankomat:wplac", true)
addEventHandler("bankomat:wplac", resourceRoot, function(kwota)
	local dbid=getElementData(client,"player:uid")
	if not dbid then return end
	if type(kwota) ~= "number" then triggerClientEvent(client, "addNoti", client, "Kwota to nie liczba.", "error" ) return end
	local sr=exports["crime_database"]:dbGet("SELECT `bank_money` FROM `crime_users` WHERE id=? LIMIT 1",dbid)
	if not sr or #sr < 1 then return end
	if kwota > getPlayerMoney(client) then exports.srnoti:create_alert('error','Nie posiadasz tyle pieniędzy!') return end
	takePlayerMoney(client, kwota)
	exports["crime_database"]:dbSet("UPDATE crime_users SET bank_money=bank_money+?? WHERE id=? LIMIT 1",tonumber(kwota),dbid)
	local sr=exports["crime_database"]:dbGet("SELECT `bank_money` FROM `crime_users` WHERE id=? LIMIT 1",dbid)
	if not sr or #sr < 1 then return end
	sr=tonumber(sr[1].bank_money)
	triggerEvent("admin:logs", root, string.format("WPLATA %d DO bankomatu (UID : %d) STAN KONTA %d",math.abs(tonumber(kwota)),dbid,sr))
		triggerClientEvent(client, "addNoti", client, "Wpłaciłeś pieniądze do bankomatu.", "money" )
		onPlayerRequestATMInfotest(client)
	local query=exports["crime_database"]:dbSet("INSERT INTO logs_atms (typ, kwota, serial,uid) VALUES (?,?,?,?)", "wplata", math.abs(kwota), getPlayerSerial(client),dbid)
end)

addEvent("bankomat:wyplac", true)
addEventHandler("bankomat:wyplac", resourceRoot, function(kwota)
	local dbid=getElementData(client,"player:uid")
	if not dbid then return end
	if type(kwota) ~= "number" then triggerClientEvent(client, "addNoti", client, "Kwota to nie liczba", "error" ) return end
	local sr=exports["crime_database"]:dbGet("SELECT `bank_money` FROM `crime_users` WHERE id=? LIMIT 1",dbid)
	if not sr or #sr < 1 then return end
	sr=tonumber(sr[1].bank_money)
	if (sr<math.abs(kwota)) then
		triggerClientEvent(client, "addNoti", client, "Nie posiadasz tyle pieniędzy.", "error" )
		return
	end
	exports["crime_database"]:dbSet("UPDATE crime_users SET bank_money=bank_money-?? WHERE id=? LIMIT 1",math.abs(tonumber(kwota)),dbid)
	local sr=exports["crime_database"]:dbGet("SELECT `bank_money` FROM `crime_users` WHERE id=? LIMIT 1",dbid)
	if not sr or #sr < 1 then return end
	sr=tonumber(sr[1].bank_money)
	triggerEvent("admin:logs", root, string.format("WYPLATA %d z bankomatu (UID : %d) STAN KONTA %d",math.abs(tonumber(kwota)),dbid,sr))
	triggerClientEvent(client, "addNoti", client, "Wypłaciłeś pieniądze z bankomatu.", "money" )
	givePlayerMoney(client, math.abs(kwota))
	onPlayerRequestATMInfotest(client)
	local query=exports["crime_database"]:dbSet("INSERT INTO logs_atms (typ, kwota, serial, uid) VALUES (?,?,?,?)", "wyplata", math.abs(kwota), getPlayerSerial(client),dbid)
end)

addEvent("bankomat:przelej", true)
addEventHandler("bankomat:przelej", resourceRoot, function(kwota, uid)
	if not uid then return end
	local dbid=getElementData(client,"player:uid")
	if not dbid then return end
	if type(kwota) ~= "number" then triggerClientEvent(client, "addNoti", client, "Kwota to nie liczba.", "error" ) return end
	local sr=exports["crime_database"]:dbGet("SELECT `bank_money` FROM `crime_users` WHERE id=? LIMIT 1",dbid)
	if not sr or #sr < 1 then return end
	sr=tonumber(sr[1].bank_money)

	local srdwa=exports["crime_database"]:dbGet("SELECT `login` FROM `crime_users` WHERE id=? LIMIT 1",uid)
	if not srdwa or #srdwa < 1 then return end
	srdwa=srdwa[1].login

	if (sr<math.abs(kwota)) then
		triggerClientEvent(client, "addNoti", client, "Nie posiadasz tyle pieniędzy na koncie.", "error" )
		return
	end
	exports["crime_database"]:dbSet("UPDATE crime_users SET bank_money=bank_money-?? WHERE id=? LIMIT 1",math.abs(tonumber(kwota)),dbid)
	exports["crime_database"]:dbSet("UPDATE crime_users SET bank_money=bank_money+?? WHERE id=? LIMIT 1",math.abs(tonumber(kwota)),uid)

	triggerEvent("admin:logs", root, string.format("PRZELEW %d od (UID : %d) dla %d",math.abs(tonumber(kwota)),dbid,uid))
	triggerClientEvent(client, "addNoti", client, "Zrobiłeś przelew.", "money" )

	local nick = getPlayerName(client)
	onPlayerRequestATMInfotest(client)
	local query=exports["crime_database"]:dbSet("INSERT INTO logs_atms (typ, kwota, serial, uid, odkogo) VALUES (?,?,?,?,?)", "przelewdla", math.abs(kwota), getPlayerSerial(client),dbid, srdwa)
	local query2=exports["crime_database"]:dbSet("INSERT INTO logs_atms (typ, kwota, serial, uid, odkogo) VALUES (?,?,?,?,?)", "przelewod", math.abs(kwota), getPlayerSerial(client),uid, nick:gsub('#%x%x%x%x%x%x', ''))
end)

addEvent("wyszukajhistoriebank", true)
addEventHandler("wyszukajhistoriebank", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM logs_atms WHERE uid=? ORDER BY data DESC", uid)
    if #result > 0 then
        triggerClientEvent(source, "bankomat:dotabeli", source, result)
    end
end)
