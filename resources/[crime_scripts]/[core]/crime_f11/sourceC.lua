--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

Display = {};
Display.Width, Display.Height = guiGetScreenSize();

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx

local fontadmin = dxCreateFont(":crime_files/fonts/SegoeLight.ttf", 19/zmienna)

Minimap = {};
Minimap.Width = 280;
Minimap.Height = 175;
Minimap.PosX = 20;
Minimap.PosY = (Display.Height - 20) - Minimap.Height;

Minimap.IsVisible = false;
Minimap.TextureSize = radarSettings['mapTextureSize'];
Minimap.NormalTargetSize, Minimap.BiggerTargetSize = Minimap.Width, Minimap.Width * 2;
Minimap.MapTarget = dxCreateRenderTarget(Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, true);
Minimap.RenderTarget = dxCreateRenderTarget(Minimap.NormalTargetSize * 3, Minimap.NormalTargetSize * 3, true);
Minimap.MapTexture = dxCreateTexture(radarSettings['mapTexture']);
Minimap.MapTexture2 = dxCreateTexture(radarSettings['mapTexture2']);

Minimap.CurrentZoom = 3;
Minimap.MaximumZoom = 8;
Minimap.MinimumZoom = 1;

Minimap.WaterColor = radarSettings['mapWaterColor'];
Minimap.Alpha = radarSettings['alpha'];
Minimap.PlayerInVehicle = false;
Minimap.LostRotation = 0;
Minimap.MapUnit = Minimap.TextureSize / 6000;

Bigmap = {};
Bigmap.Width, Bigmap.Height = Display.Width - 40, Display.Height - 40;
Bigmap.PosX, Bigmap.PosY = 20, 20;
Bigmap.IsVisible = false;
Bigmap.CurrentZoom = 1;
Bigmap.MinimumZoom = 0.2;
Bigmap.MaximumZoom = 3;


Stats = {};
Stats.Bar = {};
Stats.Bar.Width = Minimap.Width;
Stats.Bar.Height = 10;

local playerX, playerY, playerZ = 0,0,0
local mapOffsetX, mapOffsetY, mapIsMoving = 0, 0, false;

addEventHandler('onClientResourceStart', resourceRoot,
	function()
		if (Minimap.MapTexture) then
			dxSetTextureEdge(Minimap.MapTexture, 'border', tocolor(Minimap.WaterColor[1], Minimap.WaterColor[2], Minimap.WaterColor[3], 255));
		end
		if (Minimap.MapTexture2) then
			dxSetTextureEdge(Minimap.MapTexture2, 'border', tocolor(Minimap.WaterColor[1], Minimap.WaterColor[2], Minimap.WaterColor[3], 255));
		end
	end
);




addEventHandler('onClientKey', root,
	function(key, state)
		if (state) then
			if (key == 'F11') then
				cancelEvent();
				Bigmap.IsVisible = not Bigmap.IsVisible;
				--showCursor(false);
				setElementData(localPlayer,"f11wlaczone",false)

				
				if (Bigmap.IsVisible) then
					showChat(false);
					playSoundFrontEnd(1);
					Minimap.IsVisible = false;
					--showCursor(true);
					setElementData(localPlayer,"f11wlaczone",true)
					playerX, playerY, playerZ = getElementPosition(localPlayer)
				else
					showChat(true);
					playSoundFrontEnd(2);
					Minimap.IsVisible = true;
					mapOffsetX, mapOffsetY, mapIsMoving = 0, 0, false;
				end
			elseif (key == 'mouse_wheel_down' and Bigmap.IsVisible) then
				Bigmap.CurrentZoom = math.min(Bigmap.CurrentZoom + 0.2, Bigmap.MaximumZoom);
			elseif (key == 'mouse_wheel_up' and Bigmap.IsVisible) then
				Bigmap.CurrentZoom = math.max(Bigmap.CurrentZoom - 0.2, Bigmap.MinimumZoom);
			end
		end
	end
);

