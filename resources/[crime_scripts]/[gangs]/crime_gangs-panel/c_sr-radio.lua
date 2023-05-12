--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
onoff = false
zakladka = 1

local test = 80

local saldo = 0
local kille = 0 
local czlonkowie = 0 
local lider = ""
local pojazdy = 0 
local zgony = 0 
local killratio = "0.0"
local naj = ""

--Nick, uid, zabojstwa, zgony, wplaty, ranga, wybrany
local lista = {}
local naekranie = 6
naekranie = naekranie-1
local obecnie = 1

--Model, id, właściciel
local listaauta = {}
local naekranieauta = 7
naekranieauta = naekranieauta-1
local obecnieauta = 1

--Kto, ile, kiedy
local listasaldo = {}
local naekraniesaldo = 6
naekraniesaldo = naekraniesaldo-1
local obecniesaldo = 1

--Kto, kille, k/d
local toporg = {}

--nazwa org, kille, k/d
local topserwer = {}

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 16/zmienna)
local dxfont1_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 22/zmienna)
local dxfont1_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 27/zmienna)
local dxfont2_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 14/zmienna)
local dxfont3_SegoeLight = dxCreateFont(":crime_files/fonts/SegoeLight.ttf", 20/zmienna)
local font = dxCreateFont(":crime_files/fonts/SegoeLight.ttf", 22/zmienna)

