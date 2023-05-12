--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

modelname = exports["crime_modelnames"]

przedmioty = {
	"paralizator",
    "ziolo",
    "kokaina",
    "amunicja",
    "rakietnica",
    "ak47",
    "m4",
    "tec",
    "pila",
    "deagle",
    "uzi",
    "mp5",
    "noz",
    "kastet",
    "kij_golf",
    "kij_baseball",
    "palka",
    "snajperka",
    "gasnica",
    "spadochron",
    "cola",
    "woda",
    "kajdanki",
    "kebab",
    "hamburger",
    "kanister",
    "zestaw",
	"zestawdwa",
	"plecak",
	"ziolo_plant",
	"ziolo_donica",
	"ziolo_nawoz1",
	"ziolo_nawoz2",
	"ziolo_nawoz3",
}


function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

-- Settings
function pobierzDate(type,time)

	realTime=getRealTime()
	type=tostring(type)
	time=tonumber(time)
	if time < 0 then return end
	if type == "m" then if time > 59 then return end value1=realTime.minute+time else value1=realTime.minute end
	if type == "h" then if time > 23 then return end value2=realTime.hour+time else value2=realTime.hour end
	if type == "d" then if time > 31 then return end value3=realTime.monthday+time else value3=realTime.monthday end
	if type == "w" then  if time > 11 then return end value4=realTime.month+time else value4=realTime.month end
	if value1 >= 60 then value1 = value1-60; value2=value2+1 end
	if value2 >= 24 then value2 = value2-24; value3=value3+1 end
	if value3 >= 31 then value3 = value3-31; value4=value4+1 end
	date=string.format("%04d-%02d-%02d ", realTime.year+1900, value4+1, value3)
	time=string.format("%02d:%02d:%02d", value2, value1, realTime.second)
	return date..time
end


function wyczyscchatpetlaxd (plr)
if not getElementData(plr,"player:admin") then return end
local nick = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
for i = 1,2500 do
outputChatBox ( " ", root )
end
for i = 1,1 do
triggerClientEvent(plr, "addNoti", plr, "Pomyślnie wyczyściłeś chat.", "success" )
end
for i = 1,2 do
outputChatBox ( " ", root )
end
end
addCommandHandler("cc", wyczyscchatpetlaxd )

--==========================bronie
--[[
addCommandHandler("deagle", function(plr,val1,val2)
if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
if not val1 then outputChatBox("/deagle (UID)", plr, 255, 0, 0) return end
if not val2 then outputChatBox("/deagle (UID)", plr, 255, 0, 0) return end
outputChatBox("Usuneles deagle dla uid " ..val2.. "", plr, 255, 0, 0)
exports["crime_database"]:dbSet("UPDATE crime_users SET deagle=? WHERE id=?",0,val2)
end
end)


addCommandHandler("tec9", function(plr,val1,val2)
if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
if not val1 then outputChatBox("/tec9 (UID)", plr, 255, 0, 0) return end
if not val2 then outputChatBox("/tec9 (UID)", plr, 255, 0, 0) return end
outputChatBox("Usuneles tec9 dla uid " ..val2.. "", plr, 255, 0, 0)
exports["crime_database"]:dbSet("UPDATE crime_users SET tec9=? WHERE id=?",0,val2)
end
end)

]]--
--========================BizoneGMenel

addCommandHandler('cv', function(player, _, model)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) then
		if model then
			if not tonumber(model) then
				model = getVehicleModelFromName(model)
			end

			model = model or 0

			if model == 0 then
				triggerClientEvent(player, "addNoti", player, "Nie znaleziono podanego przez ciebie modelu.", "error" )
				return
			end

			local x,y,z = getElementPosition(player)
			local dim, int = getElementDimension(player), getElementInterior(player)
			local v = createVehicle(model, x, y, z)
			local car = getVehicleNameFromID(model)
			setElementData(v, 'admin:vehicle', true)
			setElementInterior(v, int)
			setElementDimension(v, dim)
			warpPedIntoVehicle(player, v)
			setVehicleColor(v, 255, 255, 255)
			setVehiclePlateText(v, 'SPAWNED')
			triggerClientEvent(player, "addNoti", player, "Pomyślnie zespawnowałeś pojazd: ("..model..") "..car..".", "success" )
		else
			triggerClientEvent(player, "addNoti", player, "Użycie: /cv <model/id>", "error" )
		end
	end
end)

addCommandHandler('tppos', function(plr, _, x, y, z)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) then
		if x and y and z then
			x, y, z = tonumber(x) or 0, tonumber(y) or 0, tonumber(z) or 0
			setElementPosition(plr, x, y, z)
			triggerClientEvent(plr, "addNoti", plr, "Pomyślnie teleportowałeś się na koordynaty: "..x.." "..y.." "..z.."", "success" )
		else
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /tppos <x> <y> <z>", "error" )
		end
	end
end)

addCommandHandler("sskin", function(plr,cmd,cel, id)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) then
		if not cel or not id then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /setskin <id/nick> <id skina>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		local uid=getElementData(target,"player:uid")
		exports["crime_database"]:dbSet("UPDATE crime_users SET skin=? WHERE id=? LIMIT 1",id,uid)
		setPedSkin(target,id)
		triggerClientEvent(plr, "addNoti", plr, "Pomyślnie zmieniłeś skin gracza "..removeHex(getPlayerName(target)).." na id "..id..".", "success" )
	end
end)


addCommandHandler("dmoff", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /dmoff <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
        toggleControl(target,"fire", false )
        toggleControl(target,"aim_weapon", false)
        toggleControl(target,"vehicle_fire", false)
        toggleControl(target,"vehicle_secondary_fire", false)
		toggleControl(target,"action", false)
		triggerClientEvent(plr, "addNoti", plr, "Wyłączyłeś DM graczu "..removeHex(getPlayerName( target ))..".", "success" )
		triggerClientEvent(target, "addNoti", target, "Wyłączono ci DM.", "info" )
	end
end)

addCommandHandler("dmon", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /dmon <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
        toggleControl(target,"fire", true )
        toggleControl(target,"aim_weapon", true)
        toggleControl(target,"vehicle_fire", true)
        toggleControl(target,"vehicle_secondary_fire", true)
        toggleControl(target,"action", true)
        triggerClientEvent(plr, "addNoti", plr, "Włączyłeś DM graczu "..removeHex(getPlayerName( target ))..".", "success" )
		triggerClientEvent(target, "addNoti", target, "Włączono ci DM.", "info" )
	end
end)

addCommandHandler("endjob", function(plr,cmd,cel, typ)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not cel or not typ then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /endjob <id/nick> <typ>", "error" )
			return
		end
		if typ == "false" then typ = false end
		if typ == "true" then typ = true end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
        setElementData(plr,"player:pracadorywczna", typ)
	end
end)
--[[
addCommandHandler("fadd", function(plr,val1,val2,val3,val4)
if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
if not val1 or not val2 or not val3 or not val4 then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', '/fadd FRAKCJA UID RANGA') return end
exports["crime_database"]:dbSet("INSERT INTO crime_factions (code, uid, actived, rank) VALUES (?,?,?,?)", val2, val3, 2017-12-25, val4)
triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Dodano!')
end
end)


addCommandHandler("fdelete", function(plr,val1,val2)
if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
if not val1 or not val2 then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', '/fdelete UID') return end
exports["crime_database"]:dbSet("DELETE FROM crime_factions WHERE uid=?",val2)
triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Usunięto!')
end
end)
]]--
--==================koniecbizonamenela
--[[
function orgia(plr,val1,val2,val3,val4)
if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
if not val1 or not val2 or not val3 or not val4 then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', '/oadd NAZWA NICK-LIDERA UID-LIDERA') return end
exports["crime_database"]:dbSet("INSERT INTO sg_organizacje (code, login, uid, actived, rank) VALUES (?,?,?,?,?)", val2, val3,val4,2017-12-25,4)
triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Dodano!')
end
end
addCommandHandler("oadd", orgia)
]]--
addEventHandler("onPlayerCommand",root, function(command)
	if command == "say" or command == "pm" or command == "ogranicznikxdd" or command == "pay" or command == "przelej" or command == "zaplac" or command == "przelew" then return end
	local id=getElementData(source,"id")
	local desc = string.format("Komenda> %s(%d): /%s",getPlayerName(source),id,command)
	triggerEvent("admin:addText", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""),math.random(0,99))
