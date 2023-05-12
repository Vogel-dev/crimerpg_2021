--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

itemygracza = {}
itemkitescik = {}

local wagi = {
    {"paralizator",1300}, 
    {"ziolo",1}, 
    {"kokaina",1}, 
    {"amunicja",10}, 
    {"rakietnica",8000},
    {"ak47", 3420},
    {"m4",3000},
    {"tec",2000},
    {"pila",3000},
    {"deagle",1700},
    {"uzi",2200},
    {"mp5",2600},
    {"noz",300},
    {"kastet",600},
    {"kij_golf",1200},
    {"kij_baseball",1600},
    {"palka",500},
    {"snajperka",5000},
    {"gasnica",2000},
    {"spadochron",500},
    {"cola",500},
    {"woda",300},
    {"kajdanki",1000},
    {"kebab",500},
    {"hamburger",300},
    {"kanister",5000},
    {"zestaw",3000},
    {"zestawdwa",5000},
    {"plecak",500},
    {"zdrapka1",50},
    {"zdrapka2",50},
    {"zdrapka3",50},
    {"ziolo_plant",50},
    {"ziolo_donica",250},
    {"ziolo_nawoz1",50},
    {"ziolo_nawoz2",50},
    {"ziolo_nawoz3",50},
    {"rekawiczki",5},
    {"worek_strunowy",1},
}

addEvent("odegrajRp:eq", true)
addEventHandler("odegrajRp:eq", root, function(gracz, tekst)
	local x, y, z = getElementPosition(gracz)
	local cuboid = createColSphere(x, y, z, 20)
	local wCuboid = getElementsWithinColShape(cuboid, "player")
	destroyElement(cuboid)
	for _, p in ipairs(wCuboid) do
		outputChatBox(tekst, p, 255, 255, 255, true)
	end
end)

addEvent("server:buyitem", true)
addEventHandler("server:buyitem", root, function(nazwa,ilosc,cena)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not nazwa then return end
    if not ilosc then return end
    if not itemygracza then return end
    if not cena then return end
    if getPlayerMoney(source) < cena then triggerClientEvent(source, "addNoti", source, "Nie posiadasz wystarczającej sumy pieniędzy.", "error" ) return end 
    if table.maxn(itemygracza) >= 24 then triggerClientEvent(source, "addNoti", source, "Posiadasz za dużo przedmiotów w ekwipunku.", "error" ) return end 


    if nazwa == "paralizator" then waga = 1300 end 
    if nazwa == "ziolo" then waga = 1 end 
    if nazwa == "kokaina" then waga = 1 end 
    if nazwa == "amunicja" then waga = 10 end 
    if nazwa == "rakietnica" then waga = 8000 end
    if nazwa == "ak47" then waga =  3420 end
    if nazwa == "m4" then waga = 3000 end
    if nazwa == "tec" then waga = 2000 end
    if nazwa == "pila" then waga = 3000 end
    if nazwa == "deagle" then waga = 1700 end
    if nazwa == "uzi" then waga = 2200 end
    if nazwa == "mp5" then waga = 2600 end
    if nazwa == "noz" then waga = 300 end
    if nazwa == "kastet" then waga = 600 end
    if nazwa == "kij_golf" then waga = 1200 end
    if nazwa == "kij_baseball" then waga = 1600 end
    if nazwa == "palka" then waga = 500 end
    if nazwa == "snajperka" then waga = 5000 end
    if nazwa == "gasnica" then waga = 2000 end
    if nazwa == "spadochron" then waga = 500 end
    if nazwa == "cola" then waga = 500 end
    if nazwa == "woda" then waga = 300 end
    if nazwa == "kajdanki" then waga = 1000 end
    if nazwa == "kebab" then waga = 500 end
    if nazwa == "hamburger" then waga = 300 end
    if nazwa == "maska1" then waga = 500 end
    if nazwa == "maska2" then waga = 500 end
    if nazwa == "maska3" then waga = 500 end
    if nazwa == "maska4" then waga = 500 end

    if nazwa == "kanister" then waga = 5000 end
    if nazwa == "zestaw" then waga = 3000 end
    if nazwa == "zestawdwa" then waga = 5000 end

    if nazwa == "wedka" then waga = 500 end
    if nazwa == "wedka2" then waga = 600 end
    if nazwa == "wedka3" then waga = 700 end
    if nazwa == "karas" then waga = 200 end
    if nazwa == "leszcz" then waga = 200 end
    if nazwa == "okon" then waga = 200 end
    if nazwa == "ploc" then waga = 200 end
    if nazwa == "pstrag" then waga = 200 end
    if nazwa == "sandacz" then waga = 200 end
    if nazwa == "sum" then waga = 200 end
    if nazwa == "karp" then waga = 200 end
    if nazwa == "lin" then waga = 200 end
    if nazwa == "amur" then waga = 200 end
    if nazwa == "wegorz" then waga = 200 end
    if nazwa == "fladra" then waga = 300 end
    if nazwa == "rekin" then waga = 1000 end
    if nazwa == "plecak" then waga = 500 end

    if nazwa == "zdrapka1" then waga = 50 end
    if nazwa == "zdrapka2" then waga = 50 end
    if nazwa == "zdrapka3" then waga = 50 end

    if sprawdzwage(ilosc,waga) == false then triggerClientEvent(source, "addNoti", source, "Twój ekwipunek jest za ciężki.", "error" ) return end
    table.insert(itemygracza,{nazwa,ilosc,waga,false,table.maxn(itemygracza)+1})
    takePlayerMoney(source,cena)
    setElementData(source,"player:ekwipunek",itemygracza)
    triggerClientEvent(source, "client:refreshinventory", source)
    triggerClientEvent(source, "addNoti", source, "Kupiłeś przedmiot za "..cena.." PLN", "success" )
    triggerEvent("server:connectitem",source,nazwa)

end)