function gui()
    local ticki = getTickCount()
    if progressdwa == "wlacza" then
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(0,0,0,200,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 200 end 
        if alp2 then alp2test = alp2 else alp2 = 255 end
    else 
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(200,0,0,0,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 0 end 
        if alp2 then alp2test = alp2 else alp2 = 0 end
    end
    if onoff == true then
        dxDrawImage(505/zmienna, 248/zmienna, 930/zmienna, 541/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        -- dxDrawRectangle(499/zmienna, 278/zmienna, 221/zmienna, 501/zmienna, tocolor(25, 25, 25, alptest), false)
        -- exports["crime_gui"]:guitext(getElementData(localPlayer,"player:organization") or "", 499/zmienna, 278/zmienna, 720/zmienna, 348/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
        exports["crime_gui"]:guibutton("Informacje",524/zmienna, 358/zmienna, 170/zmienna, 51/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Członkowie",524/zmienna, 419/zmienna, 170/zmienna, 51/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Pojazdy",524/zmienna, 480/zmienna, 170/zmienna, 51/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Saldo",524/zmienna, 541/zmienna, 170/zmienna, 51/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Top organizacji",524/zmienna, 602/zmienna, 170/zmienna, 51/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Top serwera",524/zmienna, 663/zmienna, 170/zmienna, 51/zmienna, alp2test)
        if zakladka == 1 then 
            -- exports["crime_gui"]:guitext("Informacje", 720/zmienna, 278/zmienna, 1428/zmienna, 356/zmienna, 200, 200, 200, alp2test, dxfont1_PantonBold, "center", "center")
            dxDrawRectangle(745/zmienna, (523+test)/zmienna, 237/zmienna, 69/zmienna, tocolor(25, 25, 25, alptest), false)
            dxDrawRectangle(1162/zmienna, (525+test)/zmienna, 237/zmienna, 69/zmienna, tocolor(25, 25, 25, alptest), false)
            dxDrawRectangle(1162/zmienna, (446+test)/zmienna, 237/zmienna, 69/zmienna, tocolor(25, 25, 25, alptest), false)
            dxDrawRectangle(745/zmienna, (446+test)/zmienna, 237/zmienna, 69/zmienna, tocolor(25, 25, 25, alptest), false)
            dxDrawRectangle(1162/zmienna, (288+test)/zmienna, 237/zmienna, 69/zmienna, tocolor(25, 25, 25, alptest), false)
            dxDrawRectangle(1162/zmienna, (367+test)/zmienna, 237/zmienna, 69/zmienna, tocolor(25, 25, 25, alptest), false)
            dxDrawRectangle(745/zmienna, (367+test)/zmienna, 237/zmienna, 69/zmienna, tocolor(25, 25, 25, alptest), false)
            dxDrawRectangle(745/zmienna, (288+test)/zmienna, 237/zmienna, 69/zmienna, tocolor(25, 25, 25, alptest), false)

            if getElementData(localPlayer,"player:organization_level") < 4 then 
                exports["crime_gui"]:guibutton("Opuść organizacje",967/zmienna, 696/zmienna, 209/zmienna, 45/zmienna, alp2test)
            else
                exports["crime_gui"]:guibutton("Usuń organizacje",967/zmienna, 696/zmienna, 209/zmienna, 45/zmienna, alp2test)
            end

            exports["crime_gui"]:guitext("", 745/zmienna, (288+test)/zmienna, 822/zmienna, (357+test)/zmienna, 90, 55, 150, alp2test, dxfont1_FA5, "center", "center")
            exports["crime_gui"]:guitext("Saldo organizacji", 818/zmienna, (288+test)/zmienna, 982/zmienna, (328+test)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left", "center")
            exports["crime_gui"]:guitext(formatujnaprzecinki(saldo).." PLN", 818/zmienna, (308+test)/zmienna, 982/zmienna, (357+test)/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "center")

            exports["crime_gui"]:guitext("", 745/zmienna, (367+test)/zmienna, 822/zmienna, (436+test)/zmienna, 90, 55, 150, alp2test, dxfont1_FA5, "center", "center")
            exports["crime_gui"]:guitext("Zabójstwa", 818/zmienna, (367+test)/zmienna, 982/zmienna, (407+test)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left", "center")
            exports["crime_gui"]:guitext(kille, 818/zmienna, (387+test)/zmienna, 982/zmienna, (436+test)/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "center")

            exports["crime_gui"]:guitext("", 1162/zmienna, (367+test)/zmienna, 1239/zmienna, (436+test)/zmienna, 90, 55, 150, alp2test, dxfont1_FA5, "center", "center")
            exports["crime_gui"]:guitext("Zgony", 1235/zmienna, (367+test)/zmienna, 1399/zmienna, (407+test)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left", "center")
            exports["crime_gui"]:guitext(zgony, 1235/zmienna, (387+test)/zmienna, 1399/zmienna, (436+test)/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "center")

            exports["crime_gui"]:guitext("", 1162/zmienna, (288+test)/zmienna, 1239/zmienna, (357+test)/zmienna, 90, 55, 150, alp2test, dxfont1_FA5, "center", "center")
            exports["crime_gui"]:guitext("Pojazdy", 1235/zmienna, (288+test)/zmienna, 1399/zmienna, (328+test)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left", "center")
            exports["crime_gui"]:guitext(pojazdy, 1235/zmienna, (308+test)/zmienna, 1399/zmienna, (357+test)/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "center")

            exports["crime_gui"]:guitext("", 745/zmienna, (446+test)/zmienna, 822/zmienna, (515+test)/zmienna, 90, 55, 150, alp2test, dxfont1_FA5, "center", "center")
            exports["crime_gui"]:guitext("Członkowie", 818/zmienna, (446+test)/zmienna, 982/zmienna, (486+test)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left", "center")
            exports["crime_gui"]:guitext(czlonkowie, 818/zmienna, (466+test)/zmienna, 982/zmienna, (515+test)/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "center")

            exports["crime_gui"]:guitext("", 1162/zmienna, (446+test)/zmienna, 1239/zmienna, (515+test)/zmienna, 90, 55, 150, alp2test, dxfont1_FA5, "center", "center")
            exports["crime_gui"]:guitext("Kill ratio", 1235/zmienna, (446+test)/zmienna, 1399/zmienna, (486+test)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left", "center")
            exports["crime_gui"]:guitext(string.format("%.02f",killratio), 1235/zmienna, (466+test)/zmienna, 1399/zmienna, (515+test)/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "center")

            exports["crime_gui"]:guitext("", 745/zmienna, (523+test)/zmienna, 822/zmienna, (592+test)/zmienna, 90, 55, 150, alp2test, dxfont1_FA5, "center", "center")
            exports["crime_gui"]:guitext("Lider", 818/zmienna, (523+test)/zmienna, 982/zmienna, (563+test)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left", "center")
            exports["crime_gui"]:guitext(lider, 818/zmienna, (543+test)/zmienna, 982/zmienna, (592+test)/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "center")
            
            exports["crime_gui"]:guitext("", 1162/zmienna, (525+test)/zmienna, 1239/zmienna, (594+test)/zmienna, 90, 55, 150, alp2test, dxfont1_FA5, "center", "center") 
            exports["crime_gui"]:guitext("Najwięcej zabójstw", 1235/zmienna, (525+test)/zmienna, 1399/zmienna, (565+test)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left", "center")
            exports["crime_gui"]:guitext(naj, 1235/zmienna, (545+test)/zmienna, 1399/zmienna, (594+test)/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "center")
        elseif zakladka == 2 then 
            -- exports["crime_gui"]:guitext("Członkowie", 720/zmienna, 278/zmienna, 1428/zmienna, 356/zmienna, 200, 200, 200, alp2test, dxfont1_PantonBold, "center", "center")
            -- dxDrawRectangle(720/zmienna, 724/zmienna, 707/zmienna, 55/zmienna, tocolor(25, 25, 25, alptest), false)
            pasekpoprawej(naekranie,lista,55,obecnie,1415,346+27)
            local liczmnie = 0
            for ID2=obecnie,naekranie+obecnie do
                liczmnie = liczmnie+1
                local space = 55*(liczmnie-1)
                if lista[ID2] then
                    if lista[ID2][7] == true then 
                        dxDrawRectangle(745/zmienna, (391+space)/zmienna, 664/zmienna, 4/zmienna, tocolor(90, 55, 150, alp2test), false)
                        dxDrawRectangle(745/zmienna, (346+space)/zmienna, 664/zmienna, 45/zmienna, tocolor(60, 60, 80, alptest), false)
                    else
                        dxDrawRectangle(745/zmienna, (391+space)/zmienna, 664/zmienna, 4/zmienna, tocolor(90, 55, 150, alp2test), false)
                        dxDrawRectangle(745/zmienna, (346+space)/zmienna, 664/zmienna, 45/zmienna, tocolor(25, 25, 25, alptest), false)
                    end
                    exports["crime_gui"]:guitext(lista[ID2][1].." [#5a3795"..lista[ID2][2].."#cccccc]      Zabójstwa: #5a3795"..lista[ID2][3].."#cccccc      Zgony: #5a3795"..lista[ID2][4].."#cccccc      Wpłaty: #5a3795"..formatujnaprzecinki(lista[ID2][5]).." PLN#cccccc      Ranga: #5a3795"..lista[ID2][6].."", 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                end
            end
            exports["crime_gui"]:guibutton("Zaproś",1140/zmienna, 729/zmienna, 149/zmienna, 45/zmienna, alp2test)
            exports["crime_gui"]:guibutton("Wyrzuć",981/zmienna, 729/zmienna, 149/zmienna, 45/zmienna, alp2test)
            exports["crime_gui"]:guibutton("Awansuj",822/zmienna, 729/zmienna, 149/zmienna, 45/zmienna, alp2test)
            exports["crime_gui"]:guibutton("Degraduj",663/zmienna, 729/zmienna, 149/zmienna, 45/zmienna, alp2test)

            exports["crime_gui"]:createEditbox("orguid", 1301/zmienna, 729/zmienna, 102/zmienna, 45/zmienna, true, "", false, 16, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "UID", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
        elseif zakladka == 3 then 
            -- exports["crime_gui"]:guitext("Pojazdy", 720/zmienna, 278/zmienna, 1428/zmienna, 356/zmienna, 200, 200, 200, alp2test, dxfont1_PantonBold, "center", "center")
            pasekpoprawej(naekranieauta,listaauta,55,obecnieauta,1415,346+27)
            local liczmnieauta = 0
            for ID2=obecnieauta,naekranieauta+obecnieauta do
                liczmnieauta = liczmnieauta+1
                local space = 55*(liczmnieauta-1)
                if listaauta[ID2] then
                    dxDrawRectangle(745/zmienna, (391+space)/zmienna, 664/zmienna, 4/zmienna, tocolor(90, 55, 150, alp2test), false)
                    dxDrawRectangle(745/zmienna, (346+space)/zmienna, 664/zmienna, 45/zmienna, tocolor(25, 25, 25, alptest), false)
                    exports["crime_gui"]:guitext(""..listaauta[ID2][1].." [#5a3795"..listaauta[ID2][2].."#cccccc]", 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left", "center")
                    exports["crime_gui"]:guitext("UID Właściciela: #5a3795"..listaauta[ID2][3].."", 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "right", "center")
                end
            end
        elseif zakladka == 4 then 
            -- exports["crime_gui"]:guitext("Saldo", 720/zmienna, 278/zmienna, 1428/zmienna, 356/zmienna, 200, 200, 200, alp2test, dxfont1_PantonBold, "center", "center")
            pasekpoprawej(naekraniesaldo,listasaldo,55,obecniesaldo,1415,346+27)
            -- dxDrawRectangle(720/zmienna, 724/zmienna, 707/zmienna, 55/zmienna, tocolor(25, 25, 25, alptest), false)
            local liczmniesaldo= 0
            for ID2=obecniesaldo,naekraniesaldo+obecniesaldo do
                liczmniesaldo = liczmniesaldo+1
                local space = 55*(liczmniesaldo-1)
                if listasaldo[ID2] then
                    dxDrawRectangle(745/zmienna, (391+space)/zmienna, 664/zmienna, 4/zmienna, tocolor(90, 55, 150, alp2test), false)
                    dxDrawRectangle(745/zmienna, (346+space)/zmienna, 664/zmienna, 45/zmienna, tocolor(25, 25, 25, alptest), false)
                    if listasaldo[ID2][2] < 0 then 
                        exports["crime_gui"]:guitext(listasaldo[ID2][1].."      #FF0000"..listasaldo[ID2][2].."      #cccccc"..listasaldo[ID2][3], 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    elseif listasaldo[ID2][2] > 0 then 
                        exports["crime_gui"]:guitext(listasaldo[ID2][1].."      #00FF00+"..listasaldo[ID2][2].."      #cccccc"..listasaldo[ID2][3], 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    end
                end
            end
            exports["crime_gui"]:guibutton("Wypłać",981/zmienna, 729/zmienna, 149/zmienna, 45/zmienna, alp2test)
            exports["crime_gui"]:guibutton("Wpłać",822/zmienna, 729/zmienna, 149/zmienna, 45/zmienna, alp2test)

            exports["crime_gui"]:createEditbox("orgsaldoile", 1170/zmienna, 729/zmienna, 215/zmienna, 45/zmienna, true, "", false, 8, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Kwota", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
        elseif zakladka == 5 then 
            -- exports["crime_gui"]:guitext("Top organizacji", 720/zmienna, 278/zmienna, 1428/zmienna, 356/zmienna, 200, 200, 200, alp2test, dxfont1_PantonBold, "center", "center")
            local liczmnietoporg= 0
            for ID2=1,7 do
                liczmnietoporg = liczmnietoporg+1
                local space = 55*(liczmnietoporg-1)
                if toporg[ID2] then
                    dxDrawRectangle(745/zmienna, (391+space)/zmienna, 664/zmienna, 4/zmienna, tocolor(90, 55, 150, alp2test), false)
                    dxDrawRectangle(745/zmienna, (346+space)/zmienna, 664/zmienna, 45/zmienna, tocolor(25, 25, 25, alptest), false)
                    if liczmnietoporg == 1 then 
                        exports["crime_gui"]:guitext("#ffe100"..liczmnietoporg..". Nick: "..toporg[ID2][1].."      Zabójstwa: "..toporg[ID2][2].."      K/D: "..string.format("%.02f",toporg[ID2][3]), 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    elseif liczmnietoporg == 2 then 
                        exports["crime_gui"]:guitext("#b5b5b5"..liczmnietoporg..". Nick: "..toporg[ID2][1].."      Zabójstwa: "..toporg[ID2][2].."      K/D: "..string.format("%.02f",toporg[ID2][3]), 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    elseif liczmnietoporg == 3 then 
                        exports["crime_gui"]:guitext("#a80000"..liczmnietoporg..". Nick: "..toporg[ID2][1].."      Zabójstwa: "..toporg[ID2][2].."      K/D: "..string.format("%.02f",toporg[ID2][3]), 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    else
                        exports["crime_gui"]:guitext(""..liczmnietoporg..". Nick: #5a3795"..toporg[ID2][1].."      #ccccccZabójstwa: #5a3795"..toporg[ID2][2].."      #ccccccK/D: #5a3795"..string.format("%.02f",toporg[ID2][3]), 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    end 
                end
            end
        elseif zakladka == 6 then 
            -- exports["crime_gui"]:guitext("Top serwera", 720/zmienna, 278/zmienna, 1428/zmienna, 356/zmienna, 200, 200, 200, alp2test, dxfont1_PantonBold, "center", "center")
            local liczmnietopserwer= 0
            for ID2=1,7 do
                liczmnietopserwer = liczmnietopserwer+1
                local space = 55*(liczmnietopserwer-1)
                if topserwer[ID2] then
                    dxDrawRectangle(745/zmienna, (391+space)/zmienna, 664/zmienna, 4/zmienna, tocolor(90, 55, 150, alp2test), false)
                    dxDrawRectangle(745/zmienna, (346+space)/zmienna, 664/zmienna, 45/zmienna, tocolor(25, 25, 25, alptest), false)
                    if liczmnietopserwer == 1 then 
                        exports["crime_gui"]:guitext("#ffe100"..liczmnietopserwer..". Nick: "..topserwer[ID2][1].."      Zabójstwa: "..topserwer[ID2][2].."      K/D: "..string.format("%.02f",topserwer[ID2][3]), 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    elseif liczmnietopserwer == 2 then 
                        exports["crime_gui"]:guitext("#b5b5b5"..liczmnietopserwer..". Nick: "..topserwer[ID2][1].."      Zabójstwa: "..topserwer[ID2][2].."      K/D: "..string.format("%.02f",topserwer[ID2][3]), 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    elseif liczmnietopserwer == 3 then 
                        exports["crime_gui"]:guitext("#a80000"..liczmnietopserwer..". Nick: "..topserwer[ID2][1].."      Zabójstwa: "..topserwer[ID2][2].."      K/D: "..string.format("%.02f",topserwer[ID2][3]), 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    else
                        exports["crime_gui"]:guitext(""..liczmnietopserwer..". Nick: #5a3795"..topserwer[ID2][1].."      #ccccccZabójstwa: #5a3795"..topserwer[ID2][2].."      #ccccccK/D: #5a3795"..string.format("%.02f",topserwer[ID2][3]), 755/zmienna, (346+space)/zmienna, 1399/zmienna, (391+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
                    end 
                end
            end
        end
    end
end


function onofftest()
    if onoff == true then 
        tickistart = getTickCount()
		czas = 500
        progressdwa = "wylacza"
        showCursor(false) 
		setTimer(function()
            if isEventHandlerAdded("onClientRender", root, gui) then
				removeEventHandler ("onClientRender", root, gui)
                onoff = false
                if zakladka == 2 then 
                    exports["crime_gui"]:destroyEditbox("orguid")
                end
                if zakladka == 4 then 
                    exports["crime_gui"]:destroyEditbox("orgsaldoile")
                end
                zakladka = 1
			end
		end, 500, 1)
    else
        if not getElementData(localPlayer,"player:organization") or getElementData(localPlayer,"player:organization") == "" then exports.crime_gui:addNoti("Nie należysz do żadnej organizacji.", "error") return end
        triggerServerEvent("org:dajinfo", localPlayer)
        onoff = true
        tickistart = getTickCount()
        czas = 500
        progressdwa = "wlacza"
        showCursor(true) 
        addEventHandler("onClientRender",root,gui)
    end
end

bindKey("F5","down",onofftest)

--PRZELACZANIE ZAKLADKI
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(524/zmienna, 358/zmienna, 170/zmienna, 51/zmienna) and onoff == true then
            if zakladka == 2 then 
                exports["crime_gui"]:destroyEditbox("orguid")
            end
            if zakladka == 4 then 
                exports["crime_gui"]:destroyEditbox("orgsaldoile")
            end
			zakladka = 1
        end
        if isMouseIn(524/zmienna, 419/zmienna, 170/zmienna, 51/zmienna) and onoff == true then
            if zakladka == 4 then 
                exports["crime_gui"]:destroyEditbox("orgsaldoile")
            end
			zakladka = 2 
        end
        if isMouseIn(524/zmienna, 480/zmienna, 170/zmienna, 51/zmienna) and onoff == true then
            if zakladka == 2 then 
                exports["crime_gui"]:destroyEditbox("orguid")
            end
            if zakladka == 4 then 
                exports["crime_gui"]:destroyEditbox("orgsaldoile")
            end
			zakladka = 3
        end
        if isMouseIn(524/zmienna, 541/zmienna, 170/zmienna, 51/zmienna) and onoff == true then
            if zakladka == 2 then 
                exports["crime_gui"]:destroyEditbox("orguid")
            end
			zakladka = 4
        end
        if isMouseIn(524/zmienna, 602/zmienna, 170/zmienna, 51/zmienna) and onoff == true then
            if zakladka == 2 then 
                exports["crime_gui"]:destroyEditbox("orguid")
            end
            if zakladka == 4 then 
                exports["crime_gui"]:destroyEditbox("orgsaldoile")
            end
			zakladka = 5
        end
        if isMouseIn(524/zmienna, 663/zmienna, 170/zmienna, 51/zmienna) and onoff == true then
            if zakladka == 2 then 
                exports["crime_gui"]:destroyEditbox("orguid")
            end
            if zakladka == 4 then 
                exports["crime_gui"]:destroyEditbox("orgsaldoile")
            end
			zakladka = 6
        end
    end
end)

--Opuść/usuń
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(967/zmienna, 696/zmienna, 209/zmienna, 45/zmienna) and onoff == true and zakladka == 1 then
            if getElementData(localPlayer,"player:organization_level") < 4 then 
                triggerServerEvent("org:opusc", localPlayer)
                onofftest()
            else
                triggerServerEvent("org:usun", localPlayer)
                onofftest()
            end
        end
    end
end)

--Wpłać
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(822/zmienna, 729/zmienna, 149/zmienna, 45/zmienna) and onoff == true and zakladka == 4 then
            local kwotasalda=exports["crime_gui"]:getEditboxText("orgsaldoile")
            if not kwotasalda or kwotasalda == "" then exports.crime_gui:addNoti("Wpisz kwotę.", "error") return end 
            kwotasalda = math.floor(tonumber(kwotasalda))
            if kwotasalda <= 0 then exports.crime_gui:addNoti("Kwota musi być większa od 0", "error") return end
            triggerServerEvent("org:wplac", localPlayer, kwotasalda)
        end
    end
end)

--Wypłać
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(981/zmienna, 729/zmienna, 149/zmienna, 45/zmienna) and onoff == true and zakladka == 4 then
            if getElementData(localPlayer,"player:organization_level") < 4 then exports.crime_gui:addNoti("Aby to zrobić musisz być liderem.", "error") return end 
            local kwotasalda=exports["crime_gui"]:getEditboxText("orgsaldoile")
            if not kwotasalda or kwotasalda == "" then exports.crime_gui:addNoti("Wpisz kwotę.", "error") return end 
            kwotasalda = math.floor(tonumber(kwotasalda))
            if kwotasalda <= 0 then exports.crime_gui:addNoti("Kwota musi być większa od 0.", "error") return end
            if kwotasalda > saldo then exports.crime_gui:addNoti("Organizacja nie posiada takiej sumy pieniędzy.", "error") return end
            if getPlayerMoney(localPlayer)+kwotasalda > 99999999 then exports.crime_gui:addNoti("Błąd #2_02.", "error") return end
            triggerServerEvent("org:wyplac", localPlayer, kwotasalda)
        end
    end
end)

--Awansuj
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(822/zmienna, 729/zmienna, 149/zmienna, 45/zmienna) and onoff == true and zakladka == 2 then
            if getElementData(localPlayer,"player:organization_level") < 3 then exports.crime_gui:addNoti("Aby to zrobić musisz byc lidrem lub v-liderem.", "error") return end 
            for i,v in pairs(lista) do 
                if lista[i][7] == true then
                    triggerServerEvent("org:awans", localPlayer, lista[i][2], lista[i][6])
                end
            end
        end
    end
end)

--Degraduj
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(663/zmienna, 729/zmienna, 149/zmienna, 45/zmienna) and onoff == true and zakladka == 2 then
            if getElementData(localPlayer,"player:organization_level") < 3 then exports.crime_gui:addNoti("Aby to zrobić musisz byc lidrem lub v-liderem.", "error") return end 
            for i,v in pairs(lista) do 
                if lista[i][7] == true then
                    triggerServerEvent("org:degrad", localPlayer, lista[i][2], lista[i][6])
                end
            end
        end
    end
end)

--Wyrzuc
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(981/zmienna, 729/zmienna, 149/zmienna, 45/zmienna) and onoff == true and zakladka == 2 then
            if getElementData(localPlayer,"player:organization_level") < 3 then exports.crime_gui:addNoti("Aby to zrobić musisz byc lidrem lub v-liderem.", "error") return end 
            for i,v in pairs(lista) do 
                if lista[i][7] == true then
                    triggerServerEvent("org:wyrzuc", localPlayer, lista[i][2], lista[i][6])
                end
            end
        end
    end
end)

--Zaproś
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(1140/zmienna, 729/zmienna, 149/zmienna, 45/zmienna) and onoff == true and zakladka == 2 then
            if getElementData(localPlayer,"player:organization_level") < 3 then exports.crime_gui:addNoti("Aby to zrobić musisz byc lidrem lub v-liderem.", "error") return end 
            local uidzapros=exports["crime_gui"]:getEditboxText("orguid")
            if not uidzapros or uidzapros == "" then exports.crime_gui:addNoti("Wpisz UID.", "error") return end 
            triggerServerEvent("org:zapros", localPlayer, uidzapros)
        end
    end
end)

--Zaznaczenie osoby
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(743/zmienna, 345/zmienna, 666/zmienna, 327/zmienna) and onoff == true then
            for i,v in pairs(lista) do 
                lista[i][7] = false
            end
            liczmnie = 0
            for ID2=obecnie,naekranie+obecnie do
                liczmnie = liczmnie+1
                local space = 55*(liczmnie-1)
                if lista[ID2] then
                    if isMouseIn(745/zmienna, (346+space)/zmienna, 664/zmienna, 49/zmienna) and onoff == true then
                        lista[ID2][7] = true
                    end
                end
            end
        end
    end
end)

addEvent("org:oddajinfo", true)
addEventHandler("org:oddajinfo", root, function(zgonys,saldos,killes,czlonkowies,liders,pojazdys,najs, resultludzie, resultauta, resultsaldo, resulttoporg, resulttopserwer)
    zgony = zgonys 
    saldo = saldos 
    kille = killes 
    czlonkowie = czlonkowies 
    lider = liders 
    pojazdy = pojazdys 
    naj = najs
    if zgony == 0 then 
        killratio = kille..".0"
    else 
        killratio = kille/zgony
    end

    lista = {}
    for i,v in pairs(resultludzie) do
        --Nick, uid, zabojstwa, zgony, wplaty, ranga, wybrany
        if v["orgrank"] == 4 then v["orgrank"] = "#AA0000Lider" end 
        if v["orgrank"] == 3 then v["orgrank"] = "#FF0000VLider" end 
        if v["orgrank"] == 2 then v["orgrank"] = "#AAAAAACzłonek" end 
        if v["orgrank"] == 1 then v["orgrank"] = "#DDDDDDNowy" end 
        if v["orgrank"] == 0 then v["orgrank"] = "#DDDDDDNowy" end 
		table.insert(lista, {v["login"], v["id"], v["kille"], v["zgony"], v["orgwplaty"], v["orgrank"], false})
    end
    
    listaauta = {}
    for i,v in pairs(resultauta) do
        local model = getVehicleNameFromModel(v["model"])

        modelname = exports["crime_modelnames"]
	    model = modelname:getText(model)
		table.insert(listaauta, {model, v["id"], v["ownedPlayer"]})
    end

    listasaldo = {}
    for i,v in pairs(resultsaldo) do
		table.insert(listasaldo, {v["kto"], v["ile"], v["kiedy"]})
    end
    
    toporg = {}
    for i,v in pairs(resulttoporg) do
        if v["zgony"] == 0 then 
            killratiods = v["kille"]..".0"
        else 
            killratiods = v["kille"]/v["zgony"]
        end
		table.insert(toporg, {v["login"], v["kille"], killratiods})
    end
    topserwer = {}
    for i,v in pairs(resulttopserwer) do
        if v["zgony"] == 0 then 
            killratiods = v["kille"]..".0"
        else 
            killratiods = v["kille"]/v["zgony"]
        end
		table.insert(topserwer, {v["login"], v["kille"], killratiods})
	end
end)

function dogory() 
    if isMouseIn(743/zmienna, 345/zmienna, 666/zmienna, 327/zmienna) and onoff == true then
        if zakladka == 3 then 
            if obecnieauta == 1 then 

            else
                obecnieauta = obecnieauta-1
            end
        end
        if zakladka == 2 then 
            if obecnie == 1 then

            else 
                obecnie = obecnie-1
            end
        end
        if zakladka == 4 then 
            if obecniesaldo == 1 then

            else 
                obecniesaldo = obecniesaldo-1
            end
        end
	end
end

function dodolu()
    if isMouseIn(743/zmienna, 345/zmienna, 666/zmienna, 327/zmienna) and onoff == true then
        if zakladka == 3 then 
            if obecnieauta+naekranieauta+1 > table.maxn(listaauta) then

            else
                obecnieauta = obecnieauta+1
            end
        end
        if zakladka == 2 then 
            if obecnie+naekranie+1 > table.maxn(lista) then

            else
                obecnie = obecnie+1
            end
        end
        if zakladka == 4 then 
            if obecniesaldo+naekraniesaldo+1 > table.maxn(listasaldo) then

            else
                obecniesaldo = obecniesaldo+1
            end
        end
	end
end

bindKey ("mouse_wheel_up", "down", dogory )
bindKey ("mouse_wheel_down", "down", dodolu )

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

  function pasekpoprawej(naekranie,tabela,spacing,obecnie,w1,w2)
    if naekranie > #tabela then 
        pasekwystrzy = #tabela*spacing 
    end
    if naekranie < #tabela then 
        pasekwystrzy = naekranie*spacing
    end
    dxDrawRectangle(w1/zmienna, w2/zmienna, 7/zmienna, pasekwystrzy/zmienna, tocolor(200, 200, 200, alptest), false) --bialy pasek
    local costamxdtrzysad = #tabela-naekranie
    local segmenttrzy = pasekwystrzy/costamxdtrzysad
    if obecnie == 1 then 
        sadtrzy = w2
    elseif obecnie > 1 then 
        sadtrzy = ((obecnie-1)*segmenttrzy)+w2
    end
    if #tabela <= naekranie then 
        segmenttrzy = pasekwystrzy
    end
    dxDrawRectangle(w1/zmienna, sadtrzy/zmienna, 7/zmienna, segmenttrzy/zmienna, tocolor(90, 55, 150, alp2test), false) --pasek pozycja
end