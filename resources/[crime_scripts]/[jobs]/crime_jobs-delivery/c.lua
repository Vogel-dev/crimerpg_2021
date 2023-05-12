--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local nazwa = "Kurier"
local punkty = 0
local opis = "Praca polega na dotarciu w wyznaczone \nmiejsce oraz dostarczenie do \npunktu przesyłki z narkotykami."
local wymagania = "Prawo jazdy:#5a3795 Kat. B"
local zarod,zardo = 400,560
local expod,expdo = 14,16
local topka = {}
local mnoznik = 1

local ul1 = 0 
local ul2 = 0 
local ul3 = 0

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
tick = getTickCount()
local panel = false
local zakladka = 1

local onoffprad = false 

local punktyprad = {
    {769.22686767578,-1692.2579345703,4.5748648643494},
    {1133.4545898438,-1386.0128173828,13.760892868042},
    {2022.4792480469,-1094.9916992188,24.561912536621},
    {2341.1765136719,-1368.3321533203,24.3984375},
    {1927.5197753906,-1633.6545410156,13.545024871826},
    {2470.7087402344,-1991.0541992188,13.546875},
    {2323.9716796875,-1266.1197509766,27.979021072388},
    {2399.94140625,-1272.255859375,24.415115356445},
    {2483.3791503906,-1763.8184814453,13.553937911987},
    {2047.36328125,-1718.3371582031,13.546875},
    {2037.2194824219,-1644.9487304688,13.546875},
    {1705.1083984375,-1561.4111328125,13.546875},
    {1709.5042724609,-1519.9304199219,13.546875},
    {1677.0357666016,-992.67260742188,24.0703125},
    {1451.8795166016,-1096.2006835938,17.695064544678},
    {1432.0645751953,-1096.1838378906,17.582677841187},
    {1424.2010498047,-1099.6669921875,17.55248260498},
    {1424.3272705078,-1077.9291992188,17.56143951416},
    {707.8642578125,-1180.4722900391,16.0915184021},
    {696.84606933594,-1200.5018310547,15.172245025635},
    {772.07330322266,-1093.5760498047,24.076997756958},
    {644.64947509766,-1769,12.629444122314},
    {1332.0223388672,-1722.6403808594,13.546875},
    {1358.8685302734,-1758.8370361328,13.5078125},
    {1336.9318847656,-1749.9455566406,13.536831855774},
    {1347.400390625,-1690.1336669922,13.599254608154},
    {1341.8092041016,-1669.3811035156,13.578420639038},
    {1342.4831542969,-1622.7717285156,13.585334777832},
    {1566.6303710938,-1576.0434570313,13.546875},
    {1580.7487792969,-1601.9196777344,13.546875},
    {1849.5659179688,-1633.3822021484,13.54843711853},
    {1804.3875732422,-1435.7119140625,13.4296875},
}

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)
local dxfont1_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 32/zmienna)
local dxfont2_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)
local dxfont3_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 15/zmienna)
local dxfont4_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmienna)
local dxfont3_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)
local dxfont4_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 26/zmienna)
local dxfont0_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 22/zmienna)