addEventHandler('onClientClick', root,
	function(button, state, cursorX, cursorY)
		if (not Minimap.IsVisible and Bigmap.IsVisible) then
			if (button == 'left' and state == 'down') then
				if (cursorX >= Bigmap.PosX and cursorX <= Bigmap.PosX + Bigmap.Width) then
					if (cursorY >= Bigmap.PosY and cursorY <= Bigmap.PosY + Bigmap.Height) then
						mapOffsetX = cursorX * Bigmap.CurrentZoom + playerX;
						mapOffsetY = cursorY * Bigmap.CurrentZoom - playerY;
						mapIsMoving = true;
					end
				end
			elseif (button == 'left' and state == 'up') then
				mapIsMoving = false;
			end
		end
	end
);

addEventHandler('onClientRender', root,
	function()
		if not getElementData(localPlayer,"player:logged") then return end
		if (not Minimap.IsVisible and Bigmap.IsVisible) then
			dxDrawBorder(Bigmap.PosX, Bigmap.PosY, Bigmap.Width, Bigmap.Height, 2, tocolor(0, 0, 0, 200));

			
			local absoluteX, absoluteY = 0, 0;
			local zoneName = 'Unknown';
			
			if (getElementInterior(localPlayer) == 0) then
				if (isCursorShowing()) then
					local cursorX, cursorY = getCursorPosition();
					local mapX, mapY = getWorldFromMapPosition(cursorX, cursorY);
					
					absoluteX = cursorX * Display.Width;
					absoluteY = cursorY * Display.Height;
					
					if (getKeyState('mouse1') and mapIsMoving) then
						playerX = -(absoluteX * Bigmap.CurrentZoom - mapOffsetX);
						playerY = absoluteY * Bigmap.CurrentZoom - mapOffsetY;
						
						playerX = math.max(-3000, math.min(3000, playerX));
						playerY = math.max(-3000, math.min(3000, playerY));
					end
				end
				
				local playerRotation = getPedRotation(localPlayer);
				local mapX = (((3000 + playerX) * Minimap.MapUnit) - (Bigmap.Width / 2) * Bigmap.CurrentZoom);
				local mapY = (((3000 - playerY) * Minimap.MapUnit) - (Bigmap.Height / 2) * Bigmap.CurrentZoom);
				local mapWidth, mapHeight = Bigmap.Width * Bigmap.CurrentZoom, Bigmap.Height * Bigmap.CurrentZoom;
				if getElementData(localPlayer,"player:changemap") == false then 
					dxDrawImageSection(Bigmap.PosX, Bigmap.PosY, Bigmap.Width, Bigmap.Height, mapX, mapY, mapWidth, mapHeight, Minimap.MapTexture, 0, 0, 0, tocolor(255, 255, 255, Minimap.Alpha));
				else 
					dxDrawImageSection(Bigmap.PosX, Bigmap.PosY, Bigmap.Width, Bigmap.Height, mapX, mapY, mapWidth, mapHeight, Minimap.MapTexture2, 0, 0, 0, tocolor(255, 255, 255, Minimap.Alpha));
				end

				if getElementData(localPlayer,"player:admin") then 
					-- exports["crime_gui"]:guitext("Klawiszologia admina:\nT - Teleportacja (tam gdzie jest kursor)", 1453/zmienna, 28/zmienna, 1888/zmienna, 201/zmienna, 255, 255, 255, 255, fontadmin, "center", "top")
				end
				--> Radar area
				for _, area in ipairs(getElementsByType('radararea')) do
					local areaX, areaY = getElementPosition(area);
					local areaWidth, areaHeight = getRadarAreaSize(area);
					local areaR, areaG, areaB, areaA = getRadarAreaColor(area);
						
					if (isRadarAreaFlashing(area)) then
						areaA = areaA * math.abs(getTickCount() % 1000 - 500) / 500;
					end
					
					local areaX, areaY = getMapFromWorldPosition(areaX, areaY + areaHeight);
					local areaWidth, areaHeight = areaWidth / Bigmap.CurrentZoom * Minimap.MapUnit, areaHeight / Bigmap.CurrentZoom * Minimap.MapUnit;

					--** Width
					if (areaX < Bigmap.PosX) then
						areaWidth = areaWidth - math.abs((Bigmap.PosX) - (areaX));
						areaX = areaX + math.abs((Bigmap.PosX) - (areaX));
					end
					
					if (areaX + areaWidth > Bigmap.PosX + Bigmap.Width) then
						areaWidth = areaWidth - math.abs((Bigmap.PosX + Bigmap.Width) - (areaX + areaWidth));
					end
					
					if (areaX > Bigmap.PosX + Bigmap.Width) then
						areaWidth = areaWidth + math.abs((Bigmap.PosX + Bigmap.Width) - (areaX));
						areaX = areaX - math.abs((Bigmap.PosX + Bigmap.Width) - (areaX));
					end
					
					if (areaX + areaWidth < Bigmap.PosX) then
						areaWidth = areaWidth + math.abs((Bigmap.PosX) - (areaX + areaWidth));
						areaX = areaX - math.abs((Bigmap.PosX) - (areaX + areaWidth));
					end
					
					--** Height
					if (areaY < Bigmap.PosY) then
						areaHeight = areaHeight - math.abs((Bigmap.PosY) - (areaY));
						areaY = areaY + math.abs((Bigmap.PosY) - (areaY));
					end
					
					if (areaY + areaHeight > Bigmap.PosY + Bigmap.Height) then
						areaHeight = areaHeight - math.abs((Bigmap.PosY + Bigmap.Height) - (areaY + areaHeight));
					end
					
					if (areaY + areaHeight < Bigmap.PosY) then
						areaHeight = areaHeight + math.abs((Bigmap.PosY) - (areaY + areaHeight));
						areaY = areaY - math.abs((Bigmap.PosY) - (areaY + areaHeight));
					end
					
					if (areaY > Bigmap.PosY + Bigmap.Height) then
						areaHeight = areaHeight + math.abs((Bigmap.PosY + Bigmap.Height) - (areaY));
						areaY = areaY - math.abs((Bigmap.PosY + Bigmap.Height) - (areaY));
					end
					
					--** Draw
					dxDrawRectangle(areaX, areaY, areaWidth, areaHeight, tocolor(areaR, areaG, areaB, areaA), false);
				end
				
				--> Blips
				for _, blip in ipairs(getElementsByType('blip')) do
					local blipX, blipY, blipZ = getElementPosition(blip);

					if (localPlayer ~= getElementAttachedTo(blip)) then
						local blipSettings = {
							['color'] = {255, 255, 255, 255},
							['size'] = getElementData(blip, 'blipSize') or 30,
							['icon'] = getBlipIcon (blip),
							['exclusive'] = getElementData(blip, 'exclusiveBlip') or false
						};

						
						if blipSettings['icon'] == 0 then opis = "Gracz" blipSettings['size'] = 20 end
						if blipSettings['icon'] == 2 then opis = "Ty" end
						if blipSettings['icon'] == 3 then opis = "Gracz" end
						if blipSettings['icon'] == 4 then opis = "Północ" end
						if blipSettings['icon'] == 5 then opis = "Port" end
						if blipSettings['icon'] == 6 then opis = "Szkoła jazdy" end
						if blipSettings['icon'] == 7 then opis = "SAPD" end
						if blipSettings['icon'] == 8 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 9 then opis = "Złomowisko" end
						if blipSettings['icon'] == 10 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 11 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 12 then opis = "Gracz" blipSettings['size'] = 20 end
						if blipSettings['icon'] == 13 then opis = "Giełda pojazdów" end
						if blipSettings['icon'] == 14 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 15 then opis = "Złomowisko" end
						if blipSettings['icon'] == 16 then opis = "Kasyno" end
						if blipSettings['icon'] == 17 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 18 then opis = "Sklep z odzieżą" end
						if blipSettings['icon'] == 19 then opis = "Parking pojazdów" end
						if blipSettings['icon'] == 20 then opis = "SAFD" end
						if blipSettings['icon'] == 21 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 22 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 23 then opis = "Stacja paliw" end
						if blipSettings['icon'] == 24 then opis = "Urząd miasta" end
						if blipSettings['icon'] == 25 then opis = "Warsztat mechaniczny" end
						if blipSettings['icon'] == 26 then opis = "Lakiernia" end
						if blipSettings['icon'] == 27 then opis = "Warsztat mechaniczny" end
						if blipSettings['icon'] == 28 then opis = "Event" end
						if blipSettings['icon'] == 29 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 30 then opis = "SAPD" end
						if blipSettings['icon'] == 31 then opis = "Dom (wolny)" end
						if blipSettings['icon'] == 32 then opis = "Dom (zajęty)" end
						if blipSettings['icon'] == 33 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 34 then opis = "SAFD" end
						if blipSettings['icon'] == 35 then opis = "Siłownia" end
						if blipSettings['icon'] == 36 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 37 then opis = "Szkoła jazdy" end
						if blipSettings['icon'] == 38 then opis = "Bankomat" end
						if blipSettings['icon'] == 39 then opis = "Urząd miasta" end
						if blipSettings['icon'] == 40 then opis = "Stacja paliw" end
						if blipSettings['icon'] == 41 then opis = "Twój cel" end
						if blipSettings['icon'] == 42 then opis = "Złomowisko" end
						if blipSettings['icon'] == 43 then opis = "Event" end
						if blipSettings['icon'] == 44 then opis = "Urząd miasta" end
						if blipSettings['icon'] == 45 then opis = "Sklep z odzieżą" end
						if blipSettings['icon'] == 46 then opis = "Praca dorywcza" end
						if blipSettings['icon'] == 47 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 48 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 49 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 50 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 51 then opis = "Parking SAPD" end
						if blipSettings['icon'] == 52 then opis = "Praca dorywcza" end
						if blipSettings['icon'] == 53 then opis = "Wyścig" end
						if blipSettings['icon'] == 54 then opis = "Salon motocyklowy" end
						if blipSettings['icon'] == 55 then opis = "Salon samochodowy" end
						if blipSettings['icon'] == 56 then opis = "Sklep z bronią" end
						if blipSettings['icon'] == 57 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 58 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 59 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 60 then opis = "Plantacja" end
						if blipSettings['icon'] == 61 then opis = "Sklep wielobranżowy" end
						if blipSettings['icon'] == 62 then opis = "(nieprzypisane)" end
						if blipSettings['icon'] == 63 then opis = "Lakiernia" end
						if blipSettings['icon'] == 64 then opis = "Plantacja" end

						if not opis then opis = "ERROR" end


						if (blipSettings['icon'] == 0 or blipSettings['icon'] == 'waypoint') then
							blipSettings['color'] = {getBlipColor(blip)};
						end
						
						local centerX, centerY = (Bigmap.PosX + (Bigmap.Width / 2)), (Bigmap.PosY + (Bigmap.Height / 2));
						local leftFrame = (centerX - Bigmap.Width / 2) + (blipSettings['size'] / 2);
						local rightFrame = (centerX + Bigmap.Width / 2) - (blipSettings['size'] / 2);
						local topFrame = (centerY - Bigmap.Height / 2) + (blipSettings['size'] / 2);
						local bottomFrame = (centerY + Bigmap.Height / 2) - (blipSettings['size'] / 2);
						local blipX, blipY = getMapFromWorldPosition(blipX, blipY);
						
						centerX = math.max(leftFrame, math.min(rightFrame, blipX));
						centerY = math.max(topFrame, math.min(bottomFrame, blipY));

						if blipSettings['icon'] == 0 or blipSettings['icon'] == 3 or blipSettings['icon'] == 12 and getElementData(localPlayer,"player:duty") == "SAPD" then 
							local sad = getElementAttachedTo(blip)
							if getElementType(sad) == "player" then 
								if getElementData(sad,"player:duty") == "SAPD" then 
									if getElementData(localPlayer,"player:duty") == "SAPD" then 
										dxDrawImage(centerX - (blipSettings['size'] / 2), centerY - (blipSettings['size'] / 2), blipSettings['size'], blipSettings['size'], 'files/images/blips/' .. blipSettings['icon'] .. '.png', 0, 0, 0, tocolor(0, 200, 255, blipSettings['color'][4]));
									end
									if isMouseIn(centerX - (blipSettings['size'] / 2), centerY - (blipSettings['size'] / 2), blipSettings['size'], blipSettings['size']) then
										exports["crime_gui"]:guibutton(opis, centerX - (blipSettings['size'] / 2)+30, centerY - (blipSettings['size'] / 2)-13, blipSettings['size']+200, blipSettings['size']+25, 255)
									end
								end
							end
						else 
							local sad = getElementAttachedTo(blip)
							if sad and getElementType(sad) == "player" then 
								if getElementData(sad,"player:duty") == "SAPD" then  

								else
									dxDrawImage(centerX - (blipSettings['size'] / 2), centerY - (blipSettings['size'] / 2), blipSettings['size'], blipSettings['size'], 'files/images/blips/' .. blipSettings['icon'] .. '.png', 0, 0, 0, tocolor(blipSettings['color'][1], blipSettings['color'][2], blipSettings['color'][3], blipSettings['color'][4]));
						
									if isMouseIn(centerX - (blipSettings['size'] / 2), centerY - (blipSettings['size'] / 2), blipSettings['size'], blipSettings['size']) then
										exports["crime_gui"]:guibutton(opis, centerX - (blipSettings['size'] / 2)+30, centerY - (blipSettings['size'] / 2)-13, blipSettings['size']+200, blipSettings['size']+25, 255)
									end
								end
							else 
								dxDrawImage(centerX - (blipSettings['size'] / 2), centerY - (blipSettings['size'] / 2), blipSettings['size'], blipSettings['size'], 'files/images/blips/' .. blipSettings['icon'] .. '.png', 0, 0, 0, tocolor(blipSettings['color'][1], blipSettings['color'][2], blipSettings['color'][3], blipSettings['color'][4]));
					
								if isMouseIn(centerX - (blipSettings['size'] / 2), centerY - (blipSettings['size'] / 2), blipSettings['size'], blipSettings['size']) then
									exports["crime_gui"]:guibutton(opis, centerX - (blipSettings['size'] / 2)+30, centerY - (blipSettings['size'] / 2)-13, blipSettings['size']+200, blipSettings['size']+25, 255)
								end
							end
						end
					end
				end
				
				for _, player in ipairs(getElementsByType('player')) do
					local otherPlayerX, otherPlayerY, otherPlayerZ = getElementPosition(player);
					if blip then
						if (localPlayer ~= player) then
							local playerIsVisible = false;
							local blipSettings = {
								['color'] = {255, 255, 255, 255},
								['size'] = 20,
								['icon'] = getBlipIcon (blip)
							};
							
							
							blipSettings['color'] = {getPlayerNametagColor(player)};

							local blipX, blipY = getMapFromWorldPosition(otherPlayerX, otherPlayerY);
							
							if (blipX >= Bigmap.PosX and blipX <= Bigmap.PosX + Bigmap.Width) then
								if (blipY >= Bigmap.PosY and blipY <= Bigmap.PosY + Bigmap.Height) then
									dxDrawImage(blipX - (blipSettings['size'] / 2), blipY - (blipSettings['size'] / 2), blipSettings['size'], blipSettings['size'], 'files/images/blips/' .. blipSettings['icon'] .. '.png', 0, 0, 0, tocolor(blipSettings['color'][1], blipSettings['color'][2], blipSettings['color'][3], blipSettings['color'][4]));
								end
							end
							
						end
					end
				end
				
				--> Local player
				local localX, localY, localZ = getElementPosition(localPlayer);
				local blipX, blipY = getMapFromWorldPosition(localX, localY);
						
				if (blipX >= Bigmap.PosX and blipX <= Bigmap.PosX + Bigmap.Width) then
					if (blipY >= Bigmap.PosY and blipY <= Bigmap.PosY + Bigmap.Height) then
						dxDrawImage(blipX - 10, blipY - 10, 15, 15, 'files/images/arrow.png', 360 - playerRotation);
					end
				end
			end
			
	end
	end)