end)


addCommandHandler('offchat', function(plr,cmd, ...)
if not ... then
if not getElementData(plr,"player:admin") then return end
	local x = getElementData(plr,"player:ekipaoff")
	if x == true then
		triggerClientEvent(plr, "addNoti", plr, "Włączyłeś chat administracyjny.", "info" )
		setElementData(plr,"player:ekipaoff",false)
	else
		triggerClientEvent(plr, "addNoti", plr, "Wyłączyłeś chat administracyjny.", "info" )
		setElementData(plr,"player:ekipaoff",true)
	end
	end
end)

addCommandHandler('narzedzia', function(plr,cmd, ...)
	if not ... then
		if not getElementData(plr,"player:admin") then return end
		local x = getElementData(plr,"player:szuszioff")
		if x == true then
			triggerClientEvent(plr, "addNoti", plr, "Włączyłeś narzędzia administracyjne.", "info" )
			setElementData(plr,"player:szuszioff",false)
		else
			triggerClientEvent(plr, "addNoti", plr, "Wyłączyłes narzędzia administracyjne.", "info" )
			setElementData(plr,"player:szuszioff",true)
		end
	end
end)


addCommandHandler('offraporty', function(plr,cmd, ...)
if not ... then
if not getElementData(plr,"player:admin") then return end
	local x = getElementData(plr,"admin:rapsy")
	if x == true then
		triggerClientEvent(plr, "addNoti", plr, "Włączyłeś raporty serwerowe.", "info" )
		setElementData(plr,"admin:rapsy",false)
	else
		triggerClientEvent(plr, "addNoti", plr, "Wyłączyłeś raporty serwerowe.", "info" )
		setElementData(plr,"admin:rapsy",true)
	end
	end
end)

addCommandHandler('god', function(plr,cmd, ...)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr, 3) then
	if not getElementData(plr,"player:admin") then return end
		local x = getElementData(plr,"admin:god")
		if x == false then
			triggerClientEvent(plr, "addNoti", plr, "Włączyłeś tryb nieśmiertelności.", "info" )
			setElementData(plr,"admin:god",true)
		else
			triggerClientEvent(plr, "addNoti", plr, "Wyłączyłeś tryb nieśmiertelności.", "info" )
			setElementData(plr,"admin:god",false)
		end
		end
	end)

addCommandHandler("dv", function(plr,cmd)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		local veh=getPedOccupiedVehicle(plr)
		if not veh then
			triggerClientEvent(plr, "addNoti", plr, "Wejdź do pojazdu.", "info" )
			return
		end
		destroyElement(veh)
		triggerClientEvent(plr, "addNoti", plr, "Usunąłeś pojazd.", "info" )
	end
end)

addCommandHandler("up", function(plr, cmd, value)
	if getAdmin(plr) then
        if (tonumber(value)==nil) then
            --outputChatBox("Użyj: /up <ile>", plr)
            return
        end

        local e = plr
        if (isPedInVehicle(plr)) then
            e = getPedOccupiedVehicle(plr)
        end

        local x,y,z = getElementPosition(e)
        setElementPosition(e, x, y, z+tonumber(value))
    end
end)

addCommandHandler("thru", function(plr, cmd, value)
	if getAdmin(plr) then
        if (tonumber(value)==nil) then
            --outputChatBox("Użyj: /thru <ile>", plr)
            return
        end

        local e = plr
        if getCameraTarget(plr) ~= plr then
            e = getCameraTarget(plr)
        end

        if (isPedInVehicle(plr)) then
            e = getPedOccupiedVehicle(e)
        end
		
        local x,y,z = getElementPosition(e)
        local _,_,rz = getElementRotation(e)
        local rrz = math.rad(rz)
        local x = x + (value * math.sin(-rrz))
        local y = y + (value * math.cos(-rrz))
        setElementPosition(e, x, y, z)
    end
end)

addCommandHandler("daj.bron", function(plr,cmd,cel,bron,amunicja)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr, 4) then
		if not cel or not bron then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /daj.bron <nick/ID> <id broni> <amunicja>", "error" )
			return
		end
		if not tonumber(bron) then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /daj.bron <nick/ID> <id broni> <amunicja>", "error" )
			return
		end
		if not amunicja then local amunicja = 10 end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		if giveWeapon(target,bron,amunicja,true) then
			triggerClientEvent(plr, "addNoti", plr, "Nadałeś broń.", "info" )
			triggerClientEvent(target, "addNoti", target, "Otrzymałeś broń.", "info" )
		else
			triggerClientEvent(plr, "addNoti", plr, "Złe id broni.", "error" )
		end
	end
end)

addCommandHandler("schowaj.all", function(plr)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr, 4) then
		triggerClientEvent(root, "addNoti", root, "Wszystkie pojazdy zostały schowane do przechowalni.", "info" )
	for i,v in ipairs(getElementsByType("vehicle")) do
		if getElementData(v, "vehicle:id") then
	local query = exports['crime_database']:dbSet("UPDATE crime_vehicles SET parking=1")
	exports["crime_vehicles"]:onSaveVehicle(v)
	destroyElement(v)
end
	end
end
end)

addCommandHandler("schowaj", function(plr,cmd,id)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr, 4) or getAdmin(plr, 3) or getAdmin(plr, 2) then
		sad = false
		if not id then triggerClientEvent(plr, "addNoti", plr, "Nie wpisałeś id pojazdu.", "error" ) return end
		for i,v in pairs(getElementsByType("vehicle")) do 
			if getElementData(v,"vehicle:id") == tonumber(id) then 
				triggerClientEvent(plr, "addNoti", plr, "Schowałeś pojazd o id: "..id.." do przechowalni.", "success" )
				local query = exports["crime_database"]:dbSet("UPDATE crime_vehicles SET parking = 1 WHERE id = ?", id)
				exports["crime_vehicles"]:onSaveVehicle(v)
				destroyElement(v)
				sad = true 
			end
		end
		if sad == false then 
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono pojazdu na mapie.", "error" )
		end
	end
end)

addCommandHandler("wyciagnij", function(plr,cmd,id)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr, 4) then
		if not id then triggerClientEvent(plr, "addNoti", plr, "Nie wpisałeś id pojazdu.", "error" ) return end
		triggerClientEvent(plr, "addNoti", plr, "Wyciągnąłeś pojazd o id: "..id.." z przechowalni.", "success" )
		local nick = getPlayerName(plr)
		local x,y,z = getElementPosition(plr)
		local rx,ry,rz = getElementRotation(plr)
		triggerEvent("onParkingVehicleSpawn", plr, id, nick, x,y,z,rx,ry,rz)
	end
end)

addCommandHandler("wyplaty", function(plr,cmd,id)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		for i,v in pairs(getElementsByType("player")) do 
			if getElementData(v,"player:admin") then 
				local uid = getElementData(v,"player:uid")
				local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", uid)
				local rapsy=result[1].rapsy
				exports["crime_database"]:dbSet("UPDATE crime_users SET rapsy = 0 WHERE id = ?", uid)
				local wyplata = rapsy*3000
				givePlayerMoney(v,wyplata)
				triggerClientEvent(v, "addNoti", v, "Otrzymałeś "..wyplata.." PLN za wykonane raporty.", "info" )
			end
		end
	end
end)

