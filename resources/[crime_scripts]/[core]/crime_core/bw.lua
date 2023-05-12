--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx,sy=guiGetScreenSize()
local screenW, screenH = guiGetScreenSize()
local screenX, screenY = guiGetScreenSize()
local screenSource = dxCreateScreenSource(screenX, screenY)

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx

local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 25/zmienna)
local start = getTickCount()

function gui()
	if (blackWhiteShader) then
		dxUpdateScreenSource(screenSource)     
		dxSetShaderValue(blackWhiteShader, "screenSource", screenSource)
		dxDrawImage(0, 0, screenX, screenY, blackWhiteShader)
	end

	local now = getTickCount()
    local endTime = start + 1300
    local elapsedTime = now - start
    local duration = endTime - start
    local progress = elapsedTime / duration
    local posX, posY, posZ = interpolateBetween ( 0,0,0,360,0,0, progress, "Linear")
    if posX == 360 then 
        start = getTickCount()
    end
    dxDrawImage(910/zmienna, 619/zmienna, 100/zmienna, 100/zmienna, ":crime_files/core/wheel.png", posX, 0, 0, tocolor(255, 255, 255, 255), false)
    exports["crime_gui"]:guitext("Straciłeś przytomność, musisz jeszcze odczekać "..string.format("%.00f",czas).." sekund.", 455/zmienna, 510/zmienna, 1465/zmienna, 619/zmienna, 200, 200, 200, 255, font)


end


function BW(killer)
	blackWhiteShader, blackWhiteTec = dxCreateShader(":crime_files/shaders/blackwhite.fx")
    if getElementHealth(localPlayer) <= 10 then
    if getElementHealth(localPlayer,"mabw") == true then return end
	triggerServerEvent("save:player", localPlayer,localPlayer)
	local x,y,z = getElementPosition(localPlayer)
	setElementData(localPlayer,"testpos",{x,y,z})
	setElementData(localPlayer,"player:spawn",{x,y,z})
	local posx=getElementData(localPlayer,"testpos")
	setElementFrozen(localPlayer,true)
	setElementData(localPlayer,"mabw",true)
	setElementData(localPlayer,"mahud",false)
	--setPlayerHudComponentVisible( "radar", false)
	showChat(false)
	setElementHealth(localPlayer,0)
	triggerServerEvent("umarlessobie", localPlayer,killer)
	czas = 120
	addEventHandler("onClientRender",root,gui)
	setTimer ( function()
	czas = czas-1
	if czas <= 0 then
	removeEventHandler("onClientRender",root,gui)
	
	setElementFrozen(localPlayer,false)
	setElementHealth(localPlayer,100)
	triggerServerEvent("save:player", localPlayer,localPlayer)
	local x,y,z = getElementPosition(localPlayer)
	setElementData(localPlayer,"player:spawn",{x,y,z})
	triggerServerEvent("core:spawnPlayerbwa", localPlayer)
	fadeCamera(true)
	toggleControl ( "enter_exit", true) 
		toggleControl ( "enter_passenger", true )
	
	setElementInterior(localPlayer,0)
	setElementDimension(localPlayer,0)
	--setElementModel(localPlayer, getElementData(localPlayer, "player:skin"))
	setElementData(localPlayer,"mabw",false)
	setElementData(localPlayer,"mahud",true)
	--setPlayerHudComponentVisible( "radar", true )
	showChat(true)
	exports.crime_gui:addNoti("Odzyskałeś przytomność.", "info")
	end
	
    end, 1000.0121, 120 )
	end
end
addEventHandler("onClientPlayerDamage", getLocalPlayer(), BW)


