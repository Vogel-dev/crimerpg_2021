--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

--[[
function playerDamage_text ( attacker, weapon, bodypart, loss )
	local rp = getElementData(source,"player:reputation")
	
	if rp < 100 then
	--outputChatBox("Posiadasz mniej niz 100RP, nie otrzymujesz obrazen!",source,0,255,0)
	--triggerClientEvent(source, 'alerts:create_alert', root, 'info', 'Posiadasz mniej niż 100RP, nie otrzymujesz obrażeń.') 
	setElementHealth(source,100)
	end
	


end
addEventHandler ( "onPlayerDamage", getRootElement (), playerDamage_text )



function displayVehicleLoss(los)
    local thePlayer = getVehicleOccupant(source)
	if not thePlayer then return end
	if getElementType(thePlayer) ~= "player" then setElementHealth(source,1000) fixVehicle(source) return end
	
	
	
	local rp = getElementData(thePlayer,"player:reputation")
	local hp = getElementHealth(thePlayer)
	
	local los = tonumber(los)
	
	if los <= 50 then 
	setElementHealth(thePlayer,hp-5)
	end
	
	if los > 50 and los <= 100 then 
	setElementHealth(thePlayer,hp-10)
	end
	
	if los > 100 and los <= 200 then 
	setElementHealth(thePlayer,hp-15)
	end
	
	if los > 200 and los <= 300 then 
	setElementHealth(thePlayer,hp-20)
	end
	
	if los > 300 and los <= 400 then 
	setElementHealth(thePlayer,hp-25)
	end
	
	if los > 400 then 
	setElementHealth(thePlayer,hp-30)
	end
	
	if rp < 100 then
    if(thePlayer) then
			fixVehicle(source)
		if getElementData(thePlayer,"udezyl") == true then return end
		setElementData(thePlayer,"udezyl",true)
		--outputChatBox("Posiadasz mniej niz 100RP, twoje auto nie doznaje uszkodzen.", thePlayer,0,255,0)
		--triggerClientEvent(thePlayer, 'alerts:create_alert', root, 'info', 'Posiadasz mniej niż 100RP, twoje auto nie doznaje uszkodzeń.') 
		
	setTimer(function()
		setElementData(thePlayer,"udezyl",false)
	end, 1000*5, 1)
    end
	end
end

addEventHandler("onVehicleDamage", root, displayVehicleLoss)]]--


