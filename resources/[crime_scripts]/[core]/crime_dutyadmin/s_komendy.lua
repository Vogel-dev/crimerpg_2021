--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local komendy = {
    {"endjob (nick/id) (typ)","Ustawianie pracy dla gracza",4},
    {"sskin (id) (idskina)","Ustawianie skina graczu",4},
    {"dmon (id)","Włączanie graczu strzelania, celowania etc.",4},
    {"dmoff (id)","Wyłączanie graczu strzelania, celowania etc.",4},

    {"narzedzia","Włączanie/Włączanie kursoru z narzędziami.",2},
    {"odrodzsie","Wyłączanie BW",1},

    {"cc","Czyszczenie chatu globalnego",1},
    {"fadd","Dodawanie do frakcji",6},
    {"fdelete","Usuwanie z frakcji",6},
    {"oadd","Tworzenie organizacji",6},
    {"offchat","Wyłączanie chatu ekipy",1},
    {"offraporty","Wyłączanie rapsów serwera",1},
    {"refreshtekstury","Wczytanie nowych tekstur",6},
    {"e (treść)","Chat ekipy",1},
    {"global","Globalna informacja",2},
    {"tppos <x> <y> <z>","Teleport na określone koordynaty",3},
    {"rcb","Globalna informacja Alert RCB",4},
    {"dajkase","Nadawanie pieniędzy",4},
    {"dajexp","Nadawanie expa",4},
    {"dajlvl","Nadawanie levelu",4},
    {"dajpp","Nadawanie PP",4},
    {"jp","Jetpack",1},
    {"flip (id)","Obrót pojazdu",1},
    {"wycisz (id) (ile) (jednostka) (powód)","Wyciszenie gracza",2},
    {"odcisz (id)","Odciszenie gracza",2},
    {"wyciszoffline (nick) (ile) (jednostka) (powód)","Wyciszenie gracza offline",2},
    {"odciszoffline (nick)","Odciszenie gracza offline",2},
    {"reload","Przeładuj gracza",4},
    {"reloadall","Przeładuj wszystkich",4},
    {"zapisz","Zapisz gracza",4},
    {"zapiszall","Zapisz wszystkich",4},
    {"wczytaj","Wczytaj gracza",4},
    {"wczytajall","Wczytaj wszystkich",4},
    {"fix (id)","Naprawa pojazdu",1},
    {"k (id) (powód)","Wyrzucenie gracza",1},
    {"tt (id)","Teleportacja do gracza",1},
    {"th (id)","Teleportacja gracza do ciebie",1},
    {"warn (id) (powód)","Ostrzeżenie dla gracza",1},
    {"swarn (id) (powód)","Ostrzeżenie dla gracza (secret)",4},
    {"zpj (id) (ile) (jednostka) (powód)","Zabieranie prawa jazdy",2},
    {"opj (id)","Oddawanie prawa jazdy",2},
    {"b (id) (czas) (jednostka) (powód)","Banowanie gracza",3},
    {"boffline (nick) (czas) (jednostka) (powód)","Banowanie gracza offline",3},
    {"pb (id) (powód)","Permamentne banowanie gracza",3},
    {"ub (serial)","Odbanowanie gracza",3},
    {"ranga","Dawanie rangi",4},
    {"ttv (vid)","Teleportacja do auta",1},
    {"thv (vid)","Teleportacja auta do ciebie",1},
    {"spec (id)","Obserwacja gracza",2},
    {"specoff","Koniec obserwacji gracza",2},
    {"inv","Niewidzialność",2},
    {"derby","Komendy systemu eventowego 'derby'",1},
    {"raczki","Komendy systemu eventowego 'rączki'",1},
    {"punkt","Komendy systemu eventowego 'punkty'",1},
    {"dogon","Komendy systemu eventowego 'dogoń mnie'",1},
    {"platformy","Komendy systemu eventowego 'platformy'",1},
    {"podatki","Podatki pobrane od graczy na rzecz eventu",6},
    {"klatka (id)","Tworzy klatke",1},
    {"usunklatke (id)","Usuwa klatke",1},
    {"cl (id) (powód)","Usuwa raport ze ściany raportów",1},
    {"duty","Wejście na duty administracji",1},
    {"sp","Zapisuje pozycje",3},
    {"lp","Wczytuje pozycje",3},
    {"schowaj.all","Chowa wszystkie pojazdy do przecho",4},
    {"fix.all","Chowa wszystkie pojazdy do przecho",4},
    {"dv","Usuwa pojazd w którym siedzisz (ostrożnie)!",4},
    {"up (ile)","Teleportuje cię do góry o daną ilość metrów",1},
    {"thru (ile)","Teleportuje cię do przodu o daną ilość metrów",1},
    {"daj.bron (id/nick) (idbroni) (amunicja)","Daje graczowi broń",4},
    {"schowaj (id pojazdu)","Chowa pojazd do przechowalni",2},
    {"infonick (nick)","Pokazuje informacje o graczu i jego pojazdy",4},
    {"infouid (uid)","Pokazuje informacje o graczu i jego pojazdy",4},
    {"aj (nick/id) (czas) (jednostka) (powód)","Wsadzanie gracza do admin jaila",2},
    {"unaj (id/nick)","Wyciąganie gracza z admin jaila",2},
    {"ajoffline (nick) (czas) (jednostka) (powód)","Wsadzanie gracza do admin jaila offline",2},
    {"unajoffline (nick)","Wyciąganie gracza z admin jaila offline",2},
    {"zpjoffline (nick) (czas) (jednostka) (powód)","Zabieranie prawka offline",2},
    {"opjoffline (nick)","Oddawanie prawka offline",2},
    {"freez (id/nick)","Zamrożenie gracza",2},
    {"unfreez (id/nick)","Odmrożenie gracza",2},
    {"item (id/nick) (nazwa) (ilosc)","Dawanie przedmiotu",4},
    {"itemall (nazwa) (ilosc)","Dawanie przedmiotu dla wszystkich",4},
    {"itemy","Lista przedmiotów",4},
    {"god","Godmode",4},
    {"unbw (nick/id)","Unbw dla gracza",2},
    {"wyciagnij (id)","Wyciąganie auta z przechowalni",4},
    {"wyplaty (id)","Wypłacenie pieniędzy za raporty",6},
    {"BIND '0'","Devmode (latanie)",3},
    {"BIND 'F6'","Kartoteka i logi",2},
}

