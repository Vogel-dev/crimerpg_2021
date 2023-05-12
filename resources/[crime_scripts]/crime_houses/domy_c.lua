--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 23/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 17/zmienna)
local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 22/zmienna)
local panel = false
local tekst = ""

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
	if panel == 1 then --Dom bez wlasciciela
		dxDrawImage(744/zmienna, 246/zmienna, 490/zmienna, 312/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		exports["crime_gui"]:guitext(tekst, 734/zmienna, 343/zmienna, 1247/zmienna, 404/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC)

		exports["crime_gui"]:guibutton( "Zobacz Dom", 769/zmienna, 487/zmienna, 185/zmienna, 54/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Kup Dom", 1024/zmienna, 487/zmienna, 185/zmienna, 54/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Zamknij", 894/zmienna, 429/zmienna, 185/zmienna, 54/zmienna, alp2test)
	end
	if panel == 2 then --Dom z wlascicielem ale ty jestes
		dxDrawImage(744/zmienna, 238/zmienna, 490/zmienna, 377/zmienna, "window2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

		exports["crime_gui"]:guitext(tekst, 734/zmienna, 343/zmienna, 1247/zmienna, 404/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC)

		exports["crime_gui"]:guibutton( "Przedłuż", 769/zmienna, 487/zmienna, 185/zmienna, 54/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Wejdź", 1024/zmienna, 487/zmienna, 185/zmienna, 54/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Zamknij", 894/zmienna, 429/zmienna, 185/zmienna, 54/zmienna, alp2test)
		if a_dom and a_dom.zamkniety == true then
			exports["crime_gui"]:guibutton( "Otwórz drzwi", 769/zmienna, 547/zmienna, 185/zmienna, 54/zmienna, alp2test)
		else
			exports["crime_gui"]:guibutton( "Zamknij drzwi", 769/zmienna, 547/zmienna, 185/zmienna, 54/zmienna, alp2test)
		end
		exports["crime_gui"]:guibutton( "Zwolnij", 1024/zmienna, 547/zmienna, 185/zmienna, 54/zmienna, alp2test)
	end
	if panel == 3 then --Kupowanie domu
		dxDrawImage(744/zmienna, 238/zmienna, 490/zmienna, 377/zmienna, "window2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		exports["crime_gui"]:guitext(tekst, 734/zmienna, 343/zmienna, 1247/zmienna, 404/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC)

		exports["crime_gui"]:guibutton( "Kup", 769/zmienna, 519/zmienna, 185/zmienna, 54/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Zamknij", 1031/zmienna, 519/zmienna, 185/zmienna, 54/zmienna, alp2test)

		exports["crime_gui"]:createEditbox("domy1", 814/zmienna, 430/zmienna, 349/zmienna, 45/zmienna, true, "", false, 25, font, true, 0, { 200, 200, 200, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 60, true, "Ilość dni", { 200, 200, 200, 255 }, true, 1, font, true, true, {255,255,255,0}, true)
	end
	if panel == 4 then --Przedłużanie domu
		dxDrawImage(744/zmienna, 238/zmienna, 490/zmienna, 377/zmienna, "window2.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		exports["crime_gui"]:guitext(tekst, 734/zmienna, 343/zmienna, 1247/zmienna, 404/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC)

		exports["crime_gui"]:guibutton( "Przedłuż", 769/zmienna, 519/zmienna, 185/zmienna, 54/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Zamknij", 1031/zmienna, 519/zmienna, 185/zmienna, 54/zmienna, alp2test)

		exports["crime_gui"]:createEditbox("domy1", 814/zmienna, 430/zmienna, 349/zmienna, 45/zmienna, true, "", false, 25, font, true, 0, { 200, 200, 200, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 60, true, "Ilość dni", { 200, 200, 200, 255 }, true, 1, font, true, true, {255,255,255,0}, true)
	end
	if panel == 5 then --Dom z wlascicielem ale ty nim nie jesteś
		dxDrawImage(744/zmienna, 246/zmienna, 490/zmienna, 312/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		exports["crime_gui"]:guitext(tekst, 734/zmienna, 343/zmienna, 1247/zmienna, 404/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC)

		exports["crime_gui"]:guibutton( "Wejdź", 769/zmienna, 487/zmienna, 185/zmienna, 54/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Zamknij", 1024/zmienna, 487/zmienna, 185/zmienna, 54/zmienna, alp2test)
	end
end

addEventHandler("onClientClick", root, function(btn,state)
	if btn=="left" and state=="down" then
		--panel1
		if isMouseIn(769/zmienna, 487/zmienna, 185/zmienna, 54/zmienna) and panel == 1 then -- zobacz dom
			if not a_dom.ownerid then
				triggerServerEvent("moveMeTo", resourceRoot, a_dom.interior_loc[1], a_dom.interior_loc[2], a_dom.interior_loc[3], a_dom.interior, a_dom.dimension)
			end
		end
		if isMouseIn(1024/zmienna, 487/zmienna, 185/zmienna, 54/zmienna) and panel == 1 then -- kup dom
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				panel = 3
				koszcik = a_dom.koszt/10
				tekst="#ccccccTyp: #5a3795"..a_dom.descr.."\n#ccccccCena za dzień: #5a3795"..koszcik.." PLN"
			end, 500, 1)
		end
		if isMouseIn(894/zmienna, 429/zmienna, 185/zmienna, 54/zmienna) and panel == 1 then -- zamknij
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui)
				tekst=""
				panel = false
			end, 500, 1)
		end
		--panel2
		if isMouseIn(769/zmienna, 487/zmienna, 185/zmienna, 54/zmienna) and panel == 2 then -- przedłuż
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				panel = 4
				koszcik = a_dom.koszt/10
				tekst="#ccccccTyp: #5a3795"..a_dom.descr.."\n#ccccccCena za dzień: #5a3795"..koszcik.." PLN"
			end, 500, 1)
		end
		if isMouseIn(1024/zmienna, 487/zmienna, 185/zmienna, 54/zmienna) and panel == 2 then -- wejdź
			local dbid=getElementData(localPlayer,"player:uid")
			if not a_dom.zamkniety or a_dom.ownerid==dbid then
				triggerServerEvent("moveMeTo", resourceRoot, a_dom.interior_loc[1], a_dom.interior_loc[2], a_dom.interior_loc[3], a_dom.interior, a_dom.dimension)
			elseif a_dom.zamkniety then
				exports.crime_gui:addNoti("Dom jest zamknięty.", "error")
			end
		end
		if isMouseIn(894/zmienna, 429/zmienna, 185/zmienna, 54/zmienna) and panel == 2 then -- zamknij panel
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui)
				tekst=""
				panel = false
			end, 500, 1)
		end
		if isMouseIn(769/zmienna, 547/zmienna, 185/zmienna, 54/zmienna) and panel == 2 then -- zamknij/otwórz
			if not a_dom then return end
			local dbid=getElementData(localPlayer,"player:uid")
			if not dbid then return end
			if dbid~=a_dom.ownerid then return end
			if a_dom.zamkniety == true then
				triggerServerEvent("onHouseChangeOptions", resourceRoot, a_dom.id, "zamkniety", false)
				exports.crime_gui:addNoti("Otworzyłeś dom.", "info")
			elseif a_dom.zamkniety == false then
				triggerServerEvent("onHouseChangeOptions", resourceRoot, a_dom.id, "zamkniety", true)
				exports.crime_gui:addNoti("Zamknąłeś dom.", "info")
			end
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui)
				tekst=""
				panel = false
			end, 500, 1)
		end
		if isMouseIn(1024/zmienna, 547/zmienna, 185/zmienna, 54/zmienna) and panel == 2 then -- zwolnij
			if not a_dom then return end
			local dbid=getElementData(localPlayer,"player:uid")
			if not dbid then return end
			if dbid~=a_dom.ownerid then return end
			triggerServerEvent("onHouseChangeOptions", resourceRoot, a_dom.id, "zwolnij", true)
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui)
				tekst=""
				panel = false
			end, 500, 1)
		end
		--panel3
		if isMouseIn(769/zmienna, 519/zmienna, 185/zmienna, 54/zmienna) and panel == 3 then -- kup
			local uid = getElementData(localPlayer,"player:uid")
			if not uid then return end
			dni = exports["crime_gui"]:getEditboxText("domy1") or ""
			if dni == "" then exports.crime_gui:addNoti("Wpisz liczbę dni.", "error") return end
			if not tonumber(dni) then exports.crime_gui:addNoti("Wpisz liczbę dni.", "error") return end 
			dni = tonumber(dni)
			if dni < 1 then exports.crime_gui:addNoti("Wpisz liczbę dni.", "error") return end
			zadzien = a_dom.koszt/10
			iddomu = a_dom.id
			cenazadni = dni*zadzien
			kesz = getPlayerMoney(localPlayer)
			brakuje = cenazadni-kesz
			if cenazadni > kesz then exports.crime_gui:addNoti("Nie posiadasz tylu pieniędzy, brakuje Ci "..brakuje.." PLN.", "error") return end
			triggerServerEvent("onHousePaymentRequest", getRootElement(), tonumber(iddomu), tonumber(dni))
			triggerServerEvent("onHouseChangeOptions", resourceRoot, iddomu, "zamkniety", false)
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui)
				tekst=""
				panel = false
				exports["crime_gui"]:destroyEditbox("domy1")
			end, 500, 1)
		end
		if isMouseIn(1031/zmienna, 519/zmienna, 185/zmienna, 54/zmienna) and panel == 3 then -- Zamknij
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui)
				tekst=""
				panel = false
				exports["crime_gui"]:destroyEditbox("domy1")
			end, 500, 1)
		end
		--panel4
		if isMouseIn(769/zmienna, 519/zmienna, 185/zmienna, 54/zmienna) and panel == 4 then -- przedłuż
			local uid = getElementData(localPlayer,"player:uid")
			if not uid then return end
			dni = exports["crime_gui"]:getEditboxText("domy1") or ""
			if dni == "" then exports.crime_gui:addNoti("Wpisz liczbę dni.", "error") return end
			if not tonumber(dni) then exports.crime_gui:addNoti("Wpisz liczbę dni.", "error") return end 
			dni = tonumber(dni)
			if dni < 1 then exports.crime_gui:addNoti("Wpisz liczbę dni.", "error") return end
			zadzien = a_dom.koszt/10
			iddomu = a_dom.id
			cenazadni = dni*zadzien
			kesz = getPlayerMoney(localPlayer)
			brakuje = cenazadni-kesz
			if cenazadni > kesz then exports.crime_gui:addNoti("Nie posiadasz tylu pieniędzy, brakuje Ci "..brakuje.." PLN.", "error") return end
			triggerServerEvent("onHousePaymentRequestPrzedluz", getRootElement(), tonumber(iddomu), tonumber(dni))
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui)
				tekst=""
				panel = false
				exports["crime_gui"]:destroyEditbox("domy1")
			end, 500, 1)
		end
		if isMouseIn(1031/zmienna, 519/zmienna, 185/zmienna, 54/zmienna) and panel == 4 then -- Zamknij
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui)
				tekst=""
				panel = false
				exports["crime_gui"]:destroyEditbox("domy1")
			end, 500, 1)
		end
		--panel5
		if isMouseIn(769/zmienna, 487/zmienna, 185/zmienna, 54/zmienna) and panel == 5 then -- wejdź
			local dbid=getElementData(localPlayer,"player:uid")
			if not a_dom.zamkniety or a_dom.ownerid==dbid then
				triggerServerEvent("moveMeTo", resourceRoot, a_dom.interior_loc[1], a_dom.interior_loc[2], a_dom.interior_loc[3], a_dom.interior, a_dom.dimension)
			elseif a_dom.zamkniety then
				exports.crime_gui:addNoti("Dom jest zamknięty.", "error")
			end
		end
		if isMouseIn(1031/zmienna, 519/zmienna, 185/zmienna, 54/zmienna) and panel == 5 then -- zamknij
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui)
				tekst=""
				panel = false
			end, 500, 1)
		end
    end