function doesCollide(x1, y1, w1, h1, x2, y2, w2, h2)
	local horizontal = (x1 < x2) ~= (x1 + w1 < x2) or (x1 > x2) ~= (x1 > x2 + w2);
	local vertical = (y1 < y2) ~= (y1 + h1 < y2) or (y1 > y2) ~= (y1 > y2 + h2);
	
	return (horizontal and vertical);
end

function getRadarRadius()
	if (not Minimap.PlayerInVehicle) then
		return 180;
	else
		local vehicleX, vehicleY, vehicleZ = getElementVelocity(Minimap.PlayerInVehicle);
		local currentSpeed = (1 + (vehicleX ^ 2 + vehicleY ^ 2 + vehicleZ ^ 2) ^ (0.5)) / 2;
	
		if (currentSpeed <= 0.5) then
			return 180;
		elseif (currentSpeed >= 1) then
			return 360;
		end
		
		local distance = currentSpeed - 0.5;
		local ratio = 180 / 0.5;
		
		return math.ceil((distance * ratio) + 180);
	end
end

function getPointFromDistanceRotation(x, y, dist, angle)
	local a = math.rad(90 - angle);
	local dx = math.cos(a) * dist;
	local dy = math.sin(a) * dist;
	
	return x + dx, y + dy;