local marker=createMarker(2430.49, -1677.85, 14.35-1,"cylinder",1.5,90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Praca dorywczna\nKurier")
setElementData(marker,"mikona","")
local cub = createColCuboid(2423.80, -1680.60, 13.35, 14,12,5)

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
            dxDrawImage(451/zmienna, 216/zmienna, 1028/zmienna, 645/zmienna, ":crime_jobs-delivery/kurier.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
            if getElementData(localPlayer,"player:pracadorywczna") == "Kurier" then 
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
                exports["crime_gui"]:guitext("Zarobki: #5a3795"..mnoznik*zarod.." PLN - "..mnoznik*zardo.." PLN#cccccc #00ff7f(x"..mnoznik..")\n#ccccccPunkty: #5a3795"..punkty.."", 484/zmienna, 756/zmienna, 841/zmienna, 809/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
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
                exports["crime_gui"]:guitext("Szybszy pojazd", 545/zmienna, 377/zmienna, 789/zmienna, 409/zmienna, 200, 200, 200, alp2test, dxfont3_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Twój pojazd otrzyma nowe części.", 545/zmienna, 409/zmienna, 894/zmienna, 440/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext("", 472/zmienna, 381/zmienna, 525/zmienna, 434/zmienna, 200, 200, 200, alp2test, dxfont4_FA5, "center", "center")
                if ul1 == 0 then
                    exports["crime_gui"]:guibutton("Kup (#FF0000-300pkt#cccccc)",472/zmienna, 454/zmienna, 239/zmienna, 44/zmienna, alp2test)
                else 
                    exports["crime_gui"]:guibutton("#00FF00√ Posiadasz",472/zmienna, 454/zmienna, 239/zmienna, 44/zmienna, alp2test)
                end
            --ULEPSZENIE 2 
                dxDrawImage(462/zmienna, 508/zmienna, 73/zmienna, 73/zmienna, ":crime_files/other/cos.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                exports["crime_gui"]:guitext("Droższe zlecenia", 545/zmienna, 513/zmienna, 789/zmienna, 545/zmienna, 200, 200, 200, alp2test, dxfont3_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Od teraz będziesz dostarczał kokainę.", 545/zmienna, 545/zmienna, 894/zmienna, 576/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext("", 472/zmienna, 518/zmienna, 525/zmienna, 571/zmienna, 200, 200, 200, alp2test, dxfont4_FA5, "center", "center")
                if ul2 == 0 then
                    exports["crime_gui"]:guibutton("Kup (#FF0000-500pkt#cccccc)",472/zmienna, 591/zmienna, 239/zmienna, 44/zmienna, alp2test)
                else 
                    exports["crime_gui"]:guibutton("#00FF00√ Posiadasz",472/zmienna, 591/zmienna, 239/zmienna, 44/zmienna, alp2test)
                end
            --ULEPSZENIE 3
                dxDrawImage(462/zmienna, 645/zmienna, 73/zmienna, 73/zmienna, ":crime_files/other/cos.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                exports["crime_gui"]:guitext("Lepsze ukrycie", 545/zmienna, 650/zmienna, 789/zmienna, 682/zmienna, 200, 200, 200, alp2test, dxfont3_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Masz więcej czasu zanim ktoś Cię zauważy.", 545/zmienna, 682/zmienna, 894/zmienna, 713/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext("", 472/zmienna, 655/zmienna, 525/zmienna, 708/zmienna, 200, 200, 200, alp2test, dxfont4_FA5, "center", "center")
                if ul3 == 0 then
                    exports["crime_gui"]:guibutton("Kup (#FF0000-200pkt#cccccc)",472/zmienna, 728/zmienna, 239/zmienna, 44/zmienna, alp2test)
                else 
                    exports["crime_gui"]:guibutton("#00FF00√ Posiadasz",472/zmienna, 728/zmienna, 239/zmienna, 44/zmienna, alp2test)
                end
        end
    end
end

function panelprad()
    if onoffprad == true then 
        dxDrawImage(472/zmienna, 286/zmienna, 962/zmienna, 509/zmienna, ":crime_jobs-delivery/panel.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        exports["crime_gui"]:guitext("#FF0000Czas do wykrycia: "..string.format("%.03f", czas).." s", 1158/zmienna, 726/zmienna, 1424/zmienna, 785/zmienna, 255, 255, 255, 255, dxfont0_FiraEC, "right", "bottom")
        if pozycja == 1 then 
            dxDrawImage(505/zmienna, 724/zmienna, 57/zmienna, 57/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r3, g3, b3, 255), false)
            dxDrawImage(1007/zmienna, 502/zmienna, 57/zmienna, 57/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r3, g3, b3, 255), false)

            dxDrawImage(755/zmienna, 518/zmienna, 57/zmienna, 57/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r2, g2, b2, 255), false)
            dxDrawImage(1225/zmienna, 569/zmienna, 57/zmienna, 57/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r2, g2, b2, 255), false)

            dxDrawImage(960/zmienna, 323/zmienna, 57/zmienna, 57/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r1, g1, b1, 255), false)
            dxDrawImage(874/zmienna, 683/zmienna, 57/zmienna, 57/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r1, g1, b1, 255), false)

            dxDrawImage(542/zmienna, 323/zmienna, 57/zmienna, 57/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r4, g4, b4, 255), false)
            dxDrawImage(1292/zmienna, 333/zmienna, 57/zmienna, 57/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r4, g4, b4, 255), false)
            if kabel1 == true then 
                dxDrawLine ((505+28)/zmienna, (724+28)/zmienna, (1007+28)/zmienna, (502+28)/zmienna, tocolor(r3,g3,b3,255), 7)
            end
            if kabel2 == true then 
                dxDrawLine ((755+28)/zmienna, (518+28)/zmienna, (1225+28)/zmienna, (569+28)/zmienna, tocolor(r2,g2,b2,255), 7)
            end
            if kabel3 == true then 
                dxDrawLine ((960+28)/zmienna, (323+28)/zmienna, (874+28)/zmienna, (683+28)/zmienna, tocolor(r1,g1,b1,255), 7)
            end
            if kabel4 == true then 
                dxDrawLine ((542+28)/zmienna, (323+28)/zmienna, (1292+28)/zmienna, (333+28)/zmienna, tocolor(r4,g4,b4,255), 7)
            end
            if zaznaczony == 1 or zaznaczony == 2 then 
                stc3, stc4 = getcur()
                dxDrawLine (stc1,stc2, stc3, stc4, tocolor(r3,g3,b3,255), 7)
            end
            if zaznaczony == 3 or zaznaczony == 4 then 
                stc3, stc4 = getcur()
                dxDrawLine (stc1,stc2, stc3, stc4, tocolor(r2,g2,b2,255), 7)
            end
            if zaznaczony == 5 or zaznaczony == 6 then 
                stc3, stc4 = getcur()
                dxDrawLine (stc1,stc2, stc3, stc4, tocolor(r1,g1,b1,255), 7)
            end
            if zaznaczony == 7 or zaznaczony == 8 then 
                stc3, stc4 = getcur()
                dxDrawLine (stc1,stc2, stc3, stc4, tocolor(r4,g4,b4,255), 7)
            end
        elseif pozycja == 2 then 
            dxDrawImage(774/zmienna, 619/zmienna, 59/zmienna, 59/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r3, g3, b3, 255), false)
            dxDrawImage(1171/zmienna, 412/zmienna, 59/zmienna, 59/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r3, g3, b3, 255), false)

            dxDrawImage(1051/zmienna, 321/zmienna, 59/zmienna, 59/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r2, g2, b2, 255), false)
            dxDrawImage(560/zmienna, 367/zmienna, 59/zmienna, 59/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r2, g2, b2, 255), false)

            dxDrawImage(808/zmienna, 421/zmienna, 59/zmienna, 59/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r4, g4, b4, 255), false)
            dxDrawImage(1270/zmienna, 597/zmienna, 59/zmienna, 59/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r4, g4, b4, 255), false)

            dxDrawImage(978/zmienna, 514/zmienna, 59/zmienna, 59/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r1, g1, b1, 255), false)
            dxDrawImage(534/zmienna, 582/zmienna, 59/zmienna, 59/zmienna, ":crime_jobs-delivery/punkt.png", 0, 0, 0, tocolor(r1, g1, b1, 255), false)


            if kabel1 == true then 
                dxDrawLine ((774+28)/zmienna, (619+28)/zmienna, (1171+28)/zmienna, (412+28)/zmienna, tocolor(r3,g3,b3,255), 7)
            end
            if kabel2 == true then 
                dxDrawLine ((1051+28)/zmienna, (321+28)/zmienna, (560+28)/zmienna, (367+28)/zmienna, tocolor(r2,g2,b2,255), 7)
            end
            if kabel3 == true then 
                dxDrawLine ((808+28)/zmienna, (421+28)/zmienna, (1270+28)/zmienna, (597+28)/zmienna, tocolor(r4,g4,b4,255), 7)
            end
            if kabel4 == true then 
                dxDrawLine ((978+28)/zmienna, (514+28)/zmienna, (534+28)/zmienna, (582+28)/zmienna, tocolor(r1,g1,b1,255), 7)
            end
            if zaznaczony == 1 or zaznaczony == 2 then 
                stc3, stc4 = getcur()
                dxDrawLine (stc1,stc2, stc3, stc4, tocolor(r3,g3,b3,255), 7)
            end
            if zaznaczony == 3 or zaznaczony == 4 then 
                stc3, stc4 = getcur()
                dxDrawLine (stc1,stc2, stc3, stc4, tocolor(r2,g2,b2,255), 7)
            end
            if zaznaczony == 5 or zaznaczony == 6 then 
                stc3, stc4 = getcur()
                dxDrawLine (stc1,stc2, stc3, stc4, tocolor(r4,g4,b4,255), 7)
            end
            if zaznaczony == 7 or zaznaczony == 8 then 
                stc3, stc4 = getcur()
                dxDrawLine (stc1,stc2, stc3, stc4, tocolor(r1,g1,b1,255), 7)
            end

        end
    end
