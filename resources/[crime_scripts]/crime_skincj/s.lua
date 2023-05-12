--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function setPedClothes(thePed, clothingSlot, clothingID)
	if not isElement(thePed) or type(clothingSlot) ~= "number" then
		--error("Invalid arguments to setPedClothes()!", 2)
	end
	
	if not clothingID then
		removePedClothes(thePed, clothingSlot)
		triggerClientEvent(thePed,"zmien:3dmodel",thePed)
		return removePedClothes(thePed, clothingSlot)
	end
	
	local hasClothes = getPedClothes(thePed, clothingSlot) 
	if hasClothes then
		removePedClothes(thePed, clothingSlot)
	end
	
	local texture, model = getClothesByTypeIndex(clothingSlot, clothingID)
	addPedClothes(thePed, texture, model, clothingSlot)
	triggerClientEvent(thePed,"zmien:3dmodel",thePed)
	return addPedClothes(thePed, texture, model, clothingSlot)
end

addEvent("zmien:ubranie", true)
addEventHandler("zmien:ubranie", root, function(slot,id)
	setPedClothes(source,slot,id)
end)