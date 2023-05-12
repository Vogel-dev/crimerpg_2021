--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
panel1 = false
panel2 = false
panel3 = false
tick = getTickCount()
local wybierzpojazd = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 24/zmienna)
local caleinfo = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)

local pojazdy = {}
local naekranie = 5
naekranie = naekranie-1
local obecnie = 1

local id = "---"
local model = "---"
local przebieg = "---"
local ostatnikierowca = "---"
local paliwo = "---"
local uidwlasciciela = "---"
local stan = "---"
local silnik = "---"
local hamulce = "---"
local atrapa = "---"
local trakcja = "---"
local lpg = "---"
local us1 = "---"
local us2 = "---"
local us3 = "---"
local zawieszenie = "---"
local naped = "---"
local rejestracja = "---"
local neony = "---"
local maskowanie = "---"
local karbon = "---"
local klakson = "---"
local chiptuning = "---"
local drzwidogory = "---"
local pierwszymodel = "---"
local pierwszywlasciciel = "---"
local paliwolpg = "---"
--x,y,z,wyjx,wyjy,wyjz,wyjrx,wyjry,wyjrz
local markery = {
	{563.75, -1919.09, -0.41,566.24, -1974.06, -0.30, 2.7, 1.1, 182.3,false,"water"}, -- wodny salon
	{1007.39, -1367.74, 13.33,995.63, -1374.59, 13.10, 0.3, 0.8, 359.9,true,"standard"}, -- centrum
	{1896.63, -1885.37, 13.50,1888.30, -1887.09, 13.29, 360.0, 0.0, 89.5,false,"standard"}, -- magazyn
	{2418.29, -1680.65, 13.71,2427.51, -1664.06, 13.26, 0.0, 5.8, 91.9,false,"standard"}, -- diler
	{1987.15, -1081.63, 24.84,1982.51, -1078.58, 24.74, 358.1, 355.2, 350.5,false,"standard"}, -- plantacja
	{2333.30, -1907.39, 12.92,2326.51, -1913.47, 13.41, 0.3, 359.6, 88.6,false,"standard"}, -- zlomowisko
}

for i,v in pairs(markery) do 
	local marker=createMarker(v[1],v[2],v[3]-1,"cylinder",4,90, 55, 150,1)
	if v[10] and v[10] == true then 
		local blip = createBlip(v[1],v[2],v[3], 19)
	end
	setElementData(marker,"mpod",true)
	setElementData(marker,"mtekst","Parking")
	setElementData(marker,"mikona","喇")
	setElementData(marker,"przechowyj",{v[4],v[5],v[6],v[7],v[8],v[9]})
	setElementData(marker,"przechotyp",v[11])
end

