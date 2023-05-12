--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

publicFaggios = {
	--spawn ls
	{1697.53, -1873.0, 13.16, 359.2, 0.0, 90.0},
	{1697.53, -1876.0, 13.16, 359.2, 0.0, 90.0},
	{1697.53, -1879.0, 13.16, 359.2, 0.0, 90.0},
	{1697.53, -1882.0, 13.16, 359.2, 0.0, 90.0},
	{1697.53, -1885.0, 13.16, 359.2, 0.0, 90.0},
}

function respawnFaggios()
	for k,v in pairs(publicFaggios) do
		canSpawn = true
		for k,veh in pairs(getElementsByType("vehicle")) do
			if getDistanceBetweenPoints2D(Vector2(getElementPosition(veh)), v[1], v[2], v[3]) < 3 then
				canSpawn = false
			end
		end
		if canSpawn then
			veh = createVehicle(462, v[1], v[2], v[3], v[4], v[5], v[6])
			setVehicleColor(veh, 255, 255, 255)
			setElementData(veh,"vehicle:desc","#ffffffPojazd publiczny")
			setElementData(veh, "publiczny", true)
			setElementData(veh,"ogranicznik",80)
			setElementFrozen(veh, true)
		end
	end
end

destroyTimers = {}

function deletePublicVehicle(vehicle)
	plr = getElementData(vehicle, "publiczny:owner")
	setElementData(plr, "player:rent:public:car", false)
	destroyTimers[vehicle] = nil
	destroyElement(vehicle)
end

setTimer(respawnFaggios, 10000, 0)
respawnFaggios()

addEventHandler("onVehicleEnter", root, function(plr, seat)
	if getElementData(source, "publiczny") and seat == 0 then
		setElementData(plr, "player:rent:public:car", source)
		setElementData(source, "publiczny:owner", plr)
		setElementData(source,"vehicle:desc","#ffffffPojazd publiczny\n#FFFFFFZajęty przez: #ff8c0a"..getPlayerName(plr).."")
		setElementFrozen(source,false)
		triggerClientEvent(root, "ghostmode", root, source, "on")
		setVehicleEngineState(source,true)
		if destroyTimers[source] and getTimerDetails(destroyTimers[source]) then
			killTimer(destroyTimers[source])
			destroyTimers[source] = nil
		end
	end
end)

addEventHandler("onPlayerQuit", root, function()
	veh = getElementData(source, "player:rent:public:car")
	if veh then
		deletePublicVehicle(veh)
	end
end)

addEventHandler("onVehicleExit", root, function(player, seat)
	if seat == 0 and getElementData(source, "publiczny") then
		destroyTimers[source] = setTimer(deletePublicVehicle, 20000, 1, source)
	end
end)