--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
local dxfont0_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 17/zmienna)
local dxfont1_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 25/zmienna)
local dxfont2_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 14/zmienna)
local start = getTickCount()
local startdwa = getTickCount()
local tekst1 = "---"
local tekst2 = "---"
alptest = 255
tlo = 1 
postac = 1
srodek = 1

--tytul,opis
local informacje = {
	{"Discord","Zaproszenie do naszego discorda znajduję się pod adresem\n#5a3795discord.gg/qcK3vjN #ccccccZnajdziesz tam wiele przydatnych\nI ciekawych informacji"},
	{"Bezpieczeństwo","Pamiętaj, aby nigdzie nie ustawiać takiego samego hasła,\n dzięki temu unikniesz włamań na konto."},
	{"Rejestracja","Pamiętaj, aby podczas rejestracji zapamiętać dane, jako iż na serwer rejestrujemy się tylko raz, a logowania nie ma\nPamiętając te dane będziesz mógł odzyskać konto na nowym komputerze."},
	{"Błędy","Pamiętaj, aby wszystkie błędy zgłaszać na odpowiednim kanale Discord."},
	{"Zgłaszanie gracza","Aby zgłosić gracza wystarczy wpisać \n#5a3795/report (id/nick) (powód)"},
	{"Na początek","Najważniejsze informacje na początek znajdziesz pod #5a3795F1#cccccc oraz #5a3795F2."}
}