end

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if pozycja == 1 then 
            --KABEL 1 W POZYCJI 1
            if isMouseIn(505/zmienna, 724/zmienna, 57/zmienna, 57/zmienna) and onoffprad == true and kabel1 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 1
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 2 then 
                    kabel1 = true
                    zaznaczony = 0
                end
            end
            if isMouseIn(1007/zmienna, 502/zmienna, 57/zmienna, 57/zmienna) and onoffprad == true and kabel1 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 2
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 1 then 
                    kabel1 = true
                    zaznaczony = 0
                end
            end

            --KABEL 2 W POZYCJI 1
            if isMouseIn(755/zmienna, 518/zmienna, 57/zmienna, 57/zmienna) and onoffprad == true and kabel2 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 3
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 4 then 
                    kabel2 = true
                    zaznaczony = 0
                end
            end
            if isMouseIn(1225/zmienna, 569/zmienna, 57/zmienna, 57/zmienna) and onoffprad == true and kabel2 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 4
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 3 then 
                    kabel2 = true
                    zaznaczony = 0
                end
            end

            --KABEL 3 W POZYCJI 1
            if isMouseIn(960/zmienna, 323/zmienna, 57/zmienna, 57/zmienna) and onoffprad == true and kabel3 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 5
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 6 then 
                    kabel3 = true
                    zaznaczony = 0
                end
            end
            if isMouseIn(874/zmienna, 683/zmienna, 57/zmienna, 57/zmienna) and onoffprad == true and kabel3 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 6
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 5 then 
                    kabel3 = true
                    zaznaczony = 0
                end
            end

            --KABEL 4 W POZYCJI 1
            if isMouseIn(542/zmienna, 323/zmienna, 57/zmienna, 57/zmienna) and onoffprad == true and kabel4 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 7
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 8 then 
                    kabel4 = true
                    zaznaczony = 0
                end
            end
            if isMouseIn(1292/zmienna, 333/zmienna, 57/zmienna, 57/zmienna) and onoffprad == true and kabel4 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 8
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 7 then 
                    kabel4 = true
                    zaznaczony = 0
                end
            end

            if kabel1 == true and kabel2 == true and kabel3 == true and kabel4 == true then 
                removeEventHandler ("onClientRender", root, panelprad)
                onoffprad = false 
                showCursor(false)
                triggerServerEvent("kurier:animka", localPlayer, "wylacz")
                setElementFrozen(localPlayer,false)
                if isTimer(timerson) then killTimer(timerson) end
                rozpocznijnext()
                triggerServerEvent("kurier:dodajpunkt", localPlayer)
                local exp = math.random(expod,expdo)
                local pexp = getElementData(localPlayer,"player:exp") or 0 
                setElementData(localPlayer,"player:exp",pexp+exp)
                local hajs = math.random(zarod,zardo)
                local hajs = hajs*mnoznik
                if ul2 == 1 then 
                    hajs = hajs*1.1
                else 
                    hajs = hajs
                end
                triggerServerEvent("kurier:hajs", localPlayer, hajs)
            return end
        elseif pozycja == 2 then 
            --KABEL 1 W POZYCJI 2
            if isMouseIn(774/zmienna, 619/zmienna, 59/zmienna, 59/zmienna) and onoffprad == true and kabel1 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 1
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 2 then 
                    kabel1 = true
                    zaznaczony = 0
                end
            end
            if isMouseIn(1171/zmienna, 412/zmienna, 59/zmienna, 59/zmienna) and onoffprad == true and kabel1 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 2
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 1 then 
                    kabel1 = true
                    zaznaczony = 0
                end
            end

            --KABEL 2 W POZYCJI 2
            if isMouseIn(1051/zmienna, 321/zmienna, 59/zmienna, 59/zmienna) and onoffprad == true and kabel2 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 3
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 4 then 
                    kabel2 = true
                    zaznaczony = 0
                end
            end
            if isMouseIn(560/zmienna, 367/zmienna, 59/zmienna, 59/zmienna) and onoffprad == true and kabel2 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 4
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 3 then 
                    kabel2 = true
                    zaznaczony = 0
                end
            end

            --KABEL 3 W POZYCJI 2
            if isMouseIn(808/zmienna, 421/zmienna, 59/zmienna, 59/zmienna) and onoffprad == true and kabel3 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 5
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 6 then 
                    kabel3 = true
                    zaznaczony = 0
                end
            end
            if isMouseIn(1270/zmienna, 597/zmienna, 59/zmienna, 59/zmienna) and onoffprad == true and kabel3 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 6
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 5 then 
                    kabel3 = true
                    zaznaczony = 0
                end
            end

            --KABEL 4 W POZYCJI 2
            if isMouseIn(978/zmienna, 514/zmienna, 59/zmienna, 59/zmienna) and onoffprad == true and kabel4 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 7
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 8 then 
                    kabel4 = true
                    zaznaczony = 0
                end
            end
            if isMouseIn(534/zmienna, 582/zmienna, 59/zmienna, 59/zmienna) and onoffprad == true and kabel4 == false then
                if zaznaczony == 0 then 
                    zaznaczony = 8
                    stc1,stc2 = getcur()
                end
                if zaznaczony == 7 then 
                    kabel4 = true
                    zaznaczony = 0
                end
            end

            if kabel1 == true and kabel2 == true and kabel3 == true and kabel4 == true then 
                removeEventHandler ("onClientRender", root, panelprad)
                onoffprad = false 
                showCursor(false)
                triggerServerEvent("kurier:animka", localPlayer, "wylacz")
                setElementFrozen(localPlayer,false)
                if isTimer(timerson) then killTimer(timerson) end
                rozpocznijnext()
                triggerServerEvent("kurier:dodajpunkt", localPlayer)
                local exp = math.random(expod,expdo)
                local pexp = getElementData(localPlayer,"player:exp") or 0 
                setElementData(localPlayer,"player:exp",pexp+exp)
                local hajs = math.random(zarod,zardo)
                local hajs = hajs*mnoznik
                if ul2 == 1 then 
                    hajs = hajs*1.1
                else 
                    hajs = hajs
                end
                triggerServerEvent("kurier:hajs", localPlayer, hajs)
            return end
        end
    end
