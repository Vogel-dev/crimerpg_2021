--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

-- variables
local voicePlayers = {}

-- draw (voice reosource)
local g_screenX,g_screenY = guiGetScreenSize()
local BONE_ID = 8
local WORLD_OFFSET = 0.4
local ICON_PATH = "images/voice.png"
local ICON_WIDTH = 0.15*g_screenX
--
local iconHalfWidth = ICON_WIDTH/2

local ICON_DIMENSIONS = 12
local ICON_LINE = 20
local ICON_TEXT_SHADOW = tocolor ( 0, 0, 0, 255 )
range = 15

local sxd, syd = guiGetScreenSize()
zmienna = 1920/sxd
local caleinfo = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 12/zmienna)

--Draw the voice image
addEventHandler ( "onClientRender", root,
	function()
		local index = 0
		local sX, sY, sZ = getElementPosition(localPlayer) 
		local liczmnie = 0
		for player in pairs(voicePlayers) do
			liczmnie = liczmnie+1

			local rX, rY, rZ = getElementPosition(player)
			local distance = getDistanceBetweenPoints3D(sX, sY, sZ, rX, rY, rZ) 

			setSoundVolume(player, 30-distance)

			local color = tocolor(255, 255, 255, 255)
			if distance <= range then
				local space = 30*(liczmnie-1)
				local name = removeHex(getPlayerName (player))
				exports["crime_gui"]:guitext(name, 295/zmienna, (995-space)/zmienna, 609/zmienna, (1027-space)/zmienna, 200, 200, 200, 255, caleinfo, "left", "center")
				dxDrawImage(265/zmienna, (997-space)/zmienna, 24/zmienna, 24/zmienna, ":crime_files/nametags/ikony/mowi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			end
			index = index + 1
			while true do
				--is he streamed in?
				if not isElementStreamedIn(player) then
					break
				end
				--is he on screen?
				if not isElementOnScreen(player) then 
					break
				end
				local headX,headY,headZ = getPedBonePosition(player,BONE_ID)
				headZ = headZ + WORLD_OFFSET
				--is the head position on screen?
				local absX,absY = getScreenFromWorldPosition ( headX,headY,headZ )
				if not absX or not absY then
					break
				end
				local camX,camY,camZ = getCameraMatrix()
				--is there anything obstructing the icon?
				if not isLineOfSightClear ( camX, camY, camZ, headX, headY, headZ, true, false, false, true, false, true, false, player ) then
					break
				end
				dxDrawVoice ( absX, absY, color, getDistanceBetweenPoints3D(camX, camY, camZ, headX, headY, headZ) )
				break
			end
		end
	end
)

function dxDrawVoice ( posX, posY, color, distance )
	if distance <= range then
	distance = 1/distance
end
end


-- events
addEventHandler("onClientPlayerVoiceStart",getRootElement(),function()
	if not getElementData (source, "player:logged" ) then
		cancelEvent()
		return
	end
	if getElementData (source, "mute:player" ) then
		--cancelEvent()
		return
	end
	if getElementData (source, "voice:off" ) then
		cancelEvent()
		return
	end
	if getElementData (source, "voiceon" ) == true then
		cancelEvent()
		return
	end
	local localDimension = getElementDimension( localPlayer )
	local localInterior = getElementInterior( localPlayer )
	if source == localPlayer then
		setElementData(source, "gadateraz", true)

		-- draw
		voicePlayers[source] = true

		-- data to server
		local posX, posY, posZ = getElementPosition(source)
        local nearbyPlayers = getElementsWithinRange(posX, posY, posZ, 30, "player")
        -- senc data
        --triggerServerEvent( "voicechat:setDestination", resourceRoot, nearbyPlayers )
	else
		local sourceDimension = getElementDimension( source )
		local sourceInterior = getElementInterior( source )
		if tonumber(localDimension) ~= tonumber(sourceDimension) or tonumber(localInterior) ~= tonumber(sourceInterior) then
			cancelEvent()
			return
		end

		local sX, sY, sZ = getElementPosition(localPlayer) 
		local rX, rY, rZ = getElementPosition(source)
		local distance = getDistanceBetweenPoints3D(sX, sY, sZ, rX, rY, rZ) 
		if distance <= range then
			voicePlayers[source] = true
		else 
			cancelEvent()
		end 
	end
end)

addEventHandler("onClientPlayerVoiceStop",getRootElement(),function()
	if source == localPlayer then
		setElementData(source, "gadateraz", false)
	end
	voicePlayers[source] = nil
end)

addEventHandler("onClientPlayerQuit",getRootElement(),function()
	voicePlayers[source] = nil
end)

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end