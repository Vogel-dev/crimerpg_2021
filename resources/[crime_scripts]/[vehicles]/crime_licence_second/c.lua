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
local zdaje = false

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 24/zmienna)
local dxfont1_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 48/zmienna)
local dxfont2_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 50/zmienna)
local dxfont3_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 14/zmienna)

local marker=createMarker(1644.69, -1538.19, 13.64-1,"cylinder",1.5, 90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Egzamin praktyczny")
setElementData(marker,"mikona","")
local cub = createColCuboid(1642.70, -1539.52, 13.65-1, 5,5,4)

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
    if panel == "praktyka" then 
        dxDrawImage(654/zmienna, 267/zmienna, 612/zmienna, 385/zmienna, "background.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

        exports["crime_gui"]:guitext("", 699/zmienna, 358/zmienna, 1225/zmienna, 473/zmienna, 200, 200, 200, alp2test, dxfont1_FA5, "center", "center")
        exports["crime_gui"]:guitext("", 699/zmienna, 358/zmienna, 1225/zmienna, 473/zmienna, 200, 200, 200, alp2test, dxfont1_FA5, "left", "center")
        exports["crime_gui"]:guitext("", 699/zmienna, 358/zmienna, 1225/zmienna, 473/zmienna, 200, 200, 200, alp2test, dxfont1_FA5, "right", "center")

        exports["crime_gui"]:guitext("B", 927/zmienna, 447/zmienna, 993/zmienna, 520/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
        exports["crime_gui"]:guitext("C", 716/zmienna, 453/zmienna, 782/zmienna, 526/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")
        exports["crime_gui"]:guitext("A", 1144/zmienna, 447/zmienna, 1210/zmienna, 520/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "center", "center")

        exports["crime_gui"]:guitext("- Każdy egzamin składa się z #5a3795placu manewrowego #ccccccoraz #5a3795jazdy na mieście.\n#cccccc- Jeżeli wykonasz prawidłowo zadania #5a3795egzaminatora#cccccc, zdasz.", 676/zmienna, 488/zmienna, 1252/zmienna, 681/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "center", "center")
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
	panel = "praktyka"
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
            zdaje = false
        end
    end, 500, 1)
end)

--Wybieranie kategorii
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(695/zmienna, 375/zmienna, 110/zmienna, 150/zmienna) and panel == "praktyka" then -- C
            if zdaje ~= false then return end
            if getElementData(localPlayer,"player:teoria:pjC") ~= 1 then exports.crime_gui:addNoti("Nie posiadasz zdanej teorii prawa jazdy kat. C.", "error") return end
            if getElementData(localPlayer,"player:license:pjC") == 1 then exports.crime_gui:addNoti("Posiadasz prawo jazdy kat. C.", "error") return end
            exports.crime_gui:addNoti("Rozpoczynasz egzamin praktyczny kategorii C.", "info")
            triggerServerEvent("license:do", resourceRoot, 0, "C")
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wylacza"
            guiSetInputMode("allow_binds")
            showCursor (false)
            zdaje = true
            setTimer(function()
                if isEventHandlerAdded("onClientRender", root, gui) then
                    removeEventHandler ("onClientRender", root, gui)
                    panel = false 
                    zdaje = false
                end
            end, 500, 1)
        end
        if isMouseIn(907/zmienna, 375/zmienna, 110/zmienna, 150/zmienna) and panel == "praktyka" then -- B
            if zdaje ~= false then return end
            if getElementData(localPlayer,"player:teoria:pjB") ~= 1 then exports.crime_gui:addNoti("Nie posiadasz zdanej teorii prawa jazdy kat. B.", "error") return end
            if getElementData(localPlayer,"player:license:pjB") == 1 then exports.crime_gui:addNoti("Posiadasz prawo jazdy kat. B.", "error") return end
            exports.crime_gui:addNoti("Rozpoczynasz egzamin praktyczny kategorii B.", "info")
            triggerServerEvent("license:do", resourceRoot, 0, "B")
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wylacza"
            guiSetInputMode("allow_binds")
            showCursor (false)
            zdaje = true
            setTimer(function()
                if isEventHandlerAdded("onClientRender", root, gui) then
                    removeEventHandler ("onClientRender", root, gui)
                    panel = false 
                    zdaje = false
                end
            end, 500, 1)
        end
        if isMouseIn(1118/zmienna, 375/zmienna, 110/zmienna, 150/zmienna) and panel == "praktyka" then -- A
            if zdaje ~= false then return end
            if getElementData(localPlayer,"player:teoria:pjA") ~= 1 then exports.crime_gui:addNoti("Nie posiadasz zdanej teorii prawa jazdy kat. A.", "error") return end
            if getElementData(localPlayer,"player:license:pjA") == 1 then exports.crime_gui:addNoti("Posiadasz prawo jazdy kat. A.", "error") return end
            exports.crime_gui:addNoti("Rozpoczynasz egzamin praktyczny kategorii A.", "info")
            triggerServerEvent("license:do", resourceRoot, 0, "A")
            tickistart = getTickCount()
            czas = 500
            progressdwa = "wylacza"
            guiSetInputMode("allow_binds")
            showCursor (false)
            zdaje = true
            setTimer(function()
                if isEventHandlerAdded("onClientRender", root, gui) then
                    removeEventHandler ("onClientRender", root, gui)
                    panel = false 
                    zdaje = false
                end
            end, 500, 1)
        end
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
