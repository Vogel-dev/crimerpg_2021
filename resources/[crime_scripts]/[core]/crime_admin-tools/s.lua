--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("server:suszarkaczynnosc", true)
addEventHandler("server:suszarkaczynnosc", root, function(selected,czynnosc)
	if not selected then return end 
	if not czynnosc then return end 
	if czynnosc == "fix" then 
		fixVehicle(selected)
		takePlayerMoney(source,500)
		triggerClientEvent(source, "addNoti", source, "Naprawiłeś pojazd za 500 PLN.", "info" )
	elseif czynnosc == "paliwo" then
		if getElementData(selected,"vehicle:fuel")+5 > getElementData(selected,"vehicle:bak") then triggerClientEvent(source, "addNoti", source, "Nie zatankujesz tyle.", "error" ) return end
		setElementData(selected,"vehicle:fuel",getElementData(selected,"vehicle:fuel")+5)
		takePlayerMoney(source,500)
		triggerClientEvent(source, "addNoti", source, "Zatankowałeś 5l za 500 PLN.", "info" )
	elseif czynnosc == "przecho" then
		local idauta = getElementData(selected,"vehicle:id")
		if not idauta then return end
		local test = exports["crime_vehicles"]:onSaveVehicle(selected)
		destroyElement(selected)
		exports["crime_database"]:dbSet("UPDATE crime_vehicles SET parking=1 WHERE id=?", idauta)
		triggerClientEvent(source, "addNoti", source, "Wysłałeś pojazd do przechowalni.", "info" )
	elseif czynnosc == "docbauto" then
		local x,y,z = getElementPosition(source)
		setElementPosition(selected,x,y,z-0.2)
		setElementPosition(source,x,y,z+1)
	elseif czynnosc == "reczny" then
		triggerClientEvent(source, "addNoti", source, "Zaciągnąłeś ręczny.", "info" )
		setElementFrozen(selected,true)
	elseif czynnosc == "spuscreczny" then
		triggerClientEvent(source, "addNoti", source, "Spuściłeś ręczny.", "info" )
		setElementFrozen(selected,false)
	elseif czynnosc == "pion" then
		local rx,ry,rz = getElementRotation(selected)
		setElementRotation(selected,rx+90,ry,rz)
	elseif czynnosc == "dach" then
		local rx,ry,rz = getElementRotation(selected)
		setElementRotation(selected,rx,ry+90,rz)
	elseif czynnosc == "lewoprawo" then
		local rx,ry,rz = getElementRotation(selected)
		setElementRotation(selected,rx,ry,rz+90)
	elseif czynnosc == "otworz" then
		triggerClientEvent(source, "addNoti", source, "Otworzyłeś pojazd.", "info" )
		setVehicleLocked(selected,false)
	elseif czynnosc == "tpdoauta" then
		if getElementData(source,"player:level") < 2 then triggerClientEvent(source, "addNoti", source, "Posiadasz za niską rangę.", "error" ) return end
		warpPedIntoVehicle(source,selected)
	elseif czynnosc == "infoveh" then
		local rejestracja = getVehiclePlateText(selected)
		local hp = getElementHealth(selected) or "info"
		local id = getElementData(selected,"vehicle:id") or "info"
		local paliwo = getElementData(selected,"vehicle:fuel") or 0
		local przebieg = getElementData(selected,"vehicle:mileage") or 0
		local owner = getElementData(selected,"vehicle:ownedPlayer") or "info"
		local driverasd = getElementData(selected,"vehicle:driver") or "info"
		local driverasd = driverasd or "info"
		local model = getVehicleNameFromModel(getElementModel(selected)) or "info"
		modelname = exports["crime_modelnames"]
		model = modelname:getText(model)
		sad = tostring("#ccccccUID Właściciela: #5a3795"..owner.."\n#ccccccOstatni kierowca: #5a3795"..tostring(driverasd).."\n#ccccccPrzebieg: #5a3795"..math.floor(przebieg).."km\n#ccccccPaliwo: #5a3795"..math.floor(paliwo).."L\n#ccccccID: #5a3795"..id.."\n#ccccccHP: #5a3795"..hp.."/1000\n#ccccccRejestracja: #5a3795"..rejestracja.."\n#ccccccModel: #5a3795"..model.."")
		outputChatBox("#5a3795======================",source,255,255,255,true)
		outputChatBox(sad,source,255,255,255,true)
		outputChatBox("#5a3795======================",source,255,255,255,true)
	elseif czynnosc == "100hpgracz" then
		triggerClientEvent(source, "addNoti", source, "Uleczyłeś gracza.", "info" )
		setElementHealth(selected,100)
	elseif czynnosc == "tpdogracz" then
		local x,y,z = getElementPosition(selected)
		setElementPosition(source,x,y,z+1)
	elseif czynnosc == "tpdocbgracz" then
		local x,y,z = getElementPosition(source)
		setElementPosition(selected,x,y,z+1)
	elseif czynnosc == "100armoru" then
		triggerClientEvent(source, "addNoti", source, "Nadałeś 100% armoru.", "info" )
		setPedArmor(selected,100)
	end
end)