addEvent("server:movefromgracz", true)
addEventHandler("server:movefromgracz", root, function(id,nazwa,ilosc)
    if not id then return end 
    if not nazwa then return end 
    if not ilosc then return end

    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 3)
    local vehicles = getElementsWithinColShape( cub , "player" )
    destroyElement(cub)
    if table.maxn(vehicles) <= 1 then triggerClientEvent(source, "addNoti", source, "Obok ciebie nie znajduje się żaden gracz.", "error" ) return end 
    if table.maxn(vehicles) > 2 then triggerClientEvent(source, "addNoti", source, "Obok ciebie znajduje się więcej niż 1 gracz.", "error" ) return end 

    for _, vehicle in ipairs( vehicles ) do
        if getPlayerName(vehicle) ~= getPlayerName(source) then 
            typeczek = vehicle
        end
    end

    if not typeczek then return end

    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    local itemyauto = getElementData(typeczek,"vehicle:ekwipunek") or {}
    if table.maxn(itemygracza) >= 24 then triggerClientEvent(source, "addNoti", source, "Posiadasz za dużo rzeczy w ekwipunku.", "error" ) return end 


    if nazwa == "paralizator" then waga = 1300 end 
    if nazwa == "ziolo" then waga = 1 end 
    if nazwa == "kokaina" then waga = 1 end 
    if nazwa == "amunicja" then waga = 10 end 
    if nazwa == "rakietnica" then waga = 8000 end
    if nazwa == "ak47" then waga =  3420 end
    if nazwa == "m4" then waga = 3000 end
    if nazwa == "tec" then waga = 2000 end
    if nazwa == "pila" then waga = 3000 end
    if nazwa == "deagle" then waga = 1700 end
    if nazwa == "uzi" then waga = 2200 end
    if nazwa == "mp5" then waga = 2600 end
    if nazwa == "noz" then waga = 300 end
    if nazwa == "kastet" then waga = 600 end
    if nazwa == "kij_golf" then waga = 1200 end
    if nazwa == "kij_baseball" then waga = 1600 end
    if nazwa == "palka" then waga = 500 end
    if nazwa == "snajperka" then waga = 5000 end
    if nazwa == "gasnica" then waga = 2000 end
    if nazwa == "spadochron" then waga = 500 end
    if nazwa == "cola" then waga = 500 end
    if nazwa == "woda" then waga = 300 end
    if nazwa == "kajdanki" then waga = 1000 end
    if nazwa == "kebab" then waga = 500 end
    if nazwa == "hamburger" then waga = 300 end
    if nazwa == "maska1" then waga = 500 end
    if nazwa == "maska2" then waga = 500 end
    if nazwa == "maska3" then waga = 500 end
    if nazwa == "maska4" then waga = 500 end

    if nazwa == "kanister" then waga = 5000 end
    if nazwa == "zestaw" then waga = 3000 end
    if nazwa == "zestawdwa" then waga = 5000 end

    if nazwa == "wedka" then waga = 500 end
    if nazwa == "wedka2" then waga = 600 end
    if nazwa == "wedka3" then waga = 700 end
    if nazwa == "karas" then waga = 200 end
    if nazwa == "leszcz" then waga = 200 end
    if nazwa == "okon" then waga = 200 end
    if nazwa == "ploc" then waga = 200 end
    if nazwa == "pstrag" then waga = 200 end
    if nazwa == "sandacz" then waga = 200 end
    if nazwa == "sum" then waga = 200 end
    if nazwa == "karp" then waga = 200 end
    if nazwa == "lin" then waga = 200 end
    if nazwa == "amur" then waga = 200 end
    if nazwa == "wegorz" then waga = 200 end
    if nazwa == "fladra" then waga = 300 end
    if nazwa == "rekin" then waga = 1000 end
    if nazwa == "plecak" then waga = 500 end

    if sprawdzwage(ilosc,waga) == false then triggerClientEvent(source, "addNoti", source, "Twój ekwipunek jest za cięzki.", "error" ) return end

    
    triggerEvent("server:additem",source,nazwa,ilosc, "twojstary")
    triggerEvent("server:removeitem",typeczek,id, "dzieli",nazwa, source)
    triggerClientEvent(source, "client:setplayereqprzeszukajdwa", source, typeczek)

end)

addEvent("server:movefromvehicle", true)
addEventHandler("server:movefromvehicle", root, function(id,nazwa,ilosc)
    twojstary = false
    if not id then return end 
    if not nazwa then return end 
    if not ilosc then return end

    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 3)
    local vehicles = getElementsWithinColShape( cub , "vehicle" )
    destroyElement(cub)
    if table.maxn(vehicles) < 1 then triggerClientEvent(source, "addNoti", source, "Obok ciebie nie znajduje się żaden pojazd.", "error" ) return end 
    if table.maxn(vehicles) >= 2 then triggerClientEvent(source, "addNoti", source, "Obok ciebie znajduje się więcej niż 1 pojazd.", "error" ) return end 

    for _, vehicle in ipairs( vehicles ) do
        if getElementData(vehicle,"vehicle:ownedPlayer") == getElementData(source,"player:uid") then 
            car = vehicle
        else 
            twojstary = true
            if getElementData(source,"player:duty") == "SAPD" then 
                car = vehicle
                twojstary = false
            end
        end
    end
    
    if twojstary == true then triggerClientEvent(source, "addNoti", source, "To nie jest twój pojazd.", "error" ) return end 

    if not car then return end

    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    local itemyauto = getElementData(car,"vehicle:ekwipunek") or {}
    if table.maxn(itemygracza) >= 24 then triggerClientEvent(source, "addNoti", source, "Posiadasz za dużo rzeczy w ekwipunku.", "error" ) return end 


    if nazwa == "paralizator" then waga = 1300 end 
    if nazwa == "ziolo" then waga = 1 end 
    if nazwa == "kokaina" then waga = 1 end 
    if nazwa == "amunicja" then waga = 10 end 
    if nazwa == "rakietnica" then waga = 8000 end
    if nazwa == "ak47" then waga =  3420 end
    if nazwa == "m4" then waga = 3000 end
    if nazwa == "tec" then waga = 2000 end
    if nazwa == "pila" then waga = 3000 end
    if nazwa == "deagle" then waga = 1700 end
    if nazwa == "uzi" then waga = 2200 end
    if nazwa == "mp5" then waga = 2600 end
    if nazwa == "noz" then waga = 300 end
    if nazwa == "kastet" then waga = 600 end
    if nazwa == "kij_golf" then waga = 1200 end
    if nazwa == "kij_baseball" then waga = 1600 end
    if nazwa == "palka" then waga = 500 end
    if nazwa == "snajperka" then waga = 5000 end
    if nazwa == "gasnica" then waga = 2000 end
    if nazwa == "spadochron" then waga = 500 end
    if nazwa == "cola" then waga = 500 end
    if nazwa == "woda" then waga = 300 end
    if nazwa == "kajdanki" then waga = 1000 end
    if nazwa == "kebab" then waga = 500 end
    if nazwa == "hamburger" then waga = 300 end
    if nazwa == "maska1" then waga = 500 end
    if nazwa == "maska2" then waga = 500 end
    if nazwa == "maska3" then waga = 500 end
    if nazwa == "maska4" then waga = 500 end

    if nazwa == "kanister" then waga = 5000 end
    if nazwa == "zestaw" then waga = 3000 end
    if nazwa == "zestawdwa" then waga = 5000 end

    if nazwa == "wedka" then waga = 500 end
    if nazwa == "wedka2" then waga = 600 end
    if nazwa == "wedka3" then waga = 700 end
    if nazwa == "karas" then waga = 200 end
    if nazwa == "leszcz" then waga = 200 end
    if nazwa == "okon" then waga = 200 end
    if nazwa == "ploc" then waga = 200 end
    if nazwa == "pstrag" then waga = 200 end
    if nazwa == "sandacz" then waga = 200 end
    if nazwa == "sum" then waga = 200 end
    if nazwa == "karp" then waga = 200 end
    if nazwa == "lin" then waga = 200 end
    if nazwa == "amur" then waga = 200 end
    if nazwa == "wegorz" then waga = 200 end
    if nazwa == "fladra" then waga = 300 end
    if nazwa == "rekin" then waga = 1000 end

    if nazwa == "zdrapka1" then waga = 50 end
    if nazwa == "zdrapka2" then waga = 50 end
    if nazwa == "zdrapka3" then waga = 50 end

    if sprawdzwage(ilosc,waga) == false then triggerClientEvent(source, "addNoti", source, "Twój ekwipunek jest za cięzki.", "error" ) return end

    
    triggerEvent("server:additem",source,nazwa,ilosc)
    triggerEvent("server:removeitem",car,id, "costam",nazwa, source)

end)

