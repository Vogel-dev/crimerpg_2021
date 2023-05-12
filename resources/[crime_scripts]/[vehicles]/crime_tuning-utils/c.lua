--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
tick = getTickCount()
local panel = false
local zakladka = 1

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)
local dxfont1_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmienna)

local cenaneony = 30000
local cenamaskowanie = 30000
local cenakarbon = 10000
local cenanaped = 40000
local cenazawieszenie = 35000
local cenasilnik = 30000 
local cenacylindry = 30000
local cenaklakson = 7500
local cenatrakcja = 12500
local cenachiptuning = 30000 
local cenatarcze = 20000
local cenabak = 15000
local cenalpg = 30000
local cenaatrapa = 12000
local cenaus1 = 30000
local cenaus2 = 40000
local cenaus3 = 50000

local neony = 0
local maskowanie = 0
local karbon = 0
local naped = 0
local zawieszenie = 0 
local silnik = 0
local cylindry = 0
local klakson = 0
local trakcja = 0
local chiptuning = 0
local tarcze = 0 
local bak = 0
local lpg = 0 
local atrapa = 0
local us1 = 0
local us2 = 0
local us3 = 0

local markery = {
    {1764.03, -1685.42, 13.55}
}

local cub = createColCuboid(1759.45, -1687.51, 13.55-2, 9,4,4)

