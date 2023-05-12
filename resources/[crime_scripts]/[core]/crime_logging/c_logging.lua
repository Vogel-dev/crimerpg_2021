--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

if getElementData(localPlayer, "player:uid") then return end


local resourceRoot = getResourceRootElement(getThisResource())
local screenW, screenH = guiGetScreenSize()

tick = getTickCount()

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
zakladka = 1

local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 22/zmienna)
local font2 = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 23/zmienna)
local fontxd = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 11/zmienna)

local dxfont0_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 62/zmienna)
local dxfont1_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)

local data={ showed=nil, button={}, info=nil, misc=nil, }

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

local image = math.random(1,7)

function renderLoginBox()
	if isTransferBoxActive() then return end
	warning = warning or ""
	local ticki = getTickCount()
	if progressdwa == "wlacza" then
		local Progress = (ticki-tickistart)/czas
		local alp = interpolateBetween(0,0,0,200,0,0,Progress,"Linear")
		local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
		if alp then alptest = alp else alp = 200 end 
		if alp2 then alp2test = alp2 else alp2 = 255 end
	else 
		local Progress = (ticki-tickistart)/czas
		local alp = interpolateBetween(200,0,0,0,0,0,Progress,"Linear")
		local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
		if alp then alptest = alp else alp = 0 end 
		if alp2 then alp2test = alp2 else alp2 = 0 end
	end
	local a = (math.sqrt(getSoundFFTData(data.misc, 2048, 2)[1])*256) or 150
		dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, ":crime_files/logowanie/new/bg"..image..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	if zakladka == 1 then 
		dxDrawImage(683/zmienna, 35/zmienna, 553/zmienna, 340/zmienna, ":crime_files/logowanie/new/logo.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		dxDrawImage(683/zmienna, 425/zmienna, 200/zmienna, 200/zmienna, ":crime_files/logowanie/new/account.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		dxDrawImage(1032/zmienna, 425/zmienna, 200/zmienna, 200/zmienna, ":crime_files/logowanie/new/recovery.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		exports["crime_gui"]:guibuttonhex(633/zmienna, 525/zmienna, 302/zmienna, 302/zmienna, alp2test) -- register
		exports["crime_gui"]:guibuttonhex(984/zmienna, 525/zmienna, 302/zmienna, 302/zmienna, alp2test) -- login
		exports["crime_gui"]:guitext("Stwórz nowe konto", 656/zmienna, 789/zmienna, 910/zmienna, 565/zmienna, 255, 255, 255, alp2test, dxfont1_FiraEC) -- register
		exports["crime_gui"]:guitext("Odzyskaj istniejące konto", 1012/zmienna, 789/zmienna, 1266/zmienna, 566/zmienna, 255, 255, 255, alp2test, dxfont1_FiraEC) -- login
		exports["crime_gui"]:guitext(warning, 0/zmienna, 706/zmienna, 1920/zmienna, 821/zmienna, 255, 0, 0, alp2test, dxfont1_FiraEC)
	end
	if zakladka == 2 then
		dxDrawImage(683/zmienna, 35/zmienna, 553/zmienna, 340/zmienna, ":crime_files/logowanie/new/logo.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		dxDrawImage(706/zmienna, 390/zmienna, 516/zmienna, 504/zmienna, ":crime_files/logowanie/register.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		exports["crime_gui"]:guitext("Rejestracja", 705/zmienna, 249/zmienna, 1219/zmienna, 326/zmienna, 255, 255, 255, alp2test, dxfont0_PantonBold)
		exports["crime_gui"]:guibutton( "Wróć", 752/zmienna, 818/zmienna, 193/zmienna, 58/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Zarejestruj", 982/zmienna, 818/zmienna, 193/zmienna, 58/zmienna, alp2test)
		exports["crime_gui"]:createEditbox("login", 784/zmienna, 505/zmienna, 356/zmienna, 51/zmienna, true, "", false, 16, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 51, 21, 75, 180 }, 1, true, 70, true, "Wpisz login konta..", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:createEditbox("haslo1", 784/zmienna, 580/zmienna, 356/zmienna, 51/zmienna, true, "", true, 30, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 51, 21, 75, 180 }, 1, true, 70, true, "Wpisz hasło konta...", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:createEditbox("haslo2", 784/zmienna, 660/zmienna, 356/zmienna, 51/zmienna, true, "", true, 30, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 51, 21, 75, 180 }, 1, true, 70, true, "Powtórz hasło konta...", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:createEditbox("email", 784/zmienna, 740/zmienna, 356/zmienna, 51/zmienna, true, "", false, 50, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 51, 21, 75, 180 }, 1, true, 70, true, "Wpisz e-mail...", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:guitext(warning, 0/zmienna, 1050/zmienna, 1920/zmienna, 821/zmienna, 255, 0, 0, alp2test, dxfont1_FiraEC)
	end 
	if zakladka == 3 then 
		dxDrawImage(683/zmienna, 35/zmienna, 553/zmienna, 340/zmienna, ":crime_files/logowanie/new/logo.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		dxDrawImage(706/zmienna, 390/zmienna, 516/zmienna, 504/zmienna, ":crime_files/logowanie/recovering.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
		exports["crime_gui"]:guitext("Odzyskiwanie", 705/zmienna, 249/zmienna, 1219/zmienna, 326/zmienna, 255, 255, 255, alp2test, dxfont0_PantonBold)
		exports["crime_gui"]:guibutton( "Wróć", 752/zmienna, 818/zmienna, 193/zmienna, 58/zmienna, alp2test)
		exports["crime_gui"]:guibutton( "Odzyskaj", 982/zmienna, 818/zmienna, 193/zmienna, 58/zmienna, alp2test)
		exports["crime_gui"]:createEditbox("loginodz", 784/zmienna, 505/zmienna, 356/zmienna, 51/zmienna, true, "", false, 16, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 51, 21, 75, 180 }, 1, true, 70, true, "Wpisz login konta..", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:createEditbox("haslo1odz", 784/zmienna, 580/zmienna, 356/zmienna, 51/zmienna, true, "", true, 30, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 51, 21, 75, 180 }, 1, true, 70, true, "Wpisz hasło konta...", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:createEditbox("haslo2odz", 784/zmienna, 660/zmienna, 356/zmienna, 51/zmienna, true, "", true, 30, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 51, 21, 75, 180 }, 1, true, 70, true, "Powtórz hasło konta...", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:createEditbox("emailodz", 784/zmienna, 740/zmienna, 356/zmienna, 51/zmienna, true, "", false, 50, font, false, 0, { 230, 230, 230, 255 }, true, { 200, 200, 200, 180 }, { 51, 21, 75, 180 }, 1, true, 70, true, "Wpisz e-mail...", { 230, 230, 230, 255 }, true, 1, font, true, false, {255,255,255,0}, true)
		exports["crime_gui"]:guitext(warning, 0/zmienna, 1050/zmienna, 1920/zmienna, 821/zmienna, 255, 0, 0, alp2test, dxfont1_FiraEC)
	end

end


local nick = getPlayerName(localPlayer):gsub('#%x%x%x%x%x%x', '') or ""
local serial = getPlayerSerial(localPlayer) or ""
local czasxd = getElementData(localPlayer,"banczas") or ""
local powod = getElementData(localPlayer,"banpowod") or ""

local powod = [[

#5a3795Zostałeś zbanowany!#cccccc

#ccccccTwój nick:#5a3795 ]]..nick..[[ 
#ccccccTwój serial:#5a3795 ]]..serial..[[ 
#ccccccPowód bana:#5a3795 ]]..powod..[[ 
#ccccccBan do:#5a3795 ]]..czasxd..[[ 
#ccccccOdwołaj się na:#5a3795 discord.gg/qcK3vjN

]]

function banned()
	local a = (math.sqrt(getSoundFFTData(data.misc, 2048, 2)[1])*256) or 150
	dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, ":crime_files/logowanie/new/bg"..image..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(683/zmienna, 35/zmienna, 553/zmienna, 340/zmienna, ":crime_files/logowanie/new/logo.png", 0, 0, 0, tocolor(255, 255, 255, alp2test), false)
	exports["crime_gui"]:guitext(powod, 0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, 255, 255, 255, alp2test, font)
end

addEvent("setwarninglogin", true)
addEventHandler("setwarninglogin", root, function(warningdas)
	warning = warningdas
end)

addEventHandler("onClientClick", root, function(btn,state)
	if btn=="left" and state=="down" then
		if data.showed then 
			showChat(false)
		end
        if isMouseIn(683/zmienna, 585/zmienna, 200/zmienna, 200/zmienna) and data.showed and zakladka == 1 then-- wlaczanie rejestracji
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				zakladka = 2
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
			end, 500, 1)
		return end
		if isMouseIn(1032/zmienna, 585/zmienna, 200/zmienna, 200/zmienna) and data.showed and zakladka == 1 then-- wlaczanie odzyskiwania
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				zakladka = 3
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
			end, 500, 1)
		return end 
		if isMouseIn(752/zmienna, 818/zmienna, 193/zmienna, 58/zmienna) and data.showed and zakladka == 2 then-- wylaczanie rejestracji
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				exports["crime_gui"]:destroyEditbox("login")
				exports["crime_gui"]:destroyEditbox("haslo1")
				exports["crime_gui"]:destroyEditbox("haslo2")
				exports["crime_gui"]:destroyEditbox("email")
				zakladka = 1
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
			end, 500, 1)
		return end
		if isMouseIn(982/zmienna, 818/zmienna, 193/zmienna, 58/zmienna) and data.showed and zakladka == 2 then -- rejestrowanie sie
			local login=exports["crime_gui"]:getEditboxText("login")
			local pass1=exports["crime_gui"]:getEditboxText("haslo1")
			local pass2=exports["crime_gui"]:getEditboxText("haslo2")
			local email=exports["crime_gui"]:getEditboxText("email")
        	if string.len(login) < 2 or string.len(pass1) < 2 or string.len(pass2) < 2 or string.len(email) < 2 then
        		warning = "Nie wypełniłeś wszystkich pól!"
			return end
			if pass1 ~= pass2 then warning = "Hasła się nie zgadzają ze sobą!" return end
			triggerServerEvent("logging:newAccount", resourceRoot, login, pass1, email)
		return end
		if isMouseIn(752/zmienna, 818/zmienna, 193/zmienna, 58/zmienna) and data.showed and zakladka == 3 then-- wylaczanie odzyskiwania hasla
			tickistart = getTickCount()
			czas = 500
			progressdwa = "wylacza"
			setTimer(function()
				exports["crime_gui"]:destroyEditbox("loginodz")
				exports["crime_gui"]:destroyEditbox("haslo1odz")
				exports["crime_gui"]:destroyEditbox("haslo2odz")
				exports["crime_gui"]:destroyEditbox("emailodz")
				zakladka = 1
				tickistart = getTickCount()
				czas = 500
				progressdwa = "wlacza"
			end, 500, 1)
		return end
		if isMouseIn(982/zmienna, 818/zmienna, 193/zmienna, 58/zmienna) and data.showed and zakladka == 3 then -- odzyskiwanie konta
			local login=exports["crime_gui"]:getEditboxText("loginodz")
			local pass1=exports["crime_gui"]:getEditboxText("haslo1odz")
			local pass2=exports["crime_gui"]:getEditboxText("haslo2odz")
			local email=exports["crime_gui"]:getEditboxText("emailodz")
        	if string.len(login) < 2 or string.len(pass1) < 1 or string.len(pass2) < 2 or string.len(email) < 2 then
        		warning = "Nie wypełniłeś wszystkich pól!"
			return end
			triggerServerEvent("logging:getMyAccount", resourceRoot, login, pass1, pass2, email)
		return end
    end
end)



addEvent("logging:result", true)
addEventHandler("logging:result", resourceRoot, function(value,info)
	if not info then info="" end
	if value then
		if getElementData(localPlayer,"zbanowany") == true then return end
		data.showed=false
		showZones(data.misc)
		
		-- Usuwamy elementy
		exports["crime_gui"]:destroyEditbox("login")
		exports["crime_gui"]:destroyEditbox("haslo1")
		exports["crime_gui"]:destroyEditbox("haslo2")
		exports["crime_gui"]:destroyEditbox("email")
		removeEventHandler("onClientRender", root, renderLoginBox)
	else
		data.info=tostring(info)
		setTimer(function() data.info=nil end, 3000, 1)
	end
end)


addEvent("logging:testxd123", true)
addEventHandler("logging:testxd123", resourceRoot, function()
		triggerServerEvent("logging:checkAccount", resourceRoot)
end)



addEventHandler("onClientResourceStart", resourceRoot, function()
	showChat(false)
	triggerServerEvent("logging:checkAccount", resourceRoot)
	triggerEvent("pob:stopsound",localPlayer)

	tickistart = getTickCount()
    czas = 1300
	showChat(false)
	tickistart = getTickCount()
	czas = 500
	progressdwa = "wlacza"
	showCursor(true)
	fadeCamera(true)
	data.showed=true
	setElementAlpha(localPlayer,0)
	guiSetInputMode ( "no_binds" )
	setElementData(localPlayer,"status","Loguje się")

	if getElementData(localPlayer,"zbanowany") == true then
		addEventHandler("onClientRender", root, banned)
	else
		addEventHandler("onClientRender", root, renderLoginBox)
	end

	data.misc=playSound(":crime_files/other/intro.mp3",true)
	setSoundVolume(data.misc, 1.0)
	showChat(false)
end)
