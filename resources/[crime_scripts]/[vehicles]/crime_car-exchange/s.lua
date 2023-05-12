--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local x,y,z = 2240.85, -1415.92, 30.05
local blip = createBlip(x, y, 20, 13, 0, 0, 0, 0, 0, 0, 200)


local cuboid = createColCuboid(2223.14453125, -1473.8491210938, 28.038436889648,58,80, 5)

--WYSTAWIANIE I ELEMENT DATY
addEvent("wystawpojazd:gielda", true)
addEventHandler("wystawpojazd:gielda", root, function(pojazd, cena)
	local veh = pojazd
	local plr = source
	
	setElementData(veh,"wystawiony",true)
	setElementData(veh,"cena",cena)
	setElementData(veh,"wlasciciel",getPlayerName(plr))
	setElementData(veh,"vehicle:desc","#ccccccWłaściciel:#97DC91 "..getElementData(veh,"wlasciciel").."\n#ccccccCena:#97DC91 "..formatujnaprzecinki(string.format("%06d", getElementData(veh,"cena"))).." PLN\n#ccccccPodejdź do pojazdu po więcej informacji!")
	local x,y,z = getElementPosition(veh)
	local cub = createMarker(x,y,z-1,"cylinder",4,90, 55, 150,1)
	attachElements (cub, veh,0,0,-0.7)

	setElementData(cub,"pojazd",veh)
	setElementData(cub,"id",getElementData(veh,"vehicle:id"))
	local model = getVehicleNameFromModel(getElementModel(veh))
	modelname = exports["crime_modelnames"]
	model = modelname:getText(model)
	setElementData(cub,"model",model)
	setElementData(cub,"paliwo",getElementData(veh,"vehicle:fuel"))
	setElementData(cub,"przebieg",getElementData(veh,"vehicle:mileage"))
	setElementData(cub,"cena",cena)
	setElementData(cub,"wlasciciel",getPlayerName(plr))
	
end)

--USUWANIE CUBA
addEvent("usuncuboid:gielda", true)
addEventHandler("usuncuboid:gielda", root, function(pojazd)
	local veh = pojazd
	if veh then
		local idauta = getElementData(veh,"vehicle:id")
		if not idauta then return end
		for i,v in ipairs(getElementsByType("marker")) do
			if getElementData(v,"id") == idauta then 
				destroyElement(v)
			end
		end
	end
end)

addEvent("kuppojazd:gielda", true)
addEventHandler("kuppojazd:gielda", root, function(pojazd, cena, wlasciciel)
	local plr = source
	local veh = pojazd
	if getElementData(veh,"wystawiony") then
		local kasa = getPlayerMoney(plr)
		if not tonumber(cena) then return end 
		cena = tonumber(cena)
		if getPlayerName(plr) == wlasciciel then triggerClientEvent(plr, "addNoti", plr, "Ten pojazd należy do ciebie.", "error" ) return end
		if cena > kasa then triggerClientEvent(plr, "addNoti", plr, "Nie posiadasz tyle pieniędzy.", "error" ) return end
		
		takePlayerMoney(plr,cena)
		

		local ownerd = wlasciciel:gsub('#%x%x%x%x%x%x', '')
		exports["crime_database"]:dbSet("UPDATE crime_users SET bank_money=bank_money+?? WHERE id=? LIMIT 1",tonumber(cena),getElementData(veh,"vehicle:ownedPlayer"))
		exports["crime_database"]:dbSet("INSERT INTO logs_atms (typ, kwota, serial, uid) VALUES (?,?,?,?)", "gielda", tonumber(cena), getPlayerSerial(plr),getElementData(veh,"vehicle:ownedPlayer"))
		local model = getVehicleName(veh)
		triggerClientEvent(plr, "addNoti", plr, "Kupiłeś pojazd marki "..model.." za "..cena.." PLN od "..ownerd.."", "success" )
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_cars (nick,tresc) VALUES (?,?)", "#DDDDDD└"..getElementData(plr,"id").."┘ "..getPlayerName(plr).."", "#5a3795KUPIŁ POJAZD Z #00FF00GIEŁDY #cccccc "..model.." za "..cena.." PLN od "..ownerd.."")
		

		
		setElementData(veh,"vehicle:ownedPlayer",getElementData(plr,"player:uid"))

		local idauta = getElementData(veh,"vehicle:id")
		for i,v in ipairs(getElementsByType("marker")) do
			if getElementData(v,"id") == idauta then 
				destroyElement(v)
			end
		end

		local test = exports["crime_vehicles"]:onSaveVehicle(veh)
		destroyElement(veh)
		exports["crime_database"]:dbSet("UPDATE crime_vehicles SET parking=1, ownedPlayer=?, ownedGroup=? WHERE id=?", getElementData(plr,"player:uid"), "", idauta)


		local nick = getPlayerName(plr)
		local spawn=exports["crime_vehicles"]:onRespawnVehicles(_,idauta,{1002.10, -1825.65, 13.48, 2.0, 359.0, 343.5},nick)
		
	end
end)

--WLACZANIE INFO
addEventHandler("onMarkerHit", resourceRoot, function(hit)
	if getElementType(hit) ~= "player" then return end
	local pojazd = getPedOccupiedVehicle(hit)
	if pojazd then return end
	local auto = getElementData(source, "pojazd")
	if isElement(auto) then 
		local dokladniej = getElementData(auto,"vehicle:id")
		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE id=? ", dokladniej)
		if #result > 0 then
			triggerClientEvent(hit, "cuboid", hit, auto, result)
		end
	end
end)

--WYLACZANIE INFO
addEventHandler("onMarkerLeave", resourceRoot, function(hit)
	if getElementType(hit) ~= "player" then return end
	local pojazd = getPedOccupiedVehicle(hit)
	if pojazd then return end
	local auto = getElementData(source, "pojazd")
	if isElement(auto) then 
		local dokladniej = getElementData(auto,"vehicle:id")
		triggerClientEvent(hit, "cuboidoff", hit)
	end
end)

--Z DUZEGO SYFA

function wyjechal(hit)
	if getElementType(hit) == "vehicle" then
	veh = hit
		local idauta = getElementData(veh,"vehicle:id")
		if not idauta then return end
		
		for i,v in ipairs(getElementsByType("marker")) do
			if getElementData(v,"id") == idauta then 
				destroyElement(v)
			end
		end
		
		if getElementData(veh,"wystawiony") then
			setElementData(veh,"wystawiony",false)
			setElementData(veh,"cena",false)
			setElementData(veh,"wlasciciel",false)
			setElementData(veh,"vehicle:desc",false)
		end
	end
end
addEventHandler("onColShapeLeave", cuboid, wyjechal)


function formatujnaprzecinki(amount) 
	local formatted = amount 
	while true do   
	  formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2') 
	  if (k==0) then 
		break 
	  end 
	end 
	return formatted 
  end