--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)

local iconf1 = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 19/zmienna)
local iconf2 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 19/zmienna)

--BUTTON
function guibutton(tekst,w1,w2,w3,w4,a)
    dxDrawImage(w1,w2,w3,w4, ":crime_files/gui/button.png", 0, 0, 0, tocolor(255,255,255, a), false)
    if isMouseIn(w1,w2,w3,w4) then dxDrawImage(w1,w2,w3,w4, ":crime_files/gui/activebutton.png", 0, 0, 0, tocolor(255,255,255, a), false) end
    dxDrawText(tostring(tekst):gsub("#%x%x%x%x%x%x",""), w1 + 1, w2 + 1, w1+w3 + 1, w2+w4 -1, tocolor(0, 0, 0, a), 1.00, font, "center", "center", false, false, false, true, false)
    dxDrawText(tostring(tekst), w1,w2,w1+w3,w2+w4 - 2, tocolor(200, 200, 200, a), 1.00, font, "center", "center", false, false, false, true, false)
end

--BUTTONrgb
function guibuttonrgb(tekst,w1,w2,w3,w4,a,r,g,b)
    dxDrawImage(w1,w2,w3,w4, ":crime_files/gui/button.png", 0, 0, 0, tocolor(255,255,255, a), false)
    if isMouseIn(w1,w2,w3,w4) then dxDrawImage(w1,w2,w3,w4, ":crime_files/gui/activebutton2.png", 0, 0, 0, tocolor(r,g,b, a), false) end
    dxDrawText(tostring(tekst):gsub("#%x%x%x%x%x%x",""), w1 + 1, w2 + 1, w1+w3 + 1, w2+w4 -2, tocolor(0, 0, 0, a), 1.00, font, "center", "center", false, false, false, true, false)
    dxDrawText(tostring(tekst), w1,w2,w1+w3,w2+w4 - 1, tocolor(200, 200, 200, a), 1.00, font, "center", "center", false, false, false, true, false)
end

--BUTTONhex
function guibuttonhex(w1,w2,w3,w4,a)
    if isMouseIn(w1,w2,w3,w4) then
         dxDrawImage(w1, w2, w3, w4, ":crime_files/logowanie/new/buttonlogina.png", 0, 0, 0, tocolor(255, 255, 255, a), false)
    else 
        dxDrawImage(w1, w2, w3, w4, ":crime_files/logowanie/new/buttonlogin.png", 0, 0, 0, tocolor(255, 255, 255, a), false)
    end
end

--BUTTON ICON
function guibuttonicon(tekst,w1,w2,w3,w4,a,icon)
    dxDrawImage(w1, w2, w3, w4, ":crime_files/gui/normal.png", 0, 0, 0, tocolor(255, 255, 255, a), false)
    if isMouseIn(w1,w2,w3,w4) then dxDrawImage(w1,w2,w3,w4, ":crime_files/gui/selected.png", 0, 0, 0, tocolor(255,255,255, a-20), false) end
    --tekst
    dxDrawText(tostring(tekst), (w1+95)+1,w2+1,(w1+w3)+1,(w2+w4)+1, tocolor(0, 0, 0, a), 1.00, iconf1, "left", "center", false, false, false, false, false)
    dxDrawText(tostring(tekst), (w1+95),w2,(w1+w3),(w2+w4), tocolor(200, 200, 200, a), 1.00, iconf1, "left", "center", false, false, false, false, false)
    --ikona
    dxDrawText(tostring(icon), w1+1,w2+1,(w1+95)+1,(w2+w4)+1, tocolor(0, 0, 0, a), 1.00, iconf2, "center", "center", false, false, false, false, false)
    dxDrawText(tostring(icon), w1,w2,(w1+95),(w2+w4), tocolor(255, 255, 255, a), 1.00, iconf2, "center", "center", false, false, false, false, false)
end

--SWITCH
function guiswitch(w1,w2,w3,w4,a,wlaczony)
    if wlaczony == true then 
        dxDrawImage(w1, w2, w3, w4, ":crime_files/gui/switchon.png", 0, 0, 0, tocolor(255, 255, 255, a), false)
        --if isMouseIn(w1,w2,w3,w4) then dxDrawImage(w1, w2, w3, w4, ":crime_files/gui/switchoff.png", 0, 0, 0, tocolor(255, 255, 255, a), false) end
    else
        dxDrawImage(w1, w2, w3, w4, ":crime_files/gui/switchoff.png", 0, 0, 0, tocolor(255, 255, 255, a), false)
        --if isMouseIn(w1,w2,w3,w4) then dxDrawImage(w1, w2, w3, w4, ":crime_files/gui/switchon.png", 0, 0, 0, tocolor(255, 255, 255, a), false) end
    end
