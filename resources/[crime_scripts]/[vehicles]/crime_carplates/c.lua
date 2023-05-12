--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

--ID,MODEL,REJESTRACJA,onoff
local twojefury = {}

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
tick = getTickCount()
local panel = false
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 20/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 15/zmienna)
local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 22/zmienna)

local naekranie = 7
naekranie = naekranie-1
local obecnie = 1

local marker=createMarker(2563.95, -1639.79, 1672.15-1,"cylinder",1.5,90, 55, 150,1)
setElementInterior(marker, 1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Zmiana rejestracji pojazdu")
setElementData(marker,"mikona","")
local cub = createColCuboid(2563.95, -1639.79, 1672.15-1, 5,5,4)

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
    if panel == true then 
        dxDrawImage(634/zmienna, 214/zmienna, 612/zmienna, 665/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guibutton("Kup (#5a379530,000 PLN#cccccc)",708/zmienna, 810/zmienna, 200/zmienna, 57/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Zamknij",974/zmienna, 810/zmienna, 200/zmienna, 57/zmienna, alp2test)

        exports["crime_gui"]:createEditbox("rejestracje1", 808/zmienna, 723/zmienna, 260/zmienna, 55/zmienna, true, "", false, 8, font, true, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 60, true, "Nowa rejestracja", { 230, 230, 230, 255 }, true, 1, font, true, true, {255,255,255,0}, true)

        pasekpoprawej(naekranie,twojefury,55,obecnie,1198,293+48)
		local liczmnie = 0
		for ID2=obecnie,naekranie+obecnie do
			liczmnie = liczmnie+1
			local space = 55*(liczmnie-1)
            if not twojefury[ID2] then return end
            if twojefury[ID2][4] == true then 
                dxDrawRectangle(685/zmienna, (293+space+20)/zmienna, 512/zmienna, 51/zmienna, tocolor(25, 25, 25, alptest), false)
                dxDrawRectangle(685/zmienna, (342+space+20)/zmienna, 512/zmienna, 2/zmienna, tocolor(90, 55, 150, alp2test), false)
            else
                dxDrawRectangle(685/zmienna, (293+space+20)/zmienna, 512/zmienna, 51/zmienna, tocolor(45, 45, 45, alptest), false)
                dxDrawRectangle(685/zmienna, (342+space+20)/zmienna, 512/zmienna, 2/zmienna, tocolor(90, 55, 150, alp2test), false)
            end
                exports["crime_gui"]:guitext("Pojazd: #5a3795"..twojefury[ID2][2].." #cccccc[#5a3795"..twojefury[ID2][1].."#cccccc]",703/zmienna, (297+space+20)/zmienna, 1191/zmienna, (338+space+20)/zmienna , 200, 200, 200, alp2test, dxfont1_FiraEC, "left", "center")
                exports["crime_gui"]:guitext("Rejestracja: #5a3795"..twojefury[ID2][3].."",685/zmienna, (297+space+20)/zmienna, 1173/zmienna, (338+space+20)/zmienna , 200, 200, 200, alp2test, dxfont1_FiraEC, "right", "center")
        end
    end
end

--WLACZANIE
addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if veh then return end
    if not isElementWithinColShape(localPlayer,cub) then return end
    triggerServerEvent("wyszukajpojazdyrejka", localPlayer)
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
            exports["crime_gui"]:destroyEditbox("rejestracje1")
        end
    end, 500, 1)
end)

--Zaznaczenie skina
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(683/zmienna, (292+20)/zmienna, 514/zmienna, (381+55)/zmienna) and panel == true then
            for i,v in pairs(twojefury) do 
                twojefury[i][4] = false
            end
            liczmnie = 0
            for ID2=obecnie,naekranie+obecnie do
                liczmnie = liczmnie+1
                local space = 55*(liczmnie-1)
                if not twojefury[ID2] then return end
                if isMouseIn(683/zmienna, (292+space+20)/zmienna, 512/zmienna, 51/zmienna) and panel == true then
                    twojefury[ID2][4] = true
                end
            end
        end
    end
end)

--WYLACZENIE KLIK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(974/zmienna, 810/zmienna, 200/zmienna, 57/zmienna) and panel == true then
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wylacza"
            guiSetInputMode("allow_binds")
            showCursor (false)
            setTimer(function()
                if isEventHandlerAdded("onClientRender", root, gui) then
                    removeEventHandler ("onClientRender", root, gui)
                    panel = false 
                    exports["crime_gui"]:destroyEditbox("rejestracje1")
                end
            end, 500, 1)
        end
    end
end)

--KUP MNIE OK?
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(708/zmienna, 810/zmienna, 200/zmienna, 57/zmienna) and panel == true then
            for i,v in pairs(twojefury) do 
                if twojefury[i][4] == true then
                    local text = exports["crime_gui"]:getEditboxText("rejestracje1") or ""
                    if text == "" then exports.srnoti:create_alert('error','Wprowadź poprawną rejestracje!') return end 
                    if string.find(text,"  ") then exports.srnoti:create_alert('error','Rejestracja nie może posiadać więcej niż 2 spacje!') return end 
                    triggerServerEvent("zmienrejka", localPlayer, twojefury[i][1], text)
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
    	if obecnie+naekranie+1 > table.maxn(twojefury) then return end
		obecnie = obecnie+1
	end
end
bindKey ("mouse_wheel_up", "down", dogory )
bindKey ("mouse_wheel_down", "down", dodolu )

addEvent("rejki:dotabeli", true)
addEventHandler("rejki:dotabeli", root, function(result)
    if not result then return end
    twojefury = {}
	for i,v in pairs(result) do
		local autoxd = getVehicleNameFromModel(v["model"])
        local autoxdd = autoxd
        modelname = exports["crime_modelnames"]
		autoxdd = modelname:getText(autoxdd)
        --if autoxd == "Jester" then autoxdd = "Toyota Supra" end
        
		table.insert(twojefury, {v["id"], autoxdd, v["rejestracja"],false})
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