addCommandHandler("infouid", function(plr,cmd,nick)
	if getAdmin(plr,6) or getAdmin(plr, 5) or getAdmin(plr, 4) then
		if not nick then triggerClientEvent(plr, "addNoti", plr, "Nie wpisałeś UID.", "error" ) return end 
		local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", nick)
		if #result <= 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
		end
		if #result > 0 then
			v = result[1]
			outputChatBox("UID: #5a3795"..v.id,plr,255,255,255,true)
			outputChatBox("Nick: #5a3795"..v.login,plr,255,255,255,true)
			outputChatBox("E-Mail: #5a3795"..v.email,plr,255,255,255,true)
			outputChatBox("Kasa: #5a3795"..v.money,plr,255,255,255,true)
			outputChatBox("Bankomat: #5a3795"..v.bank_money,plr,255,255,255,true)
			outputChatBox("Skin: #5a3795"..v.skin,plr,255,255,255,true)
			outputChatBox("Level: #5a3795"..v.level,plr,255,255,255,true)
			outputChatBox("Exp: #5a3795"..v.exp,plr,255,255,255,true)
			outputChatBox("Prawko A: #5a3795"..v.pjA,plr,255,255,255,true)
			outputChatBox("Prawko B: #5a3795"..v.pjB,plr,255,255,255,true)
			outputChatBox("Prawo C: #5a3795"..v.pjC,plr,255,255,255,true)
			outputChatBox("Minuty: #5a3795"..v.hours,plr,255,255,255,true)
			outputChatBox("Data rejestracji: #5a3795"..v.registered,plr,255,255,255,true)
			outputChatBox("Serial: #5a3795"..v.register_serial,plr,255,255,255,true)
			outputChatBox("Premium do: #5a3795"..v.premiumdate,plr,255,255,255,true)
			outputChatBox("Raporty (adm): #5a3795"..v.rapsy,plr,255,255,255,true)
			outputChatBox("Punkty Premium: #5a3795"..v.ppoints,plr,255,255,255,true)
			outputChatBox("Zgony: #5a3795"..v.zgony,plr,255,255,255,true)
			outputChatBox("Kille: #5a3795"..v.kille,plr,255,255,255,true)
			outputChatBox("Nick: #5a3795"..v.nick,plr,255,255,255,true)
			outputChatBox("Umiejętność strzelania (255 - najsłabsza): #5a3795"..v.strzelec,plr,255,255,255,true)
			outputChatBox("Styl walki: #5a3795"..v.stylwalki,plr,255,255,255,true)
			outputChatBox("Organizacja: #5a3795"..v.org,plr,255,255,255,true)
			outputChatBox("Wpłaty na organizacje: #5a3795"..v.orgwplaty,plr,255,255,255,true)
			outputChatBox("Pojazdy gracza:",plr,255,255,255,true)
			outputChatBox(" ",plr,255,255,255,true)

			local resultd = exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", v.id)
			if #resultd > 0 then
				for i,v in pairs(resultd) do 
					vd = resultd[i]
					local sad = 0
					--[[outputChatBox("ID: #5a3795"..vd.id.." #ccccccModel: #5a3795"..vd.model.." #ccccccPrzebieg: #5a3795"..vd.mileage.." #ccccccOrganizacja: #5a3795"..vd.ownedGroup.." #ccccccPierwszy właściciel: #5a3795"..vd.firstowner.." #ccccccMaskowanie: #5a3795"..vd.zamaskowany.." #ccccccNeony (1-stałe 2-migające): #5a3795"..vd.neon.." #ccccccNapęd: #5a3795"..vd.naped.." #ccccccLambodoors: #5a3795"..vd.drzwidogory,plr,255,255,255,true)
					outputChatBox("#ccccccAtrapa: #5a3795"..vd.atrapa.." #ccccccSilnik: #5a3795"..vd.silnik.." #ccccccTarcze: #5a3795"..vd.tarcze.." #ccccccZawieszenie: #5a3795"..vd.zawieszenie.." #ccccccKarbon: #5a3795"..vd.karbon.." #ccccccChiptuning: #5a3795"..vd.chiptuning.." #ccccccKlakson: #5a3795"..vd.klakson.." #ccccccTyp silnika: #5a3795"..vd.typsilnika.." #ccccccCylindry: #5a3795"..vd.cylindry,plr,255,255,255,true)
					outputChatBox("#ccccccTrakcja: #5a3795"..vd.trakcja.." #ccccccLPG: #5a3795"..vd.lpg.." #ccccccUS1: #5a3795"..vd.us1.." #ccccccUS2: #5a3795"..vd.us2.." #ccccccUS3: #5a3795"..vd.us3.." #cccccc1 na serwerze: #5a3795"..sad.."",plr,255,255,255,true)
					]]--
					local model = getVehicleNameFromModel(vd.model)
					model = modelname:getText(model)

					outputChatBox("ID: #5a3795"..vd.id.." #ccccccModel: #5a3795"..model.." #ccccccSilnik: #5a3795"..string.format("%.1f", vd.silnik).." #ccccccCylindry: #5a3795"..vd.cylindry,plr,255,255,255,true)
				end
			end
		end
	end
end)

addCommandHandler("infonick", function(plr,cmd,nick)
	if getAdmin(plr,6) or getAdmin(plr, 5) or getAdmin(plr, 4) then
		if not nick then triggerClientEvent(plr, "addNoti", plr, "Nie wpisałeś nicku.", "error" ) return end 
		local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=?", nick)
		if #result <= 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
		end
		if #result > 0 then
			v = result[1]
			outputChatBox("UID: #5a3795"..v.id,plr,255,255,255,true)
			outputChatBox("Nick: #5a3795"..v.login,plr,255,255,255,true)
			outputChatBox("E-Mail: #5a3795"..v.email,plr,255,255,255,true)
			outputChatBox("Kasa: #5a3795"..v.money,plr,255,255,255,true)
			outputChatBox("Bankomat: #5a3795"..v.bank_money,plr,255,255,255,true)
			outputChatBox("Skin: #5a3795"..v.skin,plr,255,255,255,true)
			outputChatBox("Level: #5a3795"..v.level,plr,255,255,255,true)
			outputChatBox("Exp: #5a3795"..v.exp,plr,255,255,255,true)
			outputChatBox("Prawko A: #5a3795"..v.pjA,plr,255,255,255,true)
			outputChatBox("Prawko B: #5a3795"..v.pjB,plr,255,255,255,true)
			outputChatBox("Prawo C: #5a3795"..v.pjC,plr,255,255,255,true)
			outputChatBox("Minuty: #5a3795"..v.hours,plr,255,255,255,true)
			outputChatBox("Data rejestracji: #5a3795"..v.registered,plr,255,255,255,true)
			outputChatBox("Serial: #5a3795"..v.register_serial,plr,255,255,255,true)
			outputChatBox("Premium do: #5a3795"..v.premiumdate,plr,255,255,255,true)
			outputChatBox("Raporty (adm): #5a3795"..v.rapsy,plr,255,255,255,true)
			outputChatBox("Punkty Premium: #5a3795"..v.ppoints,plr,255,255,255,true)
			outputChatBox("Zgony: #5a3795"..v.zgony,plr,255,255,255,true)
			outputChatBox("Kille: #5a3795"..v.kille,plr,255,255,255,true)
			outputChatBox("Nick: #5a3795"..v.nick,plr,255,255,255,true)
			outputChatBox("Umiejętność strzelania (255 - najsłabsza): #5a3795"..v.strzelec,plr,255,255,255,true)
			outputChatBox("Styl walki: #5a3795"..v.stylwalki,plr,255,255,255,true)
			outputChatBox("Organizacja: #5a3795"..v.org,plr,255,255,255,true)
			outputChatBox("Wpłaty na organizacje: #5a3795"..v.orgwplaty,plr,255,255,255,true)
			outputChatBox("Pojazdy gracza:",plr,255,255,255,true)
			outputChatBox(" ",plr,255,255,255,true)

			local resultd = exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", v.id)
			if #resultd > 0 then
				for i,v in pairs(resultd) do 
					vd = resultd[i]
					local sad = 0
					--[[outputChatBox("ID: #5a3795"..vd.id.." #ccccccModel: #5a3795"..vd.model.." #ccccccPrzebieg: #5a3795"..vd.mileage.." #ccccccOrganizacja: #5a3795"..vd.ownedGroup.." #ccccccPierwszy właściciel: #5a3795"..vd.firstowner.." #ccccccMaskowanie: #5a3795"..vd.zamaskowany.." #ccccccNeony (1-stałe 2-migające): #5a3795"..vd.neon.." #ccccccNapęd: #5a3795"..vd.naped.." #ccccccLambodoors: #5a3795"..vd.drzwidogory,plr,255,255,255,true)
					outputChatBox("#ccccccAtrapa: #5a3795"..vd.atrapa.." #ccccccSilnik: #5a3795"..vd.silnik.." #ccccccTarcze: #5a3795"..vd.tarcze.." #ccccccZawieszenie: #5a3795"..vd.zawieszenie.." #ccccccKarbon: #5a3795"..vd.karbon.." #ccccccChiptuning: #5a3795"..vd.chiptuning.." #ccccccKlakson: #5a3795"..vd.klakson.." #ccccccTyp silnika: #5a3795"..vd.typsilnika.." #ccccccCylindry: #5a3795"..vd.cylindry,plr,255,255,255,true)
					outputChatBox("#ccccccTrakcja: #5a3795"..vd.trakcja.." #ccccccLPG: #5a3795"..vd.lpg.." #ccccccUS1: #5a3795"..vd.us1.." #ccccccUS2: #5a3795"..vd.us2.." #ccccccUS3: #5a3795"..vd.us3.." #cccccc1 na serwerze: #5a3795"..sad.."",plr,255,255,255,true)
					]]--
					local model = getVehicleNameFromModel(vd.model)
					model = modelname:getText(model)
					outputChatBox("ID: #5a3795"..vd.id.." #ccccccModel: #5a3795"..model.." #ccccccSilnik: #5a3795"..string.format("%.1f", vd.silnik).." #ccccccCylindry: #5a3795"..vd.cylindry,plr,255,255,255,true)
				end
			end
		end
	end
end)

