--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local pytania = {
    {1,"Co powinieneś zrobić, gdy zatrzymuje cię policja?", "Gaz w podłoge i uciekać", "Zatrzymać się na poboczu i wyłączyć silnik", "Zatrzymać się, a gdy policjant podejdzie uciec.", "B", 30},
    {2,"Co powinieneś zrobić, jeżeli złapiesz kapcia w kole?", "Jechać dalej póki z felgi nie zrobi się jajo.", "Zatrzymać się na poboczu i wymienić koło na zapasowe.", "Stanąć na środku drogi i wołać o pomoc", "B", 20},
    {3, "Ile maksymalnie możemy jechać w terenie zabudowanym, aby nie stracić prawa jazdy?", "100km/h", "120km/h", "99km/h", "C", 30},
    {4, "Czy można prowadzić pojazd, po wypiciu piwa bezalkoholowego?", "Zależnie od ilości wypitego piwa", "Tak", "Nie", "A", 20},
    {5, "Jedziesz z prędkością 80 km/h. Jaka pozycja początkowa zapewni Ci optymalny tor jazdy po zakręcie?", "Na środku drogi, z częściowym przekroczeniem widocznej linii.", "Przy linii rozdzielającej pasy ruchu - na prawej połowie jezdni.", "Przy prawej krawędzi jezdni.", "B", 30},
    {6, "Którym z wymienionych zespołów pojazdów możesz kierować mając prawo jazdy kategorii B?", "Samochodem ciężarowym o dopuszczalnej masie całkowitej 2,5 t z przyczepą lekką.", "Ciągnikiem rolniczym z dwiema przyczepami.", "Samochodem osobowym z przyczepą, których łączna dopuszczalna masa całkowita wynosi 4,5 t.", "A", 30},
    {7, "W jakich warunkach droga hamowania jest najdłuższa?", "Sucha droga", "Mokra droga", "Oblodzona droga", "C", 20},
    {8, "Jaka wynosi maksymalna prędkość samochodu osobowego w obszarze terenu zabudowanego od godziny 23:00 do 5:00", "60km/h", "50km/h", "70km/h", "A", 30},
    {9, "Które znaki poziome są najważniejsze?", "Białe", "Pomarańczowe", "Zielone", "B", 30},
    {10, "Która z wartości zawartosci alkoholu w 1dm3 wydychanego powietrza oznacza, że prowadzenie samochodu jest zabronione?", "0.05mg", "0.1mg", "0.025mg", "B", 30},
    {11, "Czy wolno ci przewozić przedszkolaka na kolanach osoby dorosłej?", "Tak", "Nie", "Tak, gdy ma pasy", "B", 30},
    {12, "W którym miejscu wskaźnika bagnetowego powinien znajdować się ślad oleju aby oznaczało to jego prawidłowy poziom?", "Za 'Max'", "Między 'Min' i 'Max'", "Przed 'Min'", "B", 30},
    {13, "Jaka wynosi maksymalna prędkość samochodu osobowego w obszarze terenu zabudowanego od godziny 5:00 do 23:00", "50km/h", "40km/h", "60km/h", "A", 30}
}

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
tick = getTickCount()
local panel = false
local pytanie = 0
local poprawne = 0
local czassad = 0
local zdaje = false

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 24/zmienna)
local dxfont1_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 48/zmienna)
local dxfont2_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 50/zmienna)
local dxfont3_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 14/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 44/zmienna)



