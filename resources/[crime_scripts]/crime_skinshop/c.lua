--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

--ID, Cena, typ 0 - zwykly 1 - premium, wybrany
local skiny = {
    {0,0,0,false},
    {2,500,0,false},
    {11,500,0,false},
    {12,500,0,false},
    {16,500,0,false},
    {18,500,0,false},
    {19,500,0,false},
    {21,500,0,false},
    {28,500,0,false},
    {29,500,0,false},
    {40,500,0,false},
    {41,500,0,false},
    {45,500,0,false},
    {46,500,0,false},
    {69,500,0,false},
    {78,500,0,false},
    {93,500,0,false},
    {102,500,0,false},
    {116,500,0,false},
    {130,500,0,false},
    {131,500,0,false},
    {139,500,0,false},
    {140,500,0,false},
    {159,500,0,false},
    {312,1000,1,false},
    {311,1000,1,false},
    {310,1000,1,false},
    {309,1000,1,false},
    {308,1000,1,false},
    {307,1000,1,false},
    {306,1000,1,false},
    {305,1000,1,false},
    {304,1000,1,false},
    {303,1000,1,false},
    {302,1000,1,false},
    {299,1000,1,false},
    {298,1000,1,false},
    {297,1000,1,false},
    {296,1000,1,false},
    {295,1000,1,false},
    {294,1000,1,false},
    {292,1000,1,false},
    {291,1000,1,false},
    {290,1000,1,false},
    {288,1000,1,false},
    {287,1000,1,false},
    {286,1000,1,false},
    {285,1000,1,false},
    {284,1000,1,false},
    {283,1000,1,false},
    {282,1000,1,false},
    {278,1000,1,false},
    {277,1000,1,false},
    {276,1000,1,false},
    {275,1000,1,false},
    {274,1000,1,false},
    {272,1000,1,false},
    {271,1000,1,false},
    {270,1000,1,false},
    {269,1000,1,false},
    {268,1000,1,false},
    {267,1000,1,false},
    {266,1000,1,false},
    {265,1000,1,false},
    {264,1000,1,false},
    {263,1000,1,false},
    {262,1000,1,false},
    {261,1000,1,false},
    {260,1000,1,false},
    {259,1000,1,false},
    {258,1000,1,false},
    {257,1000,1,false},
    {256,1000,1,false},
    {255,1000,1,false},
    {254,1000,1,false},
    {253,1000,1,false},
    {252,1000,1,false},
    {251,1000,1,false},
    {250,1000,1,false},
    {249,1000,1,false},
    {248,1000,1,false},
    {247,1000,1,false},
    {246,1000,1,false},
    {245,1000,1,false},
    {244,1000,1,false},
    {243,1000,1,false},
    {242,1000,1,false},
    {241,1000,1,false},
    {240,1000,1,false},
    {239,1000,1,false},
    {238,1000,1,false},
    {237,1000,1,false},
    {236,1000,1,false},
    {235,1000,1,false},
    {234,1000,1,false},
    {233,1000,1,false},
    {232,1000,1,false},
    {231,1000,1,false},
    {230,1000,1,false},
    {229,1000,1,false},
    {228,1000,1,false},
    {227,1000,1,false},
    {226,1000,1,false},
    {225,1000,1,false},
    {224,1000,1,false},
    {223,1000,1,false},
    {222,1000,1,false},
    {221,1000,1,false},
    {220,1000,1,false},
    {219,1000,1,false},
    {218,1000,1,false},
    {217,1000,1,false},
    {216,1000,1,false},
}

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
tick = getTickCount()
local panel = false
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 23/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 19/zmienna)

local naekranie = 7
naekranie = naekranie-1
local obecnie = 1

