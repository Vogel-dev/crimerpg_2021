--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize() 
local zoom = sx < 1920 and math.min(2, 1920 / sx) or 1

local gears = {
    [0] = dxCreateTexture("files/0.png", "argb", true, "clamp"),
    [1] = dxCreateTexture("files/1.png", "argb", true, "clamp"),
    [2] = dxCreateTexture("files/2.png", "argb", true, "clamp"),
    [3] = dxCreateTexture("files/3.png", "argb", true, "clamp"),
    [4] = dxCreateTexture("files/4.png", "argb", true, "clamp"),
    [5] = dxCreateTexture("files/5.png", "argb", true, "clamp"),
}

local font_b = dxCreateFont("files/b.ttf", 100)

function render()
    local vehicle = getPedOccupiedVehicle(localPlayer)
    if not vehicle then return end
    if not getElementData(localPlayer, 'newhud') then return end
    local speed = math.floor(getVehicleSpeed(vehicle))
    local gear = getVehicleCurrentGear(vehicle)
    dxDrawImage(1657/zoom, 946/zoom, 58/zoom, 78/zoom, gears[gear])
    if speed < 100 then
        if speed == 0 then
            dxDrawText("000", 1715/zoom, 1078/zoom,  1715/zoom, 1078/zoom, tocolor(255, 255, 255, 100), 1/zoom, font_b, "left", "bottom")
        elseif speed < 10 then
            dxDrawText("00", 1715/zoom, 1078/zoom,  1715/zoom, 1078/zoom, tocolor(255, 255, 255, 100), 1/zoom, font_b, "left", "bottom")
            dxDrawText(speed, (1715+dxGetTextWidth("00", 1/zoom, font_b))/zoom, 1078/zoom,  (1715+dxGetTextWidth("0", 1/zoom, font_b))/zoom, 1078/zoom, tocolor(255, 255, 255, 200), 1/zoom, font_b, "left", "bottom")
        else
            dxDrawText("0", 1715/zoom, 1078/zoom,  1715/zoom, 1078/zoom, tocolor(255, 255, 255, 100), 1/zoom, font_b, "left", "bottom")
            dxDrawText(speed, (1715+dxGetTextWidth("0", 1/zoom, font_b))/zoom, 1078/zoom,  (1715+dxGetTextWidth("0", 1/zoom, font_b))/zoom, 1078/zoom, tocolor(255, 255, 255, 200), 1/zoom, font_b, "left", "bottom")
        end
    else
        dxDrawText(speed, 1715/zoom, 1078/zoom, 1715/zoom, 1078/zoom, tocolor(255, 255, 255, 200), 1/zoom, font_b, "left", "bottom")
    end
    local data = getElementData(vehicle, "vehicle:data")
    if not data then return end
    if getVehicleUpgradeOnSlot(vehicle, 8) ~= 0 then
        dxDrawRectangle(1666/zoom, 1026/zoom, 110/zoom, 2, tocolor(255, 255, 255, 100))
        dxDrawRectangle(1666/zoom, 1026/zoom, (110*(data.fuel/data.maxfuel))/zoom, 2, tocolor(255, 255, 255, 100))

        dxDrawRectangle(1786/zoom, 1026/zoom, 110/zoom, 2, tocolor(0, 65, 255, 100))
        dxDrawRectangle(1786/zoom, 1026/zoom, (110*(getVehicleNitroLevel(vehicle) or 0))/zoom, 2, tocolor(0, 85, 255, 100))
    elseif getVehicleUpgradeOnSlot(vehicle, 8) == 0 then
        dxDrawRectangle(1666/zoom, 1026/zoom, 230/zoom, 2, tocolor(255, 255, 255, 100))
        dxDrawRectangle(1666/zoom, 1026/zoom, (230*(data.fuel/data.maxfuel))/zoom, 2, tocolor(255, 255, 255, 100))
    end
end
addEventHandler("onClientRender", getRootElement(), render)

function getVehicleSpeed(vehicle)
    assert(isElement(vehicle), "Bad argument 1 @ getVehicleSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(vehicle)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    local mult = 180
    return (Vector3(getElementVelocity(vehicle)) * mult).length
end