function randombg()
	if getElementData(localPlayer,"player:logged") then 
		timers = getTimers ( 15000.01232 )
		for timerKey, timerValue in ipairs(timers) do
			killTimer ( timerValue )
		end
	return end
	tickistart = getTickCount()
	czas = 500
	progressdwa = "refresh"
	setTimer(function()
		tlo = math.random(1,7)
		postac = math.random(1,10)
		srodek = math.random(1,4)
		hmm = math.random(#informacje)
		tekst1 = informacje[hmm][1]
		tekst2 = informacje[hmm][2]
		startdwa = getTickCount()

		tickistart = getTickCount()
		czas = 500
		progressdwa = "refreshsad"
	end, 500, 1)
end
randombg()
setTimer(randombg,15000.01232,0)

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

function loadingDownload()
	if getElementData(localPlayer,"player:logged") then return end

	-- jakieś liczenie
		local a = (math.sqrt(getSoundFFTData(muzyczka, 2048, 2)[1])*256) or 150 -- alpha boków

	--liczenie alphy
	local ticki = getTickCount()
	if progressdwa == "refresh" then
		local Progressdas = (ticki-tickistart)/czas
		local alp = interpolateBetween(255,0,0,0,0,0,Progressdas,"Linear")
		if alp then alptest = alp else alp = 0 end 
	end
	if progressdwa == "refreshsad" then
		local Progressdas = (ticki-tickistart)/czas
		local alp = interpolateBetween(0,0,0,255,0,0,Progressdas,"Linear")
		if alp then alptest = alp else alp = 255 end 
	end

	--liczenie koła
		local now = getTickCount()
		local endTime = start + 1300
		local elapsedTime = now - start
		local duration = endTime - start
		local progress = elapsedTime / duration
		local posX, posY, posZ = interpolateBetween ( 0,0,0,360,0,0, progress, "Linear")
		if posX >= 360 then 
			start = getTickCount()
		end
	-- liczenie reszty
		local endTimedwa = startdwa + 15000
		local elapsedTimedwa = now - startdwa
		local durationdwa = endTimedwa - startdwa
		local progressdwa = elapsedTimedwa / durationdwa
		local x1, y1, z1 = interpolateBetween ( 0,0,0,1920,0,0, progressdwa, "Linear")
		local x2, y2, z2 = interpolateBetween ( 497,0,0,410,0,0, progressdwa, "Linear")
		local x3, y3, z3 = interpolateBetween ( 338,0,0,385,0,0, progressdwa, "Linear")
		local x4, y4, z4 = interpolateBetween ( 600,0,0,670,0,0, progressdwa, "Linear")

	--ogólnie
		dxDrawRectangle(0/zmienna,0/zmienna,1920/zmienna,1080/zmienna,tocolor(45, 45, 45,255))
		dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, ":crime_files/logowanie/new/bg"..tlo..".png", 0, 0, 0, tocolor(255, 255, 255, alptest), false)
		dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, ":crime_downloading/srodki/"..srodek..".png", 0, 0, 0, tocolor(255, 255, 255, alptest), false)
		dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, ":crime_downloading/srodki/boki.png", 0, 0, 0, tocolor(255, 255, 255, a), false)

	--teksty
		exports["crime_gui"]:guitext(tekst1, 1511/zmienna, 405/zmienna, 1910/zmienna, 474/zmienna, 90, 55, 150, alptest, dxfont1_PantonBold, "right", "center")
		exports["crime_gui"]:guitext(tekst2, 1278/zmienna, 464/zmienna, 1910/zmienna, 715/zmienna, 200, 200, 200, alptest, dxfont0_FiraEC, "right", "top")

	--linie na środku 
	--ciemne
		smutne = alptest 
		if smutne > 100 then smutne = 100 end
		dxDrawLine(0/zmienna, 370/zmienna, 1920/zmienna, 370/zmienna, tocolor(90, 55, 150, smutne), 6, false)
		dxDrawLine(0/zmienna, 719/zmienna, 1920/zmienna, 719/zmienna, tocolor(57, 35, 94, smutne), 6, false)
	--jasne
		dxDrawLine((1920-x1)/zmienna, 370/zmienna, 1920/zmienna, 370/zmienna, tocolor(90, 55, 150, alptest), 6, false)
		dxDrawLine(0/zmienna, 719/zmienna, x1/zmienna, 719/zmienna, tocolor(128, 79, 209, alptest), 6, false)

	--koło i napis pobierania
		dxDrawImage(1787/zmienna, 970/zmienna, 128/zmienna, 79/zmienna, ":crime_files/logowanie/new/logo.png", 0, 0, 0, tocolor(255, 255, 255, alptest), false)
		dxDrawImage(1793/zmienna, 953/zmienna, 117/zmienna, 117/zmienna, ":crime_files/core/wheel.png", posX, 0, 0, tocolor(255, 255, 255, alptest), false)
		exports["crime_gui"]:guitext("Trwa pobieranie zasobów serwera...", 1151/zmienna, 953/zmienna, 1793/zmienna, 1070/zmienna, 200, 200, 200, alptest, dxfont2_FiraEC, "right", "center")
		
	--postać
		dxDrawImage(57, x2/zmienna, x3/zmienna, x4/zmienna, ":crime_downloading/postacie/"..postac..".png", 0, 0, 0, tocolor(255, 255, 255, alptest), false)
end

function checkingIsDownload()
	if isTransferBoxActive() == true then
		if isEventHandlerAdded("onClientRender", root, loadingDownload) then return end
		if not muzyczka then 
			if getElementData(localPlayer,"player:logged") then return end
				muzyczka=playSound(":crime_files/other/intro.mp3",true)
				setSoundVolume(muzyczka, 1.0)
		end
		showChat(false)
		addEventHandler("onClientRender", root, loadingDownload)
	end
	if isTransferBoxActive() == false then
		if isEventHandlerAdded("onClientRender", root, loadingDownload) then
			removeEventHandler("onClientRender", root, loadingDownload)
		end
		if muzyczka then 
			stopSound(muzyczka)
		end
		--showChat(true)
	end
end
checkingIsDownload()
setTimer(checkingIsDownload, 3000.0138, 0)

addEvent("pob:stopsound",true)
addEventHandler("pob:stopsound",root,function()
	if muzyczka then
		stopSound(muzyczka)
	end
	showChat(false)
end)

addEventHandler( "onClientResourceStop", resourceRoot,
	function ( resource )
		if muzyczka then 
			stopSound(muzyczka)
			showChat(true)
		end
    end
);