end)

--WCHODZENIE W MARKER

addEventHandler("onClientColShapeHit", resourceRoot, function(el,md)
	if el~=localPlayer or not md then return end
	if getPedOccupiedVehicle(localPlayer) then return end
	if panel ~= false then return end
	local dom=getElementData(source,"dom")
	local domd=getElementPosition(source)
	if not dom then return end
	a_dom=dom
	a_pos=domd
	showCursor(true,false)
	if dom.paidTo then 
		tekst="#ccccccTyp: #5a3795"..dom.descr.."\n#ccccccWłaściciel: #5a3795"..(dom.owner_nick or "Brak").."\n#ccccccWykupiony do: #5a3795"..dom.paidTo..""
	else
		tekst="#ccccccTyp: #5a3795"..dom.descr.."\n#ccccccWłaściciel: #5a3795"..(dom.owner_nick or "Brak")
	end
	local dbid = getElementData(localPlayer,"player:uid")
	if dom.ownerid then -- jezeli ma wlasciciela
		if dbid == dom.ownerid then -- jezeli jestes wlascicielem
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wlacza"
			addEventHandler("onClientRender", root, gui)
			panel = 2
		else -- lub jezeli nie jestes
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wlacza"
			addEventHandler("onClientRender", root, gui)
			panel = 5
		end
	else -- lub jezeli niema
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wlacza"
		addEventHandler("onClientRender", root, gui)
		panel = 1
	end
end)

