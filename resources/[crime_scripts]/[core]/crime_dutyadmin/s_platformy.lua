--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local onoffpl = "off"
local liczba = 0
local byly = {}
local gra = "nie"
local wpuszczampl = "nie"
local cubo = createColCuboid(5790.81, -1090.35, 5.44, 185,185,10)

local ludzie = 0 

function plinfo(plr)
    if not getElementData(plr,"player:admin") then return end
    outputChatBox("Komendy:",plr,255,255,255,true)
    outputChatBox("/platformywlacz - #5a3795Włącza event platformy",plr,255,255,255,true)
    outputChatBox("/platformywylacz - #5a3795Wyłącza event platformy (po platformach lub anulowanie platform)",plr,255,255,255,true)
    outputChatBox("/platformytp - #5a3795Wchodzenie na event (dla graczy)",plr,255,255,255,true)
    outputChatBox("/platformystart - #5a3795Startowanie platform",plr,255,255,255,true)
    outputChatBox(" ",plr,255,255,255,true)
    outputChatBox("Stan eventu:",plr,255,255,255,true)
    outputChatBox("Stan: #5a3795"..onoffpl.."",plr,255,255,255,true)
    outputChatBox("Aktywne dołączanie: #5a3795"..wpuszczampl.."",plr,255,255,255,true)
    outputChatBox("Czy gra jest w trakcie: #5a3795"..gra.."",plr,255,255,255,true)
end
addCommandHandler("platformy",plinfo)


function plwlacz(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoffpl == "on" then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Platformy są włączone ;p') return end
    onoffpl = "on"
    liczba = 0
    byly = {}
    gra = "nie"
    ludzie = 0
    wpuszczampl = "tak"
    local veh=getPedOccupiedVehicle(plr)
    local x,y,z = getElementPosition(plr)
    if veh then 
        local x,y,z = getElementPosition(veh)
    end
        setElementData(plr,"plx",x)
        setElementData(plr,"ply",y)
        setElementData(plr,"plz",z)
    local tworzy=getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
    triggerClientEvent("dodajguiall",plr,"Platformy","Nie spadnij\nRozpoczyna: "..tworzy.."\nWby dołączyć wpisz /platformytp")
    zrobto()
    local dlamnie = createObject(3095,5860.85, -1013.54, 116.27-30,0,0,0)
    setElementData(dlamnie,"podest",true)
    setElementAlpha(dlamnie,0)
    setElementPosition(plr,5860.85, -1013.54, 117.02-30)
    triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Rozpocząłęś event "platformy" poczekaj aż wystarczająca ilość osób wejdzie na arenę i wpisz /platformystart lub /platformywylacz')
    setElementData(plr,"platformy",true)
    exports["sr-db"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"WLACZA PLATFORMY",0)
end
addCommandHandler("platformywlacz", plwlacz)

function plwylacz(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoffpl == "off" then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Platformy są wyłączone ;p') return end
    onoffpl = "off"
    liczba = 0
    byly = {}
    ludzie = 0
    gra = "nie"
    wpuszczampl = "nie"
    triggerClientEvent("usunguiall",plr)
    triggerClientEvent(root, 'alerts:create_alert', root, 'info', 'Platformy zostały wyłączone')
    triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Wyłączyłeś platformy, posprzątałem za ciebie - nie dziękuj :)')
    local auta = getElementsByType("player")
    for i,usun in ipairs(auta) do
        if getElementData(usun,"platformy") == true then
            setElementData(usun,"platformy",false)
        end
    end
    local auta = getElementsByType("object")
    for i,usun in ipairs(auta) do
        if getElementData(usun,"podest") ~= false then
            destroyElement(usun)
        end
    end
    exports["sr-db"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"WYLACZA PLATFORMY",0)
end
addCommandHandler("platformywylacz", plwylacz)


function pltp(plr)
    if onoffpl == "off" then  triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Platformy chyba się już skończyły ;c') return end
    if wpuszczampl == "nie" then  triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Niestety nie wpuszczamy już na event') return end
    if getElementData(plr,"platformy") == true then  triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Dwa razy nie dołączysz ;p') return end
    triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Gratulacje, dołączyłeś na event "platformy", Aby wyjść wskocz do wody')
        ludzie = ludzie+1
        triggerClientEvent("aktualizacjaguiall",plr,ludzie)
    local veh=getPedOccupiedVehicle(plr)
    local x,y,z = getElementPosition(plr)
    if veh then 
        local x,y,z = getElementPosition(veh)
    end
        setElementData(plr,"plx",x)
        setElementData(plr,"ply",y)
        setElementData(plr,"plz",z)
    setElementData(plr,"platformy",true)
    local math1 = math.random(5822,5898)
    local math2 = math.random(-1044,-969)
    setElementPosition(plr,math1,math2,18.91)
end
addCommandHandler("platformytp", pltp)


function plstart(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoffpl == "off" then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Platformy są wyłączone') return end
    if gra == "tak" then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Platformy już są w trakcie') return end
    wpuszczampl = "nie"
    gra = "tak"
    triggerClientEvent("usunguiall",plr)
    triggerClientEvent(root, 'alerts:create_alert', root, 'info', 'Platformy rozpoczną się za 10 sekund!')
    setTimer(function()
        triggerClientEvent(root, 'alerts:create_alert', root, 'info', 'Platformy się rozpoczeły, powodzenia!')
        xdsad()
    end, 10000, 1)

end
addCommandHandler("platformystart",plstart)


function zrobto() 
    for o=1,10 do 
        for i=1, 10 do
            local ile = i*8
            local ileo = o*8
            local jetdoor= createObject(3095,5904.56-ile, -963.60-ileo, 17.35,0,0,0)
            liczba = liczba+1
            setElementData(jetdoor,"podest",liczba)
        end
    end
end 


function zrobtamto()
    local rand = math.random(1,100)
    if table.find(byly,rand) then
        zrobtamto()
    return end
    table.insert(byly,rand)
    local teams = getElementsByType("object")
    for i,ob in ipairs(teams) do
        if getElementData(ob,"podest") == rand then 
            setElementAlpha(ob,155)
            setTimer(function()
                setElementAlpha(ob,100)
                setTimer(function()
                    destroyElement(ob)
                end, 1500, 1)
            end, 1500, 1)
            
        end
    end
end

function xdsad()
    setTimer(function()
        zrobtamto()
    end, 900, 99)
end 

function table.find(tabl,word) 
    if type(tabl) ~= "table" or word == nil then 
    return false 
    else 
    local ret = false 
    for k,v in pairs(tabl) do 
        if v == word then 
        return k 
        end 
    end 
    end 
    end 

function wypadles (thePlayer)
    local plr = thePlayer
    if getElementData(plr,"platformy") == true then
        if getElementData(plr,"player:admin") then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Jesteś administratorem, aby wyjść z eventu zaczekaj do końca i wpisz /platformywylacz') return end
            setElementData(plr,"platformy",false)
            setTimer(function()
                local x = getElementData(plr,"plx")
                local y = getElementData(plr,"ply")
                local z = getElementData(plr,"plz")
                setElementPosition(plr, tonumber(x), tonumber(y), tonumber(z))
            end, 1000, 1)
            triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Wyszedłeś z eventu') 
    end
end
addEventHandler ( "onColShapeHit", cubo, wypadles)