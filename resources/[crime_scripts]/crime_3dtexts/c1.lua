--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local czcionka = dxCreateFont ( ":crime_files/fonts/FiraEC.ttf" ,13)
addEventHandler("onClientRender", root, function()
    for i,v in ipairs(getElementsByType("srtext")) do
        local rx, ry, rz = getCameraMatrix()
        local x, y, z = getElementPosition(v)
        local sy, sx = getScreenFromWorldPosition(x, y, z + 0.5)
        local dystans = getDistanceBetweenPoints3D(rx, ry, rz, x, y, z)
        local dimensions = getElementDimension(localPlayer) == getElementDimension(v)
        local interiors = getElementInterior(localPlayer) == getElementInterior(v)
        if dystans < 15 and sy and sx and interiors and dimensions then
            local sad1 = processLineOfSight (rx,ry,rz,x,y,z,true,false,false,false)
            if sad1 == false then
                local text = getElementData(v, "name") or " "
                dxDrawText(text:gsub ("#%x%x%x%x%x%x", ""), sy+1, sx + 5+1, sy+1, sx+1, tocolor(0, 0, 0, 255), 1, czcionka, "center", "center", false,false,false,true)
                dxDrawText(text, sy, sx + 5, sy, sx, tocolor(255, 255, 255, 255), 1, czcionka, "center", "center", false,false,false,true)
            end
        end
    end
    for i,v in ipairs(getElementsByType("srtabela")) do
        local rx, ry, rz = getCameraMatrix()
        local x, y, z = getElementPosition(v)
        local sy, sx = getScreenFromWorldPosition(x, y, z + 0.5)
        local dystans = getDistanceBetweenPoints3D(rx, ry, rz, x, y, z)
        local dimensions = getElementDimension(localPlayer) == getElementDimension(v)
        local interiors = getElementInterior(localPlayer) == getElementInterior(v)
        if dystans < 15 and sy and sx and interiors and dimensions then
            local sad1 = processLineOfSight (rx,ry,rz,x,y,z,true,false,false,false)
            if sad1 == false then
                local text = getElementData(v, "name") or " "
                
                dxDrawRectangle(sy-200,sx-150,400,310,tocolor(40,42,50,200))
                dxDrawText(text, sy, sx + 5, sy, sx, tocolor(255,255,255, 255), 1, czcionka, "center", "center", false,false,false,true)
            end
        end
    end
end)