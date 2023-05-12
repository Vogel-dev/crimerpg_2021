--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

setElementData(localPlayer, "player:rent:public:car", false)

addEventHandler("onClientVehicleStartEnter", root, function(player, seat, door)
	if seat == 0 and player == localPlayer and getElementData(source, "publiczny") then
		owner = getElementData(source, "publiczny:owner")
		if owner and owner ~= player then
			cancelEvent()
		end
		rented = getElementData(player, "player:rent:public:car")
		if rented and rented ~= source then
			cancelEvent()
		end
	end
end)

addEventHandler("onClientVehicleExit", root, function(player, seat)
	if seat == 0 and player == localPlayer and getElementData(source, "publiczny") then
		exports.crime_gui:addNoti("Wyszedłeś z publicznego pojazdu, jeśli nie wrócisz w przeciągu 20 sekund, zniknie.", "info")
	end
end)

addEventHandler("onClientVehicleCollision", root,
    function ( hit ) 
         setPedCanBeKnockedOffBike(localPlayer, false) 
    end
)