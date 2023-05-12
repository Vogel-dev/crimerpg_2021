--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

interiory={}


local dane=exports.crime_database_2:pobierzTabeleWynikow("SELECT id,interior,entrance,`exit` FROM crime_house_interiors WHERE `exit` IS NOT NULL AND active=1")
for _,v in ipairs(dane) do
	local ii = tonumber(v.id)
	v.entrance=split(v.entrance,",")	-- miejsce w ktorym pojawi sie gracz
	v.exit=split(v.exit,",")			-- wyjscie
	
	v.id=nil
	interiory[ii]=v
end

addEvent("moveMeTo", true)
addEventHandler("moveMeTo", resourceRoot, function(x,y,z,i,d)
	setElementDimension(client, d)
	setElementInterior(client,i,x,y,z)
	setElementPosition(client,x,y,z)
	setElementInterior(client,i)
end)