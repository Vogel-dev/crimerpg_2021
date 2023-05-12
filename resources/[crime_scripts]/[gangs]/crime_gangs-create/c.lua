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

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 20/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)
local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 22/zmienna)

local marker=createMarker(2563.87, -1635.24, 1672.15-1,"cylinder",1.5,90, 55, 150,1)
setElementInterior(marker, 1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Zakładanie organizacji")
setElementData(marker,"mikona","")
local cub = createColCuboid(2563.87, -1635.24, 1672.15-1, 5,5,4)

function gui()
	if panel == true then 
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


		dxDrawImage(657/zmienna, 351/zmienna, 612/zmienna, 346/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

		exports["crime_gui"]:guitext("Cena: #5a3795120.000 PLN#cccccc\nWymagania:\n#5a379575lvl", 691/zmienna, 445/zmienna, 1231/zmienna, 580/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "top")

		exports["crime_gui"]:createEditbox("orgnazwa", 822/zmienna, 560/zmienna, 278/zmienna, 44/zmienna, true, "", false, 14, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Nazwa", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)

		exports["crime_gui"]:guibutton("Zamknij",754/zmienna, 632/zmienna, 182/zmienna, 55/zmienna, alp2test)
		exports["crime_gui"]:guibutton("Stwórz",985/zmienna, 632/zmienna, 182/zmienna, 55/zmienna, alp2test)
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
    setTimer(function()
        if isEventHandlerAdded("onClientRender", root, gui) then
            removeEventHandler ("onClientRender", root, gui)
			panel = false 
			exports["crime_gui"]:destroyEditbox("orgnazwa")
        end
    end, 500, 1)
end)

--WYLACZANIE BUTTON
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(754/zmienna, 632/zmienna, 182/zmienna, 55/zmienna) and panel == true then
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			showCursor (false)
			setTimer(function()
				if isEventHandlerAdded("onClientRender", root, gui) then
					removeEventHandler ("onClientRender", root, gui)
					panel = false 
					exports["crime_gui"]:destroyEditbox("orgnazwa")
				end
			end, 500, 1)
        end
    end
end)

--Tworzenie
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(985/zmienna, 632/zmienna, 182/zmienna, 55/zmienna) and panel == true then
			local nazwaorg=exports["crime_gui"]:getEditboxText("orgnazwa")
			if not nazwaorg or removeHex(nazwaorg) == "" then exports.crime_gui:addNoti("Wpisz nazwę organizacji.", "error") return end
			if string.len(removeHex(nazwaorg)) < 3 then exports.crime_gui:addNoti("Nazwa organizacji powinna mieć minimum 3 znaki.", "error") return end
			if getElementData(localPlayer,"player:organization") then exports.crime_gui:addNoti("Jesteś już w jakiejś organizacji.", "error") return end 
			if getElementData(localPlayer,"player:lvl") < 75 then exports.crime_gui:addNoti("Nie posiadasz 75lvl.", "error") return end
			if getPlayerMoney(localPlayer) < 125000 then exports.crime_gui:addNoti("Nie posiadasz 125.000 PLN", "error") return end
			triggerServerEvent("org:tworzenie",localPlayer, nazwaorg)
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


function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end