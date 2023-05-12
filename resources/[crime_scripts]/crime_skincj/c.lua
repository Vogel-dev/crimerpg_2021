--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local koszulki = {
    {"player_torso","torso"},
    {"vestblack","vest"},
    {"vest","vest"},
    {"tshirt2horiz","tshirt2"},
    {"tshirtwhite","tshirt"},
    {"tshirtilovels","tshirt"},
    {"tshirtblunts","tshirt"},
    {"shirtbplaid","shirtb"},
    {"shirtbcheck","shirtb"},
    {"field","field"},
    {"tshirterisyell","tshirt"},
    {"tshirterisorn","tshirt"},
    {"trackytop2eris","trackytop1"},
    {"bbjackrim","bbjack"},
    {"bballjackrstar","bbjack"},
    {"baskballdrib","baskball"},
    {"baskballrim","baskball"},
    {"sixtyniners","tshirt"},
    {"bandits","baseball"},
    {"tshirtprored","tshirt"},
    {"tshirtproblk","tshirt"},
    {"trackytop1pro","trackytop1"},
    {"hockeytop","sweat"},
    {"bbjersey","sleevt"},
    {"shellsuit","trackytop1"},
    {"tshirtheatwht","tshirt"},
    {"tshirtbobomonk","tshirt"},
    {"tshirtbobored","tshirt"},
    {"tshirtbase5","tshirt"},
    {"tshirtsuburb","tshirt"},
    {"hoodyamerc","hoodya"},
    {"hoodyabase5","hoodya"},
    {"hoodyarockstar","hoodya"},
    {"wcoatblue","wcoat"},
    {"coach","coach"},
    {"coachsemi","coach"},
    {"sweatrstar","sweat"},
    {"hoodyAblue","hoodyA"},
    {"hoodyAblack","hoodyA"},
    {"hoodyAgreen","hoodyA"},
    {"sleevtbrown","sleevt"},
    {"shirtablue","shirta"},
    {"shirtayellow","shirta"},
    {"shirtagrey","shirta"},
    {"shirtbgang","shirtb"},
    {"tshirtzipcrm","tshirt"},
    {"tshirtzipgry","tshirt"},
    {"denimfade","denim"},
    {"bowling","hawaii"},
    {"hoodjackbeige","hoodjack"},
    {"baskballloc","baskball"},
    {"tshirtlocgrey","tshirt"},
    {"tshirtmaddgrey","tshirt"},
    {"tshirtmaddgrn","tshirt"},
    {"suit1grey","suit1"},
    {"suit1blk","suit1"},
    {"leather","leather"},
    {"painter","painter"},
    {"hawaiiwht","hawaii"},
    {"hawaiired","hawaii"},
    {"sportjack","trackytop1"},
    {"suit1red","suit1"},
    {"suit1blue","suit1"},
    {"suit1yellow","suit1"},
    {"suit2grn","suit2"},
    {"tuxedo","suit2"},
    {"suit1gang","suit1"},
    {"letter","sleevt"},
}

local fryzury = {
    {"player_face","head"},
    {"hairblond","head"},
    {"hairred","head"},
    {"hairblue","head"},
    {"hairgreen","head"},
    {"hairpink","head"},
    {"bald","head"},
    {"baldbeard","head"},
    {"baldtash","head"},
    {"baldgoatee","head"},
    {"highfade","head"},
    {"highafro","highafro"},
    {"wedge","wedge"},
    {"slope","slope"},
    {"jhericurl","jheri"},
    {"cornrows","cornrows"},
    {"cornrowsb","cornrows"},
    {"tramline","tramline"},
    {"groovecut","groovecut"},
    {"mohawk","mohawk"},
    {"mohawkblond","mohawk"},
    {"mohawkpink","mohawk"},
    {"mohawkbeard","mohawk"},
    {"afro","afro"},
    {"afrotash","afro"},
    {"afrobeard","afro"},
    {"afroblond","afro"},
    {"flattop","flattop"},
    {"elvishair","elvishair"},
    {"beard","head"},
    {"tash","head"},
    {"goatee","head"},
    {"afrogoatee","afro"},
}

