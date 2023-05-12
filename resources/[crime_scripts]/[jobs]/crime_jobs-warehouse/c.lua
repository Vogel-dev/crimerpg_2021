--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local nazwa = "Magazynier"
local punkty = 0
local opis = "Praca polega na roznoszeniu towaru na \npółki w magazynie."
local wymagania = "Brak"
local zarod = 55
local topka = {}
local mnoznik = 1

local ul1 = 0 
local ul2 = 0 

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
tick = getTickCount()
local panel = false
local zakladka = 1
local start = getTickCount()

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)
local dxfont1_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 32/zmienna)
local dxfont2_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 21/zmienna)
local dxfont3_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 15/zmienna)
local dxfont4_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmienna)
local dxfont3_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)
local dxfont4_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 26/zmienna)


local marker=createMarker(1893.00, -1873.75, 13.53-1,"cylinder",1.5,90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Praca dorywczna\nMagazynier")
setElementData(marker,"mikona","")
local cub = createColCuboid(1893.00, -1873.75, 13.53-1, 9,9,4)

local punktyskrzynie = {
    {1874.8452148438,-1855.9708251953,13.577711105347},
    {1876.5454101563,-1858.7927246094,13.57798576355},
    {1883.6936035156,-1858.876953125,13.576259613037},
    {1886.3604736328,-1855.0504150391,13.574674606323},
    {1883.9816894531,-1849.2999267578,13.573850631714},
    {1872.5847167969,-1852.3757324219,13.57738494873},
    {1881.2747802734,-1852.2537841797,13.575233459473},
    {1897.2729492188,-1860.3146972656,13.573294639587},
    {1897.4610595703,-1857.65234375,13.572599411011},
    {1895.5616455078,-1848.0166015625,13.570709228516},
    {1893.23046875,-1847.7982177734,13.571226119995},
    {1890.9234619141,-1847.8140869141,13.571792602539},
}

local markeryskrzynia = {
    {1893.27, -1868.55, 13.56}
}

local cubskrzynia = createColCuboid(1856.92, -1828.05, -66.44-1, 10,60,4)

function skrzyniaodloz()
    --liczenie koła
		local now = getTickCount()
		local endTime = start + 5000
		local elapsedTime = now - start
		local duration = endTime - start
		local progress = elapsedTime / duration
		local posX, posY, posZ = interpolateBetween ( 0,0,0,360,0,0, progress, "Linear")
		if posX >= 360 then 
			start = getTickCount()
		end
    --dx'y
    dxDrawImage(782/zmienna, 358/zmienna, 351/zmienna, 229/zmienna, ":crime_jobs-warehouse/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawCircle(956/zmienna, 514/zmienna,50/zmienna,0,360,tocolor(45, 45, 45,255),tocolor(25, 25, 25,255), 32, 1)
    dxDrawCircle(956/zmienna, 514/zmienna,50/zmienna,0,posX,tocolor(90, 55, 150,255),tocolor(90, 55, 150,255), 32, 1)
    --dxDrawImage(897/zmienna, 474/zmienna, 127/zmienna, 127/zmienna, ":crime_files/core/wheel.png", posX, 0, 0, tocolor(255, 255, 255, 255), false)
    --dxDrawImage(897/zmienna, 487/zmienna, 127/zmienna, 100/zmienna, ":crime_files/logowanie/new/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end


function gui()
    local ticki = getTickCount()
    if progressdwa == "wlacza" then
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(0,0,0,235,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 235 end 
        if alp2 then alp2test = alp2 else alp2 = 255 end
    else 
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(235,0,0,0,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 0 end 
        if alp2 then alp2test = alp2 else alp2 = 0 end
    end
    if panel == true then 
        --MAIN GUI
            dxDrawImage(451/zmienna, 216/zmienna, 1028/zmienna, 645/zmienna, ":crime_jobs-warehouse/job-window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
            if getElementData(localPlayer,"player:pracadorywczna") == "Magazynier" then 
                exports["crime_gui"]:guibutton("Zakończ",892/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
            else
                exports["crime_gui"]:guibutton("Rozpocznij",892/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
            end
            exports["crime_gui"]:guibutton("Zamknij",1079/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
        if zakladka == 1 then 
            exports["crime_gui"]:guibutton("Ulepszenia",705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
            --OPIS
                exports["crime_gui"]:guitext("Opis pracy:", 484/zmienna, 380/zmienna, 841/zmienna, 438/zmienna, 200, 200, 200, alp2test, dxfont2_PantonBold, "left", "center")
                exports["crime_gui"]:guitext(opis, 484/zmienna, 428/zmienna, 841/zmienna, 568/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
            --Wymagania
                exports["crime_gui"]:guitext("Wymagania:", 484/zmienna, 568/zmienna, 841/zmienna, 626/zmienna, 200, 200, 200, alp2test, dxfont2_PantonBold, "left", "center")
                exports["crime_gui"]:guitext(wymagania, 484/zmienna, 616/zmienna, 841/zmienna, 708/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
            --Zarobki
                exports["crime_gui"]:guitext("Informacje:", 484/zmienna, 708/zmienna, 841/zmienna, 766/zmienna, 200, 200, 200, alp2test, dxfont2_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Zarobki: #5a3795"..mnoznik*zarod.." PLN/paczka#cccccc #00ff7f(x"..mnoznik..")\n#ccccccPunkty: #5a3795"..punkty.."", 484/zmienna, 756/zmienna, 841/zmienna, 809/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
            --Top 5 roboli
                exports["crime_gui"]:guitext("Top pracowników:", 1019/zmienna, 380/zmienna, 1446/zmienna, 438/zmienna, 200, 200, 200, alp2test, dxfont2_PantonBold, "center", "center")
                local liczonko= 0
                for ID2=1,7 do
                    liczonko = liczonko+1
                    local space = 55*(liczonko-1)
                    if topka[ID2] then
                        dxDrawRectangle(1019/zmienna, (438+space)/zmienna, 427/zmienna, 46/zmienna, tocolor(45, 45, 45, alptest), false)
                        dxDrawRectangle(1019/zmienna, (484+space)/zmienna, 427/zmienna, 3/zmienna, tocolor(90, 55, 150, alp2test), false)
                        if liczonko == 1 then 
                            exports["crime_gui"]:guitext("#ffe100"..liczonko..". "..topka[ID2][1].." - #ffe100"..formatujnaprzecinki(topka[ID2][2]).." pkt ", 1019/zmienna, (438+space)/zmienna, 1445/zmienna, (484+space)/zmienna, 200, 200, 200, alp2test, dxfont4_SegoeLight, "center", "center")
                        elseif liczonko == 2 then 
                            exports["crime_gui"]:guitext("#b5b5b5"..liczonko..". "..topka[ID2][1].." - #b5b5b5"..formatujnaprzecinki(topka[ID2][2]).." pkt ", 1019/zmienna, (438+space)/zmienna, 1445/zmienna, (484+space)/zmienna, 200, 200, 200, alp2test, dxfont4_SegoeLight, "center", "center")
                        elseif liczonko == 3 then 
                            exports["crime_gui"]:guitext("#a80000"..liczonko..". "..topka[ID2][1].." - #a80000"..formatujnaprzecinki(topka[ID2][2]).." pkt ", 1019/zmienna, (438+space)/zmienna, 1445/zmienna, (484+space)/zmienna, 200, 200, 200, alp2test, dxfont4_SegoeLight, "center", "center")
                        else    
                            exports["crime_gui"]:guitext("#5a3795"..liczonko..".#cccccc "..topka[ID2][1].." - #5a3795"..formatujnaprzecinki(topka[ID2][2]).." pkt ", 1019/zmienna, (438+space)/zmienna, 1445/zmienna, (484+space)/zmienna, 200, 200, 200, alp2test, dxfont4_SegoeLight, "center", "center")
                        end
                    end
                end
        elseif zakladka == 2 then 
            exports["crime_gui"]:guibutton("Informacje",705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna, alp2test)
            --ULEPSZENIE 1 
                dxDrawImage(462/zmienna, 371/zmienna, 73/zmienna, 73/zmienna, ":crime_files/other/cos.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                exports["crime_gui"]:guitext("Sprinter", 545/zmienna, 377/zmienna, 789/zmienna, 409/zmienna, 200, 200, 200, alp2test, dxfont3_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Umożliwia bieganie", 545/zmienna, 409/zmienna, 894/zmienna, 440/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext("", 472/zmienna, 381/zmienna, 525/zmienna, 434/zmienna, 200, 200, 200, alp2test, dxfont4_FA5, "center", "center")
                if ul1 == 0 then
                    exports["crime_gui"]:guibutton("Kup (#FF0000-2,000pkt#cccccc)",472/zmienna, 454/zmienna, 239/zmienna, 44/zmienna, alp2test)
                else 
                    exports["crime_gui"]:guibutton("#00FF00√ Posiadasz",472/zmienna, 454/zmienna, 239/zmienna, 44/zmienna, alp2test)
                end
            --ULEPSZENIE 2 
                dxDrawImage(462/zmienna, 508/zmienna, 73/zmienna, 73/zmienna, ":crime_files/other/cos.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                exports["crime_gui"]:guitext("Siłacz", 545/zmienna, 513/zmienna, 789/zmienna, 545/zmienna, 200, 200, 200, alp2test, dxfont3_PantonBold, "left", "center")
                exports["crime_gui"]:guitext("Nosisz większe paczki przez co zarabiasz więcej", 545/zmienna, 545/zmienna, 894/zmienna, 576/zmienna, 200, 200, 200, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext("", 472/zmienna, 518/zmienna, 525/zmienna, 571/zmienna, 200, 200, 200, alp2test, dxfont4_FA5, "center", "center")
                if ul2 == 0 then
                    exports["crime_gui"]:guibutton("Kup (#FF0000-3,000pkt#cccccc)",472/zmienna, 591/zmienna, 239/zmienna, 44/zmienna, alp2test)
                else 
                    exports["crime_gui"]:guibutton("#00FF00√ Posiadasz",472/zmienna, 591/zmienna, 239/zmienna, 44/zmienna, alp2test)
                end
        end
    end
end

--Kup ulepszenie
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(472/zmienna, 454/zmienna, 239/zmienna, 44/zmienna) and panel == true and zakladka == 2 and ul1 == 0 then
            triggerServerEvent("magazynier:kupulepszenie", localPlayer, 1, 2000)
        elseif isMouseIn(472/zmienna, 591/zmienna, 239/zmienna, 44/zmienna) and panel == true and zakladka == 2 and ul2 == 0 then
            triggerServerEvent("magazynier:kupulepszenie", localPlayer, 2, 3000)
        end
    end
end)

--WLACZANIE
addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(localPlayer)
    if veh then return end
    if not isElementWithinColShape(localPlayer,cub) then return end
    triggerServerEvent("magazynier:dajinfo", localPlayer)
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wlacza"
	addEventHandler("onClientRender",root,gui)
	panel = true
	showCursor(true,false)
end)

--WYLACZANIE
addEventHandler("onClientMarkerLeave", marker, function(el,md)
	if el~=localPlayer then return end
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
end)

--WYLACZENIE KLIK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true and zakladka == 2 then
            zakladka = 1
        elseif isMouseIn(705/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true and zakladka == 1 then
            zakladka = 2
        end
    end
end)

--Zmiana zakładki
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(1079/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true then
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
end)

--ROZPOCZYNANIE/KONCZENIE PRACY
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(892/zmienna, 296/zmienna, 146/zmienna, 44/zmienna) and panel == true then
            local pracadorywcza = getElementData(localPlayer,"player:pracadorywczna")
            if pracadorywcza == "Magazynier" then --KONCZENIE
                zakonczprace()
            else --ROZPOCZYNANIE
                if getElementData(localPlayer,"player:pracadorywczna") then exports.crime_gui:addNoti("Już gdzieś pracujesz, jedź się zwolnij.", "error") return end
                if not getElementData(localPlayer,"player:uid") then exports.crime_gui:addNoti("Nie posiadasz UID.", "error") return end
                if getElementData(localPlayer,"player:admin") then exports.crime_gui:addNoti("Zejdź z duty administracji.", "error") return end

                rozpocznijprace()
            end
        end
    end
end)

function rozpocznijprace()
    setElementData(localPlayer,"player:pracadorywczna", "Magazynier")
    exports.crime_gui:addNoti("Rozpocząłeś prace magazyniera.", "success")
    if ul1 == 0 then 
        toggleControl("sprint", false) 
    end
    toggleControl("jump", false) 
    toggleControl("crouch", false) 
end

function zakonczprace()
    setElementData(localPlayer,"player:pracadorywczna", false)
    exports.crime_gui:addNoti("Zakończyłeś prace magazyniera.", "success")
    toggleControl("sprint", true) 
    toggleControl("jump", true) 
    toggleControl("crouch", true) 
    setElementData(localPlayer,"player:niesiekrzynie",false)
    if isElement(punkts) then 
        destroyElement(punkts)
        if isElement(blip) then
            destroyElement(blip)
        end
        triggerServerEvent("magazynier:animka", localPlayer, "wylacz")
        triggerServerEvent("magazynier:skrzynia", localPlayer, "zabierz")
    end
end

function podniesskrzynie(el,md)
    if el~=localPlayer then return end
    local pracadorywcza = getElementData(localPlayer,"player:pracadorywczna")
    if pracadorywcza == "Magazynier" then
        if not getElementData(localPlayer,"player:niesiekrzynie") then 
            losowypunkt()
            triggerServerEvent("magazynier:animka", localPlayer, "wlacz")
            triggerServerEvent("magazynier:skrzynia", localPlayer, "daj")
        end
    end
end

for i,v in pairs(markeryskrzynia) do 
    local markerskrzynia=createMarker(v[1], v[2], v[3]-1,"cylinder",1.5,85,107,47,1)
    setElementData(markerskrzynia,"mpod",true)
    setElementData(markerskrzynia,"mtekst","Podnieś towar")
    setElementData(markerskrzynia,"mikona","")
    addEventHandler("onClientMarkerHit", markerskrzynia, podniesskrzynie)
end

function losowypunkt()
    local punkt = math.random(1,#punktyskrzynie)
    if punkt then 
        punkts = createMarker(punktyskrzynie[punkt][1], punktyskrzynie[punkt][2], punktyskrzynie[punkt][3]-0.9,"cylinder",1.5,90, 55, 150,1)
        blip = createBlipAttachedTo(punkts,41)
        attachElementToElement(punkts,blip)
        setElementData(punkts,"mpod",true)
        setElementData(punkts,"mtekst","Odłóż towar")
        setElementData(punkts,"mtype","praca")
        setElementData(punkts,"mikona","")
        addEventHandler("onClientMarkerHit", punkts, wszedlwpunkt)
        setElementData(localPlayer,"player:niesiekrzynie",true)
    end
end

function wszedlwpunkt(el,md)
    if el~=localPlayer then return end
    setElementFrozen(localPlayer,true)
    start = getTickCount()
    addEventHandler ("onClientRender", root, skrzyniaodloz)
    setTimer(function()
        removeEventHandler ("onClientRender", root, skrzyniaodloz)
        setElementFrozen(localPlayer,false)
        destroyElement(punkts)
        destroyElement(blip)
        setElementData(localPlayer,"player:niesiekrzynie",false)
        triggerServerEvent("magazynier:animka", localPlayer, "wylacz")
        triggerServerEvent("magazynier:skrzynia", localPlayer, "zabierz")
        triggerServerEvent("magazynier:dodajpunkt", localPlayer)
        triggerServerEvent("magazynier:hajs", localPlayer, zarod*mnoznik)

        local pexp = getElementData(localPlayer,"player:exp") or 0 
        setElementData(localPlayer,"player:exp",pexp+3)

    end, 5000, 1)
end

addEvent("magazynier:oddajinfo", true)
addEventHandler("magazynier:oddajinfo", root, function(result,resultdwa)
    topka = {}
    for i,v in pairs(result) do
		table.insert(topka, {v["login"], v["magazynierpkt"]})
    end
    for i,v in pairs(resultdwa) do
        punkty = v["magazynierpkt"]
        ul1 = v["magazynierul1"]
        ul2 = v["magazynierul2"]
	end
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

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
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

