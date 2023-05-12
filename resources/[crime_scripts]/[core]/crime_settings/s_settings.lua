--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local obiekt={}

-- Kod służący od sprawdzania prawa jazdy
function getVehicleLicense(plr,type,tajp2)
	if getElementData(plr,"player:license:pj"..type.."") ~= 1 then
		triggerClientEvent(plr, "addNoti", plr, "Nie posiadasz prawa jazdy kategorii "..type..", udaj się do ośrodka szkoleniowego!", "error" )
		return true
	end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE serial=? AND type=? AND active=1 AND time>NOW()", getPlayerSerial(plr), tostring(tajp2))
	if result and #result > 0 then
		v=result[1]
			--triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Posiadasz zawieszone prawo jazdy!') 
		return true
	else
		exports["crime_database"]:dbSet("DELETE FROM crime_punish WHERE serial=? AND type=? AND active=1 AND time<NOW()", getPlayerSerial(plr), tostring(tajp2))
		return false
	end
end


-- Kod służący od usuwania danego pojazdu
addEvent("destroyVehicle", true)
addEventHandler("destroyVehicle", root, function(veh)
	if not veh then return end
	destroyElement(veh)
	if obiekt[veh] then 
		destroyElement(obiekt[veh])
	end
end)

-- Kod służący od usuwania obiektów z pojazdu
addEvent("removeObject", true)
addEventHandler("removeObject", root, function(veh,code)
	if obiekt[veh] then
		destroyElement(obiekt[veh])
	end
end)

-- Kod służacy do dodawania obiektów do prac
addEvent("addObject", true)
addEventHandler("addObject", root, function(veh,code)
	if code == "kamieniolom" then
		obiekt[veh]=createObject(3929, 0, 0, 0)
		setObjectScale(obiekt[veh], 3.5)
		attachElements(obiekt[veh], veh, 0, -2, 1, 90)
	end
end)


addEventHandler ( "onPlayerVehicleEnter", root, function(v,s,j)
if getElementData(v,"vehicle:fuel") == false then
setElementData(v,"vehicle:fuel",100)
end
end)


