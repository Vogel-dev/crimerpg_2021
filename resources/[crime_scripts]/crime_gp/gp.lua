--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addCommandHandler("fcgp",function() 
    outputChatBox("Interior: " .. getElementInterior(localPlayer) .. " Dimension: " .. getElementDimension(localPlayer))
    local x,y,z = getElementPosition(localPlayer)
    p = string.format("%.2f, %.2f, %.2f", x,y,z)
    outputChatBox("Pozycja gracza: ".. p)
    setClipboard(p)
    
    local pojazd = getPedOccupiedVehicle(localPlayer)
    if pojazd then
        local x,y,z = getElementPosition(pojazd)
        local rx,ry,rz = getElementRotation(pojazd)
        p = string.format("%.2f, %.2f, %.2f, %.1f, %.1f, %.1f", x, y, z, rx, ry, rz)
        outputChatBox("Pozycja pojazdu: ".. p)
        setClipboard(p)
    end
end)
