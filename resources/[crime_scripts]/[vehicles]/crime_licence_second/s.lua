--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("license:zdaj",true)
addEventHandler("license:zdaj",resourceRoot,function(type)
	local dbid = getElementData(client,"player:uid")
	exports['crime_database']:dbSet("UPDATE crime_users SET pj"..type.."=? WHERE id=?",1,dbid)
end)

addEvent("license:do",true)
addEventHandler("license:do", resourceRoot, function(cost,selected)
	if tonumber(cost) <= getPlayerMoney(client) then
		--takePlayerMoney(client,cost)
	end

	local veh=nil
	if selected == "A" then veh=createVehicle(586,1643.30, -1523.89, 13.08, 359.9, 359.9, 179.8)
	elseif selected == "B" then veh=createVehicle(436,1643.15, -1523.34, 13.15, 0.7, 359.9, 179.6)
	elseif selected == "C" then veh=createVehicle(456,1636.53, -1526.89, 13.78, 360.0, 359.8, 180.0)
	elseif selected == "L" then veh=createVehicle(593, 324123123.69, 2543.67, 17.28, 359.4, 360.0, 179.0) end

	triggerClientEvent(root, "ghostmode", root, veh, "on")
	setVehicleColor(veh,255, 255, 255, 255, 255, 255)
	setVehicleHandling(veh, "maxVelocity", 60.0)
	if not veh then return end
	if selected == "L" then
		setElementData(veh,"vehicle:desc",""..selected)
	else
		local nick = getPlayerName(client)
		setElementData(veh,"vehicle:desc","#ccccccEgzamin kategorii: #5a3795"..selected.."#cccccc\nZdający: "..nick.."")
		ped = createPed(17,0,0,0)
		setElementData(ped,"wlascicielpeda",veh)
		warpPedIntoVehicle(ped,veh,1)
	end
	setElementData(veh,"vehicle:mileage",0)
	
	setElementData(veh,"autozprawka",true)
	setElementData(veh,"vehicle:fuel",100)
	setElementData(veh,"vehicle:lic",true)

	setElementDimension(client,0)
	setElementInterior(client,0)
	warpPedIntoVehicle(client,veh)
	triggerClientEvent(client, "license:start", resourceRoot, selected, veh)

end)

addEvent("license:vehdel", true)
addEventHandler("license:vehdel", resourceRoot, function(veh)
	destroyElement(veh)
	for i,v in pairs(getElementsByType("ped")) do 
		if getElementData(v,"wlascicielpeda") == veh then 
			destroyElement(v)
		end
	end
end)

addEventHandler("onPlayerQuit", root, function()
	local veh=getPedOccupiedVehicle(source)
	if not veh then return end
	if getVehicleController(veh) ~= source then return end
	if not getElementData(veh,"vehicle:lic") then return end
	destroyElement(veh)
	for i,v in pairs(getElementsByType("ped")) do 
		if getElementData(v,"wlascicielpeda") == veh then 
			destroyElement(v)
		end
	end
end)

addEventHandler("onVehicleDamage", resourceRoot, function(loss)
	local kierowca=getVehicleController(source)
	if not kierowca then return end
	if not getElementData(source,"vehicle:lic") then return end
	destroyElement(source)
	for i,v in pairs(getElementsByType("ped")) do 
		if getElementData(v,"wlascicielpeda") == source then 
			destroyElement(v)
		end
	end
	triggerClientEvent(kierowca, "addNoti", kierowca, "Stworzenie zagrożenia, egzamin przerwany z wynikiem negatywnym.", "error" )
	triggerClientEvent(kierowca, "license:finish", resourceRoot, true)
	setTimer ( function()
		setElementPosition(kierowca,1644.27, -1547.99, 13.65)
		setElementDimension(kierowca,0)
		setElementInterior(kierowca,0)
	end, 51.001, 1 )
end)

addEventHandler("onVehicleStartExit", resourceRoot, function()
	cancelEvent()
end)