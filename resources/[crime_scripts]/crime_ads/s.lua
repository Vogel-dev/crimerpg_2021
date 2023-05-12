--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local dwa = createElement("ogloszenia")

function ogloszenie ( source, cmd, ... )
if not getElementData(source,"player:premium") then triggerClientEvent(source, "addNoti", source, "Nie posiadasz konta premium", "error" ) return end
	if ... then
		if not getElementData ( dwa, "ogloszenie" ) then
			local text = table.concat({...}, " " )
			if string.len(text) > 120 then triggerClientEvent(source, "addNoti", source, "Ogłoszenie nie może zawierać więcej niż 120 znaków", "error" ) return end 
			setElementData ( dwa, "ogloszenie", true )
			triggerClientEvent(root, "addNoti", root, ""..getPlayerName(source):gsub("#%x%x%x%x%x%x","").." ("..getElementData ( source, "id").."): "..text.."", "premium" )
			setTimer(function()
				setElementData(dwa, "ogloszenie", false)
			end,1000*20,1)
		else
			triggerClientEvent(source, "addNoti", source, "Ogłoszenia mogą być nadawane raz na 20 sekund", "error" )

		end
	else
		triggerClientEvent(source, "addNoti", source, "Użycie: /ogloszenie (treść)", "error" )
	end
end
addCommandHandler("ogloszenie", ogloszenie)

