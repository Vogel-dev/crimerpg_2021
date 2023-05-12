--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx,sy=guiGetScreenSize()
zmienna = 1920/sx


local dxfont0_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 12/zmienna)
local font_waga = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 17/zmienna)
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 21/zmienna)
local dxfont0_SegoeLight = dxCreateFont(":crime_files/fonts/SegoeLight.ttf", 12/zmienna)

local wagagracz = 15000
local wagaauto = 30000
local aktualnagracz = 0
local aktualnaauto = 0
eq = false
eqauto = false
eqprzeszukaj = false 
eqautoprzeszukaj = false
wybor = false
wrzuca = false
drapie = false
cokolwiek = false

--nazwa, ilosc, wagajednego, zaznaczone, idprzedmiotu
itemygracza = {}
itemyauto = {}

local nazwyitemow = {
    {"paralizator", "Paralizator"},
    {"ziolo", "Top"},
    {"kokaina", "Kokaina"},
    {"amunicja", "Amunicja"},
    {"rakietnica", "Rakietnica"},
    {"ak47", "AK-47"},
    {"m4", "M4A1-S"},
    {"tec", "TEC-9"},
    {"pila", "Piła motorowa"},
    {"deagle", "Deagle"},
    {"uzi", "Uzi"},
    {"mp5", "MP5"},
    {"noz", "Nóż bojowy"},
    {"kastet", "Kastet"},
    {"kij_golf", "Kij golfowy"},
    {"kij_baseball", "Kij baseballowy"},
    {"palka", "Pałka"},
    {"snajperka", "Snajperka"},
    {"gasnica", "Gaśnica"},
    {"spadochron", "Spadochron"},
    {"cola", "Coca-Cola"},
    {"woda", "Woda"},
    {"kajdanki", "Kajdanki"},
    {"kebab", "Kebab"},
    {"hamburger", "Hamburger"},
    {"kanister", "Kanister z benzyną"},
    {"zestaw", "Zestaw naprawczy"},
    {"zestawdwa", "Zestaw naprawczy+"},
    {"plecak", "Plecak"},
    {"zdrapka1", "Zdrapka"},
    {"zdrapka2", "Zdrapka"},
    {"zdrapka3", "Zdrapka"},
    {"ziolo_plant", "Nasiono marihuany"},
    {"ziolo_donica", "Donica"},
    {"ziolo_nawoz1", "Fox Farm"},
    {"ziolo_nawoz2", "Technaflora Recipe"},
    {"ziolo_nawoz3", "Biobizz"},
    {"rekawiczki", "Rękawiczki lateksowe"},
    {"worek_strunowy", "Worek strunowy"},
}

