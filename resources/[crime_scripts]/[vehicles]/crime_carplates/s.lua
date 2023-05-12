--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local x,y,z = 1422.53, -1761.85, 13.55
local blip = createBlip(x, y, 20, 24, 0, 0, 0, 0, 0, 0, 200)

addEvent("wyszukajpojazdyrejka", true)
addEventHandler("wyszukajpojazdyrejka", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", uid)
    if #result > 0 then
        triggerClientEvent(source, "rejki:dotabeli", source, result)
    end
end)

addEvent("zmienrejka", true)
addEventHandler("zmienrejka", root, function(id, text)
	if not id then return end 
	if not text then return end
	local uid=getElementData(source,"player:uid")
	if not uid then return end
	if getPlayerMoney(source) < 30000 then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniedzy.", "error" ) return end 
	takePlayerMoney(source,30000)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET rejestracja=? WHERE id=? LIMIT 1",text,id)
	for i,v in pairs(getElementsByType("vehicle")) do 
		if getElementData(v,"vehicle:id") == id then 
			setVehiclePlateText(v,text)
		end
	end
	triggerClientEvent(source, "addNoti", source, "Pomyślnie zmieniłeś rejestrację pojazdu o ID: "..id.." na '"..text.."'", "success" )
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", uid)
    if #result > 0 then
        triggerClientEvent(source, "rejki:dotabeli", source, result)
    end
end)