end)

--Kup ulepszenie
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(472/zmienna, 454/zmienna, 239/zmienna, 44/zmienna) and panel == true and zakladka == 2 and ul1 == 0 then
            triggerServerEvent("kurier:kupulepszenie", localPlayer, 1, 300)
        elseif isMouseIn(472/zmienna, 591/zmienna, 239/zmienna, 44/zmienna) and panel == true and zakladka == 2 and ul2 == 0 then
            triggerServerEvent("kurier:kupulepszenie", localPlayer, 2, 500)
        elseif isMouseIn(472/zmienna, 728/zmienna, 239/zmienna, 44/zmienna) and panel == true and zakladka == 2 and ul3 == 0 then
            triggerServerEvent("kurier:kupulepszenie", localPlayer, 3, 200)
        end
    end
end)

--WLACZANIE
addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if veh then return end
    if not isElementWithinColShape(localPlayer,cub) then return end
    triggerServerEvent("kurier:dajinfo", localPlayer)
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wlacza"
	addEventHandler("onClientRender",root,gui)
	panel = true
	showCursor(true,false)
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

--WYLACZENIE KLIK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true and zakladka == 2 then
            zakladka = 1
        elseif isMouseIn(705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true and zakladka == 1 then
            zakladka = 2
        end
    end
end)