addEvent("server:movevehicle", true)
addEventHandler("server:movevehicle", root, function(id,nazwa,ilosc)
    twojstary = false
    if not id then return end 
    if not nazwa then return end 
    if not ilosc then return end

    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 3)
    local vehicles = getElementsWithinColShape( cub , "vehicle" )
    destroyElement(cub)
    if table.maxn(vehicles) < 1 then triggerClientEvent(source, "addNoti", source, "Obok ciebie nie znajduje się żaden pojazd.", "error" ) return end 
    if table.maxn(vehicles) >= 2 then triggerClientEvent(source, "addNoti", source, "Obok ciebie znajduje się więcej niż 1 pojazd.", "error" ) return end 

    for _, vehicle in ipairs( vehicles ) do
        if getElementData(vehicle,"vehicle:ownedPlayer") == getElementData(source,"player:uid") then 
            car = vehicle
        else 
            twojstary = true
        end
    end
    if twojstary == true then triggerClientEvent(source, "addNoti", source, "Pojazd obok ciebie nie jest twój.", "error" ) return end
    if not car then return end

    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    local itemyauto = getElementData(car,"vehicle:ekwipunek") or {}
    if table.maxn(itemyauto) >= 24 then triggerClientEvent(source, "addNoti", source, "Posiadasz za dużo rzeczy w pojeździe.", "error" ) return end 


    if nazwa == "paralizator" then waga = 1300 end 
    if nazwa == "ziolo" then waga = 1 end 
    if nazwa == "kokaina" then waga = 1 end 
    if nazwa == "amunicja" then waga = 10 end 
    if nazwa == "rakietnica" then waga = 8000 end
    if nazwa == "ak47" then waga =  3420 end
    if nazwa == "m4" then waga = 3000 end
    if nazwa == "tec" then waga = 2000 end
    if nazwa == "pila" then waga = 3000 end
    if nazwa == "deagle" then waga = 1700 end
    if nazwa == "uzi" then waga = 2200 end
    if nazwa == "mp5" then waga = 2600 end
    if nazwa == "noz" then waga = 300 end
    if nazwa == "kastet" then waga = 600 end
    if nazwa == "kij_golf" then waga = 1200 end
    if nazwa == "kij_baseball" then waga = 1600 end
    if nazwa == "palka" then waga = 500 end
    if nazwa == "snajperka" then waga = 5000 end
    if nazwa == "gasnica" then waga = 2000 end
    if nazwa == "spadochron" then waga = 500 end
    if nazwa == "cola" then waga = 500 end
    if nazwa == "woda" then waga = 300 end
    if nazwa == "kajdanki" then waga = 1000 end
    if nazwa == "kebab" then waga = 500 end
    if nazwa == "hamburger" then waga = 300 end
    if nazwa == "maska1" then waga = 500 end
    if nazwa == "maska2" then waga = 500 end
    if nazwa == "maska3" then waga = 500 end
    if nazwa == "maska4" then waga = 500 end

    if nazwa == "kanister" then waga = 5000 end
    if nazwa == "zestaw" then waga = 3000 end
    if nazwa == "zestawdwa" then waga = 5000 end

    if nazwa == "wedka" then waga = 500 end
    if nazwa == "wedka2" then waga = 600 end
    if nazwa == "wedka3" then waga = 700 end
    if nazwa == "karas" then waga = 200 end
    if nazwa == "leszcz" then waga = 200 end
    if nazwa == "okon" then waga = 200 end
    if nazwa == "ploc" then waga = 200 end
    if nazwa == "pstrag" then waga = 200 end
    if nazwa == "sandacz" then waga = 200 end
    if nazwa == "sum" then waga = 200 end
    if nazwa == "karp" then waga = 200 end
    if nazwa == "lin" then waga = 200 end
    if nazwa == "amur" then waga = 200 end
    if nazwa == "wegorz" then waga = 200 end
    if nazwa == "fladra" then waga = 300 end
    if nazwa == "rekin" then waga = 1000 end
    if nazwa == "plecak" then waga = 500 end

    if nazwa == "zdrapka1" then waga = 50 end
    if nazwa == "zdrapka2" then waga = 50 end
    if nazwa == "zdrapka3" then waga = 50 end

    if sprawdzwageauto(ilosc,waga,car) == false then triggerClientEvent(source, "addNoti", source, "Posiadasz w pojeździe za dużo przedmiotów.", "error" ) return end
    
    table.insert(itemyauto,{nazwa,ilosc,waga,false,table.maxn(itemyauto)+1})
    setElementData(car,"vehicle:ekwipunek",itemyauto)

    triggerEvent("server:removeitem",source,id, "costam",nazwa)
    triggerClientEvent(source, "client:refreshinventory", source)

end)

addEvent("server:additem", true)
addEventHandler("server:additem", root, function(nazwa,ilosc, mozecos)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not nazwa then return end
    if not ilosc then return end
    if not itemygracza then return end
    if table.maxn(itemygracza) >= 24 then triggerClientEvent(source, "addNoti", source, "Posiadasz za dużo rzeczy w ekwipunku.", "error" ) return end 


    if nazwa == "paralizator" then waga = 1300 end 
    if nazwa == "ziolo" then waga = 1 end 
    if nazwa == "kokaina" then waga = 1 end 
    if nazwa == "amunicja" then waga = 10 end 
    if nazwa == "rakietnica" then waga = 8000 end
    if nazwa == "ak47" then waga =  3420 end
    if nazwa == "m4" then waga = 3000 end
    if nazwa == "tec" then waga = 2000 end
    if nazwa == "pila" then waga = 3000 end
    if nazwa == "deagle" then waga = 1700 end
    if nazwa == "uzi" then waga = 2200 end
    if nazwa == "mp5" then waga = 2600 end
    if nazwa == "noz" then waga = 300 end
    if nazwa == "kastet" then waga = 600 end
    if nazwa == "kij_golf" then waga = 1200 end
    if nazwa == "kij_baseball" then waga = 1600 end
    if nazwa == "palka" then waga = 500 end
    if nazwa == "snajperka" then waga = 5000 end
    if nazwa == "gasnica" then waga = 2000 end
    if nazwa == "spadochron" then waga = 500 end
    if nazwa == "cola" then waga = 500 end
    if nazwa == "woda" then waga = 300 end
    if nazwa == "kajdanki" then waga = 1000 end
    if nazwa == "kebab" then waga = 500 end
    if nazwa == "hamburger" then waga = 300 end
    if nazwa == "maska1" then waga = 500 end
    if nazwa == "maska2" then waga = 500 end
    if nazwa == "maska3" then waga = 500 end
    if nazwa == "maska4" then waga = 500 end

    if nazwa == "kanister" then waga = 5000 end
    if nazwa == "zestaw" then waga = 3000 end
    if nazwa == "zestawdwa" then waga = 5000 end

    if nazwa == "wedka" then waga = 500 end
    if nazwa == "wedka2" then waga = 600 end
    if nazwa == "wedka3" then waga = 700 end
    if nazwa == "karas" then waga = 200 end
    if nazwa == "leszcz" then waga = 200 end
    if nazwa == "okon" then waga = 200 end
    if nazwa == "ploc" then waga = 200 end
    if nazwa == "pstrag" then waga = 200 end
    if nazwa == "sandacz" then waga = 200 end
    if nazwa == "sum" then waga = 200 end
    if nazwa == "karp" then waga = 200 end
    if nazwa == "lin" then waga = 200 end
    if nazwa == "amur" then waga = 200 end
    if nazwa == "wegorz" then waga = 200 end
    if nazwa == "fladra" then waga = 300 end
    if nazwa == "rekin" then waga = 1000 end
    if nazwa == "plecak" then waga = 500 end
    
    if nazwa == "zdrapka1" then waga = 50 end
    if nazwa == "zdrapka2" then waga = 50 end
    if nazwa == "zdrapka3" then waga = 50 end

    if sprawdzwage(ilosc,waga) == false then triggerClientEvent(source, "addNoti", source, "Twój ekwipunek jest za cięzki.", "error" ) return end
    table.insert(itemygracza,{nazwa,ilosc,waga,false,table.maxn(itemygracza)+1})
    setElementData(source,"player:ekwipunek",itemygracza)
    if mozecos == "twojstary" then 

    else
        triggerClientEvent(source, "client:refreshinventory", source)
    end
end)


