Radar = {}
Radar.visible = false
local DRAW_POST_GUI = false
local screenWidth, screenHeight = guiGetScreenSize()

function screenScale(val)
	if screenWidth < 1280 then
		return val * screenWidth / 1280
	end
	return val
end

local width, height = screenScale(250), screenScale(250)
local screenOffset = screenScale(20)
local radarWidth = screenScale(527)
local radarHeight = screenScale(234)
local WORLD_SIZE = 3072
local CHUNK_SIZE = 256
local CHUNKS_COUNT = 12
local SCALE_FACTOR = 1.5
local arrowSize = 1
local playerTextureSize = 1
local blipTextureSize = 45

local maskShader
local renderTarget
local maskTexture

local arrowTexture
local playerTexture

local DEFAULT_SCALE = 3
local MAX_SPEED_SCALE = 1.3

local scale = DEFAULT_SCALE
local fallbackTo2d = true
local camera
local chunkRenderSize -- Każda ramka jest aktualizowana.
local chunksTextures = {}

local players = {}
local blips = {}
local allowedIcons = {
	[0] = true,
	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
	[5] = true,
	[6] = true,
	[7] = true,
	[8] = true,
	[9] = true,
	[10] = true,
	[11] = true,
	[12] = true,
	[13] = true,
	[14] = true,
	[15] = true,
	[16] = true,
	[17] = true,
	[18] = true,
	[19] = true,
	[20] = true,
	[21] = true,
	[22] = true,
	[23] = true,
	[24] = true,
	[25] = true,
	[26] = true,
	[27] = true,
	[28] = true,
	[29] = true,
	[30] = true,
	[31] = true,
	[32] = true,
	[33] = true,
	[34] = true,
	[35] = true,
	[36] = true,
	[37] = true,
	[38] = true,
	[39] = true,
	[40] = true,
	[41] = true,
	[42] = true,
	[43] = true,
	[44] = true,
	[45] = true,
	[46] = true,
	[47] = true,
	[48] = true,
	[49] = true,
	[50] = true,
	[51] = true,
	[52] = true,
	[53] = true,
	[54] = true,
	[55] = true,
	[56] = true,
	[57] = true,
	[58] = true,
	[59] = true,
	[60] = true,
	[61] = true,
	[62] = true,
	[63] = true,
	[64] = true,
}
local blipTextures = {}


local function drawRadarChunk(x, y, chunkX, chunkY)
	local chunkID = chunkX + chunkY * CHUNKS_COUNT
	if chunkID < 0 or chunkID > 143 or chunkX >= CHUNKS_COUNT or chunkY >= CHUNKS_COUNT or chunkX < 0 or chunkY < 0 then
		return
	end

	local posX, posY = ((x - (chunkX) * CHUNK_SIZE) / CHUNK_SIZE) * chunkRenderSize,
				       ((y - (chunkY) * CHUNK_SIZE) / CHUNK_SIZE) * chunkRenderSize
	dxDrawImage(width / 2 - posX, width / 2 - posY, chunkRenderSize, chunkRenderSize, chunksTextures[chunkID])
end

local function drawRadarSection(x, y)
	local chunkX = math.floor(x / CHUNK_SIZE)
	local chunkY = math.floor(y / CHUNK_SIZE)

	drawRadarChunk(x, y, chunkX - 1, chunkY)
	drawRadarChunk(x, y, chunkX, chunkY)
	drawRadarChunk(x, y, chunkX + 1, chunkY)

	drawRadarChunk(x, y, chunkX - 1, chunkY - 1)
	drawRadarChunk(x, y, chunkX, chunkY - 1)
	drawRadarChunk(x, y, chunkX + 1, chunkY - 1)

	drawRadarChunk(x, y, chunkX - 1, chunkY + 1)
	drawRadarChunk(x, y, chunkX, chunkY + 1)
	drawRadarChunk(x, y, chunkX + 1, chunkY + 1)
end

local function drawBlips()
	local px, py, pz = getElementPosition(localPlayer)
	for i,blip in ipairs(getElementsByType("blip")) do
		local x, y, z = getElementPosition(blip)
		if allowedIcons[blip.icon] and getDistanceBetweenPoints2D(x, y, px, py) < 100 then
			Radar.drawImageOnMap(
				x, y, camera.rotation.z,
				blipTextures[blip.icon],
				blipTextureSize,
				blipTextureSize
			)
		end
	end
end

local function drawPlayers()
	for player in pairs(players) do
		if player ~= localPlayer and player.streamedIn then

			local color = tocolor(255, 255, 255, 255)
			Radar.drawImageOnMap(player.position.x, player.position.y, player.rotation.z,
				playerTexture, playerTextureSize, playerTextureSize, color)
		end
	end
end

local function drawRadar()
	if not getElementData(localPlayer, "player:hide_minimap") and not getElementData(localPlayer, "player:always_hide_minimap") and getElementInterior(localPlayer) ~= 1 then
	local x = (localPlayer.position.x + 3000) / 6000 * WORLD_SIZE
	local y = (-localPlayer.position.y + 3000) / 6000 * WORLD_SIZE

	local sectionX = x
	local sectionY = y
	drawRadarSection(sectionX, sectionY)
	drawPlayers()
	local color = tocolor(255, 255, 255)

	-- Przykład użycia:
	-- Radar.drawImageOnMap(700, 900, 0, arrowTexture,
		-- arrowSize, arrowSize,
		-- tocolor(16, 160, 207))

	dxDrawImage(
		(width - arrowSize) / 2,
		(height - arrowSize) / 2,
		arrowSize,
		arrowSize,
		arrowTexture,
		-localPlayer.rotation.z,
		0,
		0,
		color
	)

	drawBlips()
