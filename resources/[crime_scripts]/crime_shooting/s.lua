--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function onPlayerWeaponFireFunc(weapon,endx,endy,endz,hitelement)
    if hitelement and getElementType(hitelement) == "player" or getElementData(source,"wstrzelnicy") == true then 
        local umiejetnosc = getElementData(source,"player:strzelec")
        if umiejetnosc > 0 then 
        local szansa = math.random(1,100) 
            if szansa == 1 then 
				setElementData(source,"player:strzelec",umiejetnosc-1)
				triggerClientEvent(source, "addNoti", source, "Zwiększono umiejętność strzelania.", "success" )
            end
        end
    end
end
addEventHandler("onPlayerWeaponFire", root, onPlayerWeaponFireFunc)