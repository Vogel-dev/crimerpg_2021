--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEventHandler("onMarkerHit", resourceRoot, function(el,md)
	if getElementType(el)~="player" or not md then return end
	if getElementInterior(el)~=getElementInterior(source) then return end
	local tpto=getElementData(source,"tpto")
	if not tpto then return end
	setElementPosition(el, tpto[1], tpto[2],tpto[3])
	setElementInterior(el, 0)
	setElementDimension(el, 0)
	if tpto[4] then
		setPedRotation(el, tpto[4])
	end
end)