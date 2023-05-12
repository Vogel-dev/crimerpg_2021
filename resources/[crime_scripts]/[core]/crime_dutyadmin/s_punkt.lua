--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

-- local punkt = "nie"
-- local pozycja = "brak"

-- function pinfo(plr)
--     if not getElementData(plr,"player:admin") then return end
--     outputChatBox("Komendy:",plr,255,255,255,true)
--     outputChatBox("/punktdodaj - #FFAA00Tworzy punkt w miejscu w którym stoisz i informuje o tym graczy",plr,255,255,255,true)
--     outputChatBox(" ",plr,255,255,255,true)
--     outputChatBox("Stan eventu:",plr,255,255,255,true)
--     outputChatBox("Czy istnieje punkt: #FFAA00"..punkt.."",plr,255,255,255,true)
--     outputChatBox("Pozycja: #FFAA00"..pozycja.."",plr,255,255,255,true)
--     outputChatBox("#FF0000Aby odebrać pieniądze na event wpisz /podatki",plr,255,255,255,true)
-- end
-- addCommandHandler("punkt",pinfo)

-- function pdodaj(plr)
--     if not getElementData(plr,"player:admin") then return end
--     if punkt == "tak" then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Jakiś punkt już istnieje, wpisz /punkt') return end
--     local x,y,z = getElementPosition(plr)
--     punkt = "tak"
--     pozycja = "X: "..x.." Y: "..y.." Z: "..z..""
--     local marker = createMarker(x, y, z-0.9, "cylinder", 2,255,255,255,1)
--     setElementPosition(plr,x+3,y,z)
--     local blip = createBlip(x, y, z, 41, 0, 0, 0, 0, 0, 0, 200)
--     attachElements(blip,marker)
--     setElementData(blip,"punktowy",true)
--     setElementData(marker,"mpod",true)
--     setElementData(marker,"mtekst","WYGRAŁEŚ EVENT")
--     local tworzy=getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
--     exports["sr-db"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"TWORZY PUNKT",0)
--     triggerClientEvent(root, 'alerts:create_alert', root, 'info', ''..tworzy..' Rozpoczyna event "punkty" na radarze został oznaczony punkt, dobiegnij do niego jako pierwszy :D')
-- end
-- addCommandHandler("punktdodaj",pdodaj)

-- function wbildomarkeru(markerHit)
--     local plr = source
--     local test = getElementData(markerHit,"mtekst")
--     if test == "WYGRAŁEŚ EVENT" then
--         local xd = getElementsByType ( "blip" )
--         for i,v in ipairs(xd) do
--             if getElementData(v,"punktowy") == true then
--                 destroyElement(v)
--             end
--         end
--         destroyElement(markerHit)
--         local nick2 = getPlayerName(plr)
--         outputChatBox("#FFAA00SaintRPG #FFFFFF- Jako pierwszy do punktu dobiegł: #FFAA00"..nick2:gsub("#%x%x%x%x%x%x","")..",#FFFFFF gratulacje!",root, 255,155,0,true)
--         exports["sr-db"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"WYGRAL PUNKT",0)
--         punkt = "nie"
--         pozycja = "brak"
--     end
-- end
-- addEventHandler("onPlayerMarkerHit",getRootElement(),wbildomarkeru)