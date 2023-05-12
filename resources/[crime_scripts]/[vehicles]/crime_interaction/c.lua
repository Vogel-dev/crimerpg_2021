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
local font1 = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 26/zmienna)
local font2 = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)

zawieszenie = 0
paliwo = 0
naped = 0
paliwoprzelaczone = false
typpaliwa = ""
typzawieszenie = 0
typnaped = ""
pokazujkursor = true

wybranestrzalki = 0


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

shift = false

cXd = 0
cYd = 0
function cursorMove(_, _, x, y)
	if shift == true then
		if paliwo == 1 then 
			if zawieszenie == 0 then 
				if x > (1339+42.5)/zmienna then x = (1339+42.5)/zmienna end
				if x < (344+42.5)/zmienna then x = (344+42.5)/zmienna end
				end
			end
			if zawieszenie == 1 then 
				if paliwo == 0 then 
					if x < (485+42.5)/zmienna then x = (485+42.5)/zmienna end
					if x > (1483+42.5)/zmienna then x = (1483+42.5)/zmienna end
				end
			end
			if paliwo == 0 then 
				if zawieszenie == 0 then 
					if x < (485+42.5)/zmienna then x = (485+42.5)/zmienna end
					if x > (1339+42.5)/zmienna then x = (1339+42.5)/zmienna end
				end
			end
			if paliwo == 1 then 
				if zawieszenie == 1 then 
					if x < (344+42.5)/zmienna then x = (344+42.5)/zmienna end
					if x > (1483+42.5)/zmienna then x = (1483+42.5)/zmienna end
				end
		end
		cXd, cYd = x, y
	end
end
addEventHandler("onClientCursorMove", root, cursorMove)

local katA = {581,462,521,463,522,461,448,468,586}

