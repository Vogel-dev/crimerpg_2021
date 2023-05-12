--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

celuje = false
addEventHandler('onClientRender',getRootElement(),function() 
	if celuje == true then 
		if isChatBoxInputActive() == true then 
			setCameraShakeLevel(0)
		else
			local umiejetnosc = getElementData(localPlayer,"player:strzelec")
			setCameraShakeLevel(umiejetnosc)
		end
	end
    if isPedAiming(localPlayer) == true then 
        if getPedWeapon(localPlayer) == 22 then return end
        if celuje == true then return end 
		local umiejetnosc = getElementData(localPlayer,"player:strzelec")
		if isChatBoxInputActive() == true then 
			setCameraShakeLevel(0)
		else
			setCameraShakeLevel(umiejetnosc)
		end
        celuje = true
    else        
        if celuje == false then return end
        setCameraShakeLevel(0)
        celuje = false 
    end
end) 

function isPedAiming (thePedToCheck)
	if isElement(thePedToCheck) then
		if getElementType(thePedToCheck) == "player" or getElementType(thePedToCheck) == "ped" then
			if getPedTask(thePedToCheck, "secondary", 0) == "TASK_SIMPLE_USE_GUN" or isPedDoingGangDriveby(thePedToCheck) then
				return true
			end
		end
	end
	return false
end
