--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
local panel = false
selected = nil

function gui()
    if panel == true then 
        if not getElementData(localPlayer,"player:admin") then return end 
        if selected ~= nil and isElement(selected) and getElementType(selected) == "vehicle" then 
            exports["crime_gui"]:guibutton( "Napraw (500 PLN)", 425/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Zatankuj 5l (500 PLN)", 425/zmienna, 934/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Wyślij do przecho", 425/zmienna, 861/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Przenieś do siebie", 645/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Zaciągnij ręczny", 645/zmienna, 934/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Spuść ręczny", 645/zmienna, 861/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Obróć (Do pionu)", 865/zmienna, 861/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Obróć (Na dach)", 865/zmienna, 934/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Obróć (Lewo, prawo)", 865/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Otwórz pojazd", 1085/zmienna, 861/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Teleportuj do środka", 1085/zmienna, 934/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Informacje", 1085/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna, 255)
        elseif selected ~= nil and isElement(selected) and getElementType(selected) == "player" then
            exports["crime_gui"]:guibutton( "100% HP", 425/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Teleportuj do gracza", 425/zmienna, 934/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "Teleportuj gracza", 425/zmienna, 861/zmienna, 210/zmienna, 63/zmienna, 255)
            exports["crime_gui"]:guibutton( "100% armoru", 645/zmienna, 861/zmienna, 210/zmienna, 63/zmienna, 255)
        end
    end
end

addEventHandler("onClientClick", root, function(btn,state,x,y,wx,wy,wz,clickedworld)
    if btn=="left" and state=="down" then
        
        if panel == true then 
            if isMouseIn(425/zmienna, 861/zmienna, 871/zmienna, 209/zmienna) then return end
            selected = nil
            panel = false
            removeEventHandler("onClientRender",root,gui)
        else
            if clickedworld then 
                if not getElementData(localPlayer,"player:admin") then return end 
                if getElementType(clickedworld) == "vehicle" or getElementType(clickedworld) == "player" then 
                    if getElementData(localPlayer,"player:szuszioff") == true then return end
                    selected = clickedworld
                    addEventHandler("onClientRender",root,gui)
                    panel = true
                end
            end
        end
    end
end)

addEventHandler("onClientClick", root, function(btn,state,x,y,wx,wy,wz,clickedworld)
    if btn=="left" and state=="down" then
        if panel == true and selected then 
            if not getElementData(localPlayer,"player:admin") then return end 
            if selected and getElementType(selected) == "vehicle" then 
                if isMouseIn(425/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna) then --fix
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "fix")
                elseif isMouseIn(425/zmienna, 934/zmienna, 210/zmienna, 63/zmienna) then -- 5l paliwa
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "paliwo")
                elseif isMouseIn(425/zmienna, 861/zmienna, 210/zmienna, 63/zmienna) then -- przecho
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "przecho")
                    selected = nil
                    panel = false
                    removeEventHandler("onClientRender",root,gui)
                elseif isMouseIn(645/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna) then --tp do ciebie
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "docbauto")
                elseif isMouseIn(645/zmienna, 934/zmienna, 210/zmienna, 63/zmienna) then --zaciagnij reczny
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "reczny")
                elseif isMouseIn(645/zmienna, 861/zmienna, 210/zmienna, 63/zmienna) then -- spusc reczny
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "spuscreczny")
                elseif isMouseIn(865/zmienna, 861/zmienna, 210/zmienna, 63/zmienna) then -- obroc do pionu
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "pion")
                elseif isMouseIn(865/zmienna, 934/zmienna, 210/zmienna, 63/zmienna) then -- obroc na dach
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "dach")
                elseif isMouseIn(865/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna) then -- obroc lewo,prawo
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "lewoprawo")
                elseif isMouseIn(1085/zmienna, 861/zmienna, 210/zmienna, 63/zmienna) then -- otworz pojazd
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "otworz")
                elseif isMouseIn(1085/zmienna, 934/zmienna, 210/zmienna, 63/zmienna) then -- teleportuj do pojazdu
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "tpdoauta")
                elseif isMouseIn(1085/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna) then -- info
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "infoveh")
                end
            elseif getElementType(selected) == "player" then 
                if isMouseIn(425/zmienna, 1007/zmienna, 210/zmienna, 63/zmienna) then --100hp
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "100hpgracz")
                elseif isMouseIn(425/zmienna, 934/zmienna, 210/zmienna, 63/zmienna) then -- tp do
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "tpdogracz")
                elseif isMouseIn(425/zmienna, 861/zmienna, 210/zmienna, 63/zmienna) then -- tp do cb
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "tpdocbgracz")
                elseif isMouseIn(645/zmienna, 861/zmienna, 210/zmienna, 63/zmienna) then -- 100 armoru
                    triggerServerEvent("server:suszarkaczynnosc", localPlayer, selected, "100armoru")
                end
            end
        end
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