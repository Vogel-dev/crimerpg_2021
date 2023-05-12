--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

radarArea = {
    -- {2487.24, 641.03, 250, 180, 255, 0, 0, 175}, --lv obok wody

    {88.83, 1747.02, 310, 400, 255, 0, 0, 175}, --area 51

    {2356.02, -2736.34, 500, 425, 255, 0, 0, 175}, --ls doki
}
cuboid = {
    -- {2487.24, 641.03, 0, 250, 180, 50, "sad"},  --lv obok wody

    -- {-3094.25, -515.61, -34.34, 1800, 2100, 400, "sad"},  --duze sf

    {88.83, 1747.02, -40.64, 310, 400, 100, "sad"},  --area51

    {2356.02, -2736.34, -100, 500, 425, 150, "sad"},  --ls doki

    -- {2127.78, 1568.66, 987.43, 50, 100, 50, "kasyno"},  --kasyno
}
for i,v in pairs(radarArea) do 
    local area = createRadarArea(radarArea[i][1],radarArea[i][2],radarArea[i][3],radarArea[i][4],radarArea[i][5],radarArea[i][6],radarArea[i][7],radarArea[i][8])
    setRadarAreaFlashing(area,true)
end

for i,v in pairs(cuboid) do 
    local cuboids = createColCuboid (cuboid[i][1],cuboid[i][2],cuboid[i][3],cuboid[i][4],cuboid[i][5],cuboid[i][6])
    if cuboid[i][7] == "kasyno" then 
        setElementInterior(cuboids,1)
    end
    setElementData(cuboids,"strefadm",true)
end

function strefadmwszedl (plr)
    if getElementType ( plr ) == "player" then
        if getElementData(source,"strefadm") == true then 
            triggerClientEvent(plr, "addNoti", plr, "Wkraczasz na strefę DM.", "info" )
            setElementData(plr,"wstrefiedm",1)
            if not getElementData(plr,"player:duty") then 
                toggleControl(plr,"fire", true )
                toggleControl(plr,"aim_weapon", true)
                toggleControl(plr,"vehicle_fire", true)
                toggleControl(plr,"vehicle_secondary_fire", true)
                toggleControl(plr,"action", true)
                --if getElementData(plr,"player:admin") then toggleControl(plr,"aim_weapon", true) end 
            end
        end
    end
end
addEventHandler ( "onColShapeHit", root, strefadmwszedl )

function strefadmwyszedl (plr)
    if getElementType ( plr ) == "player" then
        if getElementData(source,"strefadm") == true then 
            triggerClientEvent(plr, "addNoti", plr, "Wychodzisz ze strefy DM.", "info" )
            setElementData(plr,"wstrefiedm",0)
            if not getElementData(plr,"player:duty") then 
                toggleControl(plr,"fire", false )
                toggleControl(plr,"aim_weapon", false)
                toggleControl(plr,"vehicle_fire", false)
                toggleControl(plr,"vehicle_secondary_fire", false)
                toggleControl(plr,"action", false)
                --if getElementData(plr,"player:admin") then toggleControl(plr,"aim_weapon", true) end
            end
        end
    end
end
addEventHandler ( "onColShapeLeave", root, strefadmwyszedl )

addEvent("reloadmnie", true)
addEventHandler("reloadmnie", root, function()
    reloadPedWeapon(source) 
end)