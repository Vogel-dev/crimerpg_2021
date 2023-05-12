--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

-- function podatki(plr)
--     if not getElementData(plr,"player:admin") then return end
--     local result=exports["crime_database"]:dbGet("SELECT * FROM crime_informations WHERE id=?", 1)
-- 	if result and #result > 0 then
-- 		local v=result[1]
--         local podatki = v.podatki
--         outputChatBox("Podatki pobrane od graczy: #FFAA00"..tostring(podatki).." PLN",plr,255,255,255,true)
--         outputChatBox("Aby pobrać podatek wpisz #FFAA00/ppobierz (ilość)",plr,255,255,255,true)
--         outputChatBox("Nie tolerujemy złodzieji więc pamiętaj iż wszystko zapisuje się w logach :)",plr,255,0,0,true)
--     end
-- end
-- addCommandHandler("podatki",podatki)

-- function ppobierz(plr,sad,val)
--     local val = tonumber(val)
--     if not getElementData(plr,"player:admin") then return end
--     if not val then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Podaj wartość /ppobierz (ile)') return end
--     if val < 1 then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Coś ci nie wyszło') return end
--     if val > 10000 then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Max 10.000 ;c') return end
--     local result=exports["crime_database"]:dbGet("SELECT * FROM crime_informations WHERE id=?", 1)
--     if result and #result > 0 then
--         local v=result[1]
--         if val > v.podatki then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Bank niema tyle pieniędzy') return end
--         local query=exports["crime_database"]:dbSet("UPDATE crime_informations SET podatki=? WHERE id=?", v.podatki-val,  1)
--         local result=exports["crime_database"]:dbGet("SELECT * FROM crime_informations WHERE id=?", 1)
--         local v=result[1]
--         outputChatBox("Pobrałeś: #FFAA00"..tostring(val).." PLN#FFFFFF podatku, w banku pozostało: #FFAA00"..v.podatki.." PLN",plr,255,255,255,true)
--         givePlayerMoney(plr,val)
--         exports["crime_database"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"PODATEK Z BANKU",val)
--     end
-- end
-- addCommandHandler("ppobierz",ppobierz)