--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
local screenW, screenH = guiGetScreenSize()
zmienna = 1366/sx
zmiennadwa = 1920/sx
local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 24/zmienna)
local font_digital = dxCreateFont("f.ttf", 21/zmienna)
local font2 = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 14/zmienna)
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmiennadwa)
local cenalpg = 4
local cenabenzyna = 8
local cenadiesel = 10
panel = 0
tick = getTickCount()

function stacje()
	local veh = getPedOccupiedVehicle(localPlayer)
	if not veh then return end

	paliwo = getElementData(veh,"vehicle:fuel") or 0 
	typsilnika = getElementData(veh,"vehicle:typsilnika") or "Benzyna"
	lpg = getElementData(veh,"vehicle:lpg") or 0 
	lpgfuel = getElementData(veh,"vehicle:lpgfuel") or 0 
	bak = getElementData(veh,"vehicle:bak") or 25

	local ticki = getTickCount()
	if progressdwa == "wlacza" then
		local Progress = (ticki-tickistart)/czas
		local alp = 155
		local alp2 = 255
		if alp then alptest = alp else alp = 200 end 
		if alp2 then alp2test = alp2 else alp2 = 255 end
	else 
		local Progress = (ticki-tickistart)/czas
		local alp = 155
		local alp2 = 255
		if alp then alptest = alp else alp = 0 end 
		if alp2 then alp2test = alp2 else alp2 = 0 end
	end
	if panel == 1 then 
		dxDrawImage(678/zmiennadwa, 245/zmiennadwa, 612/zmiennadwa, 443/zmiennadwa, ":crime_gasstations/stacjawybor.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

		exports["crime_gui"]:guibutton("Diesel", 889/zmiennadwa, 349/zmiennadwa, 200/zmiennadwa, 60/zmiennadwa, alp2test)
		exports["crime_gui"]:guibutton("Benzyna", 889/zmiennadwa, 428/zmiennadwa, 200/zmiennadwa, 60/zmiennadwa, alp2test)
		exports["crime_gui"]:guibutton("LPG", 889/zmiennadwa, 507/zmiennadwa, 200/zmiennadwa, 60/zmiennadwa, alp2test)
		exports["crime_gui"]:guibutton("Zamknij", 889/zmiennadwa, 610/zmiennadwa, 200/zmiennadwa, 60/zmiennadwa, alp2test)
	end
	if panel == 2 then 
		local litry = getElementData(localPlayer,"litry") or 0
		if wybrane == "diesel" then
			cena = cenadiesel
			cenaf = litry*cena
			brakuje = bak-paliwo
			obl = paliwo+litry
			liniaf = 326*(obl/bak)
			paliwo = paliwo
		end
		if wybrane == "benzyna" then
			cena = cenabenzyna
			cenaf = litry*cena
			brakuje = bak-paliwo
			obl = paliwo+litry
			liniaf = 326*(obl/bak)
			paliwo = paliwo
		end
		if wybrane == "lpg" then
			cena = cenalpg
			cenaf = litry*cena
			brakuje = 100-lpgfuel
			obl = lpgfuel+litry
			liniaf = 326*(obl/bak)
			paliwo = lpgfuel
		end
	
		if liniaf > 326 then
			liniaf = 326
		end

		dxDrawImage(554/zmiennadwa, 152/zmiennadwa, 857/zmiennadwa, 620/zmiennadwa, "stacja.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		dxDrawImage(541/zmienna, 328/zmienna, 326/zmienna, 25/zmienna, "pasekfull.png", 0, 0, 0, tocolor(200, 200, 200, alptest), false)
		dxDrawImage(541/zmienna, 328/zmienna, liniaf/zmienna, 25/zmienna, "pasek.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)

		exports["crime_gui"]:guitext( " PLN", 627/zmienna, 209/zmienna, 636/zmienna, 259/zmienna, 200, 200, 200, alp2test, font_digital)
		exports["crime_gui"]:guitext(string.format("%.02f",cenaf), 636/zmienna, 209/zmienna, 802/zmienna, 259/zmienna, 200, 200, 200, alp2test, font_digital)
		exports["crime_gui"]:guitext("L", 597/zmienna, 259/zmienna, 636/zmienna, 309/zmienna, 200, 200, 200, alp2test, font_digital)
		exports["crime_gui"]:guitext(string.format("%.02f",litry), 636/zmienna, 259/zmienna, 802/zmienna, 309/zmienna, 200, 200, 200, alp2test, font_digital)
		if paliwo < 0 then paliwo = 0 end
		exports["crime_gui"]:guitext("W baku: "..string.format("%.02f",paliwo).."L", 601/zmienna, 374/zmienna, 808/zmienna, 415/zmienna, 200, 200, 200, alp2test, font_digital)
		exports["crime_gui"]:guitext("Aby uruchomić dystrybutor przytrzymaj\n spacje!", 601/zmienna, 620/zmienna, 808/zmienna, 415/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold)

		exports["crime_gui"]:guibutton("Zamknij", 546/zmienna, 442/zmienna, 134/zmienna, 41/zmienna, alp2test)
		exports["crime_gui"]:guibutton("Zatankuj", 727/zmienna, 442/zmienna, 134/zmienna, 41/zmienna, alp2test)
	end

end

--START
function startt()
	if getElementData(localPlayer,"tankuje") then
		local Timer = setTimer(function()	
			if wybrane == "diesel" then 
				local litry = getElementData(localPlayer,"litry")
				if litry + paliwo >= bak then return end
				setElementData(localPlayer,"litry",litry+0.11)
			end
			if wybrane == "benzyna" then 
				local litry = getElementData(localPlayer,"litry")
				if litry + paliwo >= bak then return end
				setElementData(localPlayer,"litry",litry+0.11)
			end
			if wybrane == "lpg" then 
				local litry = getElementData(localPlayer,"litry")
				if litry+lpgfuel >= 100 then return end
				setElementData(localPlayer,"litry",litry+0.11)
			end
		end, 40.01, 0 )
	end
end
--STOP
function stopt()
	if getElementData(localPlayer,"tankuje") then
		timers = getTimers ( 40.01 )
		for timerKey, timerValue in ipairs(timers) do
			  killTimer ( timerValue )
		end
	end
end

bindKey ( "space", "down", startt )
bindKey ( "space", "up", stopt )

addEventHandler("onClientMarkerHit",resourceRoot,function(e)
	if e==localPlayer then
		if getElementType(e)=="player" then
			if getPedOccupiedVehicle(e) then
				if getElementData(getPedOccupiedVehicle(e),"vehicle:fuel") then
					if getElementData(source,"stacja") then
						if not font then 
							font = dxCreateFont(":crime_speedmeter/Digital.ttf", 24/zmienna)
							font2 = dxCreateFont(":crime_speedmeter/Digital.ttf", 14/zmienna)
							dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 16/zmiennadwa)
						end


						setElementFrozen(getPedOccupiedVehicle(e),true)
						setElementFrozen(getPedOccupiedVehicle(e),false)
						tickistart = getTickCount()
						czas = 500
						progressdwa = "wlacza"
						showCursor(true)
						addEventHandler("onClientRender", root, stacje)
						panel = 1 
						setElementData(localPlayer,"tankuje",true)
						setElementData(localPlayer,"litry",0)
						setElementData(localPlayer,"cena",0)
						timers = getTimers ( 40.01 )
						for timerKey, timerValue in ipairs(timers) do
							  killTimer ( timerValue )
						end
					end
				end
			end
		end
	end
end)

addEventHandler("onClientMarkerLeave",resourceRoot,function(e)
	if e==localPlayer then
		if getElementData(source,"stacja") then
			guiSetInputMode("allow_binds")
			showCursor(false)
			setElementData(localPlayer,"tankuje",false)
			setElementData(localPlayer,"litry",0)
			setElementData(localPlayer,"cena",0)
			timers = getTimers ( 40.01 )
			for timerKey, timerValue in ipairs(timers) do
				  killTimer ( timerValue )
			end
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			showCursor (false)
				if isEventHandlerAdded("onClientRender", root, stacje) then
					removeEventHandler ("onClientRender", root, stacje)
					panel = 0
				end
		end
	end
end)

addEventHandler("onClientClick", root, function(btn,state) --off1
    if btn=="left" and state=="down" then
		if isMouseIn(889/zmiennadwa, 610/zmiennadwa, 200/zmiennadwa, 60/zmiennadwa) and panel == 1 then
			guiSetInputMode("allow_binds")
			showCursor(false)
			setElementData(localPlayer,"tankuje",false)
			setElementData(localPlayer,"litry",0)
			setElementData(localPlayer,"cena",0)
			timers = getTimers ( 40.01 )
			for timerKey, timerValue in ipairs(timers) do
					killTimer ( timerValue )
			end
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			showCursor (false)
				if isEventHandlerAdded("onClientRender", root, stacje) then
					removeEventHandler ("onClientRender", root, stacje)
					panel = 0
				end
        end
    end
end)

addEventHandler("onClientClick", root, function(btn,state) --diesel
    if btn=="left" and state=="down" then
		if isMouseIn(889/zmiennadwa, 349/zmiennadwa, 200/zmiennadwa, 60/zmiennadwa) and panel == 1 then
			if typsilnika ~= "Diesel" then exports.crime_gui:addNoti("Nie posiadasz silnika typu diesel.", "error")return end
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			wybrane = "diesel"
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				panel = 2
        end
    end
end)

addEventHandler("onClientClick", root, function(btn,state) --bena
    if btn=="left" and state=="down" then
		if isMouseIn(889/zmiennadwa, 428/zmiennadwa, 200/zmiennadwa, 60/zmiennadwa) and panel == 1 then
			if typsilnika ~= "Benzyna" then exports.crime_gui:addNoti("Nie posiadasz silnika typu benzynowego.", "error") return end
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			wybrane = "benzyna"
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				panel = 2
        end
    end
end)

addEventHandler("onClientClick", root, function(btn,state) --lpg
    if btn=="left" and state=="down" then
		if isMouseIn(889/zmiennadwa, 507/zmiennadwa, 200/zmiennadwa, 60/zmiennadwa) and panel == 1 then
			if lpg == 0 then exports.crime_gui:addNoti("Nie posiadasz zamontowanej instalacji LPG.", "error") return end
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			wybrane = "lpg"
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				panel = 2
        end
    end
end)

addEventHandler("onClientClick", root, function(btn,state) --off2
    if btn=="left" and state=="down" then
		if isMouseIn(546/zmienna, 442/zmienna, 134/zmienna, 41/zmienna) and panel == 2 then
			guiSetInputMode("allow_binds")
			showCursor(false)
			setElementData(localPlayer,"tankuje",false)
			setElementData(localPlayer,"litry",0)
			setElementData(localPlayer,"cena",0)
			timers = getTimers ( 40.01 )
			for timerKey, timerValue in ipairs(timers) do
					killTimer ( timerValue )
			end
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			showCursor (false)
				if isEventHandlerAdded("onClientRender", root, stacje) then
					removeEventHandler ("onClientRender", root, stacje)
					panel = 0
				end
        end
    end
end)

--TANKOWAIE

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(727/zmienna, 442/zmienna, 134/zmienna, 41/zmienna) and panel == 2 then
			if getPedOccupiedVehicle(localPlayer) then
				local ile = getElementData(localPlayer,"litry") or 0
				if ile == 0 then exports.crime_gui:addNoti("Nie nabiłeś nic na dystrybutor.", "error") return end
				triggerServerEvent("TANKUJ",localPlayer,ile,cena,wybrane,bak)
				setElementData(localPlayer,"litry",0)
				setElementData(localPlayer,"cena",0)
			end
		end
	end
end)



addEvent("TANKUJ",true)
addEventHandler("TANKUJ",root,function(ile,wybrane)
	if wybrane ~= "lpg" then 
		if source==localPlayer then
			local fuel=getElementData(getPedOccupiedVehicle(source),"vehicle:fuel")
			local brakuje = bak-fuel
			if ile > brakuje then
				setElementData(getPedOccupiedVehicle(source),"vehicle:fuel",getElementData(getPedOccupiedVehicle(source),"vehicle:bak"))
			else
				setElementData(getPedOccupiedVehicle(source),"vehicle:fuel",fuel+ile)
			end
		end
	else
		if source==localPlayer then
			local fuel=getElementData(getPedOccupiedVehicle(source),"vehicle:lpgfuel")
			local brakuje = 100-fuel
			if ile > brakuje then
				setElementData(getPedOccupiedVehicle(source),"vehicle:lpgfuel",100)
			else
				setElementData(getPedOccupiedVehicle(source),"vehicle:lpgfuel",fuel+ile)
			end
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

