--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function checkChange(data, stara)
    if data == "player:exp" then 
        local exp = getElementData(source,"player:exp")
        local lvl = getElementData(source,"player:lvl")
        if exp >= 100 then 
            setElementData(source,"player:exp",exp-100)
            setElementData(source,"player:lvl",lvl+1)
        end
    end
end
addEventHandler("onElementDataChange", root, checkChange)

function this ( theResource ) 
	local they = getResourceFromName ( "crime_hud" ) 
if getResourceFromName then 
	restartResource(they) 
	end 
end 
setTimer(this, 1000*180,0) 