addEvent("server:giveitem", true)
addEventHandler("server:giveitem", root, function(id,nazwa,ilosc)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not id then return end
    
    --if sprawdzsapd() == true then return end 

    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 1.5)
    local players = getElementsWithinColShape( cub , "player" )
    destroyElement(cub)
    if table.maxn(players) <= 1 then triggerClientEvent(source, "addNoti", source, "Nikt obok ciebie nie stoi.", "error" ) return end 
    if table.maxn(players) > 2 then triggerClientEvent(source, "addNoti", source, "Obok ciebie stoi za dużo osób.", "error" ) return end 

    if nazwa == "rakietnica" then takeWeapon(source,35) end
    if nazwa == "ak47" then takeWeapon(source,30) end
    if nazwa == "m4" then takeWeapon(source,31) end
    if nazwa == "tec" then takeWeapon(source,32) end
    if nazwa == "pila" then takeWeapon(source,9) end
    if nazwa == "deagle" then takeWeapon(source,24) end
    if nazwa == "uzi" then takeWeapon(source,28) end
    if nazwa == "mp5" then takeWeapon(source,29) end
    if nazwa == "noz" then takeWeapon(source,4) end
    if nazwa == "kastet" then takeWeapon(source,1) end
    if nazwa == "kij_golf" then takeWeapon(source,2) end
    if nazwa == "kij_baseball" then takeWeapon(source,5) end
    if nazwa == "palka" then takeWeapon(source,3) end
    if nazwa == "snajperka" then takeWeapon(source,34) end
    if nazwa == "gasnica" then takeWeapon(source,42) end
    if nazwa == "spadochron" then takeWeapon(source,46) end
    if nazwa == "paralizator" then takeWeapon(source,23) end

    if nazwa == "maska1" then 
        if getElementData(source,"maska") == true then 
            for i,v in pairs(getElementsByType("object")) do
                if getElementData(v,"maska:owner") == source then 
                    destroyElement(v)
                end
            end
            setElementData(source,"maska",false)
            setPlayerName(source,getElementData(source,"player:nicknejmsad"))
        end
    end
    if nazwa == "maska2" then 
        if getElementData(source,"maska") == true then 
            for i,v in pairs(getElementsByType("object")) do
                if getElementData(v,"maska:owner") == source then 
                    destroyElement(v)
                end
            end
            setElementData(source,"maska",false)
            setPlayerName(source,getElementData(source,"player:nicknejmsad"))
        end
    end
    if nazwa == "maska3" then 
        if getElementData(source,"maska") == true then 
            for i,v in pairs(getElementsByType("object")) do
                if getElementData(v,"maska:owner") == source then 
                    destroyElement(v)
                end
            end
            setElementData(source,"maska",false)
            setPlayerName(source,getElementData(source,"player:nicknejmsad"))
        end
    end
    if nazwa == "maska4" then 
        if getElementData(source,"maska") == true then 
            for i,v in pairs(getElementsByType("object")) do
                if getElementData(v,"maska:owner") == source then 
                    destroyElement(v)
                end
            end
            setElementData(source,"maska",false)
            setPlayerName(source,getElementData(source,"player:nicknejmsad"))
        end
    end

    if nazwa == "wedka" then 
        if getElementData(source,"wedka") == true then 
            for i,v in pairs(getElementsByType("object")) do
                if getElementData(v,"wedka:owner") == source then 
                    destroyElement(v)
                end
            end
            setElementData(source,"wedka",false)
        end
    end

    if nazwa == "wedka1" then 
        if getElementData(source,"wedka") == true then 
            for i,v in pairs(getElementsByType("object")) do
                if getElementData(v,"wedka:owner") == source then 
                    destroyElement(v)
                end
            end
            setElementData(source,"wedka",false)
        end
    end

    if nazwa == "wedka2" then 
        if getElementData(source,"wedka") == true then 
            for i,v in pairs(getElementsByType("object")) do
                if getElementData(v,"wedka:owner") == source then 
                    destroyElement(v)
                end
            end
            setElementData(source,"wedka",false)
        end
    end
    

    for _, thePlayer in ipairs( players ) do
        if getPlayerName(thePlayer) ~= getPlayerName(source) then 
            target = thePlayer
            for isad,vsad in pairs(wagi) do 
                if wagi[isad][1] == nazwa then 
                    onoasdno = false
                    if sprawdzwagedaje(target,ilosc,wagi[isad][2]) == false then triggerClientEvent(source, "addNoti", source, "Ten gracz nie pomieści więcej rzeczy.", "error" ) onoasdno = true else 
                        triggerEvent("server:removeitem",source,id, "costam",nazwa)
                        triggerEvent("server:additem",target,nazwa,ilosc)
                    end
                end
            end
        end
    end
    if onoasdno == true then 

    else
        triggerClientEvent(source, "addNoti", source, "Podałeś graczowi obok przedmiot.", "info" )
        triggerClientEvent(target, "addNoti", target, "Otrzymałeś od gracza obok przedmiot.", "info" )
    end

end)

addEvent("server:takeitem", true)
addEventHandler("server:takeitem", root, function(id,ilezabrac,jedzenie)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not id then return end
    if not itemygracza then return end
    if not ilezabrac then return end
    if not jedzenie then 
        --if sprawdzsapd() == true then return end 
    end

    itemkitescik = {}
    liczesobie = 0
    for i,v in pairs(itemygracza) do 
        if itemygracza[i][5] == id then 
            itemygracza[i][2] = itemygracza[i][2]-ilezabrac

            if itemygracza[i][2] <= 0 then table.remove(itemygracza,id) end 
        end
    end
    for i,v in pairs(itemygracza) do 
        liczesobie = liczesobie+1
        if not table.empty(itemygracza) then 
            if itemygracza[i][1] then 
                if itemygracza[i][2] then 
                    if itemygracza[i][3] then 
                        table.insert(itemkitescik,{itemygracza[i][1],itemygracza[i][2],itemygracza[i][3],false,liczesobie})
                    end 
                end 
            end 
        end
    end
    setElementData(source,"player:ekwipunek",itemkitescik)
    triggerClientEvent(source, "client:refreshinventory", source)

end)

