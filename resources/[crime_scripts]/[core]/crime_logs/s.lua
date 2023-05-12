--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("logiadm:chat", true)
addEventHandler("logiadm:chat", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM logs_chat ORDER BY data DESC LIMIT 1000")
    triggerClientEvent(source, "logiadm:chatwroc", source, result)
end)

addEvent("logiadm:v", true)
addEventHandler("logiadm:v", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM logs_v ORDER BY data DESC LIMIT 1000")
    triggerClientEvent(source, "logiadm:vwroc", source, result)
end)

addEvent("logiadm:pm", true)
addEventHandler("logiadm:pm", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM logs_pm ORDER BY data DESC LIMIT 1000")
    triggerClientEvent(source, "logiadm:pmwroc", source, result)
end)

addEvent("logiadm:pay", true)
addEventHandler("logiadm:pay", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM logs_pay ORDER BY data DESC LIMIT 1000")
    triggerClientEvent(source, "logiadm:paywroc", source, result)
end)

addEvent("logiadm:paypp", true)
addEventHandler("logiadm:paypp", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM logs_paypp ORDER BY data DESC LIMIT 1000")
    triggerClientEvent(source, "logiadm:payppwroc", source, result)
end)

addEvent("logiadm:auta", true)
addEventHandler("logiadm:auta", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM logs_cars ORDER BY data DESC LIMIT 1000")
    triggerClientEvent(source, "logiadm:autawroc", source, result)
end)

addEvent("logiadm:bany", true)
addEventHandler("logiadm:bany", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_ban WHERE time>NOW() LIMIT 1000")
    triggerClientEvent(source, "logiadm:banywroc", source, result)
end)

addEvent("logiadm:muty", true)
addEventHandler("logiadm:muty", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE type='mute' AND time>NOW() LIMIT 1000")
    triggerClientEvent(source, "logiadm:mutywroc", source, result)
end)

addEvent("logiadm:aj", true)
addEventHandler("logiadm:aj", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_adminjail WHERE termin>NOW() LIMIT 1000")
    triggerClientEvent(source, "logiadm:ajwroc", source, result)
end)

addEvent("logiadm:prawka", true)
addEventHandler("logiadm:prawka", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE type='prawko' AND time>NOW() LIMIT 1000")
    triggerClientEvent(source, "logiadm:prawkawroc", source, result)
end)

addEvent("logiadm:kartoteka", true)
addEventHandler("logiadm:kartoteka", root, function(nickxd)
	local nickxd = nickxd
    local uid = getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_punishments WHERE nick=? ORDER BY data DESC LIMIT 1000",nickxd)
    triggerClientEvent(source, "logiadm:kartotekawroc", source, result)
end)