addCommandHandler('fix.all', function(plr)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		triggerClientEvent(plr, "addNoti", plr, "Wszystkie pojazdy zostały naprawione.", "info" )
	for _,v in ipairs(getElementsByType("vehicle")) do 
	fixVehicle(v)
	end
	end
	end)

addCommandHandler('e', function(plr,cmd, ...)
local name = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
	local ranga = test
	local msg=table.concat({...}, " ")
 	if (getAdmin(plr,6)) then
		ranga = "#CA43FFProgramista"
	end
  	if (getAdmin(plr,5)) then
		ranga = "#CA43FFProgramista"
    end
    if (getAdmin(plr,4)) then
		ranga = "#ff0000Administartor"
	end
  	if (getAdmin(plr,3)) then
		ranga = "#3399ffModerator"
	end
  	if (getAdmin(plr,2)) then
		ranga = "#33cc99Support"
	end
  	if (getAdmin(plr,1)) then
		ranga = "#2BFFB4Trial Support"
	end

	for _, p in pairs(getElementsByType('player')) do
	if getAdmin(p) and not getElementData(p,"player:ekipaoff") then
		if not getAdmin(p) then return end
		    if getElementData(plr,"zamaskowany") then
			--outputChatBox("#FF0C00AC> #cccccc("..getElementData(plr,"id")..") #FF0C00"..name.." (MASKA) #cccccc(#cccccc"..ranga.."#cccccc) #FF0C00:#cccccc "..msg.."",p,60,172,120,true)		
			else
			outputChatBox("#5a3795E> #cccccc"..name.." #cccccc("..getElementData(plr,"id").."#cccccc) ["..ranga.."#cccccc] #5a3795:#cccccc "..msg.."",p,150, 150, 150,true)
            end			
		end
	end
end
end)

-- Teksty

addCommandHandler("global", function(plr,cmd,...)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr, 2) then
		local text=table.concat({...}, " ")
		outputChatBox("#ccccccGLOBAL> #cccccc"..getPlayerName(plr).."#cccccc: "..text,root,255,255,255,true)
	end
end)

addCommandHandler("rcb", function(plr,cmd,...)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		local text=table.concat({...}, " ")
		outputChatBox("#FF0000ALERT RCB: #cccccc"..text,root,255,255,255,true)
	end
end)

addCommandHandler("unbw", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr, 2) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /unbw <id/nick>.", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		triggerClientEvent(target,"player:unbw",root)
	end
end)

addCommandHandler("dajkase", function(plr,cmd,cel,value)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not cel or not tonumber(value) then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /dajkase <id/nick> <ilość>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		givePlayerMoney(target, value)
		triggerClientEvent(plr, "addNoti", plr, "Dodałeś "..value.." PLN", "info" )
		triggerClientEvent(plr, "addNoti", plr, "Otrzymałeś "..value.." PLN", "info" )
	end
end)

addCommandHandler("dajpp", function(plr,cmd,cel,value)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not cel or not tonumber(value) then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /dajpp <id/nick> <ilość>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
        local premp = getElementData(target,"ppoints") or 0 
        setElementData(target,"ppoints",premp+value)
		triggerClientEvent(plr, "addNoti", plr, "Dodałeś "..value.." punktów premium.", "info" )
		triggerClientEvent(plr, "addNoti", plr, "Otrzymałeś "..value.." punktów premium.", "info" )
	end
end)

addCommandHandler("item", function(plr,cmd,cel,value,value2)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not cel or not value or not tonumber(value2) then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /item <id/nick> <przedmiot> <ilość>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end

		triggerEvent("server:additem",target,value,value2)
		
		triggerClientEvent(plr, "addNoti", plr, "Dałeś "..value2.."x"..value.." dla "..removeHex(getPlayerName(target)).."", "info" )
		triggerClientEvent(target, "addNoti", target, "Otrzymałeś "..value2.." przedmiotów od "..removeHex(getPlayerName(plr)).."", "info" )
	end

end)

addCommandHandler("itemall", function(plr,cmd,value,value2)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not value or not tonumber(value2) then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /itemall <przedmiot> <ilość>", "error" )
			return
		end
		for i,v in pairs(getElementsByType("player")) do 
			triggerEvent("server:additem",v,value,value2)
		end
		
		triggerClientEvent(plr, "addNoti", plr, "Dałeś "..value2.."x"..value.." dla wszystkich.", "info" )
	end
end)

addCommandHandler("itemy", function(plr,cmd)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		for i,v in pairs(przedmioty) do 
			outputChatBox("#5a3795"..i.." #cccccc- "..v,plr,255,255,255,true)
		end
	end
end)

addCommandHandler("dajexp", function(plr,cmd,cel,value)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not cel or not tonumber(value) then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /dajexp <id/nick> <ilość>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
        local premp = getElementData(target,"player:exp") or 0 
		setElementData(target,"player:exp",premp+value)
		triggerClientEvent(plr, "addNoti", plr, "Nadałeś "..value.." exp.", "info" )
		triggerClientEvent(target, "addNoti", target, "Dostałeś "..value.." exp.", "info" )
	end

end)

addCommandHandler("freez", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /freez <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		setElementFrozen(target,true)
		triggerClientEvent(plr, "addNoti", plr, "Zamroziłeś gracza.", "info" )
		triggerClientEvent(target, "addNoti", target, "Zostałeś zamrożony przez administrację.", "info" )
	end
end)

addCommandHandler("unfreez", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /unfreez <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		setElementFrozen(target,false)
		triggerClientEvent(plr, "addNoti", plr, "Odmroziłeś gracza.", "info" )
		triggerClientEvent(target, "addNoti", target, "Zostałeś odmrożony przez administrację.", "info" )
	end
end)

