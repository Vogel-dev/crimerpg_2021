--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function getVehicleKey(plr,veh)
	if plr and veh then
		local uid=getElementData(plr,"player:uid")
		if not uid then return end
		if getElementData(plr,"player:admin") or uid == getElementData(veh,"vehicle:ownedPlayer") then
			return true
		else
			return false
		end
	end
end
local categoryL={[592] = true,[553] = true,[577] = true,[488] = true,[511] = true,[497] = true,[548] = true,[563] = true,[512] = true,[476] = true,[593] = true,[447] = true,[425] = true,[519] = true,[520] = true,[460] = true,[417] = true,[469] = true,[487] = true,[513] = true}
local categoryA1={[462] = true,[468] = true}

addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
	if getElementHealth(source) < 302 then
		setElementHealth(source,302)
	end
	if seat == 0 then 
		if getElementData(source,"vehicle:duty") then 
			if getElementData(source,"vehicle:duty") ~= getElementData(plr,"player:duty") then cancelEvent() return end
			if getElementData(source,"vehicle:duty") == getElementData(plr,"player:duty") then
				if getElementData(source,"vehicle:duty:level") > getElementData(plr,"player:duty:level") then cancelEvent() return end
			end
		end
	end
end)
function jestwtabeli(huj,truj)
    for k,v in pairs(huj) do
        if v == truj then
           return true
        end
    end
    return false
end
addCommandHandler("klucze",function(plr,cmd,target)
	local veh = getPedOccupiedVehicle(plr)
	if not veh then triggerClientEvent(plr, "addNoti", plr, "Nie znajdujesz się w pojeździe.", "error" ) return end
	if getElementData(veh,"vehicle:ownedPlayer") ~= getElementData(plr,"player:uid") then triggerClientEvent(plr,  "addNoti", plr, "Ten pojazd nie należy do ciebie.", "error" ) return end
	if not target then
		triggerClientEvent(plr,  "addNoti", plr, "Zabrałeś wszystkie pożyczone klucze", "success" )
		setElementData(veh,"vehicle:rent",0)
	else
		local target=findPlayer(plr, target)
		if not target then
			triggerClientEvent(plr,  "addNoti", plr, "Nie odnaleziono podanego gracza.", "error" )
			return
		end
		local rent = getElementData(veh,"vehicle:rent")
		if (type(rent) ~= "table") then
			local tabelka = {}
			table.insert(tabelka,getElementData(target,"player:uid"))
			setElementData(veh,"vehicle:rent",tabelka)
			triggerClientEvent(plr,  "addNoti", plr, "Pożyczyłeś klucze od pojazdu, aby zabrać wpisz /klucze", "info" )
		else
			local tabelka = rent
			if jestwtabeli(tabelka,getElementData(target,"player:uid")) then triggerClientEvent(plr,  "addNoti", plr, "Ten gracz posiada już klucze od jakiegoś pojazdu.", "error" ) return end
 			if #tabelka > 3 then triggerClientEvent(plr,  "addNoti", plr, "Nie posiadasz tyłu kluczy od pojazdu.", "error" )  return end
			table.insert(tabelka,getElementData(target,"player:uid"))
			setElementData(veh,"vehicle:rent",tabelka)
			triggerClientEvent(plr,  "addNoti", plr, "Pożyczyłeś klucze od pojazdu, aby zabrać wpisz /klucze", "info" )
		end
	end
end)



addCommandHandler("vdodaj",function(plr,cmd,target)
	local veh = getPedOccupiedVehicle(plr)
	if not veh then triggerClientEvent(plr,  "addNoti", plr, "Nie znajdujesz się w pojeździe.", "error" ) return end
	if getElementData(veh,"vehicle:ownedPlayer") ~= getElementData(plr,"player:uid") then triggerClientEvent(plr,  "addNoti", plr, "Ten pojazd nie należy do ciebie.", "error" ) return end
	if not target then
		triggerClientEvent(plr, "Zabrałeś wszystkie pożyczone klucze", "success" )
		setElementData(veh,"vehicle:rent",0)
	else
		local target=findPlayer(plr, target)
		if not target then
			triggerClientEvent(plr,  "addNoti", plr, "Nie odnaleziono podanego gracza.", "error" ) 
			return
		end
		local rent = getElementData(veh,"vehicle:rent")
		if (type(rent) ~= "table") then
			local tabelka = {}
			table.insert(tabelka,getElementData(target,"player:uid"))
			setElementData(veh,"vehicle:rent",tabelka)
			triggerClientEvent(plr,  "addNoti", plr, "Pożyczyłeś klucze od pojazdu, aby zabrać wpisz /klucze", "info" )
		else
			local tabelka = rent
			if jestwtabeli(tabelka,getElementData(target,"player:uid")) then triggerClientEvent(plr,  "addNoti", plr, "Ten gracz posiada już klucze od jakiegoś pojazdu.", "error" ) return end
 			if #tabelka > 3 then triggerClientEvent(plr,  "addNoti", plr, "Nie posiadasz tyłu kluczy od pojazdu.", "error" ) return end
			table.insert(tabelka,getElementData(target,"player:uid"))
			setElementData(veh,"vehicle:rent",tabelka)
			triggerClientEvent(plr,  "addNoti", plr, "Pożyczyłeś klucze od pojazdu, aby zabrać wpisz /klucze", "info" )
		end
	end
end)

