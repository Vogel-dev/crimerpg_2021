local vehiclesToSpawn =
{
	{557, 5, 0, 3},
	{557, 0, 5, 3},
}

local spawnpoints =
{
	{0, 0, 0, 0},
	{0, 0, 0, 180},
}

local vehicleDestroyTimers = {}
local validSkins = {0, 0}
local playerVehicles = {}

local function spawn(player)

	if player and isElement(player) then
		local x,y,z,r = unpack(spawnpoints[math.random(1,#spawnpoints)])
		spawnPlayer(player,x+math.random(-3,3),y+math.random(-3,3),z,r,validSkins[math.random(1,#validSkins)],0,0)
		fadeCamera(player, true)
		setCameraTarget(player, player)
	end
end

local function onJoin()

	spawn(source)

end

local function onWasted()

	local t = tonumber(get("playerRespawnTime")) or 5000
	setTimer(spawn,(t > 50 and t or 50),1,source)

end

local function destroyPlayerVehicles()

	local vehicles = playerVehicles[source]

	for _,vehicle in ipairs(vehicles) do
		if isElement(vehicle) then
			destroyElement(vehicle)
		end
	end

	playerVehicles[source] = nil

end

local function onEnter(player)

	local t = tonumber(get("vehicleRespawnTime")) or 60000
	source.damageProof = false
	source.frozen = false
	local vehicledata = vehiclesToSpawn[source]
	setTimer(createNewVehicle,(t > 50 and t or 50),1,vehicledata)
	vehiclesToSpawn[source] = nil
	if not playerVehicles[player] then
		playerVehicles[player] = {}
		addEventHandler("onPlayerQuit",player,destroyPlayerVehicles)
	end
	table.insert(playerVehicles[player],source)
	removeEventHandler("onVehicleEnter",source,onEnter)

end

local function destroyVehicle(vehicle)

	if vehicle and isElement(vehicle) and getElementType(vehicle) == "vehicle" then
		destroyElement(vehicle)
	end
end

local function destroyTimer()

	if vehicleDestroyTimers[source] and isTimer(vehicleDestroyTimers[source]) then killTimer(vehicleDestroyTimers[source]) end
	removeEventHandler("onVehicleEnter",source,destroyTimer)

end

local function onExit()

	local t = tonumber(get("vehicleExpireTime")) or 600000
	vehicleDestroyTimers[source] = setTimer(destroyVehicle,(t > 50 and t or 50),1,source)
	addEventHandler("onVehicleEnter",source,destroyTimer)

end

function createNewVehicle(vehicledata)

	local m,x,y,z,r = unpack(vehicledata)
	local vehicle = Vehicle(m,x,y,z,0,0,r)
	vehicle.damageProof = true
	vehicle.frozen = true
	vehiclesToSpawn[vehicle] = vehicledata
	addEventHandler("onVehicleEnter",vehicle,onEnter)
	addEventHandler("onVehicleExit",vehicle,onExit)

end

local function initScript()

	resetMapInfo()
	local players = getElementsByType("player")

	for _,player in ipairs(players) do spawn(player) end
	for _,vehicledata in ipairs(vehiclesToSpawn) do createNewVehicle(vehicledata) end

	addEventHandler("onPlayerJoin",root,onJoin)
	addEventHandler("onPlayerWasted",root,onWasted)

end

addEventHandler("onResourceStart",resourceRoot,initScript)