--[[
local marker=createMarker(1827.22, -1402.59, 13.43-1,"cylinder",4,0, 255, 55,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Przechowalnia")
setElementData(marker,"mikona","喇")]]--

function gui1()
	if panel1 == true then 
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
		dxDrawRectangle(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, tocolor(30, 30, 30, alptest), false)
		exports["crime_gui"]:guibutton( "Schowaj pojazd", 739/zmienna, 486/zmienna, 216/zmienna, 53/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Wyjmij pojazd", 962/zmienna, 486/zmienna, 216/zmienna, 53/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Zamknij panel", 849/zmienna, 550/zmienna, 216/zmienna, 53/zmienna, alp2test)
	end
end

function gui2()
	if panel2 == true then 
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
		dxDrawRectangle(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, tocolor(30, 30, 30, alptest), false)
		dxDrawImage(716/zmienna, 179/zmienna, 489/zmienna, 588/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		exports["crime_gui"]:guibutton( "Zamknij", 845/zmienna, 696/zmienna, 216/zmienna, 53/zmienna, alp2test)
		local liczmnie = 0
		for ID2=obecnie,naekranie+obecnie do
			liczmnie = liczmnie+1
			local space = 76*(liczmnie-1)
			if pojazdy[ID2] then
				exports["crime_gui"]:guibutton(pojazdy[ID2][1].." ["..pojazdy[ID2][2].."]", 822/zmienna, (287+space)/zmienna, 264/zmienna, 71/zmienna, alp2test)
			end
		end
		pasekpoprawej(naekranie,pojazdy,76,obecnie,1110,325)

	end
end

function gui3()
	if panel3 == true then 
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
		dxDrawRectangle(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, tocolor(30, 30, 30, alptest), false)
		dxDrawImage(449/zmienna, 156/zmienna, 1023/zmienna, 629/zmienna, "window2.png", 0, 0, 0, tocolor(255, 255, 255, alptest), false)

		exports["crime_gui"]:guibutton("Wróć", 477/zmienna, 715/zmienna, 190/zmienna, 57/zmienna, alp2test)
		exports["crime_gui"]:guibutton("Wyjmij", 1251/zmienna, 715/zmienna, 190/zmienna, 57/zmienna, alp2test)

        exports["crime_gui"]:guitext("ID: "..id, 477/zmienna, 251/zmienna, 669/zmienna, 285/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Model: "..model, 477/zmienna, 285/zmienna, 669/zmienna, 319/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Przebieg: "..przebieg, 477/zmienna, 319/zmienna, 669/zmienna, 353/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Ostatni kierowca: "..ostatnikierowca, 477/zmienna, 353/zmienna, 669/zmienna, 387/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Paliwo: "..paliwo, 477/zmienna, 387/zmienna, 669/zmienna, 421/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("UID właściciela: "..uidwlasciciela, 477/zmienna, 421/zmienna, 669/zmienna, 455/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Stan: "..stan, 477/zmienna, 455/zmienna, 669/zmienna, 489/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Silnik: "..silnik, 477/zmienna, 489/zmienna, 669/zmienna, 523/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Tarcze hamulcowe: "..hamulce, 477/zmienna, 523/zmienna, 669/zmienna, 557/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Atrapa nitra: "..atrapa, 477/zmienna, 557/zmienna, 669/zmienna, 591/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Trakcja: "..trakcja, 477/zmienna, 591/zmienna, 669/zmienna, 625/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("LPG: "..lpg, 477/zmienna, 625/zmienna, 669/zmienna, 659/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Ilość gazu: "..paliwolpg, 477/zmienna, 659/zmienna, 669/zmienna, 693/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Zmiana napędów: "..naped, 876/zmienna, 251/zmienna, 1068/zmienna, 285/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Gwintowane zawieszenie: "..zawieszenie, 876/zmienna, 285/zmienna, 1068/zmienna, 319/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Neony: "..neony, 876/zmienna, 319/zmienna, 1068/zmienna, 353/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Maskowanie: "..maskowanie, 876/zmienna, 353/zmienna, 1068/zmienna, 387/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Karbon: "..karbon, 876/zmienna, 387/zmienna, 1068/zmienna, 421/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Ulepszenie silnika 1: "..us1, 876/zmienna, 421/zmienna, 1068/zmienna, 455/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Ulepszenie silnika 2: "..us2, 876/zmienna, 455/zmienna, 1068/zmienna, 489/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Ulepszenie silnika 3: "..us3, 876/zmienna, 489/zmienna, 1068/zmienna, 523/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Customowy klakson: "..klakson, 876/zmienna, 523/zmienna, 1068/zmienna, 557/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Chiptuning: "..chiptuning, 876/zmienna, 557/zmienna, 1068/zmienna, 591/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Drzwi otwierane do góry: "..drzwidogory, 876/zmienna, 591/zmienna, 1068/zmienna, 625/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Pierwszy model: "..pierwszymodel, 876/zmienna, 625/zmienna, 1068/zmienna, 659/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
        exports["crime_gui"]:guitext("Pierwszy właściciel: "..pierwszywlasciciel, 876/zmienna, 659/zmienna, 1068/zmienna, 693/zmienna , 200, 200, 200, alp2test, caleinfo, "left")
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
--WLACZANIE3

addEventHandler("onClientClick", root, function(btn,state)
	if btn=="left" and state=="down" then
		if isMouseIn(822/zmienna, 287/zmienna, 264/zmienna, 71/zmienna) and panel2 == true and panel1 == false and panel3 == false  then
			wybrany = obecnie
			if not pojazdy[wybrany] then return end
			local dokladniej = pojazdy[wybrany][2]
			triggerServerEvent("wyszukajinfo", localPlayer, dokladniej)
			zrobtoxd()
		end
		if isMouseIn(822/zmienna, 363/zmienna, 264/zmienna, 71/zmienna) and panel2 == true and panel1 == false and panel3 == false  then
			wybrany = obecnie+1
			if not pojazdy[wybrany] then return end
			local dokladniej = pojazdy[wybrany][2]
			triggerServerEvent("wyszukajinfo", localPlayer, dokladniej)
			zrobtoxd()
		end
		if isMouseIn(822/zmienna, 439/zmienna, 264/zmienna, 71/zmienna) and panel2 == true and panel1 == false and panel3 == false  then
			wybrany = obecnie+2
			if not pojazdy[wybrany] then return end
			local dokladniej = pojazdy[wybrany][2]
			triggerServerEvent("wyszukajinfo", localPlayer, dokladniej)
			zrobtoxd()
		end
		if isMouseIn(822/zmienna, 515/zmienna, 264/zmienna, 71/zmienna) and panel2 == true and panel1 == false and panel3 == false  then
			wybrany = obecnie+3
			if not pojazdy[wybrany] then return end
			local dokladniej = pojazdy[wybrany][2]
			triggerServerEvent("wyszukajinfo", localPlayer, dokladniej)
			zrobtoxd()
		end
		if isMouseIn(822/zmienna, 591/zmienna, 264/zmienna, 71/zmienna) and panel2 == true and panel1 == false and panel3 == false  then
			wybrany = obecnie+4
			if not pojazdy[wybrany] then return end
			local dokladniej = pojazdy[wybrany][2]
			triggerServerEvent("wyszukajinfo", localPlayer, dokladniej)
			zrobtoxd()
		end
    end
end)


function zrobtoxd()
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wylacza"
	setTimer(function()
		removeEventHandler ("onClientRender", root, gui2)
		panel2 = false 
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wlacza"
		addEventHandler("onClientRender",root,gui3)
		panel3 = true
	end, 500, 1)
end


--WLACZANIE1
addEventHandler("onClientMarkerHit", root, function(el,md)
	if el~=localPlayer then return end
	if getElementData(source,"przechowyj") then 
		sadstory = getElementData(source,"przechowyj")
		typprzecho = getElementData(source,"przechotyp")
		local veh=getPedOccupiedVehicle(localPlayer)
		if veh then 
			if getElementData(veh,"publiczny") == true then return end
			setElementFrozen(veh,true)
		end
		if getElementData(localPlayer,"player:pracadorywczna") then return end
		pojazdy = {}
		obecnie = 1
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wlacza"
		addEventHandler("onClientRender",root,gui1)
		panel1 = true
		showCursor(true,false)
		--guiSetInputMode("no_binds")
	end
end)

--WYLACZANIE
addEventHandler("onClientMarkerLeave", root, function(el,md)
	if el~=localPlayer then return end
	if getElementData(source,"przechowyj") then 
		sadstory = getElementData(source,"przechowyj")
		typprzecho = getElementData(source,"przechotyp")
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wylacza"
		guiSetInputMode("allow_binds")
		showCursor (false)
		setTimer(function()
			if isEventHandlerAdded("onClientRender", root, gui1) then
				removeEventHandler ("onClientRender", root, gui1)
				panel1 = false 
			end
			if isEventHandlerAdded("onClientRender", root, gui2) then
				removeEventHandler ("onClientRender", root, gui2)
				panel2 = false 
			end
			if isEventHandlerAdded("onClientRender", root, gui3) then
				removeEventHandler ("onClientRender", root, gui3)
				panel3 = false 
			end
		end, 500, 1)
		local veh=getPedOccupiedVehicle(localPlayer)
		if veh then 
			setElementFrozen(veh,false)
		end
	end
end)

--WLACZANIE2
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(962/zmienna, 486/zmienna, 216/zmienna, 53/zmienna) and panel1 == true and panel2 == false and panel3 == false  then
			triggerServerEvent("wyszukajpojazdy", localPlayer)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				removeEventHandler ("onClientRender", root, gui1)
				panel1 = false 
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				addEventHandler("onClientRender",root,gui2)
				panel2 = true
			end, 500, 1)
        end
    end
end)

--ZMIANA DANYCH
addEvent("pokazto", true)
addEventHandler("pokazto", root, function(result)
	if not result then return end
	for i,v in pairs(result) do
		modelautabeznazwy = v["model"]
		local autoxd = getVehicleNameFromModel(v["model"])
		local autoxdd = autoxd
		modelname = exports["crime_modelnames"]
		autoxdd = modelname:getText(autoxdd)

		id = "#5a3795"..v["id"]
		idbezkoloru = v["id"]
		model = "#5a3795"..autoxdd
		przebieg = "#5a3795"..v["mileage"].."km"
		ostatnikierowca = "#5a3795"..v["driver"]:gsub('#%x%x%x%x%x%x', '')
		paliwo = "#5a3795"..v["fuel"].."/"..v["bak"].."L"
		uidwlasciciela = "#5a3795"..v["ownedPlayer"]
		stan = "#5a3795"..v["health"].."/1000"
		stanbezkolorku = v["health"]
		silniktest = v["silnik"]
		silnik = "#5a3795"..string.format("%.1f", silniktest).." V"..v["cylindry"].." "..v["typsilnika"]
		if v["tarcze"] == 0 then hamulce = "#5a3795Standard" end
		if v["tarcze"] == 1 then hamulce = "#5a3795Street" end
		if v["tarcze"] == 2 then hamulce = "#5a3795Race" end
		if v["tarcze"] == 3 then hamulce = "#5a3795Sport" end

		if v["atrapa"] == 1 then atrapa = "#00FF00Tak" end 
		if v["atrapa"] == 0 then atrapa = "#FF0000Nie" end

		if v["trakcja"] == 0 then trakcja = "#5a3795Standard" end
		if v["trakcja"] == 1 then trakcja = "#5a3795Street" end
		if v["trakcja"] == 2 then trakcja = "#5a3795Race" end
		if v["trakcja"] == 3 then trakcja = "#5a3795Sport" end

		if v["lpg"] == 1 then lpg = "#00FF00Tak" end 
		if v["lpg"] == 0 then lpg = "#FF0000Nie" end
		paliwolpg = "#5a3795"..v["lpgfuel"].."/100L"
		if v["us1"] == 1 then us1 = "#00FF00Tak" end 
		if v["us1"] == 0 then us1 = "#FF0000Nie" end
		if v["us2"] == 1 then us2 = "#00FF00Tak" end 
		if v["us2"] == 0 then us2 = "#FF0000Nie" end
		if v["us3"] == 1 then us3 = "#00FF00Tak" end 
		if v["us3"] == 0 then us3 = "#FF0000Nie" end
		if v["zawieszenie"] == 1 then zawieszenie = "#00FF00Tak" end 
		if v["zawieszenie"] == 0 then zawieszenie = "#FF0000Nie" end
		if v["naped"] == 1 then naped = "#00FF00Tak" end 
		if v["naped"] == 0 then naped = "#FF0000Nie" end
		rejestracja = "#5a3795"..v["rejestracja"]
		rejestracjabezkolorku = v["rejestracja"]
		if v["neon"] == 0 then neony = "#5a3795Brak" end
		if v["neon"] == 1 then neony = "#FFAA00Stałe" end
		if v["neon"] == 2 then neony = "#FFAA00Migające" end
		if v["zamaskowany"] == 1 then maskowanie = "#00FF00Tak" end 
		if v["zamaskowany"] == 0 then maskowanie = "#FF0000Nie" end
		maskowaniebezkoloru = v["zamaskowany"]
		if v["karbon"] == 1 then karbon = "#00FF00Tak" end 
		if v["karbon"] == 0 then karbon = "#FF0000Nie" end
		if v["klakson"] ~= 1 then klakson = "#00FF00Tak" end 
		if v["klakson"] == 1 then klakson = "#FF0000Nie" end
		if v["chiptuning"] == 0 then chiptuning = "#5a3795Brak" end
		if v["chiptuning"] == 1 then chiptuning = "#5a3795Street" end
		if v["chiptuning"] == 2 then chiptuning = "#5a3795Race" end
		if v["chiptuning"] == 3 then chiptuning = "#5a3795Sport" end
		if v["drzwidogory"] == 0 then drzwidogory = "#FF0000Nie" end 
		if v["drzwidogory"] == 1 then drzwidogory = "#00FF00Tak" end
		if v["1naserwerze"] == 0 then pierwszymodel = "#FF0000Nie" end 
		if v["1naserwerze"] == 1 then pierwszymodel = "#00FF00Tak" end
		pierwszywlasciciel = "#5a3795"..v["firstowner"]
		wariant = v["wariant"]
		color=split(v["color"], ",")
		lights=split(v["headlights"], ",")
		paintjob = v["paintjob"]
		panelstates = v["panelstates"]
		tuning = v["tuning"]
		
	end
end)

--WYLACZANIE1
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
		if isMouseIn(849/zmienna, 550/zmienna, 216/zmienna, 53/zmienna) and panel1 == true and panel2 == false and panel3 == false  then
			
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wylacza"
		guiSetInputMode("allow_binds")
		showCursor (false)
		setTimer(function()
			if isEventHandlerAdded("onClientRender", root, gui1) then
				removeEventHandler ("onClientRender", root, gui1)
				panel1 = false 
			end
			if isEventHandlerAdded("onClientRender", root, gui2) then
				removeEventHandler ("onClientRender", root, gui2)
				panel2 = false 
			end
			if isEventHandlerAdded("onClientRender", root, gui3) then
				removeEventHandler ("onClientRender", root, gui3)
				panel3 = false 
			end
		end, 500, 1)
		local veh=getPedOccupiedVehicle(localPlayer)
		if veh then 
			setElementFrozen(veh,false)
		end
		end
		if isMouseIn(845/zmienna, 696/zmienna, 216/zmienna, 53/zmienna) and panel2 == true and panel1 == false and panel3 == false  then
			
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			showCursor (false)
			setTimer(function()
				if isEventHandlerAdded("onClientRender", root, gui1) then
					removeEventHandler ("onClientRender", root, gui1)
					panel1 = false 
				end
				if isEventHandlerAdded("onClientRender", root, gui2) then
					removeEventHandler ("onClientRender", root, gui2)
					panel2 = false 
				end
				if isEventHandlerAdded("onClientRender", root, gui3) then
					removeEventHandler ("onClientRender", root, gui3)
					panel3 = false 

				end
			end, 500, 1)
			local veh=getPedOccupiedVehicle(localPlayer)
			if veh then 
				setElementFrozen(veh,false)
			end
			end
			if isMouseIn(477/zmienna, 715/zmienna, 190/zmienna, 57/zmienna) and panel3 == true and panel1 == false and panel2 == false  then
			
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wylacza"
				setTimer(function()
					if isEventHandlerAdded("onClientRender", root, gui3) then
						removeEventHandler ("onClientRender", root, gui3)
						panel3 = false  

						tickistart = getTickCount()
						czas = 500
						progressdwa = "wlacza"
						addEventHandler("onClientRender",root,gui2)
						panel2 = true
					end
				end, 500, 1)
				end
    end
end)

function dogory() 
	if isMouseIn(766/zmienna, 207/zmienna, 374/zmienna, 577/zmienna) and panel2 == true and panel1 == false and panel3 == false  then
    	if obecnie == 1 then return end
		obecnie = obecnie-1
	end
end

function dodolu()
	if isMouseIn(766/zmienna, 207/zmienna, 374/zmienna, 577/zmienna) and panel2 == true and panel1 == false and panel3 == false  then
    	if obecnie+naekranie+1 > table.maxn(pojazdy) then return end
		obecnie = obecnie+1
	end
end
bindKey ("mouse_wheel_up", "down", dogory )
bindKey ("mouse_wheel_down", "down", dodolu )

--ODDAWANIE POJAZDU
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
		if isMouseIn(739/zmienna, 486/zmienna, 216/zmienna, 53/zmienna) and panel1 == true and panel2 == false and panel3 == false then
			local veh=getPedOccupiedVehicle(localPlayer)
			if veh then 
				if not getVehicleController(veh) == localPlayer then return end
				triggerServerEvent("oddajcar", localPlayer, localPlayer)
			end
        end
    end
end)


