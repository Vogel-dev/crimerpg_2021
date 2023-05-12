--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 19/zmienna)
local dxfont1_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 41/zmienna)
local dxfont2_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 16/zmienna)
local dxfont3_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 14/zmienna)

gui = false
event = false 

local graczy = 0
local tytul = "ERROR"
local opis = "ERROR"


function gui() 
    dxDrawImage(645/zmienna, 54/zmienna, 631/zmienna, 176/zmienna, ":crime_files/dutyadmin/event.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

    exports["crime_gui"]:guitext(tytul, 1001/zmienna, 79/zmienna, 1088/zmienna, 106/zmienna, 200, 200, 200,255, dxfont0_PantonBold)
    exports["crime_gui"]:guitext(graczy, 718/zmienna, 101/zmienna, 737/zmienna, 165/zmienna, 200, 200, 200,255, dxfont1_SegoeLight)
    exports["crime_gui"]:guitext("Chętnych", 687/zmienna, 165/zmienna, 769/zmienna, 196/zmienna, 200, 200, 200,255, dxfont2_SegoeLight)
    exports["crime_gui"]:guitext(opis, 810/zmienna, 116/zmienna, 1276/zmienna, 230/zmienna, 200, 200, 200,255, dxfont3_SegoeLight)
end 

addEvent("usunguiall",true)
addEventHandler("usunguiall",root,function()
        removeEventHandler("onClientRender", root, gui)
end)

addEvent("dodajguiall",true)
addEventHandler("dodajguiall",root,function(tytuls,opiss)
        tytul = tytuls 
        opis = opiss
        graczy = 0
        addEventHandler("onClientRender", root, gui)
end)

addEvent("aktualizacjaguiall",true)
addEventHandler("aktualizacjaguiall",root,function(graczys)
        graczy = graczys
end)