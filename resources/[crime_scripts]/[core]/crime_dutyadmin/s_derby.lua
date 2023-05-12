--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local platforma = createObject(13607,5999.17, -981.94, 14.99,0,0,0) 
local cub = createColCuboid(5960.0571289063, -1024.4177246094, 10.950937271118, 85,85,10)
local cub2 = createColCuboid(5912.42, -1076.91, -3.78, 185,185,10)
local onoff = "off"
local ludzie = 0
local zajete = "nie"
local wpuszczam = "nie"

function dinfo(plr)
    if not getElementData(plr,"player:admin") then return end
    outputChatBox("Komendy:",plr,200, 200, 200,true)
    outputChatBox("/derbywlacz - #5a3795Włącza event derby",plr,200, 200, 200,true)
    outputChatBox("/derbywylacz - #5a3795Wyłącza event derby (po derbach lub anulowanie derb)",plr,200, 200, 200,true)
    outputChatBox("/derbytp - #5a3795Wchodzenie na derby (dla graczy)",plr,200, 200, 200,true)
    outputChatBox("/derbywyjdz - #5a3795Wychodzenie z derb (dla graczy)",plr,200, 200, 200,true)
    outputChatBox("/derbystart - #5a3795Startowanie derbów",plr,200, 200, 200,true)
    outputChatBox("/derbyzwyciezca - #5a3795Pokazywanie zwycięzcy na koniec derbów (tylko jeżeli jesteś ty i ktoś na platformie)",plr,200, 200, 200,true)
    outputChatBox(" ",plr,200, 200, 200,true)
    outputChatBox("Stan eventu:",plr,200, 200, 200,true)
    outputChatBox("Stan: #5a3795"..onoff.."",plr,200, 200, 200,true)
    outputChatBox("Graczy na derbach: #5a3795"..tostring(ludzie).."",plr,200, 200, 200,true)
    outputChatBox("15 sekundowy timer: #5a3795"..zajete.."",plr,200, 200, 200,true)
    outputChatBox("Aktywne dołączanie: #5a3795"..wpuszczam.."",plr,200, 200, 200,true)
end
addCommandHandler("derby",dinfo)

