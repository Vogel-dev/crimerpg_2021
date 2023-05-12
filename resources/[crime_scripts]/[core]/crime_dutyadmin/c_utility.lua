--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
zmiennadwa = 1366/sx
local fontxd = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 9/zmienna)
local fontxddwa = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 9/zmiennadwa)
local font2xd = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 17/zmienna)
nadajes = "nikt"
function hidePlayerWarning()
    playerWarning=false
end
blue = false

addEventHandler("onClientRender", root, function()
    if (playerWarning) then
		dxDrawRectangle(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, tocolor(22, 22, 22, 200), false)
        exports["crime_gui"]:guitext("Otrzymałeś ostrzeżenie od: #FFFFFF"..nadajes.."#CCCCCC\n"..playerWarning, 0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, 200, 200, 200,255, font2xd)

		if blue == true then
			dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, ":crime_files/dutyadmin/blue.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		else
			dxDrawImage(0/zmienna, 0/zmienna, 1920/zmienna, 1080/zmienna, ":crime_files/dutyadmin/red.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
	end
end)

addEvent("onPlayerWarningReceived", true)
addEventHandler("onPlayerWarningReceived", root, function(tresc, nadaje)
    if source==localPlayer then
		showChat(false)
		setElementData(localPlayer,"hudoff",true)
		setElementData(localPlayer,"radaroff",true)
		
		setElementData(localPlayer,"warnama",true)
		
		setTimer(function()
			showChat(true)
			setElementData(localPlayer,"hudoff",false)
			setElementData(localPlayer,"radaroff",false)
			setElementData(localPlayer,"warnama",false)
		end, 7000, 1)
		
        playerWarning=tresc
		nadajes=nadaje
        setTimer(hidePlayerWarning, 7000, 1)
		setTimer(function()
			blue = not(blue)
		end, 90, 100)
    end
end)

for k,v in ipairs ( getElementsByType ( "object" ) ) do
	if getElementData ( v, "sciana:raportow" ) then
		scianaplaczu = v
	end
	if getElementData(v,"sciana:text") then
		scianatekstu = v
	end
end


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


local xtext=nil
local gameView={""}
local sx,sy=guiGetScreenSize()

function renderingInfo()

end

function raporcik()
	if not getElementData(localPlayer,"player:admin") then return end
	if not getElementData(localPlayer,"admin:rapsy") then
	if getElementData(localPlayer,"hudoff") == true then return end
	local tt={}
	reportView=getElementData(scianaplaczu,"sciana:raportow")
	for i,c in ipairs(reportView) do
		if c[1] then table.insert(tt,c[1]) end
	end
	concat=table.concat(tt, "\n")
	dxDrawText(concat:gsub("#%x%x%x%x%x%x",""), sx*(1039+1)/1366, sy*(156+1)/768, sx*(1356+1)/1366, sy*(442+1)/768, tocolor(0, 0, 0, 255), 1.00, fontxddwa, "right", "top", false, true,false,true)
	dxDrawText(concat, sx*(1039)/1366, sy*(156)/768, sx*(1356)/1366, sy*(442)/768, tocolor(200, 200, 200, 255), 1.00, fontxddwa, "right", "top", false, true,false,true)
end
end
addEventHandler("onClientRender", root, raporcik)

addEvent("admin:addText", true)
addEventHandler("admin:addText", root, function(text)
	table.insert(gameView, text)	
	if #gameView > 35 then
		table.remove(gameView, 2)
	end
end)
function raporcik2()
	if not getElementData(localPlayer,"player:admin") then return end
	if not getElementData(localPlayer,"admin:logi") then
	if getElementData(localPlayer,"hudoff") == true then return end
	local tt={}
	reportView=getElementData(scianatekstu,"sciana:text")
	for i,c in ipairs(reportView) do
		if c[1] then table.insert(tt,c[1]) end
	end
	concat=table.concat(tt, "\n")
	--dxDrawText(concat, sx*(964+1)/1366, sy*(472+1)/768, sx*(1356+1)/1366, sy*(762+1)/768, tocolor(0, 0, 0, 255), 1.00, fontxd, "right", "top", false, true)
	--dxDrawText(concat, sx*(964)/1366, sy*(472)/768, sx*(1356)/1366, sy*(762)/768, white, 1.00, fontxd, "right", "top", false, true)
end
end
addEventHandler("onClientRender", root, raporcik2)

addEvent("admin:rendering", true)
addEventHandler("admin:rendering", root, function(text)
	xtext=text
	exports.crime_gui:addNoti(xtext:gsub("#%x%x%x%x%x%x",""), "penalty")
end)
