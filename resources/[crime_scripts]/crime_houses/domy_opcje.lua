--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local function getPlayerDBID(plr)
	local c=getElementData(plr,"player:uid")
	if not c then return nil end
	return tonumber(c)
end

addEvent("onHousePaymentRequest", true)
addEventHandler("onHousePaymentRequest", getRootElement(), function(domid,ilosc_dni)
	local dbid=getPlayerDBID(client)
	if not dbid then return end
	if ilosc_dni<=0 then return end
	if not domy[domid] then return end
	if domy[domid].ownerid and domy[domid].ownerid~=dbid then return end
	local gotowka=getPlayerMoney(client)
	local koszt=((ilosc_dni*domy[domid].koszt)/10)
	if koszt>gotowka then triggerClientEvent(client, "addNoti", client, "Nie stać cię na ten dom.", "error" ) return end

	-- sprawdzamy ile posiada
	local rp=exports.crime_database_2:pobierzWyniki("select count(*) ilosc from crime_houses WHERE ownerid=? AND paidTo>=NOW() AND active=1 AND id!=?", dbid, domid)
	if rp and rp.ilosc and rp.ilosc>=3 then
		triggerClientEvent(client, "addNoti", client, "Nie możesz posiadać więcej niż 3 domy.", "error" )
		return
	end

	local r=exports.crime_database_2:zapytanie("UPDATE crime_houses SET ownerid=?,paidTo=IF(paidTo>NOW(),paidTo,NOW())+INTERVAL ? DAY WHERE id=? AND (ownerid IS NULL or ownerid=?) LIMIT 1", dbid, ilosc_dni, domid, dbid)
	if r and r>0 then
		triggerClientEvent(client, "addNoti", client, "Kupiłeś dom na "..ilosc_dni.." dni", "success" )
		takePlayerMoney(client, koszt)
		domReload(domid)
		reloaddomku(domid)
	end

end)

addEvent("onHousePaymentRequestPrzedluz", true)
addEventHandler("onHousePaymentRequestPrzedluz", getRootElement(), function(domid,ilosc_dni)
	local dbid=getPlayerDBID(client)
	if not dbid then return end
	if ilosc_dni<=0 then return end
	if not domy[domid] then return end
	if domy[domid].ownerid and domy[domid].ownerid~=dbid then return end
	local gotowka=getPlayerMoney(client)
	local koszt=((ilosc_dni*domy[domid].koszt)/10)
	if koszt>gotowka then triggerClientEvent(plr, "addNoti", plr, "Nie stać cię na ten dom", "error" ) return end
	local r=exports.crime_database_2:zapytanie("UPDATE crime_houses SET paidTo=IF(paidTo>NOW(),paidTo,NOW())+INTERVAL ? DAY WHERE id=? AND (ownerid IS NULL or ownerid=?) LIMIT 1", ilosc_dni, domid, dbid)
	if r and r>0 then
		triggerClientEvent(client, "addNoti", client, "Przedłużyłeś dom o "..ilosc_dni.." dni", "success" )
		takePlayerMoney(client, koszt)
		domReload(domid)
		reloaddomku(domid)
	end

end)

addEvent("onHouseChangeOptions", true)
addEventHandler("onHouseChangeOptions", resourceRoot, function(domid,opcja,stan)
	if not domid or not domy[domid] then return end
	if opcja=="zamkniety" then
		exports['crime_database']:dbSet("UPDATE crime_houses SET zamkniety=? WHERE id=? LIMIT 1", stan and 1 or 0, domid)
		domReload(domid)
		reloaddomku(domid)
	elseif opcja == "zwolnij" then
		exports['crime_database']:dbSet("UPDATE crime_houses SET ownerid=null WHERE id=? LIMIT 1", domid)
		exports['crime_database']:dbSet("UPDATE crime_houses SET paidTo=?? WHERE id=? LIMIT 1", "NULL", domid)
		triggerClientEvent(client, "addNoti", client, "Zwolniłeś dom", "info" )
		domReload(domid)
		reloaddomku(domid)
	end
end)


