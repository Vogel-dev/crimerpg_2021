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
podzakladka = 1 
zatwierdzanie = 0 
refresh = true
local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)
local dxfont0_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 18/zmienna)
local dxfont1_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 19/zmienna)
local fontlight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 15/zmienna)
local dxfont2_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 14/zmienna)
local dxfont2_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 87/zmienna)
local dxfont3_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 21/zmienna)
local dxfont3_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 24/zmienna)
local dxfont3_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)
local dxfont4_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmienna)
local dxfont5_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)
local dxfont5_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 26/zmienna)
local dxfont6_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 17/zmienna)
local dxfont7_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 12/zmienna)
local dxfont8_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 33/zmienna)
local dxfont9_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)
local dxfont10_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 19/zmienna)
local dxfont1_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 22/zmienna)
local dxfont11_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 20/zmienna)
local dxfont6_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 16/zmienna)

local znajomi = {}
local naekranieznajomi = 4
naekranieznajomi = naekranieznajomi-1
local obecnieznajomi = 1

local pojazdys = {}
local naekraniepojazdy = 11
naekraniepojazdy = naekraniepojazdy-1
local obecniepojazdy = 1

local aktualizacje = {}
local naekranieaktualizacje = 13
naekranieaktualizacje = naekranieaktualizacje-1
local obecnieaktualizacje = 1


local kontood = ""
local uid = 0
local prawkoa = 0
local prawkob = 0
local prawkoc = 0
local money = 0
local bankmoney = 0
local minutyduty = 0
local premium = ""
local premiumdo = ""
local punktypremium = 0
local zgony = 0
local pojazdy = 0
local limitpojazdow = 0
local zarobione = 0
local godziny = 0
local minuty = 0
local godzin = 0 
local kille = 0

local przewodnik= [[
#5a3795 Komendy: #cccccc

- #5a3795/report (id/nick) (powód) #cccccc- Wysyłanie zgłoszenia do administracji
- #5a3795/pm (id/nick) (treść) #cccccc- Wysyłanie prywatnej wiadomości
- #5a3795/pay (id/nick) (kwota) #cccccc- Wysyłanie pieniędzy
- #5a3795/klucze (id/nick) #cccccc- Dawanie kluczy od pojazdu
- #5a3795/ogloszenie (treść) #cccccc- Ogłoszenie dla graczy premium
- #5a3795/org-dolacz #cccccc- Dołączanie do organizacji

#5a3795 Bindy: #cccccc

- #5a3795 'F1' #cccccc- Dashboard serwera
- #5a3795 'F3' #cccccc- Kursor
- #5a3795 'F4' #cccccc- Panel animacji
- #5a3795 'F5' #cccccc- Panel organizacji
- #5a3795 'F11' #cccccc- Mapa serwera
- #5a3795 '- i =' #cccccc- Radio (dostępne również poza pojazdem)
- #5a3795 '+ i -' #cccccc- Rozmiar radaru
- #5a3795 Domyślnie 'Z' #cccccc- voicechat
- #5a3795 'O' #cccccc- Pokazywanie wszystkich domków na serwerze
- #5a3795 'I' #cccccc- Ekwipunek
- #5a3795 'TAB' #cccccc- Tabela graczy online
- #5a3795 'Lewy przycisk myszy' #cccccc- Ogranicznik prędkości
- #5a3795 'Lewy Shift' #cccccc- Interakcja pojazdu

#FF0000Funkcje serwera, które nie każdy może zrozumieć znajdują się na discordzie, na kanale #faq
https://discord.gg/gGrXw2c

]]

tick = getTickCount()
hudMaskShader = dxCreateShader("files/shader/hud_mask.fx")
myTexture = dxCreateShader("files/shader/hud_mask.fx")
avatar = dxCreateTexture("files/avatar.png")
maska = dxCreateTexture("files/shader/circle_mask.png")

dxSetShaderValue( hudMaskShader, "sPicTexture", avatar )
dxSetShaderValue( hudMaskShader, "sMaskTexture", maska )

dxSetShaderValue( myTexture, "sPicTexture", avatar )
dxSetShaderValue( myTexture, "sMaskTexture", maska )