addEvent("server:connectitem", true)
addEventHandler("server:connectitem", root, function(nazwa)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not itemygracza then return end
    if not nazwa then return end


    liczesobie = 0
    liczeitemka = 0
    idtakie = 0
    idtakiedwa = 0
    itemkitescik = {}
    maxtabelka = table.maxn(itemygracza)
    for i,v in ipairs(itemygracza) do 
        idtakie = idtakie+1
        if itemygracza[i][1] == nazwa then 
            liczeitemka = liczeitemka+itemygracza[i][2]
            waga = itemygracza[i][3]
        end
    end

    for i,v in pairs(itemygracza) do 
        liczesobie = liczesobie+1
        if not table.empty(itemygracza) then 
            if itemygracza[i][1] then 
                if itemygracza[i][2] then 
                    if itemygracza[i][3] then 
                        if itemygracza[i][1] ~= nazwa then 
                            table.insert(itemkitescik,{itemygracza[i][1],itemygracza[i][2],itemygracza[i][3],false,liczesobie})
                        end
                    end 
                end 
            end 
        end
    end

    setElementData(source,"player:ekwipunek",itemkitescik)

    liczesobie = 0
    itemkitescik = {}
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    for i,v in ipairs(itemygracza) do 
        idtakiedwa = idtakiedwa+1
        if itemygracza[i][1] == nazwa then 
            table.remove(itemygracza,idtakiedwa)
        end
    end

    for i,v in pairs(itemygracza) do 
        liczesobie = liczesobie+1
        if not table.empty(itemygracza) then 
            if itemygracza[i][1] then 
                if itemygracza[i][2] then 
                    if itemygracza[i][3] then 
                        if itemygracza[i][1] ~= nazwa then 
                            table.insert(itemkitescik,{itemygracza[i][1],itemygracza[i][2],itemygracza[i][3],false,liczesobie})
                        end
                    end 
                end 
            end 
        end
    end

    table.insert(itemkitescik,{nazwa,liczeitemka,waga,false,liczesobie+1})

    setElementData(source,"player:ekwipunek",itemkitescik)
    triggerClientEvent(source, "client:refreshinventory", source)
end)

addEvent("server:removeitem", true)
addEventHandler("server:removeitem", root, function(id,costam,nazwa, gracz)
    if getElementType(source) == "player" then 
        local itemygracza = getElementData(source,"player:ekwipunek") or {}

        if not id then return end
        if not itemygracza then return end

            if costam ~= "dzieli" then 
                --if sprawdzsapd() == true then return end 
            end

            if nazwa == "rakietnica" then takeWeapon(source,35) end
            if nazwa == "ak47" then takeWeapon(source,30) end
            if nazwa == "m4" then takeWeapon(source,31) end
            if nazwa == "tec" then takeWeapon(source,32) end
            if nazwa == "pila" then takeWeapon(source,9) end
            if nazwa == "deagle" then takeWeapon(source,24) end
            if nazwa == "uzi" then takeWeapon(source,28) end
            if nazwa == "mp5" then takeWeapon(source,29) end
            if nazwa == "noz" then takeWeapon(source,4) end
            if nazwa == "kastet" then takeWeapon(source,1) end
            if nazwa == "kij_golf" then takeWeapon(source,2) end
            if nazwa == "kij_baseball" then takeWeapon(source,5) end
            if nazwa == "palka" then takeWeapon(source,3) end
            if nazwa == "snajperka" then takeWeapon(source,34) end
            if nazwa == "gasnica" then takeWeapon(source,42) end
            if nazwa == "spadochron" then takeWeapon(source,46) end
            if nazwa == "paralizator" then takeWeapon(source,23) end

            if nazwa == "maska1" then 
                if getElementData(source,"maska") == true then 
                    for i,v in pairs(getElementsByType("object")) do
                        if getElementData(v,"maska:owner") == source then 
                            destroyElement(v)
                        end
                    end
                    setElementData(source,"maska",false)
                    setPlayerName(source,getElementData(source,"player:nicknejmsad"))
                end
            end
            if nazwa == "maska2" then 
                if getElementData(source,"maska") == true then 
                    for i,v in pairs(getElementsByType("object")) do
                        if getElementData(v,"maska:owner") == source then 
                            destroyElement(v)
                        end
                    end
                    setElementData(source,"maska",false)
                    setPlayerName(source,getElementData(source,"player:nicknejmsad"))
                end
            end
            if nazwa == "maska3" then 
                if getElementData(source,"maska") == true then 
                    for i,v in pairs(getElementsByType("object")) do
                        if getElementData(v,"maska:owner") == source then 
                            destroyElement(v)
                        end
                    end
                    setElementData(source,"maska",false)
                    setPlayerName(source,getElementData(source,"player:nicknejmsad"))
                end
            end
            if nazwa == "maska4" then 
                if getElementData(source,"maska") == true then 
                    for i,v in pairs(getElementsByType("object")) do
                        if getElementData(v,"maska:owner") == source then 
                            destroyElement(v)
                        end
                    end
                    setElementData(source,"maska",false)
                    setPlayerName(source,getElementData(source,"player:nicknejmsad"))
                end
            end

            if nazwa == "wedka" then 
                if getElementData(source,"wedka") == true then 
                    for i,v in pairs(getElementsByType("object")) do
                        if getElementData(v,"wedka:owner") == source then 
                            destroyElement(v)
                        end
                    end
                    setElementData(source,"wedka",false)
                end
            end

            if nazwa == "wedka2" then 
                if getElementData(source,"wedka") == true then 
                    for i,v in pairs(getElementsByType("object")) do
                        if getElementData(v,"wedka:owner") == source then 
                            destroyElement(v)
                        end
                    end
                    setElementData(source,"wedka",false)
                end
            end

            if nazwa == "wedka3" then 
                if getElementData(source,"wedka") == true then 
                    for i,v in pairs(getElementsByType("object")) do
                        if getElementData(v,"wedka:owner") == source then 
                            destroyElement(v)
                        end
                    end
                    setElementData(source,"wedka",false)
                end
            end


        itemkitescik = {}
        liczesobie = 0
        for i,v in pairs(itemygracza) do 
            if itemygracza[i][5] == id then 
                table.remove(itemygracza,i)
            end
        end
        for i,v in pairs(itemygracza) do 
            liczesobie = liczesobie+1
            if not table.empty(itemygracza) then 
                if itemygracza[i][1] then 
                    if itemygracza[i][2] then 
                        if itemygracza[i][3] then 
                            table.insert(itemkitescik,{itemygracza[i][1],itemygracza[i][2],itemygracza[i][3],false,liczesobie})
                        end 
                    end 
                end 
            end
        end
        setElementData(source,"player:ekwipunek",itemkitescik)
        triggerClientEvent(source, "client:refreshinventory", source)
    else 
        local itemygracza = getElementData(source,"vehicle:ekwipunek") or {}

        if not id then return end
        if not itemygracza then return end

        itemkitescik = {}
        liczesobie = 0
        for i,v in pairs(itemygracza) do 
            if itemygracza[i][5] == id then 
                table.remove(itemygracza,i)
            end
        end
        for i,v in pairs(itemygracza) do 
            liczesobie = liczesobie+1
            if not table.empty(itemygracza) then 
                if itemygracza[i][1] then 
                    if itemygracza[i][2] then 
                        if itemygracza[i][3] then 
                            table.insert(itemkitescik,{itemygracza[i][1],itemygracza[i][2],itemygracza[i][3],false,liczesobie})
                        end 
                    end 
                end 
            end
        end
        setElementData(source,"vehicle:ekwipunek",itemkitescik)
        triggerClientEvent(gracz, "client:setvehicleeqdwa", gracz, source)
    end
end)

addEvent("server:ziolo", true)
addEventHandler("server:ziolo", root, function(id)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not id then return end
    if not itemygracza then return end
    --if sprawdzsapd() == true then return end 
    setElementData(source, "player:drugs", true)
    triggerEvent("server:takeitem",source,id,1)
    triggerClientEvent(source, "client:ziolo", source)
end)

addEvent("server:kokaina", true)
addEventHandler("server:kokaina", root, function(id)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not id then return end
    if not itemygracza then return end
    --if sprawdzsapd() == true then return end 
    setElementData(source, "player:drugs", true)
    triggerEvent("server:takeitem",source,id,1)
    triggerClientEvent(source, "client:kokaina", source)
end)

