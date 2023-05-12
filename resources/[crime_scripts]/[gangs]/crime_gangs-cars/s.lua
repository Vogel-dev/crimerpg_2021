--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("wyszukajpojazdyorg", true)
addEventHandler("wyszukajpojazdyorg", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", uid)
    if #result > 0 then
        triggerClientEvent(source, "pojazdyorg:dotabeli", source, result)
    end
end)

addEvent("org:przepisz", true)
addEventHandler("org:przepisz", root, function(id)
	if not id then return end 
	local uid=getElementData(source,"player:uid")
	if not uid then return end
	local org = getElementData(source,"player:organization")
	if not org or org == "" then triggerClientEvent(source, 'alerts:create_alert', root, 'error', 'Nie należysz do żadnej organizacji!') return end

	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=?", id)
    if result[1].ownedGroup == org then triggerClientEvent(source, 'alerts:create_alert', root, 'error', 'Ten pojazd jest już przypisany!') return end

	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET ownedGroup=? WHERE id=? LIMIT 1",org,id)
	for i,v in pairs(getElementsByType("vehicle")) do 
		if getElementData(v,"vehicle:id") == id then 
			setElementData(v,"vehicle:ownedGroup",org)
		end
	end
	triggerClientEvent(source, 'alerts:create_alert', root, 'success', 'Pomyślnie przepisałeś pojazd o ID: '..id..' do organizacji '..org..'')
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", uid)
    if #result > 0 then
        triggerClientEvent(source, "pojazdyorg:dotabeli", source, result)
    end
end)

addEvent("org:odpisz", true)
addEventHandler("org:odpisz", root, function(id)
	if not id then return end 
	local uid=getElementData(source,"player:uid")
	if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=?", id)
    if not result[1].ownedGroup or result[1].ownedGroup == "" then triggerClientEvent(source, 'alerts:create_alert', root, 'error', 'Ten pojazd nie jest nigdzie przypisany!') return end

	org = ""
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET ownedGroup=? WHERE id=? LIMIT 1",org,id)
	for i,v in pairs(getElementsByType("vehicle")) do 
		if getElementData(v,"vehicle:id") == id then 
			setElementData(v,"vehicle:ownedGroup",org)
		end
	end
	triggerClientEvent(source, 'alerts:create_alert', root, 'success', 'Pomyślnie odpisałeś pojazd o ID: '..id..' od organizacji')
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", uid)
    if #result > 0 then
        triggerClientEvent(source, "pojazdyorg:dotabeli", source, result)
    end
end)