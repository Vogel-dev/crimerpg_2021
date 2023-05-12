--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function nitro_updateState(state)    
    if state then -- gdy sie nitro wlacza
        if getElementData(source,"vehicle:atrapa") == 1 then 
            cancelEvent()
            triggerServerEvent("nitrooffdlaall", localPlayer, source)
        end
    end
end   
addEventHandler("onClientVehicleNitroStateChange", root,  nitro_updateState)

addEvent("offnijtenitro", true)
addEventHandler("offnijtenitro", root, function(car)
    if not car then return end
    setVehicleNitroActivated(car, false)
    setVehicleNitroCount(source, 0)
end)