function gui()
    local ticki = getTickCount()
    if progressdwa == "wlacza" then
        local Progress = (ticki-tickistart)/czas
        local alp = 230
        local alp2 = 255
        if alp then alptest = alp else alp = 230 end 
        if alp2 then alp2test = alp2 else alp2 = 255 end
    else 
        local Progress = (ticki-tickistart)/czas
        local alp = 230
        local alp2 = 255
        if alp then alptest = alp else alp = 0 end 
        if alp2 then alp2test = alp2 else alp2 = 0 end
    end
    if panel == true then 
        dxDrawRectangle(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, tocolor(45, 45, 45, alptest), false)
        dxDrawRectangle(0/zmienna, 0/zmienna, 1920/zmienna, 93/zmienna, tocolor(25, 25, 25, alptest), false)

        exports["crime_gui"]:guibutton("Ulepszenia wizualne",40/zmienna, 9/zmienna, 228/zmienna, 69/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Napęd/Zawieszenie",308/zmienna, 9/zmienna, 228/zmienna, 69/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Silnik/cylindry",576/zmienna, 9/zmienna, 228/zmienna, 69/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Klaksony",844/zmienna, 9/zmienna, 228/zmienna, 69/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Inne ulepszenia",1112/zmienna, 9/zmienna, 228/zmienna, 69/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Bak/Lpg",1380/zmienna, 9/zmienna, 228/zmienna, 69/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Ulepszenia Silnika",1648/zmienna, 9/zmienna, 228/zmienna, 69/zmienna, alp2test)

        exports["crime_gui"]:guitext("Posiadasz: #00DD00"..formatujnaprzecinki(getPlayerMoney(localPlayer)).." PLN", 0/zmienna, 831/zmienna, 1920/zmienna, 918/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
        exports["crime_gui"]:guibutton("Zamknij",844/zmienna, 919/zmienna, 228/zmienna, 69/zmienna, alp2test)
        exports["crime_gui"]:guitext("#FF0000Aby zresetować pojazd klinij 'Zamknij'", 0/zmienna, 988/zmienna, 1920/zmienna, 1075/zmienna, 200, 200, 200, alp2test, dxfont1_PantonBold, "center", "center")
        if zakladka == 1 then 
            --NEONY

                exports["crime_gui"]:guitext("Neony (Aktualnie: "..neony.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenaneony).." PLN", 0/zmienna, 154/zmienna, 1920/zmienna, 260/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",875/zmienna, 260/zmienna, 210/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zamontuj Migające",875/zmienna, 336/zmienna, 210/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("#ccccccZdemontuj (#00DD000 PLN#cccccc)",875/zmienna, 412/zmienna, 210/zmienna, 52/zmienna, alp2test)
            --MASKOWANIE
                exports["crime_gui"]:guitext("Maskowanie (Aktualnie: "..maskowanie.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenamaskowanie).." PLN", 0/zmienna, 461/zmienna, 1920/zmienna, 567/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",759/zmienna, 567/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zdemontuj (#00DD000 PLN#cccccc)",989/zmienna, 567/zmienna, 172/zmienna, 52/zmienna, alp2test)
            --KARBON
                exports["crime_gui"]:guitext("Karbowana karoseria (Aktualnie: "..karbon.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenakarbon).." PLN", 0/zmienna, 619/zmienna, 1920/zmienna, 725/zmienna,  200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",759/zmienna, 725/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zdemontuj (#00DD000 PLN#cccccc)",989/zmienna, 725/zmienna, 172/zmienna, 52/zmienna, alp2test)
        elseif zakladka == 2 then 
            --NAPEDY
                exports["crime_gui"]:guitext("Zmiana napędów (Aktualnie: "..naped.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenanaped).." PLN", 0/zmienna, 154/zmienna, 1920/zmienna, 260/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zdemontuj (#00DD000 PLN#cccccc)",989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
            --ZAWIESZENIE
                exports["crime_gui"]:guitext("Regulacja zawieszenia (Aktualnie: "..zawieszenie.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenazawieszenie).." PLN", 0/zmienna, 312/zmienna, 1920/zmienna, 418/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zdemontuj (#00DD000 PLN#cccccc)",989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
        elseif zakladka == 3 then 
            --SILNIK
                exports["crime_gui"]:guitext("Pojemność silnika (Aktualnie: "..silnik.."#cccccc)", 0/zmienna, 154/zmienna, 1920/zmienna, 260/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("+0.2 (#00DD00"..formatujnaprzecinki(cenasilnik).." PLN#cccccc)",759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("-0.2 (#00DD000 PLN#cccccc)",989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
            --CYLINDRY
                exports["crime_gui"]:guitext("Cylindry (Aktualnie: "..cylindry.."#cccccc)", 0/zmienna, 312/zmienna, 1920/zmienna, 418/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("+2 (#00DD00"..formatujnaprzecinki(cenacylindry).." PLN#cccccc)",759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("-2 (#00DD000 PLN#cccccc)",989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
        elseif zakladka == 4 then 
            --KLAKSONY
                exports["crime_gui"]:guitext("Klakson (Aktualnie: "..klakson.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenaklakson).." PLN\n#5a3795PPM - Odsłuch", 0/zmienna, 154/zmienna, 1920/zmienna, 260/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Nr. 1",662/zmienna, 270/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 2",874/zmienna, 270/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 3",1086/zmienna, 270/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 4",662/zmienna, 332/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 5",874/zmienna, 332/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 6",1086/zmienna, 332/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 7",662/zmienna, 394/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 8",874/zmienna, 394/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 9",1086/zmienna, 394/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 10",662/zmienna, 456/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 11",874/zmienna, 456/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 12",1086/zmienna, 456/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Nr. 13",874/zmienna, 518/zmienna, 172/zmienna, 52/zmienna, alp2test)
        elseif zakladka == 5 then 
            --TRAKCJA
                exports["crime_gui"]:guitext("Trakcja (Aktualnie: "..trakcja.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenatrakcja).." PLN", 0/zmienna, 154/zmienna, 1920/zmienna, 260/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Ulepsz",759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Pogorsz (#00DD000 PLN#cccccc)",989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
            --CHIPTUNING
                exports["crime_gui"]:guitext("Chiptuning (Aktualnie: "..chiptuning.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenachiptuning).." PLN", 0/zmienna, 312/zmienna, 1920/zmienna, 418/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Ulepsz",759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Pogorsz (#00DD000 PLN#cccccc)",989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
            --TARCZE
                exports["crime_gui"]:guitext("Tarcze hamulcowe (Aktualnie: "..tarcze.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenatarcze).." PLN", 0/zmienna, 470/zmienna, 1920/zmienna, 576/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Ulepsz",759/zmienna, 576/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Pogorsz (#00DD000 PLN#cccccc)",989/zmienna, 576/zmienna, 172/zmienna, 52/zmienna, alp2test)
        elseif zakladka == 6 then 
            --Pojemność baka
                exports["crime_gui"]:guitext("Pojemność baka (Aktualnie: "..bak.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenabak).." PLN", 0/zmienna, 154/zmienna, 1920/zmienna, 260/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("+25L",759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("-25L (#00DD000 PLN#cccccc)",989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
            --LPG
                exports["crime_gui"]:guitext("Instalacja LPG (Aktualnie: "..lpg.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenalpg).." PLN", 0/zmienna, 312/zmienna, 1920/zmienna, 418/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zdemontuj (#00DD000 PLN#cccccc)",989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
            --Atrapa 
                exports["crime_gui"]:guitext("Atrapa nitra (Aktualnie: "..atrapa.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenaatrapa).." PLN", 0/zmienna, 470/zmienna, 1920/zmienna, 576/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",759/zmienna, 576/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zdemontuj (#00DD000 PLN#cccccc)",989/zmienna, 576/zmienna, 172/zmienna, 52/zmienna, alp2test)
        elseif zakladka == 7 then 
            --US1
                exports["crime_gui"]:guitext("Ulepszenie silnika 1 (Aktualnie: "..us1.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenaus1).." PLN", 0/zmienna, 154/zmienna, 1920/zmienna, 260/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zdemontuj (#00DD000 PLN#cccccc)",989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna, alp2test)
            --US2
                exports["crime_gui"]:guitext("Ulepszenie silnika 2 (Aktualnie: "..us2.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenaus2).." PLN", 0/zmienna, 312/zmienna, 1920/zmienna, 418/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zdemontuj (#00DD000 PLN#cccccc)",989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna, alp2test)
            --US3 
                exports["crime_gui"]:guitext("Ulepszenie silnika 3 (Aktualnie: "..us3.."#cccccc)\n#00DD00"..formatujnaprzecinki(cenaus3).." PLN", 0/zmienna, 470/zmienna, 1920/zmienna, 576/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
                exports["crime_gui"]:guibutton("Zamontuj",759/zmienna, 576/zmienna, 172/zmienna, 52/zmienna, alp2test)
                exports["crime_gui"]:guibutton("Zdemontuj (#00DD000 PLN#cccccc)",989/zmienna, 576/zmienna, 172/zmienna, 52/zmienna, alp2test)
        end
    end
end

--TUNING ETC
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" and panel == true then
        local veh = getPedOccupiedVehicle(localPlayer)
        if not veh then return end
        if zakladka == 1 then 
            if isMouseIn(875/zmienna, 260/zmienna, 210/zmienna, 52/zmienna) then -- neoony zamontuj
                triggerServerEvent("tuning:neon", localPlayer, veh, 1, cenaneony)
            end
            if isMouseIn(875/zmienna, 336/zmienna, 210/zmienna, 52/zmienna) then -- neoony zamontuj migajki
                triggerServerEvent("tuning:neon", localPlayer, veh, 2, cenaneony)
            end
            if isMouseIn(875/zmienna, 412/zmienna, 210/zmienna, 52/zmienna) then -- neoony zdemontuj
                triggerServerEvent("tuning:neon", localPlayer, veh, 0, 0)
            end
            if isMouseIn(759/zmienna, 567/zmienna, 172/zmienna, 52/zmienna) then -- maskowanie montuj
                triggerServerEvent("tuning:maskowanie", localPlayer, veh, 1, cenamaskowanie)
            end
            if isMouseIn(989/zmienna, 567/zmienna, 172/zmienna, 52/zmienna) then -- maskowanie demontuj
                triggerServerEvent("tuning:maskowanie", localPlayer, veh, 0, 0)
            end
            if isMouseIn(759/zmienna, 725/zmienna, 172/zmienna, 52/zmienna) then -- karbon montuj
                triggerServerEvent("tuning:karbon", localPlayer, veh, 1, cenakarbon)
            end
            if isMouseIn(989/zmienna, 725/zmienna, 172/zmienna, 52/zmienna) then -- karbon demontuj
                triggerServerEvent("tuning:karbon", localPlayer, veh, 0, 0)
            end
        elseif zakladka == 2 then 
            if isMouseIn(759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- napedy montuj
                triggerServerEvent("tuning:naped", localPlayer, veh, 1, cenanaped)
            end
            if isMouseIn(989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- napedy demontuj
                triggerServerEvent("tuning:naped", localPlayer, veh, 0, 0)
            end
            if isMouseIn(759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- zawieszenie montuj
                triggerServerEvent("tuning:zawieszenie", localPlayer, veh, 1, cenazawieszenie)
            end
            if isMouseIn(989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- zawieszenie demontuj
                triggerServerEvent("tuning:zawieszenie", localPlayer, veh, 0, 0)
            end
        elseif zakladka == 3 then 
            if isMouseIn(759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- silnik +0.2
                triggerServerEvent("tuning:silnik", localPlayer, veh, 0.2, cenasilnik)
            end
            if isMouseIn(989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- silnik -0.2
                triggerServerEvent("tuning:silnik", localPlayer, veh, -0.2, 0)
            end
            if isMouseIn(759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- cylindry +2
                triggerServerEvent("tuning:cylindry", localPlayer, veh, 2, cenacylindry)
            end
            if isMouseIn(989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- cylindry -2
                triggerServerEvent("tuning:cylindry", localPlayer, veh, -2, 0)
            end
        elseif zakladka == 4 then 
            if isMouseIn(662/zmienna, 270/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(1)
            end
            if isMouseIn(874/zmienna, 270/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(2)
            end
            if isMouseIn(1086/zmienna, 270/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(3)
            end
            if isMouseIn(662/zmienna, 332/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(4)
            end
            if isMouseIn(874/zmienna, 332/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(5)
            end
            if isMouseIn(1086/zmienna, 332/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(6)
            end
            if isMouseIn(662/zmienna, 394/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(7)
            end
            if isMouseIn(874/zmienna, 394/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(8)
            end
            if isMouseIn(1086/zmienna, 394/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(9)
            end
            if isMouseIn(662/zmienna, 456/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(10)
            end
            if isMouseIn(874/zmienna, 456/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(11)
            end
            if isMouseIn(1086/zmienna, 456/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(12)
            end
            if isMouseIn(874/zmienna, 518/zmienna, 172/zmienna, 52/zmienna) then 
                kupklakson(13)
            end
        elseif zakladka == 5 then 
            if isMouseIn(759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- trakcja +1
                triggerServerEvent("tuning:trakcja", localPlayer, veh, 1, cenatrakcja)
            end
            if isMouseIn(989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- trakcja -1
                triggerServerEvent("tuning:trakcja", localPlayer, veh, -1, 0)
            end
            if isMouseIn(759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- chiptuning +1
                triggerServerEvent("tuning:chiptuning", localPlayer, veh, 1, cenachiptuning)
            end
            if isMouseIn(989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- chiptuning -1
                triggerServerEvent("tuning:chiptuning", localPlayer, veh, -1 , 0)
            end
            if isMouseIn(759/zmienna, 576/zmienna, 172/zmienna, 52/zmienna) then -- tarcze +1
                triggerServerEvent("tuning:tarcze", localPlayer, veh, 1, cenatarcze)
            end
            if isMouseIn(989/zmienna, 576/zmienna, 172/zmienna, 52/zmienna) then -- tarcze -1
                triggerServerEvent("tuning:tarcze", localPlayer, veh, -1 , 0)
            end
        elseif zakladka == 6 then 
            if isMouseIn(759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- bak +25
                triggerServerEvent("tuning:bak", localPlayer, veh, 25, cenabak)
            end
            if isMouseIn(989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- bak -25
                triggerServerEvent("tuning:bak", localPlayer, veh, -25, 0)
            end
            if isMouseIn(759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- montaz lpg
                triggerServerEvent("tuning:lpg", localPlayer, veh, 1, cenalpg)
            end
            if isMouseIn(989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- demontaz lpg
                triggerServerEvent("tuning:lpg", localPlayer, veh, 0 , 0)
            end
            if isMouseIn(759/zmienna, 576/zmienna, 172/zmienna, 52/zmienna) then -- atrapa nitra montaz
                triggerServerEvent("tuning:atrapa", localPlayer, veh, 1, cenaatrapa)
            end
            if isMouseIn(989/zmienna, 576/zmienna, 172/zmienna, 52/zmienna) then -- atrapa nitra demontaz
                triggerServerEvent("tuning:atrapa", localPlayer, veh, 0 , 0)
            end
        elseif zakladka == 7 then 
            if isMouseIn(759/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- montaz us1
                triggerServerEvent("tuning:us1", localPlayer, veh, 1, cenaus1)
            end
            if isMouseIn(989/zmienna, 260/zmienna, 172/zmienna, 52/zmienna) then -- demontaz us1
                triggerServerEvent("tuning:us1", localPlayer, veh, 0, 0)
            end
            if isMouseIn(759/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- montaz us2
                triggerServerEvent("tuning:us2", localPlayer, veh, 1, cenaus2)
            end
            if isMouseIn(989/zmienna, 418/zmienna, 172/zmienna, 52/zmienna) then -- demontaz us2
                triggerServerEvent("tuning:us2", localPlayer, veh, 0 , 0)
            end
            if isMouseIn(759/zmienna, 576/zmienna, 172/zmienna, 52/zmienna) then -- montaz us3
                triggerServerEvent("tuning:us3", localPlayer, veh, 1, cenaus3)
            end
            if isMouseIn(989/zmienna, 576/zmienna, 172/zmienna, 52/zmienna) then -- demontaz us3
                triggerServerEvent("tuning:us3", localPlayer, veh, 0 , 0)
            end
        end
    elseif btn=="right" and state=="down" and panel == true then
        if zakladka == 4 then --ODSŁUCH KLAKSONOW
            if isMouseIn(662/zmienna, 270/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(1)
            end
            if isMouseIn(874/zmienna, 270/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(2)
            end
            if isMouseIn(1086/zmienna, 270/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(3)
            end
            if isMouseIn(662/zmienna, 332/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(4)
            end
            if isMouseIn(874/zmienna, 332/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(5)
            end
            if isMouseIn(1086/zmienna, 332/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(6)
            end
            if isMouseIn(662/zmienna, 394/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(7)
            end
            if isMouseIn(874/zmienna, 394/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(8)
            end
            if isMouseIn(1086/zmienna, 394/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(9)
            end
            if isMouseIn(662/zmienna, 456/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(10)
            end
            if isMouseIn(874/zmienna, 456/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(11)
            end
            if isMouseIn(1086/zmienna, 456/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(12)
            end
            if isMouseIn(874/zmienna, 518/zmienna, 172/zmienna, 52/zmienna) then 
                zobaczklakson(13)
            end
        end
    end
end)

function zobaczklakson(id)
    if not id then return end
    if klaksond then 
        destroyElement(klaksond)
    end
    klaksond = playSound( ":crime_horns/"..id..".wav")
    setSoundVolume( klaksond, 1 )
end

function kupklakson(id)
    if not id then return end 
    local veh = getPedOccupiedVehicle(localPlayer)
    if not veh then return end
    triggerServerEvent("tuning:klakson", localPlayer, veh, id, cenaklakson)
end

--WLACZANIE
function wjechalwmarker(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if not veh then return end
    if not isElementWithinColShape(localPlayer,cub) then return end
    local seat = getPedOccupiedVehicleSeat(localPlayer) 
    if seat ~= 0 then return end
    setElementFrozen(veh,true)
    if getElementData(veh,"publiczny") == true then exports.crime_gui:addNoti("Ten pojazd jest publiczny.", "error") return end
    if not getElementData(veh,"vehicle:id") then exports.crime_gui:addNoti("Ten pojazd nie posiada ID.", "error") return end
    if getElementData(veh,"vehicle:ownedPlayer") ~= getElementData(localPlayer,"player:uid") then exports.crime_gui:addNoti("Ten pojazd nie jest twój.", "error") return end
    triggerServerEvent("tuning:dajinfo", localPlayer)
    tickistart = getTickCount()
	czas = 500
	progressdwa = "wlacza"
	addEventHandler("onClientRender",root,gui)
    panel = true
    setElementData(localPlayer,"hudoff",true)
    setElementData(localPlayer,"radaroff",true)
    showChat(false)
	showCursor(true,false)
end

--WYLACZANIE
function wyjechalzmarkera(el,md)
	if el~=localPlayer then return end
	tickistart = getTickCount()
    czas = 500
    progressdwa = "wylacza"
    guiSetInputMode("allow_binds")
    showCursor (false)
    setElementData(localPlayer,"hudoff",false)
    setElementData(localPlayer,"radaroff",false)
    showChat(true)
    if panel == true then 
        local veh = getPedOccupiedVehicle(localPlayer)
        if veh then 
            setElementFrozen(veh,false)
            if getElementData(veh,"coszmienial") == true then 
                triggerServerEvent("tuning:restartauta", localPlayer, veh)
            end
        end
    end
    if isEventHandlerAdded("onClientRender", root, gui) then
        removeEventHandler ("onClientRender", root, gui)
        panel = false 
    end
end

for i,v in pairs(markery) do 
    local marker=createMarker(v[1], v[2], v[3]-0.7,"cylinder",3,201,71,71,1)
    setElementData(marker,"mpod",true)
    setElementData(marker,"mtekst","Warsztat tuningowy")
    setElementData(marker,"mikona","")
    addEventHandler("onClientMarkerHit", marker, wjechalwmarker)
    addEventHandler("onClientMarkerLeave", marker, wyjechalzmarkera)
end


--WYLACZENIE KLIK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(844/zmienna, 919/zmienna, 228/zmienna, 69/zmienna) and panel == true then
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wylacza"
            guiSetInputMode("allow_binds")
            showCursor (false)
            setElementData(localPlayer,"hudoff",false)
            setElementData(localPlayer,"radaroff",false)
            showChat(true)
            local veh = getPedOccupiedVehicle(localPlayer)
            if veh then 
                setElementFrozen(veh,false)
                if getElementData(veh,"coszmienial") == true then 
                    triggerServerEvent("tuning:restartauta", localPlayer, veh)
                end
            end
                if isEventHandlerAdded("onClientRender", root, gui) then
                    removeEventHandler ("onClientRender", root, gui)
                    panel = false 
                end
        end
    end
end)

--Zmiana zakładek
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(40/zmienna, 9/zmienna, 228/zmienna, 69/zmienna) and panel == true then
            zakladka = 1
        end
        if isMouseIn(308/zmienna, 9/zmienna, 228/zmienna, 69/zmienna) and panel == true then
            zakladka = 2
        end
        if isMouseIn(576/zmienna, 9/zmienna, 228/zmienna, 69/zmienna) and panel == true then
            zakladka = 3
        end
        if isMouseIn(844/zmienna, 9/zmienna, 228/zmienna, 69/zmienna) and panel == true then
            zakladka = 4
        end
        if isMouseIn(1112/zmienna, 9/zmienna, 228/zmienna, 69/zmienna) and panel == true then
            zakladka = 5
        end
        if isMouseIn(1380/zmienna, 9/zmienna, 228/zmienna, 69/zmienna) and panel == true then
            zakladka = 6
        end
        if isMouseIn(1648/zmienna, 9/zmienna, 228/zmienna, 69/zmienna) and panel == true then
           zakladka = 7
        end
    end
end)

addEvent("tuning:oddajinfo", true)
addEventHandler("tuning:oddajinfo", root, function(result)
    for i,v in pairs(result) do
        if v["neon"] == 0 then neony = "#5a3795Brak" end
		if v["neon"] == 1 then neony = "#5a3795Zamontowane" end
		if v["neon"] == 2 then neony = "#5a3795Migające" end
        if v["zamaskowany"] == 1 then maskowanie = "#5a3795Zamontowane" end 
        if v["zamaskowany"] == 0 then maskowanie = "#DDDDDDBrak" end 
        if v["karbon"] == 1 then karbon = "#5a3795Zamontowane" end 
        if v["karbon"] == 0 then karbon = "#DDDDDDBrak" end 
        if v["naped"] == 1 then naped = "#5a3795Zamontowane" end 
        if v["naped"] == 0 then naped = "#DDDDDDBrak" end 
        if v["zawieszenie"] == 1 then zawieszenie = "#5a3795Zamontowane" end 
        if v["zawieszenie"] == 0 then zawieszenie = "#DDDDDDBrak" end 
        silnik = v["silnik"]
        silnik = string.format("%.1f", silnik)
        silnik = "#5a3795"..silnik.."L"
        cylindry = "#5a3795V"..v["cylindry"]
        klakson = "#5a3795"..v["klakson"]
        if v["trakcja"] == 0 then trakcja = "#5a3795Standard" end
		if v["trakcja"] == 1 then trakcja = "#5a3795Street" end
		if v["trakcja"] == 2 then trakcja = "#5a3795Race" end
		if v["trakcja"] == 3 then trakcja = "#5a3795Sport" end
        if v["chiptuning"] == 0 then chiptuning = "#5a3795Brak" end
		if v["chiptuning"] == 1 then chiptuning = "#5a3795Street" end
		if v["chiptuning"] == 2 then chiptuning = "#5a3795Race" end
        if v["chiptuning"] == 3 then chiptuning = "#5a3795Sport" end
        if v["tarcze"] == 0 then tarcze = "#5a3795Standard" end
		if v["tarcze"] == 1 then tarcze = "#5a3795Street" end
		if v["tarcze"] == 2 then tarcze = "#5a3795Race" end
        if v["tarcze"] == 3 then tarcze = "#5a3795Sport" end
        bak = "#5a3795"..v["bak"].."L"
        if v["lpg"] == 1 then lpg = "#5a3795Zamontowane" end 
        if v["lpg"] == 0 then lpg = "#DDDDDDBrak" end 
        if v["atrapa"] == 1 then atrapa = "#5a3795Zamontowane" end 
        if v["atrapa"] == 0 then atrapa = "#DDDDDDBrak" end 
        if v["us1"] == 1 then us1 = "#5a3795Zamontowane" end 
        if v["us1"] == 0 then us1 = "#DDDDDDBrak" end 
        if v["us2"] == 1 then us2 = "#5a3795Zamontowane" end 
        if v["us2"] == 0 then us2 = "#DDDDDDBrak" end 
        if v["us3"] == 1 then us3 = "#5a3795Zamontowane" end 
        if v["us3"] == 0 then us3 = "#DDDDDDBrak" end 
	end
end)


function isMouseIn(psx,psy,pssx,pssy,abx,aby)
    if not isCursorShowing() then return end
    cx,cy=getCursorPosition()
    cx,cy=cx*sx,cy*sy
    if cx >= psx and cx <= psx+pssx and cy >= psy and cy <= psy+pssy then
        return true,cx,cy
    else
        return false
    end
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end

	return false
end

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end

function formatujnaprzecinki(amount) 
	local formatted = amount 
	while true do   
	  formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2') 
	  if (k==0) then 
		break 
	  end 
	end 
	return formatted 
  end