--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local kratki={}
klatka = {}
local komenda = "klatka"

addCommandHandler(komenda, function(plr, cmd, target)
	if not getElementData(plr, "player:admin") then return false end
	if not target then return end

	local cel=exports["crime_core"]:findPlayer(plr,target)
	if not cel then
		return triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
	end

	local x,y,z=getElementPosition(cel)
	local dim=getElementDimension(cel)
	local int=getElementInterior(cel)

	if kratki[cel] then
		for i=1, #kratki[cel] do
			if isElement(kratki[cel][i]) then
				destroyElement(kratki[cel][i])
			end
		end
		kratki[cel]=nil
	end

	kratki[cel]={}
	kratki[cel][1]=createObject(971, x, y, z-0.9, 270, 0, 180.0)
	kratki[cel][2]=createObject(971, x, y, z+6, 270, 0, 180)
	kratki[cel][3]=createObject(971, x, y+3.5, z+2.5, 0, 0, 0)
	kratki[cel][4]=createObject(971, x-4.5, y, z+2.5, 0, 0, 270)
	kratki[cel][5]=createObject(971, x, y-3.5, z+2.5, 0, 0, 180)
	kratki[cel][6]=createObject(971, x+4, y, z+2.5, 0, 0, 270) 
	table.insert ( klatka, kratki[cel][1] )
	table.insert ( klatka, kratki[cel][2] )
	table.insert ( klatka, kratki[cel][3] )
	table.insert ( klatka, kratki[cel][4] )
	table.insert ( klatka, kratki[cel][5] )
	table.insert ( klatka, kratki[cel][6] )
	

	setElementInterior(kratki[cel][1], int)
	setElementDimension(kratki[cel][1], dim)
	setElementInterior(kratki[cel][2], int)
	setElementDimension(kratki[cel][2], dim)
	setElementInterior(kratki[cel][3], int)
	setElementDimension(kratki[cel][3], dim)
	setElementInterior(kratki[cel][4], int)
	setElementDimension(kratki[cel][4], dim)
	setElementInterior(kratki[cel][5], int)
	setElementDimension(kratki[cel][5], dim)
	setElementInterior(kratki[cel][6], int)
	setElementDimension(kratki[cel][6], dim)
	triggerClientEvent(plr, "addNoti", plr, "Stworzono klatkę, aby usunąć wpisz /usunklatke (nick/id)", "success" )
end)

function zabezpieczenie()
	if kratki[source] then
		for i=1, #kratki[source] do
			if isElement(kratki[source][i]) then
				destroyElement(kratki[source][i])
			end
		end
		kratki[source]=nil
	end
end
addEventHandler("onPlayerQuit", root, zabezpieczenie)

addCommandHandler ( "usunklatke", function(plr, cmd, target)
	if not getElementData(plr, "player:admin") then triggerClientEvent(plr, "addNoti", plr, "Nie posiadasz dostępu do tej komendy", "error" ) return end
	if not target then 
		return
	end

	local cel=exports["crime_core"]:findPlayer(plr,target)
	if not cel then
		triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego przez Ciebie gracza.", "error" )
		return
	end
	if kratki[cel] then
		for i=1, #kratki[cel] do
			if isElement(kratki[cel][i]) then
				destroyElement(kratki[cel][i])
			end
		end
		kratki[cel]=nil
	end
end)