end

--ICON
function guiicon(icon,w1,w2,w3,w4,a,fonthere,test123, test321, r,g,b)
    if not r then r = 188 end 
    if not g then g = 188 end 
    if not b then b = 188 end
    if test321 ~= 1 then 
        dxDrawText(tostring(icon), w1+1,w2+1,w3+1,w4+1, tocolor(0, 0, 0, a), 1.00, fonthere, "center", "center", false, false, false, false, false)
    end
    if test123 == 1 then 
        dxDrawText(tostring(icon), w1,w2,w3,w4, tocolor(r, g, b, a), 1.00, fonthere, "center", "center", false, false, false, false, false)
        if isMouseIn(w1,w2,w3-w1,w4-w2) then dxDrawText(tostring(icon), w1,w2,w3,w4, tocolor(255, 255, 255, a), 1.00, fonthere, "center", "center", false, false, false, false, false) end
    else 
        dxDrawText(tostring(icon), w1,w2,w3,w4, tocolor(255, 255, 255, a), 1.00, fonthere, "center", "center", false, false, false, false, false)
    end
end

--Tekst
function guitext(tekst,w1,w2,w3,w4,r,g,b,a,textfont,typtenno, typtennodwa)
    if not typtenno then typtenno = "center" end
    if not typtennodwa then typtennodwa = "center" end
    dxDrawText(tostring(tekst):gsub("#%x%x%x%x%x%x",""), w1 + 1, w2 + 1, w3 + 1, w4 +1, tocolor(0, 0, 0, a), 1.00, textfont, typtenno, typtennodwa, false, false, false, true, false)
    dxDrawText(tostring(tekst), w1,w2,w3,w4, tocolor(r, g, b, a), 1.00, textfont, typtenno, typtennodwa, false, false, false, true, false)
end

--Tekstcas
function guitextcas(tekst,w1,w2,w3,w4,r,g,b,a,textfont,typtenno, typtennodwa)
    if not typtenno then typtenno = "center" end
    if not typtennodwa then typtennodwa = "center" end
    dxDrawText(tostring(tekst):gsub("#%x%x%x%x%x%x",""), w1 + 1, w2 + 1, w3 + 1, w4 +1, tocolor(0, 0, 0, a), 1.00, textfont, typtenno, typtennodwa, false, false, true, true, false)
    dxDrawText(tostring(tekst), w1,w2,w3,w4, tocolor(r, g, b, a), 1.00, textfont, typtenno, typtennodwa, false, false, true, true, false)
end

--Tekstprawko
function guitextprawko(tekst,w1,w2,w3,w4,r,g,b,a,textfont,typtenno, typtennodwa)
    if not typtenno then typtenno = "center" end
    if not typtennodwa then typtennodwa = "center" end
    dxDrawText(tostring(tekst), w1 + 1, w2 + 1, w3 + 1, w4 +1, tocolor(0, 0, 0, a), 1.00, textfont, typtenno, typtennodwa, false, true, false, false, false)
    dxDrawText(tostring(tekst), w1,w2,w3,w4, tocolor(r, g, b, a), 1.00, textfont, typtenno, typtennodwa, false, true, false, false, false)
end

--tekstlogiadmin
function guitextlogiadm(tekst,w1,w2,w3,w4,r,g,b,a,textfont,typtenno, typtennodwa)
    if not typtenno then typtenno = "center" end
    if not typtennodwa then typtennodwa = "center" end
    dxDrawText(tostring(tekst):gsub("#%x%x%x%x%x%x",""), w1 + 1, w2 + 1, w3 + 1, w4 +1, tocolor(0, 0, 0, a), 1.00, textfont, typtenno, typtennodwa, false, true, false, true, false)
    dxDrawText(tostring(tekst), w1,w2,w3,w4, tocolor(r, g, b, a), 1.00, textfont, typtenno, typtennodwa, false, true, false, true, false)
end

--RESZTA
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