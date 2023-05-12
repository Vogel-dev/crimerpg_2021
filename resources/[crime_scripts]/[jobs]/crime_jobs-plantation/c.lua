--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local nazwa = "Plantacja"
local punkty = 0
local opis = "Praca polega na zrywaniu wysuszonych \nliści marihuany oraz późniejszym \nprzetransportowaniu ich do magazynu dilerów."
local wymagania = "Prawo jazdy:#5a3795 Kat. B\n#ccccccPoziom postaci: #5a379515"
local zarod = 20
local expod, expdo = 2,4
local topka = {}
local mnoznik = 1

local ul1 = 0 
local ul2 = 0 
local ul3 = 0 
local ul4 = 0 

local klik = 0 
local kolor = 0

local iks = 0 
local igrek = 0


local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
tick = getTickCount()
local panel = false
local zakladka = 1

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)
local dxfont1_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 32/zmienna)
local dxfont2_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)
local dxfont3_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 15/zmienna)
local dxfont4_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmienna)
local dxfont3_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)
local dxfont4_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 26/zmienna)
local dxfont2_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)

local punktykopanie = {
    {2365.8305664063,-1625.4770507813,957.6484375},
    {2365.1203613281,-1622.4742431641,957.6484375},
    {2365.6337890625,-1619.4969482422,957.6484375},
    {2366.8674316406,-1615.7147216797,957.6484375},
    {2366.0844726563,-1612.6026611328,957.6484375},
    {2364.84375,-1609.5362548828,957.6484375},
    {2366.4365234375,-1606.1658935547,957.6484375},
    {2365.9345703125,-1602.8824462891,957.6484375},
    {2364.8532714844,-1599.5064697266,957.6484375},
    {2366.1633300781,-1596.3206787109,957.6484375},
    {2364.8405761719,-1595.5437011719,957.6484375},
    {2370.9301757813,-1596.2320556641,957.6484375},
    {2373.5905761719,-1597.3865966797,957.6484375},
    {2373.1896972656,-1599.3269042969,957.6484375},
    {2371.6149902344,-1601.5991210938,957.6484375},
    {2372.3415527344,-1602.7954101563,957.6484375},
    {2372.3247070313,-1604.9276123047,957.6484375},
    {2372.4675292969,-1607.1402587891,957.6484375},
    {2371.3410644531,-1610.0865478516,957.6484375},
    {2373.09375,-1612.4064941406,957.6484375},
    {2372.2822265625,-1614.9069824219,957.6484375},
    {2371.3029785156,-1616.5629882813,957.6484375},
    {2373.337890625,-1618.384765625,957.6484375},
    {2372.2668457031,-1620.7274169922,957.6484375},
    {2371.5693359375,-1622.7130126953,957.6484375},
    {2370.8051757813,-1624.6828613281,957.6484375},
    {2373.3952636719,-1625.576171875,957.6484375}
}


