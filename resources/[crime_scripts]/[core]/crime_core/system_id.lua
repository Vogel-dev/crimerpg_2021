--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function findPlayer(plr,cel)
	local target=nil
	if (tonumber(cel) ~= nil) then
		target=getElementByID("p"..cel)
	else -- podano fragment nicku
		for _,thePlayer in ipairs(getElementsByType("player")) do
			if string.find(string.gsub(getPlayerName(thePlayer):lower(),"#%x%x%x%x%x%x", ""), cel:lower(), 0, true) then
				if (target) then
					triggerClientEvent(plr, "addNoti", plr, "Znaleziono więcej niż 1 gracza!", "error" ) 
					return nil
				end
				target=thePlayer
			end
		end
	end
	if target and getElementData(target,"p:inv") then return nil end
	return target
end

local function findFreeValue(tablica_id)
	table.sort(tablica_id)
	local wolne_id=1
	for i,v in ipairs(tablica_id) do
		if (v==wolne_id) then wolne_id=wolne_id+1 end
		if (v>wolne_id) then return wolne_id end
	end
	return wolne_id
end

function assignPlayerID(plr)
	local gracze=getElementsByType("player")
	local tablica_id = {}
	for i,v in ipairs(gracze) do
		local lid=getElementData(v, "id")
		if (lid) then
			table.insert(tablica_id, tonumber(lid))
		end
	end
	local free_id=findFreeValue(tablica_id)
	if isElement(plr) then
	setElementData(plr,"id", free_id)
	setElementID(plr, "p" .. free_id)
	end
	return free_id
end

function getPlayerID(plr)
	if not plr then return "" end
	local id=getElementData(plr,"id")
	if (id) then
		return id
	else
		return assignPlayerID(plr)
	end
	
end

addEventHandler ("onPlayerJoin", getRootElement(), function()
	assignPlayerID(source)
end)