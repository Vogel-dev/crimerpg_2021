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
tick = getTickCount()
local screenX, screenY = guiGetScreenSize()
local screenSource = dxCreateScreenSource(screenX, screenY)

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmienna)

local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 15/zmienna)
local font2 = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 23/zmienna)
local start = getTickCount()

cena = 0
czas = 0
typ = ""

mistrzowie = {
    {2229.96, -1721.31, 13.57,130,"boksu", 2229.37, -1722.06, 13.57, 2, 2000},
    {360.07, -2071.05, 10.70,180,"kung-fu", 360.06, -2072.57, 10.70, 4, 5000},
    {2495.38, -1691.14, 14.77,0,"walki ulicznej", 2495.32, -1689.79, 14.65, 2, 1500},
    {1106.55, -299.66, 74.54,90,"kickboxingu", 1104.99, -299.66, 74.54, 1, 7000},
}

for i,v in pairs(mistrzowie) do 
    local ped = createPed(132,mistrzowie[i][1],mistrzowie[i][2],mistrzowie[i][3],mistrzowie[i][4],true)
    local marker = createMarker(mistrzowie[i][6],mistrzowie[i][7],mistrzowie[i][8]-1,"cylinder", 1.2, 90, 55, 150,0)
    setElementFrozen(ped,true)
    setElementData(marker,"nauka",mistrzowie[i][5])
    setElementData(marker,"cena",mistrzowie[i][10])
    setElementData(marker,"czas",mistrzowie[i][9])
end

