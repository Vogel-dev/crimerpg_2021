--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local x,y,z = 2430.49, -1677.85, 14.35
local blip = createBlip(x, y, 20, 52, 0, 0, 0, 0, 0, 0, 200)

addEvent("kurier:dajinfo", true)
addEventHandler("kurier:dajinfo", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	local result = exports['crime_database']:dbGet('SELECT * FROM crime_users ORDER BY elektrykpkt DESC LIMIT 6', nazwaorg)
	local resultdwa = exports['crime_database']:dbGet('SELECT * FROM crime_users WHERE id=?', uid)
    triggerClientEvent(source, "kurier:oddajinfo", source, result,resultdwa)
end)

addEvent("kurier:kupulepszenie", true)
addEventHandler("kurier:kupulepszenie", root, function(ulid, cena)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	if not ulid then return end 
	if not cena then return end 
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=? ", uid)
    if #result > 0 then
		if result[1].elektrykpkt < cena then triggerClientEvent(source, "addNoti", source, "Nie stać cię na to ulepszenie.", "error" ) return end 
		exports["crime_database"]:dbSet("UPDATE crime_users SET elektrykul"..ulid.."=?, elektrykpkt=elektrykpkt-? WHERE id=? LIMIT 1",1, cena, uid)
		triggerEvent("kurier:dajinfo", source)
		triggerClientEvent(source, "addNoti", source, "Zakupiłeś ulepszenie za "..cena.." pkt.", "success" )
	end
end)

addEvent("kurier:removecar",true)
addEventHandler("kurier:removecar", root, function(vehicle)
	if vehicle then 
		destroyElement(vehicle)
	end
end)

addEvent("kurier:dodajpunkt", true)
addEventHandler("kurier:dodajpunkt", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	exports["crime_database"]:dbSet("UPDATE crime_users SET elektrykpkt=elektrykpkt+1 WHERE id=? LIMIT 1",uid)
end)

addEvent("kurier:givecar",true)
addEventHandler("kurier:givecar", root, function(ul1)
	veh = createVehicle(507,2428.29, -1673.87, 14.26, 0.4, 0.0, 90.3)
	setVehicleHandling(veh, "handlingFlags", 16777216)
	if not veh then return end
	if veh then 
		setElementData(veh,"vehicle:job","kurier")
		setElementData(veh,"vehicle:cpj",1)
		setElementData(veh, "vehicle.paintjob", 1)
		triggerClientEvent(root, "paintjob->TryToAddToVehicle", root, veh, 1)
		setVehicleVariant(veh,0,255)
		setVehicleColor(veh,10, 10, 10, 10, 10, 10)
		triggerClientEvent(root, "ghostmode", root, veh, "on")
		warpPedIntoVehicle(source,veh)
		setElementData(veh,"vehicle:job:owner",source)
		if ul1 == 1 then 
			setVehicleHandling(veh, "maxVelocity", 150)
		elseif ul1 == 0 then 
			setVehicleHandling(veh, "maxVelocity", 110)
		end
		setElementData(veh,"vehicle:mileage",math.random(50000,100000))
		setElementData(veh,"vehicle:fuel",100)
		setElementDimension(source,0)
		setElementInterior(source,0)
		triggerClientEvent(source, "kurier:wieziejuz", source, veh)
		setVehicleEngineState(veh, true)
	end
end)

addEvent("kurier:warptocar",true)
addEventHandler("kurier:warptocar", root, function(vehicle)
	warpPedIntoVehicle(source,vehicle)
end)

addEventHandler("onVehicleStartEnter", root, function(plr)
	if getElementData(plr,"player:pracadorywczna") == "Eletryk" then 
		if getElementData(source,"vehicle:job") ~= "kurier" then 
			cancelEvent()
		end
	end
	if getElementData(source,"vehicle:job") == "kurier" then 
		if getElementData(source,"vehicle:job:owner") ~= plr then 
			cancelEvent()
		end
	end 
end)

addEventHandler("onPlayerQuit", root, function()
	if getElementData(source,"player:pracadorywczna") == "Kurier" then 
		for i,v in pairs(getElementsByType("vehicle")) do
			if getElementData(v,"vehicle:job:owner") == source then 
				if getElementData(v,"vehicle:job") == "kurier" then 
					destroyElement(v)
				end
			end
		end
	end
end)

addEventHandler("onPlayerWasted", root, function()
	if getElementData(source,"player:pracadorywczna") == "Kurier" then 
		triggerClientEvent(source, "kurier:endjob", source)
	end
end)

addEvent("kurier:animka", true)
addEventHandler("kurier:animka", root, function(stan)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
	if stan == "wlacz" then 
		setPedAnimation(source, "COP_AMBIENT", "Copbrowse_nod")
	else 
		setPedAnimation ( source, false)
	end
end)

addEvent("kurier:hajs", true)
addEventHandler("kurier:hajs", root, function(value)
	if not tonumber(value) then return end
	if not getElementData(source,"player:logged") then return end
	local uid = getElementData(source,"player:uid")
	local hajs = getPlayerMoney(source)
	if getElementData(source,"player:premium") then 
		value = value*1.15
		local dostanie = math.floor(value*1)
		local podatek = math.floor(value*0.1)
		givePlayerMoney(source,dostanie)


		exports["crime_database"]:dbSet("UPDATE crime_users SET zarobki=zarobki+? WHERE id=? LIMIT 1",dostanie,uid)

		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_informations WHERE id=1 ")
		if #result > 0 then
			local query=exports["crime_database"]:dbSet("UPDATE crime_informations SET podatki=? WHERE id=?", result[1].podatki+podatek,  1)
		end
		triggerClientEvent(source, "addNoti", source, "Otrzymujesz "..formatujnaprzecinki(dostanie).." PLN za dostarczenie towaru.", "money" )
		exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"KURIER",dostanie,hajs,hajs+dostanie)
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
		exports["crime_database"]:dbSet("insert into logs_jobmoney values (null,null,?,?,?,?,?,?)",uid,getPlayerSerial(source),"KURIER",dostanie,hajs,hajs+dostanie)
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
