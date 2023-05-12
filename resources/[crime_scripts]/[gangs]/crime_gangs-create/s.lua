--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("org:tworzenie", true)
addEventHandler("org:tworzenie", root, function(nazwaorg)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not nazwaorg then return end 
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_gangs WHERE code=?", removeHex(nazwaorg))
	if result and #result > 0 then
		triggerClientEvent(source, "addNoti", source, "Taka organizacja już istnieje.", "error" )
	else
		local login = getPlayerName(source)
		local query=exports["crime_database"]:dbSet("INSERT INTO crime_gangs (code, saldo) VALUES (?,?)", removeHex(nazwaorg),0)
		local query2 = exports["crime_database"]:dbSet("UPDATE crime_users SET org=? WHERE id=?", removeHex(nazwaorg), uid)
		local query3 = exports["crime_database"]:dbSet("UPDATE crime_users SET orgrank=? WHERE id=?", 4, uid)
		if query and query2 and query3 then 
			triggerClientEvent(source, "addNoti", source, "Stworzyłeś organizacje, kliknij F5 aby otworzyć jej panel.", "success" )
			takePlayerMoney(source,125000)
			sad = source
			setTimer(function()
				triggerEvent("save:player",root,sad)
				triggerEvent("load:player",root,sad)
			end, 1000, 1)
		end
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