--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("ghostmode", true)
addEventHandler("ghostmode", resourceRoot, function(element,type,costam)
	if element then 
		if type == "on" then 
			--setElementAlpha(element,220)
			if getElementModel(element) == 414 then return end
			if not costam then setElementData(element,"ghostniezcuba",true) end
			for i,v in pairs(getElementsByType("vehicle")) do
				if getElementModel(v) ~= 414 then 
					setElementCollidableWith(v, element, false)
				end
			end
			for i,v in pairs(getElementsByType("player")) do
				setElementCollidableWith(v, element, false)
			end
			for i,v in pairs(getElementsByType("ped")) do
				setElementCollidableWith(v, element, false)
			end
		elseif type == "off" then 
			--setElementAlpha(element,255)
			if not costam then setElementData(element,"ghostniezcuba",false) end
			for i,v in pairs(getElementsByType("vehicle")) do
				setElementCollidableWith(v, element, true)
			end
			for i,v in pairs(getElementsByType("player")) do
				setElementCollidableWith(v, element, true)
			end
			for i,v in pairs(getElementsByType("ped")) do
				setElementCollidableWith(v, element, true)
			end
		end
	end
end)