addCommandHandler("dajlvl", function(plr,cmd,cel,value)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not cel or not tonumber(value) then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /dajlvl <id/nick> <ilość>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
        local premp = getElementData(target,"player:lvl") or 0 
		setElementData(target,"player:lvl",premp+value)
		triggerClientEvent(plr, "addNoti", plr, "Nadałeś "..value.." lvl.", "info" )
		triggerClientEvent(target, "addNoti", target, "Dostałeś "..value.." lvl.", "info" )
	end

end)

-- Komendy adminów


addCommandHandler("jp", function(plr,cmd)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if isPedInVehicle(plr) then
			removePedFromVehicle(plr)
		end
		if doesPedHaveJetPack(plr) then
			removePedJetPack(plr)
		else
			givePedJetPack(plr)
		end
	end
end)

addCommandHandler("flip", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /flip <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		local veh=getPedOccupiedVehicle(target)
		if not veh then
			triggerClientEvent(plr, "addNoti", plr, "Gracz nie znajduje sie w pojeździe", "error" )
			return
		end
		local x,y,z = getElementRotation(veh)
		setElementRotation(veh, 0,0,z)
		triggerClientEvent(plr, "addNoti", plr, "Obróciłeś pojazd.", "info" )
	end

end)
--OBRACANIE POJAZDU



addCommandHandler("wycisz", function(plr,cmd,cel,x,bantype,...)
	if  getAdmin(plr,2) or getAdmin(plr,3) or getAdmin(plr,4) or getAdmin(plr,5) or getAdmin(plr,6) then
		local reason=table.concat({...}, " ")
		if not cel or not tonumber(x) or not bantype or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /wycisz <id/nick> <ile> <jednostka> <powód>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Nie znaleziono podanego gracza!')
			return
		end
		if (getAdmin(plr,6) == false) and getAdmin(target,6) then return end
		reason = reason..""
		if bantype=="m" or bantype=="h" or bantype=="d" then
		if bantype=="m" then
		exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? minute,?,?,?)", getPlayerSerial(target),reason, x, "mute",getPlayerName(plr),getPlayerName(target))
		end
		if bantype=="h" then
		exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? hour,?,?,?)", getPlayerSerial(target),reason, x, "mute",getPlayerName(plr),getPlayerName(target))
		end
		if bantype=="d" then
		exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? day,?,?,?)", getPlayerSerial(target),reason, x, "mute",getPlayerName(plr),getPlayerName(target))
		end
		end
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",removeHex(getPlayerName(target)), "#5a3795MUTE >#cccccc "..removeHex(reason))
		triggerClientEvent(root, "admin:rendering", root, "Gracz "..getPlayerName(target).." został wyciszony przez "..getPlayerName(plr)..", powód: "..reason.." ("..x .. bantype..")")
	end

end)

addCommandHandler("odcisz", function(plr,cmd,cel)
	if  getAdmin(plr,2) or getAdmin(plr,3) or getAdmin(plr,4) or getAdmin(plr,5) or getAdmin(plr,6) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /odcisz <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Nie znaleziono podanego gracza!')
			return
		end
		local query=string.format("SELECT * FROM crime_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","mute", getPlayerSerial(target))
		local result=exports["crime_database"]:pobierzWyniki(query)
		if (result) then
			exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "mute", getPlayerSerial(target))
			triggerClientEvent(root, "admin:rendering", root, "Gracz "..getPlayerName(target).." został odciszony przez "..getPlayerName(plr).."")
			triggerClientEvent(target, "addNoti", target, "Zostałeś odciszony.", "info" )
		else
			triggerClientEvent(plr, "addNoti", plr, "Ten gracz nie posiada mute", "error" )
		end
	end
end)
addCommandHandler("reload", function(plr,cmd,cel,...)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		local reason=table.concat({...}, " ")
		if not cel or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /reload <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		triggerEvent("save:player",root,target)
		triggerEvent("load:player",root,target)
		triggerClientEvent(plr, "addNoti", plr, "Przeładowano gracza.", "success" )
	end
end)

addCommandHandler("wczytaj", function(plr,cmd,cel,...)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		local reason=table.concat({...}, " ")
		if not cel or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /wczytaj <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		triggerEvent("load:player",root,target)
		triggerClientEvent(plr, "addNoti", plr, "Wczytano gracza.", "success" )
	end
end)

addCommandHandler("zapisz", function(plr,cmd,cel,...)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		local reason=table.concat({...}, " ")
		if not cel or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /zapisz <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		triggerEvent("save:player",root,target)
		triggerClientEvent(plr, "addNoti", plr, "Zapisano gracza.", "success" )
	end
end)



addCommandHandler("zapiszall", function(plr,cmd)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		for i,v in ipairs(getElementsByType("player")) do
		if isElement(v) then
		triggerEvent("save:player",root,v)
		end
		end
		triggerClientEvent(plr, "addNoti", plr, "Zapisano wszystkich.", "success" )
	end
end)
addCommandHandler("wczytajall", function(plr,cmd)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		for i,v in ipairs(getElementsByType("player")) do
		if isElement(v) then
		triggerEvent("load:player",root,v)
		end
		end
		triggerClientEvent(plr, "addNoti", plr, "Wczytano wszystkich.", "success" )
	end
end)

addCommandHandler("reloadall", function(plr,cmd)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		for i,v in ipairs(getElementsByType("player")) do
		if isElement(v) then
		triggerEvent("save:player",root,v)
		triggerEvent("load:player",root,v)
		end
		end
		triggerClientEvent(plr, "addNoti", plr, "Przeładowano wszystkich.", "success" )
	end
end)


addCommandHandler("fix", function(plr,cmd,cel)
	if getAdmin(plr,1) or getAdmin(plr,2) or getAdmin(plr,3) or getAdmin(plr,4) or getAdmin(plr,5) or getAdmin(plr,6) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /fix <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		local veh=getPedOccupiedVehicle(target)
		if not veh then
			triggerClientEvent(plr, "addNoti", plr, "Gracz nie znajduje sie w pojeździe.", "error" )
			return
		end
		triggerClientEvent(plr, "addNoti", plr, "Naprawiłeś pojazd.", "info" )
		setElementHealth(veh, 1000)
		fixVehicle(veh)
	end

end)
--NAPRAWA POJAZDU

addCommandHandler("k", function(plr,cmd,cel,...)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		local reason=table.concat({...}, " ")
		if not cel or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /k <id/nick> <powód>", "error" )
			return
		end
        local target=exports["crime_core"]:findPlayer(plr,cel)
        
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
        end
        if getAdmin(target,6) then triggerClientEvent(plr, "addNoti", plr, "Nie możesz wyrzucić tej osoby.", "error" ) return end
		triggerClientEvent(root, "admin:rendering", root, ""..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." został(a) wyrzucony(a) przez "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." z powodu: "..reason.."")
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",removeHex(getPlayerName(target)), "#5a3795KICK >#cccccc "..removeHex(reason))
		kickPlayer(target, plr, reason)
	end
end)


addCommandHandler("tt", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /tt <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		if isPedInVehicle(plr) then
			removePedFromVehicle(plr)
		end
		local x,y,z=getElementPosition(target)
		setElementInterior(plr,getElementInterior(target))
		setElementDimension(plr,getElementDimension(target))
		setElementPosition(plr,x+math.random(1,2),y+math.random(1,2),z)
	end
end)

addCommandHandler("th", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /th <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		if isPedInVehicle(target) then
			removePedFromVehicle(target)
		end
		local x,y,z=getElementPosition(plr)
		setElementInterior(target,getElementInterior(plr))
		setElementDimension(target,getElementDimension(plr))
		setElementPosition(target,x+math.random(1,2),y+math.random(1,2),z)
	end
end)

