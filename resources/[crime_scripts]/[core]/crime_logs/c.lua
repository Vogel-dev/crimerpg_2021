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
zakladka = 1

local naekranie = 23
naekranie = naekranie-1
local obecnie = 1

chat = {}
premium = {}
pm = {}
pay = {}
paypp = {}
pojazdy = {}
bany = {}
muty = {}
aj = {}
prawka = {}
kartoteka = {}

local dxfont0_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 13/zmienna)
local fontlight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)

function gui()
	if not getElementData(localPlayer,"player:logged") then return end
	if not getElementData(localPlayer,"player:admin") then return end
	dxDrawRectangle(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, tocolor(45, 45, 45, 200), false)
	dxDrawRectangle(0/zmienna, 0/zmienna, 214/zmienna, 720/zmienna, tocolor(45, 45, 45, 200), false)

	exports["crime_gui"]:guibutton("Logi chat", 23/zmienna, 10/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("Logi /v i /o", 23/zmienna, 68/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("Logi /pm", 23/zmienna, 126/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("Logi /pay", 23/zmienna, 184/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("Logi /paypp", 23/zmienna, 242/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("Logi pojazdy", 23/zmienna, 300/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("Bany", 23/zmienna, 358/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("Muty", 23/zmienna, 416/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("AdminJaile", 23/zmienna, 474/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("Prawka", 23/zmienna, 532/zmienna, 160/zmienna, 48/zmienna, 255)
	exports["crime_gui"]:guibutton("Kary gracza", 23/zmienna, 590/zmienna, 160/zmienna, 48/zmienna, 255)

	exports["crime_gui"]:createEditbox("logiadm:1", 25/zmienna, 652/zmienna, 157/zmienna, 42/zmienna, true, "", false, 16, fontlight, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Nick gracza", { 230, 230, 230, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)

	if zakladka == 1 then 
		if #chat >= 1 then 
			pasekpoprawej(naekranie,chat,45,obecnie,1910,55)
			exports["crime_gui"]:guitext(chat[1][2], 1770/zmienna, 56/zmienna, 1905/zmienna, 82/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")
			exports["crime_gui"]:guitext(chat[#chat][2], 1770/zmienna, 1018/zmienna, 1905/zmienna, 1044/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not chat[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..chat[ID2][1]..", "..chat[ID2][2].."#cccccc\n"..chat[ID2][3].."", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 2 then 
		if #premium >= 1 then 
			pasekpoprawej(naekranie,premium,45,obecnie,1910,55)
			exports["crime_gui"]:guitext(premium[1][2], 1770/zmienna, 56/zmienna, 1905/zmienna, 82/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")
			exports["crime_gui"]:guitext(premium[#premium][2], 1770/zmienna, 1018/zmienna, 1905/zmienna, 1044/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not premium[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..premium[ID2][1]..", "..premium[ID2][2].."#cccccc\n"..premium[ID2][3].."", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 3 then 
		if #pm >= 1 then 
			pasekpoprawej(naekranie,pm,45,obecnie,1910,55)
			exports["crime_gui"]:guitext(pm[1][2], 1770/zmienna, 56/zmienna, 1905/zmienna, 82/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")
			exports["crime_gui"]:guitext(pm[#pm][2], 1770/zmienna, 1018/zmienna, 1905/zmienna, 1044/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not pm[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..pm[ID2][1]..", "..pm[ID2][2].."#cccccc\n"..pm[ID2][3].."", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 4 then 
		if #pay >= 1 then 
			pasekpoprawej(naekranie,pay,45,obecnie,1910,55)
			exports["crime_gui"]:guitext(pay[1][2], 1770/zmienna, 56/zmienna, 1905/zmienna, 82/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")
			exports["crime_gui"]:guitext(pay[#pay][2], 1770/zmienna, 1018/zmienna, 1905/zmienna, 1044/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not pay[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..pay[ID2][1]..", "..pay[ID2][2].."#cccccc\n"..pay[ID2][3].."", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 5 then 
		if #paypp >= 1 then 
			pasekpoprawej(naekranie,paypp,45,obecnie,1910,55)
			exports["crime_gui"]:guitext(paypp[1][2], 1770/zmienna, 56/zmienna, 1905/zmienna, 82/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")
			exports["crime_gui"]:guitext(paypp[#paypp][2], 1770/zmienna, 1018/zmienna, 1905/zmienna, 1044/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not paypp[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..paypp[ID2][1]..", "..paypp[ID2][2].."#cccccc\n"..paypp[ID2][3].."", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 6 then 
		if #pojazdy >= 1 then 
			pasekpoprawej(naekranie,pojazdy,45,obecnie,1910,55)
			exports["crime_gui"]:guitext(pojazdy[1][2], 1770/zmienna, 56/zmienna, 1905/zmienna, 82/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")
			exports["crime_gui"]:guitext(pojazdy[#pojazdy][2], 1770/zmienna, 1018/zmienna, 1905/zmienna, 1044/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not pojazdy[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..pojazdy[ID2][1]..", "..pojazdy[ID2][2].."#cccccc\n"..pojazdy[ID2][3].."", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 7 then 
		if #bany >= 1 then 
			pasekpoprawej(naekranie,bany,45,obecnie,1910,55)

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not bany[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..bany[ID2][1].."#cccccc ("..bany[ID2][2].."), #5a3795DO "..bany[ID2][4].."#cccccc\n"..bany[ID2][3].."", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 8 then 
		if #muty >= 1 then 
			pasekpoprawej(naekranie,muty,45,obecnie,1910,55)

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not muty[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..muty[ID2][1].."#cccccc ("..muty[ID2][2].."), #5a3795DO "..muty[ID2][4].."#cccccc\n"..muty[ID2][3].." (OD: "..muty[ID2][5].."#cccccc)", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 9 then 
		if #aj >= 1 then 
			pasekpoprawej(naekranie,aj,45,obecnie,1910,55)

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not aj[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..aj[ID2][1].."#cccccc ("..aj[ID2][2].."), #5a3795DO "..aj[ID2][4].."#cccccc\n"..aj[ID2][3].."", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 10 then 
		if #prawka >= 1 then 
			pasekpoprawej(naekranie,prawka,45,obecnie,1910,55)

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not prawka[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..prawka[ID2][1].."#cccccc ("..prawka[ID2][2].."), #5a3795DO "..prawka[ID2][4].."#cccccc\n"..prawka[ID2][3].." (OD: "..prawka[ID2][5].."#cccccc)", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
	if zakladka == 11 then 
		if #kartoteka >= 1 then 
			pasekpoprawej(naekranie,kartoteka,45,obecnie,1910,55)
			exports["crime_gui"]:guitext(kartoteka[1][2], 1770/zmienna, 56/zmienna, 1905/zmienna, 82/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")
			exports["crime_gui"]:guitext(kartoteka[#kartoteka][2], 1770/zmienna, 1018/zmienna, 1905/zmienna, 1044/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight,"left", "top")

			local liczmnie = 0
			for ID2=obecnie,naekranie+obecnie do
				liczmnie = liczmnie+1
				local space = 45*(liczmnie-1)
				if not kartoteka[ID2] then return end
				exports["crime_gui"]:guitextlogiadm("#5a3795"..kartoteka[ID2][1]..", "..kartoteka[ID2][2].."#cccccc\n"..kartoteka[ID2][3].."", 228/zmienna, (10+space)/zmienna, 1900/zmienna, (78+space)/zmienna, 200, 200, 200, 255, dxfont0_SegoeLight, "center", "top")
			end
		end
	end
end

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
		if isMouseIn(23/zmienna, 10/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:chat", localPlayer)
			obecnie = 1 
			zakladka = 1
		end
		if isMouseIn(23/zmienna, 68/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:v", localPlayer)
			obecnie = 1 	
			zakladka = 2
		end
		if isMouseIn(23/zmienna, 126/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:pm", localPlayer)
			obecnie = 1 
			zakladka = 3
		end
		if isMouseIn(23/zmienna, 184/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:pay", localPlayer)
			obecnie = 1 
			zakladka = 4
		end
		if isMouseIn(23/zmienna, 242/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:paypp", localPlayer)
			obecnie = 1 
			zakladka = 5
		end
		if isMouseIn(23/zmienna, 300/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:auta", localPlayer)
			obecnie = 1 
			zakladka = 6
		end
		if isMouseIn(23/zmienna, 358/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:bany", localPlayer)
			obecnie = 1 
			zakladka = 7
		end
		if isMouseIn(23/zmienna, 416/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:muty", localPlayer)
			obecnie = 1 
			zakladka = 8
		end
		if isMouseIn(23/zmienna, 474/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:aj", localPlayer)
			obecnie = 1 
			zakladka = 9
		end
		if isMouseIn(23/zmienna, 532/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:prawka", localPlayer)
			obecnie = 1 
			zakladka = 10
		end
		if isMouseIn(23/zmienna, 590/zmienna, 160/zmienna, 48/zmienna) and onoff == true then
			triggerServerEvent("logiadm:kartoteka", localPlayer, exports["crime_gui"]:getEditboxText("logiadm:1"))
			obecnie = 1 
			zakladka = 11
		end
    end
end)



function onoffchuj()
	if onoff == true then 
        guiSetInputMode("allow_binds")
		showCursor(false)
		showChat(true)
		exports["crime_gui"]:destroyEditbox("logiadm:1")
		if isEventHandlerAdded("onClientRender", root, gui) then
			removeEventHandler ("onClientRender", root, gui)
			onoff = false 
		end
	else
		if not getElementData(localPlayer,"player:logged") then return end
		if not getElementData(localPlayer,"player:admin") then return end
		zakladka = 1 
		obecnie = 1 
		triggerServerEvent("logiadm:chat", localPlayer)
		onoff = true
        addEventHandler("onClientRender",root,gui)
		showCursor(true)
		showChat(false)
	end
end

bindKey("F6","down",onoffchuj)

addEvent("logiadm:chatwroc", true)
addEventHandler("logiadm:chatwroc", root, function(result)
	if not result then return end
	chat = {}
	for i,v in pairs(result) do
		table.insert(chat, {v["nick"], v["data"], v["tresc"]})
	end
end)

addEvent("logiadm:vwroc", true)
addEventHandler("logiadm:vwroc", root, function(result)
	if not result then return end
	premium = {}
	for i,v in pairs(result) do
		table.insert(premium, {v["nick"], v["data"], v["tresc"]})
	end
end)

addEvent("logiadm:pmwroc", true)
addEventHandler("logiadm:pmwroc", root, function(result)
	if not result then return end
	pm = {}
	for i,v in pairs(result) do
		table.insert(pm, {v["nick"], v["data"], v["tresc"]})
	end
end)

addEvent("logiadm:paywroc", true)
addEventHandler("logiadm:paywroc", root, function(result)
	if not result then return end
	pay = {}
	for i,v in pairs(result) do
		table.insert(pay, {v["nick"], v["data"], v["tresc"]})
	end
end)

addEvent("logiadm:payppwroc", true)
addEventHandler("logiadm:payppwroc", root, function(result)
	if not result then return end
	paypp = {}
	for i,v in pairs(result) do
		table.insert(paypp, {v["nick"], v["data"], v["tresc"]})
	end
end)

addEvent("logiadm:autawroc", true)
addEventHandler("logiadm:autawroc", root, function(result)
	if not result then return end
	pojazdy = {}
	for i,v in pairs(result) do
		table.insert(pojazdy, {v["nick"], v["data"], v["tresc"]})
	end
end)

addEvent("logiadm:banywroc", true)
addEventHandler("logiadm:banywroc", root, function(result)
	if not result then return end
	bany = {}
	for i,v in pairs(result) do
		table.insert(bany, {v["nick"], v["serial"], v["reason"], v["time"]})
	end
end)

addEvent("logiadm:mutywroc", true)
addEventHandler("logiadm:mutywroc", root, function(result)
	if not result then return end
	muty = {}
	for i,v in pairs(result) do
		table.insert(muty, {v["ukarany"], v["serial"], v["reason"], v["time"], v["who_add"]})
	end
end)

addEvent("logiadm:ajwroc", true)
addEventHandler("logiadm:ajwroc", root, function(result)
	if not result then return end
	aj = {}
	for i,v in pairs(result) do
		table.insert(aj, {v["nick"], v["Serial"], v["Powod"], v["Termin"]})
	end
end)

addEvent("logiadm:prawkawroc", true)
addEventHandler("logiadm:prawkawroc", root, function(result)
	if not result then return end
	prawka = {}
	for i,v in pairs(result) do
		table.insert(prawka, {v["ukarany"], v["serial"], v["reason"], v["time"], v["who_add"]})
	end
end)

addEvent("logiadm:kartotekawroc", true)
addEventHandler("logiadm:kartotekawroc", root, function(result)
	if not result then return end
	kartoteka = {}
	for i,v in pairs(result) do
		table.insert(kartoteka, {v["nick"], v["data"], v["tresc"]})
	end
end)

function dogory() 
	if onoff == true then
    	if obecnie == 1 then return end
		obecnie = obecnie-1
	end
end

function dodolu()
	if onoff == true then
		if zakladka == 1 then 
			if obecnie+naekranie+1 > table.maxn(chat) then return end
			obecnie = obecnie+1
		end
		if zakladka == 2 then 
			if obecnie+naekranie+1 > table.maxn(premium) then return end
			obecnie = obecnie+1
		end
		if zakladka == 3 then 
			if obecnie+naekranie+1 > table.maxn(pm) then return end
			obecnie = obecnie+1
		end
		if zakladka == 4 then 
			if obecnie+naekranie+1 > table.maxn(pay) then return end
			obecnie = obecnie+1
		end
		if zakladka == 5 then 
			if obecnie+naekranie+1 > table.maxn(paypp) then return end
			obecnie = obecnie+1
		end
		if zakladka == 6 then 
			if obecnie+naekranie+1 > table.maxn(pojazdy) then return end
			obecnie = obecnie+1
		end
		if zakladka == 7 then 
			if obecnie+naekranie+1 > table.maxn(bany) then return end
			obecnie = obecnie+1
		end
		if zakladka == 8 then 
			if obecnie+naekranie+1 > table.maxn(muty) then return end
			obecnie = obecnie+1
		end
		if zakladka == 9 then 
			if obecnie+naekranie+1 > table.maxn(aj) then return end
			obecnie = obecnie+1
		end
		if zakladka == 10 then 
			if obecnie+naekranie+1 > table.maxn(prawka) then return end
			obecnie = obecnie+1
		end
		if zakladka == 11 then 
			if obecnie+naekranie+1 > table.maxn(kartoteka) then return end
			obecnie = obecnie+1
		end
	end
end

bindKey ("mouse_wheel_up", "down", dogory )
bindKey ("mouse_wheel_down", "down", dodolu )


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