function komendy1(plr)
    if not getElementData(plr,"player:admin") then return end
    if getAdmin(plr,6) then
        outputChatBox("Komendy przeznaczone dla Programista:",plr,255,255,255,true)
        for _,v in ipairs(komendy)do
            if v[3] == 6 then
                if string.find(v[1],"BIND") then 
                    outputChatBox(""..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                else
                    outputChatBox("/"..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                end
            end
        end
        outputChatBox(" ",plr,255,255,255,true)
    end
    if getAdmin(plr,5) or getAdmin(plr,6) then
        outputChatBox("Komendy przeznaczone dla Programista:",plr,255,255,255,true)
        for _,v in ipairs(komendy)do
            if v[3] == 5 then
                if string.find(v[1],"BIND") then 
                    outputChatBox(""..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                else
                    outputChatBox("/"..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                end
                
            end
        end
        outputChatBox(" ",plr,255,255,255,true)
    end
    if getAdmin(plr,4) or getAdmin(plr,5) or getAdmin(plr,6) then
        outputChatBox("Komendy przeznaczone dla Administrator:",plr,255,255,255,true)
        for _,v in ipairs(komendy)do
            if v[3] == 4 then
                if string.find(v[1],"BIND") then 
                    outputChatBox(""..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                else
                    outputChatBox("/"..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                end
                
            end
        end
        outputChatBox(" ",plr,255,255,255,true)
    end
    if getAdmin(plr,3) or getAdmin(plr,4) or getAdmin(plr,5) or getAdmin(plr,6) then
        outputChatBox("Komendy przeznaczone dla Moderator:",plr,255,255,255,true)
        for _,v in ipairs(komendy)do
            if v[3] == 3 then
                if string.find(v[1],"BIND") then 
                    outputChatBox(""..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                else
                    outputChatBox("/"..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                end
                
            end
        end
        outputChatBox(" ",plr,255,255,255,true)
    end
    if getAdmin(plr,2) or getAdmin(plr,3) or getAdmin(plr,4) or getAdmin(plr,5) or getAdmin(plr,6) then
        outputChatBox("Komendy przeznaczone dla Support:",plr,255,255,255,true)
        for _,v in ipairs(komendy)do
            if v[3] == 2 then
                if string.find(v[1],"BIND") then 
                    outputChatBox(""..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                else
                    outputChatBox("/"..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                end
                
            end
        end
        outputChatBox(" ",plr,255,255,255,true)
    end
    if getAdmin(plr,1) or getAdmin(plr,2) or getAdmin(plr,3) or getAdmin(plr,4) or getAdmin(plr,5) or getAdmin(plr,6) then
        outputChatBox("Komendy przeznaczone dla Trail Support:",plr,255,255,255,true)
        for _,v in ipairs(komendy)do
            if v[3] == 1 then
                if string.find(v[1],"BIND") then 
                    outputChatBox(""..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                else
                    outputChatBox("/"..v[1].." - #5a3795"..v[2].."",plr,255,255,255,true)
                end
                
            end
        end
    end

end
addCommandHandler("komendy",komendy1)