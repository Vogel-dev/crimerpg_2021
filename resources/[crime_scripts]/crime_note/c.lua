--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

--Nazwa,nazwaitemu,cena,lvl, wybrany
local notatka = {
}

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
tick = getTickCount()
local panel = false
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 23/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 13/zmienna)

local naekranie = 8
naekranie = naekranie-1
local obecnie = 1

local marker=createMarker(2478.67, -1565.12, 772.05-1,"cylinder",1.5,90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Odbierz przedmiot")
setElementData(marker,"mikona","")
local cub = createColCuboid(2477.60, -1566.65, 772.05-1, 5,5,4)

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

function gui()
    local ticki = getTickCount()
    if progressdwa == "wlacza" then
        local Progress = (ticki-tickistart)/czas
        local alp = 200
        local alp2 = 255
        if alp then alptest = alp else alp = 200 end 
        if alp2 then alp2test = alp2 else alp2 = 255 end
    else 
        local Progress = (ticki-tickistart)/czas
        local alp = 200
        local alp2 = 255
        if alp then alptest = alp else alp = 0 end 
        if alp2 then alp2test = alp2 else alp2 = 0 end
    end
    if panel == true then 
        dxDrawImage(632/zmienna, 207/zmienna, 612/zmienna, 674/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        -- exports["crime_gui"]:guibutton("Kup",708/zmienna, 810/zmienna, 200/zmienna, 57/zmienna, alp2test)
        exports["crime_gui"]:guitext("Witamy w świecie przestępczym. \nPrawdopodobnie jesteś już na miejscu, a ludzie Hugo Statford'a \ndowieźli cię do jego dziupli i kazali Ci się zmywać. \nNa początku skołuj jakiś pojazd publiczny i udaj się do urzędu. \nJak załatwisz już wszystkie formalności to idź do \ntych fagasów od prawa jazdy i pokaż im jak prowadzisz, bo \nsłyszałem że całkiem dobrze Ci to idzie. \nKolejnym krokiem powinno być podbicie do magazynu narkotykowego Ruda Rick'a, \nwstępnie opowiedziałem mu o Tobie i powinien czekać tam ze \nswoimi ludźmi na twoje przybycie. \nJak wyrobisz sobie u nich dobrą opinie to powinni Cię \nprzedstawić Olivierowi Felani, który wprowadzi cię do dillerki. \nUdaj się wtedy jeszcze najpierw do ekipy tych popierdoli z kanału i \nlepiej załatw sobie jakieś kopyto, bo na \nmieście kręci się wielu pojebów. \nPóźniej polataj trochę z tematem od Felani i jak \nzaczniesz budować sobie na mieście coraz silniejszą pozycję to \ndostaniesz dostęp do plantacji z ziołem u Diaz'a, a tam jest siana jak lodu. \nO reszcie działań będę Cię informował wkrótce. \nTrzymaj się i do szybkiego usłyszenia.",703/zmienna, 747/zmienna, 1191/zmienna, 338/zmienna , 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
        exports["crime_gui"]:guibutton("Zamknij",844/zmienna, 810/zmienna, 200/zmienna, 57/zmienna, alp2test)

        pasekpoprawej(naekranie,notatka,55,obecnie,1198,293+48)
		local liczmnie = 0
		for ID2=obecnie,naekranie+obecnie do
			liczmnie = liczmnie+1
			local space = 55*(liczmnie-1)
            if not notatka[ID2] then return end
            if notatka[ID2][5] == true then 
                dxDrawRectangle(685/zmienna, (293+space+20)/zmienna, 512/zmienna, 51/zmienna, tocolor(25, 25, 25, alptest), false)
                dxDrawRectangle(685/zmienna, (342+space+20)/zmienna, 512/zmienna, 2/zmienna, tocolor(90, 55, 150, alp2test), false)
            else
                dxDrawRectangle(685/zmienna, (293+space+20)/zmienna, 512/zmienna, 51/zmienna, tocolor(45, 45, 45, alptest), false)
                dxDrawRectangle(685/zmienna, (342+space+20)/zmienna, 512/zmienna, 2/zmienna, tocolor(90, 55, 150, alp2test), false)
            end
                --exports["crime_gui"]:guitext("Cena: #5a3795"..notatka[ID2][3].."$ #ccccccLevel: #5a3795"..notatka[ID2][4],685/zmienna, 297+space+20/zmienna, 1173/zmienna, 338+space+20/zmienna , 200, 200, 200, alp2test, dxfont1_FiraEC, "right", "center")
                --exports["crime_gui"]:guitext("Level: #5a3795"..notatka[ID2][4],685/zmienna, 297+space+20/zmienna, 1173/zmienna, 338+space+20/zmienna , 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")

        end
    end
end

--WLACZANIE
addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if veh then return end
    if not isElementWithinColShape(localPlayer,cub) then return end
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
        if isEventHandlerAdded("onClientRender", root, gui) then
            removeEventHandler ("onClientRender", root, gui)
            panel = false 
        end
end)

--Zaznaczenie skina
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(683/zmienna, (292+20)/zmienna, 514/zmienna, (381+55)/zmienna) and panel == true then
            for i,v in pairs(notatka) do 
                notatka[i][5] = false
            end
            liczmnie = 0
            for ID2=obecnie,naekranie+obecnie do
                liczmnie = liczmnie+1
                local space = 55*(liczmnie-1)
                if not notatka[ID2] then return end
                if isMouseIn(683/zmienna, (292+space+20)/zmienna, 512/zmienna, 51/zmienna) and panel == true then
                    notatka[ID2][5] = true
                end
            end
        end
    end
end)

--WYLACZENIE KLIK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(844/zmienna, 810/zmienna, 200/zmienna, 57/zmienna) and panel == true then
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wylacza"
            guiSetInputMode("allow_binds")
            showCursor (false)
                if isEventHandlerAdded("onClientRender", root, gui) then
                    removeEventHandler ("onClientRender", root, gui)
                    panel = false 
                end
        end
    end
end)

--KUP MNIE OK?
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(11708/zmienna, 810/zmienna, 200/zmienna, 57/zmienna) and panel == true then
            for i,v in pairs(notatka) do 
                if notatka[i][5] == true then
                    if getElementData(localPlayer,"player:lvl") < notatka[i][4] then exports.crime_gui:addNoti("Twój poziom jest za niski.", "error") return end
                    if getPlayerMoney(localPlayer) < notatka[i][3] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") else 
                        triggerServerEvent("server:buyitem", localPlayer, notatka[i][2], 1, notatka[i][3])
                    end
                end
            end
        end
    end
end)

function dogory() 
	if isMouseIn(683/zmienna, (292+20)/zmienna, 514/zmienna, (381+55)/zmienna) and panel == true then
    	if obecnie == 1 then return end
		obecnie = obecnie-1
	end
end

function dodolu()
	if isMouseIn(683/zmienna, (292+20)/zmienna, 514/zmienna, (381+55)/zmienna) and panel == true then
    	if obecnie+naekranie+1 > table.maxn(notatka) then return end
		obecnie = obecnie+1
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

