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

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 18/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 14/zmienna)


local marker=createMarker(2352.61, -1899.50, 13.55-1,"cylinder",3, 90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Złomowanie pojazdu")
setElementData(marker,"mikona","")
local cub = createColCuboid(2352.87, -1899.70-2, 13.20-1, 9,9,4)

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
        dxDrawImage(654/zmienna, 339/zmienna, 612/zmienna, 270/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guitext("#FF0000UWAGA!\n#ccccccZa zezłomowanie pojazdu tylko otrzymasz #5a37955.000 PLN\n#ccccccZłomowanie jest nieodwracalne!", 714/zmienna, 441/zmienna, 1214/zmienna, 527/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "top")

        exports["crime_gui"]:guibutton("Złomuj",969/zmienna, 549/zmienna, 164/zmienna, 49/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Anuluj",787/zmienna, 549/zmienna, 164/zmienna, 49/zmienna, alp2test)
    end
end


--WLACZANIE
addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if not veh then return end
    if not isElementWithinColShape(localPlayer,cub) then return end
    local seat = getPedOccupiedVehicleSeat(localPlayer) 
    if seat ~= 0 then return end
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
        if isMouseIn(787/zmienna, 549/zmienna, 164/zmienna, 49/zmienna) and panel == true then
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


--Złomuj
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(969/zmienna, 549/zmienna, 164/zmienna, 49/zmienna) and panel == true then
            local veh=getPedOccupiedVehicle(localPlayer)
            if not veh then return end
            if getElementData(veh,"publiczny") == true then exports.srnoti:create_alert('error','Ten pojazd jest publiczny!') return end
			if not getElementData(veh,"vehicle:id") then exports.srnoti:create_alert('error','Ten pojazd nie posiada ID!') return end
			if getElementData(veh,"vehicle:ownedPlayer") ~= getElementData(localPlayer,"player:uid") then exports.srnoti:create_alert('error','Ten pojazd nie jest twój!') return end
            triggerServerEvent("zlomujgruza", localPlayer, veh)
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