local spodnie = {
    {"player_legs","legs"},
    {"worktrcamogrn","worktr"},
    {"worktrcamogry","worktr"},
    {"worktrgrey","worktr"},
    {"worktrkhaki","worktr"},
    {"tracktr","tracktr"},
    {"tracktreris","tracktr"},
    {"jeansdenim","jeans"},
    {"legsblack","legs"},
    {"legsheart","legs"},
    {"biegetr","chinosb"},
    {"tracktrpro","tracktr"},
    {"tracktrwhstr","tracktr"},
    {"tracktrblue","tracktr"},
    {"tracktrgang","tracktr"},
    {"bbshortwht","boxingshort"},
    {"boxshort","boxingshort"},
    {"bbshortred","boxingshort"},
    {"shellsuittr","tracktr"},
    {"shortsgrey","shorts"},
    {"shortskhaki","shorts"},
    {"chongergrey","chonger"},
    {"chongergang","chonger"},
    {"chongerred","chonger"},
    {"chongerblue","chonger"},
    {"shortsgang","shorts"},
    {"denimsgang","jeans"},
    {"denimsred","jeans"},
    {"chinosbiege","chinosb"},
    {"chinoskhaki","chinosb"},
    {"cutoffchinos","shorts"},
    {"cutoffchinosblue","shorts"},
    {"chinosblack","chinosb"},
    {"chinosblue","chinosb"},
    {"leathertr","leathertr"},
    {"leathertrchaps","leathertr"},
    {"suit1trgrey","suit1tr"},
    {"suit1trblk","suit1tr"},
    {"cutoffdenims","shorts"},
    {"suit1trred","suit1tr"},
    {"suit1trblue","suit1tr"},
    {"suit1tryellow","suit1tr"},
    {"suit1trgreen","suit1tr"},
    {"suit1trblk2","suit1tr"},
    {"suit1trgang","suit1tr"},
}

local buty = {
    {"foot","feet"},
    {"cowboyboot2","biker"},
    {"bask2semi","bask1"},
    {"bask1eris","bask1"},
    {"sneakerbincgang","sneaker"},
    {"sneakerbincblue","sneaker"},
    {"sneakerbincblk","sneaker"},
    {"sandal","flipflop"},
    {"sandalsock","flipflop"},
    {"flipflop","flipflop"},
    {"hitop","bask1"},
    {"convproblk","conv"},
    {"convproblu","conv"},
    {"convprogrn","conv"},
    {"sneakerprored","sneaker"},
    {"sneakerproblu","sneaker"},
    {"sneakerprowht","sneaker"},
    {"bask1prowht","bask1"},
    {"bask1problk","bask1"},
    {"boxingshoe","biker"},
    {"convheatblk","conv"},
    {"convheatred","conv"},
    {"convheatorn","conv"},
    {"sneakerheatwht","sneaker"},
    {"sneakerheatgry","sneaker"},
    {"sneakerheatblk","sneaker"},
    {"bask2heatwht","bask1"},
    {"bask2heatband","bask1"},
    {"timbergrey","bask1"},
    {"timberred","bask1"},
    {"timberfawn","bask1"},
    {"timberhike","bask1"},
    {"cowboyboot","biker"},
    {"biker","biker"},
    {"snakeskin","biker"},
    {"shoedressblk","shoe"},
    {"shoedressbrn","shoe"},
    {"shoespatz","shoe"},
}

local naszyjniki = {
    {"dogtag","neck"},
    {"neckafrica","neck"},
    {"stopwatch","neck"},
    {"necksaints","neck"},
    {"neckhash","neck"},
    {"necksilver","neck2"},
    {"neckgold","neck2"},
    {"neckropes","neck2"},
    {"neckropeg","neck2"},
    {"neckls","neck"},
    {"neckdollar","neck"},
    {"neckcross","neck"},
}

