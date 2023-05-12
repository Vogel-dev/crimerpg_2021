--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("hajs", true)
addEventHandler("hajs", root, function(value,value2)
	if not tonumber(value) then return end
	if value > 50000 then return end
	if not getElementData(source,"player:logged") then return end
	local uid = getElementData(source,"player:uid")
	local hajs = getPlayerMoney(source)
	if getElementData(source,"player:premium") then 
		value = value*1.15
		local dostanie = value*0.9
		local podatek = value*0.1
		givePlayerMoney(source,dostanie)

		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_informations WHERE id=1 ")
		if #result > 0 then
			local query=exports["crime_database"]:dbSet("UPDATE crime_informations SET podatki=? WHERE id=?", result[1].podatki+podatek,  1)
		end
		triggerClientEvent(plr, "addNoti", plr, "Otrzymujesz "..dostanie.." PLN wynagrodzenia za pracę.", "premium" )
		exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"CORE",dostanie,hajs,hajs+dostanie)
	else
		value = value
		local dostanie = value*0.9
		local podatek = value*0.1
		givePlayerMoney(source,dostanie)
		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_informations WHERE id=1 ")
		if #result > 0 then
			local query=exports["crime_database"]:dbSet("UPDATE crime_informations SET podatki=? WHERE id=?", result[1].podatki+podatek,  1)
		end
		triggerClientEvent(plr, "addNoti", plr, "Otrzymujesz "..dostanie.." PLN wynagrodzenia za pracę.", "money" )
		exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"CORE",dostanie,hajs,hajs+dostanie)
	end
end)


addEvent("krypto", true)
addEventHandler("krypto", root, function(value,value2)
	if not tonumber(value) then return end
	if value > 500000 then return end
	if not getElementData(source,"player:logged") then return end
	local uid = getElementData(source,"player:uid")
	local hajs = getPlayerMoney(source)
	givePlayerMoney(source,value*1)
	exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"kryptowaluta",value,hajs,hajs+value)
end)

addEvent("napad", true)
addEventHandler("napad", root, function(value)
	if not tonumber(value) then return end
	if value > 500000 then return end
	if not getElementData(source,"player:logged") then return end
	local uid = getElementData(source,"player:uid")
	local hajs = getPlayerMoney(source)
	givePlayerMoney(source,value*1)
	exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"napad",value,hajs,hajs+value)
end)


addEvent("rapss", true)
addEventHandler("rapss", root, function(value,val2,val3,val4)
	local uid = getElementData(source,"player:uid")
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", uid)
	local q1=exports["crime_database"]:dbGet("select * from crime_jobtop where uid=?", tonumber(uid))
	local uzyte=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", uid)
	local rapsj=uzyte[1].rapsy+1
	if not tonumber(value) then return end
	if not getElementData(source,"player:logged") then return end
	local uid = getElementData(source,"player:uid")
	local hajs = getPlayerMoney(source)
	--givePlayerMoney(source,value*1)
	exports["crime_database"]:dbSet("UPDATE crime_users SET rapsy=? WHERE id=?",rapsj,uid)
	exports["crime_database"]:dbSet("insert into crime_raports values (?,?,?,?,?)",uid,getPlayerSerial(source),val2,val3,val4)
	if not q1 or #q1 < 1 then
		exports["crime_database"]:dbSet("insert into crime_jobtop (uid, ilosc) VALUES(?, 1)", uid)
	else
		exports["crime_database"]:dbSet("update crime_jobtop set ilosc = ilosc + 1 where uid=?", uid)
	end
end)


addEvent("takePlayerMoney", true)
addEventHandler("takePlayerMoney", root, function(value)
	if not tonumber(value) then return end
	if not getElementData(source,"player:logged") then return end
	takePlayerMoney(source,value*1)
end)

addEvent("loteriahajs", true)
addEventHandler("loteriahajs", root, function(value)
	if not tonumber(value) then return end
	if not getElementData(source,"player:logged") then return end
	givePlayerMoney(source,value*1)
end)


addCommandHandler("raporty", function(plr,cmd,valju1)
if not valju1 then triggerClientEvent(plr, "addNoti", plr, "Użycie: /raport (id/nick)", "error" ) return end
	local uidu = getElementData(plr,"player:uid")
	local uzyteu=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", valju1)
	local rapsju=uzyteu[1].rapsy
	triggerClientEvent(plr, "addNoti", plr, "Gracz o UID "..valju1.. " zrobił "..rapsju.. " raportów", "info" )
end)

--[[

str="Top 5 administratorow"
local t=createElement("3dtextxd")
setElementData(t,"name",str)
setElementPosition(t,1685.90, -2245.97, 13.55+0.5)

function aktualizujText()
local q=exports["crime_database"]:dbGet("select * from crime_jobtop order by ilosc desc limit 5")
str="Top 5 administratorow"
for i,v in ipairs(q) do
iii=i
local nick=exports["crime_database"]:dbGet("select login from crime_users where id=?", v["uid"])
for i2,v2 in ipairs(nick) do
if i2 < 1 then return end
if v2["login2"] == false then
str=""..str.."\n"..iii..". "..v2["login"].." - "..v["ilosc"].." zrobionych raportow"
else
str=""..str.."\n"..iii..". "..v2["login"].." - "..v["ilosc"].." zrobionych raportow"
end
end
end
setElementData(t, "name", str)
end
setTimer(aktualizujText, 5000, 0)
 ]]--