function gui()
    local ticki = getTickCount()
	if progressdwa == "wlacza" then
		local Progress = (ticki-tickistart)/czas
		local alp = interpolateBetween(0,0,0,55,0,0,Progress,"Linear")
		local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
		if alp then alptest = alp else alp = 55 end 
		if alp2 then alp2test = alp2 else alp2 = 255 end
	else 
		local Progress = (ticki-tickistart)/czas
		local alp = interpolateBetween(55,0,0,0,0,0,Progress,"Linear")
		local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
		if alp then alptest = alp else alp = 0 end 
		if alp2 then alp2test = alp2 else alp2 = 0 end
    end
    if onoff == true then
        --TOP
            dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, ":crime_dashboard/files/main.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
            exports["crime_gui"]:guitext( "DASHBOARD", 0/zmienna, 0/zmienna, 327/zmienna, 86/zmienna, 200, 200, 200, alp2test, dxfont0_PantonBold)

            if getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 1 then er,gie,be = 43, 255, 180
            elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 2 then er,gie,be = 51, 204, 153
            elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 3 then er,gie,be = 51, 153, 255
            elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 4 then er,gie,be = 255, 0, 0
            elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 5 then er,gie,be = 202, 67, 255
            elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 6 then er,gie,be = 202, 67, 255

            elseif getElementData(localPlayer,"player:duty") == "SAPD" then er,gie,be = 52, 131, 235
            elseif getElementData(localPlayer,"player:duty") == "SAFD" then er,gie,be = 255, 74, 74
            elseif getElementData(localPlayer,"player:duty") == "SAMD" then er,gie,be = 0, 255, 183
            else
                er,gie,be = 90, 55, 150
            end
            if not er then er = 90 end 
            if not gie then gie = 55 end 
            if not be then be = 150 end

            dxDrawImage(1809/zmienna, 7/zmienna, 74/zmienna, 74/zmienna, ":crime_dashboard/files/shader/circle_mask.png", 0,0,0, tocolor(er,gie,be,alp2test),false)
            dxDrawImage(1812/zmienna, 10/zmienna, 68/zmienna, 68/zmienna, myTexture, 0,0,0, tocolor(255,255,255,alp2test),false)
        --ZAKLADKI
            exports["crime_gui"]:guibuttonicon( "Postać", 0/zmienna, 115/zmienna, 329/zmienna, 75/zmienna, alp2test, "")
            exports["crime_gui"]:guibuttonicon( "Pojazdy", 0/zmienna, 196/zmienna, 329/zmienna, 75/zmienna, alp2test, "")
            exports["crime_gui"]:guibuttonicon( "Aktualizacje", 0/zmienna, 277/zmienna, 329/zmienna, 75/zmienna, alp2test, "")
            exports["crime_gui"]:guibuttonicon( "Premium", 0/zmienna, 358/zmienna, 329/zmienna, 75/zmienna, alp2test, "")
            exports["crime_gui"]:guibuttonicon( "Koło fortuny", 0/zmienna, 439/zmienna, 329/zmienna, 75/zmienna, alp2test, "")
            exports["crime_gui"]:guibuttonicon( "Przewodnik", 0/zmienna, 520/zmienna, 329/zmienna, 75/zmienna, alp2test, "")
            exports["crime_gui"]:guibuttonicon( "Ustawienia", 0/zmienna, 601/zmienna, 329/zmienna, 75/zmienna, alp2test, "")
        --Znajomi
            --dodawanie
                exports["crime_gui"]:guiicon( "", 269/zmienna, 692/zmienna, 322/zmienna, 746/zmienna, alp2test, dxfont0_FA5, 1)
                exports["crime_gui"]:createEditbox("dashboard:addfriend", 10/zmienna, 692/zmienna, 249/zmienna, 54/zmienna, true, "", false, 16, fontlight, false, 0, { 200, 200, 200, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "UID Znajomego", { 200, 200, 200, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)
            --lista  
                local liczmnie = 0
                for ID2=obecnieznajomi,naekranieznajomi+obecnieznajomi do
                    liczmnie = liczmnie+1
                    local space = 78*(liczmnie-1)
                    if znajomi[ID2] then
                        if znajomi[ID2][3] == "online" then 
                            dxDrawImage(4/zmienna, (756+space)/zmienna, 70/zmienna, 70/zmienna, "files/shader/circle_mask.png", 0, 0, 0, tocolor(0, 225, 0, alp2test), false)
                            if znajomi[ID2][5] ~= false then 
                                dxDrawImage(6/zmienna, (758+space)/zmienna, 66/zmienna, 66/zmienna, znajomi[ID2][5], 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                            else 
                                dxDrawImage(6/zmienna, (758+space)/zmienna, 66/zmienna, 66/zmienna, hudMaskShader, 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                            end
                            exports["crime_gui"]:guitext( "["..znajomi[ID2][4].."] "..znajomi[ID2][2].."", 76/zmienna, (768+space)/zmienna, 264/zmienna, (806+space)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "left","top")
                            exports["crime_gui"]:guitext( "#21db74online", 76/zmienna, (792+space)/zmienna, 264/zmienna, (820+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left","top")
                            exports["crime_gui"]:guiicon( "", 264/zmienna, (759+space)/zmienna, 326/zmienna, (820+space)/zmienna, alp2test, dxfont0_FA5, 1)
                        else 
                            --[[dxDrawImage(4/zmienna, (756+space)/zmienna, 70/zmienna, 70/zmienna, "files/shader/circle_mask.png", 0, 0, 0, tocolor(255, 0, 0, alp2test), false)
                            if znajomi[ID2][5] ~= false then 
                                dxDrawImage(6/zmienna, (758+space)/zmienna, 66/zmienna, 66/zmienna, znajomi[ID2][5], 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
                            else 
                                dxDrawImage(6/zmienna, (758+space)/zmienna, 66/zmienna, 66/zmienna, hudMaskShader, 0, 0, 0, tocolor(200, 200, 200, alp2test), false)
                            end
                            exports["crime_gui"]:guitext( ""..znajomi[ID2][2].."", 76/zmienna, (768+space)/zmienna, 264/zmienna, (806+space)/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "left","top")
                            exports["crime_gui"]:guitext( "#ef3b3boffline", 76/zmienna, (792+space)/zmienna, 264/zmienna, (820+space)/zmienna, 200, 200, 200, alp2test, dxfont2_FiraEC, "left","top")
                            exports["crime_gui"]:guiicon( "", 264/zmienna, (759+space)/zmienna, 326/zmienna, (820+space)/zmienna, alp2test, dxfont0_FA5, 1)]]--
                        end
                    end
                end
                --LEVEL
                    exp = getElementData(localPlayer,"player:exp") or 0
                    level = getElementData(localPlayer,"player:lvl") or 0
                    levelp1 = level+1
                    local liniakm = 696* ( exp / 100 )
                    if liniakm > 696 then
                        liniakm = 696
                    end
                    
                    dxDrawImage(721/zmienna, 57/zmienna, 696/zmienna, 11/zmienna, ":crime_dashboard/files/ciemny.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                    dxDrawImage(721/zmienna, 57/zmienna, liniakm/zmienna, 11/zmienna, ":crime_dashboard/files/kolorowy.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

                    exports["crime_gui"]:guitext(""..exp.." #5a3795/ 100 (#cccccc"..exp.."%#5a3795)", 721/zmienna, 20/zmienna, 1417/zmienna, 62/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
                    exports["crime_gui"]:guitext("Poziom "..level.."", 745/zmienna, 21/zmienna, 1015/zmienna, 62/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "left", "center")
                    exports["crime_gui"]:guitext("Poziom "..levelp1.."", 1123/zmienna, 20/zmienna, 1393/zmienna, 62/zmienna, 171, 171, 171, alp2test, dxfont1_FiraEC, "right", "center")
                --NICKITD
                    local nick = getPlayerName(localPlayer)
                    local nick = nick:gsub('#%x%x%x%x%x%x', '')
                    local ranga = getElementData(localPlayer, "player:level")
                    if not ranga or ranga == 0 then ranga = "#ccccccGracz" end
                    if ranga == 1 then ranga = "#2BFFB4Trial Support" end
                    if ranga == 2 then ranga = "#33cc99Support" end
                    if ranga == 3 then ranga = "#3399ffModerator" end
                    if ranga == 4 then ranga = "#ff0000Administrator" end
                    if ranga == 5 then ranga = "#CA43FFProgramista" end
                    if ranga == 6 then ranga = "#CA43FFProgramista" end
                    if premium == "Tak" then nick = "#E6CF00"..nick.."" end
                    exports["crime_gui"]:guitext(nick.."#cccccc\n"..ranga.."", 1599/zmienna, 10/zmienna, 1799/zmienna, 76/zmienna, 200, 200, 200, alp2test, dxfont4_FiraEC, "right", "center")
                
        if zakladka == 1 then -- POSTAĆ
            --tlo
                dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, ":crime_dashboard/files/info.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
            --duzetlo
                exports["crime_gui"]:guiicon( "", 639/zmienna, 282/zmienna, 1072/zmienna, 467/zmienna, alptest, dxfont2_FA5,0,1)
                exports["crime_gui"]:guiicon( "", 1086/zmienna, 282/zmienna, 1519/zmienna, 467/zmienna, alptest, dxfont2_FA5,0,1)
                exports["crime_gui"]:guiicon( "", 639/zmienna, 477/zmienna, 1072/zmienna, 662/zmienna, alptest, dxfont2_FA5,0,1)
                exports["crime_gui"]:guiicon( "", 1086/zmienna, 477/zmienna, 1519/zmienna, 662/zmienna, alptest, dxfont2_FA5,0,1)
                exports["crime_gui"]:guiicon( "", 1086/zmienna, 672/zmienna, 1519/zmienna, 857/zmienna,  alptest, dxfont2_FA5,0,1)
                exports["crime_gui"]:guiicon( "", 639/zmienna, 672/zmienna, 1072/zmienna, 857/zmienna, alptest, dxfont2_FA5,0,1)
            --maleboki
                exports["crime_gui"]:guiicon( "", 639/zmienna, 282/zmienna, 732/zmienna, 362/zmienna, alp2test, dxfont3_FA5)
                exports["crime_gui"]:guiicon( "", 1426/zmienna, 282/zmienna, 1519/zmienna, 362/zmienna, alp2test, dxfont3_FA5)
                exports["crime_gui"]:guiicon( "", 639/zmienna, 477/zmienna, 732/zmienna, 557/zmienna, alp2test, dxfont3_FA5)
                exports["crime_gui"]:guiicon( "", 1426/zmienna, 477/zmienna, 1519/zmienna, 557/zmienna, alp2test, dxfont3_FA5)
                exports["crime_gui"]:guiicon( "", 639/zmienna, 672/zmienna, 732/zmienna, 752/zmienna, alp2test, dxfont3_FA5)
                exports["crime_gui"]:guiicon( "", 1426/zmienna, 672/zmienna, 1519/zmienna, 752/zmienna, alp2test, dxfont3_FA5)
            --DUZE NAPISY
                exports["crime_gui"]:guitext( "DANE", 639/zmienna, 286/zmienna, 1062/zmienna, 330/zmienna, 255, 255, 255, alp2test, dxfont3_FiraEC, "right", "top")
                exports["crime_gui"]:guitext( "PRAWO JAZDY", 1096/zmienna, 286/zmienna, 1519/zmienna, 330/zmienna, 255, 255, 255, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext( "PIENIĄDZE", 639/zmienna, 481/zmienna, 1062/zmienna, 525/zmienna, 255, 255, 255, alp2test, dxfont3_FiraEC, "right", "top")
                exports["crime_gui"]:guitext( "CZAS", 639/zmienna, 676/zmienna, 1062/zmienna, 720/zmienna, 255, 255, 255, alp2test, dxfont3_FiraEC, "right", "top")
                exports["crime_gui"]:guitext( "PREMIUM", 1096/zmienna, 481/zmienna, 1519/zmienna, 525/zmienna, 255, 255, 255, alp2test, dxfont3_FiraEC, "left", "top")
                exports["crime_gui"]:guitext( "STATYSTYKI", 1096/zmienna, 676/zmienna, 1519/zmienna, 720/zmienna, 255, 255, 255, alp2test, dxfont3_FiraEC, "left", "top")
            --MALE NAPISY
                exports["crime_gui"]:guitext( "Konto od: "..kontood.."", 639/zmienna, 330/zmienna, 1062/zmienna, 368/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "right", "top")
                exports["crime_gui"]:guitext( "UID: "..uid.."", 639/zmienna, 358/zmienna, 1062/zmienna, 396/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "right", "top")
                if prawkoa == 1 then 
                    exports["crime_gui"]:guitext( "Prawo Jazdy Kat. A", 1096/zmienna, 330/zmienna, 1519/zmienna, 368/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                end
                if prawkob == 1 then 
                    exports["crime_gui"]:guitext( "Prawo Jazdy Kat. B", 1096/zmienna, 358/zmienna, 1519/zmienna, 396/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                end
                if prawkoc == 1 then 
                    exports["crime_gui"]:guitext( "Prawo Jazdy Kat. C", 1096/zmienna, 386/zmienna, 1519/zmienna, 424/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                end
                exports["crime_gui"]:guitext( "Przy sobie: "..money.." PLN", 639/zmienna, 525/zmienna, 1062/zmienna, 563/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "right", "top")
                exports["crime_gui"]:guitext( "W banku: "..bankmoney.." PLN", 639/zmienna, 553/zmienna, 1062/zmienna, 591/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "right", "top")
                exports["crime_gui"]:guitext( "Godziny: "..godziny.."", 639/zmienna, 720/zmienna, 1062/zmienna, 758/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "right", "top")
                exports["crime_gui"]:guitext( "Minuty: "..minuty.."", 639/zmienna, 748/zmienna, 1062/zmienna, 786/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "right", "top")
                -- exports["crime_gui"]:guitext( "Minuty na duty: "..minutyduty.."", 639/zmienna, 776/zmienna, 1062/zmienna, 814/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "right", "top")
                exports["crime_gui"]:guitext( "Status Premium: "..premium.."", 1096/zmienna, 525/zmienna, 1519/zmienna, 563/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                exports["crime_gui"]:guitext( "Premium do: "..premiumdo.."", 1096/zmienna, 553/zmienna, 1519/zmienna, 591/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                exports["crime_gui"]:guitext( "Punkty premium: "..punktypremium.."", 1096/zmienna, 581/zmienna, 1519/zmienna, 619/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                exports["crime_gui"]:guitext( "Zgony: "..zgony.."", 1096/zmienna, 720/zmienna, 1519/zmienna, 758/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                exports["crime_gui"]:guitext( "Zabójstwa: "..kille.."", 1096/zmienna, 748/zmienna, 1519/zmienna, 786/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                exports["crime_gui"]:guitext( "Limit pojazdów: "..limitpojazdow.."", 1096/zmienna, 776/zmienna, 1519/zmienna, 814/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                exports["crime_gui"]:guitext( "Pojazdy: "..pojazdy.."", 1096/zmienna, 804/zmienna, 1519/zmienna, 842/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "left", "top")
                exports["crime_gui"]:guitext( "Zarobione z prac: "..zarobione.." PLN", 639/zmienna, 581/zmienna, 1062/zmienna, 619/zmienna, 200, 200, 200, alp2test, dxfont3_SegoeLight, "right", "top")
        
                --UMIEJETNOSC BRONI
                local umiejetnosc = 255 - getElementData(localPlayer,"player:strzelec") or 0
                local dzielenie = umiejetnosc/255
                local dzieleniedwa = dzielenie*100
                local liniatakase = 548 * (umiejetnosc / 255)

                dxDrawImage(804/zmienna, 917/zmienna, 548/zmienna, 40/zmienna, ":crime_hud/hp.png", 0, 0, 0, tocolor(55, 55, 55, alp2test), false)
                dxDrawImage(804/zmienna, 917/zmienna, liniatakase/zmienna, 40/zmienna, ":crime_hud/hp.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)

                exports["crime_gui"]:guitext("Umiejętność strzelania z broni:", 805/zmienna, 876/zmienna, 1352/zmienna, 911/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "center")
                exports["crime_gui"]:guitext(string.format("%.01f", dzieleniedwa).."%", 804/zmienna, 917/zmienna, 1352/zmienna, 957/zmienna, 90, 55, 150, alp2test, dxfont1_FiraEC, "center", "center")
                exports["crime_gui"]:guitext("拉",804/zmienna, 917/zmienna, 853/zmienna, 956/zmienna, 90, 55, 150, alp2test, dxfont6_FA5, "center", "center")
        
        end
        if zakladka == 2 then --POJAZDY

            pasekpoprawej(naekraniepojazdy,pojazdys,83,obecniepojazdy,1583,129+41)
            local liczmniedwa = 0
            for ID2TEST=obecniepojazdy,naekraniepojazdy+obecniepojazdy do
                liczmniedwa = liczmniedwa+1
                local spacedwa = 83*(liczmniedwa-1)
                if pojazdys[ID2TEST] then
                    dxDrawImage(588/zmienna, (129+spacedwa)/zmienna, 995/zmienna, 73/zmienna, ":crime_dashboard/files/ciemny.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
                    if pojazdys[ID2TEST][3] ~= "Przechowalnia" and pojazdys[ID2TEST][3] ~= "Parking Policyjny" then 
                        exports["crime_gui"]:guitext( "#cccccc"..pojazdys[ID2TEST][2].." #5a3795[#ccccccID: #5a3795"..pojazdys[ID2TEST][1].."]\n#ccccccLokalizacja: #5a3795"..pojazdys[ID2TEST][3].." #cccccc(#5a3795"..string.format("%.00f", pojazdys[ID2TEST][4]).."m#cccccc)", 588/zmienna, (130+spacedwa)/zmienna, 1583/zmienna, (202+spacedwa)/zmienna, 200, 200, 200, alp2test, dxfont5_FiraEC, "center", "center")
                    else 
                        exports["crime_gui"]:guitext( "#cccccc"..pojazdys[ID2TEST][2].." #5a3795[#ccccccID: #5a3795"..pojazdys[ID2TEST][1].."]\n#ccccccLokalizacja: #5a3795"..pojazdys[ID2TEST][3].."", 588/zmienna, (130+spacedwa)/zmienna, 1583/zmienna, (202+spacedwa)/zmienna, 200, 200, 200, alp2test, dxfont5_FiraEC, "center", "center")
                    end
                    exports["crime_gui"]:guiicon( "", 1482/zmienna, (130+spacedwa)/zmienna, 1582/zmienna, (202+spacedwa)/zmienna, alp2test, dxfont5_FA5,1)
                    exports["crime_gui"]:guiicon( "", 589/zmienna, (130+spacedwa)/zmienna, 689/zmienna, (202+spacedwa)/zmienna, alp2test, dxfont5_FA5,1)
                end
            end
        end
        if zakladka == 3 then --AKTUALIZACJE

            pasekpoprawej(naekranieaktualizacje,aktualizacje,69,obecnieaktualizacje,1900,115+34)

            local liczmnietrzy = 0
            for ID2TESTDWA=obecnieaktualizacje,naekranieaktualizacje+obecnieaktualizacje do
                liczmnietrzy = liczmnietrzy+1
                local spacetrzy = 69*(liczmnietrzy-1)
                if aktualizacje[ID2TESTDWA] then
                    exports["crime_gui"]:guitext( ""..aktualizacje[ID2TESTDWA][1].." Przez: #5a3795"..aktualizacje[ID2TESTDWA][2].."\n#cccccc"..aktualizacje[ID2TESTDWA][3].."", 329/zmienna, (115+spacetrzy)/zmienna, 1916/zmienna, (184+spacetrzy)/zmienna, 200, 200, 200, alp2test, dxfont6_FiraEC, "center", "top")
                end
            end
        end
        if zakladka == 4 then  --PREMIUM
            
            exports["crime_gui"]:guibuttonicon( "Kupowanie", 764/zmienna, 137/zmienna, 329/zmienna, 75/zmienna, alp2test, "")
            exports["crime_gui"]:guibuttonicon( "Wydawanie", 1209/zmienna, 137/zmienna, 329/zmienna, 75/zmienna, alp2test, "")


            if podzakladka == 1 then --Kupno

                exports["crime_gui"]:guitext( "Cennik dla BLIK, PayPal, PaySafeCard : #5a37951 zł - 2PP#cccccc ( Discord: #5a3795Vercetti#4734 #cccccc)", 333/zmienna, 226/zmienna, 1915/zmienna, 270/zmienna, 200, 200, 200, alp2test, dxfont4_FiraEC, "center", "top")
                exports["crime_gui"]:guitext( "#5a3795Cennik", 333/zmienna, 298/zmienna, 1915/zmienna, 362/zmienna, 200, 200, 200, alp2test, dxfont8_FiraEC, "center", "top")
                exports["crime_gui"]:guitext( "3 #ccccccPunkty Premium:\nCena: #5a37953.69zł#cccccc\nSMS o Treści: #5a3795MSMS.SMTA#cccccc\n Na numer: #5a379573480", 333/zmienna, 362/zmienna, 1915/zmienna, 476/zmienna, 200, 200, 200, alp2test, dxfont4_FiraEC, "center", "top")
                exports["crime_gui"]:guitext( "7 #ccccccPunktów Premium:\nCena: #5a37956.15zł#cccccc\nSMS o Treści: #5a3795MSMS.SMTA#cccccc\n Na numer: #5a379575480", 333/zmienna, 502/zmienna, 1915/zmienna, 616/zmienna, 200, 200, 200, alp2test, dxfont4_FiraEC, "center", "top")
                exports["crime_gui"]:guitext( "15 #ccccccPunktów Premium:\nCena: #5a379511.07zł#cccccc\nSMS o Treści: #5a3795MSMS.SMTA#cccccc\n Na numer: #5a379579480", 333/zmienna, 641/zmienna, 1915/zmienna, 755/zmienna, 200, 200, 200, alp2test, dxfont4_FiraEC, "center", "top")
                exports["crime_gui"]:guitext( "30 #ccccccPunktów Premium:\nCena: #5a379517.22zł#cccccc\nSMS o Treści: #5a3795MSMS.SMTA#cccccc\n Na numer: #5a379591400", 333/zmienna, 779/zmienna, 1915/zmienna, 893/zmienna, 200, 200, 200, alp2test, dxfont4_FiraEC, "center", "top")
                
                exports["crime_gui"]:guibutton( "Sprawdź kod", 1005/zmienna, 990/zmienna, 240/zmienna, 72/zmienna, alp2test)
                exports["crime_gui"]:createEditbox("dashboard:checkcode", 963/zmienna, 915/zmienna, 325/zmienna, 54/zmienna, true, "", false, 16, fontlight, false, 0, { 200, 200, 200, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Wpisz KOD", { 200, 200, 200, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)


            end
            if podzakladka == 2 then --Wydawanie

                exports["crime_gui"]:guibutton( "#5a3795Custom Paintjob#cccccc (#5a379515pp#cccccc)",448/zmienna, 244/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "3 Dni premium (#5a37953pp#cccccc)",798/zmienna, 244/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "7 Dni premium (#5a37957pp#cccccc)",1148/zmienna, 244/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "12 Dni premium (#5a379512pp#cccccc)",1498/zmienna, 244/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "15 Dni premium (#5a379515pp#cccccc)",448/zmienna, 373/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "20 Dni premium (#5a379520pp#cccccc)",798/zmienna, 373/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "25 Dni premium (#5a379525pp#cccccc)",1148/zmienna, 373/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "30 Dni premium (#5a379530pp#cccccc)",1498/zmienna, 373/zmienna, 272/zmienna, 75/zmienna , alp2test)

                exports["crime_gui"]:guibutton( "#FFFF00Żółty #ccccccNick (#5a37953pp#cccccc)",448/zmienna, 502/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "#99FF00Limonkowy #ccccccNick (#5a37953pp#cccccc)",798/zmienna, 502/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "#00b7ffNiebieski #ccccccNick (#5a37953pp#cccccc)",1148/zmienna, 502/zmienna, 272/zmienna, 75/zmienna , alp2test)
                exports["crime_gui"]:guibutton( "#ab00ffFioletowy #ccccccNick (#5a37953pp#cccccc)",1498/zmienna, 502/zmienna, 272/zmienna, 75/zmienna , alp2test)
                -- exports["crime_gui"]:guibutton( "#00ff00Zielony #ccccccNick (#5a37953pp#cccccc)",448/zmienna, 631/zmienna, 272/zmienna, 75/zmienna , alp2test)
                -- exports["crime_gui"]:guibutton( "#ff0000Czerwony #ccccccNick (#5a37953pp#cccccc)",798/zmienna, 631/zmienna, 272/zmienna, 75/zmienna , alp2test)
                -- exports["crime_gui"]:guibutton( "#5a3795Pomarańczowy #ccccccNick (#5a37953pp#cccccc)",1148/zmienna, 631/zmienna, 272/zmienna, 75/zmienna , alp2test)
                -- exports["crime_gui"]:guibutton( "#d6d6d6Szary #ccccccNick (#5a37953pp#cccccc)",1498/zmienna, 631/zmienna, 272/zmienna, 75/zmienna , alp2test)

                exports["crime_gui"]:guitext( "#5a3795Przywileje konta premium:", 330/zmienna, 618/zmienna, 1920/zmienna, 780/zmienna, 200, 200, 200, alp2test, dxfont9_FiraEC, "center", "top")
                exports["crime_gui"]:guitext( "#5a37951.#cccccc 2.000 PLN Co 30 minut online\n#5a37952.#cccccc Zwiększone zarobki w pracach o 35%\n#5a37953.#cccccc Ogłoszenia premium (/ogloszenie)\n#5a37954.#cccccc Złoty nametag \n#5a37955.#cccccc Więcej możliwości w przebieralni\n#5a37956.#cccccc Pierwszeństwo w raportach\n#5a37957.#cccccc Zwiększone zdobywanie doświadczenia o 35%\n#5a37958.#cccccc Chat dla premium\n#5a37959.#cccccc Zmniejszony koszt paliwa o 50%", 330/zmienna, 670/zmienna, 1920/zmienna, 1080/zmienna, 200, 200, 200, alp2test, dxfont1_FiraEC, "center", "top")

                exports["crime_gui"]:guitext( "\n\nTwoje punkty premium: #5a3795"..getElementData(localPlayer,'ppoints'), 330/zmienna, 856/zmienna, 1920/zmienna, 1018/zmienna, 200, 200, 200, alp2test, dxfont9_FiraEC, "center", "top")

            end
        end
        if zakladka == 5 then 
            if not stopnie then stopnie = 0 end 
            if not tickistartdupa then tickistartdupa = 0 end 
            if not czasdupa then czasdupa = 0 end
            local Progressduupa = (ticki-tickistartdupa)/czasdupa
            local costamsobie = interpolateBetween(0,0,0,stopnie,0,0,Progressduupa,"OutQuad")
            dupa = costamsobie
            if costamsobie == 360 then
                razy = 1
            end 
            if costamsobie == 720 then 
                razy = 2 
            end 
            if costamsobie == 1080 then 
                razy = 3 
            end
            if costamsobie == 1440 then 
                razy = 4 
            end
            if costamsobie == 1800 then 
                razy = 5 
            end
            if costamsobie == 2160 then 
                razy = 6 
            end
            

            lastwin = lastwin or "Brak"
            if not razy then razy = 0 end
            if razy == 0 then 
                dxDrawImage(730/zmienna, 105/zmienna, 725/zmienna, 725/zmienna, ":crime_dashboard/files/kolo.png", dupa, 0, 0, tocolor(255, 255, 255, alp2test), false)
            end
            if razy == 1 then 
                dxDrawImage(730/zmienna, 105/zmienna, 725/zmienna, 725/zmienna, ":crime_dashboard/files/kolo.png", dupa-320, 0, 0, tocolor(255, 255, 255, alp2test), false)
            end
            if razy == 2 then 
                dxDrawImage(730/zmienna, 105/zmienna, 725/zmienna, 725/zmienna, ":crime_dashboard/files/kolo.png", dupa-720, 0, 0, tocolor(255, 255, 255, alp2test), false)
            end
            if razy == 3 then 
                dxDrawImage(730/zmienna, 105/zmienna, 725/zmienna, 725/zmienna, ":crime_dashboard/files/kolo.png", dupa-1080, 0, 0, tocolor(255, 255, 255, alp2test), false)
            end
            if razy == 4 then 
                dxDrawImage(730/zmienna, 105/zmienna, 725/zmienna, 725/zmienna, ":crime_dashboard/files/kolo.png", dupa-1440, 0, 0, tocolor(255, 255, 255, alp2test), false)
            end
            if razy == 5 then 
                dxDrawImage(730/zmienna, 105/zmienna, 725/zmienna, 725/zmienna, ":crime_dashboard/files/kolo.png", dupa-1800, 0, 0, tocolor(255, 255, 255, alp2test), false)
            end
            if razy == 6 then 
                dxDrawImage(730/zmienna, 105/zmienna, 725/zmienna, 725/zmienna, ":crime_dashboard/files/kolo.png", dupa-2160, 0, 0, tocolor(255, 255, 255, alp2test), false)
            end
            
            
            dxDrawImage(1046/zmienna, 782/zmienna, 90/zmienna, 48/zmienna, ":crime_dashboard/files/arrow.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
            exports["crime_gui"]:guibutton( "#ccccccZakręć (#5a37951pp#cccccc)",985/zmienna, 997/zmienna, 215/zmienna, 65/zmienna, alp2test)
            exports["crime_gui"]:guitext( "Twoje PP: #5a3795"..getElementData(localPlayer,'ppoints').."\n#ccccccOstatnia nagroda:\n#5a3795"..lastwin.."", 986/zmienna, 857/zmienna, 1200/zmienna, 997/zmienna, 200, 200, 200, alp2test, dxfont10_FiraEC, "center", "top")
        
            if zatwierdzanie == 1 then 
                dxDrawImage(853/zmienna, 278/zmienna, 479/zmienna, 283/zmienna, "files/window.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                exports["crime_gui"]:guitext( "Wygrałeś: #5a3795"..lastwin.."\n#ccccccCzy akceptujesz nagrode?", 854/zmienna, 377/zmienna, 1330/zmienna, 442/zmienna, 200, 200, 200, alp2test, dxfont4_FiraEC, "center", "top")

                exports["crime_gui"]:guibutton( "Nie", 898/zmienna, 494/zmienna, 182/zmienna, 55/zmienna, alp2test)
                exports["crime_gui"]:guibutton( "Tak", 1106/zmienna, 494/zmienna, 182/zmienna, 55/zmienna, alp2test)
            end
        end
        if zakladka == 6 then 
            exports["crime_gui"]:guitext(przewodnik, 330/zmienna, 105/zmienna, 1915/zmienna, 1055/zmienna, 200, 200, 200, alp2test, dxfont6_FiraEC, "center", "center")
        end 
        if zakladka == 7 then 
            exports["crime_gui"]:guitext("Prywatne wiadomości", 507/zmienna, 141/zmienna, 834/zmienna, 192/zmienna, 200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"pmoff") == false then 
                exports["crime_gui"]:guiswitch(366/zmienna, 141/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(366/zmienna, 141/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Gracz RolePlay", 507/zmienna, 202/zmienna, 834/zmienna, 253/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"roleplay") == true then 
                exports["crime_gui"]:guiswitch(366/zmienna, 202/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(366/zmienna, 202/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Hud", 507/zmienna, 263/zmienna, 834/zmienna, 314/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"hudoff") == false then 
                exports["crime_gui"]:guiswitch(366/zmienna, 263/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(366/zmienna, 263/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Radar", 507/zmienna, 324/zmienna, 834/zmienna, 375/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"radaroff") == false then 
                exports["crime_gui"]:guiswitch(366/zmienna, 324/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(366/zmienna, 324/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Słaby komputer", 507/zmienna, 385/zmienna, 834/zmienna, 436/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"lowpc") == true then 
                exports["crime_gui"]:guiswitch(366/zmienna, 385/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(366/zmienna, 385/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Voice chat", 507/zmienna, 446/zmienna, 834/zmienna, 497/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"voiceon") == true then 
                exports["crime_gui"]:guiswitch(366/zmienna, 446/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            else 
                exports["crime_gui"]:guiswitch(366/zmienna, 446/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            end

            exports["crime_gui"]:guitext("Dalekie renderowanie", 507/zmienna, 507/zmienna, 834/zmienna, 558/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"dalekirender") == true then 
                exports["crime_gui"]:guiswitch(366/zmienna, 507/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(366/zmienna, 507/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Shader: Karoseria pojazdów", 507/zmienna, 568/zmienna, 834/zmienna, 619/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"shaderkaroseria") == true then 
                exports["crime_gui"]:guiswitch(366/zmienna, 568/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(366/zmienna, 568/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Shader: Realistyczna woda", 507/zmienna, 629/zmienna, 834/zmienna, 680/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"shaderwoda") == true then 
                exports["crime_gui"]:guiswitch(366/zmienna, 629/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(366/zmienna, 629/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Shader: Realistyczne niebo", 1027/zmienna, 141/zmienna, 1354/zmienna, 192/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"shaderniebo") == true then 
                exports["crime_gui"]:guiswitch(889/zmienna, 141/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(889/zmienna, 141/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Shader: Detale", 1027/zmienna, 202/zmienna, 1354/zmienna, 253/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"shaderdetale") == true then 
                exports["crime_gui"]:guiswitch(889/zmienna, 202/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(889/zmienna, 202/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Shader: Blur", 1027/zmienna, 263/zmienna, 1354/zmienna, 314/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"shaderblur") == true then 
                exports["crime_gui"]:guiswitch(889/zmienna, 263/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(889/zmienna, 263/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Mapa z nazwami ulic", 1027/zmienna, 324/zmienna, 1354/zmienna, 375/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"player:changemap") == true then 
                exports["crime_gui"]:guiswitch(889/zmienna, 324/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            else 
                exports["crime_gui"]:guiswitch(889/zmienna, 324/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            end

            exports["crime_gui"]:guitext("Podmienione dźwięki pojazdów", 1027/zmienna, 385/zmienna, 1354/zmienna, 436/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"player:engines") == true then 
                exports["crime_gui"]:guiswitch(889/zmienna, 385/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            else 
                exports["crime_gui"]:guiswitch(889/zmienna, 385/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            end

            exports["crime_gui"]:guitext("Cyfrowy prędkościomierz", 1027/zmienna, 446/zmienna, 1354/zmienna, 497/zmienna,200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            if getElementData(localPlayer,"newhud") == false then 
                exports["crime_gui"]:guiswitch(889/zmienna, 446/zmienna, 118/zmienna, 51/zmienna, alp2test, false)
            else 
                exports["crime_gui"]:guiswitch(889/zmienna, 446/zmienna, 118/zmienna, 51/zmienna, alp2test, true)
            end

            exports["crime_gui"]:guitext("Avatar: (Poradnik: Discord na kanale '#faq')", 366/zmienna, 732/zmienna, 908/zmienna, 783/zmienna, 200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            exports["crime_gui"]:createEditbox("dashboard:avatar", 366/zmienna, 789/zmienna, 541/zmienna, 51/zmienna, true, "", false, 16, fontlight, false, 0, { 200, 200, 200, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Ciąg znaków", { 200, 200, 200, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)
            exports["crime_gui"]:guibutton( "Zapisz", 939/zmienna, 789/zmienna, 181/zmienna, 51/zmienna, alp2test)

            exports["crime_gui"]:guitext("Hasło:", 366/zmienna, 854/zmienna, 908/zmienna, 905/zmienna, 200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
            exports["crime_gui"]:createEditbox("dashboard:pytanie", 367/zmienna, 910/zmienna, 541/zmienna, 51/zmienna, true, "", true, 30, fontlight, false, 0, { 200, 200, 200, 255 }, true, { 200, 200, 200, 180 }, { 90, 55, 150, 180 }, 1, true, 70, true, "Wpisz nowe hasło", { 200, 200, 200, 255 }, true, 1, fontlight, true, false, {255,255,255,0}, true)
            
            exports["crime_gui"]:guibutton( "Zapisz", 939/zmienna, 910/zmienna, 181/zmienna, 51/zmienna, alp2test)

            --exports["crime_gui"]:guitext("Aby zmienić serial napisz podanie na forum, bądź do Hiroszka na pw (Discord: Vercetti#4734)", 367/zmienna, 976/zmienna, 1382/zmienna, 1028/zmienna, 200, 200, 200, alp2test, dxfont11_FiraEC, "left", "center")
        end
    end
end

--USTAWIENIA
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
		if isMouseIn(366/zmienna, 141/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --pmoff
            if getElementData(localPlayer,"pmoff") == true then 
                setElementData(localPlayer,"pmoff",false)
            else
                setElementData(localPlayer,"pmoff",true)
            end
        end
        if isMouseIn(366/zmienna, 202/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --roleplay
            if getElementData(localPlayer,"roleplay") == true then 
                setElementData(localPlayer,"roleplay",false)
            else
                setElementData(localPlayer,"roleplay",true)
            end
        end
        -- if isMouseIn(366/zmienna, 263/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --hud
        --     if getElementData(localPlayer,"hudoff") == true then 
        --         setElementData(localPlayer,"hudoff",false)
        --     else
        --         setElementData(localPlayer,"hudoff",true)
        --     end
        -- end
        if isMouseIn(366/zmienna, 324/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --radar
            if getElementData(localPlayer,"radaroff") == true then 
                setElementData(localPlayer,"radaroff",false)
            else
                setElementData(localPlayer,"radaroff",true)
            end
        end
        if isMouseIn(366/zmienna, 385/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --low pc
            if getElementData(localPlayer,"dalekirender") == true then exports.crime_gui:addNoti("Masz włączony daleki render, nie zrobisz tego.", "error") return end
            if getElementData(localPlayer,"lowpc") == true then 
                setElementData(localPlayer,"lowpc",false)
                setFarClipDistance( 800 )
                setFogDistance( 10 )
            else
                setElementData(localPlayer,"lowpc",true)
                setFarClipDistance( 100 )
                setFogDistance( 100 )
            end
        end
        if isMouseIn(366/zmienna, 446/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --voice mute
            if getElementData(localPlayer,"voiceon") == false then 
                setElementData(localPlayer,"voiceon",true)
                triggerServerEvent("voicechanyl", localPlayer, true)
            else
                setElementData(localPlayer,"voiceon",false)
                triggerServerEvent("voicechanyl", localPlayer, false)
            end
        end
        if isMouseIn(366/zmienna, 507/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --daleki render
            if getElementData(localPlayer,"lowpc") == true then exports.crime_gui:addNoti("Masz włączone ustawienia słabego komputera, nie zrobisz tego.", "error") return end
            if getElementData(localPlayer,"dalekirender") == true then 
                setElementData(localPlayer,"dalekirender",false)
                setFarClipDistance( 800 )
            else
                setElementData(localPlayer,"dalekirender",true)
                setFarClipDistance( 5000 )
            end
        end
        if isMouseIn(366/zmienna, 568/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --shader karoseria
            if getElementData(localPlayer,"shaderkaroseria") == true then 
                setElementData(localPlayer,"shaderkaroseria",false)
                triggerEvent( "switchCarPaintReflect", root, false )
            else
                setElementData(localPlayer,"shaderkaroseria",true)
                triggerEvent( "switchCarPaintReflect", root, true )
            end
        end
        if isMouseIn(366/zmienna, 629/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --shaderwoda
            if getElementData(localPlayer,"shaderwoda") == true then 
                setElementData(localPlayer,"shaderwoda",false)
                triggerEvent( "switchWaterRef", root, false )
				triggerEvent( "switchWaterShine", root, false )
            else
                setElementData(localPlayer,"shaderwoda",true)
                triggerEvent( "switchWaterRef", root, 4 )
				triggerEvent( "switchWaterShine", root, 4 )
            end
        end
        if isMouseIn(889/zmienna, 141/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --shaderniebo
            if getElementData(localPlayer,"shaderniebo") == true then 
                setElementData(localPlayer,"shaderniebo",false)
                triggerEvent( "switchDynamicSky", root, false )
            else
                setElementData(localPlayer,"shaderniebo",true)
                triggerEvent( "switchDynamicSky", root, true )
            end
        end
        if isMouseIn(889/zmienna, 202/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --shaderdetale
            if getElementData(localPlayer,"shaderdetale") == true then 
                setElementData(localPlayer,"shaderdetale",false)
                triggerEvent( "onClientSwitchDetail", root, false )
            else
                setElementData(localPlayer,"shaderdetale",true)
                triggerEvent( "onClientSwitchDetail", root, true )
            end
        end
        if isMouseIn(889/zmienna, 263/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --shaderblur
            if getElementData(localPlayer,"shaderblur") == true then 
                setElementData(localPlayer,"shaderblur",false)
                triggerEvent( "switchRadialBlur", root, false )
                triggerEvent( "switchContrast", root, false )
            else
                setElementData(localPlayer,"shaderblur",true)
                triggerEvent( "switchRadialBlur", root, true )
				triggerEvent( "switchContrast", root, true )
            end
        end
        if isMouseIn(889/zmienna, 324/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --new map
            if getElementData(localPlayer,"player:changemap") == true then 
                setElementData(localPlayer,"player:changemap",false)
                triggerEvent("radar:changemap",localPlayer)
            else
                setElementData(localPlayer,"player:changemap",true)
                triggerEvent("radar:changemap",localPlayer)
            end
        end
        if isMouseIn(889/zmienna, 385/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --silniki
            if getElementData(localPlayer,"player:engines") == true then 
                setElementData(localPlayer,"player:engines",false)
                exports["crime_engines"]:toggleEngines(true)
            else
                setElementData(localPlayer,"player:engines",true)
                --triggerEvent("player:engines",localPlayer)
                exports["crime_engines"]:toggleEngines(false)
            end
        end
         if isMouseIn(889/zmienna, 446/zmienna, 118/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then -- digital-speed
            if getElementData(localPlayer,"newhud") == true then 
                setElementData(localPlayer,"newhud",false)
            else
                setElementData(localPlayer,"newhud",true)
            end
        end
        if isMouseIn(939/zmienna, 789/zmienna, 181/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --avatar
            local link = exports["crime_gui"]:getEditboxText("dashboard:avatar") or ""
            triggerServerEvent("zmienavatarlink", localPlayer, link)
        end
        if isMouseIn(939/zmienna, 910/zmienna, 181/zmienna, 51/zmienna) and onoff == true and zakladka == 7 then --zabezpieczenie
            local pytanie = exports["crime_gui"]:getEditboxText("dashboard:pytanie") or ""
            triggerServerEvent("zmienpytanie", localPlayer, pytanie)
        end
    end
end)


function onofftest()
    if onoff == true then 
        tickistart = getTickCount()
		czas = 500
        progressdwa = "wylacza"
        guiSetInputMode("allow_binds")
        showCursor(false)
        showChat(true)
		setTimer(function()
            if isEventHandlerAdded("onClientRender", root, gui) then
                offgowno()
				removeEventHandler ("onClientRender", root, gui)
                onoff = false 
                triggerServerEvent("savesettings", localPlayer)
                zakladka = 1
                exports["crime_gui"]:destroyEditbox("dashboard:addfriend")
			end
		end, 500, 1)
    else
        if not getElementData(localPlayer,"player:logged") then return end
        if refresh == true then 
            znajomi = {}
            triggerServerEvent("znajdzznajomych", localPlayer)
        end
        triggerServerEvent("infogracz", localPlayer)
        refresh = false
        onoff = true
        zakladka = 1
        tickistart = getTickCount()
        czas = 500
        progressdwa = "wlacza"
        addEventHandler("onClientRender",root,gui)
        showCursor(true)
        showChat(false)
    end
end

bindKey("F1","down",onofftest)

setTimer(function()
    refresh = true
end, 1000*60*5, 0)

addEvent("dashboard:dotabeli", true)
addEventHandler("dashboard:dotabeli", root, function(result)
    if not result then return end
    for i,v in pairs(result) do
        local teams = getElementsByType("player")
        for i,team in ipairs(teams) do
            if getElementData(team,"player:uid") == v["id"] then 
                local idtest = getElementData(team, "id")
                table.insert(znajomi, {v["id"], v["login"], "online", idtest, false})
            return end
        end
        --table.insert(znajomi, {v["id"], v["login"], "offline", 0, false})
	end
end)

addEvent("dash:dotabeliaktualizacje", true)
addEventHandler("dash:dotabeliaktualizacje", root, function(result)
    if not result then return end
    aktualizacje = {}
    for i,v in pairs(result) do
        table.insert(aktualizacje, {v["data"], v["kto"], v["tresc"]})
	end
end)

addEvent("refreshavatarka", true)
addEventHandler("refreshavatarka", root, function()
    local avatarlink = getElementData(localPlayer,"avatarlink")
    triggerServerEvent("fcstartImageDownload", resourceRoot, localPlayer, avatarlink)
end)

addEvent("dash:dotabeliveh", true)
addEventHandler("dash:dotabeliveh", root, function(result)
    if not result then return end
    pojazdys = {}
	for i,v in pairs(result) do
		local autoxd = getVehicleNameFromModel(v["model"])
        local autoxdd = autoxd
        modelname = exports["crime_modelnames"]
	    autoxdd = modelname:getText(autoxdd)
        if v["parking"] == 1 then lokalizacja = "Przechowalnia" end 
        if v["police"] == 1 then lokalizacja = "Parking Policyjny" end 
            if v["parking"] == 0 then 
                if v["police"] == 0 then 
                    local teams = getElementsByType("vehicle")
                    for i,team in ipairs(teams) do
                        if getElementData(team, "vehicle:id") == v["id"] then 
                            local x,y,z = getElementPosition(team) 
                            local zone = getZoneName(x,y,z)
                            local zonedwa = getZoneName(x,y,z,true)
                            lokalizacja = zonedwa.."#cccccc, #5a3795"..zone
                            local x1,y1,z1 = getElementPosition(localPlayer)
                            distance = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1) 

                        end
                    end
                end
            end
        lokalizacja = lokalizacja or ""
        distance = distance or ""
        
        table.insert(pojazdys, {v["id"], autoxdd, lokalizacja,distance})
    end 
end)

function przelicz()
    if not minutes then minutes = getElementData(localPlayer,"player:hours") or 0 end
        if minutes >= 60 then
        godzin = godzin+1
        minutes = minutes-60
        przelicz()
        end
        godziny = godzin
        minuty = minutes
    end

addEvent("dashboard:infogracz", true)
addEventHandler("dashboard:infogracz", root, function(result, auta, infogracz)
    if not result then return end
    for i,v in pairs(result) do
        kontood = getElementData(localPlayer,"player:registerdate")
        uid = getElementData(localPlayer,"player:uid")
        prawkoa = v["pjA"]
        prawkob = v["pjB"]
        prawkoc = v["pjC"]
        money = getPlayerMoney(localPlayer)
        bankmoney = v["bank_money"]
        if infogracz then 
            minutyduty = infogracz[1].minutes
        else 
            minutyduty = 0
        end
        premiumdo = getElementData(localPlayer,"player:premiumdate") or "Brak"
        if premiumdo ~= "Brak" then premium = "Tak" else premium = "Nie" end
        punktypremium = getElementData(localPlayer,"ppoints")
        zgony = v["zgony"]
        kille = v["kille"]
        pojazdy = auta
        local lvl = getElementData(localPlayer,"player:lvl") or 0
        limitpojazdow = math.floor(lvl/5)
        if limitpojazdow > 15 then limitpojazdow = 15 end 
        zarobione = v["zarobki"]
        przelicz()
	end
end)

addEvent("dashboard:refresh", true)
addEventHandler("dashboard:refresh", root, function()
    znajomi = {}
    triggerServerEvent("znajdzznajomych", localPlayer)
end)

--Dodawanie znajomego
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
		if isMouseIn(269/zmienna, 692/zmienna, 53/zmienna, 53/zmienna) and onoff == true then
            local uidznajomego = tonumber(exports["crime_gui"]:getEditboxText("dashboard:addfriend"))
            if uidznajomego == "" then exports.crime_gui:addNoti("Wpisz UID znajomego.", "error") return end
            if uidznajomego == getElementData(localPlayer,"player:uid") then exports.crime_gui:addNoti("Wpisałeś swoje UID.", "error") return end 
            if uidznajomego then 
                triggerServerEvent("dodajznajomego", localPlayer, uidznajomego)
            else 
                exports.crime_gui:addNoti("Wpisz UID znajomego.", "error")
            end
        end
    end
end)

--USUWANIE ZNAJOMEGO

addEventHandler("onClientClick", root, function(btn,state)
	if btn=="left" and state=="down" then
		if isMouseIn(264/zmienna, 759/zmienna, 62/zmienna, 61/zmienna) and onoff == true then
			wybrany = obecnieznajomi
			if not znajomi[wybrany] then return end
			local dokladniej = znajomi[wybrany][1]
			triggerServerEvent("usunznajomego", localPlayer, dokladniej)
		end
		if isMouseIn(264/zmienna, 837/zmienna, 62/zmienna, 61/zmienna) and onoff == true then
			wybrany = obecnieznajomi+1
			if not znajomi[wybrany] then return end
			local dokladniej = znajomi[wybrany][1]
			triggerServerEvent("usunznajomego", localPlayer, dokladniej)
		end
		if isMouseIn(264/zmienna, 915/zmienna, 62/zmienna, 61/zmienna) and onoff == true then
			wybrany = obecnieznajomi+2
			if not znajomi[wybrany] then return end
			local dokladniej = znajomi[wybrany][1]
			triggerServerEvent("usunznajomego", localPlayer, dokladniej)
		end
		if isMouseIn(264/zmienna, 993/zmienna, 62/zmienna, 61/zmienna) and onoff == true then
			wybrany = obecnieznajomi+3
			if not znajomi[wybrany] then return end
			local dokladniej = znajomi[wybrany][1]
			triggerServerEvent("usunznajomego", localPlayer, dokladniej)
		end
    end
end)

--POJAZDY

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(1482/zmienna, 130/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
		end
		if isMouseIn(1482/zmienna, 213/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+1
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
        end
        if isMouseIn(1482/zmienna, 296/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+2
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
        end
        if isMouseIn(1482/zmienna, 379/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+3
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
        end
        if isMouseIn(1482/zmienna, 462/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+4
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
        end
        if isMouseIn(1482/zmienna, 545/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+5
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
        end
        if isMouseIn(1482/zmienna, 628/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+6
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
        end
        if isMouseIn(1482/zmienna, 711/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+7
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
        end
        if isMouseIn(1482/zmienna, 794/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+8
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
        end
        if isMouseIn(1482/zmienna, 877/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+9
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
        end
        if isMouseIn(1482/zmienna, 960/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+10
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:namierzjcoba", localPlayer, dokladniejs)
            else 
                testcyckow = pojazdys[wybranyp][3]
                if pojazdys[wybranyp][3] == "Przechowalnia" then testcyckow = "Przechowalni" end 
                exports.crime_gui:addNoti("Twój pojazd jest w "..testcyckow..", nie możesz go namierzyć.", "error")
            end
		end
    end
end)

addEventHandler("onClientClick", root, function(btn,state)
	if btn=="left" and state=="down" then
        if isMouseIn(985/zmienna, 997/zmienna, 215/zmienna, 65/zmienna) and onoff == true and zakladka == 5 and zatwierdzanie == 0 then
            if losowanie == true then return end
            local pepe = getElementData(localPlayer,'ppoints') or 0
            if pepe < 1 then exports.crime_gui:addNoti("Nie posiadasz 1pp.", "error") return end
            local pp = getElementData(localPlayer,"ppoints")
            setElementData(localPlayer,"ppoints",pp-1)
            triggerServerEvent("losujesobietypek", localPlayer)
            local wygrana = math.random(1,100)
            local wygrana2 = math.random(1,96)
            local wygrana3 = math.random(1,100)
            if wygrana >= 1 and wygrana <= 20 then nagroda = "Nic" end
            if wygrana >= 21 and wygrana <= 40 then nagroda = "CJ" end 
            if wygrana >= 41 and wygrana <= 60 then nagroda = "Nick" end 
            if wygrana >= 61 and wygrana <= 75 then nagroda = "Auto" end 
            if wygrana >= 76 and wygrana <= 90 then nagroda = "Kasa" end 
            if wygrana >= 91 and wygrana <= 100 then nagroda = "PP" end

            if nagroda == "Nic" then stopnie = 1920 end 
            if nagroda == "CJ" then stopnie = 1980 end 
            if nagroda == "Nick" then stopnie = 2040 end 
            if nagroda == "Auto" then stopnie = 2100 end 
            if nagroda == "Kasa" then stopnie = 1860 end 
            if nagroda == "PP" then stopnie = 2160 end 

            if nagroda == "Nic" then nagroda2 = "Nic" end 

            if nagroda == "CJ" then nagroda2 = "CJ" end 

            if nagroda == "Nick" and wygrana2 >= 1 and wygrana2 <= 12 then nagroda2 = "Żółty" end
            if nagroda == "Nick" and wygrana2 >= 13 and wygrana2 <= 24 then nagroda2 = "Limonkowy" end
            if nagroda == "Nick" and wygrana2 >= 25 and wygrana2 <= 36 then nagroda2 = "Niebieski" end
            if nagroda == "Nick" and wygrana2 >= 37 and wygrana2 <= 48 then nagroda2 = "Fioletowy" end
            if nagroda == "Nick" and wygrana2 >= 49 and wygrana2 <= 60 then nagroda2 = "Żółty" end
            if nagroda == "Nick" and wygrana2 >= 61 and wygrana2 <= 72 then nagroda2 = "Limonkowy" end
            if nagroda == "Nick" and wygrana2 >= 73 and wygrana2 <= 84 then nagroda2 = "Niebieski" end
            if nagroda == "Nick" and wygrana2 >= 85 and wygrana2 <= 96 then nagroda2 = "Fioletowy" end
            -- if nagroda == "Nick" and wygrana2 >= 49 and wygrana2 <= 60 then nagroda2 = "Zielony" end
            -- if nagroda == "Nick" and wygrana2 >= 61 and wygrana2 <= 72 then nagroda2 = "Czerwony" end
            -- if nagroda == "Nick" and wygrana2 >= 73 and wygrana2 <= 84 then nagroda2 = "Pomarańczowy" end
            -- if nagroda == "Nick" and wygrana2 >= 85 and wygrana2 <= 96 then nagroda2 = "Szary" end
            
            if nagroda == "Auto" and wygrana3 >= 1 and wygrana3 <= 20 then nagroda2 = "Fiat Abarth 595" end
            if nagroda == "Auto" and wygrana3 >= 21 and wygrana3 <= 35 then nagroda2 = "El Camino" end
            if nagroda == "Auto" and wygrana3 >= 36 and wygrana3 <= 50 then nagroda2 = "Mercedes-Benz CLS63" end
            if nagroda == "Auto" and wygrana3 >= 51 and wygrana3 <= 65 then nagroda2 = "Chevrolet Impala SS" end
            if nagroda == "Auto" and wygrana3 >= 66 and wygrana3 <= 75 then nagroda2 = "Mercedes-Benz S600" end
            if nagroda == "Auto" and wygrana3 >= 76 and wygrana3 <= 85 then nagroda2 = "Chevrolet Impala 59" end
            if nagroda == "Auto" and wygrana3 >= 86 and wygrana3 <= 93 then nagroda2 = "Ford E150" end
            if nagroda == "Auto" and wygrana3 == 94 then nagroda2 = "Lincoln Town" end
            if nagroda == "Auto" and wygrana3 == 95 then nagroda2 = "Lincoln Town" end
            if nagroda == "Auto" and wygrana3 == 96 then nagroda2 = "Lincoln Town" end
            if nagroda == "Auto" and wygrana3 == 97 then nagroda2 = "Lincoln Town" end
            if nagroda == "Auto" and wygrana3 == 98 then nagroda2 = "Lincoln Town" end
            if nagroda == "Auto" and wygrana3 == 99 then nagroda2 = "Lincoln Town" end
            if nagroda == "Auto" and wygrana3 == 100 then nagroda2 = "Lincoln Town" end

            if nagroda == "Kasa" and wygrana3 >= 1 and wygrana3 <= 50 then nagroda2 = "5k" end
            if nagroda == "Kasa" and wygrana3 >= 51 and wygrana3 <= 70 then nagroda2 = "15k" end
            if nagroda == "Kasa" and wygrana3 >= 71 and wygrana3 <= 85 then nagroda2 = "30k" end
            if nagroda == "Kasa" and wygrana3 >= 86 and wygrana3 <= 95 then nagroda2 = "40k" end
            if nagroda == "Kasa" and wygrana3 >= 96 and wygrana3 <= 98 then nagroda2 = "60k" end
            if nagroda == "Kasa" and wygrana3 == 99 then nagroda2 = "75k" end
            if nagroda == "Kasa" and wygrana3 == 100 then nagroda2 = "100k" end

            if nagroda == "PP" and wygrana3 >= 1 and wygrana3 <= 70 then nagroda2 = "1PP" end
            if nagroda == "PP" and wygrana3 >= 71 and wygrana3 <= 90 then nagroda2 = "2PP" end
            if nagroda == "PP" and wygrana3 >= 91 and wygrana3 <= 95 then nagroda2 = "3PP" end
            if nagroda == "PP" and wygrana3 >= 96 and wygrana3 <= 98 then nagroda2 = "4PP" end
            if nagroda == "PP" and wygrana3 == 99 then nagroda2 = "5PP" end
            if nagroda == "PP" and wygrana3 == 100 then nagroda2 = "7PP" end

            razy = 0
            losowanie = true
            tickistartdupa = getTickCount()
            czasdupa = 4000

            setTimer(function()
                if nagroda2 ~= "Nic" then 
                    zatwierdzanie = 1
                    lastwin = nagroda.." - "..nagroda2
                else 
                    zatwierdzanie = 0
                    losowanie = false
                    lastwin = nagroda.." - "..nagroda2
                end
            end, czasdupa, 1)

        end
        if isMouseIn(898/zmienna, 494/zmienna, 182/zmienna, 55/zmienna) and onoff == true and zakladka == 5 and zatwierdzanie == 1 then
            zatwierdzanie = 0
            losowanie = false
            triggerServerEvent("dejnagrode", localPlayer, nagroda2,"nie")
        return end
        if isMouseIn(1106/zmienna, 494/zmienna, 182/zmienna, 55/zmienna) and onoff == true and zakladka == 5 and zatwierdzanie == 1 then
            zatwierdzanie = 0
            losowanie = false
            triggerServerEvent("dejnagrode", localPlayer, nagroda2,"tak")
        end
    end
end)

--POJAZDY OTWIERANIE ZAMKA XD

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        
        if isMouseIn(589/zmienna, 130/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
		end
		if isMouseIn(589/zmienna, 213/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+1
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
        if isMouseIn(589/zmienna, 296/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+2
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
        if isMouseIn(589/zmienna, 379/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+3
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
        if isMouseIn(589/zmienna, 462/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+4
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
        if isMouseIn(589/zmienna, 545/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+5
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
        if isMouseIn(589/zmienna, 628/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+6
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
        if isMouseIn(589/zmienna, 711/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+7
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
        if isMouseIn(589/zmienna, 794/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+8
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
        if isMouseIn(589/zmienna, 877/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+9
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
        if isMouseIn(589/zmienna, 960/zmienna, 100/zmienna, 72/zmienna) and onoff == true and zakladka == 2 then
			wybranyp = obecniepojazdy+10
			if not pojazdys[wybranyp] then return end
            local dokladniejs = pojazdys[wybranyp][1]
            if pojazdys[wybranyp][3] ~= "Przechowalnia" and pojazdys[wybranyp][3] ~= "Parking Policyjny" then 
                triggerServerEvent("dash:otworzjcoba", localPlayer, dokladniejs)
            else 
                exports.crime_gui:addNoti("Twój pojazd jest w "..pojazdys[wybranyp][3]..", nie możesz go zamknąć.", "error")
            end
        end
    end
end)

--PRZYCISKI ZAKLADEK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(0/zmienna, 115/zmienna, 329/zmienna, 75/zmienna) and onoff == true then
            offgowno()
            zakladka = 1
            triggerServerEvent("infogracz", localPlayer)
        end
        if isMouseIn(0/zmienna, 196/zmienna, 329/zmienna, 75/zmienna) and onoff == true then
            offgowno()
            zakladka = 2
            triggerServerEvent("dash:wyszukajpojazdy", localPlayer)
        end
        if isMouseIn(0/zmienna, 277/zmienna, 329/zmienna, 75/zmienna) and onoff == true then
            offgowno()
            zakladka = 3
            triggerServerEvent("dash:wyszukajaktualizacje", localPlayer)
        end
        if isMouseIn(0/zmienna, 358/zmienna, 329/zmienna, 75/zmienna) and onoff == true then
            offgowno()
            zakladka = 4
        end
        if isMouseIn(0/zmienna, 439/zmienna, 329/zmienna, 75/zmienna) and onoff == true then
            offgowno()
            zakladka = 5
        end
        if isMouseIn(0/zmienna, 520/zmienna, 329/zmienna, 75/zmienna) and onoff == true then
            offgowno()
            zakladka = 6
        end
        if isMouseIn(0/zmienna, 601/zmienna, 329/zmienna, 75/zmienna) and onoff == true then
            offgowno()
            zakladka = 7
        end
    end
end)

function offgowno()
    if onoff == true and zakladka == 4 and podzakladka == 1 then 
        exports["crime_gui"]:destroyEditbox("dashboard:checkcode")
    end
    if onoff == true and zakladka == 7 then 
        exports["crime_gui"]:destroyEditbox("dashboard:avatar")
        exports["crime_gui"]:destroyEditbox("dashboard:pytanie")
    end
end


--PRZYCISKI PODZAKLADEK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(764/zmienna, 137/zmienna, 329/zmienna, 75/zmienna) and onoff == true and zakladka == 4 then
            podzakladka = 1
            
        end
        if isMouseIn(1209/zmienna, 137/zmienna, 329/zmienna, 75/zmienna) and onoff == true and zakladka == 4 then
            offgowno()
            podzakladka = 2
            
        end
    end
end)

--COPY LINK
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(797/zmienna, 255/zmienna, 655/zmienna, 24/zmienna) and onoff == true and zakladka == 4 and podzakladka == 1 then
            setClipboard("discord.gg/gGrXw2c")
        end
    end
end)


--KUPOWANIE PREMEK I NICKOW
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(448/zmienna, 244/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kuppjf1", localPlayer, 1) 
        end
        if isMouseIn(798/zmienna, 244/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kuppremkef1", localPlayer, 3) 
        end
        if isMouseIn(1148/zmienna, 244/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kuppremkef1", localPlayer, 7) 
        end
        if isMouseIn(1498/zmienna, 244/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kuppremkef1", localPlayer, 12) 
        end
        if isMouseIn(448/zmienna, 373/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kuppremkef1", localPlayer, 15) 
        end
        if isMouseIn(798/zmienna, 373/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kuppremkef1", localPlayer, 20) 
        end
        if isMouseIn(1148/zmienna, 373/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kuppremkef1", localPlayer, 25) 
        end
        if isMouseIn(1498/zmienna, 373/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kuppremkef1", localPlayer, 30) 
        end


        --kolory nick
        if isMouseIn(448/zmienna, 502/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kupkolorf1", localPlayer, "zolty") 
        end
        if isMouseIn(798/zmienna, 502/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kupkolorf1", localPlayer, "limonkowy")
        end
        if isMouseIn(1148/zmienna, 502/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kupkolorf1", localPlayer, "niebieski")
        end
        if isMouseIn(1498/zmienna, 502/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
            triggerServerEvent("kupkolorf1", localPlayer, "fioletowy")
        end
        -- if isMouseIn(448/zmienna, 631/zmienna, 272/zmienna, 75/zmienna ) and onoff == true and zakladka == 4 and podzakladka == 2 then
        --     triggerServerEvent("kupkolorf1", localPlayer, "zielony")
        -- end
        -- if isMouseIn(798/zmienna, 631/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
        --     triggerServerEvent("kupkolorf1", localPlayer, "czerwony")
        -- end
        -- if isMouseIn(1148/zmienna, 631/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
        --     triggerServerEvent("kupkolorf1", localPlayer, "pomaranczowy")
        -- end
        -- if isMouseIn(1498/zmienna, 631/zmienna, 272/zmienna, 75/zmienna) and onoff == true and zakladka == 4 and podzakladka == 2 then
        --     triggerServerEvent("kupkolorf1", localPlayer, "szary")
        -- end

    end
end)


--Sprawdzanie kodu premium
addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(1005/zmienna, 990/zmienna, 240/zmienna, 72/zmienna) and onoff == true and zakladka == 4 and podzakladka == 1 then
            local code = exports["crime_gui"]:getEditboxText("dashboard:checkcode")
            if not code or string.len(code) ~= 8 then
                exports.crime_gui:addNoti("Twój kod powinien zawierać 8 znaków.", "error")
            return end
            triggerServerEvent('premium:checkCode', resourceRoot, code)	
        end
    end
end)

function dogory() 
	if isMouseIn(0/zmienna, 756/zmienna, 329/zmienna, 324/zmienna) and onoff == true then
    	if obecnieznajomi == 1 then return end
		obecnieznajomi = obecnieznajomi-1
    end
    if isMouseIn(587/zmienna, 128/zmienna, 999/zmienna, 907/zmienna) and onoff == true and zakladka == 2 then
    	if obecniepojazdy == 1 then return end
		obecniepojazdy = obecniepojazdy-1
    end
    if isMouseIn(330/zmienna, 87/zmienna, 1590/zmienna, 988/zmienna) and onoff == true and zakladka == 3 then
    	if obecnieaktualizacje == 1 then return end
		obecnieaktualizacje = obecnieaktualizacje-1
	end
end

function dodolu()
    if isMouseIn(0/zmienna, 756/zmienna, 329/zmienna, 324/zmienna) and onoff == true then
        if obecnieznajomi+naekranieznajomi+1 > table.maxn(znajomi) then return end
		obecnieznajomi = obecnieznajomi+1
    end
    if isMouseIn(587/zmienna, 128/zmienna, 999/zmienna, 907/zmienna) and onoff == true and zakladka == 2 then
        if obecniepojazdy+naekraniepojazdy+1 > table.maxn(pojazdys) then return end
		obecniepojazdy = obecniepojazdy+1
    end
    if isMouseIn(330/zmienna, 87/zmienna, 1590/zmienna, 988/zmienna) and onoff == true and zakladka == 3 then
        if obecnieaktualizacje+naekranieaktualizacje+1 > table.maxn(aktualizacje) then return end
		obecnieaktualizacje = obecnieaktualizacje+1
    end
end

bindKey ("mouse_wheel_up", "down", dogory )
bindKey ("mouse_wheel_down", "down", dodolu )

addEvent( "onClientGotImage", true )
addEventHandler( "onClientGotImage", resourceRoot,
    function( pixelsdwa )
        myTexture = dxCreateShader("files/shader/hud_mask.fx")
        avatardwa = dxCreateTexture(pixelsdwa)

        dxSetShaderValue( myTexture, "sPicTexture", avatardwa )
        dxSetShaderValue( myTexture, "sMaskTexture", maska )
    end
)

addEvent( "onClientGotImageznajomy", true )
addEventHandler( "onClientGotImageznajomy", resourceRoot,
    function( pixels, uidfrajera )
        for klucz,wartosc in ipairs(znajomi) do
            if znajomi[klucz][1] == uidfrajera then 

                costam = dxCreateShader("files/shader/hud_mask.fx")
                avatars = dxCreateTexture(pixels)
                dxSetShaderValue( costam, "sMaskTexture", maska )
                dxSetShaderValue( costam, "sPicTexture", avatars)
                znajomi[klucz][5] = costam
                
            end
        end
    end
)

--avatarek po wbiciu

addEvent("dajmitenawatarxd", true)
addEventHandler("dajmitenawatarxd", resourceRoot, function()
    if getElementData(localPlayer,"avatarlink") then
        local avatarlink = getElementData(localPlayer,"avatarlink")
        triggerServerEvent("fcstartImageDownload", resourceRoot, localPlayer, avatarlink)
    end
end)

addEventHandler("onClientResourceStart", resourceRoot, function()
    if getElementData(localPlayer,"avatarlink") then
        local avatarlink = getElementData(localPlayer,"avatarlink")
        triggerServerEvent("fcstartImageDownload", resourceRoot, localPlayer, avatarlink)
    end
end)

function zabilestypiarza()
    dxDrawRectangle(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, tocolor(55, 55, 255, alfia), false)
end

addEvent("zabilesgo", true)
addEventHandler("zabilesgo", root, function()
    addEventHandler("onClientRender",root,zabilestypiarza)
    alfia = 35
    setTimer(function()
        alfia = alfia-1
    end, 10, 35)
    setTimer(function()
        removeEventHandler("onClientRender",root,zabilestypiarza)
    end, 350, 1)
end)

addEvent("namierz:createblip", true)
addEventHandler("namierz:createblip", root, function(veh)
    setElementData(veh,"vehicle:namiezany",true)
    local x,y,z = getElementPosition(veh)
    local blip = createBlip(x, y, z, 41)
    local idpojazdu = getElementData(veh,"vehicle:id")
    setElementData(blip,"blip:namiezany",idpojazdu)
    attachElementToElement(blip, veh)
end)

addEvent("namierz:removeblip", true)
addEventHandler("namierz:removeblip", root, function(veh)
    setElementData(veh,"vehicle:namiezany",false)
    local idpojazdu = getElementData(veh,"vehicle:id")
    local blips = getElementsByType("blip")
    for i,vxd in ipairs(blips) do 
        if getElementData(vxd,"blip:namiezany") == idpojazdu then 
            destroyElement(vxd)
        end
    end
end)

addEvent("dashboard:toggleEngines", true)
addEventHandler("dashboard:toggleEngines", root, function(state)
    exports["crime_engines"]:toggleEngines(state)
end)

addEvent("dashboard:toggleRender", true)
addEventHandler("dashboard:toggleRender", root, function(fog,clip)
    setFarClipDistance(clip)
    setFogDistance(fog) 
end)

addEvent("dashboard:toggleRenderdwa", true)
addEventHandler("dashboard:toggleRenderdwa", root, function(far)
    setFarClipDistance( far )
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