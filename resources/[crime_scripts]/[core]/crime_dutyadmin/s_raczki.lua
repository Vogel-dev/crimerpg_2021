--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local onoffr = "off"
local bylr = "nie"
local komendar = false

function rinfo(plr)
    if not getElementData(plr,"player:admin") then return end
    outputChatBox("Komendy:",plr,200, 200, 200,true)
    outputChatBox("/raczkiwlacz - #5a3795Włącza event",plr,200, 200, 200,true)
    outputChatBox("/raczkiwylacz - #5a3795Wyłącza event (po evencie lub anulowanie eventu)",plr,200, 200, 200,true)
    outputChatBox("/raczkiwpisz (co) - #5a3795Po wpisaniu tej komendy pierwszy kto przepisze zawartość 'co' na chacie zostanie wyświetlony",plr,200, 200, 200,true)
    outputChatBox(" ",plr,200, 200, 200,true)
    outputChatBox("Stan eventu:",plr,200, 200, 200,true)
    outputChatBox("Stan: #5a3795"..onoffr.."",plr,200, 200, 200,true)
    outputChatBox("Czy ktoś już wpisał: #5a3795"..bylr.."",plr,200, 200, 200,true)
    if komendar ~= false then
        outputChatBox("Aktualna treść: #5a3795"..tostring(komendar).."",plr,200, 200, 200,true)
    else 
        outputChatBox("BRAK TREŚCI",plr,200, 200, 200,true)
    end
end
addCommandHandler("raczki",rinfo)


function rwlacz(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoff == "on" then triggerClientEvent(plr, "addNoti", plr, "Event jest już włączony.", "error" ) return end
    onoffr = "on"
    bylr = "tak"
    komendar = false
    local tworzy=getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
    triggerClientEvent("dodajguiall",plr,"Szybkie rączki","Przepisz tekst jako pierwszy na chatie\nEvent rozpoczyna: "..tworzy.."\nSłowo za chwilę się pojawi.")
    triggerClientEvent("aktualizacjaguiall",plr,getPlayerCount())

    triggerClientEvent(plr, "addNoti", plr, "Rozpocząłęś event 'szybkie rączki' poczekaj chwile i wpisz /raczkiwpisz (co) lub /raczkiwylacz.", "info" )
    -- exports["crime_database"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"WLACZA RĄCZKI",0)
end
addCommandHandler("raczkiwlacz",rwlacz)

function rwylacz(plr)
    if not getElementData(plr,"player:admin") then return end
    if onoff == "off" then triggerClientEvent(plr, "addNoti", plr, "Event jest wyłączony.", "error" ) return end
    onoffr = "off"
    bylr = "nie"
    komendar = false
    local tworzy=getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
    triggerClientEvent("usunguiall",plr)
    triggerClientEvent(plr, "addNoti", plr, "Zakończyłeś event 'szybkie rączki'.", "info" )
    -- exports["crime_database"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(plr,"player:uid"),getPlayerSerial(plr),"WYLACZA RĄCZKI",0)
end
addCommandHandler("raczkiwylacz",rwylacz)

function rkomenda(plr,sad,val)
    if not getElementData(plr,"player:admin") then return end
    if onoffr == "off" then triggerClientEvent(plr, "addNoti", plr, "Event jest wyłączony.", "error" ) return end
    if bylr == "nie" then triggerClientEvent(plr, "addNoti", plr, "Nikt jeszcze nie wpisał treści.", "error" ) return end
    if not val then triggerClientEvent(plr, "addNoti", plr, "Wpisz treść! - /raczkiwpisz (treść).", "error" ) return end
    if komendar ~= false then triggerClientEvent(plr, "addNoti", plr, "Jakaś komenda jest już dodana wpisz /raczki.", "error" ) return end
    komendar = tostring(val)
    bylr = "nie"
    local tworzy=getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
    triggerClientEvent("dodajguiall",plr,"Szybkie rączki","Przepisz tekst jako pierwszy na chatie\nEvent rozpoczyna: "..tworzy.."\nSłowo: "..tostring(komendar).."")
    triggerClientEvent("aktualizacjaguiall",plr,getPlayerCount())
end
addCommandHandler("raczkiwpisz",rkomenda)


function onChat(message, messageType)
    if onoffr == "on" then
        if komendar ~= false then
            if string.find(message, tostring(komendar)) then
                if bylr == "nie" then 
                    bylr = "tak"
                    komendar = false
                    local pierwszy=getPlayerName(source):gsub("#%x%x%x%x%x%x","")
                    triggerClientEvent(root, "addNoti", root, "Gracz o nicku: "..pierwszy.." przepisał to jako pierwszy, gratulacje.", "premium" )
                    -- exports["crime_database"]:dbSet("insert into wyplaty_podatek values (null,null,?,?,?,?)",getElementData(source,"player:uid"),getPlayerSerial(source),"PIERWSZY WYGRAL",0)
                    triggerClientEvent("usunguiall",source)
                end 
            end
        end
    end
end
addEventHandler("onPlayerChat", getRootElement(), onChat)

local originalGetPlayerCount = getPlayerCount -- Store the original getPlayerCount function to a variable

    function getPlayerCount()
        -- If originalGetPlayerCount is defined, that means that this function is executed serverside.
        -- The next line returns the result of the original function if it's defined. If not, it counts the number of player elements (to also work clientside).
        return originalGetPlayerCount and originalGetPlayerCount() or #getElementsByType("player")
    end