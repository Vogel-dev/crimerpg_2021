--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
panel = 0
tick = getTickCount()

local fontbold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)
local fontbolddwa = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 19/zmienna)
local fontlight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 22/zmienna)

local dxfont0_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 22/zmienna)
local dxfont1_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)


local model = "---"
local cena = "---"
local silnik = "---"
local przebieg = "---"

local alp2 = 200
local alp = 255


function bg()
	if panel == 1 then 
		dxDrawImage(654/zmienna, 282/zmienna, 612/zmienna, 347/zmienna, "background.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		exports["crime_gui"]:guitext("#ccccccModel: #5a3795"..model.."#cccccc\nPrzebieg: #5a3795"..przebieg.."km#cccccc\nCena: #5a3795"..formatujnaprzecinki(cena).." PLN#cccccc\nSilnik: #5a3795"..string.format("%.1f", silnik).." V"..cylindry.." "..typsilnika.."", 741/zmienna, 386/zmienna, 1176/zmienna, 559/zmienna , 255, 255, 255, alp2test, fontlight, "center", "top")
		exports["crime_gui"]:guibutton("Zamknij", 752/zmienna, 559/zmienna, 156/zmienna, 47/zmienna, alp2test)
		exports["crime_gui"]:guibutton("Kup pojazd", 1010/zmienna, 559/zmienna, 156/zmienna, 47/zmienna, alp2test)
	end
	if panel == 2 then 
		dxDrawImage(654/zmienna, 223/zmienna, 612/zmienna, 485/zmienna, "background.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guitext("███", 742/zmienna, 502/zmienna, 1176/zmienna, 549/zmienna, kr, kg, kb, alp2test, dxfont0_SegoeLight, "center", "center")
        exports["crime_gui"]:guitext("Kolor pojazdu", 741/zmienna, 340/zmienna, 1176/zmienna, 384/zmienna, 255, 255, 255, alp2test, fontbold, "center", "center")
        exports["crime_gui"]:guibutton("Cofnij", 752/zmienna, 559/zmienna, 156/zmienna, 47/zmienna, alp2test)
		exports["crime_gui"]:guibutton("Dalej", 1010/zmienna, 559/zmienna, 156/zmienna, 47/zmienna, alp2test)
		exports["crime_gui"]:createEditbox("kolorauto", 839/zmienna, 396/zmienna, 236/zmienna, 39/zmienna, true, "", false, 16, fontlight, false, 0, { 230, 230, 230, alp2test }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Wpisz kolor", { 230, 230, 230, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:guibutton("Ustaw", 881/zmienna, 454/zmienna, 156/zmienna, 47/zmienna, alp2test)
	end
	if panel == 3 then 
		dxDrawImage(654/zmienna, 223/zmienna, 612/zmienna, 485/zmienna, "background.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guitext("███", 742/zmienna, 502/zmienna, 1176/zmienna, 549/zmienna, lr, lg, lb, alp2test, dxfont0_SegoeLight, "center", "center")
        exports["crime_gui"]:guitext("Kolor lamp (Cena: 50000 PLN)", 741/zmienna, 340/zmienna, 1176/zmienna, 384/zmienna, 255, 255, 255, alp2test, dxfont1_PantonBold, "center", "center")
        exports["crime_gui"]:guibutton("Cofnij", 752/zmienna, 559/zmienna, 156/zmienna, 47/zmienna, alp2test)
		exports["crime_gui"]:guibutton("Kup pojazd", 1010/zmienna, 559/zmienna, 156/zmienna, 47/zmienna, alp2test)
		exports["crime_gui"]:createEditbox("kolorlampy", 839/zmienna, 396/zmienna, 236/zmienna, 39/zmienna, true, "", false, 16, fontlight, false, 0, { 230, 230, 230, alp2test }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Wpisz kolor", { 230, 230, 230, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:guibutton("Ustaw", 881/zmienna, 454/zmienna, 156/zmienna, 47/zmienna, alp2test)
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

addEventHandler("onClientColShapeHit", resourceRoot, function(hit)
    if hit ~= localPlayer then return end
	if getPedOccupiedVehicle (localPlayer) then return end
    local salon = getElementData(source, "salon")
    if not salon then return end
	ustawienia = salon
	setElementData(localPlayer, "vehsell:info", {
	["model"] = ustawienia['model'],
	["cost"] = ustawienia['cost'],
	["mileage"] = ustawienia['przebieg'],
	["silnik"] = ustawienia['silnik'],
	["cylindry"] = ustawienia['cylindry'],
	["typsilnika"] = ustawienia['typsilnika'],
	["typ"] = ustawienia['typ'],

	})
    setElementData(hit, "colshape:salon", true)
	
	model = getVehicleNameFromModel(ustawienia['model'])
	--if model == "Jester" then model = "Toyota Supra" end 

	modelname = exports["crime_modelnames"]
	model = modelname:getText(model)

	model = ustawienia['name']

	cena = ustawienia['cost']
	przebieg = ustawienia['przebieg']
	silnik = ustawienia['silnik']
	cylindry = ustawienia['cylindry']
	typsilnika = ustawienia['typsilnika']
	typ = ustawienia['typ']

	--tickistart = getTickCount()
	--czas = 500
	--progressdwa = "wlacza"
	guiSetInputMode("no_binds")
	addEventHandler("onClientRender",root,bg)
	panel = 1
	showCursor(true)
end)


addEventHandler("onClientColShapeLeave", resourceRoot, function(hit)
    if hit ~= localPlayer then return end
    local salon = getElementData(source, "salon")
    if not salon then return end
    setElementData(hit, "colshape:salon", false)
	
	--tickistart = getTickCount()
		--czas = 500
		--progressdwa = "wylacza"
		guiSetInputMode("allow_binds")
		showCursor (false)
		if isEventHandlerAdded("onClientRender", root, bg) then
			removeEventHandler ("onClientRender", root, bg)
			panel = 0 
			exports["crime_gui"]:destroyEditbox("kolorauto")
			exports["crime_gui"]:destroyEditbox("kolorlampy")
		end
end)

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(752/zmienna, 559/zmienna, 156/zmienna, 47/zmienna) and panel == 1 then
		--tickistart = getTickCount()
			--czas = 500
			--progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			showCursor (false)
			if isEventHandlerAdded("onClientRender", root, bg) then
				removeEventHandler ("onClientRender", root, bg)
				panel = 0 
			end
end
end
end)

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(881/zmienna, 454/zmienna, 156/zmienna, 47/zmienna) and panel == 2 then
			kolorek = exports["crime_gui"]:getEditboxText("kolorauto")
			kr = 255
			kg = 255 
			kb = 255
			if kolorek == "" then
				exports.crime_gui:addNoti("Nie wpisałeś koloru.", "error")
				kr = 255
				kg = 255 
				kb = 255
			return end

			kolorek = string.lower(kolorek)
			if kolorek == "bialy" then kr = 255 kg = 255 kb = 255 end
			if kolorek == "bordowy" then kr = 128 kg = 0 kb = 0 end
			if kolorek == "czarny" then kr = 0 kg = 0 kb = 0 end
			if kolorek == "czerwony" then kr = 255 kg = 0 kb = 0 end
			if kolorek == "fioletowy" then kr = 184 kg = 3 kb = 255 end
			if kolorek == "limonkowy" then kr = 147 kg = 246 kb = 0 end
			if kolorek == "marchewkowy" then kr = 255 kg = 192 kb = 0 end
			if kolorek == "morski" then kr = 0 kg = 128 kb = 128 end
			if kolorek == "niebieski" then kr = 0 kg = 0 kb = 255 end
			if kolorek == "pomaranczowy" then kr = 242 kg = 59 kb = 28 end
			if kolorek == "rozowy" then kr = 255 kg = 0 kb = 255 end
			if kolorek == "siwy" then kr = 222 kg = 213 kb = 208 end
			if kolorek == "srebrny" then kr = 192 kg = 192 kb = 192 end
			if kolorek == "zloty" then kr = 244 kg = 196 kb = 48 end
			if kolorek == "szary" then kr = 128 kg = 128 kb = 128 end
			if kolorek == "szmaragdowy" then kr = 25 kg = 165 kb = 111 end
			if kolorek == "turkusowy" then kr = 48 kg = 213 kb = 200 end
			if kolorek == "zielony" then kr = 0 kg = 255 kb = 0 end
			if kolorek == "ciemnozielony" then kr = 0 kg = 100 kb = 0 end
			if kolorek == "zolty" then kr = 255 kg = 255 kb = 0 end
			if kolorek == "jasnoniebieski" then kr = 0 kg = 252 kb = 232 end
			if kolorek == "brazowy" then kr = 98 kg = 74 kb = 46 end
			if kolorek == "mietowy" then kr = 0 kg = 252 kb = 161 end
			if kolorek == "sinokoperkowyroz" then kr = 255 kg = 204 kb = 249 end
			if kr == 255 and kg == 255 and kb == 255 and kolorek ~= "bialy" then
				exports.crime_gui:addNoti("Nie znaleziono takiego koloru, poszukaj coś innego.", "error")
			return end
			exports.crime_gui:addNoti("Ustawiono kolor na: "..kolorek..".", "success")
		end
	end
end)

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(881/zmienna, 454/zmienna, 156/zmienna, 47/zmienna) and panel == 3 then
			kolorekl = exports["crime_gui"]:getEditboxText("kolorlampy")
			lr = 255
			lg = 255 
			lb = 255
			if kolorekl == "" then 
				exports.crime_gui:addNoti("Nie wpisałeś koloru.", "error")
				lr = 255
				lg = 255 
				lb = 255
			return end
			if kolorekl == "bialy" then lr = 255 lg = 255 lb = 255 end
			if kolorekl == "bordowy" then lr = 128 lg = 0 lb = 0 end
			if kolorekl == "czarny" then lr = 0 lg = 0 lb = 0 end
			if kolorekl == "czerwony" then lr = 255 lg = 0 lb = 0 end
			if kolorekl == "fioletowy" then lr = 184 lg = 3 lb = 255 end
			if kolorekl == "limonkowy" then lr = 147 lg = 246 lb = 0 end
			if kolorekl == "marchewkowy" then lr = 255 lg = 192 lb = 0 end
			if kolorekl == "morski" then lr = 0 lg = 128 lb = 128 end
			if kolorekl == "niebieski" then lr = 0 lg = 255 lb = 0 end
			if kolorekl == "pomaranczowy" then lr = 242 lg = 59 lb = 28 end
			if kolorekl == "rozowy" then lr = 255 lg = 0 lb = 255 end
			if kolorekl == "siwy" then lr = 222 lg = 213 lb = 208 end
			if kolorekl == "srebrny" then lr = 192 lg = 192 lb = 192 end
			if kolorekl == "zloty" then lr = 244 lg = 196 lb = 48 end
			if kolorekl == "szary" then lr = 128 lg = 128 lb = 128 end
			if kolorekl == "szmaragdowy" then lr = 25 lg = 165 lb = 111 end
			if kolorekl == "turkusowy" then lr = 48 lg = 213 lb = 200 end
			if kolorekl == "zielony" then lr = 0 lg = 255 lb = 0 end
			if kolorekl == "ciemnozielony" then lr = 0 lg = 100 lb = 0 end
			if kolorekl == "zolty" then lr = 255 lg = 255 lb = 0 end
			if kolorekl == "jasnoniebieski" then lr = 0 lg = 252 lb = 232 end
			if kolorekl == "brazowy" then lr = 98 lg = 74 lb = 46 end
			if kolorekl == "mietowy" then lr = 0 lg = 252 lb = 161 end
			if kolorekl == "sinokoperkowyroz" then lr = 255 lg = 204 lb = 249 end
			if lr == 255 and lg == 255 and lb == 255 and kolorekl ~= "bialy" then 
				exports.crime_gui:addNoti("Nie znaleziono takiego koloru, poszukaj coś innego.", "error")
			return end
			exports.crime_gui:addNoti("Ustawiono kolor na: "..kolorek..".", "success")
		end
	end
end)

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(1010/zmienna, 559/zmienna, 156/zmienna, 47/zmienna) and panel == 3 then
			kolor = ""..kr..","..kg..","..kb..""
			lampy = ""..lr..","..lg..","..lb..""
			kuppojazdjuz(ustawienia['typ'])
			--tickistart = getTickCount()
			--czas = 500
			--progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			showCursor (false)
			if isEventHandlerAdded("onClientRender", root, bg) then
				removeEventHandler ("onClientRender", root, bg)
				exports["crime_gui"]:destroyEditbox("kolorlampy")
				panel = 0 
			end
		end
	end
end)

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
		if isMouseIn(1010/zmienna, 559/zmienna, 156/zmienna, 47/zmienna) and panel == 2 then
			exports["crime_gui"]:destroyEditbox("kolorauto")
			panel = 3

		end
	end
end)

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(752/zmienna, 559/zmienna, 156/zmienna, 47/zmienna) and panel == 2 then
			panel = 1
			exports["crime_gui"]:destroyEditbox("kolorauto")
		end
		if isMouseIn(752/zmienna, 559/zmienna, 156/zmienna, 47/zmienna) and panel == 3 then
			panel = 2
			exports["crime_gui"]:destroyEditbox("kolorlampy")
		end
	end