local marker=createMarker(1710.7454833984,-1712.0727539063,13.6484375-1,"cylinder",1.5,90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Zmiana skina")
setElementData(marker,"mikona","")
local cub = createColCuboid(1708.1362304688,-1715.2165527344,13.6484375-1, 5,5,4)

function gui()
    local ticki = getTickCount()
    if progressdwa == "wlacza" then
        local alp = 200
        local alp2 = 255
        if alp then alptest = alp else alp = 200 end 
        if alp2 then alp2test = alp2 else alp2 = 255 end
    else 
        local alp = 200
        local alp2 = 255
        if alp then alptest = alp else alp = 0 end 
        if alp2 then alp2test = alp2 else alp2 = 0 end
    end
    if panel == true then 
        dxDrawImage(639/zmienna, 204/zmienna, 612/zmienna, 672/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
        exports["crime_gui"]:guibutton("Kup",708/zmienna, 810/zmienna, 200/zmienna, 57/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Zamknij",974/zmienna, 810/zmienna, 200/zmienna, 57/zmienna, alp2test)
        exports["crime_gui"]:guibutton("Podgląd",840/zmienna, 743/zmienna, 200/zmienna, 57/zmienna, alp2test)
        pasekpoprawej(naekranie,skiny,55,obecnie,1198,293+48)
		local liczmnie = 0
		for ID2=obecnie,naekranie+obecnie do
			liczmnie = liczmnie+1
			local space = 55*(liczmnie-1)
            if not skiny[ID2] then return end
            if skiny[ID2][4] == true then 
                dxDrawRectangle(685/zmienna, (293+space+20)/zmienna, 512/zmienna, 51/zmienna, tocolor(25, 25, 25, alptest), false)
                dxDrawRectangle(685/zmienna, (342+space+20)/zmienna, 512/zmienna, 2/zmienna, tocolor(90, 55, 150, alp2test), false)
            else
                dxDrawRectangle(685/zmienna, (293+space+20)/zmienna, 512/zmienna, 51/zmienna, tocolor(45, 45, 45, alptest), false)
                dxDrawRectangle(685/zmienna, (342+space+20)/zmienna, 512/zmienna, 2/zmienna, tocolor(90, 55, 150, alp2test), false)
            end
            if skiny[ID2][3] == 0 then 
                exports["crime_gui"]:guitext("ID: #5a3795"..skiny[ID2][1],703/zmienna, (297+space+20)/zmienna, 1191/zmienna, (338+space+20)/zmienna , 200, 200, 200, alp2test, dxfont1_FiraEC, "left", "center")
                exports["crime_gui"]:guitext("Cena: #5a3795"..skiny[ID2][2].." PLN",685/zmienna, (297+space+20)/zmienna, 1173/zmienna, (338+space+20)/zmienna , 200, 200, 200, alp2test, dxfont1_FiraEC, "right", "center")
            else
                exports["crime_gui"]:guitext("ID: #FFFF00"..skiny[ID2][1],703/zmienna, (297+space+20)/zmienna, 1191/zmienna, (338+space+20)/zmienna , 200, 200, 200, alp2test, dxfont1_FiraEC, "left", "center")
                exports["crime_gui"]:guitext("Cena: #FFFF00"..skiny[ID2][2].." PLN",685/zmienna, (297+space+20)/zmienna, 1173/zmienna, (338+space+20)/zmienna , 200, 200, 200, alp2test, dxfont1_FiraEC, "right", "center")
            end
		end
    end
end

--WLACZANIE
addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if veh then return end
    if not isElementWithinColShape(localPlayer,cub) then return end
    setElementData(localPlayer,"przebieralnia",getElementModel(localPlayer))
	--tickistart = getTickCount()
	--czas = 500
	--progressdwa = "wlacza"
	addEventHandler("onClientRender",root,gui)
	panel = true
	showCursor(true,false)
end)

--WYLACZANIE
addEventHandler("onClientMarkerLeave", marker, function(el,md)
	if el~=localPlayer then return end
	--tickistart = getTickCount()
    --czas = 500
    --progressdwa = "wylacza"
    guiSetInputMode("allow_binds")
    showCursor (false)
    setElementModel(localPlayer,getElementData(localPlayer,"przebieralnia"))
    if isEventHandlerAdded("onClientRender", root, gui) then
        removeEventHandler ("onClientRender", root, gui)
        panel = false 
    end
end)

--Zaznaczenie skina
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(683/zmienna, (292+20)/zmienna, 514/zmienna, 381/zmienna) and panel == true then
            for i,v in pairs(skiny) do 
                skiny[i][4] = false
            end
            liczmnie = 0
            for ID2=obecnie,naekranie+obecnie do
                liczmnie = liczmnie+1
                local space = 55*(liczmnie-1)
                if not skiny[ID2] then return end
                if isMouseIn(683/zmienna, (292+space+20)/zmienna, 512/zmienna, 51/zmienna) and panel == true then
                    skiny[ID2][4] = true
                end
            end
        end
    end
end)

--WYLACZENIE KLIK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(974/zmienna, 810/zmienna, 200/zmienna, 57/zmienna) and panel == true then
            --tickistart = getTickCount()
            --czas = 500
            --progressdwa = "wylacza"
            guiSetInputMode("allow_binds")
            showCursor (false)
            setElementModel(localPlayer,getElementData(localPlayer,"przebieralnia"))
            if isEventHandlerAdded("onClientRender", root, gui) then
                removeEventHandler ("onClientRender", root, gui)
                panel = false 
            end
        end
    end
end)

--PODGLĄD KLIK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(840/zmienna, 743/zmienna, 200/zmienna, 57/zmienna) and panel == true then
            for i,v in pairs(skiny) do 
                if skiny[i][4] == true then 
                    setElementModel(localPlayer,skiny[i][1])
                    tickistart = getTickCount()
                    czas = 500
                    progressdwa = "wylacza"
                    guiSetInputMode("allow_binds")
                    showCursor (false)
                    setTimer(function()
                        if isEventHandlerAdded("onClientRender", root, gui) then
                            removeEventHandler ("onClientRender", root, gui)
                            panel = false 
                        end
                    end, 500, 1)
                end
            end
        end
    end
end)

--KUP MNIE OK?
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(708/zmienna, 810/zmienna, 200/zmienna, 57/zmienna) and panel == true then
            for i,v in pairs(skiny) do 
                if skiny[i][4] == true then 
                    triggerServerEvent("kupskinamiok",localPlayer,skiny[i][2],skiny[i][3],skiny[i][1])
                end
            end
        end
    end
end)

function dogory() 
	if isMouseIn(683/zmienna, (292+20)/zmienna, 514/zmienna, 381/zmienna) and panel == true then
    	if obecnie == 1 then return end
		obecnie = obecnie-1
	end
end

function dodolu()
	if isMouseIn(683/zmienna, (292+20)/zmienna, 514/zmienna, 381/zmienna) and panel == true then
    	if obecnie+naekranie+1 > table.maxn(skiny) then return end
		obecnie = obecnie+1
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