function BWd(killer)
	if getElementData(localPlayer,"mabw") == true then return end
	blackWhiteShader, blackWhiteTec = dxCreateShader(":crime_files/shaders/blackwhite.fx")
	local x,y,z = getElementPosition(localPlayer)
		triggerServerEvent("save:player", localPlayer,localPlayer)
	setElementData(localPlayer,"testpos",{x,y,z})
	setElementData(localPlayer,"player:spawn",{x,y,z})
	local posx=getElementData(localPlayer,"testpos")
	setElementFrozen(localPlayer,true)
	setElementData(localPlayer,"mabw",true)
	setElementData(localPlayer,"mahud",false)
	--setPlayerHudComponentVisible( "radar", false )
	showChat(false)
	setElementHealth(localPlayer,0)
	triggerServerEvent("umarlessobie", localPlayer, killer)
	czas = 120
	addEventHandler("onClientRender",root,gui)
	setTimer ( function()
	czas = czas-1
	if czas <= 0 then
	removeEventHandler("onClientRender",root,gui)
	
	setElementFrozen(localPlayer,false)
	setElementHealth(localPlayer,100)
	triggerServerEvent("save:player", localPlayer,localPlayer)
	local x,y,z = getElementPosition(localPlayer)
	setElementData(localPlayer,"player:spawn",{x,y,z})
	triggerServerEvent("core:spawnPlayerbwa", localPlayer)
	fadeCamera(true)
	toggleControl ( "enter_exit", true ) 
	toggleControl ( "enter_passenger", true ) 
	setElementInterior(localPlayer,0)
	setElementDimension(localPlayer,0)
	--setElementModel(localPlayer, getElementData(localPlayer, "player:skin"))
	setElementData(localPlayer,"mabw",false)
	setElementData(localPlayer,"mahud",true)
	--setPlayerHudComponentVisible( "radar", true )
	showChat(true)
	exports.crime_gui:addNoti("Odzyskałeś przytomność.", "info")
	end
	
    end, 1000.0121, 120 )
end

addEventHandler("onClientPlayerWasted", getLocalPlayer(), BWd) 


addEvent("player:unbw",true)
addEventHandler("player:unbw", root, function()
	removeEventHandler("onClientRender",root,gui)
	setElementFrozen(localPlayer,false)
	setElementHealth(localPlayer,100)
	triggerServerEvent("save:player", localPlayer,localPlayer)
	local x,y,z = getElementPosition(localPlayer)
	setElementData(localPlayer,"player:spawn",{x,y,z})
	triggerServerEvent("core:spawnPlayerbwa", localPlayer)
	fadeCamera(true)
	toggleControl ( "enter_exit", true ) 
	toggleControl ( "enter_passenger", true ) 
	setElementInterior(localPlayer,0)
	setElementDimension(localPlayer,0)
	--setElementModel(localPlayer, getElementData(localPlayer, "player:skin"))
	setElementData(localPlayer,"mabw",false)
	setElementData(localPlayer,"mahud",true)
	showChat(true)
	exports.crime_gui:addNoti("Odzyskałeś przytomność.", "info")
	timers = getTimers ( 1000.0121 )
	for timerKey, timerValue in ipairs(timers) do
		killTimer ( timerValue )
	end
end)

function odrodzenie()
	if not getElementData(localPlayer,"player:admin") then return end
	removeEventHandler("onClientRender",root,gui)
	setElementFrozen(localPlayer,false)
	setElementHealth(localPlayer,100)
	triggerServerEvent("save:player", localPlayer,localPlayer)
	local x,y,z = getElementPosition(localPlayer)
	setElementData(localPlayer,"player:spawn",{x,y,z})
	triggerServerEvent("core:spawnPlayerbwa", localPlayer)
	fadeCamera(true)
	toggleControl ( "enter_exit", true ) 
	toggleControl ( "enter_passenger", true ) 
	setElementInterior(localPlayer,0)
	setElementDimension(localPlayer,0)
	--setElementModel(localPlayer, getElementData(localPlayer, "player:skin"))
	setElementData(localPlayer,"mabw",false)
	setElementData(localPlayer,"mahud",true)
	showChat(true)
	exports.crime_gui:addNoti("Odzyskałeś przytomność.", "info")
	timers = getTimers ( 1000.0121 )
	for timerKey, timerValue in ipairs(timers) do
		killTimer ( timerValue )
	end

end
addCommandHandler("odrodzsie",odrodzenie)

