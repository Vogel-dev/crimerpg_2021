--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local opcjaPomocnicza = false
local opcjaPomocniczaElementy = {"ped","vehicle","object","pickup","colshape","marker"}

function pokazOpcjePomocnicza()
    if getElementData(localPlayer, "player:admin") then
    local int = getElementInterior(localPlayer)
    local dim = getElementDimension(localPlayer)
    for _,element in ipairs(opcjaPomocniczaElementy) do
        for _,v in ipairs(getElementsByType(element)) do
            if getElementInterior(v) == int and getElementDimension(v) == dim then
			    local model = getElementModel(v)
                local x, y, z = getElementPosition(v)
			    local rx, ry, rz = getElementRotation(v)
				local elementID = getElementID(v)
				local elementParent = getElementParent(v)
				elementParent = getElementParent(elementParent)
				local sx, sy, sz = getScreenFromWorldPosition(x, y, z, 30, false)
		        if (sx) and (sy) and (sz) and (sz) < 30 then
					local opis = string.format("Rodzaj: %s\nModel: %d\nPozycja: %.2f, %.2f, %.2f Rotacja: %.1f, %.1f, %.1f\nInterior: %d Dimension: %d\nID: %s\nZasób: %s", element, model or 0, x, y, z, rx or 0, ry or 0, rz or 0, int, dim, elementID or "brak", getElementID(elementParent))
			        dxDrawText(opis, sx+2, sy+2, sx, sy, tocolor(0, 0, 0, 255), 1, "default", "center", "center", false, false, false, false)
                    dxDrawText(opis, sx, sy, sx, sy, tocolor(105, 188, 235, 255), 1, "default", "center", "center", false, false, false, false)
			end
                end
            end
        end
    end
end

function wlaczaOpcjePomocnicza()
	if opcjaPomocnicza == false then
		opcjaPomocnicza = true
		addEventHandler("onClientRender", getRootElement(), pokazOpcjePomocnicza)
	else
		opcjaPomocnicza = false
		removeEventHandler("onClientRender", getRootElement(), pokazOpcjePomocnicza)
	end
end
addCommandHandler("wh", wlaczaOpcjePomocnicza)