addCommandHandler("warn", function(plr,cmd,cel, ...)
    if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then triggerClientEvent(plr, "addNoti", plr, "Użycie: /warn <id/nick> <powód>", "error" ) return end
		local target=exports["crime_core"]:findPlayer(plr,cel)
        if (not target) then
            triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
            return
        end
		local nadaje = getPlayerName(plr)
        local tresc = table.concat(arg, " ")
        if (string.len(tresc)<=1) then
            triggerClientEvent(plr, "addNoti", plr, "Użycie: /warn <id/nick> <powód>", "error" )
            return
        end
        triggerClientEvent("onPlayerWarningReceived", target, tresc, nadaje)
		triggerClientEvent(root, "admin:rendering", root, ""..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." otrzymał(a) ostrzeżenie od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","")..", powód: "..tresc.."")
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",removeHex(getPlayerName(target)), "#5a3795WARN >#cccccc "..removeHex(tresc))

    end
end)

addCommandHandler("swarn", function(plr,cmd,cel, ...)
    if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
		if not cel then triggerClientEvent(plr, "addNoti", plr, "Użycie: /swarn <id/nick> <powód>", "error" ) return end
		local target=exports["crime_core"]:findPlayer(plr,cel)
        if (not target) then
            triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
            return
        end
		local nadaje = getPlayerName(plr)
        local tresc = table.concat(arg, " ")
        if (string.len(tresc)<=1) then
            triggerClientEvent(plr, "addNoti", plr, "Użycie: /swarn <id/nick> <powód>", "error" )
            return
        end
        triggerClientEvent("onPlayerWarningReceived", target, tresc, nadaje)

    end
end)

addCommandHandler("zpj", function(plr,cmd,cel,time,rodzaj,...)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) then
		local reason = table.concat({...}, " ")
		if not cel or not tonumber(time) or not rodzaj or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /zpj <id/nick> <ile> <jednostka> <powód>", "error" )
			return
		end
		local target = exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		local v = getPedOccupiedVehicle(target)
		local query = string.format("SELECT * FROM crime_punish WHERE type = %q AND active = 1 AND serial = %q AND time>NOW() LIMIT 1","prawko", getPlayerSerial(target))
		local result = exports["crime_database"]:pobierzWyniki(query)
		if (result) then
			return triggerClientEvent(plr, "addNoti", plr, "Ten gracza posiada już zawieszone prawo jazdy.", "error" )
		else
			exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type = ? AND active = 1 AND serial = ?", "prawko", getPlayerSerial(plr))
		end
		if isPedInVehicle(target) then
            if not getElementData(v, "vehicle:duty") then
                local vid = getElementData(v,"vehicle:id")
				removePedFromVehicle(target)
				exports["crime_database"]:dbSet("UPDATE crime_vehicles SET parking = 1,tp_to_parking = ? WHERE id = ?","ZPJ", vid)
				exports["crime_vehicles"]:onSaveVehicle(v)
				destroyElement(v)
			else
				removePedFromVehicle(target)
				respawnVehicle(v)
			end
		end
		if tonumber(time) <= 0 then return end
		reason = reason..""
		if rodzaj == "m" then
		exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? minute,?,?,?)", getPlayerSerial(target),reason, time, "prawko",getPlayerName(plr),getPlayerName(target))
		elseif rodzaj == "h" then
		exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? hour,?,?,?)", getPlayerSerial(target),reason, time, "prawko",getPlayerName(plr),getPlayerName(target))
		elseif rodzaj == "d" then
		exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? day,?,?,?)", getPlayerSerial(target),reason, time, "prawko",getPlayerName(plr),getPlayerName(target))
		elseif rodzaj == "w" then
		exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? week,?,?,?)", getPlayerSerial(target),reason, time, "prawko",getPlayerName(plr),getPlayerName(target))
		end
		triggerClientEvent(root, "admin:rendering", root, "Gracz "..getPlayerName(target).." otrzymał zakaz prowadzenia pojazdów (A,B,C) od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." za: "..reason.." ("..time .. rodzaj..")")
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",removeHex(getPlayerName(target)), "#5a3795PRAWKO >#cccccc "..removeHex(reason))

	end
end)


addCommandHandler("opj", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /opj <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		local query=string.format("SELECT * FROM crime_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","prawko", getPlayerSerial(target))
		local query2=string.format("SELECT * FROM crime_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","prawko", getPlayerSerial(target))
		local query3=string.format("SELECT * FROM crime_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","prawko", getPlayerSerial(target))
		local result=exports["crime_database_2"]:pobierzWyniki(query)
		local result2=exports["crime_database_2"]:pobierzWyniki(query2)
		local result3=exports["crime_database_2"]:pobierzWyniki(query3)
		if (result) or (result2) or (result3) then
			exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "prawko", getPlayerSerial(target))
			exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "prawko", getPlayerSerial(target))
			exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "prawko", getPlayerSerial(target))
			triggerClientEvent(plr, "addNoti", plr, "Oddałeś prawo jazdy", "info" )
			triggerClientEvent(target, "addNoti", target, "Odzyskałeś prawo jazdy", "info" )
			triggerClientEvent(root, "admin:rendering", root, "Gracz "..getPlayerName(target).." odzyskał prawo jazdy od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."")
		else
			triggerClientEvent(plr, "addNoti", plr, "Gracz nie posiada zawieszonego prawa jazdy.", "error" )
		end
		--exports["crime_database"]:dbSet("INSERT INTO crime_prawka_logs (komu_oddali,kto_oddal,typ) VALUES (?,?,?)", getPlayerName(target):gsub("#%x%x%x%x%x%x",""), getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), "prawo jazdy")
	end
end)


addCommandHandler("b", function(plr,cmd,cel,x,bantype,...)
	if getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,6) then
		local nickxd = getPlayerName(plr):gsub('#%x%x%x%x%x%x', '')
		local reason = table.concat({...}, " ")
		if not cel or not tonumber(x) or not bantype or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /b <id/nick> <ile> <jednostka> <powód>", "error" )
			return
		end
		local target = exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
        if getAdmin(target,6) then triggerClientEvent(plr, "addNoti", plr, "Nie możesz zbanować tej osoby.", "error" ) return end
		reason = reason.." od: "..nickxd..""
		if bantype == "m" or bantype == "h" or bantype == "d" then
		if bantype == "m" then
		exports["crime_database"]:dbSet("INSERT INTO crime_ban (serial,reason,time,type,nick) VALUES (?,?,NOW() + INTERVAL ? minute,?,?)", getPlayerSerial(target),reason, x, "ban", getPlayerName(target))
		end
		if bantype == "h" then
		exports["crime_database"]:dbSet("INSERT INTO crime_ban (serial,reason,time,type,nick) VALUES (?,?,NOW() + INTERVAL ? hour,?,?)", getPlayerSerial(target),reason, x, "ban", getPlayerName(target))
		end
		if bantype == "d" then
		exports["crime_database"]:dbSet("INSERT INTO crime_ban (serial,reason,time,type,nick) VALUES (?,?,NOW() + INTERVAL ? day,?,?)", getPlayerSerial(target),reason, x, "ban", getPlayerName(target))
		end
		end
		--exports["crime_database"]:dbSet("insert into kartoteka (typ,karajacy,data,powod,ofiara) VALUES(?,?,NOW(),?,?)", "BAN", plr.name:gsub("#%x%x%x%x%x%x",""), reason, getElementData(target, "player:uid"))
		triggerClientEvent(root, "admin:rendering", root, ""..getPlayerName(target).." został(a) zbanowany(a) za: "..reason.." na: "..x.." "..bantype.."")
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",removeHex(getPlayerName(target)), "#5a3795BAN >#cccccc "..removeHex(reason))

		kickPlayer(target,plr,"Zostałeś zbanowany (tempban)!")
	end
end)

