--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local bankomaty={
--x,y,z, rx, ry, rz, INT, DIM,
{1926.70, -1765.30, 13.54,0,0,180}, -- stacja gangsterka
{2496.64, -1513.99, 24.00,0,0,180}, -- cygan
{1003.62, -1849.29, 12.82,0,0,80}, -- gielda
{1001.79, -929.50, 42.33,0,0,-80}, -- cpn vine
{661.35, -576.68, 16.34,0,0,-90}, -- cpn obok szkoły
{2566.40, -1629.60, 1672.15,0,0,0, 1, 0}, -- urzad
{2224.3969726563,-1455.177734375,24.04843711853,0,0,150, 0, 0}, -- gielda
{1759.6408691406,-1723.3025146484,13.546875, 0, 0,357.44674682617}, -- salon
{1367.2131347656,-1275.4910888672,13.546875, 0, 0,270.09201049805}, -- sklep z bronią białą
{1667.623046875,-1565.8045654297,13.5468750, 0, 0,275.4719543457} -- prawo jazdy

}

for i,v in ipairs(bankomaty) do

	v.obiekt=createObject(2942,v[1],v[2],v[3]-0.4,v[4],v[5],v[6])
	setElementInterior(v.obiekt,v[7] or 0)
	setElementDimension(v.obiekt,v[8] or 0)
	setElementFrozen(v.obiekt,true)
	setObjectBreakable ( v.obiekt, false )
	v.cs=createColSphere(v[1],v[2],v[3]-0.4+1, 1)
	setElementInterior(v.cs,v[7] or 0)
	setElementDimension(v.cs,v[8] or 0)
	setElementData(v.cs,"bankomat",true)
	
	v.blip=createBlip(v[1], v[2], v[3], 38, 0, 0, 0, 0, 0, 0, 200)
	setElementInterior(v.blip,v[7] or 0)
	setElementDimension(v.blip,v[8] or 0)
end

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 20/zmienna)
local dxfont1_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 19/zmienna)
local fontlight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)

local dxfont0_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmienna)


panel = 0 
tick = getTickCount()
kasabank = 0

local historia = {}
local naekranie = 12
naekranie = naekranie-1
local obecnie = 1

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