end)



addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
		if isMouseIn(1010/zmienna, 559/zmienna, 156/zmienna, 47/zmienna) and panel == 1 then 
				kuppojazdjuz(ustawienia['typ'])
			--[[else
				kolor = "255,255,255"
				kolor = split(kolor,",")
				for k,v in ipairs(kolor) do
					kr = kolor[1]
					kg = kolor[1]
					kb = kolor[1]
				end
				lampy = "255,255,255"
				lampy = split(lampy,",")
				for k,v in ipairs(lampy) do
					lr = kolor[1]
					lg = kolor[1]
					lb = kolor[1]
				end

				panel = 2 

				bak = 25
				neony = 0
				zamaskowany = 0
				naped = 0 
				drzwidogory = 0 
				atrapa = 0 
				silnik = ustawienia["silnik"]
				tarcze = 0 
				zawieszenie = 0
				karbon = 0 
				chiptuning = 0 
				typsilnika = ustawienia["typsilnika"]
				cylindry = ustawienia["cylindry"]
				trakcja = 0 
				lpg = 0
				us1 = 0
				us2 = 0
				us3 = 0
			end]]--
		end
	end
end)

function kuppojazdjuz(typ) 
	--if typ == "cygan" then 
		triggerServerEvent("zakupPojazdSalon", localPlayer, ustawienia["model"], ustawienia["cost"], 25, ustawienia["przebieg"], "255,255,255", "255,255,255", 0, 0, 0, 0, 0, ustawienia["silnik"], 0, 0, 0, 0, ustawienia["wariant"] or 255, ustawienia["typsilnika"], ustawienia["cylindry"], 0, 0, 0, 0, 0, typ)
	--[[else
		if lampy ~= "255,255,255" then ustawienia["cost"] = ustawienia["cost"]+50000 end 
		triggerServerEvent("zakupPojazdSalon", localPlayer, ustawienia["model"], ustawienia["cost"], 50, ustawienia["przebieg"], kolor, lampy, 0, 0, 0, 0, 0, ustawienia["silnik"], 0, 0, 0, 0, ustawienia["wariant"] or 255, ustawienia["typsilnika"], ustawienia["cylindry"], 0, 0, 0, 0, 0, typ)
	end]]--
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