addCommandHandler("boffline", function(plr,cmd,cel,x,bantype,...)
	if getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,6) then
		local nickxd = getPlayerName(plr):gsub('#%x%x%x%x%x%x', '')
		local reason = table.concat({...}, " ")
		if not cel or not tonumber(x) or not bantype or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /boffline <id/nick> <ile> <jednostka> <powód>", "error" )
			return
		end
		local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=?", cel)
		if #result <= 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
		return end
		if #result > 0 then
			v = result[1]
			if v.id == 1 then triggerClientEvent(plr, "addNoti", plr, "Nie możesz zbanować tej osoby.", "error" ) return end

			reason = reason.." od: "..nickxd..""
			if bantype == "m" or bantype == "h" or bantype == "d" then
				if bantype == "m" then
					exports["crime_database"]:dbSet("INSERT INTO crime_ban (serial,reason,time,type,nick) VALUES (?,?,NOW() + INTERVAL ? minute,?,?)", v.register_serial,reason, x, "ban",v.login)
				end
				if bantype == "h" then
					exports["crime_database"]:dbSet("INSERT INTO crime_ban (serial,reason,time,type,nick) VALUES (?,?,NOW() + INTERVAL ? hour,?,?)", v.register_serial,reason, x, "ban",v.login)
				end
				if bantype == "d" then
					exports["crime_database"]:dbSet("INSERT INTO crime_ban (serial,reason,time,type,nick) VALUES (?,?,NOW() + INTERVAL ? day,?,?)", v.register_serial,reason, x, "ban",v.login)
				end
			end
			triggerClientEvent(root, "admin:rendering", root, ""..v.login.." został(a) zbanowany(a) za: "..reason.." na: "..x.." "..bantype.."")
			local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",v.login, "#5a3795BANOFFLINE >#cccccc "..removeHex(reason))

		end
	end
end)

addCommandHandler("wyciszoffline", function(plr,cmd,cel,x,bantype,...)
	if getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,6) then
		local nickxd = getPlayerName(plr):gsub('#%x%x%x%x%x%x', '')
		local reason = table.concat({...}, " ")
		if not cel or not tonumber(x) or not bantype or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /wyciszoffline <nick> <ile> <jednostka> <powód>", "error" )
			return
		end
		local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=?", cel)
		if #result <= 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
		return end
		if #result > 0 then
			v = result[1]
			if v.id == 1 then triggerClientEvent(plr, "addNoti", plr, "Nie możesz wyciszyć tej osoby.", "error" ) return end

			reason = reason.." od: "..nickxd..""
			if bantype=="m" or bantype=="h" or bantype=="d" then
				if bantype=="m" then
					exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? minute,?,?,?)", v.register_serial,reason, x, "mute",getPlayerName(plr),v.login)
				end
				if bantype=="h" then
					exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? hour,?,?,?)", v.register_serial,reason, x, "mute",getPlayerName(plr),v.login)
				end
				if bantype=="d" then
					exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? day,?,?,?)", v.register_serial,reason, x, "mute",getPlayerName(plr),v.login)
				end
			end
			triggerClientEvent(root, "admin:rendering", root, "Gracz "..v.login.." został wyciszony przez "..getPlayerName(plr)..", powód: "..reason.." ("..x .. bantype..")")
			local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",v.login, "#5a3795MUTEOFFLINE >#cccccc "..removeHex(reason))

		end
	end
end)

addCommandHandler("odciszoffline", function(plr,cmd,cel)
	if getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,6) then
		local nickxd = getPlayerName(plr):gsub('#%x%x%x%x%x%x', '')
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /odciszoffline <nick>", "error" )
			return
		end
		local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=?", cel)
		if #result <= 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
		return end
		if #result > 0 then
			v = result[1]
			if v.id == 1 then triggerClientEvent(plr, "addNoti", plr, "Błąd #201.", "error" ) return end

			exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "mute", v.register_serial)

			triggerClientEvent(root, "admin:rendering", root, "Gracz "..v.login.." został odciszony przez "..getPlayerName(plr).."")
		end
	end
end)

addCommandHandler("zpjoffline", function(plr,cmd,cel,time,rodzaj,...)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) then
		local reason = table.concat({...}, " ")
		if not cel or not tonumber(time) or not rodzaj or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /zpjoffline <nick> <ile> <jednostka> <powód>", "error" )
			return
		end

		local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=?", cel)
		if #result <= 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
		return end
		if #result > 0 then
			v = result[1]
			if v.id == 1 then triggerClientEvent(plr, "addNoti", plr, "Błąd #201.", "error" ) return end

			local query = string.format("SELECT * FROM crime_punish WHERE type = %q AND active = 1 AND serial = %q AND time>NOW() LIMIT 1","prawko", v.register_serial)
			local resultssa = exports["crime_database"]:pobierzWyniki(query)
			if (resultssa) then
				return triggerClientEvent(plr, "addNoti", plr, "Ten gracz posiada już zawieszone prawo jazdy.", "error" )
			else
				exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type = ? AND active = 1 AND serial = ?", "prawko", v.register_serial)
			end
			if tonumber(time) <= 0 then return end
			reason = reason..""
			if rodzaj == "m" then
				exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? minute,?,?,?)", v.register_serial,reason, time, "prawko",getPlayerName(plr),v.login)
			elseif rodzaj == "h" then
				exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? hour,?,?,?)", v.register_serial,reason, time, "prawko",getPlayerName(plr),v.login)
			elseif rodzaj == "d" then
				exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? day,?,?,?)", v.register_serial,reason, time, "prawko",getPlayerName(plr),v.login)
			elseif rodzaj == "w" then
				exports["crime_database"]:dbSet("INSERT INTO crime_punish (serial,reason,time,type,who_add,ukarany) VALUES (?,?,NOW() + INTERVAL ? week,?,?,?)", v.register_serial,reason, time, "prawko",getPlayerName(plr),v.login)
			end
			triggerClientEvent(root, "admin:rendering", root, "Gracz "..v.login.." otrzymał zakaz prowadzenia pojazdów (A,B,C) od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." za: "..reason.." ("..time .. rodzaj..")")
			local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",v.login, "#5a3795ZPJ >#cccccc "..removeHex(reason))

		end
	end
end)

addCommandHandler("opjoffline", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /opjoffline <nick>", "error" )
			return
		end

		local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=?", cel)
		if #result <= 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
		return end

		if #result > 0 then
			v = result[1]
			if v.id == 1 then triggerClientEvent(plr, "addNoti", plr, "Błąd #201.", "error" ) return end

			exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "prawko", v.register_serial)
			triggerClientEvent(root, "admin:rendering", root, "Gracz "..v.login.." odzyskał prawo jazdy od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."")
		end
	end
end)

addCommandHandler("pb", function(plr,cmd,cel,...)
	if getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,6) then
	local nickxd = getPlayerName(plr):gsub('#%x%x%x%x%x%x', '')
	local reason = table.concat({...}, " ")
		if not cel or not reason then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /opjoffline <nick> <powód>", "error" )
			return
		end
		local target = exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
        if getAdmin(target,6) then triggerClientEvent(plr, "addNoti", plr, "Błąd #201.", "error" ) return end
		local query = string.format("SELECT * FROM crime_ban WHERE type = %q AND active = 1 AND serial = %q AND time>NOW() LIMIT 1","ban", getPlayerSerial(target))
		local result = exports["crime_database"]:pobierzWyniki(query)
		if (result) then
			return triggerClientEvent(plr, "addNoti", plr, "Ten gracz posiada już bana.", "error" )
		end
		reason = reason.." od: "..nickxd..""
		--exports["crime_database"]:dbSet("insert into kartoteka (typ,karajacy,data,powod,ofiara) VALUES(?,?,NOW(),?,?)", "BAN", plr.name:gsub("#%x%x%x%x%x%x",""), reason, getElementData(target, "player:uid"))
		triggerClientEvent(root, "admin:rendering", root, ""..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." otrzymał(a) bana "..reason.." (permban)!")
        --exports["crime_database"]:dbSet("INSERT INTO crime_ban (serial,reason,time,type) VALUES (?,?,?,?)", getPlayerSerial(target), reason,"2099-12-31 23:59:59", "ban")
		exports["crime_database"]:dbSet("INSERT INTO crime_ban (serial,reason,time,type,nick) VALUES (?,?,NOW() + INTERVAL ? day,?,?)", getPlayerSerial(target),reason, 9999, "ban", getPlayerName(target))
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",removeHex(getPlayerName(target)), "#5a3795PERMBAN >#cccccc "..removeHex(reason))

		kickPlayer(target,plr,"Zostałeś zbanowany (permban)!")
		--outputChatBox("* Dodanych rekord", plr)
	end