--Zmiana zakładki
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
            if pracadorywcza == "Kurier" then --KONCZENIE
                zakonczprace()
            else --ROZPOCZYNANIE
                -- if getElementData(localPlayer,"player:lvl") < 15 then exports.crime_gui:addNoti("Posiadasz zbyt niski poziom, aby pracować tutaj.", "error") return end
                if getElementData(localPlayer,"player:pracadorywczna") then exports.crime_gui:addNoti("Już gdzieś pracujesz, jedź się zwolnij.", "error") return end
                if not getElementData(localPlayer,"player:uid") then exports.crime_gui:addNoti("Nie posiadasz UID.", "error") return end
                if getElementData(localPlayer,"player:admin") then exports.crime_gui:addNoti("Zejdź z duty administracji.", "error") return end
                if getElementData(localPlayer,"player:license:pjB") ~= 1 then exports.crime_gui:addNoti("Nie posiadasz prawa jazdy kat B.", "error") return end

                setElementData(localPlayer,"player:pracadorywczna", "Kurier")
                rozpocznijprace()
            end
        end
    end
end)

function zakonczprace()
    setElementData(localPlayer,"player:pracadorywczna", false)
    if isElement(cubsi) then destroyElement(cubsi) end
    if isElement(markerdojedz) then destroyElement(markerdojedz) end
    if isElement(blipdojedz) then destroyElement(blipdojedz) end
    if isEventHandlerAdded("onClientMarkerHit", markerdojedz, wjechaldojedz) then removeEventHandler ("onClientMarkerHit", markerdojedz, wjechaldojedz) end
    if isEventHandlerAdded("onClientColShapeLeave", cubsi, wyszedl) then removeEventHandler ( "onClientColShapeLeave", cubsi, wyszedl) end
    exports.crime_gui:addNoti("Zakończyłeś prace kuriera.", "info")
    for i,v in pairs(getElementsByType("vehicle")) do
        if getElementData(v,"vehicle:job:owner") == localPlayer then 
            if getElementData(v,"vehicle:job") == "kurier" then 
                triggerServerEvent("kurier:removecar", localPlayer, v)
            end
        end
    end