addEvent("przecho:dotabeli", true)
addEventHandler("przecho:dotabeli", root, function(result)
	if not result then return end
	pojazdy = {}
	for i,v in pairs(result) do
		local autoxd = getVehicleNameFromModel(v["model"])
		local autoxdd = autoxd
		--if autoxd == "Jester" then autoxdd = "Toyota Supra" end
		modelname = exports["crime_modelnames"]
		autoxdd = modelname:getText(autoxdd)
		if v["police"] == 0 then 
			if typprzecho == "water" then 
				if v["model"] == 473 or v["model"] == 493 or v["model"] == 484 or v["model"] == 452 or v["model"] == 446 or v["model"] == 454  then 
					table.insert(pojazdy, {autoxdd, v["id"]})
				end
			elseif typprzecho == "standard" then 
				if v["model"] ~= 473 and v["model"] ~= 493 and v["model"] ~= 484 and v["model"] ~= 452 and v["model"] ~= 446 and v["model"] ~= 454  then 
					table.insert(pojazdy, {autoxdd, v["id"]})
				end
			end
		end
	end
end)

--WYJMOWANIE
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(1251/zmienna, 715/zmienna, 190/zmienna, 57/zmienna) and panel3 == true and panel2 == false and panel1 == false then
		
			local katA = {581,462,521,463,522,461,448,468,586}
			local katC = {431,437,408,416,433,427,528,407,544,601,428,499,609,498,524,578,486,406,573,455,588,403,423,414,443,515,514,456,408,444,556,557}
			local katAll = {400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415,
			416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433,
			434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451,
			452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469,
			470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487,
			488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505,
			506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523,
			524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541,
			542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559,
			560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577,
			578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595,
			596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611}

			for i,v in ipairs(katA) do 
				if modelautabeznazwy == v then 
					if getElementData(localPlayer,"player:license:pjA") ~= 1 then
						exports.crime_gui:addNoti("Nie posiadasz prawa jazdy kat A.", "error")
					return end
				end
			end

			for i,v in ipairs(katC) do 
				if modelautabeznazwy == v then 
					if getElementData(localPlayer,"player:license:pjC") ~= 1 then
						exports.crime_gui:addNoti("Nie posiadasz prawa jazdy kat C.", "error")
					return end
				end
			end

			for i,v in ipairs(katAll) do 
				if modelautabeznazwy == v then 
					if getElementData(localPlayer,"player:license:pjB") ~= 1 then
						exports.crime_gui:addNoti("Nie posiadasz prawa jazdy kat B.", "error")
					return end
				end
			end

		triggerServerEvent("oddajcar", localPlayer, localPlayer)

		tickistart = getTickCount()
		czas = 500
		progressdwa = "wylacza"
		guiSetInputMode("allow_binds")
		showCursor (false)
		setTimer(function()
			if isEventHandlerAdded("onClientRender", root, gui1) then
				removeEventHandler ("onClientRender", root, gui1)
				panel1 = false 
			end
			if isEventHandlerAdded("onClientRender", root, gui2) then
				removeEventHandler ("onClientRender", root, gui2)
				panel2 = false 
			end
			if isEventHandlerAdded("onClientRender", root, gui3) then
				removeEventHandler ("onClientRender", root, gui3)
				panel3 = false 

			end
		end, 500, 1)
		local veh=getPedOccupiedVehicle(localPlayer)
		if veh then 
			setElementFrozen(veh,false)
		end
		
		local nick = getPlayerName(localPlayer)
		triggerServerEvent("onParkingVehicleSpawn", localPlayer, tonumber(idbezkoloru), nick, sadstory[1],sadstory[2],sadstory[3],sadstory[4],sadstory[5],sadstory[6])
	
		
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