local marker=createMarker(2369.73, -1627.98, 957.65-1,"cylinder",1.5,90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Praca dorywczna\nPlantacja marihuany")
setElementData(marker,"mikona","")
setElementInterior(marker, 1)
local cub = createColCuboid(2367.2709960938,-1629.9970703125,957.6484375-1, 9,9,4)

local markermagazyn=createMarker(2375.85, -1624.18, 957.65-1,"cylinder",1.5,133,220,111,1)
setElementData(markermagazyn,"mpod",true)
setElementData(markermagazyn,"mtekst","Schowek")
setElementData(markermagazyn,"mikona","")
setElementInterior(markermagazyn, 1)
local cubmagazyn = createColCuboid(2374.20, -1629.50, 957.65-1, 9,9,4)

function gui()
    local ticki = getTickCount()
    if progressdwa == "wlacza" then
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(0,0,0,235,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 235 end 
        if alp2 then alp2test = alp2 else alp2 = 255 end
    else 
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(235,0,0,0,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 0 end 
        if alp2 then alp2test = alp2 else alp2 = 0 end
    end
    if panel == true then 
        --MAIN GUI
            dxDrawImage(451/zmienna, 216/zmienna, 1028/zmienna, 645/zmienna, ":crime_jobs-plantation/window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
            if getElementData(localPlayer,"player:pracadorywczna") == "Plantacja" then 
                exports["crime_gui"]:guibutton("Zakończ",892/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
            else
                exports["crime_gui"]:guibutton("Rozpocznij",892/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
            end
            exports["crime_gui"]:guibutton("Zamknij",1079/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
        if zakladka == 1 then 
            exports["crime_gui"]:guibutton("Ulepszenia",705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
            --OPIS
                exports["crime_gui"]:guitext("Opis pracy:", 484/zmienna, 380/zmienna, 841/zmienna, 438/zmienna, 200, 200, 200, alp2test, dxfont2_PantonBold, "left", "center")
                exports["crime_gui"]:guitext(opis, 484/zmienna, 428/zmienna, 841/zmienna, 568/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
            --Wymagania
                exports["crime_gui"]:guitext("Wymagania:", 484/zmienna, 568/zmienna, 841/zmienna, 626/zmienna, 200, 200, 200, alp2test, dxfont2_PantonBold, "left", "center")
                exports["crime_gui"]:guitext(wymagania, 484/zmienna, 616/zmienna, 841/zmienna, 708/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
            --Zarobki
                exports["crime_gui"]:guitext("Informacje:", 484/zmienna, 708/zmienna, 841/zmienna, 766/zmienna, 200, 200, 200, alp2test, dxfont2_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Zarobki: #5a3795"..mnoznik*zarod.." PLN/1 g #00ff7f(x"..mnoznik..")\n#ccccccPunkty: #5a3795"..formatujnaprzecinki(punkty).."\n#ccccccMarihuana w schowku: #5a3795"..formatujnaprzecinki(getElementData(localPlayer,"player:plantacjakg")).." g", 484/zmienna, 756/zmienna, 841/zmienna, 809/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
            --Top 5 roboli
                exports["crime_gui"]:guitext("Top pracowników:", 1019/zmienna, 380/zmienna, 1446/zmienna, 438/zmienna, 200, 200, 200, alp2test, dxfont2_PantonBold, "center", "center")
                local liczonko= 0
                for ID2=1,7 do
                    liczonko = liczonko+1
                    local space = 55*(liczonko-1)
                    if topka[ID2] then
                        dxDrawRectangle(1019/zmienna, (438+space)/zmienna, 427/zmienna, 46/zmienna, tocolor(45, 45, 45, alptest), false)
                        dxDrawRectangle(1019/zmienna, (484+space)/zmienna, 427/zmienna, 3/zmienna, tocolor(90, 55, 150, alp2test), false)
                        if liczonko == 1 then 
                            exports["crime_gui"]:guitext("#ffe100"..liczonko..". "..topka[ID2][1].." - #ffe100"..formatujnaprzecinki(topka[ID2][2]).." pkt ", 1019/zmienna, (438+space)/zmienna, 1445/zmienna, (484+space)/zmienna, 200, 200, 200, alp2test, dxfont4_SegoeLight, "center", "center")
                        elseif liczonko == 2 then 
                            exports["crime_gui"]:guitext("#b5b5b5"..liczonko..". "..topka[ID2][1].." - #b5b5b5"..formatujnaprzecinki(topka[ID2][2]).." pkt ", 1019/zmienna, (438+space)/zmienna, 1445/zmienna, (484+space)/zmienna, 200, 200, 200, alp2test, dxfont4_SegoeLight, "center", "center")
                        elseif liczonko == 3 then 
                            exports["crime_gui"]:guitext("#a80000"..liczonko..". "..topka[ID2][1].." - #a80000"..formatujnaprzecinki(topka[ID2][2]).." pkt ", 1019/zmienna, (438+space)/zmienna, 1445/zmienna, (484+space)/zmienna, 200, 200, 200, alp2test, dxfont4_SegoeLight, "center", "center")
                        else    
                            exports["crime_gui"]:guitext("#5a3795"..liczonko..".#cccccc "..topka[ID2][1].." - #5a3795"..formatujnaprzecinki(topka[ID2][2]).." pkt ", 1019/zmienna, (438+space)/zmienna, 1445/zmienna, (484+space)/zmienna, 200, 200, 200, alp2test, dxfont4_SegoeLight, "center", "center")
                        end
                    end
                end
        elseif zakladka == 2 then 
            exports["crime_gui"]:guibutton("Informacje",705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
            --ULEPSZENIE 1 
                dxDrawImage(462/zmienna, 371/zmienna, 73/zmienna, 73/zmienna, ":crime_files/other/cos.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                exports["crime_gui"]:guitext("Sprinter", 545/zmienna, 377/zmienna, 789/zmienna, 409/zmienna, 200, 200, 200, alp2test, dxfont3_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Umożliwia bieganie.", 545/zmienna, 409/zmienna, 894/zmienna, 440/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext("", 472/zmienna, 381/zmienna, 525/zmienna, 434/zmienna, 200, 200, 200, alp2test, dxfont4_FA5, "center", "center")
                if ul1 == 0 then
                    exports["crime_gui"]:guibutton("Kup (#FF0000-2,000pkt#cccccc)",472/zmienna, 454/zmienna, 239/zmienna, 44/zmienna, alp2test)
                else 
                    exports["crime_gui"]:guibutton("#00FF00√ Posiadasz",472/zmienna, 454/zmienna, 239/zmienna, 44/zmienna, alp2test)
                end
            --ULEPSZENIE 2 
                dxDrawImage(462/zmienna, 508/zmienna, 73/zmienna, 73/zmienna, ":crime_files/other/cos.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                exports["crime_gui"]:guitext("Zielarz", 545/zmienna, 513/zmienna, 789/zmienna, 545/zmienna, 200, 200, 200, alp2test, dxfont3_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Zrywasz więcej liści z jednej sadzonki.", 545/zmienna, 545/zmienna, 894/zmienna, 576/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext("", 472/zmienna, 518/zmienna, 525/zmienna, 571/zmienna, 200, 200, 200, alp2test, dxfont4_FA5, "center", "center")
                if ul2 == 0 then
                    exports["crime_gui"]:guibutton("Kup (#FF0000-3,000pkt#cccccc)",472/zmienna, 591/zmienna, 239/zmienna, 44/zmienna, alp2test)
                else 
                    exports["crime_gui"]:guibutton("#00FF00√ Posiadasz",472/zmienna, 591/zmienna, 239/zmienna, 44/zmienna, alp2test)
                end
            --ULEPSZENIE 3
                dxDrawImage(462/zmienna, 645/zmienna, 73/zmienna, 73/zmienna, ":crime_files/other/cos.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                exports["crime_gui"]:guitext("Siłacz", 545/zmienna, 650/zmienna, 789/zmienna, 682/zmienna, 200, 200, 200, alp2test, dxfont3_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Możesz unieść więcej.", 545/zmienna, 682/zmienna, 894/zmienna, 713/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext("", 472/zmienna, 655/zmienna, 525/zmienna, 708/zmienna, 200, 200, 200, alp2test, dxfont4_FA5, "center", "center")
                if ul3 == 0 then
                    exports["crime_gui"]:guibutton("Kup (#FF0000-2,000pkt#cccccc)",472/zmienna, 728/zmienna, 239/zmienna, 44/zmienna, alp2test)
                else 
                    exports["crime_gui"]:guibutton("#00FF00√ Posiadasz",472/zmienna, 728/zmienna, 239/zmienna, 44/zmienna, alp2test)
                end
            --ULEPSZENIE 4
                dxDrawImage(942/zmienna, 371/zmienna, 73/zmienna, 73/zmienna, ":crime_files/other/cos.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                exports["crime_gui"]:guitext("Fanatyk", 1025/zmienna, 377/zmienna, 1269/zmienna, 409/zmienna, 200, 200, 200, alp2test, dxfont3_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Większy pojazd do przewozu towaru.", 1025/zmienna, 409/zmienna, 1374/zmienna, 440/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext("", 952/zmienna, 381/zmienna, 1005/zmienna, 434/zmienna, 200, 200, 200, alp2test, dxfont4_FA5, "center", "center")
                if ul4 == 0 then
                    exports["crime_gui"]:guibutton("Kup (#FF0000-5,000pkt#cccccc)",952/zmienna, 450/zmienna, 239/zmienna, 44/zmienna, alp2test)
                else 
                    exports["crime_gui"]:guibutton("#00FF00√ Posiadasz",952/zmienna, 450/zmienna, 239/zmienna, 44/zmienna, alp2test)
                end
        end
    end
end

function sklad()
    local ticki = getTickCount()
    if progressdwa == "wlacza" then
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(0,0,0,235,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 235 end 
        if alp2 then alp2test = alp2 else alp2 = 255 end
    else 
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(235,0,0,0,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 0 end 
        if alp2 then alp2test = alp2 else alp2 = 0 end
    end
    if panel == "sklad" then 
        local przysobis = getElementData(localPlayer,"player:plantacjaprzysobie") or 0
        dxDrawImage(641/zmienna, 295/zmienna, 638/zmienna, 299/zmienna, "window-2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guitext("#ccccccPosiadasz w schowku: #5a3795"..formatujnaprzecinki(getElementData(localPlayer,"player:plantacjakg")).." g\n#ccccccPosiadasz przy sobie:#5a3795 "..przysobis.." g", 621/zmienna, 398/zmienna, 1298/zmienna, 495/zmienna, 200, 200, 200, alp2test, dxfont2_SegoeLight, "center", "center")

        exports["crime_gui"]:guibutton("Rozładuj",870/zmienna, 505/zmienna, 180/zmienna, 54/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Wywieź",656/zmienna, 505/zmienna, 180/zmienna, 54/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Zamknij",1082/zmienna, 505/zmienna, 180/zmienna, 54/zmienna, alp2test)
    end
end

--WLACZANIE MAGAZYN
addEventHandler("onClientMarkerHit", markermagazyn, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if veh then return end
    if not isElementWithinColShape(localPlayer,cubmagazyn) then return end
    triggerServerEvent("plantacja:dajinfo", localPlayer)
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wlacza"
	addEventHandler("onClientRender",root,sklad)
	panel = "sklad"
    showCursor(true)
end)

--WYLACZANIE MAGAZYN
addEventHandler("onClientMarkerLeave", markermagazyn, function(el,md)
	if el~=localPlayer then return end
	tickistart = getTickCount()
    czas = 500
    progressdwa = "wylacza"
    guiSetInputMode("allow_binds")
    showCursor (false)
    setTimer(function()
        if isEventHandlerAdded("onClientRender", root, sklad) then
            removeEventHandler ("onClientRender", root, sklad)
            panel = false 
        end
    end, 500, 1)
end)

--Wylaczenie klik magazyn
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(1082/zmienna, 505/zmienna, 180/zmienna, 54/zmienna) and panel == "sklad" then
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wylacza"
            guiSetInputMode("allow_binds")
            showCursor (false)
            setTimer(function()
                if isEventHandlerAdded("onClientRender", root, sklad) then
                    removeEventHandler ("onClientRender", root, sklad)
                    panel = false 
                end
            end, 500, 1)
        end
    end
end)

--Rozladuj
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(870/zmienna, 505/zmienna, 180/zmienna, 54/zmienna) and panel == "sklad" then
            local przysobiesad = getElementData(localPlayer,"player:plantacjaprzysobie") or 0
            if przysobiesad == 0 then exports.crime_gui:addNoti("Nie posiadasz przy sobie żadnego suszu.", "error") return end
            local wskladzie = getElementData(localPlayer,"player:plantacjakg")
            setElementData(localPlayer,"player:plantacjaprzysobie",0)
            setElementData(localPlayer,"player:plantacjakg",wskladzie+przysobiesad)
        end
    end
end)

--Wywożenie
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(656/zmienna, 505/zmienna, 180/zmienna, 54/zmienna) and panel == "sklad" then
            local kilogramsy = getElementData(localPlayer,"player:plantacjakg") or 0
            if kilogramsy == 0 then exports.crime_gui:addNoti("Nie posiadasz żadnego towaru w schowku.", "error") return end
            if getElementData(localPlayer,"player:lvl") < 15 then exports.crime_gui:addNoti("Posiadasz zbyt niski poziom, aby pracować tutaj.", "error") return end
            if getElementData(localPlayer,"player:pracadorywczna") == "Plantacja" then exports.crime_gui:addNoti("Zakończ pracę na plantacji.", "error") return end
            if getElementData(localPlayer,"player:pracadorywczna") then exports.crime_gui:addNoti("Już gdzieś pracujesz, jedź się zwolnij.", "error") return end
            if not getElementData(localPlayer,"player:uid") then exports.crime_gui:addNoti("Nie posiadasz UID.", "error") return end
            if getElementData(localPlayer,"player:license:pjB") ~= 1 then exports.crime_gui:addNoti("Nie posiadasz prawa jazdy kat B.", "error") return end
            if getElementData(localPlayer,"player:admin") then exports.crime_gui:addNoti("Zejdź z duty administracji.", "error") return end
            if ul4 == 1 then 
                if kilogramsy >= 2000 then 
                    triggerServerEvent("plantacja:wywiez", localPlayer, 2000,1)
                    exports.crime_gui:addNoti("Maksymalnie możesz wywieźć 2 kilogramy.", "error")
                else 
                    triggerServerEvent("plantacja:wywiez", localPlayer, kilogramsy,1)
                end
            elseif ul4 == 0 then 
                if kilogramsy >= 1000 then 
                    triggerServerEvent("plantacja:wywiez", localPlayer, 1000,0)
                    exports.crime_gui:addNoti("Maksymalnie możesz wywieźć kilogram.", "error")
                else 
                    triggerServerEvent("plantacja:wywiez", localPlayer, kilogramsy,0)
                end
            end
        end
    end
end)

function skala()
    if panel == "skala" then 
        --SKAŁA
        if klik == 0 then 
            dxDrawImage(800/zmienna, 426/zmienna, 326/zmienna, 245/zmienna, ":crime_jobs-plantation/weed.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif klik == 1 then 
            dxDrawImage(800/zmienna, 426/zmienna, 326/zmienna, 245/zmienna, ":crime_jobs-plantation/weed.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif klik == 2 then 
            dxDrawImage(800/zmienna, 426/zmienna, 326/zmienna, 245/zmienna, ":crime_jobs-plantation/weed.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif klik == 3 then 
            dxDrawImage(800/zmienna, 426/zmienna, 326/zmienna, 245/zmienna, ":crime_jobs-plantation/weed.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif klik == 4 then 
            dxDrawImage(800/zmienna, 426/zmienna, 326/zmienna, 245/zmienna, ":crime_jobs-plantation/weed.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
        --PUNKT
        if kolor == 1 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(255, 0, 0, 255), false)
        elseif kolor == 2 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(255, 255, 0, 255), false)
        elseif kolor == 3 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(255, 0, 255, 255), false)
        elseif kolor == 4 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(0, 255, 255, 255), false)
        elseif kolor == 5 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(200, 255, 0, 255), false)
        elseif kolor == 6 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(90, 55, 150, 255), false)
        elseif kolor == 7 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(155, 255, 0, 255), false)
        elseif kolor == 8 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(0, 255, 155, 255), false)
        elseif kolor == 9 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(0, 155, 255, 255), false)
        elseif kolor == 10 then 
            dxDrawImage(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna, ":crime_jobs-plantation/klik.png", 0, 0, 0, tocolor(155, 0, 255, 255), false)
        end
    end
end

--Kup ulepszenie
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(472/zmienna, 454/zmienna, 239/zmienna, 44/zmienna) and panel == true and zakladka == 2 and ul1 == 0 then
            triggerServerEvent("plantacja:kupulepszenie", localPlayer, 1, 2000)
        elseif isMouseIn(472/zmienna, 591/zmienna, 239/zmienna, 44/zmienna) and panel == true and zakladka == 2 and ul2 == 0 then
            triggerServerEvent("plantacja:kupulepszenie", localPlayer, 2, 3000)
        elseif isMouseIn(472/zmienna, 728/zmienna, 239/zmienna, 44/zmienna) and panel == true and zakladka == 2 and ul3 == 0 then
            triggerServerEvent("plantacja:kupulepszenie", localPlayer, 3, 2000)
        elseif isMouseIn(952/zmienna, 450/zmienna, 239/zmienna, 44/zmienna) and panel == true and zakladka == 2 and ul4 == 0 then
            triggerServerEvent("plantacja:kupulepszenie", localPlayer, 4, 5000)
        end
    end
end)

--WLACZANIE
addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if veh then return end
    if not isElementWithinColShape(localPlayer,cub) then return end
    triggerServerEvent("plantacja:dajinfo", localPlayer)
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wlacza"
	addEventHandler("onClientRender",root,gui)
	panel = true
    showCursor(true)
end)

--WYLACZANIE
addEventHandler("onClientMarkerLeave", marker, function(el,md)
	if el~=localPlayer then return end
	tickistart = getTickCount()
    czas = 500
    progressdwa = "wylacza"
    guiSetInputMode("allow_binds")
    showCursor (false)
    setTimer(function()
        if isEventHandlerAdded("onClientRender", root, gui) then
            removeEventHandler ("onClientRender", root, gui)
            panel = false 
        end
    end, 500, 1)
end)

--Zmiana zakładki
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true and zakladka == 2 then
            zakladka = 1
        elseif isMouseIn(705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true and zakladka == 1 then
            zakladka = 2
        end
    end
end)

--Wylaczenie klik
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(1079/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true then
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wylacza"
            guiSetInputMode("allow_binds")
            showCursor (false)
            setTimer(function()
                if isEventHandlerAdded("onClientRender", root, gui) then
                    removeEventHandler ("onClientRender", root, gui)
                    panel = false 
                end
            end, 500, 1)
        end
    end
end)

--ROZPOCZYNANIE/KONCZENIE PRACY
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(892/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true then
            local pracadorywcza = getElementData(localPlayer,"player:pracadorywczna")
            if pracadorywcza == "Plantacja" then --KONCZENIE
                zakonczprace()
            else --ROZPOCZYNANIE
                if getElementData(localPlayer,"player:lvl") < 15 then exports.crime_gui:addNoti("Posiadasz zbyt niski poziom, aby pracować tutaj.", "error") return end
                if getElementData(localPlayer,"player:pracadorywczna") then exports.crime_gui:addNoti("Już gdzieś pracujesz, jedź się zwolnij.", "error") return end
                if not getElementData(localPlayer,"player:uid") then exports.crime_gui:addNoti("Nie posiadasz UID.", "error") return end
                if getElementData(localPlayer,"player:admin") then exports.crime_gui:addNoti("Zejdź z duty administracji.", "error") return end
                rozpocznijprace()
            end
        end
    end
end)

function rozpocznijprace()
    setElementData(localPlayer,"player:pracadorywczna", "Plantacja")
    exports.crime_gui:addNoti("Rozpocząłeś prace na plantacji.", "info")
    if ul1 == 0 then 
        toggleControl("sprint", false) 
    end
    toggleControl("next_weapon", false) 
    toggleControl("previous_weapon", false) 
    toggleControl("jump", false) 
    losowypunkt()
end

function zakonczprace()
    setElementData(localPlayer,"player:pracadorywczna", false)
    exports.crime_gui:addNoti("Zakończyłeś prace na plantacji.", "info")
    toggleControl("next_weapon", true) 
    toggleControl("previous_weapon", true) 
    toggleControl("sprint", true) 
    toggleControl("jump", true) 
    if punkts then 
        destroyElement(punkts)
    end 
    if blip then
        destroyElement(blip)
    end
end

function losowypunkt()
    local punkt = math.random(1,#punktykopanie)
    if punkt then 
        punkts = createMarker(punktykopanie[punkt][1], punktykopanie[punkt][2], punktykopanie[punkt][3]-0.9,"cylinder",1.5,133,220,111,1)
        blip = createBlipAttachedTo(punkts,41)
        attachElementToElement(punkts,blip)
        setElementInterior(punkts, 1)
        setElementData(punkts,"mpod",true)
        setElementData(punkts,"mtekst","Zbierz plony")
        setElementData(punkts,"mtype","praca")
        setElementData(punkts,"mikona","")
        addEventHandler("onClientMarkerHit", punkts, wszedlwpunkt)
    end
end

function wszedlwpunkt(el,md)
    if el~=localPlayer then return end
    if ul3 == 1 then 
        local przysobie = getElementData(localPlayer,"player:plantacjaprzysobie") or 0
        if przysobie >= 100 then 
            setElementData(localPlayer, przysobie, 100)
            exports.crime_gui:addNoti("Więcej nie uniesiesz! (Posiadasz: "..przysobie.."/100 g).", "error")
        return end
    elseif ul3 == 0 then 
        local przysobie = getElementData(localPlayer,"player:plantacjaprzysobie") or 0
        if przysobie >= 70 then 
            setElementData(localPlayer, przysobie, 70)
            exports.crime_gui:addNoti("Więcej nie uniesiesz! (Posiadasz: "..przysobie.."/70 g).", "error")
        return end
    end
    destroyElement(punkts)
    destroyElement(blip)
    triggerServerEvent("plantacja:animka", localPlayer, "wlacz")
    kolor = math.random(1,10)
    klik = 0
    iks = math.random(814,911) 
    igrek = math.random(445,646)
    addEventHandler("onClientRender",root,skala)
	panel = "skala"
    showCursor(true)
    setElementFrozen(localPlayer,true)
end

--Klikanie sobie w kamienia
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(iks/zmienna, igrek/zmienna, 42/zmienna, 42/zmienna) and panel == "skala" then
            kolor = math.random(1,10)
            klik = klik+1
            iks = math.random(814,911) 
            igrek = math.random(445,646)
            if klik == 5 then 
                removeEventHandler("onClientRender",root,skala)
                panel = false
                showCursor(false)
                triggerServerEvent("plantacja:animka", localPlayer, "wylacz")
                setElementFrozen(localPlayer,false)
                losowypunkt()
                triggerServerEvent("plantacja:dodajpunkt", localPlayer)
                local exp = math.random(expod,expdo)
                local pexp = getElementData(localPlayer,"player:exp") or 0 
                setElementData(localPlayer,"player:exp",pexp+exp)
                if ul2 == 1 then 
                    local kilo = math.random(2,9)
                    local przysobie = getElementData(localPlayer,"player:plantacjaprzysobie") or 0
                    setElementData(localPlayer,"player:plantacjaprzysobie",przysobie+kilo)
                    exports.crime_gui:addNoti("Zebrałeś "..kilo.." g suszu marihuany.  (Posiadasz: "..przysobie+kilo.." g).", "success")
                elseif ul2 == 0 then 
                    local kilo = math.random(1,5)
                    local przysobie = getElementData(localPlayer,"player:plantacjaprzysobie") or 0
                    setElementData(localPlayer,"player:plantacjaprzysobie",przysobie+kilo)
                    exports.crime_gui:addNoti("Zebrałeś "..kilo.." g suszu marihuany.  (Posiadasz: "..przysobie+kilo.." g).", "success")
                end
            end
        end
    end
end)

addEvent("plantacja:oddajinfo", true)
addEventHandler("plantacja:oddajinfo", root, function(result,resultdwa)
    topka = {}
    for i,v in pairs(result) do
		table.insert(topka, {v["login"], v["gornikpkt"]})
    end
    for i,v in pairs(resultdwa) do
        punkty = v["gornikpkt"]
        ul1 = v["gornikul1"]
        ul2 = v["gornikul2"]
        ul3 = v["gornikul3"]
        ul4 = v["gornikul4"]
	end
end)

addEventHandler("onClientPlayerWasted",getLocalPlayer(),function()
    local pracadorywcza = getElementData(localPlayer,"player:pracadorywczna")
    if pracadorywcza == "Plantacja" then
        zakonczprace()
    end
end)

addEvent("plantacja:wieziejuz", true)
addEventHandler("plantacja:wieziejuz", root, function()
    exports.crime_gui:addNoti("Wywieź towar do chłopaków na Grove Street.", "info")
    markerwywoz=createMarker(2429.51, -1673.80, 14.35-1,"cylinder",3, 242,222,121,1)
    blipwywoz = createBlipAttachedTo(markerwywoz,41)
    setElementData(markerwywoz,"mpod",true)
    setElementData(markerwywoz,"mtekst","Schowek")
    setElementData(markerwywoz,"mikona","")
    setElementData(markerwywoz,"mtype","praca")
    addEventHandler("onClientMarkerHit", markerwywoz, wywiozlsobie)
end)

function wywiozlsobie(el,md)
    if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if not veh then return end
    if getElementData(veh,"vehicle:job") == "plantacja" then 
        setElementData(localPlayer,"player:pracadorywczna",false)
        destroyElement(markerwywoz)
        destroyElement(blipwywoz)
        local kilosad = getElementData(veh,"vehicle:kilogramsysad")
        dostanie = (kilosad*zarod)*mnoznik
        local posiadas = getElementData(localPlayer,"player:plantacjakg")
        setElementData(localPlayer,"player:plantacjakg",posiadas-kilosad)
        triggerServerEvent("plantacja:hajs", localPlayer, dostanie)
        triggerServerEvent("plantacja:vehdel", localPlayer, veh)
        setTimer(function()
            setElementPosition(localPlayer,1986.14, -1095.47, 25.33)
        end, 1000, 1)
    end
end


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