addEvent("server:zdrapka", true)
addEventHandler("server:zdrapka", root, function(id, zdrapka)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not id then return end
    if not itemygracza then return end
    if not zdrapka then return end

    triggerEvent("server:takeitem",source,id,1)
    if zdrapka == "zdrapka1" then
        zdrap(1,2)
    elseif zdrapka == "zdrapka2" then
        zdrap(1,3)
    elseif zdrapka == "zdrapka3" then
        zdrap(1,4)
    end
end)

function zdrap(ile,ile2)
    local los = math.random(ile,ile2)
    if los == 1 then
        local kwota = math.random(1000,3000)
        triggerClientEvent(source, "addNoti", source, "Zdrapałeś zdrapke, i wygrałeś "..kwota.." PLN", "money" )
        givePlayerMoney(source,kwota)
    elseif los == 2 then 
        local kwota = math.random(3000,6000)
        triggerClientEvent(source, "addNoti", source, "Zdrapałeś zdrapke, i wygrałeś "..kwota.." PLN", "money" )
        givePlayerMoney(source,kwota)
    elseif los == 3 then 
        local kwota = math.random(6000,9000)
        triggerClientEvent(source, "addNoti", source, "Zdrapałeś zdrapke, i wygrałeś "..kwota.." PLN", "money" )
        givePlayerMoney(source,kwota)
    elseif los == 4 then 
        local kwota = math.random(9000,12000)
        triggerClientEvent(source, "addNoti", source, "Zdrapałeś zdrapke, i wygrałeś "..kwota.." PLN", "money" )
        givePlayerMoney(source,kwota)
    end
end

addEvent("server:eat", true)
addEventHandler("server:eat", root, function(id,ile)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not id then return end
    if not itemygracza then return end
    if not ile then return end

    triggerEvent("server:takeitem",source,id,1,"jedzenie")
    local zycie = getElementHealth(source)
    setElementHealth(source,zycie+ile)
end)


addEvent("server:checkvehicleeq", true)
addEventHandler("server:checkvehicleeq", root, function()
    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 3)
    local vehicles = getElementsWithinColShape( cub , "vehicle" )
    destroyElement(cub)
    triggerClientEvent(source, "client:setvehicleeq", source, vehicles)
end)

addEvent("server:checkplayereqprzeszukaj", true)
addEventHandler("server:checkplayereqprzeszukaj", root, function()
    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 1.5)
    local graczysz = getElementsWithinColShape( cub , "player" )
    destroyElement(cub)
    triggerClientEvent(source, "client:setplayereqprzeszukaj", source, graczysz)
end)

addEvent("server:checkvehicleeqprzeszukaj", true)
addEventHandler("server:checkvehicleeqprzeszukaj", root, function()
    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 3)
    local vehicles = getElementsWithinColShape( cub , "vehicle" )
    destroyElement(cub)
    triggerClientEvent(source, "client:setvehicleeqprzeszukaj", source, vehicles)
end)

addEvent("server:kajdanki", true)
addEventHandler("server:kajdanki", root, function()
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not itemygracza then return end
    


    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 1.5)
    local players = getElementsWithinColShape( cub , "player" )
    destroyElement(cub)
    if table.maxn(players) <= 1 then triggerClientEvent(source, "addNoti", source, "Nikt obok ciebie nie stoi.", "error" ) return end 
    if table.maxn(players) > 2 then triggerClientEvent(source, "addNoti", source, "Obok ciebie stoi za dużo osób.", "error" ) return end 

    for _, thePlayer in ipairs( players ) do
        if getPlayerName(thePlayer) ~= getPlayerName(source) then 
            target = thePlayer
        end
    end

    triggerEvent("server:zakuj",source,target)

end)
--ID,X,Y,Z,SCALE,RX,RY,RZ
maskioffsets = {
    {51,0,0,-0.6,1.1,0,0,90},
    {52,0,0,-0.74,1.2,0,0,90},
    {53,0,0,-0.7,1.2,0,0,90},
    {54,0,0,-0.74,1.2,0,0,90},
    {55,0,0,-0.7,1.2,0,0,90},
    {56,0,0,-0.7,1.2,0,0,90},
    {57,0,0,-0.7,1.2,0,0,90},
    {58,0,0,-0.74,1.2,0,0,90},
    {59,0,0,-0.62,1.1,0,0,90},
    {60,0,0,-0.7,1.2,0,0,90},
    {61,0,0,-0.7,1.2,0,0,90},
    {62,0,0,-0.7,1.2,0,0,90},
    {63,0,0,-0.7,1.2,0,0,90},
    {64,0,0,-0.7,1.2,0,0,90},
    {12,0,-0.03,-0.63,1,0,0,90},
    {18,0,0,-0.63,1,0,0,90},
    {2,0,0,-0.74,1.2,0,0,90},
    {102,0,0,-0.74,1.2,0,0,90},
    {16,0,0,-0.74,1.2,0,0,90},
    {41,0,0,-0.74,1.2,0,0,90},
    {21,0,0,-0.74,1.2,0,0,90},
    {28,0,0,-0.74,1.2,0,0,90},
    {45,0,0,-0.74,1.2,0,0,90},
    {46,0,0,-0.74,1.2,0,0,90},
    {78,0,0,-0.74,1.2,0,0,90},
    {93,0,-0.05,-0.74,1.2,0,0,90},
    {116,0,0,-0.74,1.2,0,0,90},
    {29,0,0,-0.74,1.2,0,0,90}
}

addEvent("server:maska", true)
addEventHandler("server:maska", root, function(idmaski)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not itemygracza then return end
    if not idmaski then return end 
    if getElementData(source,"maska") == true then 
        for i,v in pairs(getElementsByType("object")) do
            if getElementData(v,"maska:owner") == source then 
                destroyElement(v)
            end
        end
        setElementData(source,"maska",false)
        setPlayerName(source,getElementData(source,"player:nicknejmsad"))
    else 
        setElementData(source,"player:nicknejmsad",getPlayerName(source))
        setPlayerName(source,"#202020"..removeHex(getPlayerName(source)).."")
        if idmaski == "maska4" then 
            local object = createObject(2996,0,0,0)
            setElementData(object,"maska:owner",source)
            setElementData(source,"maska",true)
            local skin = getElementModel(source) 
            exports.bone_attach:attachElementToBone (object, source, 1, 0, 0, -0.6, 0, 0, 90)
            for i,v in pairs(maskioffsets) do 
                if maskioffsets[i][1] == skin then 
                    setObjectScale(object,maskioffsets[i][5])
                    exports.bone_attach:attachElementToBone (object, source, 1, maskioffsets[i][2], maskioffsets[i][3], maskioffsets[i][4], maskioffsets[i][6], maskioffsets[i][7], maskioffsets[i][8])
                end
            end
        end
        if idmaski == "maska1" then 
            local object = createObject(2998,0,0,0)
            setElementData(object,"maska:owner",source)
            setElementData(source,"maska",true)
            local skin = getElementModel(source) 
            exports.bone_attach:attachElementToBone (object, source, 1, 0, 0, -0.6, 0, 0, 90)
            for i,v in pairs(maskioffsets) do 
                if maskioffsets[i][1] == skin then 
                    setObjectScale(object,maskioffsets[i][5])
                    exports.bone_attach:attachElementToBone (object, source, 1, maskioffsets[i][2], maskioffsets[i][3], maskioffsets[i][4], 0, 0, 90)
                end
            end
        end
        if idmaski == "maska2" then 
            local object = createObject(2997,0,0,0)
            setElementData(object,"maska:owner",source)
            setElementData(source,"maska",true)
            local skin = getElementModel(source) 
            exports.bone_attach:attachElementToBone (object, source, 1, 0, 0, -0.6, 0, 0, 90)
            for i,v in pairs(maskioffsets) do 
                if maskioffsets[i][1] == skin then 
                    setObjectScale(object,maskioffsets[i][5])
                    exports.bone_attach:attachElementToBone (object, source, 1, maskioffsets[i][2], maskioffsets[i][3], maskioffsets[i][4], 0, 0, 90)
                end
            end
        end
        if idmaski == "maska3" then 
            local object = createObject(2995,0,0,0)
            setElementData(object,"maska:owner",source)
            setElementData(source,"maska",true)
            local skin = getElementModel(source) 
            exports.bone_attach:attachElementToBone (object, source, 1, 0, 0, -0.6, 0, 0, 90)
            for i,v in pairs(maskioffsets) do 
                if maskioffsets[i][1] == skin then 
                    setObjectScale(object,maskioffsets[i][5])
                    exports.bone_attach:attachElementToBone (object, source, 1, maskioffsets[i][2], maskioffsets[i][3], maskioffsets[i][4], 0, 0, 90)
                end
            end
        end
    end
end)

