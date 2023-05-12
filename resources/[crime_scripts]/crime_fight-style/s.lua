--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("nauczylessielol", true)
addEventHandler("nauczylessielol", root, function(id,koszt)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    setPedFightingStyle(source,id)
    takePlayerMoney(source,koszt)
end)