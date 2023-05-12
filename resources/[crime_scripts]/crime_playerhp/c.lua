--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

element = nil

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx

local dxfont0_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 19/zmienna)
local dxfont1_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 12/zmienna)

function isRendering()
    if not element then return end
    dxDrawRectangle(1252/zmienna, 624/zmienna, 305/zmienna, 153/zmienna, tocolor(25, 25, 25, 200), false)
    exports["crime_gui"]:guitext(removeHex(getPlayerName(element)), 1252/zmienna, 624/zmienna, 1557/zmienna, 673/zmienna, 255, 255, 255, 255, dxfont0_FiraEC, "center", "center")

    local hp = getElementHealth(element)
    local liniahp = 248 * (hp / 100)

    local armor = getPlayerArmor(element)
    local liniaarmor = 248 * (armor / 100)

    dxDrawImage(1282/zmienna, 677/zmienna, 248/zmienna, 37/zmienna, ":crime_hud/hp.png", 0, 0, 0, tocolor(39, 35, 33, 255), false)
    dxDrawImage(1282/zmienna, 724/zmienna, 248/zmienna, 37/zmienna, ":crime_hud/hp.png", 0, 0, 0, tocolor(39, 35, 33, 255), false)

    dxDrawImage(1282/zmienna, 677/zmienna, liniahp/zmienna, 37/zmienna, ":crime_hud/hp.png", 0, 0, 0, tocolor(220, 0, 0, 255), false)
    dxDrawImage(1282/zmienna, 724/zmienna, liniaarmor/zmienna, 37/zmienna, ":crime_hud/hp.png", 0, 0, 0, tocolor(60, 60, 60, 255), false)

    exports["crime_gui"]:guitext("Zdrowie", 1252/zmienna, 677/zmienna, 1557/zmienna, 714/zmienna, 255, 255, 255, 255, dxfont1_SegoeLight, "center", "center")
    exports["crime_gui"]:guitext("Pancerz", 1252/zmienna, 724/zmienna, 1557/zmienna, 761/zmienna, 255, 255, 255, 255, dxfont1_SegoeLight, "center", "center")

end

function isPedAiming ( thePedToCheck )
	if isElement(thePedToCheck) then
		if getElementType(thePedToCheck) == "player" or getElementType(thePedToCheck) == "ped" then
			if getPedTask(thePedToCheck, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
				return true
			end
		end
	end
	return false
end

addEventHandler("onClientPlayerTarget",root, function(el)
    if isPedAiming(localPlayer) and el then
        if getElementData(el,"p:inv") then return end
        if getElementType(el) == "player" then
            element=el
            addEventHandler("onClientHUDRender", root, isRendering)
        end
    else
        element = nil
        removeEventHandler("onClientHUDRender", root, isRendering)
    end
end)

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end