--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addCommandHandler("spawn", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 1817.03, -1359.42, 15.08)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Spawn')
end)

addCommandHandler("lv", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 2140.8190, 986.2273, 10.8203)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Las Venturas')
end)

addCommandHandler("urzad", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 1765.68, -1346.40, 15.76)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Urzad')
end)

addCommandHandler("ls", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 1480.92, -1767.10, 18.80)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Los Santos')
end)

addCommandHandler("sf", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1584.76,808.61,6.82)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: San Fierro')
end)

addCommandHandler("przebieralnia", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 481.30, -1534.59, 19.60)
    setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Przebieralnia')
end)


addCommandHandler("mc", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -2301.9609, -1648.8076, 483.6195)
    setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Mount Chilliad')
end)


addCommandHandler("przecho", function(el,md)
	if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 1823.28, -1403.63, 13.43)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Przechowywalnia')
end)

addCommandHandler("tuner", function(el,md)
	if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 1953.36, -1961.91, 13.64)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Przechowywalnia')
end)

addCommandHandler("cygan", function(el,md)
	if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 2524.13, -1521.87, 23.90)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Przechowywalnia')
end)

addCommandHandler("gielda", function(el,md)
	if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 1002.36, -1866.84, 12.81)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Przechowywalnia')
end)

addCommandHandler("kasyno", function(el,md)
	if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 913.33, -998.58, 38.10)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Przechowywalnia')
end)

addCommandHandler("prawko", function(el,md)
	if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 1738.19, -1860.97, 13.58)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Przechowywalnia')
end)

addCommandHandler("derbyteleport", function(el,md)
	if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 5999.74, -984.49, 12.45)
	setElementDimension(gracz,0)
    --triggerClientEvent(el, 'alerts:create_alert', root, 'info', ' Teleportowano do: Przechowywalnia')
end)