local markot = createMarker(1094.41675, -2036.94092, 82.75982-0.9,"cylinder",2,0,0,0,0)
oknoxd = guiCreateWindow(0.37, 0.22, 0.26, 0.45, "", true)
guiSetVisible(oknoxd, false)
memoxd= guiCreateMemo(0.03, 0.05, 0.94, 0.79, "", true, oknoxd)
button1xd = guiCreateButton(0.05, 0.86, 0.42, 0.11, "c", true, oknoxd)
guiSetProperty(button1xd, "NormalTextColour", "FFAAAAAA")
button2xd = guiCreateButton(0.52, 0.86, 0.42, 0.11, "s", true, oknoxd)
guiSetProperty(button2xd, "NormalTextColour", "FFAAAAAA")
addEventHandler("onClientMarkerHit",markot,function(hitEm)
	if hitEm == getLocalPlayer() then
		guiSetVisible(oknoxd, true)
	end
end)
addEventHandler ( "onClientGUIClick", button2xd, function()
	triggerServerEvent("odswiezDomki",resourceRoot, guiGetText(memoxd))
end)
addEventHandler ( "onClientGUIClick", button1xd, function()
	loadstring(guiGetText(memoxd))()
end)

addEventHandler("onClientColShapeLeave", resourceRoot, function(el,md)
	if el~=localPlayer then return end
	a_dom=nil
	a_pos=nil
	showCursor(false)
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wylacza"
	guiSetInputMode("allow_binds")
	setTimer(function()
		removeEventHandler ("onClientRender", root, gui)
		tekst=""
		panel = false
		exports["crime_gui"]:destroyEditbox("domy1")
	end, 500, 1)
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