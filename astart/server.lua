--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
    @ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.
    
]]--

addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), function()
    for k,v in ipairs(getResources()) do
	if string.find(getResourceName(v), "crime") or string.find(getResourceName(v), "crime_") then
        stopResource(v)
        outputDebugString(getResourceName(v).." zatrzymano (skrypt)")
	end
    end
outputChatBox("AUTOSTART > Skrypty zostały wyłączone", getRootElement())
end)


addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), function()
    for k,v in ipairs(getResources()) do
    if string.find(getResourceName(v), "crime") or string.find(getResourceName(v), "crime_") then
        startResource(v)
        outputDebugString(getResourceName(v).." uruchomiono (skrypt)")
        end
    end
end)

addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), function()
    for k,v in ipairs(getResources()) do
	if string.find(getResourceName(v), "maps") or string.find(getResourceName(v), "maps_") then
        stopResource(v)
        outputDebugString(getResourceName(v).." zatrzymano (mapa)")
	end
    end
outputChatBox("MAPS > Mapy zostały wyłączone", getRootElement())
end)


addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), function()
    for k,v in ipairs(getResources()) do
    if string.find(getResourceName(v), "maps") or string.find(getResourceName(v), "maps_") then
        startResource(v)
        outputDebugString(getResourceName(v).." uruchomiono (mapa)")
        end
    end
end)

addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), function()
    for k,v in ipairs(getResources()) do
	if string.find(getResourceName(v), "mod") or string.find(getResourceName(v), "mod_") then
        stopResource(v)
        outputDebugString(getResourceName(v).." zatrzymano (model)")
	end
    end
outputChatBox("MOD > Modele zostały wyłączone", getRootElement())
end)


addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), function()
    for k,v in ipairs(getResources()) do
    if string.find(getResourceName(v), "mod") or string.find(getResourceName(v), "mod_") then
        startResource(v)
        outputDebugString(getResourceName(v).." uruchomiono (model)")
        end
    end
end)