local zegarki = {
    {"watchpink","watch"},
    {"watchyellow","watch"},
    {"watchpro","watch"},
    {"watchpro2","watch"},
    {"watchsub1","watch"},
    {"watchsub2","watch"},
    {"watchzip1","watch"},
    {"watchzip2","watch"},
    {"watchgno","watch"},
    {"watchgno2","watch"},
    {"watchcro","watch"},
    {"watchcro2","watch"},
}

local twarz = {
    {"groucho","grouchos"},
    {"zorro","zorromask"},
    {"eyepatch","eyepatch"},
    {"glasses01","glasses01"},
    {"glasses04","glasses04"},
    {"bandred3","bandmask"},
    {"bandblue3","bandmask"},
    {"bandgang3","bandmask"},
    {"bandblack3","bandmask"},
    {"glasses01dark","glasses01"},
    {"glasses04dark","glasses04"},
    {"glasses03","glasses03"},
    {"glasses03red","glasses03"},
    {"glasses03blue","glasses03"},
    {"glasses03dark","glasses03"},
    {"glasses05dark","glasses03"},
    {"glasses05","glasses03"},
}

local czapka = {
    {"bandred","bandana"},
    {"bandblue","bandana"},
    {"bandgang","bandana"},
    {"bandblack","bandana"},
    {"bandred2","bandknots"},
    {"bandblue2","bandknots"},
    {"bandblack2","bandknots"},
    {"bandgang2","bandknots"},
    {"capknitgrn","capknit"},
    {"captruck","captruck"},
    {"cowboy","cowboy"},
    {"hattiger","cowboy"},
    {"helmet","helmet"},
    {"moto","moto"},
    {"boxingcap","boxingcap"},
    {"hockey","hockeymask"},
    {"capgang","cap"},
    {"capgangback","capback"},
    {"capgangside","capside"},
    {"capgangover","capovereye"},
    {"capgangup","caprimup"},
    {"bikerhelmet","bikerhelmet"},
    {"capred","cap"},
    {"capredback","capback"},
    {"capredside","capside"},
    {"capredover","capovereye"},
    {"capredup","caprimup"},
    {"capblue","cap"},
    {"capblueback","capback"},
    {"capblueside","capside"},
    {"capblueover","capovereye"},
    {"capblueup","caprimup"},
    {"skullyblk","skullycap"},
    {"skullygrn","skullycap"},
    {"hatmancblk","hatmanc"},
    {"hatmancplaid","hatmanc"},
    {"capzip","cap"},
    {"capzipback","capback"},
    {"capzipside","capside"},
    {"capzipover","capovereye"},
    {"capzipup","caprimup"},
    {"beretred","beret"},
    {"beretblk","beret"},
    {"capblk","cap"},
    {"capblkback","capback"},
    {"capblkside","capside"},
    {"capblkover","capovereye"},
    {"capblkup","caprimup"},
    {"trilbydrk","trilby"},
    {"trilbylght","trilby"},
    {"bowler","bowler"},
    {"bowlerred","bowler"},
    {"bowlerblue","bowler"},
    {"bowleryellow","bowler"},
    {"boater","boater"},
    {"bowlergang","bowler"},
    {"boaterblk","boater"},
}

local cub = createColCuboid(1700.5560302734,-1718.5045166016,13.6484375-1, 5,5,4)
local marker = createMarker(1701.9138183594,-1715.1154785156,13.6484375-1,"cylinder",1.5,90, 55, 150,1)
setElementData(marker,"mpod",true)
setElementData(marker,"mtekst","Zmiana ubrań")
setElementData(marker,"mikona","")

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
zmiennadwa = 1366/sx
tick = getTickCount()
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/PantonBold.ttf", 29/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 26/zmienna)
local dxfont2_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 30/zmienna)
local dxfont3_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 17/zmienna)
local dxfont0_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 33/zmienna)

local r3 = 180

local showed = false
local u0 = 0
local u1 = 0
local u2 = 0
local u3 = 0
local u4 = 0
local u5 = 0
local u6 = 0
local u7 = 0

