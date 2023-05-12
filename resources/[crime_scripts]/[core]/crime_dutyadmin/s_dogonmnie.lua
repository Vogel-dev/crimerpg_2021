--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local onoffdo = "off"

function doinfo(plr)
    if not getElementData(plr,"player:admin") then return end
    outputChatBox("Komendy:",plr,200, 200, 200,true)
    outputChatBox("/dogonstart - #5a3795Tworzy twoje auto do eventu",plr,200, 200, 200,true)
    outputChatBox("/dogonstop - #5a3795Wyłącza event i usuwa auto",plr,200, 200, 200,true)
    outputChatBox(" ",plr,200, 200, 200,true)
    outputChatBox("Stan eventu:",plr,200, 200, 200,true)
    outputChatBox("Włączony: #5a3795"..onoffdo.."",plr,200, 200, 200,true)
end
addCommandHandler("dogon",doinfo)

function dostart(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoffdo == "on" then triggerClientEvent(plr, "addNoti", plr, "Event jest już włączony.", "error" ) return end
    local tworzy=getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
    triggerClientEvent(root, "addNoti", root, ""..tworzy.." rozpoczyna event 'dogoń mnie' na mapie pojawił się punkt, dogoń go i wejdź na miejsce pasażera.", "premium" )
    triggerClientEvent(plr, "addNoti", plr, "Rozpocząłęś event 'dogoń mnie' uciekaj przed graczami lub wpisz /dogonstop.", "info" )
    -- exports["crime_database"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"WLACZA DOGOŃ MNIE",0)
    onoffdo = "on"
    local x,y,z = getElementPosition(plr)
    local rx,ry,rz = getElementRotation(plr)
    local veh = createVehicle(411, x, y, z, rx, ry, rz, "EVENT")
    setVehicleColor(veh,90, 55, 150, 90, 55, 150)
    setElementData(veh,"vehicle:desc","#5a3795Pojazd#FFFFFF - Eventowy")
    setElementData(veh,"dogonmnie",true)
    warpPedIntoVehicle(plr,veh)
    local blip = createBlip(x, y, z, 28, 0, 0, 0, 0, 0, 0, 200)
    attachElements(blip,veh)
    setElementData(blip,"dogonmnie",true)
end
addCommandHandler("dogonstart",dostart)

function dostop(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoffdo == "off" then triggerClientEvent(plr, "addNoti", plr, "Event jest wyłączony.", "error" ) return end
    local auta = getElementsByType("vehicle")
    for i,usun in ipairs(auta) do
        if getElementData(usun,"dogonmnie") == true then
            destroyElement(usun)
        end
    end
    local auta = getElementsByType("blip")
    for i,usun in ipairs(auta) do
        if getElementData(usun,"dogonmnie") == true then
            destroyElement(usun)
        end
    end
    onoffdo = "off"
    triggerClientEvent(root, "addNoti", root, "Event 'dogoń mnie' dobiegł końca bez zwycięzcy.", "premium" )
end
addCommandHandler("dogonstop",dostop)

function enterVehicle ( thePlayer, seat, jacked )
    local plr = thePlayer
    local veh = source
    if getElementData(veh,"dogonmnie") == true then 
        if seat == 1 then
            destroyElement(veh)
            local auta = getElementsByType("blip")
            for i,usun in ipairs(auta) do
                if getElementData(usun,"dogonmnie") == true then
                    destroyElement(usun)
                end
            end
            onoffdo = "off"
            local tworzy=getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
            triggerClientEvent(root, "addNoti", root, "Event 'dogoń mnie' wygrywa: "..tworzy..", gratulacje!", "premium" )
        end
    end
end
addEventHandler ( "onVehicleEnter", getRootElement(), enterVehicle ) 