--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function reloadxd()
    triggerServerEvent("reloadmnie", localPlayer)
end

bindKey("R","down",reloadxd)

function playerDamage_text ( attacker, weapon, bodypart, loss )
    if ( bodypart == 9 and attacker and attacker ~= localPlayer ) then 
        local strefadm = getElementData(localPlayer,"wstrefiedm") or 0 
        if strefadm == 1 then
            if getElementData(localPlayer,"admin:god") == true then return end
            if getElementData(attacker,"player:organization") == getElementData(localPlayer,"player:organization") and getElementData(localPlayer,"player:organization") ~= false then cancelEvent() return end
            setElementHealth(localPlayer,0)
        end
	end
end
addEventHandler ( "onClientPlayerDamage", localPlayer, playerDamage_text )

function stopMinigunDamage ( attacker, weapon, bodypart )
    if getElementData(localPlayer,"admin:god") == true then cancelEvent() end
    if (attacker and attacker ~= localPlayer) then
        if getElementType(attacker) == "player" then 
            local strefadm = getElementData(localPlayer,"wstrefiedm") or 0 
            if strefadm == 0 then
                if getElementData(attacker,"player:duty") then 
                    
                else
                    cancelEvent()
                end
            return end
            if getElementData(attacker,"player:organization") == getElementData(localPlayer,"player:organization") and getElementData(localPlayer,"player:organization") ~= false then cancelEvent() return end
            setElementData(localPlayer,"bewu",1)
            setTimer ( function()
                setElementData(localPlayer,"bewu",false)
            end, 15000, 1 )
        else 
            local strefadm = getElementData(localPlayer,"wstrefiedm") or 0 
            if strefadm == 0 then
                cancelEvent()
            return end
        end
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), stopMinigunDamage )