end

function getRotation()
	local cameraX, cameraY, _, rotateX, rotateY = getCameraMatrix();
	local camRotation = getVectorRotation(cameraX, cameraY, rotateX, rotateY);
	
	return camRotation;
end

function getVectorRotation(X, Y, X2, Y2)
	local rotation = 6.2831853071796 - math.atan2(X2 - X, Y2 - Y) % 6.2831853071796;
	
	return -rotation;
end

function dxDrawBorder(x, y, w, h, size, color, postGUI)
	size = size or 2;
	
	dxDrawRectangle(x - size, y, size, h, color or tocolor(0, 0, 0, 180), postGUI);
	dxDrawRectangle(x + w, y, size, h, color or tocolor(0, 0, 0, 180), postGUI);
	dxDrawRectangle(x - size, y - size, w + (size * 2), size, color or tocolor(0, 0, 0, 180), postGUI);
	dxDrawRectangle(x - size, y + h, w + (size * 2), size, color or tocolor(0, 0, 0, 180), postGUI);
end

function getMinimapState()
	return Minimap.IsVisible;
end

function getBigmapState()
	return Bigmap.IsVisible;
end

function getMapFromWorldPosition(worldX, worldY)
	local centerX, centerY = (Bigmap.PosX + (Bigmap.Width / 2)), (Bigmap.PosY + (Bigmap.Height / 2));
	local mapLeftFrame = centerX - ((playerX - worldX) / Bigmap.CurrentZoom * Minimap.MapUnit);
	local mapRightFrame = centerX + ((worldX - playerX) / Bigmap.CurrentZoom * Minimap.MapUnit);
	local mapTopFrame = centerY - ((worldY - playerY) / Bigmap.CurrentZoom * Minimap.MapUnit);
	local mapBottomFrame = centerY + ((playerY - worldY) / Bigmap.CurrentZoom * Minimap.MapUnit);
	
	centerX = math.max(mapLeftFrame, math.min(mapRightFrame, centerX));
	centerY = math.max(mapTopFrame, math.min(mapBottomFrame, centerY));
	
	return centerX, centerY;
