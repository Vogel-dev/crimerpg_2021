--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local x,y,z = 1707.11, -1718.79, 13.65
local blip = createBlip(x, y, 20, 18, 0, 0, 0, 0, 0, 0, 200)

addEvent("kupskinamiok", true)
addEventHandler("kupskinamiok", root, function(cena,typ,id)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if not cena then return end 
    if not typ then return end 
    if not id then return end 
    if id == getElementModel(source) then triggerClientEvent(source, "addNoti", source, "Posiadasz już zakupiony ten strój.", "error" ) return end

    if typ == 1 and not getElementData(source,"player:premium") then triggerClientEvent(source, "addNoti", source, "Nie posiadasz konta premium.", "error" ) return end 
    if cena > getPlayerMoney(source) then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy.", "error" ) return end
    takePlayerMoney(source,cena)
    setElementModel(source,id)
    setElementData(source,"przebieralnia",getElementModel(source))
    exports["crime_database"]:dbSet("UPDATE crime_users SET skin=? WHERE id=? LIMIT 1",id,uid)
	triggerClientEvent(source, "addNoti", source, "Zakupiłeś strój.", "success" )
end)