--wsiadaniedobotówxd
addEventHandler("onVehicleEnter", root, function(plr,seat,jacked)
	if getElementType(plr) ~= "player" then return end
	if not source then return end
	if seat ~= 0 then return end
	if getElementData(source,"pojazdbotaskurwiela") then
		destroyElement(source)
		triggerClientEvent(plr,  "addNoti", plr, "Ten pojazd nie należy do ciebie.", "error" )
	end
end)


-- Tutaj dalsza cześc kodu
addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
	if getElementType(plr) ~= "player" then return end
	if seat ~= 0 then return end
	if categoryL[getElementModel(source)] then return end
	local query=string.format("SELECT * FROM crime_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","prawko", getPlayerSerial(plr))
	local resultasd = exports["crime_database"]:dbGet("SELECT * FROM  crime_punish WHERE serial=? AND type=?", getPlayerSerial(plr), "prawko")
	local result=exports["crime_database_2"]:pobierzWyniki(query)
	if (result) then
		triggerClientEvent(plr,  "addNoti", plr, 'Posiadasz zawieszone prawo jazdy do '..resultasd[1].time..' za '..resultasd[1].reason..'', "error" )
		cancelEvent()
	else
		exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "prawko", getPlayerSerial(plr))
	end
end)

addEventHandler("onVehicleEnter", root, function(plr,seat,jacked)
	
	if getElementType(plr) ~= "player" then return end
	if not source then return end
	if seat ~= 0 then return end
	if categoryL[getElementModel(source)] then return end
		local queryA=string.format("SELECT * FROM crime_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","prawko", getPlayerSerial(plr))
		local resultasd = exports["crime_database"]:dbGet("SELECT * FROM  crime_punish WHERE serial=? AND type=?", getPlayerSerial(plr), "prawko")
		local resultA=exports["crime_database_2"]:pobierzWyniki(queryA)
		if (resultA) then
			--setControlState ( plr, "enter_exit", true )
			setTimer(setControlState, 800, 1, plr,"enter_exit", true)
			setTimer(setControlState, 1800, 1, plr,"enter_exit", false)
			triggerClientEvent(plr,  "addNoti", plr, 'Posiadasz zawieszone prawo jazdy do '..resultasd[1].time..' za '..resultasd[1].reason..'', "error" )
		else
			exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "prawko", getPlayerSerial(plr))
		end
end)

addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
if getElementType(plr) ~= "player" then return end
if not source then return end
	if seat ~= 0 then return end
	if not categoryL[getElementModel(source)] then return end
	local query=string.format("SELECT * FROM crime_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","L", getPlayerSerial(plr))
	local result=exports["crime_database_2"]:pobierzWyniki(query)
	if (result) then
		triggerClientEvent(plr,  "addNoti", plr, "Posiadasz zawieszoną licencję lotniczą.", "error" )
		cancelEvent()
	else
		exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "L", getPlayerSerial(plr))
	end
end)

addEventHandler("onVehicleEnter", root, function(plr,seat,jacked)
if getElementType(plr) ~= "player" then return end
if not source then return end
	if seat ~= 0 then return end
	if not categoryL[getElementModel(source)] then return end
		local queryA=string.format("SELECT * FROM crime_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","L", getPlayerSerial(plr))
		local resultA=exports["crime_database_2"]:pobierzWyniki(queryA)
		if (resultA) then
			--setControlState ( plr, "enter_exit", true )
			setTimer(setControlState, 800, 1, plr,"enter_exit", true)
			setTimer(setControlState, 1800, 1, plr,"enter_exit", false)
			triggerClientEvent(plr,  "addNoti", plr, "Posiadasz zawieszoną licencję lotniczą.", "error" )
		else
			exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE type=? AND active=1 AND serial=?", "L", getPlayerSerial(plr))
		end
end)

addCommandHandler("vopis", function(plr,cmd,...)
	if getPlayerSerial(plr) ~= "B6B0B2C2BB2A2E806AE553BF30894E62" then return end
	local desc=table.concat(arg, " ")
	local veh=getPedOccupiedVehicle(plr)
	if not veh then
		triggerClientEvent(plr,  "addNoti", plr, "Nie znajdujesz się w pojeździe", "error" )
		return
	end
	if getElementData(veh, "vehicle:desc") then
		setElementData(veh, "vehicle:desc", false)
	return end
	if string.len(desc) < 2 then
		triggerClientEvent(plr,  "addNoti", plr, "Użycie: /vopis (opis)", "error" )
		return
	end

	descc=string.format("%s", desc)
	setElementData(veh,"vehicle:desc",descc)
end)

addEventHandler ( "onVehicleEnter", getRootElement(), function(thePlayer, seat, jacked) 
	if getElementType(thePlayer) ~= "player" then return end
	if not source then return end
	setVehicleDoorOpenRatio(source, 2, 0, 500)
end)

addEventHandler("onPlayerQuit", root, function()
	if not getElementData(source,"player:job") then return end
	local veh=getPedOccupiedVehicle(source)
	if not veh then return end
	local id=getElementData(veh,"vehicle:id")
	if not id then
	if getElementData(source,"player:job") == "Sweepers" then return end
	triggerEvent("destroyVehicle", root, veh)
	end
end)
 