function gui()
    if onoff == true then 
        local ticki = getTickCount()
        if progressdwa == "wlacza" then
            local Progress = (ticki-tickistart)/czasdupa
            local alp = interpolateBetween(0,0,0,200,0,0,Progress,"Linear")
            local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
            if alp then alptest = alp else alp = 200 end 
            if alp2 then alp2test = alp2 else alp2 = 255 end
        else 
            local Progress = (ticki-tickistart)/czasdupa
            local alp = interpolateBetween(200,0,0,0,0,0,Progress,"Linear")
            local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
            if alp then alptest = alp else alp = 0 end 
            if alp2 then alp2test = alp2 else alp2 = 0 end
        end
        dxDrawImage(659/zmienna, 229/zmienna, 612/zmienna, 398/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

        exports["crime_gui"]:guitext("U tej osoby możesz się nauczyć #5a3795"..typ.."\n#ccccccaby to zrobić kliknij poniższy przycisk.\n\nInformacje:\nCena: #5a3795"..cena.." PLN#cccccc\nCzas oczekiwania: #5a3795"..czas.." minuty\n#ccccccAby walczyć tą techniką klikaj#5a3795 PPM+F", 748/zmienna, 326/zmienna, 1185/zmienna, 525/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "top")

        exports["crime_gui"]:guibutton("Zamknij", 789/zmienna, 568/zmienna, 163/zmienna, 49/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Naucz się", 983/zmienna, 568/zmienna, 163/zmienna, 49/zmienna, alp2test)
    end
end

function guidwa()
    local ticki = getTickCount()
    if progressdwa == "wlacza" then
        local Progress = (ticki-tickistart)/czasdupa
        local alp = interpolateBetween(0,0,0,200,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 200 end 
        if alp2 then alp2test = alp2 else alp2 = 255 end
    else 
        local Progress = (ticki-tickistart)/czasdupa
        local alp = interpolateBetween(200,0,0,0,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 0 end 
        if alp2 then alp2test = alp2 else alp2 = 0 end
    end
	if (blackWhiteShader) then
		dxUpdateScreenSource(screenSource)     
		dxSetShaderValue(blackWhiteShader, "screenSource", screenSource)
		dxDrawImage(0, 0, screenX, screenY, blackWhiteShader)
	end

	local now = getTickCount()
    local endTime = start + 1300
    local elapsedTime = now - start
    local duration = endTime - start
    local progress = elapsedTime / duration
    local posX, posY, posZ = interpolateBetween ( 0,0,0,360,0,0, progress, "Linear")
    if posX == 360 then 
        start = getTickCount()
    end
    dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, "cwiczse.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
    dxDrawImage(910/zmienna, 619/zmienna, 100/zmienna, 100/zmienna, ":crime_files/core/wheel.png", posX, 0, 0, tocolor(255, 255, 255, alp2test), false)
    exports["crime_gui"]:guitext("Uczysz się walczyć, musisz jeszcze odczekać "..string.format("%.00f",czasdupcia).." sekund.", 455/zmienna, 510/zmienna, 1465/zmienna, 619/zmienna, 200, 200, 200, alp2test, font2)


end

addEventHandler("onClientMarkerHit", root, function(el,md)
    if getElementData(source,"nauka") then 
        if el~=localPlayer then return end
        local veh=getPedOccupiedVehicle(localPlayer)
        if veh then return end
        onoff = true
        tickistart = getTickCount()
        czasdupa = 500
        progressdwa = "wlacza"
        addEventHandler("onClientRender",root,gui)
        showCursor(true)
        cena = getElementData(source,"cena")
        czas = getElementData(source,"czas")
        typ = getElementData(source,"nauka")
    end
end)

addEventHandler("onClientMarkerLeave", root, function(el,md)
    if getElementData(source,"nauka") then 
        if el~=localPlayer then return end
        tickistart = getTickCount()
        czasdupa = 500
        progressdwa = "wlacza"
        showCursor(false)
        setTimer(function()
            if isEventHandlerAdded("onClientRender", root, gui) then
                removeEventHandler ("onClientRender", root, gui)
                onoff = false 
            end
        end, 500, 1)
    end
end)


--off
addEventHandler("onClientClick", root, function(btn,state)
	if btn=="left" and state=="down" then
		if isMouseIn(789/zmienna, 568/zmienna, 163/zmienna, 49/zmienna) and onoff == true then
            tickistart = getTickCount()
            czasdupa = 500
            progressdwa = "wylacza"
            showCursor(false)
            setTimer(function()
                if isEventHandlerAdded("onClientRender", root, gui) then
                    removeEventHandler ("onClientRender", root, gui)
                    onoff = false 
                end
            end, 500, 1)
		end
    end
end)

--nauka
addEventHandler("onClientClick", root, function(btn,state)
	if btn=="left" and state=="down" then
		if isMouseIn(983/zmienna, 568/zmienna, 163/zmienna, 49/zmienna) and onoff == true then
            tickistart = getTickCount()
            czasdupa = 500
            progressdwa = "wylacza"
            showCursor(false)
            setElementFrozen(localPlayer,true)
            setTimer(function()
                if isEventHandlerAdded("onClientRender", root, gui) then
                    removeEventHandler ("onClientRender", root, gui)
                    onoff = false 
                end
            end, 500, 1)

            --funkcja
            blackWhiteShader, blackWhiteTec = dxCreateShader(":crime_files/shaders/blackwhite.fx")
            tickistart = getTickCount()
            czasdupa = 1500
            progressdwa = "wlacza"
            addEventHandler("onClientRender",root,guidwa)
            czasdupcia = 60*czas
            setTimer ( function()
                czasdupcia = czasdupcia-1
                if czasdupcia <= 0 then
                    
                removeEventHandler("onClientRender",root,guidwa)
                
                setElementFrozen(localPlayer,false)
                setElementHealth(localPlayer,100)
                if typ == "boksu" then 
                    triggerServerEvent("nauczylessielol", localPlayer, 5, cena)
                end
                if typ == "kung-fu" then 
                    triggerServerEvent("nauczylessielol", localPlayer, 6, cena)
                end
                if typ == "kickboxingu" then 
                    triggerServerEvent("nauczylessielol", localPlayer, 7, cena)
                end
                if typ == "walki ulicznej" then 
                    triggerServerEvent("nauczylessielol", localPlayer, 15, cena)
                end
                exports.crime_gui:addNoti("Nauczyłeś się "..typ..".", "success")
                end
            end, 1000.0121, 60*czas )

		end
    end
end)

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
