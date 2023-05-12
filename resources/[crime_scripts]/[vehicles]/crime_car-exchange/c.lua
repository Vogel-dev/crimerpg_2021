--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 22/zmienna)
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 23/zmienna)

local wybierzpojazd = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 24/zmienna)
local caleinfo = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)

sprzedam = false
informacje = false

kupsad = false


local id = "---"
local model = "---"
local przebieg = "---"
local cena = "---"
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

local cuboid = createColCuboid(2223.14453125, -1473.8491210938, 28.038436889648,58,80, 5)
local marker =  createMarker(2240.85, -1415.92, 30.05-1, "cylinder", 6, 90, 55, 150, 1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Giełda pojazdów")
setElementData(marker,"mikona","")

function sprzedamg()
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
	dxDrawImage(730/zmienna, 256/zmienna, 513/zmienna, 257/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
	exports["crime_gui"]:guibutton("Wystaw pojazd", 898/zmienna, 442/zmienna, 185/zmienna, 54/zmienna, alp2test)
	exports["crime_gui"]:createEditbox("gielda1", 816/zmienna, 360/zmienna, 349/zmienna, 45/zmienna, true, "", false, 8, font, true, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 60, true, "Cena", { 230, 230, 230, 255 }, true, 1, font, true, true, {255,255,255,0}, true)
end

function informacjeg()
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
	dxDrawImage(452/zmienna, 153/zmienna, 1009/zmienna, 638/zmienna, "window2.png", 0, 0, 0, tocolor(255, 255, 255, alptest), false)

	exports["crime_gui"]:guibutton( "Zamknij", 477/zmienna, 715/zmienna, 190/zmienna, 57/zmienna, alp2test)
	exports["crime_gui"]:guibutton( "Kup", 1251/zmienna, 715/zmienna, 190/zmienna, 57/zmienna, alp2test)

	exports["crime_gui"]:guitext("ID: "..id, 477/zmienna, 251/zmienna, 669/zmienna, 285/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Model: "..model, 477/zmienna, 285/zmienna, 669/zmienna, 319/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Przebieg: "..przebieg, 477/zmienna, 319/zmienna, 669/zmienna, 353/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Cena: "..cena, 477/zmienna, 353/zmienna, 669/zmienna, 387/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Paliwo: "..paliwo, 477/zmienna, 387/zmienna, 669/zmienna, 421/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("UID Właściciela: "..uidwlasciciela, 477/zmienna, 421/zmienna, 669/zmienna, 455/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Stan: "..stan, 477/zmienna, 455/zmienna, 669/zmienna, 489/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Silnik: "..silnik, 477/zmienna, 489/zmienna, 669/zmienna, 523/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Tarcze Hamulcowe: "..hamulce, 477/zmienna, 523/zmienna, 669/zmienna, 557/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Atrapa Nitra: "..atrapa, 477/zmienna, 557/zmienna, 669/zmienna, 591/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Trakcja: "..trakcja, 477/zmienna, 591/zmienna, 669/zmienna, 625/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("LPG: "..lpg, 477/zmienna, 625/zmienna, 669/zmienna, 659/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Ilość gazu: "..paliwolpg, 477/zmienna, 659/zmienna, 669/zmienna, 693/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Zmiana napędów: "..naped, 876/zmienna, 251/zmienna, 1068/zmienna, 285/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Gwintowane zawieszenie: "..zawieszenie, 876/zmienna, 285/zmienna, 1068/zmienna, 319/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Neony: "..neony, 876/zmienna, 319/zmienna, 1068/zmienna, 353/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Maskowanie: "..maskowanie, 876/zmienna, 353/zmienna, 1068/zmienna, 387/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Karbon: "..karbon, 876/zmienna, 387/zmienna, 1068/zmienna, 421/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Ulepszenie Silnika 1: "..us1, 876/zmienna, 421/zmienna, 1068/zmienna, 455/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Ulepszenie Silnika 2: "..us2, 876/zmienna, 455/zmienna, 1068/zmienna, 489/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Ulepszenie Silnika 3: "..us3, 876/zmienna, 489/zmienna, 1068/zmienna, 523/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Customowy Klakson: "..klakson, 876/zmienna, 523/zmienna, 1068/zmienna, 557/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Chiptuning: "..chiptuning, 876/zmienna, 557/zmienna, 1068/zmienna, 591/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Drzwi otwierane do góry: "..drzwidogory, 876/zmienna, 591/zmienna, 1068/zmienna, 625/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Pierwszy Model: "..pierwszymodel, 876/zmienna, 625/zmienna, 1068/zmienna, 659/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
	exports["crime_gui"]:guitext("Pierwszy Właściciel: "..pierwszywlasciciel, 876/zmienna, 659/zmienna, 1068/zmienna, 693/zmienna , 255, 255, 255, alp2test, caleinfo, "left")
end

--Po wjechaniu w marker
function wystaw(el)
	if sprzedam == false then
		if not isElementWithinColShape ( localPlayer, cuboid ) then return end
			if el~=localPlayer then return end
			local veh=getPedOccupiedVehicle(localPlayer)
			
		if veh then 
			local seat = getPedOccupiedVehicleSeat(localPlayer) 
			if seat ~= 0 then return end
			setElementFrozen(veh,true)
			setElementFrozen(veh,false)
			if getElementData(veh,"publiczny") == true then exports.crime_gui:addNoti("Ten pojazd jest publiczny.", "error") return end
			if not getElementData(veh,"vehicle:id") then exports.crime_gui:addNoti("Ten pojazd nie posiada ID.", "error") return end
			if getElementData(veh,"vehicle:ownedPlayer") ~= getElementData(localPlayer,"player:uid") then exports.crime_gui:addNoti("Ten pojazd nie jest twój.", "error") return end
			if getElementHealth(veh) < 900 then  exports.crime_gui:addNoti("Ten pojazd jest zbyt uszkodzony.", "error") return end

			showCursor(true,false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wlacza"
			addEventHandler("onClientRender", root, sprzedamg)
			sprzedam = true
		end
	end
end
addEventHandler("onClientMarkerHit",marker,wystaw)

--po wyjechaniu
function wystawoff(el)
	if sprzedam == true then
		if el~=localPlayer then return end
		showCursor(false)
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wylacza"
		guiSetInputMode("allow_binds")
			removeEventHandler ("onClientRender", root, sprzedamg)
			sprzedam = false
			exports["crime_gui"]:destroyEditbox("gielda1")
	end
end
addEventHandler("onClientMarkerLeave",marker,wystawoff)


-- przycisk wystawienia
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(898/zmienna, 442/zmienna, 185/zmienna, 54/zmienna) and sprzedam == true then
			local cena = tonumber(exports["crime_gui"]:getEditboxText("gielda1")) or 0
			if cena < 100 then exports.crime_gui:addNoti("Cena musi przekraczać 100 PLN.", "error") return end
			if cena > 50000000 then exports.crime_gui:addNoti("Cena nie może przekraczać 50.000.000 PLN.", "error") return end
			local veh=getPedOccupiedVehicle(localPlayer)
			if getElementData(veh,"wystawiony") == true then
				triggerServerEvent("usuncuboid:gielda", localPlayer, veh)
			end
			triggerServerEvent("wystawpojazd:gielda", localPlayer, veh, cena)
			exports.crime_gui:addNoti("Wystawiłeś pojazd na giełde, jeżeli się sprzeda pieniądze otrzymasz do bankomatu.", "info")
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
				removeEventHandler ("onClientRender", root, sprzedamg)
				sprzedam = false
				exports["crime_gui"]:destroyEditbox("gielda1")
        end
    end
end)

--WYLACZANIE PO WYJSCIU Z MARKERA DO CSIDE OD SSIDE
addEvent("cuboidoff", true)
addEventHandler("cuboidoff", root, function()
	showCursor(false)
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wylacza"
		removeEventHandler ("onClientRender", root, informacjeg)
		informacje = false
end)


--WYSWIETLANIE INFO O AUCIE ;D
addEvent("cuboid", true)
addEventHandler("cuboid", root, function(pojazd,result)
	if not result then return end
	for i,v in pairs(result) do
		modelautabeznazwy = v["model"]
		local autoxd = getVehicleNameFromModel(v["model"])
		local autoxdd = autoxd
		modelname = exports["crime_modelnames"]
		autoxdd = modelname:getText(autoxdd)

		id = "#5a3795"..v["id"]
		idcyce = v["id"]
		idbezkoloru = v["id"]
		model = "#5a3795"..autoxdd
		przebieg = "#5a3795"..v["mileage"].."km"
		cena = "#5a3795"..formatujnaprzecinki(string.format("%06d", getElementData(pojazd,"cena"))).." PLN"
		cenacyce = getElementData(pojazd,"cena")
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
		if v["neon"] == 1 then neony = "#5a3795Stałe" end
		if v["neon"] == 2 then neony = "#5a3795Migające" end
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
	wlasciciel = getElementData(pojazd,"wlasciciel")

	showCursor(true,false)
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wlacza"
	addEventHandler("onClientRender", root, informacjeg)
	informacje = true
end)

-- WCHODZENIE I WYCHODZENIA Z AUTA
addEventHandler("onClientVehicleStartEnter", root, function()
	if getElementData(source,"wystawiony") then 
		showCursor(false)
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wylacza"
			removeEventHandler ("onClientRender", root, informacjeg)
			informacje = false
	end
end)
addEventHandler("onClientVehicleEnter", root, function()
	if getElementData(source,"wystawiony") then 
		showCursor(false)
		tickistart = getTickCount()
		czas = 500
		progressdwa = "wylacza"
			removeEventHandler ("onClientRender", root, informacjeg)
			informacje = false
	end
end)


--USUWANIE E DATY PODCZAS RESTARTU
addEventHandler( "onClientResourceStop", getResourceRootElement(getThisResource()),function ( stoppedRes )
	for i,v in ipairs(getElementsByType("vehicle")) do
		if getElementData(v,"wystawiony") then 
			setElementData(v,"vehicle:desc","")
			setElementData(v,"wystawiony",false)
		end
	end	
end)



--WYLACZANIE GUI PRZEZ PRZYCISK

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(477/zmienna, 715/zmienna, 190/zmienna, 57/zmienna) and informacje == true then
			showCursor(false)
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
				removeEventHandler ("onClientRender", root, informacjeg)
				informacje = false
        end
    end
end)


--KUPOWANIE POJAZDU BRO ;D

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
		if isMouseIn(1251/zmienna, 715/zmienna, 190/zmienna, 57/zmienna) and informacje == true then
			
			if kupsad == false then 
				kupsad = true
				setTimer(function()
					kupsad = false
				end, 5000, 1)
				showCursor(false)
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wylacza"
					removeEventHandler ("onClientRender", root, informacjeg)
					informacje = false
			
				for i,v in ipairs(getElementsByType("vehicle")) do
					if getElementData(v,"wystawiony") and getElementData(v,"vehicle:id") == idcyce then 

						local model = getElementModel(v)
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
						triggerServerEvent("kuppojazd:gielda", localPlayer, v, cenacyce, wlasciciel)
					end
				end
			else 
				exports.crime_gui:addNoti("Możesz to robić raz na 5 sekund.", "error")
			end
        end
    end
end)


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