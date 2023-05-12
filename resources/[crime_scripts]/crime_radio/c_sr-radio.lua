--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1366/sx

local dxfont0_light = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 27/zmienna)
local dxfont1_light = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 10/zmienna)

onoff = true
radio = false
kolejnosc = 1
radio1 = "Wyłączone"
radio2 = "Radio ZET"
radio3 = "Eska ROCK"
radio4 = "VOX FM"
radio5 = "Eska"
radio6 = "RMF MAXXX"
radio7 = "Open FM Do Auta Club"
radio8 = "Open FM Impreza"

aktualnie = "Aktualnie Gramy: "

function gui()
    if radio == true then
            exports["crime_gui"]:guitext("1", 650/zmienna, 68/zmienna, 723/zmienna, 108/zmienna, 90, 55, 150, 255, dxfont0_light)
            exports["crime_gui"]:guitext("2", 536/zmienna, 28/zmienna, 609/zmienna, 68/zmienna, 90, 55, 150, 100, dxfont0_light)
            exports["crime_gui"]:guitext("3", 771/zmienna, 28/zmienna, 844/zmienna, 68/zmienna, 90, 55, 150, 100, dxfont0_light)
            exports["crime_gui"]:guitext("4", 427/zmienna, 0/zmienna, 500/zmienna, 40/zmienna, 90, 55, 150, 100, dxfont0_light)
            exports["crime_gui"]:guitext("5", 882/zmienna, 0/zmienna, 955/zmienna, 40/zmienna, 90, 55, 150, 100, dxfont0_light)
        if kolejnosc == 1 then 
            exports["crime_gui"]:guitext(radio1.."\n"..aktualnie, 650/zmienna, 98/zmienna, 723/zmienna, 140/zmienna, 255, 255, 255, 255, dxfont1_light)
            exports["crime_gui"]:guitext(radio2, 536/zmienna, 58/zmienna, 609/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio3, 771/zmienna, 58/zmienna, 844/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio4, 427/zmienna, 34/zmienna, 500/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio5, 882/zmienna, 34/zmienna, 955/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
        end
        if kolejnosc == 2 then 
            exports["crime_gui"]:guitext(radio2.."\n"..aktualnie, 650/zmienna, 98/zmienna, 723/zmienna, 140/zmienna, 255, 255, 255, 255, dxfont1_light)
            exports["crime_gui"]:guitext(radio1, 536/zmienna, 58/zmienna, 609/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio3, 771/zmienna, 58/zmienna, 844/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio4, 427/zmienna, 34/zmienna, 500/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio5, 882/zmienna, 34/zmienna, 955/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
        end
        if kolejnosc == 3 then 
            exports["crime_gui"]:guitext(radio3.."\n"..aktualnie, 650/zmienna, 98/zmienna, 723/zmienna, 140/zmienna, 255, 255, 255, 255, dxfont1_light)
            exports["crime_gui"]:guitext(radio2, 536/zmienna, 58/zmienna, 609/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio1, 771/zmienna, 58/zmienna, 844/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio4, 427/zmienna, 34/zmienna, 500/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio5, 882/zmienna, 34/zmienna, 955/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
        end
        if kolejnosc == 4 then 
            exports["crime_gui"]:guitext(radio4.."\n"..aktualnie, 650/zmienna, 98/zmienna, 723/zmienna, 140/zmienna, 255, 255, 255, 255, dxfont1_light)
            exports["crime_gui"]:guitext(radio3, 536/zmienna, 58/zmienna, 609/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio2, 771/zmienna, 58/zmienna, 844/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio1, 427/zmienna, 34/zmienna, 500/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio5, 882/zmienna, 34/zmienna, 955/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
        end
        if kolejnosc == 5 then 
            exports["crime_gui"]:guitext(radio5.."\n"..aktualnie, 650/zmienna, 98/zmienna, 723/zmienna, 140/zmienna, 255, 255, 255, 255, dxfont1_light)
            exports["crime_gui"]:guitext(radio4, 536/zmienna, 58/zmienna, 609/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio3, 771/zmienna, 58/zmienna, 844/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio2, 427/zmienna, 34/zmienna, 500/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio1, 882/zmienna, 34/zmienna, 955/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
        end
        if kolejnosc == 6 then 
            exports["crime_gui"]:guitext(radio6.."\n"..aktualnie, 650/zmienna, 98/zmienna, 723/zmienna, 140/zmienna, 255, 255, 255, 255, dxfont1_light)
            exports["crime_gui"]:guitext(radio5, 536/zmienna, 58/zmienna, 609/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio4, 771/zmienna, 58/zmienna, 844/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio3, 427/zmienna, 34/zmienna, 500/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio2, 882/zmienna, 34/zmienna, 955/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
        end
        if kolejnosc == 7 then 
            exports["crime_gui"]:guitext(radio7.."\n"..aktualnie, 650/zmienna, 98/zmienna, 723/zmienna, 140/zmienna, 255, 255, 255, 255, dxfont1_light)
            exports["crime_gui"]:guitext(radio6, 536/zmienna, 58/zmienna, 609/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio5, 771/zmienna, 58/zmienna, 844/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio4, 427/zmienna, 34/zmienna, 500/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio3, 882/zmienna, 34/zmienna, 955/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
        end
        if kolejnosc == 8 then 
            exports["crime_gui"]:guitext(radio8.."\n"..aktualnie, 650/zmienna, 98/zmienna, 723/zmienna, 140/zmienna, 255, 255, 255, 255, dxfont1_light)
            exports["crime_gui"]:guitext(radio7, 536/zmienna, 58/zmienna, 609/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio6, 771/zmienna, 58/zmienna, 844/zmienna, 82/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio5, 427/zmienna, 34/zmienna, 500/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
            exports["crime_gui"]:guitext(radio4, 882/zmienna, 34/zmienna, 955/zmienna, 58/zmienna, 255, 255, 255, 100, dxfont1_light)
        end
    end
end

function scroll (key, keystate)
    if not getElementData(localPlayer,"player:logged") then return end
    if onoff == true then 
        timers = getTimers ( 2500.00012 )
        for timerKey, timerValue in ipairs(timers) do
            killTimer ( timerValue )
        end
        if radio == false then
            addEventHandler("onClientRender",root,gui)
        end
        radio = true
        
        if key == "-" then
            kolejnosc = kolejnosc+1
            if kolejnosc > 8 then 
                kolejnosc = 1 
            end 
        end
        if key == "=" then
            kolejnosc = kolejnosc-1
            if kolejnosc < 1 then 
                kolejnosc = 8 
            end 
        end
        scrollTimer = setTimer (
        function ()
            radio = false
            removeEventHandler("onClientRender",root,gui)
        end,2500.00012,1)

        radioon(kolejnosc)
    end
end
bindKey ("-", "down", scroll)
bindKey ("=", "down", scroll)

function radioon(stacja)
    local vehicles = getElementsByType("sound")
	for i,v in ipairs(vehicles) do
        if getElementData(v,"radiofuckme") == true then 
            destroyElement(v)
        end
    end
    aktualnie = "Aktualnie Gramy: "
    if stacja == 1 then 
        aktualnie = ""
    elseif stacja == 2 then 
        local radio = playSound( "http://zet-net-01.cdn.eurozet.pl:8400/listen.pls" )
        setElementData(radio,"radiofuckme",true)
        setSoundVolume( radio, 0.5 )
        triggerServerEvent("radio:checknow", localPlayer, "ZET")
    elseif stacja == 3 then 
        local radio = playSound( "http://85.219.133.18/radio.php?id=-1&url=https://www.eskago.pl/radio/eska-rock" )
        setElementData(radio,"radiofuckme",true)
        setSoundVolume( radio, 0.5 )
        triggerServerEvent("radio:checknow", localPlayer, "Eska%20ROCK")
    elseif stacja == 4 then 
        local radio = playSound( "http://85.219.133.18/radio.php?id=-1&url=https://www.eskago.pl/radio/vox-fm" )
        setElementData(radio,"radiofuckme",true)
        setSoundVolume( radio, 0.5 )
        triggerServerEvent("radio:checknow", localPlayer, "VOX%20FM")
    elseif stacja == 5 then 
        local radio = playSound( "http://85.219.133.18/radio.php?id=-1&url=http://www.eskago.pl/radio/eska-warszawa" )
        setElementData(radio,"radiofuckme",true)
        setSoundVolume( radio, 0.5 )
        triggerServerEvent("radio:checknow", localPlayer, "Eska")
    elseif stacja == 6 then 
        local radio = playSound( "http://217.74.72.11:8000/rmf_maxxx" )
        setElementData(radio,"radiofuckme",true)
        setSoundVolume( radio, 0.5 )
        triggerServerEvent("radio:checknow", localPlayer, "RMF%20MAXXX")
    elseif stacja == 7 then 
        local radio = playSound( "https://stream.open.fm/114" )
        setElementData(radio,"radiofuckme",true)
        setSoundVolume( radio, 8 )
        triggerServerEvent("radio:checknow", localPlayer, "Open%20FM%20Do%20Auta%20Club")
    elseif stacja == 8 then 
        local radio = playSound( "https://stream.open.fm/2")
        setElementData(radio,"radiofuckme",true)
        setSoundVolume( radio, 8 )
        triggerServerEvent("radio:checknow", localPlayer, "Open%20FM%20Impreza")
    end
end

setRadioChannel(0)
addEventHandler('onClientPlayerRadioSwitch',root,function() 
    cancelEvent()
end)

addEvent("radio:setradiomusic", true)
addEventHandler("radio:setradiomusic", root, function(music)
    tabelka = fromJSON(music)
    for i,v in pairs(tabelka) do 
        if tabelka[i] ~= tostring(tabelka[i]) then 
            for is,vs in pairs(tabelka[i]) do 
                for iss,vss in pairs(tabelka[i][is]) do 
                    if tostring(iss) == "now" then 
                        aktualnie = "Aktualnie Gramy: #5a3795"..tostring(vss)..""
                    end
                end
            end
        end
    end
end)