end
end

addEventHandler("onClientRender", root, function ()
	if not Radar.visible then
		return
	end

	scale = DEFAULT_SCALE
	-- Zdalny radar podczas szybkiej jazdy
	if localPlayer.vehicle then
		local speed = localPlayer.vehicle.velocity.length
		scale = scale - math.min(MAX_SPEED_SCALE, speed * 1)
	end
	chunkRenderSize = CHUNK_SIZE * scale / SCALE_FACTOR

	if not fallbackTo2d then
		-- dxDrawImage(
		-- 	screenOffset,
		-- 	screenHeight - height - screenOffset,
		-- 	0,0,0,
		-- 	tocolor(255, 255, 255, 255),
		-- 	DRAW_POST_GUI
		-- )
		-- Renderowanie radaru w renderTarget
		dxSetRenderTarget(renderTarget, true)
		drawRadar()
		dxSetRenderTarget()

		-- Śledzenie gracza
		maskShader:setValue("gUVRotAngle", -math.rad(camera.rotation.z))
		maskShader:setValue("gUVPosition", 0, 0)
		maskShader:setValue("gUVScale", 1, 1)
		maskShader:setValue("sPicTexture", renderTarget)
		maskShader:setValue("sMaskTexture", maskTexture)

		dxDrawImage(
			screenOffset,
			screenHeight - height - screenOffset,
			width,
			height,
			maskShader,
			0, 0, 0,
			tocolor(255, 255, 255, 255),
			DRAW_POST_GUI
		)
	end
end)

addEventHandler("onClientElementStreamIn", root, function()
	if source.type == "player" then
		players[source] = true
	elseif source.type == "blip" then
		blips[source] = true
	end
end)

addEventHandler("onClientElementStreamOut", root, function()
	if source.type == "player" then
		players[source] = nil
	elseif source.type == "blip" then
		blips[source] = nil
	end
end)

addEventHandler("onClientPlayerJoin", root, function()
	players[source] = true
end)

addEventHandler("onClientPlayerQuit", root, function()
	players[source] = nil
end)

function createShader(name, ...)
	local element = dxCreateShader(name)
end

function Radar.start()
	if renderTarget then
		return false
	end
	renderTarget = dxCreateRenderTarget(width, height, true)
	maskShader = dxCreateShader("assets/mask3d.fx")
	fallbackTo2d = false
	if not (renderTarget and maskShader) then
		fallbackTo2d = true
		outputDebugString("Radar: Failed to create renderTarget or shader")
		return
	end
	maskTexture = dxCreateTexture("assets/textures/radar/mask.png")
	maskShader:setValue("gUVRotCenter", 0.5, 0.5)
	maskShader:setValue("sMaskTexture", maskTexture)
	for i = 0, 143 do
		chunksTextures[i] = dxCreateTexture("assets/textures/radar/map/radar" .. i .. ".png", "dxt5", true, "clamp")
	end
	camera = getCamera()
	arrowTexture = DxTexture("assets/textures/radar/arrow.png")
	playerTexture = DxTexture("assets/textures/radar/arrow.png")

	for k,v in pairs(allowedIcons) do
		blipTextures[k] = dxCreateTexture("assets/textures/radar/icons/" .. k .. ".png")
	end

	players = {}
	for i,v in ipairs(getElementsByType("player")) do
		if isElementStreamedIn(v) then
			players[v] = true
		end
	end
end

function Radar.setRotation(x, y, z)
	if not x or not y then
		return false
	end
	if not z then
		z = 0
	end
	if not maskShader then
		return false
	end
	dxSetShaderTransform(maskShader, x, y, z)
end

function Radar.setVisible(visible)
	Radar.visible = not not visible
end

function Radar.drawImageOnMap(globalX, globalY, rotationZ, image, imgWidth, imgHeight, color)
	if not image then
		return
	end
	if not color then
		color = tocolor(255, 255, 255)
	end
	local relativeX, relativeY = localPlayer.position.x - globalX,
								 localPlayer.position.y - globalY
	local mapX, mapY = 	relativeX / 6000 * WORLD_SIZE * scale / SCALE_FACTOR,
						relativeY / 6000 * WORLD_SIZE * scale / SCALE_FACTOR

	local distance = mapX * mapX + mapY * mapY
	-- Obraz jest zbyt daleko od gracza, nie ma sensu rysować
	if distance > chunkRenderSize * chunkRenderSize * 9 then
		return
	end
	dxDrawImage((width -  imgWidth) / 2 - mapX,
				(height - imgHeight) / 2 + mapY, imgWidth, imgHeight, image,
				 -rotationZ, 0, 0, color)
end

addEventHandler("onClientResourceStart", resourceRoot, function ()
	setPlayerHudComponentVisible("all", false)
        toggleControl("radar", false)

	Radar.start()
	showAll()
end)