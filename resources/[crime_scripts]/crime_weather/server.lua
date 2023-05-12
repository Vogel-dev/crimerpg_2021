--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function zmienpogode()
	local pogoda = math.random(1,2)
	if pogoda == 1 then 
		pogoda2 = math.random(1,7)
	elseif pogoda == 2 then 
		pogoda2 = math.random(10,15)
	end
    setWeather(pogoda2)
end

setTimer(function()
    zmienpogode()
end, 1000*60*60, 0)