function gui()
    if showed == false then return end
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

    dxDrawImage(1396/zmienna, 272/zmienna, 509/zmienna, 570/zmienna, "window.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
    dxDrawRectangle(1394/zmienna, 361/zmienna, 509/zmienna, 60/zmienna, tocolor(25, 25, 25, alptest), false)
    dxDrawRectangle(1395/zmienna, 421/zmienna, 509/zmienna, 60/zmienna, tocolor(45, 45, 45, alptest), false)
    dxDrawRectangle(1395/zmienna, 481/zmienna, 509/zmienna, 60/zmienna, tocolor(25, 25, 25, alptest), false)
    dxDrawRectangle(1395/zmienna, 541/zmienna, 509/zmienna, 60/zmienna, tocolor(45, 45, 45, alptest), false)
    dxDrawRectangle(1395/zmienna, 601/zmienna, 509/zmienna, 60/zmienna, tocolor(25, 25, 25, alptest), false)
    dxDrawRectangle(1395/zmienna, 661/zmienna, 509/zmienna, 60/zmienna, tocolor(45, 45, 45, alptest), false)
    dxDrawRectangle(1395/zmienna, 721/zmienna, 509/zmienna, 60/zmienna, tocolor(25, 25, 25, alptest), false)
    dxDrawRectangle(1395/zmienna, 781/zmienna, 509/zmienna, 60/zmienna, tocolor(45, 45, 45, alptest), false)


    if isMouseIn(760/zmienna, 759/zmienna, 84/zmienna, 79/zmienna) then 
        exports["crime_gui"]:guitext("", 760/zmienna, 759/zmienna, 844/zmienna, 838/zmienna, 90, 55, 150, alp2test, dxfont0_FA5, "center", "center")
        if getKeyState("mouse1") == true then 
            r3 = r3-2
            exports.object_preview:setRotation(peds,0,0,r3)
        end
    else
        exports["crime_gui"]:guitext("", 760/zmienna, 759/zmienna, 844/zmienna, 838/zmienna, 200, 200, 200, alp2test, dxfont0_FA5, "center", "center")
    end

    if isMouseIn(1087/zmienna, 759/zmienna, 84/zmienna, 79/zmienna) then 
        exports["crime_gui"]:guitext("", 1087/zmienna, 759/zmienna, 1171/zmienna, 838/zmienna, 90, 55, 150, alp2test, dxfont0_FA5, "center", "center")
        if getKeyState("mouse1") == true then 
            r3 = r3+2
            exports.object_preview:setRotation(peds,0,0,r3)
        end
    else
        exports["crime_gui"]:guitext("", 1087/zmienna, 759/zmienna, 1171/zmienna, 838/zmienna, 200, 200, 200, alp2test, dxfont0_FA5, "center", "center")
    end

    exports["crime_gui"]:guibutton( "Zamknij", 887/zmienna, 773/zmienna, 160/zmienna, 48/zmienna, alp2test)

    exports["crime_gui"]:guitext("Koszulka", 1395/zmienna, 362/zmienna, 1904/zmienna, 421/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
    exports["crime_gui"]:guitext("Fryzura", 1395/zmienna, 421/zmienna, 1904/zmienna, 480/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
    exports["crime_gui"]:guitext("Spodnie", 1395/zmienna, 480/zmienna, 1904/zmienna, 539/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
    exports["crime_gui"]:guitext("Buty", 1395/zmienna, 539/zmienna, 1904/zmienna, 598/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
    exports["crime_gui"]:guitext("Naszyjnik", 1395/zmienna, 601/zmienna, 1904/zmienna, 660/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
    exports["crime_gui"]:guitext("Zegarek", 1395/zmienna, 660/zmienna, 1904/zmienna, 719/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
    exports["crime_gui"]:guitext("Zakrycie twarzy", 1395/zmienna, 721/zmienna, 1904/zmienna, 780/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
    exports["crime_gui"]:guitext("Czapka", 1395/zmienna, 780/zmienna, 1904/zmienna, 839/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
    liczmnie = 0
    for ID2=1,8 do
        liczmnie = liczmnie+1
        local space = 60*(liczmnie-1)
        if isMouseIn(1394/zmienna, (361+space)/zmienna, 509/zmienna, 60/zmienna) then 
            --strzalka w lewo
            if isMouseIn(1816/zmienna, (361+space)/zmienna, 34/zmienna, 59/zmienna) then 
                exports["crime_gui"]:guitext("", 1816/zmienna, (361+space)/zmienna, 1850/zmienna, (421+space)/zmienna, 90, 55, 150, alp2test, dxfont3_FA5, "center", "center")
            else
                exports["crime_gui"]:guitext("", 1816/zmienna, (361+space)/zmienna, 1850/zmienna, (421+space)/zmienna, 200, 200, 200, alp2test, dxfont3_FA5, "center", "center")
            end
            --strzalka w prawo
            if isMouseIn(1859/zmienna, (361+space)/zmienna, 34/zmienna, 59/zmienna) then 
                exports["crime_gui"]:guitext("", 1859/zmienna, (361+space)/zmienna, 1893/zmienna, (421+space)/zmienna, 90, 55, 150, alp2test, dxfont3_FA5, "center", "center")
            else
                exports["crime_gui"]:guitext("", 1859/zmienna, (361+space)/zmienna, 1893/zmienna, (421+space)/zmienna, 200, 200, 200, alp2test, dxfont3_FA5, "center", "center")
            end
            if isMouseIn(1411/zmienna, (361+space)/zmienna, 47/zmienna, 60/zmienna) then 
                exports["crime_gui"]:guitext("", 1411/zmienna, (361+space)/zmienna, 1458/zmienna, (421+space)/zmienna, 90, 55, 150, alp2test, dxfont2_FA5, "center", "center")
            else
                exports["crime_gui"]:guitext("", 1411/zmienna, (361+space)/zmienna, 1458/zmienna, (421+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FA5, "center", "center")
            end
        end
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

local grucha = {0,1,2,3,13,14,15,16}


addEventHandler("onClientMarkerHit", marker, function(el)
	if el ~= localPlayer then return end
	if getElementDimension(source) ~= getElementDimension(localPlayer) or getElementInterior(source) ~= getElementInterior(localPlayer) then return end
    if isElementWithinColShape(localPlayer,cub) == true then
    if not getElementData(el,"player:premium") then exports.crime_gui:addNoti("Nie posiadasz konta premium.", "error") return end
    if getElementModel(el) ~= 0 then exports.crime_gui:addNoti("Ubierz skin o ID 0 aby móc zmieniać ubrania.", "error") return end

    ped = createPed(0,0,0,0,0,true)
    for i,v in pairs(grucha) do 
        local tex,mod = getPedClothes(localPlayer, v) 
        if tex == false then 
            removePedClothes (ped, v)
        else 
            addPedClothes (ped, tex, mod, v )
        end
    end
    r3 = 180
    peds = exports.object_preview:createObjectPreview(ped, 0, 0, r3, 690/zmienna, 160/zmienna, 526/zmienna, 660/zmienna,false,true,false)
    --tickistart = getTickCount()
	--czas = 500
	--progressdwa = "wlacza"
	addEventHandler("onClientRender",root,gui)
    showCursor(true,false)
    showed = true

    local texture, model = getPedClothes ( el, 0 )
    if texture and model then
        naczym,u0 = getTypeIndexFromClothes ( texture, model )
    else
        u0 = -1
    end
    local texture, model = getPedClothes ( el, 1 )
    if texture and model then
        naczym,u1 = getTypeIndexFromClothes ( texture, model )
    else
        u1 = -1
    end
    local texture, model = getPedClothes ( el, 2 )
    if texture and model then
        naczym,u2 = getTypeIndexFromClothes ( texture, model )
    else
        u2 = -1
    end
    local texture, model = getPedClothes ( el, 3 )
    if texture and model then
        naczym,u3 = getTypeIndexFromClothes ( texture, model )
    else
        u3 = -1 
    end
    local texture, model = getPedClothes ( el, 13 )
    if texture and model then
        naczym,u4 = getTypeIndexFromClothes ( texture, model )
    else
        u4 = -1 
    end
    local texture, model = getPedClothes ( el, 14 )
    if texture and model then
        naczym,u5 = getTypeIndexFromClothes ( texture, model )
    else
        u5 = -1 
    end
    local texture, model = getPedClothes ( el, 15 )
    if texture and model then
        naczym,u6 = getTypeIndexFromClothes ( texture, model )
    else
        u6 = -1 
    end
    local texture, model = getPedClothes ( el, 16 )
    if texture and model then
        naczym,u7 = getTypeIndexFromClothes ( texture, model )
    else
        u7 = -1 
    end
end
end)

addEventHandler("onClientMarkerLeave", marker, function(el)
	if el ~= localPlayer then return end
    if getElementDimension(source) ~= getElementDimension(localPlayer) or getElementInterior(source) ~= getElementInterior(localPlayer) then return end
    if isElement(peds) then 
        exports.object_preview:destroyObjectPreview(peds)
        destroyElement(peds)
    end
    if isElement(ped) then
        destroyElement(ped)
    end
    --tickistart = getTickCount()
    --czas = 500
    --progressdwa = "wylacza"
    guiSetInputMode("allow_binds")
    showCursor (false)
    if isEventHandlerAdded("onClientRender", root, gui) then
        removeEventHandler ("onClientRender", root, gui)
        showed = false
    end
end)


addEventHandler("onClientClick", root, function(btn, state)
    if btn == "left" and state == "down" then
        if isMouseIn(887/zmienna, 773/zmienna, 160/zmienna, 48/zmienna) and showed == true then
            if peds then 
                exports.object_preview:destroyObjectPreview(peds)
                destroyElement(peds)
            end
            if ped then
                destroyElement(ped)
            end
            guiSetInputMode("allow_binds")
            showCursor (false)
            if isEventHandlerAdded("onClientRender", root, gui) then
                removeEventHandler ("onClientRender", root, gui)
                showed = false
            end
        end
		if isMouseIn(1003/zmiennadwa, 260/zmiennadwa, 36/zmiennadwa, 36/zmiennadwa) and showed == true then
            triggerServerEvent("zmien:ubranie",localPlayer,0)
            u0 = -1
        end
        if isMouseIn(1003/zmiennadwa, 302/zmiennadwa, 36/zmiennadwa, 36/zmiennadwa) and showed == true then
            triggerServerEvent("zmien:ubranie",localPlayer,1)
            u1 = -1
        end
        if isMouseIn(1003/zmiennadwa, 344/zmiennadwa, 36/zmiennadwa, 36/zmiennadwa) and showed == true then
            triggerServerEvent("zmien:ubranie",localPlayer,2)
            u2 = -1
        end
        if isMouseIn(1003/zmiennadwa, 390/zmiennadwa, 36/zmiennadwa, 36/zmiennadwa) and showed == true then
            triggerServerEvent("zmien:ubranie",localPlayer,3)
            u3 = -1
        end
        if isMouseIn(1003/zmiennadwa, 430/zmiennadwa, 36/zmiennadwa, 36/zmiennadwa) and showed == true then
            triggerServerEvent("zmien:ubranie",localPlayer,13)
            u4 = -1
        end
        if isMouseIn(1003/zmiennadwa, 472/zmiennadwa, 36/zmiennadwa, 36/zmiennadwa) and showed == true then
            triggerServerEvent("zmien:ubranie",localPlayer,14)
            u5 = -1
        end
        if isMouseIn(1003/zmiennadwa, 518/zmiennadwa, 36/zmiennadwa, 36/zmiennadwa) and showed == true then
            triggerServerEvent("zmien:ubranie",localPlayer,15)
            u6 = -1
        end
        if isMouseIn(1003/zmiennadwa, 560/zmiennadwa, 36/zmiennadwa, 36/zmiennadwa) and showed == true then
            triggerServerEvent("zmien:ubranie",localPlayer,16)
            u7 = -1
        end
        --koszulka
        if isMouseIn(1291/zmiennadwa, 258/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u0 = u0-1
            if u0 < 0 then u0 = 0 end
            triggerServerEvent("zmien:ubranie",localPlayer,0, u0)
        end
        if isMouseIn(1321/zmiennadwa, 258/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u0 = u0+1
            if u0 > 67 then u0 = 67 end
            triggerServerEvent("zmien:ubranie",localPlayer,0, u0)
        end
        --fryzura
        if isMouseIn(1291/zmiennadwa, 302/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u1 = u1-1
            if u1 < 0 then u1 = 0 end
            triggerServerEvent("zmien:ubranie",localPlayer,1, u1)
        end
        if isMouseIn(1321/zmiennadwa, 298/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u1 = u1+1
            if u1 > 32 then u1 = 32 end
            triggerServerEvent("zmien:ubranie",localPlayer,1, u1)
        end
        --spodnie
        if isMouseIn(1291/zmiennadwa, 342/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u2 = u2-1
            if u2 < 0 then u2 = 0 end
            triggerServerEvent("zmien:ubranie",localPlayer,2, u2)
        end
        if isMouseIn(1321/zmiennadwa, 343/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u2 = u2+1
            if u2 > 44 then u2 = 44 end
            triggerServerEvent("zmien:ubranie",localPlayer,2, u2)
        end
        --buty
        if isMouseIn(1291/zmiennadwa, 387/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u3 = u3-1
            if u3 < 0 then u3 = 0 end
            triggerServerEvent("zmien:ubranie",localPlayer,3, u3)
        end
        if isMouseIn(1321/zmiennadwa, 387/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u3 = u3+1
            if u3 > 37 then u3 = 37 end
            triggerServerEvent("zmien:ubranie",localPlayer,3, u3)
        end
        --naszyjnik
        if isMouseIn(1291/zmiennadwa, 427/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u4 = u4-1
            if u4 < 0 then u4 = 0 end
            triggerServerEvent("zmien:ubranie",localPlayer,13, u4)
        end
        if isMouseIn(1321/zmiennadwa, 427/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u4 = u4+1
            if u4 > 11 then u4 = 11 end
            triggerServerEvent("zmien:ubranie",localPlayer,13, u4)
        end
        --zegarek
        if isMouseIn(1291/zmiennadwa, 472/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u5 = u5-1
            if u5 < 0 then u5 = 0 end
            triggerServerEvent("zmien:ubranie",localPlayer,14, u5)
        end
        if isMouseIn(1321/zmiennadwa, 472/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u5 = u5+1
            if u5 > 11 then u5 = 11 end
            triggerServerEvent("zmien:ubranie",localPlayer,14, u5)
        end
        --zakrycie twarzy
        if isMouseIn(1291/zmiennadwa, 512/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u6 = u6-1
            if u6 < 0 then u6 = 0 end
            triggerServerEvent("zmien:ubranie",localPlayer,15, u6)
        end
        if isMouseIn(1321/zmiennadwa, 516/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u6 = u6+1
            if u6 > 16 then u6 = 16 end
            triggerServerEvent("zmien:ubranie",localPlayer,15, u6)
        end
        --czapka
        if isMouseIn(1291/zmiennadwa, 557/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u7 = u7-1
            if u7 < 0 then u7 = 0 end
            triggerServerEvent("zmien:ubranie",localPlayer,16, u7)
        end
        if isMouseIn(1321/zmiennadwa, 556/zmiennadwa, 26/zmiennadwa, 40/zmiennadwa) and showed == true then
            u7 = u7+1
            if u7 > 56 then u7 = 56 end
            triggerServerEvent("zmien:ubranie",localPlayer,16, u7)
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


addEvent("zmien:3dmodel", true)
addEventHandler("zmien:3dmodel", root, function()
	if showed == true then 
        for i,v in pairs(grucha) do 
            local tex,mod = getPedClothes(localPlayer, v) 
            if tex == false then 
                removePedClothes (ped, v)
            else 
                addPedClothes (ped, tex, mod, v )
            end
        end
    end
end)