function dwlacz(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoff == "on" then triggerClientEvent(plr, "addNoti", plr, "Derby są już włączone.", "error" ) return end
    ludzie = 0 
    onoff = "on"
    zajete = "nie"
    wpuszczam = "tak"
    local veh=getPedOccupiedVehicle(plr)
    local x,y,z = getElementPosition(plr)
    if veh then 
        local x,y,z = getElementPosition(veh)
    end
        setElementData(plr,"dex",x)
        setElementData(plr,"dey",y)
        setElementData(plr,"dez",z)
    local tworzy=getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
    triggerClientEvent("dodajguiall",plr,"Derby","Zepchaj wszystkich\nEvent rozpoczyna: "..tworzy.."\nAby dołączyć wpisz /derbytp")
    setElementPosition(plr,5998.89, -981.74, 12.45)
    triggerClientEvent(plr, "addNoti", plr, "Rozpocząłęś event 'derby' poczekaj aż wystarczająca ilość osób wejdzie na arenę i wpisz /derbystart lub /derbywylacz.", "premium" )
    local turek = createVehicle(451,6029.52, -962.68, 12.12, 359.3, 0.0, 129.0)
    setElementData(turek,"derby",true)
    warpPedIntoVehicle(plr,turek)
    setVehicleColor(turek,90, 55, 150, 90, 55, 150)
    setElementData(turek,"vehicle:desc","Nadzorca derb")
    setElementData(plr,"derby",true)
    -- exports["crime_database"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"WLACZA DERBY",0)
end
addCommandHandler("derbywlacz", dwlacz)

function dwylacz(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoff == "off" then triggerClientEvent(plr, "addNoti", plr, "Derby są wyłączone.", "error" ) return end
    ludzie = 0
    zajete = "nie"
    onoff = "off" 
    wpuszczam = "nie"
    triggerClientEvent(root, "addNoti", root, "Derby zostały wyłączone.", "error" )
    triggerClientEvent("usunguiall",plr)
    triggerClientEvent(plr, "addNoti", plr, "Wyłączyłeś derby.", "error" )
    local auta = getElementsByType("vehicle")
    for i,usun in ipairs(auta) do
        if getElementData(usun,"derby") == true then
            destroyElement(usun)
        end
    end
    local auta = getElementsByType("player")
    for i,usun in ipairs(auta) do
        if getElementData(usun,"derby") == true then
            setElementData(usun,"derby",false)
        end
    end
    -- exports["crime_database"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"WYLACZA DERBY",0)
end
addCommandHandler("derbywylacz", dwylacz)

function dtp(plr)
    if onoff == "off" then triggerClientEvent(plr, "addNoti", plr, "Derby już się skończyły.", "error" ) return end
    if wpuszczam == "nie" then triggerClientEvent(plr, "addNoti", plr, "Niestety nie wpuszczamy już na derby.", "error" ) return end
    if getElementData(plr,"derby") == true then triggerClientEvent(plr, "addNoti", plr, "Dwa razy nie dołączysz.", "error" ) return end
    if ludzie >= 100 then triggerClientEvent(plr, "addNoti", plr, "Niestety ale już 100/100 osób dołączyło do areny.", "error" ) return end
    if zajete == "tak" then triggerClientEvent(plr, "addNoti", plr, "Na arene może dołączyć tylko 1 osoba w ciągu 15 sekund, zaczekaj chwilkę.", "error" ) return end
    ludzie = ludzie+1
    zajete = "tak"
    triggerClientEvent(plr, "addNoti", plr, "Dołączyłeś na derby, masz 15 sekund aby ustawić się na swoje miejsce - Aby wyjść wpisz /derbywyjdz.", "info" )
    local veh=getPedOccupiedVehicle(plr)
    local x,y,z = getElementPosition(plr)
    if veh then 
        local x,y,z = getElementPosition(veh)
    end
        setElementData(plr,"dex",x)
        setElementData(plr,"dey",y)
        setElementData(plr,"dez",z)
    if ludzie ~= 100 then 
        triggerClientEvent("aktualizacjaguiall",plr,ludzie)
    else 
        triggerClientEvent("aktualizacjaguiall",plr,ludzie)
        wpuszczam = "nie"
    end
    setElementData(plr,"derby",true)
    local monster = createVehicle(444,5996.98, -976.22, 12.82, 359.6, 0.5, 110.6)
    setElementData(monster,"derby",true)
    warpPedIntoVehicle(plr,monster)
    setVehicleEngineState(monster,true)
    setVehicleColor(monster,90, 55, 150, 90, 55, 150)
    local nejm=getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
    setElementData(monster,"vehicle:desc","Uczestnik derb - "..nejm.."")
    setTimer(function()
        zajete="nie"
        setElementFrozen(monster,true)
    end, 15000, 1)
end
addCommandHandler("derbytp", dtp)

function dwyjdz(plr)
    if getElementData(plr,"derby") == true then
        if getElementData(plr,"player:admin") then triggerClientEvent(plr, "addNoti", plr, "Aby wyjść z derbów zaczekaj do końca i wpisz /derbywylacz.", "error" ) return end
        local veh = getPedOccupiedVehicle(plr)
        
        if veh then
            if getElementData(veh,"derby") ~= true then return end
            if isElementInWater(veh) == true then
                destroyElement(veh)
                setElementData(plr,"derby",false)
                setTimer(function()
                    local x = getElementData(plr,"dex")
                    local y = getElementData(plr,"dey")
                    local z = getElementData(plr,"dez")
                    setElementPosition(plr, tonumber(x), tonumber(y), tonumber(z))
                end, 1000, 1)
                triggerClientEvent(plr, "addNoti", plr, "Wyszedłeś z derbów.", "error" )
            return end   
        end
        if isElementInWater(plr) == true then
            setElementData(plr,"derby",false)
            setTimer(function()
                local x = getElementData(plr,"dex")
                local y = getElementData(plr,"dey")
                local z = getElementData(plr,"dez")
                setElementPosition(plr, tonumber(x), tonumber(y), tonumber(z))
            end, 1000, 1)
            triggerClientEvent(plr, "addNoti", plr, "Wyszedłeś z derbów.", "error" )
        return end
        triggerClientEvent(plr, "addNoti", plr, "'Nie znajdujesz się w wodzie.", "error" )
    end
end
addCommandHandler("derbywyjdz", dwyjdz)

function dstart(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoff == "off" then triggerClientEvent(plr, "addNoti", plr, "Derby są wyłączone.", "error" ) return end
    if zajete == "tak" then triggerClientEvent(plr, "addNoti", plr, "Odczekaj 15 sekund bo ktoś się ustawia.", "error" ) return end
    wpuszczam = "nie"
    triggerClientEvent("usunguiall",plr)
    triggerClientEvent(root, "addNoti", root, "Derby rozpoczną się za 10 sekund.", "premium" )
    setTimer(function()
        local auta = getElementsByType("vehicle")
        for i,usun in ipairs(auta) do
            if getElementData(usun,"derby") == true then
                setElementFrozen(usun,false)
            end
        end
        triggerClientEvent(root, "addNoti", root, "Derby się rozpoczeły, powodzenia.", "premium" )
    end, 10000, 1)

end
addCommandHandler("derbystart",dstart)

function dwygral(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoff == "off" then triggerClientEvent(plr, "addNoti", plr, "Derby są wyłączone.", "error" ) return end
    local nick = getPlayerName(plr)
    local players = getElementsWithinColShape( cub, "player" )
    for _, tplr in ipairs( players ) do 
        local nick2 = getPlayerName(tplr)
        if nick2 ~= nick then 
            triggerClientEvent(root, "addNoti", root, "Ostatnim przetrwańcem na derbach jest "..nick2:gsub("#%x%x%x%x%x%x","")..", gratulacje.", "premium" )
            -- exports["crime_database"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(tplr,"player:uid"),getPlayerSerial(tplr),"WYGRAL DERBY",0)
        end
    end
end
addCommandHandler("derbyzwyciezca",dwygral)



function wypadls (thePlayer)
    local plr = thePlayer
    if getElementData(plr,"derby") == true then
        if getElementData(plr,"player:admin") then triggerClientEvent(plr, "addNoti", plr, "Aby wyjść z derbów zaczekaj do końca i wpisz /derbywylacz.", "error" ) return end
        local veh = getPedOccupiedVehicle(plr)
        if veh then
            if getElementData(veh,"derby") ~= true then return end
            destroyElement(veh)
            setElementData(plr,"derby",false)
            setTimer(function()
                local x = getElementData(plr,"dex")
                local y = getElementData(plr,"dey")
                local z = getElementData(plr,"dez")
                setElementPosition(plr, tonumber(x), tonumber(y), tonumber(z))
            end, 1000, 1)
            triggerClientEvent(plr, "addNoti", plr, "Wyszedłeś z derbów.", "error" )
        end 
    end
end
addEventHandler ( "onColShapeHit", cub2, wypadls)


function exitVehicle ( thePlayer, seat, jacked ) 
    if source then if getElementData(source,"derby") == true then cancelEvent() return end end
 end
 addEventHandler ( "onVehicleStartExit", getRootElement(), exitVehicle)


function playerDamage_text ( attacker, weapon, bodypart, loss )
    if isElementWithinColShape(source,cub) then 
        cancelEvent()
        setElementHealth(source,100)
    end 
end
addEventHandler ( "onPlayerDamage", getRootElement (), playerDamage_text )

function displayVehicleLoss(loss)
    if source then 
        if isElementWithinColShape(source,cub) then 
            cancelEvent()
            setElementHealth(source,1000)
        end 
    end
end

addEventHandler("onVehicleDamage", root, displayVehicleLoss)