addEvent("server:wedka", true)
addEventHandler("server:wedka", root, function(idwedki)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    if not itemygracza then return end
    if not idwedki then return end 
    if getElementData(source,"wedka") == true then 
        for i,v in pairs(getElementsByType("object")) do
            if getElementData(v,"wedka:owner") == source then 
                destroyElement(v)
            end
        end
        setElementData(source,"wedka",false)
    else 
        if idwedki == "wedka" then 
            local object = createObject(1578,0,0,0)
            setElementData(object,"wedka:owner",source)
            setElementData(source,"wedka",true) 
            setElementData(source,"wedka:lvl",1) 
            exports.bone_attach:attachElementToBone (object, source, 12, 0, -0.02, 0, 0, -90, 0)
            local object2sad = createObject(2404,1,1,1)
            setElementData(object2sad,"wedka:owner",source)
            setElementData(object2sad,"wedka:check",source)
            setElementAlpha(object2sad,0)
            exports.bone_attach:attachElementToBone (object2sad, source, 1, 0, 2.5, -2, 0, 0, 0)
        end
        if idwedki == "wedka2" then 
            local object = createObject(1579,0,0,0)
            setElementData(object,"wedka:owner",source)
            setElementData(source,"wedka",true) 
            setElementData(source,"wedka:lvl",2)
            exports.bone_attach:attachElementToBone (object, source, 12, 0, -0.02, 0, 0, -90, 0)
            local object2sad = createObject(2404,1,1,1)
            setElementData(object2sad,"wedka:owner",source)
            setElementData(object2sad,"wedka:check",source)
            setElementAlpha(object2sad,0)
            exports.bone_attach:attachElementToBone (object2sad, source, 1, 0, 2.5, -2, 0, 0, 0)
        end
        if idwedki == "wedka3" then 
            local object = createObject(1580,0,0,0)
            setElementData(object,"wedka:owner",source)
            setElementData(source,"wedka",true) 
            setElementData(source,"wedka:lvl",3)
            exports.bone_attach:attachElementToBone (object, source, 12, 0, -0.02, 0, 0, -90, 0)
            local object2sad = createObject(2404,1,1,1)
            setElementData(object2sad,"wedka:owner",source)
            setElementData(object2sad,"wedka:check",source)
            setElementAlpha(object2sad,0)
            exports.bone_attach:attachElementToBone (object2sad, source, 1, 0, 2.5, -2, 0, 0, 0)
        end
    end
end)

addEvent("server:kanister", true)
addEventHandler("server:kanister", root, function(itemid)
    if not itemid then return end

    if getPedOccupiedVehicle(source) then triggerClientEvent(source, "addNoti", source, "Wyjdź z pojazdu.", "error" ) return end 
    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 3)
    local vehicles = getElementsWithinColShape( cub , "vehicle" )
    destroyElement(cub)
    if table.maxn(vehicles) < 1 then triggerClientEvent(source, "addNoti", source, "Obok ciebie nie znajduje się żaden pojazd.", "error" ) return end 
    if table.maxn(vehicles) >= 2 then triggerClientEvent(source, "addNoti", source, "Obok ciebie znaduje się więcej niż 1 pojazd.", "error" ) return end 

    for _, vehicle in ipairs( vehicles ) do
        car = vehicle
    end

    if not car then return end
    local paliwko = getElementData(car,"vehicle:fuel")
    if paliwko+5 > getElementData(car,"vehicle:bak") then triggerClientEvent(source, "addNoti", source, "Nie wlejesz tyle paliwa do tego pojazdu.", "error" ) return end 

    triggerEvent("server:takeitem",source,itemid,1)
    setElementData(car,"vehicle:fuel",paliwko+5)
    triggerClientEvent(source, "addNoti", source, "Nalałeś 5l paliwa do pojazdu.", "success" )
end)

addEvent("server:fixveh", true)
addEventHandler("server:fixveh", root, function(itemid)
    if not itemid then return end

    if getPedOccupiedVehicle(source) then triggerClientEvent(source, "addNoti", source, "Wyjdź z pojazdu.", "error" ) return end 
    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 3)
    local vehicles = getElementsWithinColShape( cub , "vehicle" )
    destroyElement(cub)
    if table.maxn(vehicles) < 1 then triggerClientEvent(source, "addNoti", source, "Obok ciebie nie znajduje się żaden pojazd.", "error" ) return end 
    if table.maxn(vehicles) >= 2 then triggerClientEvent(source, "addNoti", source, "Obok ciebie znajduje się więcej niż 1 pojazd.", "error" ) return end 

    for _, vehicle in ipairs( vehicles ) do
        car = vehicle
    end

    if not car then return end

    triggerEvent("server:takeitem",source,itemid,1)
    setElementHealth(car,1000)
    triggerClientEvent(source, "addNoti", source, "Pojazd został naprawiony poprawnie.", "success" )
end)

addEvent("server:fixvehdwa", true)
addEventHandler("server:fixvehdwa", root, function(itemid)
    if not itemid then return end

    if getPedOccupiedVehicle(source) then triggerClientEvent(source, "addNoti", source, "Wyjdź z pojazdu.", "error" ) return end 
    local x,y,z = getElementPosition(source)
    local cub = createColSphere(x, y, z, 3)
    local vehicles = getElementsWithinColShape( cub , "vehicle" )
    destroyElement(cub)
    if table.maxn(vehicles) < 1 then triggerClientEvent(source, "addNoti", source, "Obok ciebie nie znajduje się żaden pojazd.", "error" ) return end 
    if table.maxn(vehicles) >= 2 then triggerClientEvent(source, "addNoti", source, "Obok ciebie znajduje się więcej niż 1 pojazd.", "error" ) return end 

    for _, vehicle in ipairs( vehicles ) do
        car = vehicle
    end

    if not car then return end

    triggerEvent("server:takeitem",source,itemid,1)
    setElementHealth(car,1000)
    fixVehicle(car)
    triggerClientEvent(source, "addNoti", source, "Pojazd został naprawiony pomyślnie.", "success" )
end)