function gui()
	local ticki = getTickCount()
	if progressdwa == "wlacza" then
		local Progress = (ticki-tickistart)/czas
		local alp = interpolateBetween(0,0,0,180,0,0,Progress,"Linear")
		local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
		if alp then alptest = alp else alp = 200 end 
		if alp2 then alp2test = alp2 else alp2 = 255 end
	else 
		local Progress = (ticki-tickistart)/czas
		local alp = interpolateBetween(180,0,0,0,0,0,Progress,"Linear")
		local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
		if alp then alptest = alp else alp = 0 end 
		if alp2 then alp2test = alp2 else alp2 = 0 end
	end
	if panel == 1 then
		dxDrawImage(654/zmienna, 281/zmienna, 612/zmienna, 518/zmienna, ":crime_atms/bankomat.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

		exports["crime_gui"]:guitext( ""..formatujnaprzecinki(kasabank).." PLN", 737/zmienna, 377/zmienna, 1183/zmienna, 453/zmienna, 200, 200, 200, alp2test, dxfont1_FA5)

		exports["crime_gui"]:guibutton( "Wpłać", 884/zmienna, 541/zmienna, 159/zmienna, 48/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Wypłać", 884/zmienna, 599/zmienna, 159/zmienna, 48/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Historia", 762/zmienna, 663/zmienna, 169/zmienna, 51/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Przelej", 990/zmienna, 663/zmienna, 169/zmienna, 51/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Zamknij", 874/zmienna, 724/zmienna, 169/zmienna, 51/zmienna, alp2test)

		exports["crime_gui"]:createEditbox("bankomat:1", 867/zmienna, 470/zmienna, 193/zmienna, 46/zmienna, true, "", false, 16, fontlight, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Kwota", { 230, 230, 230, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)

	end
	if panel == 2 then 
		dxDrawImage(654/zmienna, 281/zmienna, 612/zmienna, 518/zmienna, ":crime_atms/bankomat.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)


		exports["crime_gui"]:guibutton( "Wróć", 874/zmienna, 724/zmienna, 169/zmienna, 51/zmienna, alp2test)

		local liczmnie = 0
		for ID2=obecnie,naekranie+obecnie do
			liczmnie = liczmnie+1
			local space = 29*(liczmnie-1)
			if not historia[ID2] then return end
			if historia[ID2][2] == "wplata" then 
				exports["crime_gui"]:guitext("#ccccccWpłata #00FF00+"..formatujnaprzecinki(historia[ID2][3]).." #cccccc"..historia[ID2][4], 736/zmienna, (370+space)/zmienna, 1184/zmienna, (399+space)/zmienna ,255,255,255,alp2test,dxfont0_SegoeLight)
			end
			if historia[ID2][2] == "wyplata" then 
				exports["crime_gui"]:guitext("#ccccccWypłata #FF0000-"..formatujnaprzecinki(historia[ID2][3]).." #cccccc"..historia[ID2][4], 736/zmienna, (370+space)/zmienna, 1184/zmienna, (399+space)/zmienna ,255,255,255,alp2test, dxfont0_SegoeLight)
			end
			if historia[ID2][2] == "przelewdla" then 
				exports["crime_gui"]:guitext("#ccccccPrzelew #FF0000-"..formatujnaprzecinki(historia[ID2][3]).." #cccccc"..historia[ID2][4].." Dla: "..historia[ID2][5], 736/zmienna, (370+space)/zmienna, 1184/zmienna, (399+space)/zmienna ,255,255,255,alp2test, dxfont0_SegoeLight)
			end
			if historia[ID2][2] == "przelewod" then 
				exports["crime_gui"]:guitext("#ccccccPrzelew #00FF00+"..formatujnaprzecinki(historia[ID2][3]).." #cccccc"..historia[ID2][4].." Od: "..historia[ID2][5], 736/zmienna, (370+space)/zmienna, 1184/zmienna, (399+space)/zmienna ,255,255,255,alp2test, dxfont0_SegoeLight)
			end
			if historia[ID2][2] == "gielda" then 
				exports["crime_gui"]:guitext("#ccccccGiełda #00FF00+"..formatujnaprzecinki(historia[ID2][3]).." #cccccc"..historia[ID2][4], 736/zmienna, (370+space)/zmienna, 1184/zmienna, (399+space)/zmienna ,255,255,255,alp2test, dxfont0_SegoeLight)
			end
		end
	end
	if panel == 3 then 
		dxDrawImage(654/zmienna, 281/zmienna, 612/zmienna, 518/zmienna, ":crime_atms/bankomat.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

		exports["crime_gui"]:guitext( ""..formatujnaprzecinki(kasabank).." PLN", 737/zmienna, 377/zmienna, 1183/zmienna, 453/zmienna, 200, 200, 200, alp2test, dxfont1_FA5)

		exports["crime_gui"]:guibutton( "Przelej", 884/zmienna, 599/zmienna, 159/zmienna, 48/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Cofnij", 879/zmienna, 724/zmienna, 169/zmienna, 51/zmienna, alp2test)

		exports["crime_gui"]:createEditbox("bankomat:1", 867/zmienna, 470/zmienna, 193/zmienna, 46/zmienna, true, "", false, 16, fontlight, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Kwota", { 230, 230, 230, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:createEditbox("bankomat:2", 867/zmienna, 525/zmienna, 193/zmienna, 46/zmienna, true, "", false, 16, fontlight, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "UID", { 230, 230, 230, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)
	end
end

addEventHandler("onClientColShapeHit", resourceRoot, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
	if veh then return end
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wlacza"
	addEventHandler("onClientRender",root,gui)
	panel = 1
	showCursor(true,false)

	triggerServerEvent("onPlayerRequestATMInfo", resourceRoot)
end)

addEventHandler("onClientColShapeLeave", resourceRoot, function(el,md)
	if not md or el~=localPlayer then return end

	tickistart = getTickCount()
		czas = 500
		progressdwa = "wylacza"
		guiSetInputMode("allow_binds")
		showCursor(false)
		setTimer(function()
			if isEventHandlerAdded("onClientRender", root, gui) then
				removeEventHandler ("onClientRender", root, gui)
				exports["crime_gui"]:destroyEditbox("bankomat:1")
				panel = 0
			end
		end, 500, 1)
end)

addEvent("doFillATMInfo", true)
addEventHandler("doFillATMInfo", resourceRoot, function(success, balance)
	if not success then
			kasabank = "ERROR"
		return
	end
	kasabank = balance
end)


addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(874/zmienna, 724/zmienna, 169/zmienna, 51/zmienna) and panel == 1 then --ZAMYKANIE
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			guiSetInputMode("allow_binds")
			showCursor(false)
			setTimer(function()
				if isEventHandlerAdded("onClientRender", root, gui) then
					removeEventHandler ("onClientRender", root, gui)
					exports["crime_gui"]:destroyEditbox("bankomat:1")
					exports["crime_gui"]:destroyEditbox("bankomat:2")
					panel = 0
				end
			end, 500, 1)
		end
		if isMouseIn(884/zmienna, 541/zmienna, 159/zmienna, 48/zmienna) and panel == 1 then --WPLACANIE
			kwota = math.floor(exports["crime_gui"]:getEditboxText("bankomat:1"))
			if kwota < 10 then exports.crime_gui:addNoti("Bankomat wpłaca minimum 10 PLN.", "error") return end
			if kwota > getPlayerMoney(localPlayer) then exports.crime_gui:addNoti("Nie posiadasz tyle pieniędzy!", "error") return end
			triggerServerEvent("bankomat:wplac", resourceRoot, kwota)

		end
		if isMouseIn(884/zmienna, 599/zmienna, 159/zmienna, 48/zmienna) and panel == 1 then --WYPLACANIE
			kwota = math.floor(exports["crime_gui"]:getEditboxText("bankomat:1"))
			if getPlayerMoney(localPlayer)+kwota > 99999999 then exports.crime_gui:addNoti("Nie możesz posiadać przy sobie tyle pieniędzy!", "error") return end
			if kwota < 10 then exports.crime_gui:addNoti("Bankomat wypłaca minimum 10 PLN.", "error") return end
			triggerServerEvent("bankomat:wyplac", resourceRoot, kwota)
		end
		if isMouseIn(762/zmienna, 663/zmienna, 169/zmienna, 51/zmienna) and panel == 1 then --HISTORIA ODPALANIE
			triggerServerEvent("wyszukajhistoriebank", localPlayer)
			historia = {}
			obecnie = 1
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				panel = 2
				exports["crime_gui"]:destroyEditbox("bankomat:1")
			end, 500, 1)
		end
		if isMouseIn(990/zmienna, 663/zmienna, 169/zmienna, 51/zmienna) and panel == 1 then --PRZELEJ ODPALANIE
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				panel = 3
				exports["crime_gui"]:destroyEditbox("bankomat:1")
			end, 500, 1)
		end
		if isMouseIn(874/zmienna, 724/zmienna, 169/zmienna, 51/zmienna) and panel == 2 then --HISTORIA WYLACZANIE
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				panel = 1
			end, 500, 1)
		end
		if isMouseIn(879/zmienna, 724/zmienna, 169/zmienna, 51/zmienna) and panel == 3 then --PRZELEJ WYLACZANIE
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
				panel = 1
				exports["crime_gui"]:destroyEditbox("bankomat:1")
				exports["crime_gui"]:destroyEditbox("bankomat:2")
			end, 500, 1)
		end
		if isMouseIn(884/zmienna, 599/zmienna, 159/zmienna, 48/zmienna) and panel == 3 then --PRZELEJ WYLACZANIE
			kwota = math.floor(exports["crime_gui"]:getEditboxText("bankomat:1"))
			uid = exports["crime_gui"]:getEditboxText("bankomat:2")
			if kwota < 1 then exports.crime_gui:addNoti("Przelew to minimum 1 PLN.", "error") return end
			if kwota > kasabank then exports.crime_gui:addNoti("Nie posiadasz tyle pieniędzy na koncie!", "error") return end
			triggerServerEvent("bankomat:przelej", resourceRoot, kwota, uid)
		end
    end
end)

addEvent("bankomat:dotabeli", true)
addEventHandler("bankomat:dotabeli", root, function(result)
	if not result then return end
	for i,v in pairs(result) do
		table.insert(historia, {v["id"], v["typ"], v["kwota"], v["data"], v["odkogo"]})
	end
end)

function dogorybank() 
	if isMouseIn(736/zmienna, 369/zmienna, 449/zmienna, 352/zmienna) and panel == 2 then
    	if obecnie == 1 then return end
		obecnie = obecnie-1
	end
end

function dodolubank()
	if isMouseIn(736/zmienna, 369/zmienna, 449/zmienna, 352/zmienna) and panel == 2 then
    	if obecnie+naekranie+1 > table.maxn(historia) then return end
		obecnie = obecnie+1
	end
end
bindKey ("mouse_wheel_up", "down", dogorybank )
bindKey ("mouse_wheel_down", "down", dodolubank )






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