end

function getWorldFromMapPosition(mapX, mapY)
	local worldX = playerX + ((mapX * ((Bigmap.Width * Bigmap.CurrentZoom) * 2)) - (Bigmap.Width * Bigmap.CurrentZoom));
	local worldY = playerY + ((mapY * ((Bigmap.Height * Bigmap.CurrentZoom) * 2)) - (Bigmap.Height * Bigmap.CurrentZoom)) * -1;
	
	return worldX, worldY;
end

addEventHandler( "onClientKey", root, function(button,press)
	if button=="t" and press == true then
		if (not Minimap.IsVisible and Bigmap.IsVisible) then
			if getElementData(localPlayer,"player:admin") then
				local veh = getPedOccupiedVehicle(localPlayer)
				if veh then 
					local cursorX, cursorY = getCursorPosition();
					if not cursorX then return end 
					if not cursorY then return end
					local mapX, mapY = getWorldFromMapPosition(cursorX, cursorY);
					setElementPosition ( localPlayer, mapX, mapY, 0 )
					setElementPosition ( veh, mapX, mapY, 0 )
					setTimer(function()
						local test = getGroundPosition ( mapX, mapY, 500 )
						setElementPosition ( localPlayer, mapX, mapY, test+1 )
						setElementPosition( veh, mapX, mapY, test+1)
					end, 200, 1)
				else
					local cursorX, cursorY = getCursorPosition();
					if not cursorX then return end 
					if not cursorY then return end
					local mapX, mapY = getWorldFromMapPosition(cursorX, cursorY);
					setElementPosition ( localPlayer, mapX, mapY, 0 )
					setTimer(function()
						local test = getGroundPosition ( mapX, mapY, 500 )
						setElementPosition ( localPlayer, mapX, mapY, test+1 )
					end, 200, 1)
					--triggerServerEvent('gimmiejetpack', localPlayer)	
					--exports.srnoti:create_alert('info','Otrzymałeś jetpacka, aby nie otrzymać obrażeń, wpisz /jp aby wyłączyć.')
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