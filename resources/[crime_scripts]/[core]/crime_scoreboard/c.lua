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
local strona = 1
local dxfont0_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmienna)
local fontlight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)

local naekranie = 8
naekranie = naekranie-1
local obecnie = 1

players = {}

local max = 100
local string = false

function gui()
	local ticki = getTickCount()
	if progressdwa == "wlacza" then
		local Progress = (ticki-tickistart)/czas
		local alp = interpolateBetween(0,0,0,155,0,0,Progress,"Linear")
		local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
		if alp then alptest = alp else alp = 155 end 
		if alp2 then alp2test = alp2 else alp2 = 255 end
	else 
		local Progress = (ticki-tickistart)/czas
		local alp = interpolateBetween(155,0,0,0,0,0,Progress,"Linear")
		local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
		if alp then alptest = alp else alp = 0 end 
		if alp2 then alp2test = alp2 else alp2 = 0 end
	end
	if onoff == true then 
		if not getElementData(localPlayer,"player:logged") then return end
		--MAIN GUI
		dxDrawImage(373/zmienna, 237/zmienna, 1202/zmienna, 563/zmienna, "bg.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

		exports["crime_gui"]:guibutton("Wszyscy",383/zmienna, 260/zmienna, 205/zmienna, 62/zmienna, alp2test)
		exports["crime_gui"]:guibutton("#ff0000Administracja",383/zmienna, 332/zmienna, 205/zmienna, 62/zmienna, alp2test)
		-- exports["crime_gui"]:guibutton("#3483ebSAPD",383/zmienna, 404/zmienna, 205/zmienna, 62/zmienna, alp2test)
		-- exports["crime_gui"]:guibutton("#ff4a4aSAFD",383/zmienna, 476/zmienna, 205/zmienna, 62/zmienna, alp2test)
		-- exports["crime_gui"]:guibutton("#00ffb7SAMD",383/zmienna, 548/zmienna, 205/zmienna, 62/zmienna, alp2test)

		exports["crime_gui"]:guibutton("Szukaj",407/zmienna, 682/zmienna, 161/zmienna, 48/zmienna, alp2test)

		exports["crime_gui"]:guitext("#5a3795"..getPlayerCount().."#cccccc/"..max.."", 373/zmienna, 740/zmienna, 598/zmienna, 785/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
		exports["crime_gui"]:createEditbox("tab:find", 383/zmienna, 618/zmienna, 205/zmienna, 50/zmienna, true, "", false, 16, fontlight, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Nick", { 230, 230, 230, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)
		
		--STRONY GRACZY
		--PIERWSZA STRONAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		if strona ~= 2 then
			--TYPOWANIE 
			exports["crime_gui"]:guitext("ID", 616/zmienna, 242/zmienna, 675/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("UID", 675/zmienna, 242/zmienna, 773/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Nick", 773/zmienna, 242/zmienna, 967/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Ping", 967/zmienna, 242/zmienna, 1065/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Lvl", 1065/zmienna, 242/zmienna, 1151/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Organizacja", 1151/zmienna, 242/zmienna, 1371/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Frakcja", 1371/zmienna, 242/zmienna, 1555/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			--LISTA

			pasekpoprawej(naekranie,players,61,obecnie,1562,297+30)
			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				if players[ID2] then
					liczmnie = liczmnie+1
					local space1 = 61*(liczmnie-1)
					local space2 = 61*(liczmnie-1) 

					id = getElementData(players[ID2],"id") or "-"
					uid = getElementData(players[ID2],"player:uid") or "-"
					nick = getPlayerName(players[ID2]) or "-"
					ping = getPlayerPing(players[ID2]) or "-"
					lvl = getElementData(players[ID2],"player:lvl") or "-"
					org = getElementData(players[ID2],"player:organization") or "-"
					frakcja = getElementData(players[ID2],"player:duty") or "-"
					if frakcja == "SAPD" then frakcja = "#3483ebSAPD" end 
					if frakcja == "SAFD" then frakcja = "#ff4a4aSAFD" end 
					if frakcja == "SAMD" then frakcja = "#00ffb7SAMD" end 

					dxDrawRectangle(616/zmienna, (297+space1)/zmienna, 939/zmienna, 55/zmienna, tocolor(60, 60, 80, alptest), false)
					dxDrawRectangle(616/zmienna, (350+space1)/zmienna, 938/zmienna, 2/zmienna, tocolor(90, 55, 150, alp2test), false)
					exports["crime_gui"]:guitext(id, 616/zmienna, (297+space2)/zmienna, 675/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(uid, 675/zmienna, (297+space2)/zmienna, 773/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(nick, 773/zmienna, (297+space2)/zmienna, 967/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(ping, 967/zmienna, (297+space2)/zmienna, 1065/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(lvl, 1065/zmienna, (297+space2)/zmienna, 1151/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(org, 1151/zmienna, (297+space2)/zmienna, 1371/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(frakcja, 1371/zmienna, (297+space2)/zmienna, 1555/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
				end
			end
		else 
			--TYPOWANIE 
			exports["crime_gui"]:guitext("ID", 616/zmienna, 242/zmienna, 675/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("UID", 675/zmienna, 242/zmienna, 773/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Nick", 773/zmienna, 242/zmienna, 967/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Ping", 967/zmienna, 242/zmienna, 1065/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Lvl", 1065/zmienna, 242/zmienna, 1151/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Organizacja", 1151/zmienna, 242/zmienna, 1371/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			exports["crime_gui"]:guitext("Ranga", 1371/zmienna, 242/zmienna, 1555/zmienna, 297/zmienna, 200, 200, 200, alp2test, dxfont0_FiraEC, "center", "center")
			--LISTA
			pasekpoprawej(naekranie,players,61,obecnie,1562,297+30)
			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				if players[ID2] then
					liczmnie = liczmnie+1
					local space1 = 61*(liczmnie-1)
					local space2 = 61*(liczmnie-1) 
					
					id = getElementData(players[ID2],"id") or "-"
					uid = getElementData(players[ID2],"player:uid") or "-"
					nick = getPlayerName(players[ID2]) or "-"
					ping = getPlayerPing(players[ID2]) or "-"
					lvl = getElementData(players[ID2],"player:lvl") or "-"
					org = getElementData(players[ID2],"player:organization") or "-"
					ranga = getElementData(players[ID2],"player:level") or "-"
                    if ranga == 1 then ranga = "#2BFFB4Trial Support" end
                    if ranga == 2 then ranga = "#33cc99Support" end
                    if ranga == 3 then ranga = "#3399ffModerator" end
                    if ranga == 4 then ranga = "#ff0000Administrator" end
                    if ranga == 5 then ranga = "#CA43FFProgramista" end
                    if ranga == 6 then ranga = "#CA43FFProgramista" end

					dxDrawRectangle(616/zmienna, (297+space1)/zmienna, 939/zmienna, 55/zmienna, tocolor(60, 60, 80, alptest), false)
					dxDrawRectangle(616/zmienna, (350+space1)/zmienna, 938/zmienna, 2/zmienna, tocolor(90, 55, 150, alp2test), false)
					exports["crime_gui"]:guitext(id, 616/zmienna, (297+space2)/zmienna, 675/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(uid, 675/zmienna, (297+space2)/zmienna, 773/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(nick, 773/zmienna, (297+space2)/zmienna, 967/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(ping, 967/zmienna, (297+space2)/zmienna, 1065/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(lvl, 1065/zmienna, (297+space2)/zmienna, 1151/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(org, 1151/zmienna, (297+space2)/zmienna, 1371/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
					exports["crime_gui"]:guitext(ranga, 1371/zmienna, (297+space2)/zmienna, 1555/zmienna, (352+space2)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
				end
			end
		end 
	end
end

function onofftest()
    if onoff == true then 
		tickistart = getTickCount()
		czas = 500
        progressdwa = "wylacza"
        guiSetInputMode("allow_binds")
		showCursor(false)
		setTimer(function()
            if isEventHandlerAdded("onClientRender", root, gui) then
				removeEventHandler ("onClientRender", root, gui)
                onoff = false 
				exports["crime_gui"]:destroyEditbox("tab:find")
				players = {}
			end
		end, 500, 1)
	else
		strona = 1
		players = {}
		for i,v in pairs(getElementsByType("player")) do 
			table.insert(players,v)
		end
		table.sort(
			players,
			function(a, b)
				return getElementData(a,"id") < getElementData(b,"id")
			end
		)

		triggerServerEvent("getMaxPlayers", localPlayer, "tabmax")
		obecnie = 1
        onoff = true
        tickistart = getTickCount()
        czas = 500
        progressdwa = "wlacza"
        addEventHandler("onClientRender",root,gui)
		showCursor(true)
	end
end

bindKey("tab","down",onofftest)

addEvent("tabmax", true)
addEventHandler("tabmax", root, function(maksik)
	if not maksik then return end 
	max = maksik
end)

function dogory() 
	if isMouseIn(602/zmienna, 234/zmienna, 970/zmienna, 566/zmienna) and onoff == true then
    	if obecnie == 1 then return end
		obecnie = obecnie-1
    end
end

function dodolu()
    if isMouseIn(602/zmienna, 234/zmienna, 970/zmienna, 566/zmienna) and onoff == true then
        if obecnie+naekranie+1 > table.maxn(players) then return end
		obecnie = obecnie+1
    end
end

bindKey ("mouse_wheel_up", "down", dogory )
bindKey ("mouse_wheel_down", "down", dodolu )


--BUTTONSY
addEventHandler("onClientClick", root, function(btn,state)
	if btn=="left" and state=="down" then
		if isMouseIn(383/zmienna, 260/zmienna, 205/zmienna, 62/zmienna) and onoff == true then
			strona = 1 
			obecnie = 1
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				table.insert(players,v)
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
			sortuj()
		end
		if isMouseIn(383/zmienna, 332/zmienna, 205/zmienna, 62/zmienna) and onoff == true then
			strona = 2
			obecnie = 1
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:level") then 
					table.insert(players,v)
				end
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
			sortuj()
		end
		if isMouseIn(383/zmienna, 404/zmienna, 205/zmienna, 62/zmienna) and onoff == true then
			strona = 3
			obecnie = 1
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:duty") == "SAPD" then 
					table.insert(players,v)
				end
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
			sortuj()
		end
		if isMouseIn(383/zmienna, 476/zmienna, 205/zmienna, 62/zmienna) and onoff == true then
			strona = 4 
			obecnie = 1
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:duty") == "SAFD" then 
					table.insert(players,v)
				end
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
			sortuj()
		end
		if isMouseIn(383/zmienna, 548/zmienna, 205/zmienna, 62/zmienna) and onoff == true then
			strona = 5 
			obecnie = 1
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:duty") == "SAMD" then 
					table.insert(players,v)
				end
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
			sortuj()
		end
		if isMouseIn(407/zmienna, 682/zmienna, 161/zmienna, 48/zmienna) and onoff == true then
			sortuj()
		end
    end
end)

function sortuj()
	if strona == 1 then 
		string = exports["crime_gui"]:getEditboxText("tab:find")
		if string == "" then
			string = false
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				table.insert(players,v)
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		else
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				table.insert(players,v)
			end
			playersdwa = {}
			for i,v in pairs(players) do 
				if string.find(string.lower(removeHex(getPlayerName(players[i]))),string.lower(string)) then 
					table.insert(playersdwa,players[i])
				end
			end
			players = playersdwa	
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		end
	end
	--DRUGAAAAAAAAAAA
	if strona == 2 then 
		string = exports["crime_gui"]:getEditboxText("tab:find")
		if string == "" then
			string = false
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:level") then 
					table.insert(players,v)
				end
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		else
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:level") then 
					table.insert(players,v)
				end
			end
			playersdwa = {}
			for i,v in pairs(players) do 
				if string.find(string.lower(removeHex(getPlayerName(players[i]))),string.lower(string)) then 
					table.insert(playersdwa,players[i])
				end
			end
			players = playersdwa	
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		end
	end
	--TRZECIA
	if strona == 3 then 
		string = exports["crime_gui"]:getEditboxText("tab:find")
		if string == "" then
			string = false
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:duty") == "SAPD" then 
					table.insert(players,v)
				end
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		else
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:duty") == "SAPD" then 
					table.insert(players,v)
				end
			end
			playersdwa = {}
			for i,v in pairs(players) do 
				if string.find(string.lower(removeHex(getPlayerName(players[i]))),string.lower(string)) then 
					table.insert(playersdwa,players[i])
				end
			end
			players = playersdwa	
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		end
	end
	--CZWARTA
	if strona == 4 then 
		string = exports["crime_gui"]:getEditboxText("tab:find")
		if string == "" then
			string = false
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:duty") == "SAFD" then 
					table.insert(players,v)
				end
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		else
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:duty") == "SAFD" then 
					table.insert(players,v)
				end
			end
			playersdwa = {}
			for i,v in pairs(players) do 
				if string.find(string.lower(removeHex(getPlayerName(players[i]))),string.lower(string)) then 
					table.insert(playersdwa,players[i])
				end
			end
			players = playersdwa	
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		end
	end
	--PIATA
	if strona == 5 then 
		string = exports["crime_gui"]:getEditboxText("tab:find")
		if string == "" then
			string = false
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:duty") == "SAMD" then 
					table.insert(players,v)
				end
			end
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		else
			players = {}
			for i,v in pairs(getElementsByType("player")) do 
				if getElementData(v,"player:duty") == "SAMD" then 
					table.insert(players,v)
				end
			end
			playersdwa = {}
			for i,v in pairs(players) do 
				if string.find(string.lower(removeHex(getPlayerName(players[i]))),string.lower(string)) then 
					table.insert(playersdwa,players[i])
				end
			end
			players = playersdwa	
			table.sort(
				players,
				function(a, b)
					return getElementData(a,"id") < getElementData(b,"id")
				end
			)
		end
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

function getPlayerCount()
	return originalGetPlayerCount and originalGetPlayerCount() or #getElementsByType("player")
end

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
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