addEvent("server:giveweapon", true)
addEventHandler("server:giveweapon", root, function(id,id2,id3)
    if not id then return end 
    if not id2 then return end
    if id3 >= 2 then 
        setPedStat(source, 75, 1000)
    else
        setPedStat(source, 75, 0)
    end
    if getPedWeapon(source) == 22 then triggerClientEvent(source, "addNoti", source, "Błąd #02.", "error" ) return end
    if getPedWeapon(source) ~= 0 then
        takeWeapon(source,getPedWeapon(source))
    else 
        local maxammo = getWeaponProperty (id2, "pro", "maximum_clip_ammo" )
        if not maxammo then maxammo = 1 end
        giveWeapon(source, id2, 0, true)
        setWeaponAmmo ( source, id2, maxammo*3, maxammo)
        reloadPedWeapon ( source )
    end
end)

function table.empty( a )
    if type( a ) ~= "table" then
        return false
    end
    
    return next(a) == nil
end


function sprawdzwage(ilosc,waga)
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    aktualnagracz = 0
    for i,v in ipairs(itemygracza) do 
        aktualnagracz = aktualnagracz + itemygracza[i][2]*itemygracza[i][3]
    end
    if chceckitemplr("plecak",1) == true then 
        if aktualnagracz+waga*ilosc > 27000 then return false end
    else
        if aktualnagracz+waga*ilosc > 15000 then return false end
    end
    return true
end

function sprawdzwagedaje(plajer,ilosc,waga)
    local itemygracza = getElementData(plajer,"player:ekwipunek") or {}
    aktualnagracz = 0
    for i,v in ipairs(itemygracza) do 
        aktualnagracz = aktualnagracz + itemygracza[i][2]*itemygracza[i][3]
    end
    if chceckitemplrdaje(plajer,"plecak",1) == true then 
        if aktualnagracz+waga*ilosc > 27000 then return false end
    else
        if aktualnagracz+waga*ilosc > 15000 then return false end
    end
    return true
end

function chceckitemplrdaje(plajer,nazwa,ilosc)
    if not nazwa then return end 
    if not ilosc then return end
    local itemygracza = getElementData(plajer,"player:ekwipunek") or {}
    znalazl = false
    for i,v in pairs(itemygracza) do 
        if itemygracza[i][1] == nazwa then 
            if tonumber(itemygracza[i][2]) >= ilosc then 
                znalazl = true 
            end
        end
    end
    return znalazl    
end

function chceckitemplr(nazwa,ilosc)
    if not nazwa then return end 
    if not ilosc then return end
    local itemygracza = getElementData(source,"player:ekwipunek") or {}
    znalazl = false
    for i,v in pairs(itemygracza) do 
        if itemygracza[i][1] == nazwa then 
            if tonumber(itemygracza[i][2]) >= ilosc then 
                znalazl = true 
            end
        end
    end
    return znalazl    
end

function sprawdzwageauto(ilosc,waga, car)
    local veh = car
    local itemygracza = getElementData(car,"vehicle:ekwipunek") or {}
    aktualnagracz = 0
    for i,v in ipairs(itemygracza) do 
        aktualnagracz = aktualnagracz + itemygracza[i][2]*itemygracza[i][3]
    end
    if aktualnagracz+waga*ilosc > 30000 then return false end
    return true
end

function getPedWeapons(ped)
	local playerWeapons = {}
	if ped and isElement(ped) and getElementType(ped) == "ped" or getElementType(ped) == "player" then
		for i=2,9 do
			local wep = getPedWeapon(ped,i)
			if wep and wep ~= 0 then
				table.insert(playerWeapons,wep)
			end
		end
	else
		return false
	end
	return playerWeapons
end

function sprawdzsapd()
    local x,y,z = getElementPosition(source)
    local cubdwa = createColSphere(x, y, z, 12)
    local playersdwa = getElementsWithinColShape( cubdwa , "player" )
    destroyElement(cubdwa)

    for _, thePlayerdwa in ipairs( playersdwa ) do
        if getPlayerName(thePlayerdwa) ~= getPlayerName(source) then 
            if getElementData(source,"player:duty") then return false end 
            if getElementData(thePlayerdwa,"player:duty") then triggerClientEvent(source, "addNoti", source, "Nie możesz tego zrobić w pobliżu policjanta.", "error" ) return true end 

        end
    end
return false end

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end

addEventHandler("onPlayerQuit", root, function()
    for i,v in pairs(getElementsByType("object")) do
        if getElementData(v,"maska:owner") == source then 
            destroyElement(v)
        end
        if getElementData(v,"wedka:owner") == source then 
            destroyElement(v)
        end
    end
end)

addEvent( "eq:serverfishsounds", true ) 
addEventHandler( "eq:serverfishsounds", getRootElement(), function(x,y,z,czastajmer,dej) 
    triggerClientEvent(root,"eq:fishsounds",root,x,y,z,czastajmer,dej)
end) 
addEvent( "eq:serverfishsoundsdwa", true ) 
addEventHandler( "eq:serverfishsoundsdwa", getRootElement(), function(x,y,z,dej) 
    triggerClientEvent(root,"eq:fishsoundsdwa",root,x,y,z,dej)
end) 


local sellryby=createMarker(-91.33, -1591.14, 3.00-1,"cylinder",2,255, 155, 255,1)

cenyryb = {
    {"wegorz",300},
    {"amur",270},
    {"lin",230},
    {"karp",220},
    {"pstrag",250},
    {"ploc",200},
    {"okon",230},
    {"leszcz",250},
    {"karas",200},
    {"sum",330},
    {"sandacz",260},
    {"fladra",300},
    {"rekin",330},
}

addEvent("server:sellfish", true)
addEventHandler("server:sellfish", root, function(id,ilosc,nazwa)
    if not id then return end 
    if not ilosc then return end 
    if not nazwa then return end 
    if isElementWithinMarker(source,sellryby) then 
        for i,v in pairs(cenyryb) do 
            if nazwa == cenyryb[i][1] then 
                local cenaryby = ilosc*cenyryb[i][2]
                local cenaryby = cenaryby*2.3
                if getElementData(source,"player:premium") then 
                    cenaryby = cenaryby*1.15
                    dostanie = math.floor(cenaryby*0.9)
                    podatek = math.floor(cenaryby*0.1)
                    triggerClientEvent(source, "addNoti", source, "Sprzedałeś "..ilosc.." ryb za "..dostanie.." PLN", "money" )
                else 
                    cenaryby = cenaryby
                    dostanie = math.floor(cenaryby*0.9)
                    podatek = math.floor(cenaryby*0.1)
                    triggerClientEvent(source, "addNoti", source, ".", "money" )
                    triggerClientEvent(source, "addNoti", source, "Sprzedałeś "..ilosc.." ryb za "..dostanie.." PLN", "money" )
                end

                local resultdda=exports["crime_database"]:dbGet("SELECT * FROM crime_informations WHERE id=1 ")
                if #resultdda > 0 then
                    local queryssa=exports["crime_database"]:dbSet("UPDATE crime_informations SET podatki=? WHERE id=?", resultdda[1].podatki+podatek,  1)
                end
                triggerEvent("server:takeitem",source,id,ilosc,"jedzenie")
                local pexp = getElementData(source,"player:exp") or 0 
                setElementData(source,"player:exp",pexp+ilosc)
                givePlayerMoney(source,dostanie)
                local uid = getElementData(source,"player:uid")
                exports["crime_database"]:dbSet("UPDATE crime_users SET zarobki=zarobki+? WHERE id=? LIMIT 1",dostanie,uid)
            end
        end
    else 
        triggerClientEvent(source, "addNoti", source, "Nie jesteś u wędkarza.", "error" )
    end
end)

addEvent("server:eqsoundstop", true)
addEventHandler("server:eqsoundstop", root, function(x,y,z)
    triggerClientEvent(root,"client:eqsoundstop",root,x,y,z)
end)