local marker=createMarker(1639.77, -1538.12, 13.64-1,"cylinder",1.5,90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Egzamin teoretyczny")
setElementData(marker,"mikona","")
local cub = createColCuboid(1638.35, -1539.19, 13.65-1, 5,5,4)

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
    if panel == "teoria" then 
        dxDrawImage(654/zmienna, 267/zmienna, 612/zmienna, 385/zmienna, "background.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

        exports["crime_gui"]:guitext("", 699/zmienna, 358/zmienna, 1225/zmienna, 473/zmienna, 255, 255, 255, alp2test, dxfont1_FA5, "center", "center")
        exports["crime_gui"]:guitext("", 699/zmienna, 358/zmienna, 1225/zmienna, 473/zmienna, 255, 255, 255, alp2test, dxfont1_FA5, "left", "center")
        exports["crime_gui"]:guitext("", 699/zmienna, 358/zmienna, 1225/zmienna, 473/zmienna, 255, 255, 255, alp2test, dxfont1_FA5, "right", "center")

        exports["crime_gui"]:guitext("B", 927/zmienna, 447/zmienna, 993/zmienna, 520/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
        exports["crime_gui"]:guitext("C", 716/zmienna, 453/zmienna, 782/zmienna, 526/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
        exports["crime_gui"]:guitext("A", 1144/zmienna, 447/zmienna, 1210/zmienna, 520/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")

        exports["crime_gui"]:guitext("- Każdy egzamin składa się z #5a379513 pytań.\n#cccccc- Jeżeli odpowiesz na minimum #5a379510#cccccc z nich poprawnie, zdasz.\n- Na start otrzymasz #5a379530 sekund#cccccc, z każdym następnym pytaniem\n dostaniesz bonusowy czas.", 676/zmienna, 488/zmienna, 1252/zmienna, 681/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "center", "center")
    end
    if panel == "pytania" then 
        dxDrawImage(654/zmienna, 223/zmienna, 612/zmienna, 485/zmienna, "background2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guitext("#5a3795"..pytanie.."#cccccc/13, #5a3795"..czassad.."#cccccc sekund", 632/zmienna, 310/zmienna, 1286/zmienna, 358/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold, "center", "center")
        exports["crime_gui"]:guitext("A:", 632/zmienna, 431/zmienna, 727/zmienna, 528/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
        exports["crime_gui"]:guitext("B:", 632/zmienna, 528/zmienna, 727/zmienna, 625/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
        exports["crime_gui"]:guitext("C:", 632/zmienna, 625/zmienna, 727/zmienna, 722/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
        if pytanie ~= 0 then 
            exports["crime_gui"]:guitextprawko(pytania[pytanie][2], 676/zmienna, 358/zmienna, 1239/zmienna, 431/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "center", "center") -- pytanie

            exports["crime_gui"]:guitextprawko(pytania[pytanie][3], 727/zmienna, 431/zmienna, 1286/zmienna, 528/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "center") -- A
            exports["crime_gui"]:guitextprawko(pytania[pytanie][4], 727/zmienna, 528/zmienna, 1286/zmienna, 625/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "center") -- B
            exports["crime_gui"]:guitextprawko(pytania[pytanie][5], 727/zmienna, 625/zmienna, 1286/zmienna, 722/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "center") -- C
        end
    end
end

--WLACZANIE TEORII
addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if veh then return end
    if not isElementWithinColShape(localPlayer,cub) then return end
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wlacza"
	addEventHandler("onClientRender",root,gui)
	panel = "teoria"
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
            timers = getTimers ( 1000.0169123321 )
            for timerKey, timerValue in ipairs(timers) do
                killTimer ( timerValue )
            end
            panel = false 
            pytanie = 0
            poprawne = 0
            czassad = 0
            zdaje = false
        end
    end, 500, 1)
end)

--Wybieranie kategorii
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(695/zmienna, 375/zmienna, 110/zmienna, 150/zmienna) and panel == "teoria" then -- C
            if zdaje ~= false then return end
            if getElementData(localPlayer,"player:teoria:pjC") == 1 then exports.crime_gui:addNoti("Posiadasz już teorię prawa jazdy kat. C.", "error") return end
            if getElementData(localPlayer,"player:license:pjC") == 1 then exports.crime_gui:addNoti("Posiadasz prawo jazdy kat. C.", "error") return end
            exports.crime_gui:addNoti("Rozpoczynasz egzamin teoretyczny kategorii C.", "info")
            tickistart = getTickCount()
			czas = 500
            progressdwa = "wylacza"
            zdaje = "C"
			setTimer(function()
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
                panel = "pytania"
                pytanie = 1
                czassad = 30
                setTimer(function()
                    czassad = czassad-1
                    if czassad <= 0 then 
                        timers = getTimers ( 1000.0169123321 )
                        for timerKey, timerValue in ipairs(timers) do
                            killTimer ( timerValue )
                        end
                        tickistart = getTickCount()
                        czas = 500
                        progressdwa = "wylacza"
                        guiSetInputMode("allow_binds")
                        showCursor (false)
                        exports.crime_gui:addNoti("Czas minął.", "error")
                        setTimer(function()
                            if isEventHandlerAdded("onClientRender", root, gui) then
                                removeEventHandler ("onClientRender", root, gui)
                                panel = false 
                                pytanie = 0
                                poprawne = 0
                                czassad = 0
                                zdaje = false
                            end
                        end, 500, 1)
                    end
                end, 1000.0169123321, 0)
            end, 500, 1)
        end
        if isMouseIn(907/zmienna, 375/zmienna, 110/zmienna, 150/zmienna) and panel == "teoria" then -- B
            if zdaje ~= false then return end
            if getElementData(localPlayer,"player:teoria:pjB") == 1 then exports.crime_gui:addNoti("Posiadasz już teorię prawa jazdy kat. B.", "error") return end
            if getElementData(localPlayer,"player:license:pjB") == 1 then exports.crime_gui:addNoti("Posiadasz prawo jazdy kat. B.", "error") return end
            exports.crime_gui:addNoti("Rozpoczynasz egzamin teoretyczny kategorii B.", "info")
            tickistart = getTickCount()
			czas = 500
            progressdwa = "wylacza"
            zdaje = "B"
			setTimer(function()
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
                panel = "pytania"
                czassad = 30
                pytanie = 1
                setTimer(function()
                    czassad = czassad-1
                    if czassad <= 0 then 
                        timers = getTimers ( 1000.0169123321 )
                        for timerKey, timerValue in ipairs(timers) do
                            killTimer ( timerValue )
                        end
                        tickistart = getTickCount()
                        czas = 500
                        progressdwa = "wylacza"
                        guiSetInputMode("allow_binds")
                        showCursor (false)
                        exports.crime_gui:addNoti("Czas minął.", "error")
                        setTimer(function()
                            if isEventHandlerAdded("onClientRender", root, gui) then
                                removeEventHandler ("onClientRender", root, gui)
                                panel = false 
                                pytanie = 0
                                poprawne = 0
                                czassad = 0
                                zdaje = false
                            end
                        end, 500, 1)
                    end
                end, 1000.0169123321, 0)
            end, 500, 1)
        end
        if isMouseIn(1118/zmienna, 375/zmienna, 110/zmienna, 150/zmienna) and panel == "teoria" then -- A
            if zdaje ~= false then return end
            if getElementData(localPlayer,"player:teoria:pjA") == 1 then exports.crime_gui:addNoti("Posiadasz już teorię prawa jazdy kat. A.", "error") return end
            if getElementData(localPlayer,"player:license:pjA") == 1 then exports.crime_gui:addNoti("Posiadasz prawo jazdy kat. A.", "error") return end
            exports.crime_gui:addNoti("Rozpoczynasz egzamin teoretyczny kategorii A.", "info")
            tickistart = getTickCount()
			czas = 500
            progressdwa = "wylacza"
            zdaje = "A"
			setTimer(function()
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
                panel = "pytania"
                czassad = 30
                pytanie = 1
                setTimer(function()
                    czassad = czassad-1
                    if czassad <= 0 then 
                        timers = getTimers ( 1000.0169123321 )
                        for timerKey, timerValue in ipairs(timers) do
                            killTimer ( timerValue )
                        end
                        tickistart = getTickCount()
                        czas = 500
                        progressdwa = "wylacza"
                        guiSetInputMode("allow_binds")
                        showCursor (false)
                        exports.crime_gui:addNoti("Czas minął.", "error")
                        setTimer(function()
                            if isEventHandlerAdded("onClientRender", root, gui) then
                                removeEventHandler ("onClientRender", root, gui)
                                panel = false 
                                pytanie = 0
                                poprawne = 0
                                czassad = 0
                                zdaje = false
                            end
                        end, 500, 1)
                    end
                end, 1000.0169123321, 0)
            end, 500, 1)
        end
    end
end)

--Wybieranie pytania
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(632/zmienna, 431/zmienna, 654/zmienna, 97/zmienna) and panel == "pytania" then -- A
            if pytania[pytanie][6] == "A" then 
                poprawne = poprawne+1
            end
            czassad = czassad+pytania[pytanie][7]
            pytanie = pytanie+1
            sprawdzczyzdal()
        end
        if isMouseIn(632/zmienna, 528/zmienna, 654/zmienna, 97/zmienna) and panel == "pytania" then -- B
            if pytania[pytanie][6] == "B" then 
                poprawne = poprawne+1
            end
            czassad = czassad+pytania[pytanie][7]
            pytanie = pytanie+1
            sprawdzczyzdal()
        end
        if isMouseIn(632/zmienna, 625/zmienna, 654/zmienna, 97/zmienna) and panel == "pytania" then -- C
            if pytania[pytanie][6] == "C" then 
                poprawne = poprawne+1
            end
            czassad = czassad+pytania[pytanie][7]
            pytanie = pytanie+1
            sprawdzczyzdal()
        end
    end
end)

function sprawdzczyzdal()
    if pytanie >= 14 then 
        if poprawne >= 10 then 
            exports.crime_gui:addNoti("Gratulacje, zdałeś egzamin teoretyczny z ilością punktów: "..poprawne.."/13.", "success")
            if zdaje then 
                setElementData(localPlayer,"player:teoria:pj"..zdaje.."",1)
            end
        else
            exports.crime_gui:addNoti("Niestety, oblałeś egzamin teoretyczny z ilością punktów: "..poprawne.."/13.", "error")
        end
        tickistart = getTickCount()
        czas = 500
        progressdwa = "wylacza"
        guiSetInputMode("allow_binds")
        showCursor (false)
        pytanie = 0
        poprawne = 0
        czassad = 0
        zdaje = false
        timers = getTimers ( 1000.0169123321 )
        for timerKey, timerValue in ipairs(timers) do
            killTimer ( timerValue )
        end
        setTimer(function()
            if isEventHandlerAdded("onClientRender", root, gui) then
                removeEventHandler ("onClientRender", root, gui)
                panel = false 
            end
        end, 500, 1)
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