function interakcja()
	local veh = getPedOccupiedVehicle(localPlayer)
	if not veh then 
        showCursor(false)
        shift = false
	removeEventHandler ("onClientRender", root, interakcja)
	return end
	pokazujkursor = true
	tekst = "Brak"
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
	dxDrawRectangle(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna,tocolor(30,30,30,alptest))
	dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/podstawa.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		if zawieszenie == 1 then 
			dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/zawieszenie.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)

			if isMouseIn(1480/zmienna, 490/zmienna, 97/zmienna, 96/zmienna) or wybranestrzalki == 5 then
				pokazujkursor = false
				dxDrawImage(1480/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
				dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/zawieszenielight.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
				if not getElementData(veh,"vehicle:zawieszeniepoziom") then setElementData(veh,"vehicle:zawieszeniepoziom",0) end
				if getElementData(veh,"vehicle:zawieszeniepoziom") == 5 then 
					tekst = "\nUstaw zawieszenie na: 4\nAktualnie jeździsz na: 5"
				end
				if getElementData(veh,"vehicle:zawieszeniepoziom") == 4 then 
					tekst = "\nUstaw zawieszenie na: 3\nAktualnie jeździsz na: 4"
				end
				if getElementData(veh,"vehicle:zawieszeniepoziom") == 3 then 
					tekst = "\nUstaw zawieszenie na: 2\nAktualnie jeździsz na: 3"
				end
				if getElementData(veh,"vehicle:zawieszeniepoziom") == 2 then 
					tekst = "\nUstaw zawieszenie na: 1\nAktualnie jeździsz na: 2"
				end
				if getElementData(veh,"vehicle:zawieszeniepoziom") == 1 then 
					tekst = "\nUstaw zawieszenie na: 0\nAktualnie jeździsz na: 1"
				end
				if getElementData(veh,"vehicle:zawieszeniepoziom") == 0 then 
					tekst = "\nUstaw zawieszenie na: -1\nAktualnie jeździsz na: 0"
				end
				if getElementData(veh,"vehicle:zawieszeniepoziom") == -1 then 
					tekst = "\nUstaw zawieszenie na: -2\nAktualnie jeździsz na: -1"
				end
				if getElementData(veh,"vehicle:zawieszeniepoziom") == -2 then 
					tekst = "\nUstaw zawieszenie na: -3\nAktualnie jeździsz na: -2"
				end
				if getElementData(veh,"vehicle:zawieszeniepoziom") == -3 then 
					tekst = "\nUstaw zawieszenie na: 5\nAktualnie jeździsz na: -3"
				end
				for i,v in ipairs(katA) do 
					if getElementModel(getPedOccupiedVehicle(localPlayer)) == v then 
						tekst = "Nie wykonasz tej akcji!"
					end
				end
			end
		end
		if naped == 1 then 
			dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/naped.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
			if isMouseIn(911/zmienna, 492/zmienna, 97/zmienna, 96/zmienna) or wybranestrzalki == 1 then
				pokazujkursor = false
				dxDrawImage(911/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
				dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/napedlight.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
				if typnaped == "AWD" then
					tekst = "\nZmień napęd na: FWD\nAktualnie jeździsz na: AWD"
				end
				if typnaped == "FWD" then
					tekst = "\nZmień napęd na: RWD\nAktualnie jeździsz na: FWD"
				end
				if typnaped == "RWD" then
					tekst = "\nZmień napęd na: AWD\nAktualnie jeździsz na: RWD"
				end
				for i,v in ipairs(katA) do 
					if getElementModel(getPedOccupiedVehicle(localPlayer)) == v then 
						tekst = "Nie wykonasz tej akcji!"
					end
				end
			end
		end
		if paliwo == 1 then 
			dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/typpaliwa.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)

			if isMouseIn(342/zmienna, 492/zmienna, 97/zmienna, 96/zmienna) or wybranestrzalki == -4 then
				pokazujkursor = false
				dxDrawImage(342/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
				dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/typpaliwalight.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
				if paliwoprzelaczone == false then 
					tekst = "\nPrzełącz się na: LPG\nAktualnie jeździsz na: "..typpaliwa..""
				else 
					tekst = "\nPrzełącz się na: "..typpaliwa.."\nAktualnie jeździsz na: LPG"
				end
			end
		end

		if isMouseIn(483/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) or wybranestrzalki == -3 then
			pokazujkursor = false
			dxDrawImage(483/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
			dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/kluczelight.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
			if isVehicleLocked(veh) == true then
				tekst = "Otwórz pojazd"
			else
				tekst = "Zamknij pojazd"
			end
		end
		if isMouseIn(626/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) or wybranestrzalki == -2 then
			pokazujkursor = false
			dxDrawImage(626/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
			dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/swiatlalight.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
			if getVehicleOverrideLights(veh) ~= 2 then
				tekst = "Zapal lampy"
			else
				tekst = "Zgaś lampy"
			end
		end
		if isMouseIn(768/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) or wybranestrzalki == -1 then
			pokazujkursor = false
			dxDrawImage(768/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
			dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/silniklight.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
			if getVehicleEngineState (veh) == true then 
				tekst = "Zgaś silnik"
			else
				tekst = "Uruchom silnik"
			end
		end
		if isMouseIn(1053/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) or wybranestrzalki == 2 then
			pokazujkursor = false
			dxDrawImage(1053/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
			dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/recznylight.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
			if isElementFrozen(veh) then 
				tekst = "Spuść ręczny"
				for i,v in ipairs(katA) do 
					if getElementModel(getPedOccupiedVehicle(localPlayer)) == v then 
						tekst = "Podciągnij stopke"
					end
				end
			else 
				tekst = "Zaciągnij ręczny"
				for i,v in ipairs(katA) do 
					if getElementModel(getPedOccupiedVehicle(localPlayer)) == v then 
						tekst = "Opuść stopke"
					end
				end
			end
		end
		if isMouseIn(1197/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) or wybranestrzalki == 3 then
			pokazujkursor = false
			dxDrawImage(1197/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
			dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/maskalight.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
			if getVehicleDoorOpenRatio(veh, 0) == 0 then 
				tekst = "Otwórz maskę"
				for i,v in ipairs(katA) do 
					if getElementModel(getPedOccupiedVehicle(localPlayer)) == v then 
						tekst = "Nie wykonasz tej akcji!"
					end
				end
			else 
				tekst = "Zamknij maskę"
				for i,v in ipairs(katA) do 
					if getElementModel(getPedOccupiedVehicle(localPlayer)) == v then 
						tekst = "Nie wykonasz tej akcji!"
					end
				end
			end
		end
		if isMouseIn(1339/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) or wybranestrzalki == 4 then
			pokazujkursor = false
			dxDrawImage(1339/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
			dxDrawImage(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna, ":crime_files/interakcja/pasazerlight.png", 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
			tekst = "Wysadź pasażerów"
		end
	

	if tekst then 
		exports["crime_gui"]:guitext("Akcja:", 342/zmienna, 682/zmienna, 1576/zmienna, 781/zmienna, 200, 200, 200, alp2test, font1)
        exports["crime_gui"]:guitext(tekst, 342/zmienna, 719/zmienna, 1576/zmienna, 818/zmienna, 90, 55, 150, alp2test, font2)
	end
	if pokazujkursor == true then
		dxDrawImage(cXd-42.5/zmienna, 493/zmienna, 95/zmienna, 95/zmienna, ":crime_files/interakcja/zakursorem.png", 0, 0, 0, tocolor(90, 55, 150, alp2test), false)
	end
end

function przeladujwszystko()
	local veh = getPedOccupiedVehicle(localPlayer)
	if not veh then return end

	if getElementData(veh,"vehicle:zawieszenie") == 1 then 
		zawieszenie = 1
	else 
		zawieszenie = 0
	end
	if getElementData(veh,"vehicle:lpg") == 1 then 
		paliwo = 1
	else
		paliwo = 0 
	end
	if getElementData(veh,"vehicle:naped") == 1 then 
		naped = 1
	else
		naped = 0
	end
	if getElementData(veh,"vehicle:wlaczonelpg") == true then 
		paliwoprzelaczone = true
	else
		paliwoprzelaczone = false
	end
	typpaliwa = getElementData(veh,"vehicle:typsilnika") or "Benzyna"
	typzawieszenie = tonumber(getElementData(veh,"vehicle:zawieszeniepoziom"))
	local hand = getVehicleHandling(veh)
	if hand["driveType"] == "fwd" then typnaped = "FWD" end 
	if hand["driveType"] == "rwd" then typnaped = "RWD" end 
	if hand["driveType"] == "awd" then typnaped = "AWD" end 

end

function prawo()
	if shift == true then 
		if zawieszenie == 0 and wybranestrzalki == 4 then return end
		if wybranestrzalki >= 5 then return end
		if naped == 0 and wybranestrzalki == 0 then 
			wybranestrzalki=wybranestrzalki+2
		return end 
		if naped == 0 and wybranestrzalki == -1 then 
			wybranestrzalki=wybranestrzalki+2
		return end 
		wybranestrzalki=wybranestrzalki+1
	end
end
bindKey("arrow_r","down",prawo)
function lewo()
	if shift == true then
		if paliwo == 0 and wybranestrzalki == -3 then return end 
		if wybranestrzalki <= -4 then return end
		if naped == 0 and wybranestrzalki == 1 then 
			wybranestrzalki=wybranestrzalki-2
		return end 
		wybranestrzalki=wybranestrzalki-1
	end
end
bindKey("arrow_l","down",lewo)
function spacja()
	if shift == true then
		if wybranestrzalki == -4 then 
			if paliwo == 1 then
				triggerServerEvent("typpaliwa", localPlayer)
				setTimer(function()
					przeladujwszystko()
				end, 100, 1)
			end
		end
		if wybranestrzalki == -3 then 
			triggerServerEvent("doors", localPlayer)
		end
		if wybranestrzalki == -2 then 
			triggerServerEvent("lights", localPlayer)
		end
		if wybranestrzalki == -1 then 
			triggerServerEvent("engine", localPlayer)
		end
		if wybranestrzalki == 1 then 
			if naped == 1 then
				triggerServerEvent("naped", localPlayer)
				setTimer(function()
					przeladujwszystko()
				end, 100, 1)
			end
		end
		if wybranestrzalki == 2 then 
			triggerServerEvent("brake", localPlayer)
		end
		if wybranestrzalki == 3 then 
			triggerServerEvent("maska", localPlayer)
		end
		if wybranestrzalki == 4 then 
			triggerServerEvent("exit", localPlayer)
		end
		if wybranestrzalki == 5 then 
			if zawieszenie == 1 then
				triggerServerEvent("typzawieszenie", localPlayer)
				setTimer(function()
					przeladujwszystko()
				end, 100, 1)
			end
		end
	end
end
bindKey("space","down",spacja)

addEventHandler("onClientClick", root, function(btn, state)
if btn == "left" and state == "down" then
	local veh = getPedOccupiedVehicle(localPlayer)
	if not veh then 
        showCursor(false)
        shift = false
	removeEventHandler ("onClientRender", root, interakcja)
	return end
	if shift == true and getVehicleController(veh) == localPlayer and veh then


	if isMouseIn(768/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) then 
		triggerServerEvent("engine", localPlayer)

	elseif isMouseIn(1053/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) then
		sad = false
		for i,v in ipairs(katA) do 
			if getElementModel(getPedOccupiedVehicle(localPlayer)) == v then 
				sad = true 
			end
		end
		triggerServerEvent("brake", localPlayer, sad)

	elseif isMouseIn(626/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) then
		triggerServerEvent("lights", localPlayer)

	elseif isMouseIn(1339/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) then
		triggerServerEvent("exit", localPlayer)

	elseif isMouseIn(483/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) then
		triggerServerEvent("doors", localPlayer)

	elseif isMouseIn(1197/zmienna, 494/zmienna, 97/zmienna, 96/zmienna) then
		for i,v in ipairs(katA) do 
			if getElementModel(getPedOccupiedVehicle(localPlayer)) == v then 
				
			return end
		end
		triggerServerEvent("maska", localPlayer)

	elseif isMouseIn(342/zmienna, 492/zmienna, 97/zmienna, 96/zmienna) then
		if paliwo == 1 then
			triggerServerEvent("typpaliwa", localPlayer)
			setTimer(function()
				przeladujwszystko()
			end, 100, 1)
		end
	elseif isMouseIn(911/zmienna, 492/zmienna, 97/zmienna, 96/zmienna) then
		if naped == 1 then
			triggerServerEvent("naped", localPlayer)
			setTimer(function()
				przeladujwszystko()
			end, 100, 1)
		end
	elseif isMouseIn(1480/zmienna, 490/zmienna, 97/zmienna, 96/zmienna) then
		if zawieszenie == 1 then
			triggerServerEvent("typzawieszenie", localPlayer)
			setTimer(function()
				przeladujwszystko()
			end, 100, 1)
		end

	end

end
end
end)

bindKey("lshift","down",function()
	local veh = getPedOccupiedVehicle(localPlayer)
	if veh then
	if getVehicleController(veh) == localPlayer then
	if shift == false then

		if getElementData(veh,"vehicle:zawieszenie") == 1 then 
			zawieszenie = 1
		else 
			zawieszenie = 0
		end
		if getElementData(veh,"vehicle:lpg") == 1 then 
			paliwo = 1
		else
			paliwo = 0 
		end
		if getElementData(veh,"vehicle:naped") == 1 then 
			naped = 1
		else
			naped = 0
		end
		if getElementData(veh,"vehicle:wlaczonelpg") == true then 
			paliwoprzelaczone = true
		else
			paliwoprzelaczone = false
		end
		typpaliwa = getElementData(veh,"vehicle:typsilnika") or "Benzyna"
		typzawieszenie = tonumber(getElementData(veh,"vehicle:zawieszeniepoziom"))
		local hand = getVehicleHandling(veh)
		if hand["driveType"] == "fwd" then typnaped = "FWD" end 
		if hand["driveType"] == "rwd" then typnaped = "RWD" end 
		if hand["driveType"] == "awd" then typnaped = "AWD" end 

		showCursor(true)
		shift = true
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wlacza"
        addEventHandler ("onClientRender", root, interakcja)
    end
end
end
end)

bindKey("lshift","up",function()
	if shift == true then
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wylacza"
		showCursor (false)
		setTimer(function()
			removeEventHandler ("onClientRender", root, interakcja)
			shift = false 
		end, 500, 1)
    end
end)