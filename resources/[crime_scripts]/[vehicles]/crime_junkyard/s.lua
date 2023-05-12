--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local x,y,z = 2352.61, -1899.50, 13.55
local blip = createBlip(x, y, 20, 42, 0, 0, 0, 0, 0, 0, 200)

local zwrot = 5000

addEvent("zlomujgruza", true)
addEventHandler("zlomujgruza", root, function(veh)
    local uid=getElementData(source,"player:uid")
	if not uid then return end
	if not veh then return end
	local id = getElementData(veh,"vehicle:id")
	local kto = getPlayerName(source)
	local model = getElementModel(veh)
	local auto = getVehicleNameFromModel(model)
	modelname = exports["crime_modelnames"]
	auto = modelname:getText(auto)
	destroyElement(veh)
	triggerClientEvent(source, "addNoti", source, "Zezłomowałeś pojazd "..auto.." i otrzymujesz "..zwrot.." PLN", "success" )
	givePlayerMoney(source,zwrot)
	exports["crime_database"]:dbSet("DELETE FROM crime_vehicles WHERE id=?",id)
	exports["crime_database"]:dbSet("INSERT INTO crime_junkyard (kto, auto) VALUES (?,?)", removeHex(kto), auto)
end)

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end