function wyborcyce()
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
    if not getElementData(localPlayer,"player:logged") then return end
    if wybor == true then 
        if getElementData(localPlayer,"player:duty") == "SAPD" or getElementData(localPlayer,"player:admin") then 
            dxDrawImage(799/zmienna, 271/zmienna, 323/zmienna, 395/zmienna, "/grafiki/gui/window2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
            exports["crime_gui"]:guibutton( "Gracz", 859/zmienna, 374/zmienna, 203/zmienna, 61/zmienna, alp2test)
            exports["crime_gui"]:guibutton( "Pojazd", 859/zmienna, 445/zmienna, 203/zmienna, 61/zmienna, alp2test)
            exports["crime_gui"]:guibutton( "Przeszukaj gracza", 859/zmienna, 516/zmienna, 203/zmienna, 61/zmienna, alp2test)
            exports["crime_gui"]:guibutton( "Przeszukaj pojazd", 859/zmienna, 587/zmienna, 203/zmienna, 61/zmienna, alp2test)
        else 
            dxDrawImage(799/zmienna, 273/zmienna, 323/zmienna, 247/zmienna, "/grafiki/gui/window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
            exports["crime_gui"]:guibutton( "Gracz", 859/zmienna, 374/zmienna, 203/zmienna, 61/zmienna, alp2test)
            exports["crime_gui"]:guibutton( "Pojazd", 859/zmienna, 445/zmienna, 203/zmienna, 61/zmienna, alp2test)
        end
    end
end

function guiautoprzeszukaj()
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
    if not getElementData(localPlayer,"player:logged") then return end
    if eqautoprzeszukaj == true then 
        local waga1 = aktualnaauto/1000
        local waga2 = wagaauto/1000
        dxDrawImage(674/zmienna, 175/zmienna, 572/zmienna, 458/zmienna, ":crime_equipment/grafiki/gui/ekwipunek2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guitext( ""..waga1.."/"..waga2.."kg", 673/zmienna, 154/zmienna, 1235/zmienna, 251/zmienna, 200, 200, 200, alp2test, font_waga, "right", "center")
        local liczenie = 1
        local liczeniedwa = 0
        for i,v in ipairs(itemyauto) do 
            liczeniedwa = liczeniedwa+1
            if liczeniedwa > 6 then 
                liczeniedwa = 1
                liczenie = liczenie+1
            end
            local space = 96*(liczenie-1) 
            local spacedwa = 96*(liczeniedwa-1)
            dxDrawImage((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna,"grafiki/itemy/"..itemyauto[i][1]..".png",0,0,0,tocolor(255,255,255,alp2test))
            exports["crime_gui"]:guitext("x"..itemyauto[i][2],(683+spacedwa)/zmienna,261+space/zmienna,(683+spacedwa+73)/zmienna,(261+space+73)/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "right", "bottom")
        end
        local liczeniecyce = 1
        local liczeniecycedwa = 0
        for i,v in ipairs(itemyauto) do 
            liczeniecycedwa = liczeniecycedwa+1
            if liczeniecycedwa > 6 then 
                liczeniecycedwa = 1
                liczeniecyce = liczeniecyce+1
            end
            local space = 96*(liczeniecyce-1) 
            local spacedwa = 96*(liczeniecycedwa-1)

            if isMouseIn((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna) and eqautoprzeszukaj == true then 
                for idd,vdd in pairs(nazwyitemow) do 
                    if nazwyitemow[idd][1] == itemyauto[i][1] then 
                        if isCursorShowing() then 
                            cxs,cys=getCursorPosition()
                            cxs,cys=cxs*sx,cys*sy
                            exports["crime_gui"]:guitext(nazwyitemow[idd][2], cxs+(10/zmienna), cys, cxs+(159/zmienna), cys+(31/zmienna), 200, 200, 200, alp2test, dxfont0_FiraEC, "left", "top")
                        end
                    end
                end
            end

            --[[if itemyauto[i][4] == true then 
                dxDrawImage(683+spacedwa,261+space,73,73,"grafiki/itemy/"..itemyauto[i][1]..".png",0,0,0,tocolor(255,255,255,alp2test))
                dxDrawImage(683+spacedwa,261+space,73,73,"grafiki/itemy/"..itemyauto[i][1]..".png",0,0,0,tocolor(150, 150, 150,alptest))

                exports["crime_gui"]:guibutton( "Skonfiskuj",683+spacedwa+85,261+space, 150, 45, alp2test)
            end]]--
        end
    end
end

function guiauto()
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
    if not getElementData(localPlayer,"player:logged") then return end
    if eqauto == true then 
        local waga1 = aktualnaauto/1000
        local waga2 = wagaauto/1000
        dxDrawImage(674/zmienna, 175/zmienna, 572/zmienna, 458/zmienna, ":crime_equipment/grafiki/gui/ekwipunek2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guitext( ""..waga1.."/"..waga2.."kg", 673/zmienna, 154/zmienna, 1235/zmienna, 251/zmienna, 200, 200, 200, alp2test, font_waga, "right", "center")
        local liczenie = 1
        local liczeniedwa = 0
        for i,v in ipairs(itemyauto) do 
            liczeniedwa = liczeniedwa+1
            if liczeniedwa > 6 then 
                liczeniedwa = 1
                liczenie = liczenie+1
            end
            local space = 96*(liczenie-1) 
            local spacedwa = 96*(liczeniedwa-1)
            dxDrawImage((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna,"grafiki/itemy/"..itemyauto[i][1]..".png",0,0,0,tocolor(255,255,255,alp2test))
            exports["crime_gui"]:guitext("x"..itemyauto[i][2],(683+spacedwa)/zmienna,(261+space)/zmienna,(683+spacedwa+73)/zmienna,(261+space+73)/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "right", "bottom")
        end
        local liczeniecyce = 1
        local liczeniecycedwa = 0
        for i,v in ipairs(itemyauto) do 
            liczeniecycedwa = liczeniecycedwa+1
            if liczeniecycedwa > 6 then 
                liczeniecycedwa = 1
                liczeniecyce = liczeniecyce+1
            end
            local space = 96*(liczeniecyce-1) 
            local spacedwa = 96*(liczeniecycedwa-1)

            if isMouseIn((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna) and eqauto == true then 
                for idd,vdd in pairs(nazwyitemow) do 
                    if nazwyitemow[idd][1] == itemyauto[i][1] then 
                        if isCursorShowing() then 
                            cxs,cys=getCursorPosition()
                            cxs,cys=cxs*sx,cys*sy
                            exports["crime_gui"]:guitext(nazwyitemow[idd][2], cxs+(10/zmienna), cys, cxs+(159/zmienna), cys+(31/zmienna), 200, 200, 200, alp2test, dxfont0_FiraEC, "left", "top")
                        end
                    end
                end
            end

            if itemyauto[i][4] == true then 
                dxDrawImage((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna,"grafiki/itemy/"..itemyauto[i][1]..".png",0,0,0,tocolor(255,255,255,alp2test))
                dxDrawImage((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna,"grafiki/itemy/"..itemyauto[i][1]..".png",0,0,0,tocolor(150, 150, 150,alptest))

                exports["crime_gui"]:guibutton( "Wyciągnij",(683+spacedwa+85)/zmienna,(261+space)/zmienna, 150/zmienna, 45/zmienna, alp2test)
            end
        end
    end
end

function guiprzeszukaj()
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
    if not getElementData(localPlayer,"player:logged") then return end
    if eqprzeszukaj == true then 
        local waga1 = aktualnagracz/1000
        if chceckitemplr("plecak",1) == true then 
            wagagracz = 27000
        else
            wagagracz = 15000
        end 
        
        local waga2 = wagagracz/1000
        dxDrawImage(674/zmienna, 175/zmienna, 572/zmienna, 458/zmienna, ":crime_equipment/grafiki/gui/ekwipunek2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guitext( ""..waga1.."/"..waga2.."kg", 673/zmienna, 154/zmienna, 1235/zmienna, 251/zmienna, 200, 200, 200, alp2test, font_waga, "right", "center")
        local liczenie = 1
        local liczeniedwa = 0
        for i,v in ipairs(itemygracza) do 
            liczeniedwa = liczeniedwa+1
            if liczeniedwa > 6 then 
                liczeniedwa = 1
                liczenie = liczenie+1
            end
            local space = 96*(liczenie-1) 
            local spacedwa = 96*(liczeniedwa-1)
            dxDrawImage((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna,"grafiki/itemy/"..itemygracza[i][1]..".png",0,0,0,tocolor(255,255,255,alp2test))
            exports["crime_gui"]:guitext("x"..tonumber(itemygracza[i][2]),(683+spacedwa)/zmienna,(261+space)/zmienna,(683+spacedwa+73)/zmienna,(261+space+73)/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "right", "bottom")
        end
        local liczeniecyce = 1
        local liczeniecycedwa = 0
        for i,v in ipairs(itemygracza) do 
            liczeniecycedwa = liczeniecycedwa+1
            if liczeniecycedwa > 6 then 
                liczeniecycedwa = 1
                liczeniecyce = liczeniecyce+1
            end
            local space = 96*(liczeniecyce-1) 
            local spacedwa = 96*(liczeniecycedwa-1)

            if isMouseIn((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna) and eqprzeszukaj == true then 
                for idd,vdd in pairs(nazwyitemow) do 
                    if nazwyitemow[idd][1] == itemygracza[i][1] then 
                        if isCursorShowing() then 
                            cxs,cys=getCursorPosition()
                            cxs,cys=cxs*sx,cys*sy
                            exports["crime_gui"]:guitext(nazwyitemow[idd][2], cxs+(10/zmienna), cys, cxs+(159/zmienna), cys+(31/zmienna), 200, 200, 200, alp2test, dxfont0_FiraEC, "left", "top")
                        end
                    end
                end
            end

           --[[ if itemygracza[i][4] == true then 
                dxDrawImage(683+spacedwa,261+space,73,73,"grafiki/itemy/"..itemygracza[i][1]..".png",0,0,0,tocolor(255,255,255,alp2test))
                dxDrawImage(683+spacedwa,261+space,73,73,"grafiki/itemy/"..itemygracza[i][1]..".png",0,0,0,tocolor(150, 150, 150,alptest))

                exports["crime_gui"]:guibutton( "Skonfiskuj",683+spacedwa+85,261+space, 150, 45, alp2test)
            end]]--
        end
    end
end


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
    if not getElementData(localPlayer,"player:logged") then return end
    if eq == true then 
        local waga1 = aktualnagracz/1000
        if chceckitemplr("plecak",1) == true then 
            wagagracz = 27000
        else
            wagagracz = 15000
        end 
        local waga2 = wagagracz/1000
        dxDrawImage(674/zmienna, 175/zmienna, 572/zmienna, 458/zmienna, ":crime_equipment/grafiki/gui/ekwipunek2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guitext( ""..waga1.."/"..waga2.."kg", 673/zmienna, 154/zmienna, 1235/zmienna, 251/zmienna, 200, 200, 200, alp2test, font_waga, "right", "center")
        local liczenie = 1
        local liczeniedwa = 0
        for i,v in ipairs(itemygracza) do 
            liczeniedwa = liczeniedwa+1
            if liczeniedwa > 6 then 
                liczeniedwa = 1
                liczenie = liczenie+1
            end
            local space = 96*(liczenie-1) 
            local spacedwa = 96*(liczeniedwa-1)
            dxDrawImage((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna,"grafiki/itemy/"..itemygracza[i][1]..".png",0,0,0,tocolor(255,255,255,alp2test))
            exports["crime_gui"]:guitext("x"..tonumber(itemygracza[i][2]),(683+spacedwa)/zmienna,(261+space)/zmienna,(683+spacedwa+73)/zmienna,(261+space+73)/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "right", "bottom")
        end
        local liczeniecyce = 1
        local liczeniecycedwa = 0
        for i,v in ipairs(itemygracza) do 
            liczeniecycedwa = liczeniecycedwa+1
            if liczeniecycedwa > 6 then 
                liczeniecycedwa = 1
                liczeniecyce = liczeniecyce+1
            end
            local space = 96*(liczeniecyce-1) 
            local spacedwa = 96*(liczeniecycedwa-1)

            if isMouseIn((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna) and eq == true then 
                for idd,vdd in pairs(nazwyitemow) do 
                    if nazwyitemow[idd][1] == itemygracza[i][1] then 
                        if isCursorShowing() then 
                            cxs,cys=getCursorPosition()
                            cxs,cys=cxs*sx,cys*sy
                            exports["crime_gui"]:guitext(nazwyitemow[idd][2], cxs+(10/zmienna), cys, cxs+(159/zmienna), cys+(31/zmienna), 200, 200, 200, alp2test, dxfont0_FiraEC, "left", "top")
                        end
                    end
                end
            end

            if itemygracza[i][4] == true then 
                dxDrawImage((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna,"grafiki/itemy/"..itemygracza[i][1]..".png",0,0,0,tocolor(255,255,255,alp2test))
                dxDrawImage((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna,"grafiki/itemy/"..itemygracza[i][1]..".png",0,0,0,tocolor(150, 150, 150,alptest))

                tekst1 = "Użyj"

                if itemygracza[i][1] == "wedka" then tekst1 = "Wyciągnij/Schowaj" end
                if itemygracza[i][1] == "wedka2" then tekst1 = "Wyciągnij/Schowaj" end
                if itemygracza[i][1] == "wedka3" then tekst1 = "Wyciągnij/Schowaj" end

                if itemygracza[i][1] == "zdrapka1" then tekst1 = "Zdrap" end
                if itemygracza[i][1] == "zdrapka2" then tekst1 = "Zdrap" end
                if itemygracza[i][1] == "zdrapka3" then tekst1 = "Zdrap" end

                if itemygracza[i][1] == "wegorz" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "amur" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "lin" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "karp" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "pstrag" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "ploc" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "okon" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "leszcz" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "karas" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "sum" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "sandacz" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "fladra" then tekst1 = "Sprzedaj" end
                if itemygracza[i][1] == "rekin" then tekst1 = "Sprzedaj" end

                if itemygracza[i][1] == "kanister" then tekst1 = "Wlej" end
                if itemygracza[i][1] == "rakietnica" then tekst1 = "Wyciągnij/Schowaj" end
                if itemygracza[i][1] == "ak47" then tekst1 = "Wyciągnij/Schowaj" end  
                if itemygracza[i][1] == "m4" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "tec" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "paralizator" then tekst1 = "Wyciągnij/Schowaj" end
                if itemygracza[i][1] == "pila" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "deagle" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "uzi" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "mp5" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "noz" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "kastet" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "kij_golf" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "kij_baseball" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "palka" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "snajperka" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "gasnica" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "spadochron" then tekst1 = "Wyciągnij/Schowaj" end 
                if itemygracza[i][1] == "maska1" then tekst1 = "Załóż/Zdejmij" end
                if itemygracza[i][1] == "maska2" then tekst1 = "Załóż/Zdejmij" end
                if itemygracza[i][1] == "maska3" then tekst1 = "Załóż/Zdejmij" end
                if itemygracza[i][1] == "maska4" then tekst1 = "Załóż/Zdejmij" end
                if itemygracza[i][1] == "kebab" then tekst1 = "Zjedz" end 
                if itemygracza[i][1] == "hamburger" then tekst1 = "Zjedz" end 
                if itemygracza[i][1] == "cola" then tekst1 = "Wypij" end 
                if itemygracza[i][1] == "woda" then tekst1 = "Wypij" end 
                if itemygracza[i][1] == "kokaina" then tekst1 = "Wciągnij" end 
                if itemygracza[i][1] == "ziolo" then tekst1 = "Zapal" end 
                if tekst1 == "Wyciągnij/Schowaj" then 
                    exports["crime_gui"]:guibutton(tekst1,(683+spacedwa+85)/zmienna,(261+space)/zmienna, 200/zmienna, 45/zmienna, alp2test)
                else
                    exports["crime_gui"]:guibutton(tekst1,(683+spacedwa+85)/zmienna,(261+space)/zmienna, 150/zmienna, 45/zmienna, alp2test)
                end
                exports["crime_gui"]:guibutton( "Podziel",(683+spacedwa+85)/zmienna,(261+space+45)/zmienna, 150/zmienna, 45/zmienna, alp2test)
                exports["crime_gui"]:guibutton( "Wyrzuć",(683+spacedwa+85)/zmienna,(261+space+90)/zmienna, 150/zmienna, 45/zmienna, alp2test)
                exports["crime_gui"]:guibutton( "Połącz",(683+spacedwa+85)/zmienna,(261+space+135)/zmienna, 150/zmienna, 45/zmienna, alp2test)
                exports["crime_gui"]:guibutton( "Oddaj graczowi obok",(683+spacedwa+85)/zmienna,(261+space+180)/zmienna, 250/zmienna, 45/zmienna, alp2test)
                exports["crime_gui"]:guibutton( "Wsadź do pojazdu",(683+spacedwa+85)/zmienna,(261+space+225)/zmienna, 200/zmienna, 45/zmienna, alp2test)
            end
        end
    end
end

function wlaczsie()
    if not getElementData(localPlayer,"player:logged") then return end

    if eqauto == true then 
        tickistart = getTickCount()
		czas = 500
        progressdwa = "wylacza"
        showCursor(false)
		setTimer(function()
            removeEventHandler ("onClientRender", root, guiauto)
            eqauto = false
            itemyauto = {}
            aktualnagracz = 0
            aktualnaauto = 0
        end, 500, 1)
    return end 
    if eqautoprzeszukaj == true then 
        tickistart = getTickCount()
		czas = 500
        progressdwa = "wylacza"
        showCursor(false)
		setTimer(function()
            removeEventHandler ("onClientRender", root, guiautoprzeszukaj)
            eqautoprzeszukaj = false
            itemyauto = {}
            aktualnagracz = 0
            aktualnaauto = 0
        end, 500, 1)
    return end 
    if eq == true then  
        tickistart = getTickCount()
		czas = 500
        progressdwa = "wylacza"
        showCursor(false)
		setTimer(function()
            removeEventHandler ("onClientRender", root, gui)
            eq = false
            itemygracza = {}
            aktualnagracz = 0
            aktualnaauto = 0
        end, 500, 1)
    return end
    if eqprzeszukaj == true then 
        tickistart = getTickCount()
		czas = 500
        progressdwa = "wylacza"
        showCursor(false)
		setTimer(function()
            removeEventHandler ("onClientRender", root, guiprzeszukaj)
            eqprzeszukaj = false
            itemygracza = {}
            aktualnagracz = 0
            aktualnaauto = 0
        end, 500, 1)
    return end 
    if wybor == true then 
        tickistart = getTickCount()
		czas = 500
        progressdwa = "wylacza"
        showCursor(false)
		setTimer(function()
            removeEventHandler ("onClientRender", root, wyborcyce)
            wybor = false
        end, 500, 1)
    else
        wybor = true
        tickistart = getTickCount()
        czas = 500
        progressdwa = "wlacza"
        addEventHandler("onClientRender",root,wyborcyce)
        showCursor(true)
    end
end
bindKey("I","down",wlaczsie)

--Wybieranie ktore eq
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(859/zmienna, 374/zmienna, 203/zmienna, 61/zmienna) and wybor == true then 
            tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				removeEventHandler ("onClientRender", root, wyborcyce)
                wybor = false 
                eq = true
				tickistart = getTickCount()
				czas = 500
                progressdwa = "wlacza"
                refreshmnie()
				addEventHandler("onClientRender",root,gui)
			end, 500, 1)
        end
        if isMouseIn(859/zmienna, 445/zmienna, 203/zmienna, 61/zmienna) and wybor == true then 
            tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				removeEventHandler ("onClientRender", root, wyborcyce)
                wybor = false 
                triggerServerEvent("server:checkvehicleeq", localPlayer)
			end, 500, 1)
        end
        if getElementData(localPlayer,"player:duty") == "SAPD" or getElementData(localPlayer,"player:admin") then 
            if isMouseIn(859/zmienna, 516/zmienna, 203/zmienna, 61/zmienna) and wybor == true then 
                tickistart = getTickCount()
                czas = 500
                progressdwa = "wylacza"
                setTimer(function()
                    removeEventHandler ("onClientRender", root, wyborcyce)
                    wybor = false 
                    triggerServerEvent("server:checkplayereqprzeszukaj", localPlayer)
                end, 500, 1)
            end
            if isMouseIn(859/zmienna, 587/zmienna, 203/zmienna, 61/zmienna) and wybor == true then 
                tickistart = getTickCount()
                czas = 500
                progressdwa = "wylacza"
                setTimer(function()
                    removeEventHandler ("onClientRender", root, wyborcyce)
                    wybor = false 
                    triggerServerEvent("server:checkvehicleeqprzeszukaj", localPlayer)
                end, 500, 1)
            end
        end
    end
end)

--Zaznaczenie gracz itemy
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if eq == true then 
            local liczenie = 1
            local liczeniedwa = 0
            local itemid = 0
            for i,v in ipairs(itemygracza) do 
                itemid = itemid+1
                liczeniedwa = liczeniedwa+1
                if liczeniedwa > 6 then 
                    liczeniedwa = 1
                    liczenie = liczenie+1
                end
                local space = 96*(liczenie-1) 
                local spacedwa = 96*(liczeniedwa-1)
                if isMouseIn((683+spacedwa+85)/zmienna,(261+space+180)/zmienna, 250/zmienna, 45/zmienna) and eq == true and itemygracza[i][4] == true then 
                    if itemygracza[i][1] == "kajdanki" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                    if itemygracza[i][1] == "palka" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                    if itemygracza[i][1] == "m4" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                    if itemygracza[i][1] == "paralizator" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                    if wrzuca == false then 
                        wrzuca = true
                        setTimer(function()
                            wrzuca = false
                        end, 1000, 1)
                        triggerServerEvent("server:giveitem", localPlayer, itemid, itemygracza[i][1],tonumber(itemygracza[i][2]))
                    else 
                        exports.crime_gui:addNoti("Możesz to robić raz na sekundę.", "error")
                    end
                return end
                if isMouseIn((683+spacedwa+85)/zmienna,(261+space+225)/zmienna, 200/zmienna, 45/zmienna) and eq == true and itemygracza[i][4] == true then 
                    if itemygracza[i][1] == "kajdanki" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                    if itemygracza[i][1] == "palka" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                    if itemygracza[i][1] == "m4" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                    if itemygracza[i][1] == "paralizator" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                    if wrzuca == false then 
                        wrzuca = true
                        setTimer(function()
                            wrzuca = false
                        end, 1000, 1)
                        triggerServerEvent("server:movevehicle", localPlayer, itemid, itemygracza[i][1],tonumber(itemygracza[i][2]))
                    else 
                        exports.crime_gui:addNoti("Możesz to robić raz na sekundę.", "error")
                    end
                return end
                if isMouseIn((683+spacedwa+85)/zmienna,(261+space)/zmienna, 150/zmienna, 225/zmienna) and eq == true and itemygracza[i][4] == true then 
                    if isMouseIn((683+spacedwa+85)/zmienna,(261+space)/zmienna, 150/zmienna, 45/zmienna) then -- opcja 1
                        if cokolwiek == false then 
                            cokolwiek = true
                            setTimer(function()
                                cokolwiek = false
                            end, 1000, 1)
                            if itemygracza[i][1] == "kajdanki" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                            if itemygracza[i][1] == "palka" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                            if itemygracza[i][1] == "m4" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                            if itemygracza[i][1] == "paralizator" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                            
                            --DZIALANIE ZIOLA
                            if itemygracza[i][1] == "ziolo" then 
                                triggerServerEvent("server:ziolo", localPlayer, itemid)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFodpala blanta.")
                            end
                            --DZIALANIE KOKI
                            if itemygracza[i][1] == "kokaina" then 
                                if getElementData(localPlayer, "player:drugs") then exports.crime_gui:addNoti("Odczekaj przed kolejną działką, bo przedawkujesz.", "error") return end
                                triggerServerEvent("server:kokaina", localPlayer, itemid)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwciąga działkę kokainy.")
                            end
                            --DZIALANIE ALKOHOLU
                            if itemygracza[i][1] == "wodka" then 
                                triggerServerEvent("server:alkohol", localPlayer, itemid)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwypija butelkę wódki.")
                            end
                            --DZIALANIE HEROINY
                            if itemygracza[i][1] == "heroina" then 
                                if getElementData(localPlayer, "player:drugs") then exports.crime_gui:addNoti("Odczekaj przed kolejną działką, bo przedawkujesz.", "error") return end
                                triggerServerEvent("server:heroina", localPlayer, itemid)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFzażywa działkę heroiny.")
                            end
                            --ZDRAPKI

                            if drapie == false then 
                                drapie = true
                                setTimer(function()
                                    drapie = false
                                end, 2000, 1)
                                if itemygracza[i][1] == "zdrapka1" then 
                                    triggerServerEvent("server:zdrapka", localPlayer, itemid, itemygracza[i][1])
                                end
                                if itemygracza[i][1] == "zdrapka2" then 
                                    triggerServerEvent("server:zdrapka", localPlayer, itemid, itemygracza[i][1])
                                end
                                if itemygracza[i][1] == "zdrapka3" then 
                                    triggerServerEvent("server:zdrapka", localPlayer, itemid, itemygracza[i][1])
                                end
                            else 
                                exports.crime_gui:addNoti("Możesz to robić raz na sekundę.", "error")
                            end

                            if itemygracza[i][1] == "wegorz" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "amur" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "lin" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "karp" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "pstrag" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "ploc" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "okon" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "leszcz" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "karas" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "sum" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "sandacz" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "fladra" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end
                            if itemygracza[i][1] == "rekin" then triggerServerEvent("server:sellfish",localPlayer,itemid,tonumber(itemygracza[i][2]),itemygracza[i][1]) end

                            if itemygracza[i][1] == "rakietnica" then 
                                dajbron(7,35)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Wyrzutnię rakiet'.")
                            end
                            if itemygracza[i][1] == "ak47" then 
                                dajbron(5,30)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Karabin szturmowy AK-47'.")
                            end
                            if itemygracza[i][1] == "m4" then 
                                dajbron(5,31)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Karabin szturmowy M4'.")
                            end
                            if itemygracza[i][1] == "tec" then 
                                if tonumber(itemygracza[i][2]) >= 2 then 
                                    costam = 2
                                else
                                    costam = 0
                                end
                                dajbron(4,32,costam)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Pistolet maszynowy TEC-9'.")
                            end
                            if itemygracza[i][1] == "pila" then 
                                dajbron(1,9)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Piłę mechaniczną'.")
                            end
                            if itemygracza[i][1] == "deagle" then 
                                dajbron(2,24)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Pistolet Deagle'.")
                            end
                            if itemygracza[i][1] == "uzi" then 
                                if tonumber(itemygracza[i][2]) >= 2 then 
                                    costam = 2
                                else
                                    costam = 0
                                end
                                dajbron(4,28,costam)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Pistolet maszynowy Uzi'.")
                            end
                            if itemygracza[i][1] == "mp5" then 
                                dajbron(4,29)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Karabin maszynowy MP5'.")
                            end
                            if itemygracza[i][1] == "noz" then 
                                dajbron(1,4)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Nóż bojowy'.")
                            end
                            if itemygracza[i][1] == "kastet" then 
                                dajbron(0,1)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Kastet'.")
                            end
                            if itemygracza[i][1] == "kij_golf" then 
                                dajbron(1,2)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Kij golfowy'.")
                            end
                            if itemygracza[i][1] == "kij_baseball" then 
                                dajbron(1,5)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Kij baseballowy'.")
                            end
                            if itemygracza[i][1] == "paralizator" then 
                                dajbron(2,23)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Paralizator'.")
                            end
                            if itemygracza[i][1] == "palka" then 
                                dajbron(1,3)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Pałkę policyjną'.")
                            end
                            if itemygracza[i][1] == "snajperka" then 
                                dajbron(6,34)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Karabin snajperski'.")
                            end
                            if itemygracza[i][1] == "gasnica" then 
                                dajbron(9,42)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Gaśnicę'.")
                            end
                            if itemygracza[i][1] == "spadochron" then 
                                dajbron(11,46)
                                triggerServerEvent("odegrajRp:eq", localPlayer, localPlayer, "** #CA43FF"..getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x","").." #CA43FFwyciąga/chowa 'Spadochron'.")
                            end
                            if itemygracza[i][1] == "kebab" then 
                                triggerServerEvent("server:eat", localPlayer, itemid, 20)
                            end
                            if itemygracza[i][1] == "hamburger" then 
                                triggerServerEvent("server:eat", localPlayer, itemid, 15)
                            end
                            if itemygracza[i][1] == "cola" then 
                                triggerServerEvent("server:eat", localPlayer, itemid, 10)
                            end
                            if itemygracza[i][1] == "woda" then 
                                triggerServerEvent("server:eat", localPlayer, itemid, 5)
                            end
                            if itemygracza[i][1] == "kajdanki" then 
                                triggerServerEvent("server:kajdanki", localPlayer)
                            end
                            if itemygracza[i][1] == "maska4" then 
                                triggerServerEvent("server:maska", localPlayer, itemygracza[i][1])
                            end
                            if itemygracza[i][1] == "maska3" then 
                                triggerServerEvent("server:maska", localPlayer, itemygracza[i][1])
                            end
                            if itemygracza[i][1] == "maska2" then 
                                triggerServerEvent("server:maska", localPlayer, itemygracza[i][1])
                            end
                            if itemygracza[i][1] == "maska1" then 
                                triggerServerEvent("server:maska", localPlayer, itemygracza[i][1])
                            end
                            if itemygracza[i][1] == "kanister" then 
                                triggerServerEvent("server:kanister", localPlayer, itemid)
                            end
                            if itemygracza[i][1] == "zestaw" then 
                                triggerServerEvent("server:fixveh", localPlayer, itemid)
                            end
                            if itemygracza[i][1] == "zestawdwa" then 
                                triggerServerEvent("server:fixvehdwa", localPlayer, itemid)
                            end
                            if itemygracza[i][1] == "wedka" then 
                                triggerServerEvent("server:wedka", localPlayer, itemygracza[i][1])
                            end
                            if itemygracza[i][1] == "wedka2" then 
                                triggerServerEvent("server:wedka", localPlayer, itemygracza[i][1])
                            end
                            if itemygracza[i][1] == "wedka3" then 
                                triggerServerEvent("server:wedka", localPlayer, itemygracza[i][1])
                            end
                        else 
                            exports.crime_gui:addNoti("Możesz to robić raz na 2 sekundy.", "error")
                        end
                    end
                    if isMouseIn((683+spacedwa+85)/zmienna,(261+space+45)/zmienna, 150/zmienna, 45/zmienna) then -- opcja 2
                        if itemygracza[i][1] == "kajdanki" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                        if itemygracza[i][1] == "palka" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                        if itemygracza[i][1] == "m4" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                        if itemygracza[i][1] == "paralizator" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                        ilosc = tonumber(itemygracza[i][2])
                        if ilosc <= 1 then exports.crime_gui:addNoti("Nie możesz tego podzielić.", "error") return end
                        if table.maxn(itemygracza)+1 > 24 then exports.crime_gui:addNoti("Masz za mało miejsca.", "error") return end 

                        if wrzuca == false then 
                            wrzuca = true
                            setTimer(function()
                                wrzuca = false
                            end, 1000, 1)
                            if ilosc/2 == math.floor(ilosc/2) then --COS CO SIE DZIELI
                                triggerServerEvent("server:removeitem", localPlayer, itemid, "dzieli",itemygracza[i][1])
                                triggerServerEvent("server:additem", localPlayer, itemygracza[i][1], ilosc/2)
                                triggerServerEvent("server:additem", localPlayer, itemygracza[i][1], ilosc/2)
                            else -- ALBO SIE KURWA NIE DZIELI FRAJERZE JEBANY
                                local mniejsze = math.floor(ilosc/2)
                                local wieksze = math.floor(ilosc/2)+1
                                triggerServerEvent("server:removeitem", localPlayer, itemid, "dzieli", itemygracza[i][1])
                                triggerServerEvent("server:additem", localPlayer, itemygracza[i][1], mniejsze)
                                triggerServerEvent("server:additem", localPlayer, itemygracza[i][1], wieksze)
                            end
                        else 
                            exports.crime_gui:addNoti("Możesz to robić raz na sekundę.", "error")
                        end
                    end
                    if isMouseIn((683+spacedwa+85)/zmienna,(261+space+90)/zmienna, 150/zmienna, 45/zmienna) then -- opcja 3
                        if itemygracza[i][1] == "plecak" then 
                            if chceckitemplr("plecak",1) == true then 
                                if sprawdzwagekg(tonumber(itemygracza[i][2]),itemygracza[i][3]) >= 15000 then
                                    exports.crime_gui:addNoti("Nie możesz wyrzucić plecaka, gdy masz w nim przedmioty.", "error")
                                else
                                    triggerServerEvent("server:removeitem", localPlayer, itemid, "test",itemygracza[i][1])
                                end
                            else
                                triggerServerEvent("server:removeitem", localPlayer, itemid, "test",itemygracza[i][1])
                            end
                        else 
                            triggerServerEvent("server:removeitem", localPlayer, itemid, "test",itemygracza[i][1])
                        end
                    end
                    if isMouseIn((683+spacedwa+85)/zmienna,(261+space+135)/zmienna, 150/zmienna, 45/zmienna) then -- opcja 4
                        if cokolwiek == false then 
                            cokolwiek = true
                            setTimer(function()
                                cokolwiek = false
                            end, 2000, 1)
                            if itemygracza[i][1] == "kajdanki" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                            if itemygracza[i][1] == "palka" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                            if itemygracza[i][1] == "m4" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                            if itemygracza[i][1] == "paralizator" and getElementData(localPlayer,"player:duty") ~= "SAPD" then exports.crime_gui:addNoti("Nie możesz wykonać tej akcji.", "error") return end
                            triggerServerEvent("server:connectitem",localPlayer,itemygracza[i][1])
                        else 
                            exports.crime_gui:addNoti("Możesz to robić raz na sekundę.", "error")
                        end
                    end
                return end 
                    itemygracza[i][4] = false
                if isMouseIn((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna) and eq == true then 
                    itemygracza[i][4] = true
                end
            end
        end
    end
end)

--Zaznaczenie auto itemy
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if eqauto == true then 
            local liczenie = 1
            local liczeniedwa = 0
            local itemid = 0
            for i,v in ipairs(itemyauto) do 
                itemid = itemid+1
                liczeniedwa = liczeniedwa+1
                if liczeniedwa > 6 then 
                    liczeniedwa = 1
                    liczenie = liczenie+1
                end
                local space = 96*(liczenie-1) 
                local spacedwa = 96*(liczeniedwa-1)
                    if isMouseIn((683+spacedwa+85)/zmienna,(261+space)/zmienna, 150/zmienna, 45/zmienna) and eqauto == true and itemyauto[i][4] == true then 
                        if cokolwiek == false then 
                            cokolwiek = true
                            setTimer(function()
                                cokolwiek = false
                            end, 2000, 1)
                            triggerServerEvent("server:movefromvehicle",localPlayer,itemyauto[i][5],itemyauto[i][1],itemyauto[i][2])
                        else 
                            exports.crime_gui:addNoti("Możesz to robić raz na sekundę.", "error")
                        end
                    return end

                itemyauto[i][4] = false
                if isMouseIn((683+spacedwa)/zmienna,(261+space)/zmienna,73/zmienna,73/zmienna) and eqauto == true then 
                    itemyauto[i][4] = true
                end
            end
        end
    end
end)
--[[
--Zaznaczenie gracz itemy konfiskowanie
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if eqprzeszukaj == true then 
            local liczenie = 1
            local liczeniedwa = 0
            local itemid = 0
            for i,v in ipairs(itemygracza) do 
                itemid = itemid+1
                liczeniedwa = liczeniedwa+1
                if liczeniedwa > 6 then 
                    liczeniedwa = 1
                    liczenie = liczenie+1
                end
                local space = 96*(liczenie-1) 
                local spacedwa = 96*(liczeniedwa-1)
                if isMouseIn(683+spacedwa+85,261+space, 150, 45) and eqprzeszukaj == true and itemygracza[i][4] == true then 
                    triggerServerEvent("server:movefromgracz",localPlayer,itemygracza[i][5],itemygracza[i][1],itemygracza[i][2])
                return end

                itemygracza[i][4] = false
                if isMouseIn(683+spacedwa,261+space,73,73) and eqprzeszukaj == true then 
                    itemygracza[i][4] = true
                end
            end
        end
    end
end)]]--
--[[
--Zaznaczenie auto itemy konfiskowanie
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if eqautoprzeszukaj == true then 
            local liczenie = 1
            local liczeniedwa = 0
            local itemid = 0
            for i,v in ipairs(itemyauto) do 
                itemid = itemid+1
                liczeniedwa = liczeniedwa+1
                if liczeniedwa > 6 then 
                    liczeniedwa = 1
                    liczenie = liczenie+1
                end
                local space = 96*(liczenie-1) 
                local spacedwa = 96*(liczeniedwa-1)
                if isMouseIn(683+spacedwa+85,261+space, 150, 45) and eqautoprzeszukaj == true and itemyauto[i][4] == true then 
                    triggerServerEvent("server:movefromvehicle",localPlayer,itemyauto[i][5],itemyauto[i][1],itemyauto[i][2])
                return end

                itemyauto[i][4] = false
                if isMouseIn(683+spacedwa,261+space,73,73) and eqautoprzeszukaj == true then 
                    itemyauto[i][4] = true
                end
            end
        end
    end
end)]]--


--FUNCTIONS

function refreshmnie(typek)
    if not typek then typek = localPlayer end
    itemygracza = {}
    aktualnagracz = 0
    itemygracza = getElementData(typek,"player:ekwipunek") or {}
    for i,v in ipairs(itemygracza) do 
        aktualnagracz = aktualnagracz + tonumber(itemygracza[i][2])*itemygracza[i][3]
    end
end

function refreshmnieauto(car)
    itemyauto = {}
    aktualnaauto = 0
    itemyauto = getElementData(car,"vehicle:ekwipunek") or {}
    for i,v in ipairs(itemyauto) do 
        aktualnaauto = aktualnaauto + itemyauto[i][2]*itemyauto[i][3]
    end
end

addEvent("client:refreshinventory", true)
addEventHandler("client:refreshinventory", root, function()
    itemygracza = {}
    aktualnagracz = 0
    aktualnaauto = 0
    itemygracza = getElementData(localPlayer,"player:ekwipunek") or {}
    for i,v in ipairs(itemygracza) do 
        aktualnagracz = aktualnagracz + tonumber(itemygracza[i][2])*itemygracza[i][3]
    end
end)

addEvent("client:setvehicleeq", true)
addEventHandler("client:setvehicleeq", root, function(vehicles)
    if not vehicles then return end 
    if table.maxn(vehicles) < 1 then exports.crime_gui:addNoti("Nie znajdujesz się obok żadnego pojazdu.", "error") showCursor(false) return end 
    if table.maxn(vehicles) >= 2 then exports.crime_gui:addNoti("Obok Ciebie znajduje się więcej niż 1 pojazd.", "error") showCursor(false) return end 

    for _, vehicle in ipairs( vehicles ) do
        if getElementData(vehicle,"vehicle:ownedPlayer") == getElementData(localPlayer,"player:uid") then 
            refreshmnieauto(vehicle)
            eqauto = true
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wlacza"
            addEventHandler("onClientRender",root,guiauto)
            showCursor(true)
        else 
            exports.crime_gui:addNoti("Pojazd obok ciebie nie jest twój.", "error")
            showCursor(false)
        end
    end
end)

addEvent("client:setvehicleeqprzeszukaj", true)
addEventHandler("client:setvehicleeqprzeszukaj", root, function(vehicles)
    if not vehicles then return end 
    if table.maxn(vehicles) < 1 then exports.crime_gui:addNoti("Nie znajdujesz się obok żadnego pojazdu.", "error") showCursor(false) return end 
    if table.maxn(vehicles) >= 2 then exports.crime_gui:addNoti("Obok Ciebie znajduje się więcej niż 1 pojazd.", "error") showCursor(false) return end 

    for _, vehicle in ipairs( vehicles ) do
        refreshmnieauto(vehicle)
        eqautoprzeszukaj = true
        tickistart = getTickCount()
        czas = 500
        progressdwa = "wlacza"
        addEventHandler("onClientRender",root,guiautoprzeszukaj)
        showCursor(true)
    end
end)

addEvent("client:setplayereqprzeszukaj", true)
addEventHandler("client:setplayereqprzeszukaj", root, function(ludzie)
    if not ludzie then return end 
    if table.maxn(ludzie) <= 1 then exports.crime_gui:addNoti("Nie znajdujesz się obok żadnego gracza.", "error") showCursor(false) return end 
    if table.maxn(ludzie) > 2 then exports.crime_gui:addNoti("Obok Ciebie znajduje się więcej niż 1 gracz.", "error") showCursor(false) return end 

    for _, typo in ipairs( ludzie ) do
        if getPlayerName(typo) ~= getPlayerName(localPlayer) then 
            refreshmnie(typo)
            eqprzeszukaj = true
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wlacza"
            addEventHandler("onClientRender",root,guiprzeszukaj)
            showCursor(true)
        end
    end
end)

addEvent("client:setplayereqprzeszukajdwa", true)
addEventHandler("client:setplayereqprzeszukajdwa", root, function(typo)
    if not typo then return end 
    refreshmnie(typo)
end)

addEvent("client:setvehicleeqdwa", true)
addEventHandler("client:setvehicleeqdwa", root, function(vehicle)
    if not vehicle then return end
    refreshmnieauto(vehicle)
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


-- funkcje przedmiotow


function dajbron(id,id2,id3)
    if not id3 then id3 = 0 end
    triggerServerEvent("server:giveweapon", localPlayer, id,id2,id3)
end

addEvent("client:ziolo", true)
addEventHandler("client:ziolo", root, function()
    exports.shader_screen_fx:startEffects(true)
    exports.shader_screen_fx:enableEffect(1,true)
    setElementData(localPlayer, "player:desc", "*Zaczerwienione oczy w skutku przyjęcia narkotyku*")
    setTimer(function()
        setElementData(localPlayer, "player:drugs", false)
        exports.shader_screen_fx:startEffects(false)
        exports.shader_screen_fx:enableEffect(1,false)
    end, 1000*120, 1)
end)

addEvent("client:alkohol", true)
addEventHandler("client:alkohol", root, function()
    setCameraShakeLevel(25)
    exports.shader_screen_fx:startEffects(true)
    exports.shader_screen_fx:enableEffect(4,true)
    setPedWalkingStyle(localPlayer,126)
    setElementData(localPlayer, "player:desc", "*Silnie wyczuwalny zapach alkoholu*")
    setTimer(function()
        -- setElementData(localPlayer, "player:drugs", false)
        setCameraShakeLevel(0)
        setPedWalkingStyle(localPlayer,0) 
        exports.shader_screen_fx:startEffects(false)
        exports.shader_screen_fx:enableEffect(4,false)
    end, 1000*180, 1)
end) 

addEvent("client:heroina", true)
addEventHandler("client:heroina", root, function()
    setCameraShakeLevel(15)
    exports.shader_screen_fx:startEffects(true)
    exports.shader_screen_fx:enableEffect(3,true)
    setElementHealth(localPlayer, 15)
    setElementData(localPlayer, "player:desc", "*Silnie zwężone źrenice w skutku przyjęcia narkotyku*")
    setTimer(function()
        setElementData(localPlayer, "player:drugs", false)
        setCameraShakeLevel(0)
        exports.shader_screen_fx:startEffects(false)
        exports.shader_screen_fx:enableEffect(3,false)
    end, 1000*240, 1)
end)

addEvent("client:kokaina", true)
addEventHandler("client:kokaina", root, function()
    setCameraShakeLevel(15)
    setElementHealth(localPlayer, 100)
    setPedArmor(localPlayer, 25)
    setElementData(localPlayer, "player:desc", "*Rozszerzone źrenice w skutku przyjęcia narkotyku*")
    setTimer(function()
        setElementData(localPlayer, "player:drugs", false)
        setCameraShakeLevel(0)
        setElementData(localPlayer, "player:desc", "")
    end, 1000*300, 1)
end)

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end

guisad = false
local strzalka = 936
function guicads()
    if guisad == true then
        if getKeyState("mouse1") == true or getKeyState("space") == true then 
            plus = math.random(100,450)
            plus = math.floor(plus/100)
            strzalka = strzalka + plus
        else 
            strzalka = strzalka - minus
        end
		dxDrawImage(779/zmienna, 982/zmienna, 361/zmienna, 48/zmienna, ":crime_equipment/grafiki/gui/rybciapasek.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(strzalka/zmienna, 982/zmienna, 47/zmienna, 43/zmienna, ":crime_equipment/grafiki/gui/rybciastrzalka.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
end

function sprawdzwater()
    if localPlayer then 
        for i,v in pairs(getElementsByType("object")) do 
            if getElementData(v,"wedka:check") == localPlayer then 
                x,y,z = getElementPosition(localPlayer)
                x2,y2,z2 = getElementPosition(v)
                if testLineAgainstWater(x,y,z+2,x2,y2,z2) then 
                    if getPedOccupiedVehicle(localPlayer) then exports.crime_gui:addNoti("Wyjdź z pojazdu.", "error") return end
                    if isElementInWater(localPlayer) then exports.crime_gui:addNoti("Przestań pływać.", "error") return end
                    if getElementData(localPlayer,"lowikutas") == true then return end
                    if sprawdzwage(1,200) == false then exports.crime_gui:addNoti("Nie masz więcej miejsca.", "error") return end
                    if guisad == true then return end 
                    zlowil = true
                    guisad = true
                    addEventHandler("onClientRender", root, guicads)
                    minus = math.random(200,400)
                    minus = math.floor(minus/100)
                    --showCursor(true)
                    --local sila = math.random(100,250)
                    timer = setTimer(function()
                        --strzalka = strzalka - math.floor(sila/100)
                        if strzalka <= 769 or strzalka >= 1103 then
                            if isTimer(timer) then killTimer(timer) end
                            if isTimer(timson) then killTimer(timson) end
                            guisad = false
                            removeEventHandler("onClientRender", root, guicads)
                            if eq == false and eqprzeszukaj == false and eqauto == false and eqautoprzeszukaj == false and wybor == false then 
                                --showCursor(false)
                            end
                            strzalka = 936
                            setElementFrozen(localPlayer,false)
                            triggerServerEvent("anims:stopanim",localPlayer)
                            setElementData(localPlayer,"lowikutas",false)
                            zlowil = false

                            triggerServerEvent("server:eqsoundstop",root,x,y,z)
                            

                        end
                    end, 10, 0)
                    
                    ponton = false
                    for i,v in pairs(getElementsWithinRange(x,y,z,2,"vehicle")) do 
                        if getElementModel(v) == 473 then 
                            ponton = true
                        end
                    end
                    czastajmer = 10500
                    setElementData(localPlayer,"lowikutas",true)
                    zlowilcos()
                else
                    exports.crime_gui:addNoti("Nie wykryto wody, najlepsze miejsce to brzeg, nie pomosty.", "error")
                end
            end
        end
    end
end
bindKey("E","down",sprawdzwater)

function zlowilcos()
    if getElementData(localPlayer,"wedka:lvl") == 1 then 

        if ponton == true then 
            rybsia = math.random(1,104)
        else 
            rybsia = math.random(1,100)
        end

        setElementFrozen(localPlayer,true)
        triggerServerEvent("anims:startanim",localPlayer, "SWORD", "sword_block")
        triggerServerEvent("eq:serverfishsounds",root,x,y,z,czastajmer)
        timson = setTimer(function()
            if strzalka >= 875 and strzalka <= 998 then
                if zlowil == false then return end
                setElementFrozen(localPlayer,false)
                triggerServerEvent("anims:stopanim",localPlayer)
                setElementData(localPlayer,"lowikutas",false)
                if rybsia >= 1 and rybsia <= 5 then rybsiac = "wegorz" end
                if rybsia >= 6 and rybsia <= 10 then rybsiac = "amur" end
                if rybsia >= 11 and rybsia <= 15 then rybsiac = "lin" end
                if rybsia >= 16 and rybsia <= 20 then rybsiac = "karp" end
                if rybsia >= 21 and rybsia <= 25 then rybsiac = "pstrag" end
                if rybsia >= 26 and rybsia <= 45 then rybsiac = "ploc" end
                if rybsia >= 46 and rybsia <= 65 then rybsiac = "okon" end
                if rybsia >= 66 and rybsia <= 70 then rybsiac = "leszcz" end
                if rybsia >= 71 and rybsia <= 95 then rybsiac = "karas" end
                if rybsia == 96 then rybsiac = "sum" end
                if rybsia >= 97 and rybsia <= 100 then rybsiac = "sandacz" end
                if rybsia >= 101 and rybsia <= 102 then rybsiac = "fladra" end
                if rybsia >= 103 and rybsia <= 104 then rybsiac = "rekin" end
                triggerServerEvent("server:additem",localPlayer,rybsiac,1)
                triggerServerEvent("server:connectitem",localPlayer,rybsiac)
                triggerServerEvent("eq:serverfishsoundsdwa",root,x,y,z)

                if isTimer(timer) then killTimer(timer) end
                guisad = false
                removeEventHandler("onClientRender", root, guicads)
                if eq == false and eqprzeszukaj == false and eqauto == false and eqautoprzeszukaj == false and wybor == false then 
                    --showCursor(false)
                end
                strzalka = 936
            else 
                if isTimer(timson) then killTimer(timson) end
                guisad = false
                removeEventHandler("onClientRender", root, guicads)
                if eq == false and eqprzeszukaj == false and eqauto == false and eqautoprzeszukaj == false and wybor == false then 
                    --showCursor(false)
                end
                strzalka = 936
                setElementFrozen(localPlayer,false)
                triggerServerEvent("anims:stopanim",localPlayer)
                setElementData(localPlayer,"lowikutas",false)
            end
        end, czastajmer, 1)

    elseif getElementData(localPlayer,"wedka:lvl") == 2 then 

        if ponton == true then 
            rybsia = math.random(1,106)
        else 
            rybsia = math.random(1,100)
        end

        setElementFrozen(localPlayer,true)
        triggerServerEvent("anims:startanim",localPlayer, "SWORD", "sword_block")
        triggerServerEvent("eq:serverfishsounds",root,x,y,z,czastajmer)
        timson = setTimer(function()
            if strzalka >= 875 and strzalka <= 998 then
                setElementFrozen(localPlayer,false)
                triggerServerEvent("anims:stopanim",localPlayer)
                setElementData(localPlayer,"lowikutas",false)
                if rybsia >= 1 and rybsia <= 5 then rybsiac = "wegorz" end
                if rybsia >= 6 and rybsia <= 10 then rybsiac = "amur" end
                if rybsia >= 11 and rybsia <= 15 then rybsiac = "lin" end
                if rybsia >= 16 and rybsia <= 20 then rybsiac = "karp" end
                if rybsia >= 21 and rybsia <= 25 then rybsiac = "pstrag" end
                if rybsia >= 26 and rybsia <= 45 then rybsiac = "ploc" end
                if rybsia >= 46 and rybsia <= 65 then rybsiac = "okon" end
                if rybsia >= 66 and rybsia <= 70 then rybsiac = "leszcz" end
                if rybsia >= 71 and rybsia <= 95 then rybsiac = "karas" end
                if rybsia == 96 then rybsiac = "sum" end
                if rybsia >= 97 and rybsia <= 100 then rybsiac = "sandacz" end
                if rybsia >= 101 and rybsia <= 103 then rybsiac = "fladra" end
                if rybsia >= 104 and rybsia <= 106 then rybsiac = "rekin" end
                triggerServerEvent("server:additem",localPlayer,rybsiac,1)
                triggerServerEvent("server:connectitem",localPlayer,rybsiac)
                triggerServerEvent("eq:serverfishsoundsdwa",root,x,y,z)

                if isTimer(timer) then killTimer(timer) end
                guisad = false
                removeEventHandler("onClientRender", root, guicads)
                if eq == false and eqprzeszukaj == false and eqauto == false and eqautoprzeszukaj == false and wybor == false then 
                    --showCursor(false)
                end
                strzalka = 936
            else 
                if isTimer(timson) then killTimer(timson) end
                guisad = false
                removeEventHandler("onClientRender", root, guicads)
                if eq == false and eqprzeszukaj == false and eqauto == false and eqautoprzeszukaj == false and wybor == false then 
                    --showCursor(false)
                end
                strzalka = 936
                setElementFrozen(localPlayer,false)
                triggerServerEvent("anims:stopanim",localPlayer)
                setElementData(localPlayer,"lowikutas",false)
            end
        end, czastajmer, 1)

    elseif getElementData(localPlayer,"wedka:lvl") == 3 then 

        if ponton == true then 
            rybsia = math.random(1,108)
        else 
            rybsia = math.random(1,100)
        end

        setElementFrozen(localPlayer,true)
        triggerServerEvent("anims:startanim",localPlayer, "SWORD", "sword_block")
        triggerServerEvent("eq:serverfishsounds",root,x,y,z,czastajmer)
        timson = setTimer(function()
            if strzalka >= 875 and strzalka <= 998 then
                setElementFrozen(localPlayer,false)
                triggerServerEvent("anims:stopanim",localPlayer)
                setElementData(localPlayer,"lowikutas",false)
                if rybsia >= 1 and rybsia <= 5 then rybsiac = "wegorz" end
                if rybsia >= 6 and rybsia <= 10 then rybsiac = "amur" end
                if rybsia >= 11 and rybsia <= 15 then rybsiac = "lin" end
                if rybsia >= 16 and rybsia <= 20 then rybsiac = "karp" end
                if rybsia >= 21 and rybsia <= 25 then rybsiac = "pstrag" end
                if rybsia >= 26 and rybsia <= 45 then rybsiac = "ploc" end
                if rybsia >= 46 and rybsia <= 65 then rybsiac = "okon" end
                if rybsia >= 66 and rybsia <= 70 then rybsiac = "leszcz" end
                if rybsia >= 71 and rybsia <= 95 then rybsiac = "karas" end
                if rybsia == 96 then rybsiac = "sum" end
                if rybsia >= 97 and rybsia <= 100 then rybsiac = "sandacz" end
                if rybsia >= 101 and rybsia <= 104 then rybsiac = "fladra" end
                if rybsia >= 105 and rybsia <= 108 then rybsiac = "rekin" end
                triggerServerEvent("server:additem",localPlayer,rybsiac,1)
                triggerServerEvent("server:connectitem",localPlayer,rybsiac)
                triggerServerEvent("eq:serverfishsoundsdwa",root,x,y,z)

                if isTimer(timer) then killTimer(timer) end
                guisad = false
                removeEventHandler("onClientRender", root, guicads)
                if eq == false and eqprzeszukaj == false and eqauto == false and eqautoprzeszukaj == false and wybor == false then 
                    --showCursor(false)
                end
                strzalka = 936
            else 
                if isTimer(timson) then killTimer(timson) end
                guisad = false
                removeEventHandler("onClientRender", root, guicads)
                if eq == false and eqprzeszukaj == false and eqauto == false and eqautoprzeszukaj == false and wybor == false then 
                    --showCursor(false)
                end
                strzalka = 936
                setElementFrozen(localPlayer,false)
                triggerServerEvent("anims:stopanim",localPlayer)
                setElementData(localPlayer,"lowikutas",false)
            end
        end, czastajmer, 1)

    end
end

addEvent( "eq:fishsounds", true ) 
addEventHandler( "eq:fishsounds", getRootElement(), function(x,y,z,czastajmer) 
    setTimer(function()
        if getElementData(localPlayer,"wedka:sound") == true then return end
        testsound = playSound3D( 'dzwieki/plusk.mp3', x, y, z )
        setElementData(testsound,"wedkasound",true)
        setSoundMaxDistance( testsound, 20 )
    end, 600, 1)
    setTimer(function()
        if getElementData(localPlayer,"wedka:sound") == true then return end
        testsounddwa = playSound3D( 'dzwieki/zaciaganie.mp3', x, y, z )
        setElementData(testsounddwa,"wedkasound",true)
        setSoundMaxDistance( testsounddwa, 20 )
    end, 900, 1)
end) 

addEvent( "eq:fishsoundsdwa", true ) 
addEventHandler( "eq:fishsoundsdwa", getRootElement(), function(x,y,z) 
    if getElementData(localPlayer,"wedka:sound") == true then return end
    testsoundc = playSound3D( 'dzwieki/plusk.mp3', x, y, z )
    setElementData(testsoundc,"wedkasound",true)
    setSoundMaxDistance( testsoundc, 20 )
end) 

addEvent( "client:eqsoundstop", true ) 
addEventHandler( "client:eqsoundstop", getRootElement(), function(x,y,z) 
    for i,v in pairs(getElementsWithinRange(x,y,z,1,"sound")) do 
        if getElementData(v,"wedkasound") == true then 
            stopSound(v)
        end
    end
end) 

function sprawdzwage(ilosc,waga)
    local itemygracza = getElementData(localPlayer,"player:ekwipunek") or {}
    aktualnagracz = 0
    for i,v in ipairs(itemygracza) do 
        aktualnagracz = aktualnagracz + tonumber(itemygracza[i][2])*itemygracza[i][3]
    end
    if chceckitemplr("plecak",1) == true then 
        if aktualnagracz+waga*ilosc > 27000 then return false end
    else
        if aktualnagracz+waga*ilosc > 15000 then return false end
    end
    return true
end

function sprawdzwagekg(ilosc,waga)
    local itemygracza = getElementData(localPlayer,"player:ekwipunek") or {}
    aktualnagracz = 0
    for i,v in ipairs(itemygracza) do 
        aktualnagracz = aktualnagracz + tonumber(itemygracza[i][2])*itemygracza[i][3]
    end
    return aktualnagracz
end
--[[
function addsad()
	if guisad == true then 
		strzalka = strzalka + math.random(10,23)
	end
end
bindKey("mouse1","down",addsad)
bindKey("space","down",addsad)]]--

function chceckitemplr(nazwa,ilosc)
    if not nazwa then return end 
    if not ilosc then return end
    local itemygracza = getElementData(localPlayer,"player:ekwipunek") or {}
    znalazl = false
    for i,v in pairs(itemygracza) do 
        if itemygracza[i][1] == nazwa then 
            if tonumber(itemygracza[i][2]) >= ilosc then 
                znalazl = true 
            end
        end
    end
    return znalazl    
end