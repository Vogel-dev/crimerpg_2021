--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local data={ showed=nil, button={}, info=nil, misc=nil, }

function closeZones()

	local x = getElementData(localPlayer,"x")
	local y = getElementData(localPlayer,"y")
	local z = getElementData(localPlayer,"z")

	if not x then x = "2476.08" end
	if not y then y = "-1569.02" end
	if not z then z = "772.05" end

	if x == "0" then x = "2476.08" end
	if y == "0" then y = "-1569.02" end
	if z == "0" then z = "772.05" end

	if x == "" then x = "2476.08" end
	if y == "" then y = "-1569.02" end
	if z == "" then z = "772.05" end
	 
	setElementData(localPlayer,"player:spawn",{x, y, z}) --OSTATNIA POZYCJA
	 
	showChat(true)
	guiSetInputMode("allow_binds")
	showCursor(false)
	fadeCamera(false)
	setElementAlpha(localPlayer,255)
	stopSound(data.misc)
	setPlayerHudComponentVisible("all",false)
	setPlayerHudComponentVisible("crosshair",true)
	data.showed=false
	-- Usuwamy elementy
	triggerServerEvent("core:spawnPlayer", localPlayer)
	setTimer(triggerEvent, 250, 1, "gui:start", localPlayer)
	setElementData(localPlayer,"player:logged",true)
	setElementData(localPlayer,"avatarpobral",true)
	guiSetInputMode ( "allow_binds" )
end

function showZones(misc)
    czas = 1300
	data.misc=misc
	data.showed=true
	setPlayerHudComponentVisible("all",false)
	setPlayerHudComponentVisible("crosshair",true)
	guiSetInputMode("no_binds_when_editing")
	closeZones()
end