end

function rozpocznijprace()
    triggerServerEvent("kurier:givecar", localPlayer, ul1)
end

addEvent("kurier:wieziejuz", true)
addEventHandler("kurier:wieziejuz", root, function(veh)
    exports.crime_gui:addNoti("Rozpoczynasz pracę dilera, jedź w wyznaczone miejsce.", "info")
    local x,y,z = getElementPosition(veh)
    cubsi = createColSphere (x,y,z, 150)

    attachElements(cubsi,veh)
    testveh = veh
    addEventHandler ( "onClientColShapeLeave", cubsi, wyszedl)
    rozpocznijnext()
end)

function rozpocznijnext()
    kabel1 = false 
    kabel2 = false 
    kabel3 = false 
    kabel4 = false 
    zaznaczony = 0
    punkt = math.random(1,#punktyprad)
    markerdojedz = createMarker(punktyprad[punkt][1],punktyprad[punkt][2],punktyprad[punkt][3]-0.9,"cylinder",1,242,222,121,1)
    blipdojedz = createBlip(punktyprad[punkt][1],punktyprad[punkt][2],punktyprad[punkt][3],41)
    setElementData(markerdojedz,"mpod",true)
    setElementData(markerdojedz,"mtekst","Schowaj towar")
    setElementData(markerdojedz,"mikona","")
    setElementData(markerdojedz,"mtype","praca")
    addEventHandler ("onClientMarkerHit", markerdojedz, wjechaldojedz)
end

function wjechaldojedz(element)
    if element == localPlayer then 
        local veh = getPedOccupiedVehicle(localPlayer)
        if not veh then 
            if isElement(markerdojedz) then destroyElement(markerdojedz) end
            if isElement(blipdojedz) then destroyElement(blipdojedz) end
            if isEventHandlerAdded("onClientMarkerHit", markerdojedz, wjechaldojedz) then removeEventHandler ("onClientMarkerHit", markerdojedz, wjechaldojedz) end
            exports.crime_gui:addNoti("Rozpoczynasz chowanie towaru.", "info")
            triggerServerEvent("kurier:animka", localPlayer, "wlacz")
            if ul3 == 1 then 
                czas = 11
            else
                czas = 7
            end
            kolory = math.random(1,5)
            pozycja = math.random(1,2)
            kabel1 = false 
            kabel2 = false 
            kabel3 = false 
            kabel4 = false 
            zaznaczony = 0
            if kolory == 1 then 
                r1,g1,b1 = 255,0,0
                r2,g2,b2 = 255,255,0
                r3,g3,b3 = 0,255,0
                r4,g4,b4 = 0,155,255
            elseif kolory == 2 then 
                r1,g1,b1 = 255,0,255
                r2,g2,b2 = 255,0,100
                r3,g3,b3 = 255,0,0
                r4,g4,b4 = 90, 55, 150
            elseif kolory == 3 then 
                r1,g1,b1 = 255,255,0
                r2,g2,b2 = 0,255,0
                r3,g3,b3 = 0,255,255
                r4,g4,b4 = 255,0,100
            elseif kolory == 4 then 
                r1,g1,b1 = 0,255,0
                r2,g2,b2 = 255,0,0
                r3,g3,b3 = 255,255,0
                r4,g4,b4 = 0,255,255
            elseif kolory == 5 then 
                r1,g1,b1 = 0, 255, 136
                r2,g2,b2 = 255, 0, 212
                r3,g3,b3 = 255, 208, 0
                r4,g4,b4 = 255, 0, 0
            end
            timerson = setTimer(function()
                czas = czas-0.014
                if czas <= 0 then 
                    if onoffprad == true then 
                        removeEventHandler ("onClientRender", root, panelprad)
                        onoffprad = false 
                        showCursor(false)
                        exports.crime_gui:addNoti("Za długo się ociągałeś, ktoś Cię zauważył!", "error")
                        triggerServerEvent("kurier:animka", localPlayer, "wylacz")
                        setElementFrozen(localPlayer,false)
                        rozpocznijnext()
                        if isTimer(timerson) then killTimer(timerson) end
                    end
                end
            end, 10, 1510)
            setElementFrozen(localPlayer,true)
            addEventHandler ("onClientRender", root, panelprad)
            onoffprad = true 
            showCursor(true)
        else
            exports.crime_gui:addNoti("Wyjdź z pojazdu.", "error")
        end
    end
end

function wyszedl(element)
    if element == localPlayer then
        local x,y,z = getElementPosition(testveh)
        setElementPosition(localPlayer,x,y,z)
        triggerServerEvent("kurier:warptocar", localPlayer, testveh)
        exports.crime_gui:addNoti("Nie możesz oddalić się tak daleko od pojazdu.", "error")
    end
end

addEventHandler("onClientPlayerWasted",getLocalPlayer(),function()
    local pracadorywcza = getElementData(localPlayer,"player:pracadorywczna")
    if pracadorywcza == "Kurier" then
        zakonczprace()
    end
end)

addEvent("kurier:oddajinfo", true)
addEventHandler("kurier:oddajinfo", root, function(result,resultdwa)
    topka = {}
    for i,v in pairs(result) do
		table.insert(topka, {v["login"], v["elektrykpkt"]})
    end
    for i,v in pairs(resultdwa) do
        punkty = v["elektrykpkt"]
        ul1 = v["elektrykul1"]
        ul2 = v["elektrykul2"]
        ul3 = v["elektrykul3"]
	end
end)

addEvent("kurier:endjob", true)
addEventHandler("kurier:endjob", root, function(veh)
    local pracadorywcza = getElementData(localPlayer,"player:pracadorywczna")
    if pracadorywcza == "Kurier" then
        zakonczprace()
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

function getcur()
    cxs,cys = getCursorPosition()
    cxs,cys=cxs*sx,cys*sy
    return cxs,cys
end