end)
		
addCommandHandler("ub", function(plr,cmd,cel)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /ub <serial>", "error" )
			return
		end
		if getAdmin(plr,3) or getAdmin(plr,2) then 
			if getPlayerSerial(plr) == cel then triggerClientEvent(plr, "addNoti", plr, "Błąd #202.", "error" ) return end
		end

		
	--	if string.len(cel) ~= 32 then return outputChatBox("* Błędny serial ", plr) end
		local query=string.format("SELECT * FROM crime_ban WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","ban", cel)
		local result=exports["crime_database_2"]:pobierzWyniki(query)
		if (result) then
			exports["crime_database"]:dbSet("DELETE FROM crime_ban WHERE type=? AND active=1 AND serial=?", "ban", cel)
			triggerClientEvent(plr, 'alerts:create_alert', root, 'info', 'Usunięto bana')
		else
			triggerClientEvent(plr, 'alerts:create_alert', root, 'info', 'Gracz nie posiada bana!')
		end
	end
end)



addCommandHandler("ranga", function(plr,cmd,target,numer)
if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) then
if not target or not numer or not tonumber(numer) then

return end
if tonumber(numer) > 6 or tonumber(numer) < 0 then

return end
local gracz=exports["crime_core"]:findPlayer(plr,target)
if not gracz then  end
local serial=getPlayerSerial(gracz)
--
local sel=exports["crime_database"]:dbGet("SELECT * FROM crime_admins WHERE serial=?", serial)
if sel and #sel > 0 then
if tonumber(numer) == 0 then
exports['crime_database']:dbSet("DELETE from crime_admins where serial=?",serial)
setElementData(gracz,"player:admin",false)
setElementData(gracz,"player:level",false)
triggerEvent("save:player",root,gracz)
triggerEvent("load:player",root,gracz)
setPlayerName(gracz,getPlayerName(gracz):gsub("#%x%x%x%x%x%x",""))

return end
exports['crime_database']:dbSet("UPDATE crime_admins set level=? where serial=?",numer,serial)

else
if tonumber(numer) == 0 then  return end
exports["crime_database"]:dbSet("INSERT INTO crime_admins (serial,date,level,added) VALUES (?,?,?,NOW())",serial,getPlayerName(gracz):gsub("#%x%x%x%x%x%x",""),numer)

end
end
end)

addCommandHandler("ttv", function(plr,cmd,vid)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not vid or not tonumber(vid) then return end
		vid=tonumber(vid)
		for i,v in ipairs(getElementsByType("vehicle")) do
			local dbid=getElementData(v,"vehicle:id")
			if dbid and tonumber(dbid) == vid then
	    		local x,y,z=getElementPosition(v)
	    		setElementPosition(plr,x,y,z+4)
	    		setElementInterior(plr, getElementInterior(v))
	    		setElementDimension(plr, getElementDimension(v))
				warpPedIntoVehicle(plr,v)
	    	end
		end
		local query=exports["crime_database"]:dbGet("SELECT 1 FROM crime_vehicles WHERE id=? AND parking>0", vid)
		if query then
			
		else
			triggerClientEvent(plr, "addNoti", plr, "Pojazd z takim id nie jest zrespiony na mapie.", "error" )
		end
	end
end)



addCommandHandler("thv", function(plr,cmd,vid)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not vid or not tonumber(vid) then return end
		vid=tonumber(vid)
		for i,v in ipairs(getElementsByType("vehicle")) do
			local dbid=getElementData(v,"vehicle:id")
			if dbid and tonumber(dbid) == vid then
				if getElementData(v,"vehicle:police_parking") then triggerClientEvent(plr, 'alerts:create_alert', root, 'info', 'Ten pojazd stoi na parkingu policyjnym') return end
	    		local x,y,z=getElementPosition(plr)
	    		setElementPosition(v,x,y,z+0.1)
	    		setElementInterior(v, getElementInterior(plr))
	    		setElementDimension(v, getElementDimension(plr))
				warpPedIntoVehicle(plr,v)
	   		end
		end
		local query=exports["crime_database"]:dbGet("SELECT 1 FROM crime_vehicles WHERE id=? AND parking>0", vid)
		if query then
			
		else
			triggerClientEvent(plr, "addNoti", plr, "Pojazd z takim id nie jest zrespiony na mapie.", "error" )
		end
	end
end)

addCommandHandler("spec", function(plr,cmd,cel)
	if getAdmin(plr,6) or  getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2)then
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /spec <id/nick>", "error" )
			return
		end
		local target=exports["crime_core"]:findPlayer(plr,cel)
		if not target then
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
			return
		end
		local x,y,z=getElementPosition(plr)
		removePedFromVehicle(plr)
		--triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Obserwujesz gracza.')
		setElementInterior(plr, getElementInterior(target))
		setElementDimension(plr, getElementDimension(target))
		setCameraTarget(plr, target)
		setElementData(plr,"spec:pos",{x,y,z})
	end
end)

addCommandHandler("specoff", function(plr,cmd)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2)then
		local spec=getElementData(plr,"spec:pos")
		if not spec then return end
		setElementPosition(plr, spec[1], spec[2], spec[3])
		setCameraTarget(plr, plr)
		--triggerClientEvent(plr, 'alerts:create_alert', root, 'info', 'Zakonczyles obserwowanie!')
	end
end)
function destroyBlipsAttachedTo(player)
    local attached = getAttachedElements ( player )
    if ( attached ) then
        for k,element in ipairs(attached) do
            if getElementType ( element ) == "blip" then
                destroyElement ( element )
            end
        end
    end
end
addCommandHandler("inv", function(plr)
	if getAdmin(plr,6) or getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2)then
		if getElementAlpha(plr) > 0 then
			setElementAlpha(plr,0)
			destroyBlipsAttachedTo ( plr )
		else
			setElementAlpha(plr,255)
			local newValue = getElementData(plr,"player:admin") -- find the new value
			if newValue == true then
				destroyBlipsAttachedTo (plr)
				createBlipAttachedTo ( plr, 0, 2, 255, 255, 255 )
			else
				destroyBlipsAttachedTo ( plr )
				createBlipAttachedTo ( plr, 0, 2, 255, 255, 255 )
			end
		end
	end
end)

local zapisane_pozycje = {}
addCommandHandler("sp", function(plr,cmd)
	if getAdmin(plr) then
	local x,y,z = getElementPosition(plr)
	setElementData(plr,"player:sp",{x,y,z})
	triggerClientEvent(plr, "addNoti", plr, "Zapisano pozycje.", "info" )
	end
end)

addCommandHandler("lp", function(plr,cmd)
	if getAdmin(plr) then
	local uid = getElementData(plr,"player:uid")
    local x = getElementData(plr,"player:sp")
	if (not x) then
		triggerClientEvent(plr, "addNoti", plr, "Nie masz żadnej zapisanej pozycji.", "error" )
    return
    end
	local veh = getPedOccupiedVehicle(plr)
	if veh then plr = veh end
	setElementPosition(plr,x[1],x[2],x[3])
	triggerClientEvent(plr, "addNoti", plr, "Wczytano pozycje.", "info" )
	end
end)

addEvent("sprawdzanie:elementu",true)
addEventHandler("sprawdzanie:elementu",root,function(element)
	local plr = client
	local clickedElement = element
	if getAdmin(plr,5) or getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,6) then
	if getElementType(clickedElement) == "vehicle" then
		if not getElementData(clickedElement,"vehicle:id") then return end
		--executeCommandHandler("veh.info",plr,getElementData(clickedElement,"vehicle:id"))
	end
	if getElementType(clickedElement) == "player" then
		if not getElementData(clickedElement,"player:uid") then  return end
			--executeCommandHandler("ginfo",plr,getElementData(clickedElement,"id"))
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
