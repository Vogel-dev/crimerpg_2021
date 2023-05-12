local screenX, screenY = guiGetScreenSize()

responsiveMultiplier = 0.75
stepMultiplier = 0.03571428571429
whileScreenSize = 1024

while whileScreenSize < screenX do
	responsiveMultiplier = responsiveMultiplier + stepMultiplier
	whileScreenSize = whileScreenSize + 128
end

local tuningMarkers = {}
local tuningMarkersCount = 0

local markerImageMaxVisibleDistance = 35

local sxdas, sydas = guiGetScreenSize()
zmienna = 1920/sxdas

local dxfont0_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 19/zmienna)

local availableTextures = {
	["logo"] = dxCreateTexture("pliki/jpg/logo.png", "argb", true, "clamp"),
	["oddo"] = dxCreateTexture("pliki/jpg/oddo.png", "argb", true, "clamp"),
	["menunav"] = dxCreateTexture("pliki/jpg/nawigacja.png", "argb", true, "clamp"),
}

local availableIcons = {
	["wrench"] = "",
	["long-arrow-up"] = "",
	["long-arrow-down"] = "",
	["info-circle"] = "",
	["check"] = "",
	["exclamation-triangle"] = "",
}

local mouseTable = {
	["speed"] = {0, 0},
	["last"] = {0, 0},
	["move"] = {0, 0}
}

local panelState = false
local enteredVehicle = false
local availableczcionki = nil

local panelWidth, rowHeight = 350 * responsiveMultiplier, 35 * responsiveMultiplier
local panelX, panelY = 32, -100
local logoHeight = panelWidth / 2

local hoveredCategory, selectedCategory, selectedSubCategory = 1, 0, 0
local maxRowsPerPage, currentPage = 7, 1

local compatibleOpticalUpgrades = {}
local equippedTuning = 1

local navbarButtonHeight = 30 * responsiveMultiplier

local noticeData = {
	["text"] = false,
	["type"] = "info",
	["tick"] = 0,
	["state"] = "",
	["height"] = 0,
	["timer"] = nil
}

local cameraSettings = {}

local promptDialog = {
	["state"] = false,
	["itemName"] = "",
	["itemPrice"] = 0
}

local availableOffroadAbilities = {
	["dirt"] = {0x100000, 2},
    ["sand"] = {0x200000, 3}
}

local availableWheelSizes = {
	["front"] = {
		["verynarrow"] = {0x100, 1},
		["narrow"] = {0x200, 2},
		["wide"] = {0x400, 4},
		["verywide"] = {0x800, 5}
	},
	["rear"] = {
		["verynarrow"] = {0x1000, 1},
		["narrow"] = {0x2000, 2},
		["wide"] = {0x4000, 4},
		["verywide"] = {0x8000, 5}
	}
}

local savedVehicleColors = {["all"] = false, ["headlight"] = false}
local moneyChangeTable = {["tick"] = 0, ["amount"] = 0}

local vehicleNumberplate = ""

addEvent("tuning->ShowMenu", true)
addEvent("tuning->HideMenu", true)

addEventHandler("onClientResourceStart", resourceRoot, function()
	for _, value in ipairs(getElementsByType("marker", root, true)) do
		if getElementData(value, "tuningMarkerSettings") then
			tuningMarkers[value] = true
			tuningMarkersCount = tuningMarkersCount + 1
		end
	end
	
	for i = 1, 4 do
		if i == 1 then 
			table.insert(tuningMenu[getMainCategoryIDByName(getLocalizedText("menu.color"))]["subMenu"], {
				["categoryName"] = getLocalizedText("menu.color") .. " " .. i,
				["tuningPrice"] = 5000, --JAKAS CENAAA
				["tuningData"] = "color" .. i
			})
		end 
		if i == 2 then 
			table.insert(tuningMenu[getMainCategoryIDByName(getLocalizedText("menu.color"))]["subMenu"], {
				["categoryName"] = getLocalizedText("menu.color") .. " " .. i,
				["tuningPrice"] = 5000, --JAKAS CENAAA
				["tuningData"] = "color" .. i
			})
		end
		if i == 3 then 
			table.insert(tuningMenu[getMainCategoryIDByName(getLocalizedText("menu.color"))]["subMenu"], {
				["categoryName"] = "Kolor felg",
				["tuningPrice"] = 5000, --JAKAS CENAAA
				["tuningData"] = "color" .. i
			})
		end
		if i == 4 then 
			table.insert(tuningMenu[getMainCategoryIDByName(getLocalizedText("menu.color"))]["subMenu"], {
				["categoryName"] = "Kolor rantów i neonów",
				["tuningPrice"] = 15000, --JAKAS CENAAA
				["tuningData"] = "color" .. i
			})
		end
	end
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
	if panelState and enteredVehicle then
		resetOpticalUpgrade()
		setVehicleColorsToDefault()
		triggerEvent("tuning->HideMenu", localPlayer)
	end
end)

addEventHandler("onClientElementStreamIn", root, function()
	if getElementType(source) == "marker" then
		if getElementData(source, "tuningMarkerSettings") then
			tuningMarkers[source] = true
			tuningMarkersCount = tuningMarkersCount + 1
		end
	end
end)

addEventHandler("onClientElementStreamOut", root, function()
	if getElementType(source) == "marker" then
		if getElementData(source, "tuningMarkerSettings") then
			tuningMarkers[source] = nil
			tuningMarkersCount = tuningMarkersCount - 1
		end
	end
end)

addEventHandler("onClientRender", root, function()
	--** Tuning marker image
	if tuningMarkersCount ~= 0 then
		local cameraX, cameraY, cameraZ = getCameraMatrix()

		for marker, id in pairs(tuningMarkers) do
			if marker and isElement(marker) then
				if getElementAlpha(marker) ~= 0 and getElementDimension(marker) == getElementDimension(localPlayer) then
					local markerX, markerY, markerZ = getElementPosition(marker)
					local markerDistance = getDistanceBetweenPoints3D(cameraX, cameraY, cameraZ, markerX, markerY, markerZ)
					
					if markerDistance <= markerImageMaxVisibleDistance then
						if isLineOfSightClear(cameraX, cameraY, cameraZ, markerX, markerY, markerZ, false, false, false, true, false, false, false) then
							local screenX, screenY = getScreenFromWorldPosition(markerX, markerY, markerZ + 1, 1)
							
							if screenX and screenY then
								local jpgcale = 1 - (markerDistance / markerImageMaxVisibleDistance) * 0.5
								local alphaScale = 255 - (markerDistance / markerImageMaxVisibleDistance) * 1.0
								
								local imageWidth, imageHeight = 256 * jpgcale, 128 * jpgcale
								local imageX, imageY = screenX - (imageWidth / 2), screenY - (imageHeight / 2)
								
								--dxDrawImage(imageX, imageY, imageWidth, imageHeight, availableTextures["logo"], 0, 0, 0, tocolor(200, 200, 200, 255 * alphaScale))
							end
						end
					end
				end
			else
				tuningMarkers[marker] = nil
			end
		end
	end
	
	-- ** Tuning menu
	if panelState and enteredVehicle then
		--> Logo
		--dxDrawRectangle(panelX, panelY, panelWidth, logoHeight * responsiveMultiplier, tocolor(0, 0, 0, 200))
		--dxDrawImage(panelX + (panelWidth / 2) - ((panelWidth * responsiveMultiplier) / 2), panelY, panelWidth * responsiveMultiplier, logoHeight * responsiveMultiplier, availableTextures["logo"])
		
		--> Current Money

		exports["crime_gui"]:guitext("Posiadasz: #5a3795"..formatujnaprzecinki(getPlayerMoney(localPlayer)).." PLN", 3/zmienna, 16/zmienna, 382/zmienna, 68/zmienna, 200, 200, 200, 255, dxfont0_FiraEC, "center", "center")

		drawTextWithBorder(" PLN" .. formatNumber(getPlayerMoney(localPlayer), ","), 1, panelX, panelY, panelX + screenX - (panelX * 2), panelY + screenY - (panelY * 2), tocolor(0, 0, 0, 255), tocolor(189, 227, 188, 255), 0.5, availableczcionki["moneyFont"], "right", "top", false, false, false, true)
		
		if moneyChangeTable["tick"] >= getTickCount() then
			drawTextWithBorder("- PLN" .. formatNumber(moneyChangeTable["amount"], ","), 1, panelX, panelY + dxGetFontHeight(0.5, availableczcionki["moneyFont"]), panelX + screenX - (panelX * 2), panelY + screenY - (panelY * 2), tocolor(0, 0, 0, 255), tocolor(200, 80, 80, 255), 0.5, availableczcionki["moneyFont"], "right", "top", false, false, false, true)
		end
		
		
		--[[
		--> Notification
		if noticeData["text"] then
			if noticeData["state"] == "showNotice" then
				local animationProgress = (getTickCount() - noticeData["tick"]) / 300
				local animationState = interpolateBetween(0, 0, 0, logoHeight * responsiveMultiplier, 0, 0, animationProgress, "Linear")
				
				noticeData["height"] = animationState
				
				if animationProgress > 1 then
					noticeData["state"] = "fixNoticeJumping"
					
					noticeData["timer"] = setTimer(function()
						noticeData["tick"] = getTickCount()
						noticeData["state"] = "hideNotice"
					end, string.len(noticeData["text"]) * 50, 1)
				end
			elseif noticeData["state"] == "hideNotice" then
				local animationProgress = (getTickCount() - noticeData["tick"]) / 300
				local animationState = interpolateBetween(logoHeight * responsiveMultiplier, 0, 0, 0, 0, 0, animationProgress, "Linear")
				
				noticeData["height"] = animationState
				
				if animationProgress > 1 then
					noticeData["text"] = false
				end
			elseif noticeData["state"] == "fixNoticeJumping" then
				noticeData["height"] = (logoHeight * responsiveMultiplier)
			end
			
			dxDrawRectangle(panelX, panelY, panelWidth, noticeData["height"], tocolor(0, 0, 0, 200))
			
			if noticeData["height"] == (logoHeight * responsiveMultiplier) then
				local noticeIcon, iconColor = "", {200, 200, 200}
				
				if noticeData["type"] == "info" then
					noticeIcon, iconColor = availableIcons["info-circle"], {85, 178, 243}
				elseif noticeData["type"] == "warning" then
					noticeIcon, iconColor = availableIcons["exclamation-triangle"], {220, 190, 120}
				elseif noticeData["type"] == "error" then
					noticeIcon, iconColor = availableIcons["exclamation-triangle"], {200, 80, 80}
				elseif noticeData["type"] == "success" then
					noticeIcon, iconColor = availableIcons["check"], {130, 220, 115}
				end
				
				dxDrawText(noticeIcon, panelX + 5, panelY + 5, panelX + 5 + panelWidth - 10, panelY + 5 + noticeData["height"] - 10, tocolor(iconColor[1], iconColor[2], iconColor[3], 255), 1.0, availableczcionki["icons"], "left", "top")
				dxDrawText(noticeData["text"], panelX + 10, panelY, panelX + 10 + panelWidth - 20, panelY + noticeData["height"], tocolor(200, 200, 200, 255), 0.5, availableczcionki["chalet"], "center", "center", false, true)
			end
		end
		]]--
		--> Looping table
		loopTable, categoryCount, categoryName = {}, 0, "N/A"
		
		if selectedCategory == 0 then
			loopTable = tuningMenu
			categoryName = getLocalizedText("menu.mainMenu")
			
			--navigationBar[1][1] = getLocalizedText("navbar.select")
			--navigationBar[3][1] = getLocalizedText("navbar.exit")
		elseif selectedCategory ~= 0 and selectedSubCategory == 0 then
			loopTable = tuningMenu[selectedCategory]["subMenu"]
			categoryName = tuningMenu[selectedCategory]["categoryName"]
			
			if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.color")) then -- Color
				--navigationBar[1][1] = getLocalizedText("navbar.buy")
			else
				--navigationBar[1][1] = getLocalizedText("navbar.select")
			end
			
			--navigationBar[3][1] = getLocalizedText("navbar.back")
		elseif selectedCategory ~= 0 and selectedSubCategory ~= 0 then
			if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.optical")) then -- Optical
				if isGTAUpgradeSlot(tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["upgradeSlot"]) then
					loopTable = tuningMenu[selectedCategory]["availableUpgrades"]
					categoryName = tuningMenu[selectedCategory]["categoryName"]
				else
					loopTable = tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["subMenu"]
					categoryName = tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["categoryName"]
				end
			else
				loopTable = tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["subMenu"]
				categoryName = tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["categoryName"]
			end
			
			--navigationBar[1][1] = getLocalizedText("navbar.buy")
			--navigationBar[3][1] = getLocalizedText("navbar.back")
		end
		
		--> Current category
		local panelY = panelY + (logoHeight * responsiveMultiplier)
		
		dxDrawRectangle(panelX, panelY, panelWidth, rowHeight, tocolor(90, 55, 150, 255))
		dxDrawText(utf8.upper(categoryName), panelX + 10, panelY, panelX + 10 + panelWidth - 20, panelY + rowHeight, tocolor(200, 200, 200, 255), 0.5, availableczcionki["chalet"], "left", "center", false, false, false, true)
		dxDrawText(hoveredCategory .. " / " .. #loopTable, panelX + 10, panelY, panelX + 10 + panelWidth - 20, panelY + rowHeight, tocolor(200, 200, 200, 255), 0.5, availableczcionki["chalet"], "right", "center", false, false, false, true)
	
		--> Menu rows
		local panelY = panelY + rowHeight
		
		for id, row in ipairs(loopTable) do
			if id >= currentPage and id <= currentPage + maxRowsPerPage then
				local rowX, rowY, rowWidth, rowHeight = panelX, panelY + (categoryCount * rowHeight), panelWidth, rowHeight
				
				if selectedCategory == 0 or selectedSubCategory == 0 then
					equippedUpgrade = -1
				elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.optical")) then
					if isGTAUpgradeSlot(tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["upgradeSlot"]) then
						if row["upgradeID"] == equippedTuning then
							equippedUpgrade = id
						end
					else
						if id == equippedTuning then
							equippedUpgrade = id
						end
					end
				else
					if id == equippedTuning then
						equippedUpgrade = id
					end
				end
				
				if hoveredCategory ~= id then
					if categoryCount %2 == 0 then
						dxDrawRectangle(rowX, rowY, rowWidth, rowHeight, tocolor(36, 40, 53, 204))
					else
						dxDrawRectangle(rowX, rowY, rowWidth, rowHeight, tocolor(36, 40, 53, 204))
					end
					
					dxDrawText(row["categoryName"], rowX + 15, rowY, rowX + 15 + rowWidth - 30, rowY + rowHeight, tocolor(200, 200, 200, 255), 0.5, availableczcionki["chalet"], "left", "center", false, false, false, true)
				
					if equippedUpgrade ~= id then
						if row["tuningPrice"] then
							if row["tuningPrice"] == 0 then
								dxDrawText(getLocalizedText("tuningPrice.free"), rowX + 15, rowY, rowX + 15 + rowWidth - 30, rowY + rowHeight, tocolor(198, 83, 82, 255), 0.5, availableczcionki["chalet"], "right", "center", false, false, false, true)
							else
								dxDrawText(" PLN " .. formatNumber(row["tuningPrice"], ","), rowX + 15, rowY, rowX + 15 + rowWidth - 30, rowY + rowHeight, tocolor(200, 200, 200, 200), 0.5, availableczcionki["chalet"], "right", "center", false, false, false, true)
							end
						end
					else
						dxDrawText(getLocalizedText("tuning.active"), rowX + 15, rowY, rowX + 15 + rowWidth - 30 - dxGetTextWidth(availableIcons["wrench"], 1.0, availableczcionki["icons"]) - 10, rowY + rowHeight, tocolor(150, 255, 150, 255), 0.5, availableczcionki["chalet"], "right", "center", false, false, false, true)
						dxDrawText(availableIcons["wrench"], rowX + 15, rowY, rowX + 15 + rowWidth - 30, rowY + rowHeight, tocolor(150, 255, 150, 255), 1.0, availableczcionki["icons"], "right", "center", false, false, false, true)
					end
				else
					dxDrawImage(rowX, rowY, rowWidth, rowHeight, availableTextures["oddo"])
					
					dxDrawText(row["categoryName"], rowX + 15, rowY, rowX + 15 + rowWidth - 30, rowY + rowHeight, tocolor(0, 0, 0, 255), 0.5, availableczcionki["chalet"], "left", "center", false, false, false, true)
				
					if equippedUpgrade ~= id then
						if row["tuningPrice"] then
							if row["tuningPrice"] == 0 then
								dxDrawText(getLocalizedText("tuningPrice.free"), rowX + 15, rowY, rowX + 15 + rowWidth - 30, rowY + rowHeight, tocolor(0, 0, 0, 255), 0.5, availableczcionki["chalet"], "right", "center", false, false, false, true)
							else
								dxDrawText(" PLN " .. formatNumber(row["tuningPrice"], ","), rowX + 15, rowY, rowX + 15 + rowWidth - 30, rowY + rowHeight, tocolor(0, 0, 0, 200), 0.5, availableczcionki["chalet"], "right", "center", false, false, false, true)
							end
						end
					else
						dxDrawText(getLocalizedText("tuning.active"), rowX + 15, rowY, rowX + 15 + rowWidth - 30 - dxGetTextWidth(availableIcons["wrench"], 1.0, availableczcionki["icons"]) - 10, rowY + rowHeight, tocolor(0, 0, 0, 255), 0.5, availableczcionki["chalet"], "right", "center", false, false, false, true)
						dxDrawText(availableIcons["wrench"], rowX + 15, rowY, rowX + 15 + rowWidth - 30, rowY + rowHeight, tocolor(0, 0, 0, 255), 1.0, availableczcionki["icons"], "right", "center", false, false, false, true)
					end
				end
				
				categoryCount = categoryCount + 1
			end
		end
		
		--dxDrawImage(panelX, panelY + (categoryCount * rowHeight), panelWidth, rowHeight, availableTextures["menunav"])
		
		--> Scrollbar
		if categoryCount >= (maxRowsPerPage + 1) and categoryCount ~= #loopTable then
			local rowVisible = math.max(0.05, math.min(1.0, (maxRowsPerPage + 1) / #loopTable))
			local scrollbarHeight = ((maxRowsPerPage + 1) * rowHeight) * rowVisible
			local scrollbarPosition = math.min((currentPage - 1) / #loopTable, 1.0 - rowVisible) * ((maxRowsPerPage + 1) * rowHeight)
			
			dxDrawRectangle(panelX + panelWidth - 2, panelY + scrollbarPosition, 2, scrollbarHeight, tocolor(90, 55, 150, 255))
		end
		

		
		--> Prompt dialog
		if promptDialog["state"] then
			local promptWidth = dxGetTextWidth(getLocalizedText("prompt.text"), 0.5, availableczcionki["chalet"]) + 20
			local promptWidth, promptHeight = promptWidth, 120 * responsiveMultiplier
			local promptX, promptY = (screenX / 2) - (promptWidth / 2), (screenY / 2) - (promptHeight / 2)
			
			drawRoundedRectangle(promptX, promptY, promptWidth, promptHeight, 1, tocolor(36, 40, 53, 204))
			dxDrawText(getLocalizedText("prompt.text"), promptX + 10, promptY + 5, promptX + 10 + promptWidth - 20, promptY + 5 + promptHeight - 10, tocolor(200, 200, 200, 255), 0.5, availableczcionki["chalet"], "left", "top")
		
			dxDrawText("#cccccc" .. getLocalizedText("prompt.info.1") ..": #ffffff" .. promptDialog["itemName"], promptX + 15, promptY + 30, promptX + 15 + promptWidth - 30, promptY + 30 + promptHeight - 60, tocolor(200, 200, 200, 255), 0.45, availableczcionki["chalet"], "left", "top", false, false, false, true)
			dxDrawText("#cccccc" .. getLocalizedText("prompt.info.2") .. ": #ffffff PLN " .. formatNumber(promptDialog["itemPrice"], ","), promptX + 15, promptY + 30 + dxGetFontHeight(0.45, availableczcionki["chalet"]), promptX + 15 + promptWidth - 30, promptY + 30 + dxGetFontHeight(0.45, availableczcionki["chalet"]) + promptHeight - 60, tocolor(200, 200, 200, 255), 0.45, availableczcionki["chalet"], "left", "top", false, false, false, true)
		
			local buttonX, buttonY, buttonWidth, buttonHeight = promptX + 10, promptY + promptHeight - 10 - navbarButtonHeight, (promptWidth / 2) - 20, navbarButtonHeight
		
			drawRoundedRectangle(buttonX, buttonY, buttonWidth, buttonHeight, 1, tocolor(55, 175, 0, 255))
			dxDrawText(getLocalizedText("prompt.button.1"), buttonX, buttonY, buttonX + buttonWidth, buttonY + buttonHeight, tocolor(200, 200, 200, 255), 0.5, availableczcionki["chalet"], "center", "center")
			
			drawRoundedRectangle((buttonX + buttonWidth + 20), buttonY, buttonWidth, buttonHeight, 1, tocolor(200, 55, 0, 255))
			dxDrawText(getLocalizedText("prompt.button.2"), (buttonX + buttonWidth + 20), buttonY, (buttonX + buttonWidth + 20) + buttonWidth, buttonY + buttonHeight, tocolor(200, 200, 200, 255), 0.5, availableczcionki["chalet"], "center", "center")
		end
		
		--> License Plate inputbox
		if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.extras")) then
			if selectedSubCategory == 8 and hoveredCategory == 2 then
				local boxX, boxY, boxWidth, boxHeight = panelX + 2, panelY + (categoryCount * rowHeight) + rowHeight, panelWidth - 4, rowHeight
				
				drawBorderedRectangle(boxX, boxY, boxWidth, boxHeight, 2, tocolor(0, 0, 0, 255), tocolor(30, 30, 30, 255))
				dxDrawText(vehicleNumberplate, boxX, boxY, boxX + boxWidth, boxY + boxHeight, tocolor(200, 200, 200, 255), 0.5, availableczcionki["chalet"], "center", "center")
			end
		end
	end
end)

addEventHandler("onClientPreRender", root, function(timeSlice)
	--> Calculate mouse move speed
	if isCursorShowing() then
		local cursorX, cursorY = getCursorPosition()
		
		mouseTable["speed"][1] = math.sqrt(math.pow((mouseTable["last"][1] - cursorX) / timeSlice, 2))
		mouseTable["speed"][2] = math.sqrt(math.pow((mouseTable["last"][2] - cursorY) / timeSlice, 2))
		
		mouseTable["last"][1] = cursorX
		mouseTable["last"][2] = cursorY
	end
	
	--> Camera
	if panelState and enteredVehicle then
		local _, _, _, _, _, _, roll, fov = getCameraMatrix()
		local cameraZoomProgress = (getTickCount() - cameraSettings["zoomTick"]) / 500
		local cameraZoomAnimation = interpolateBetween(fov, 0, 0, cameraSettings["zoom"], 0, 0, cameraZoomProgress, "Linear")
		
		if cameraSettings["moveState"] == "moveToElement" then
			local currentCameraX, currentCameraY, currentCameraZ, currentCameraRotX, currentCameraRotY, currentCameraRotZ = getCameraMatrix()
			local cameraProgress = (getTickCount() - cameraSettings["moveTick"]) / 1000
			local cameraX, cameraY, cameraZ, componentX, componentY, componentZ = _getCameraPosition("component")
			local newCameraX, newCameraY, newCameraZ = interpolateBetween(currentCameraX, currentCameraY, currentCameraZ, cameraX, cameraY, cameraZ, cameraProgress, "Linear")
			local newCameraRotX, newCameraRotY, newCameraRotZ = interpolateBetween(currentCameraRotX, currentCameraRotY, currentCameraRotZ, componentX, componentY, componentZ, cameraProgress, "Linear")
			local newCameraZoom = interpolateBetween(fov, 0, 0, 60, 0, 0, cameraProgress, "Linear")
			
			setCameraMatrix(newCameraX, newCameraY, newCameraZ, newCameraRotX, newCameraRotY, newCameraRotZ, roll, newCameraZoom)
			
			if cameraProgress > 0.5 then
				cameraSettings["moveState"] = "freeMode"
				cameraSettings["zoom"] = 60
			end
		elseif cameraSettings["moveState"] == "backToVehicle" then
			local currentCameraX, currentCameraY, currentCameraZ, currentCameraRotX, currentCameraRotY, currentCameraRotZ = getCameraMatrix()
			local cameraProgress = (getTickCount() - cameraSettings["moveTick"]) / 1000
			local cameraX, cameraY, cameraZ, vehicleX, vehicleY, vehicleZ = _getCameraPosition("vehicle")
			local newCameraX, newCameraY, newCameraZ = interpolateBetween(currentCameraX, currentCameraY, currentCameraZ, cameraX, cameraY, cameraZ, cameraProgress, "Linear")
			local newCameraRotX, newCameraRotY, newCameraRotZ = interpolateBetween(currentCameraRotX, currentCameraRotY, currentCameraRotZ, vehicleX, vehicleY, vehicleZ, cameraProgress, "Linear")
			local newCameraZoom = interpolateBetween(fov, 0, 0, 60, 0, 0, cameraProgress, "Linear")
			
			setCameraMatrix(newCameraX, newCameraY, newCameraZ, newCameraRotX, newCameraRotY, newCameraRotZ, roll, newCameraZoom)
			
			if cameraProgress > 0.5 then
				cameraSettings["moveState"] = "freeMode"
				cameraSettings["zoom"] = 60
			end
		elseif cameraSettings["moveState"] == "freeMode" then
			local cameraX, cameraY, cameraZ, elementX, elementY, elementZ = _getCameraPosition("both")
			
			setCameraMatrix(cameraX, cameraY, cameraZ, elementX, elementY, elementZ, roll, cameraZoomAnimation)
			
			if getKeyState("mouse1") and not pickingColor and not pickingLuminance and isCursorShowing() and not isMTAWindowActive() and not promptDialog["state"] then
				cameraSettings["freeModeActive"] = true
			else
				cameraSettings["freeModeActive"] = false
			end
		end
	end
end)

addEventHandler("onClientCursorMove", root, function(cursorX, cursorY, absoluteX, absoluteY)
	if panelState and enteredVehicle then
		if cameraSettings["freeModeActive"] then
			lastCursorX = mouseTable["move"][1]
			lastCursorY = mouseTable["move"][2]
			
			mouseTable["move"][1] = cursorX
			mouseTable["move"][2] = cursorY
			
			if cursorX > lastCursorX then
				cameraSettings["currentX"] = cameraSettings["currentX"] - (mouseTable["speed"][1] * 100)
			elseif cursorX < lastCursorX then
				cameraSettings["currentX"] = cameraSettings["currentX"] + (mouseTable["speed"][1] * 100)
			end
			
			if cursorY > lastCursorY then
				cameraSettings["currentZ"] = cameraSettings["currentZ"] + (mouseTable["speed"][2] * 50)
			elseif cursorY < lastCursorY then
				cameraSettings["currentZ"] = cameraSettings["currentZ"] - (mouseTable["speed"][2] * 50)
			end
			
			cameraSettings["currentY"] = cameraSettings["currentX"]
			cameraSettings["currentZ"] = math.max(cameraSettings["minimumZ"], math.min(cameraSettings["maximumZ"], cameraSettings["currentZ"]))
		end
	end
end)

addEventHandler("onClientCharacter", root, function(character)
	if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.extras")) then
		if selectedSubCategory == 8 and hoveredCategory == 2 then
			if #vehicleNumberplate < 8 then
				local supportedCharacters = {
					["q"] = true, ["w"] = true, ["x"] = true, ["4"] = true,
					["e"] = true, ["r"] = true, ["c"] = true, ["5"] = true,
					["t"] = true, ["z"] = true, ["v"] = true, ["6"] = true,
					["u"] = true, ["i"] = true, ["b"] = true, ["7"] = true,
					["o"] = true, ["p"] = true, ["n"] = true, ["8"] = true,
					["a"] = true, ["s"] = true, ["m"] = true, ["9"] = true,
					["d"] = true, ["f"] = true, ["0"] = true, ["-"] = true,
					["g"] = true, ["h"] = true, ["1"] = true, [" "] = true,
					["j"] = true, ["k"] = true, ["2"] = true,
					["l"] = true, ["y"] = true, ["3"] = true,
				}
				
				if supportedCharacters[character] then
					vehicleNumberplate = vehicleNumberplate .. utf8.upper(character)
					setVehiclePlateText(enteredVehicle, vehicleNumberplate)
				end
			end
		end
	end
end)

addEventHandler("onClientKey", root, function(key, pressed)
	if panelState and enteredVehicle then
		if pressed then
			if key == "arrow_d" and not promptDialog["state"] then
				if hoveredCategory > #loopTable or hoveredCategory == #loopTable then
					hoveredCategory = #loopTable
				else
					if hoveredCategory > maxRowsPerPage then
						currentPage = currentPage + 1
					end
				
					hoveredCategory = hoveredCategory + 1
					
					if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.optical")) then
						if selectedSubCategory ~= 0 then
							if isGTAUpgradeSlot(tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["upgradeSlot"]) then
								showNextOpticalUpgrade()
							else
								if selectedSubCategory == 12 then -- Neon
									addNeon(enteredVehicle, loopTable[hoveredCategory]["tuningData"])
								end
							end
						end
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.extras")) then
						if selectedSubCategory == 1 then
							triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "front", loopTable[hoveredCategory]["tuningData"])
						elseif selectedSubCategory == 2 then
							triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "rear", loopTable[hoveredCategory]["tuningData"])
						end
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.color")) then
						setVehicleColorsToDefault()
						setPaletteType(loopTable[hoveredCategory]["tuningData"])
						updatePaletteColor(enteredVehicle, loopTable[hoveredCategory]["tuningData"])
						
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.karoseria")) then
						if hoveredCategory == 1 then
							triggerServerEvent("karotest", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
						end
						if hoveredCategory == 2 then
							triggerServerEvent("karotest", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
						end
						
						
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.klakson")) then
						if hoveredCategory ~= 0 then
							if dzwiek then
								stopSound(dzwiek)
							end
							dzwiek = playSound(":crime_horns/"..loopTable[hoveredCategory]["tuningData"]..".wav")
						end
					end
					
					playSoundEffect("zmiana.mp3")
				end
			elseif key == "arrow_u" and not promptDialog["state"] then
				if hoveredCategory < 1 or hoveredCategory == 1 then
					hoveredCategory = 1
					
					if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.optical")) then
						if selectedSubCategory ~= 0 then
							if isGTAUpgradeSlot(tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["upgradeSlot"]) then
								showDefaultOpticalUpgrade()
							end
						end
					end
				else
					if currentPage - 1 >= 1 then
						currentPage = currentPage - 1
					end
					
					hoveredCategory = hoveredCategory - 1
					
					if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.optical")) then
						if selectedSubCategory ~= 0 then
							if isGTAUpgradeSlot(tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["upgradeSlot"]) then
								if hoveredCategory == 1 then -- Default upgrade
									removeVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[hoveredCategory])
								else
									showNextOpticalUpgrade()
								end
							else
								if selectedSubCategory == 12 then -- Neon
									if hoveredCategory == 1 then
										removeNeon(enteredVehicle, true)
									else
										addNeon(enteredVehicle, loopTable[hoveredCategory]["tuningData"])
									end
								end
							end
						end
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.extras")) then
						if selectedSubCategory == 1 then
							triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "front", loopTable[hoveredCategory]["tuningData"])
						elseif selectedSubCategory == 2 then
							triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "rear", loopTable[hoveredCategory]["tuningData"])
						elseif selectedSubCategory == 8 then
							if equippedTuning ~= vehicleNumberplate then
								setVehiclePlateText(enteredVehicle, equippedTuning)
								vehicleNumberplate = equippedTuning
							end
						end
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.color")) then
						setVehicleColorsToDefault()
						setPaletteType(loopTable[hoveredCategory]["tuningData"])
						updatePaletteColor(enteredVehicle, loopTable[hoveredCategory]["tuningData"])
						
						
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.karoseria")) then
						if hoveredCategory == 1 then
							triggerServerEvent("karotest", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
						end
						if hoveredCategory == 2 then
							triggerServerEvent("karotest", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
						end
						
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.klakson")) then
						if hoveredCategory ~= 0 then
							if dzwiek then
								stopSound(dzwiek)
							end
							dzwiek = playSound(":crime_horns/"..loopTable[hoveredCategory]["tuningData"]..".wav")
						end
					
					end
					
					playSoundEffect("zmiana.mp3")
				end
			elseif key == "backspace" then
				if promptDialog["state"] then
					promptDialog["state"] = false
				else
					if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.extras")) and selectedSubCategory == 8 then
						if hoveredCategory == 2 then
							if #vehicleNumberplate - 1 >= 0 then
								vehicleNumberplate = string.sub(vehicleNumberplate, 1, #vehicleNumberplate - 1)
								setVehiclePlateText(enteredVehicle, vehicleNumberplate)
							else
								setVehiclePlateText(enteredVehicle, "")
								vehicleNumberplate = ""
							end
							
							return
						else
							if equippedTuning ~= vehicleNumberplate then
								setVehiclePlateText(enteredVehicle, equippedTuning)
								vehicleNumberplate = equippedTuning
							end
						end
					end
					--tu1
					if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.karoseria")) then
						if getElementData(enteredVehicle,"vehicle:karbon") == "nie" then
							triggerServerEvent("karotest", localPlayer, enteredVehicle, "nie")
						end
						if getElementData(enteredVehicle,"vehicle:karbon") == "tak" then
							triggerServerEvent("karotest", localPlayer, enteredVehicle, "tak")
						end
					end
					
					
					if selectedCategory == 0 and selectedSubCategory == 0 then
						triggerEvent("tuning->HideMenu", localPlayer)
						giveNotification("error", "Dla bezpieczeństwa zalecamy zresetować pojazd w przechowywalni.", loopTable[hoveredCategory]["categoryName"])
					elseif selectedCategory ~= 0 and selectedSubCategory == 0 then
						if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.color")) then -- Color
							destroyColorPicker()
							setVehicleColorsToDefault()
						end
						
						selectedCategory, hoveredCategory, currentPage = 0, 1, 1
					elseif selectedCategory ~= 0 and selectedSubCategory ~= 0 then
						moveCameraToDefaultPosition()
						
						if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.optical")) then -- Optical
							if selectedSubCategory ~= 0 then
								if isGTAUpgradeSlot(tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["upgradeSlot"]) then
									resetOpticalUpgrade() -- reset to equipped upgrade
									tuningMenu[selectedCategory]["availableUpgrades"] = {}
									equippedTuning = 1
								else
									if selectedSubCategory == 11 then -- Lamp color
										destroyColorPicker()
										setVehicleColorsToDefault()
										setVehicleOverrideLights(enteredVehicle, 1)
									elseif selectedSubCategory == 12 then -- Neon
										restoreOldNeon(enteredVehicle)
									end
								end
							end
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.extras")) then -- Extras
							if selectedSubCategory == 1 then
								local defaultWheelSize = (equippedTuning == 1 and "verynarrow") or (equippedTuning == 2 and "narrow") or (equippedTuning == 3 and "default") or (equippedTuning == 4 and "wide") or (equippedTuning == 5 and "verywide")
								
								triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "front", defaultWheelSize)
							elseif selectedSubCategory == 2 then
								local defaultWheelSize = (equippedTuning == 1 and "verynarrow") or (equippedTuning == 2 and "narrow") or (equippedTuning == 3 and "default") or (equippedTuning == 4 and "wide") or (equippedTuning == 5 and "verywide")
								
								triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "rear", defaultWheelSize)
							elseif selectedSubCategory == 10 then
								setVehicleDoorOpenRatio(enteredVehicle, 2, 0, 500)
								setVehicleDoorOpenRatio(enteredVehicle, 3, 0, 500)
								
								setVehicleDoorToLSD(enteredVehicle, ((equippedTuning == 1 and false) or (equippedTuning == 2 and true)))
							end
						end
						
						selectedSubCategory, hoveredCategory, currentPage = 0, 1, 1
					end
					
					if dzwiek then
						stopSound(dzwiek)
					end
					
					playSoundEffect("backspace.wav")
					
					if enteredVehicle then
						for component in pairs(getVehicleComponents(enteredVehicle)) do
							setVehicleComponentVisible(enteredVehicle, component, true)
						end
					end
				end
			elseif key == "enter" then
				if not promptDialog["state"] then
					if selectedCategory == 0 then
						selectedCategory, currentPage, hoveredCategory = hoveredCategory, 1, 1
						
						if selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.color")) then
							savedVehicleColors["all"] = {getVehicleColor(enteredVehicle, true)}
							savedVehicleColors["headlight"] = {getVehicleHeadLightColor(enteredVehicle)}
							
							createColorPicker(enteredVehicle, panelX + 2, (panelY + (logoHeight * responsiveMultiplier) + rowHeight + (categoryCount * rowHeight) + rowHeight) + 2, panelWidth - 4, (panelWidth / 2) * responsiveMultiplier, "color1")
						end
						
						
						
						playSoundEffect("enter.mp3")
					elseif selectedCategory ~= 0 and selectedSubCategory == 0 then
						if selectedCategory == "tunicniemaxd" then
							local componentCompatible = false
						
							if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike"}) then
								local tuningDataName = loopTable[hoveredCategory]["upgradeData"]
								local equippedTuningID = getElementData(enteredVehicle, "tuning." .. tuningDataName) or 1
								
								if tuningDataName ~= "nitro" then
									equippedTuning = equippedTuningID
									componentCompatible = true
								else
									if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck"}) then
										equippedTuning = -1
										componentCompatible = true
									end
								end
							end
							
							if componentCompatible then
								setCameraAndComponentVisible()
								selectedSubCategory, hoveredCategory, currentPage = hoveredCategory, 1, 1
							end
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.optical")) then
							if isGTAUpgradeSlot(loopTable[hoveredCategory]["upgradeSlot"]) then
								local upgradeSlot = loopTable[hoveredCategory]["upgradeSlot"]
								local compatibleUpgrades = getVehicleCompatibleUpgrades(enteredVehicle, upgradeSlot)
							
								if compatibleUpgrades[1] == nil then
									giveNotification("error", getLocalizedText("notification.error.notCompatible", loopTable[hoveredCategory]["categoryName"]))
								else
									setCameraAndComponentVisible()
									
									compatibleOpticalUpgrades = compatibleUpgrades
									equippedTuning = getVehicleUpgradeOnSlot(enteredVehicle, upgradeSlot)
									
									table.insert(tuningMenu[selectedCategory]["availableUpgrades"], {
										["categoryName"] = getLocalizedText("tuningPack.0"),
										["tuningPrice"] = 0,
										["upgradeID"] = 0
									})
									
									for id, upgrade in pairs(compatibleOpticalUpgrades) do
										table.insert(tuningMenu[selectedCategory]["availableUpgrades"], {
											["categoryName"] = tuningMenu[selectedCategory]["subMenu"][hoveredCategory]["categoryName"] .. " " .. id,
											["tuningPrice"] = tuningMenu[selectedCategory]["subMenu"][hoveredCategory]["tuningPrice"],
											["upgradeID"] = upgrade
										})
									end
									
									selectedSubCategory, hoveredCategory, currentPage = hoveredCategory, 1, 1
									showDefaultOpticalUpgrade()
								end
							else -- Customs optical elements (Neon, Air-Ride etc..)
								local componentCompatible = false
								
								if hoveredCategory == 10 then -- lsdDoor
									if isComponentCompatible(enteredVehicle, "Automobile") then
										equippedTuning = (getElementData(enteredVehicle, "tuning.lsdDoor") and 2) or 1
										componentCompatible = true
									end
								elseif hoveredCategory == 11 then -- Lamp color
									if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike"}) then
										equippedTuning = -1
										
										setVehicleOverrideLights(enteredVehicle, 2)
										
										savedVehicleColors["all"] = {getVehicleColor(enteredVehicle, true)}
										savedVehicleColors["headlight"] = {getVehicleHeadLightColor(enteredVehicle)}
										
										createColorPicker(enteredVehicle, panelX + 2, (panelY + (logoHeight * responsiveMultiplier) + (rowHeight * 2) + rowHeight) + 2, panelWidth - 4, (panelWidth / 2) * responsiveMultiplier, "headlight")
										
										componentCompatible = true
									end
								elseif hoveredCategory == 12 then -- Neon
									if isComponentCompatible(enteredVehicle, "Automobile") then
										local currentNeon = getElementData(enteredVehicle, "tuning.neon") or false
										
										if currentNeon == "white" then currentNeon = 2
										elseif currentNeon == "blue" then currentNeon = 3
										elseif currentNeon == "green" then currentNeon = 4
										elseif currentNeon == "red" then currentNeon = 5
										elseif currentNeon == "yellow" then currentNeon = 6
										elseif currentNeon == "pink" then currentNeon = 7
										elseif currentNeon == "orange" then currentNeon = 8
										elseif currentNeon == "lightblue" then currentNeon = 9
										elseif currentNeon == "rasta" then currentNeon = 10
										elseif currentNeon == "ice" then currentNeon = 11
										else currentNeon = 1
										end
										
										equippedTuning = currentNeon
										removeNeon(enteredVehicle, true)
										
										componentCompatible = true
									end
								end
								
								if componentCompatible then
									setCameraAndComponentVisible()
									selectedSubCategory, hoveredCategory, currentPage = hoveredCategory, 1, 1
								end
							end
							
							--moje
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.performance")) then
							local vehxd = getPedOccupiedVehicle ( localPlayer )
							if hoveredCategory == 1 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
								if getElementData(enteredVehicle,"naped") == "awd" then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								triggerServerEvent("wojtekpedau", localPlayer, enteredVehicle, "awd")
							end
							if hoveredCategory == 2 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
								if getElementData(enteredVehicle,"naped") == "fwd" then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								triggerServerEvent("wojtekpedau", localPlayer, enteredVehicle, "fwd")
							end
							if hoveredCategory == 3 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
								if getElementData(enteredVehicle,"naped") == "rwd" then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								triggerServerEvent("wojtekpedau", localPlayer, enteredVehicle, "rwd")
							end
							
							if hoveredCategory > 3 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
								if getElementData(enteredVehicle,"silnik") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								triggerServerEvent("mypedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							end
							
							--silniki
							
							
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.mileage")) then
							if hoveredCategory == 1 then
								if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
								local mileage = getElementData(enteredVehicle,"vehicle:mileage")
								if mileage < 1 then exports.crime_gui:addNoti("Przebieg pojazdu jest za mały.", "error") return end
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								triggerServerEvent("holukpedau", localPlayer, enteredVehicle, 1)
							end
							if hoveredCategory == 2 then
								if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
								local mileage = getElementData(enteredVehicle,"vehicle:mileage")
								if mileage < 10 then exports.crime_gui:addNoti("Przebieg pojazdu jest za mały.", "error") return end
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								triggerServerEvent("holukpedau", localPlayer, enteredVehicle, 10)
							end
							if hoveredCategory == 3 then
								if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
								local mileage = getElementData(enteredVehicle,"vehicle:mileage")
								if mileage < 100 then exports.crime_gui:addNoti("Przebieg pojazdu jest za mały.", "error") return end
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								triggerServerEvent("holukpedau", localPlayer, enteredVehicle, 100)
							end
							if hoveredCategory == 4 then
								if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
								local mileage = getElementData(enteredVehicle,"vehicle:mileage")
								if mileage < 1000 then exports.crime_gui:addNoti("Przebieg pojazdu jest za mały.", "error") return end
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								triggerServerEvent("holukpedau", localPlayer, enteredVehicle, 1000)
							end
							if hoveredCategory == 5 then
								if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
								local mileage = getElementData(enteredVehicle,"vehicle:mileage")
								if mileage < 10000 then exports.crime_gui:addNoti("Przebieg pojazdu jest za mały.", "error") return end
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								triggerServerEvent("holukpedau", localPlayer, enteredVehicle, 10000)
							end
							
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.fixvehicle")) then
						if hoveredCategory == 1 then
						if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
						triggerServerEvent("typedau", localPlayer, enteredVehicle, 1)
						--exports.srnoti:create_alert('info','Naprawiono pojazd!')
						moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						if hoveredCategory == 2 then
						if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
						triggerServerEvent("japedau", localPlayer, enteredVehicle, 1)
						--exports.srnoti:create_alert('info','Naprawiono opony')
						moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						
						
						
						
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.tarcze")) then
						if hoveredCategory == 1 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:tarcze") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("tarczepedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						if hoveredCategory == 2 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:tarcze") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("tarczepedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						if hoveredCategory == 3 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:tarcze") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("tarczepedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.zawieszenie")) then
						if hoveredCategory == 1 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:zawieszenie") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("zawieszeniepedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						if hoveredCategory == 2 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:zawieszenie") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("zawieszeniepedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						if hoveredCategory == 3 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:zawieszenie") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("zawieszeniepedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.karoseria")) then
						if hoveredCategory == 1 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:karbon") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("karoseriapedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						if hoveredCategory == 2 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:karbon") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							local gratm = getElementModel(enteredVehicle)
							--if gratm == 581 or gratm == 568 or gratm == 429 or gratm == 536 or gratm == 575 or gratm == 541 or gratm == 483 or gratm == 507 or gratm == 562 or gratm == 565 or gratm == 463 or gratm == 545 or gratm == 559 or gratm == 522 or gratm == 461 or gratm == 534 or gratm == 468 or gratm == 567 or gratm == 535 or gratm == 561 or gratm == 560 or gratm == 576 or gratm == 558 or gratm == 412 or gratm == 586 then exports.srnoti:create_alert('info','Do tego pojazdu nie ma plastikowych zamienników!') return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("karoseriapedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						
						--sad
						
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.chiptuning")) then
						if hoveredCategory == 1 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:chiptuning") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("chiptuningpedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						if hoveredCategory == 2 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:chiptuning") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("chiptuningpedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						if hoveredCategory == 3 then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:chiptuning") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("chiptuningpedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
						
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.klakson")) then
						if hoveredCategory then
							if getPlayerMoney(localPlayer) < loopTable[hoveredCategory]["tuningPrice"] then exports.crime_gui:addNoti("Nie posiadasz wystarczającej sumy pieniędzy.", "error") return end 
							if getElementData(enteredVehicle,"vehicle:klakson") == loopTable[hoveredCategory]["tuningData"] then exports.crime_gui:addNoti("Ten pojazd ma już to zamontowane.", "error") return end
							--exports.srnoti:create_alert('info','Zakupiono')
							triggerServerEvent("klaksonpedau", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
						end
							
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.extras")) then
							local componentCompatible = false
							
							if hoveredCategory == 1 then
								if isComponentCompatible(enteredVehicle, "Automobile") then
									equippedTuning = getVehicleWheelSize(enteredVehicle, "front")
									triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "front", loopTable[hoveredCategory]["subMenu"][1]["tuningData"])
									
									componentCompatible = true
								end
							elseif hoveredCategory == 2 then
								if isComponentCompatible(enteredVehicle, "Automobile") then
									equippedTuning = getVehicleWheelSize(enteredVehicle, "rear")
									triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "rear", loopTable[hoveredCategory]["subMenu"][1]["tuningData"])
									
									componentCompatible = true
								end
							elseif hoveredCategory == 3 then
								if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike"}) then
									equippedTuning = getVehicleOffroadAbility(enteredVehicle)
									componentCompatible = true
								end
							elseif hoveredCategory == 4 then
								if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad"}) then
									local driveType = getVehicleHandling(enteredVehicle)["driveType"]
									
									equippedTuning = (driveType == "fwd" and 1) or (driveType == "awd" and 2) or (driveType == "rwd" and 3)
									componentCompatible = true
								end
							elseif hoveredCategory == 5 then
								if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike"}) then
									equippedTuning = (getElementData(enteredVehicle, "tuning.bulletProofTires") and 2) or 1
									componentCompatible = true
								end
							elseif hoveredCategory == 6 then
								if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck"}) then
									equippedTuning = (getElementData(enteredVehicle, "tuning.lsdDoor") and 2) or 1
									
									setVehicleDoorOpenRatio(enteredVehicle, 2, 1, 500)
									setVehicleDoorOpenRatio(enteredVehicle, 3, 1, 500)
									
									setVehicleDoorToLSD(enteredVehicle, true)
									
									componentCompatible = true
								end
							elseif hoveredCategory == 7 then
								if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike", "BMX"}) then
									local steeringLock = getVehicleHandling(enteredVehicle)["steeringLock"]
									
									equippedTuning = (steeringLock == 30 and 2) or (steeringLock == 40 and 3) or (steeringLock == 50 and 4) or (steeringLock == 60 and 5) or 1
									componentCompatible = true
								end
							elseif hoveredCategory == 8 then
								if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike"}) then
									equippedTuning = getVehiclePlateText(enteredVehicle)
									vehicleNumberplate = equippedTuning
									componentCompatible = true
								end
							end
							
							if componentCompatible then
								setCameraAndComponentVisible()
								selectedSubCategory, hoveredCategory, currentPage = hoveredCategory, 1, 1
							end
						elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.color")) then
							promptDialog = {
								["state"] = true,
								["itemName"] = categoryName .. " (" .. loopTable[hoveredCategory]["categoryName"] .. ")",
								["itemPrice"] = loopTable[hoveredCategory]["tuningPrice"]
							}
						end
						
						playSoundEffect("enter.mp3")
					elseif selectedCategory ~= 0 and selectedSubCategory ~= 0 then
						promptDialog = {
							["state"] = true,
							["itemName"] = categoryName .. " (" .. loopTable[hoveredCategory]["categoryName"] .. ")",
							["itemPrice"] = loopTable[hoveredCategory]["tuningPrice"]
						}
					end
				else -- Buying item after accepted prompt
					if selectedCategory == "tunadalnicniema" then
						if hoveredCategory == equippedTuning then
							giveNotification("error", getLocalizedText("notification.error.itemIsPurchased", loopTable[hoveredCategory]["categoryName"]))
							promptDialog["state"] = false
						else
							if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
								local tuningName = tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["upgradeData"]
				
								setElementData(enteredVehicle, "tuning." .. tuningName, hoveredCategory, true)
								
								if tuningName ~= "nitro" then
									triggerServerEvent("tuning->PerformanceUpgrade", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
									equippedTuning = hoveredCategory
								else
									if loopTable[hoveredCategory]["tuningData"] == 0 then
										triggerServerEvent("tuning->OpticalUpgrade", localPlayer, enteredVehicle, "remove", 1010)
									else
										triggerServerEvent("tuning->OpticalUpgrade", localPlayer, enteredVehicle, "add", 1010)
									end
									
									setElementData(enteredVehicle, "tuning.nitroLevel", loopTable[hoveredCategory]["tuningData"])
									refreshVehicleNitroLevel(enteredVehicle, loopTable[hoveredCategory]["tuningData"])
								end
								
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								promptDialog["state"] = false
							else
								giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
								promptDialog["state"] = false
							end
						end
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.optical")) then
						if isGTAUpgradeSlot(tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["upgradeSlot"]) then
							if equippedTuning == loopTable[hoveredCategory]["upgradeID"] then
								giveNotification("error", getLocalizedText("notification.error.itemIsPurchased", loopTable[hoveredCategory]["categoryName"]))
								promptDialog["state"] = false
							else
								if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
									if getElementData(enteredVehicle, "tuning.airRide") and selectedSubCategory == 9 then
										giveNotification("warning", getLocalizedText("notification.warning.airRideInstalled"))
									else
										if loopTable[hoveredCategory]["upgradeID"] == 0 then
											triggerServerEvent("tuning->OpticalUpgrade", localPlayer, enteredVehicle, "remove", equippedTuning)
											equippedTuning = 0
										else
											triggerServerEvent("tuning->OpticalUpgrade", localPlayer, enteredVehicle, "add", loopTable[hoveredCategory]["upgradeID"])
											equippedTuning = loopTable[hoveredCategory]["upgradeID"]
										end
										
										moneyChange(loopTable[hoveredCategory]["tuningPrice"])
									end
									
									promptDialog["state"] = false
								else
									giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
									promptDialog["state"] = false
								end
							end
						else
							if selectedSubCategory == 10 then -- lsdDoordoors
								if hoveredCategory == equippedTuning then
									giveNotification("error", getLocalizedText("notification.error.itemIsPurchased", loopTable[hoveredCategory]["categoryName"]))
									promptDialog["state"] = false
								else
									if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
										setElementData(enteredVehicle, "tuning.lsdDoor", loopTable[hoveredCategory]["tuningData"], true)
										
										if hoveredCategory == 1 then
											setVehicleDoorToLSD(enteredVehicle, false)
										end
										
										equippedTuning = hoveredCategory
										moneyChange(loopTable[hoveredCategory]["tuningPrice"])
										promptDialog["state"] = false
									else
										giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
										promptDialog["state"] = false
									end
								end
							elseif selectedSubCategory == 11 then -- Lamp color
								if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
									savedVehicleColors["all"] = {getVehicleColor(enteredVehicle, true)}
									savedVehicleColors["headlight"] = {getVehicleHeadLightColor(enteredVehicle)}
									
									triggerServerEvent("tuning->Color", localPlayer, enteredVehicle, savedVehicleColors["all"], savedVehicleColors["headlight"])
									
									equippedTuning = -1
									moneyChange(loopTable[hoveredCategory]["tuningPrice"])
									promptDialog["state"] = false
								else
									giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
									promptDialog["state"] = false
								end
							elseif selectedSubCategory == 12 then -- Neon
								if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
									saveNeon(enteredVehicle, loopTable[hoveredCategory]["tuningData"], true)
									
									equippedTuning = hoveredCategory
									moneyChange(loopTable[hoveredCategory]["tuningPrice"])
									promptDialog["state"] = false
								else
									giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
									promptDialog["state"] = false
								end
							end
						end
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.extras")) then
						if selectedSubCategory == 1 or selectedSubCategory == 2 then
							local vehicleSide = (selectedSubCategory == 1 and "front") or (selectedSubCategory == 2 and "rear")
							
							if hoveredCategory == equippedTuning then
								giveNotification("error", getLocalizedText("notification.error.itemIsPurchased", loopTable[hoveredCategory]["categoryName"]))
								promptDialog["state"] = false
							else
								if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
									triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, vehicleSide, loopTable[hoveredCategory]["tuningData"])
									
									equippedTuning = hoveredCategory
									moneyChange(loopTable[hoveredCategory]["tuningPrice"])
									promptDialog["state"] = false
								else
									giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
									promptDialog["state"] = false
								end
							end
						elseif selectedSubCategory == 3 then
							if hoveredCategory == equippedTuning then
								giveNotification("error", getLocalizedText("notification.error.itemIsPurchased", loopTable[hoveredCategory]["categoryName"]))
								promptDialog["state"] = false
							else
								if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
									triggerServerEvent("tuning->OffroadAbility", localPlayer, enteredVehicle, loopTable[hoveredCategory]["tuningData"])
									
									equippedTuning = hoveredCategory
									moneyChange(loopTable[hoveredCategory]["tuningPrice"])
									promptDialog["state"] = false
								else
									giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
									promptDialog["state"] = false
								end
							end
						elseif selectedSubCategory == 4 or selectedSubCategory == 7 then
							if hoveredCategory == equippedTuning then
								giveNotification("error", getLocalizedText("notification.error.itemIsPurchased", loopTable[hoveredCategory]["categoryName"]))
								promptDialog["state"] = false
							else
								if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
									triggerServerEvent("tuning->HandlingUpdate", localPlayer, enteredVehicle, tuningMenu[selectedCategory]["subMenu"][selectedSubCategory]["propertyName"], loopTable[hoveredCategory]["tuningData"])
									
									equippedTuning = hoveredCategory
									moneyChange(loopTable[hoveredCategory]["tuningPrice"])
									promptDialog["state"] = false
								else
									giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
									promptDialog["state"] = false
								end
							end
						elseif selectedSubCategory == 5 then
							if hoveredCategory == equippedTuning then
								giveNotification("error", getLocalizedText("notification.error.itemIsPurchased", loopTable[hoveredCategory]["categoryName"]))
								promptDialog["state"] = false
							else
								if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
									setElementData(enteredVehicle, "tuning.bulletProofTires", loopTable[hoveredCategory]["tuningData"], true)
									
									equippedTuning = hoveredCategory
									moneyChange(loopTable[hoveredCategory]["tuningPrice"])
									promptDialog["state"] = false
								else
									giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
									promptDialog["state"] = false
								end
							end
						elseif selectedSubCategory == 10 then
							if hoveredCategory == equippedTuning then
								giveNotification("error", getLocalizedText("notification.error.itemIsPurchased", loopTable[hoveredCategory]["categoryName"]))
								promptDialog["state"] = false
							else
								if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
									setVehicleDoorToLSD(enteredVehicle, loopTable[hoveredCategory]["tuningData"])
									
									equippedTuning = hoveredCategory
									moneyChange(loopTable[hoveredCategory]["tuningPrice"])
									promptDialog["state"] = false
								else
									giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
									promptDialog["state"] = false
								end
							end
						elseif selectedSubCategory == 8 then
							if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
								if loopTable[hoveredCategory]["tuningData"] == "random" then
									vehicleNumberplate = generateString(8)
								elseif loopTable[hoveredCategory]["tuningData"] == "custom" then
									vehicleNumberplate = vehicleNumberplate
								end
								
								triggerServerEvent("tuning->LicensePlate", localPlayer, enteredVehicle, vehicleNumberplate)
								
								equippedTuning = vehicleNumberplate
								moneyChange(loopTable[hoveredCategory]["tuningPrice"])
								promptDialog["state"] = false
							else
								giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
								promptDialog["state"] = false
							end
						end
						
					elseif selectedCategory == getMainCategoryIDByName(getLocalizedText("menu.color")) then
						if hasPlayerMoney(loopTable[hoveredCategory]["tuningPrice"]) then
							savedVehicleColors["all"] = {getVehicleColor(enteredVehicle, true)}
							savedVehicleColors["headlight"] = {getVehicleHeadLightColor(enteredVehicle)}
							
							triggerServerEvent("tuning->Color", localPlayer, enteredVehicle, savedVehicleColors["all"], savedVehicleColors["headlight"])
							
							equippedTuning = hoveredCategory
							moneyChange(loopTable[hoveredCategory]["tuningPrice"])
							promptDialog["state"] = false
						else
							giveNotification("error", getLocalizedText("notification.error.notEnoughMoney"))
							promptDialog["state"] = false
						end
						end
					
					
				end
			if dzwiek then
				stopSound(dzwiek)
			end
			
			end
			
		end
	end
end)

addEventHandler("tuning->ShowMenu", root, function(vehicle)
	if source and vehicle then
	
					if getElementData(vehicle,"publiczny") == true then return end
			if not getElementData(vehicle,"vehicle:id") then return end
			--if getElementData(vehicle,"vehicle:ownedPlayer") ~= getElementData(localPlayer,"player:uid") then return end
			
		if not panelState then
			enteredVehicle = vehicle
			
			createczcionki()
			
			hoveredCategory, selectedCategory, selectedSubCategory = 1, 0, 0
			maxRowsPerPage, currentPage = 7, 1
			
			
			if noticeData["timer"] then
				if isTimer(noticeData["timer"]) then
					killTimer(noticeData["timer"])
				end
			end
			
			noticeData = {
				["text"] = false,
				["type"] = "info",
				["tick"] = 0,
				["state"] = "",
				["height"] = 0,
				["timer"] = nil
			}
			
			local _, _, vehicleRotation = getElementRotation(enteredVehicle)
			local cameraRotation = vehicleRotation + 60
			
			cameraSettings = {
				["distance"] = 9,
				["movingSpeed"] = 2,
				["currentX"] = math.rad(cameraRotation),
				["defaultX"] = math.rad(cameraRotation),
				["currentY"] = math.rad(cameraRotation),
				["currentZ"] = math.rad(15),
				["maximumZ"] = math.rad(35),
				["minimumZ"] = math.rad(0),
				["freeModeActive"] = false,
				["zoomTick"] = 0,
				["zoom"] = 60
			}
			
			cameraSettings["moveState"] = "freeMode"
			
			promptDialog = {
				["state"] = false,
				["itemName"] = "",
				["itemPrice"] = 0
			}
			
			panelState = true
			--toggleAllControls(false)
			setElementData(localPlayer,"hudoff",true)
			setElementData(localPlayer,"radaroff",true)
			showChat(false)
			showCursor(true)
		end
	end
end)

addEventHandler("tuning->HideMenu", root, function()
	if enteredVehicle and panelState then
		panelState = false
		--toggleAllControls(true)
		setElementData(localPlayer,"hudoff",false)
		setElementData(localPlayer,"radaroff",false)
		showChat(true)
		enteredVehicle = nil
		destroyczcionki()
		setCameraTarget(localPlayer)
		showCursor(false)
		
		triggerServerEvent("tuning->ResetMarker", root, localPlayer)
	end
end)

addEventHandler("onClientVehicleDamage", root, function(_, _, _, _, _, _, tyre) -- Bulletproof tires
	if getElementData(source, "tuning.bulletProofTires") then
		if tyre == 0 or tyre == 1 or tyre == 2 or tyre == 3 then
			cancelEvent()
		end
	end
end)

function moneyChange(amount)
	triggerServerEvent("takePlayerMoney", localPlayer, loopTable[hoveredCategory]["tuningPrice"])
	
	giveNotification("success", getLocalizedText("notification.success.purchased"))
--	playSoundEffect("moneychange.wav")
	
	if amount > 0 then
		moneyChangeTable = {
			["tick"] = getTickCount() + 5000,
			["amount"] = amount
		}
	end
end

function createczcionki()
	availableczcionki = {
		chalet = dxCreateFont("pliki/czcionki/font.ttf", 24 * responsiveMultiplier, false, "antialiased"),
		icons = dxCreateFont("pliki/czcionki/fontawesome.ttf", 14 * responsiveMultiplier, false, "antialiased"),
		moneyFont = dxCreateFont("pliki/czcionki/font.ttf", 40 * responsiveMultiplier, false, "antialiased")
	}
end

function destroyczcionki()
	if availableczcionki then
		for fontName, fontElement in pairs(availableczcionki) do
			destroyElement(fontElement)
			availableczcionki[fontName] = nil
		end
		
		availableczcionki = nil
	end
end

function drawTextWithBorder(text, offset, x, y, w, h, borderColor, color, ...)
	dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), x - offset, y - offset, w - offset, h - offset, borderColor or tocolor(0, 0, 0, 255), ...)
	dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), x - offset, y + offset, w - offset, h + offset, borderColor or tocolor(0, 0, 0, 255), ...)
	dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), x + offset, y - offset, w + offset, h - offset, borderColor or tocolor(0, 0, 0, 255), ...)
	dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), x + offset, y + offset, w + offset, h + offset, borderColor or tocolor(0, 0, 0, 255), ...)
	dxDrawText(text, x, y, w, h, color, ...)
end

function giveNotification(type, text)
	type = type or "info"
	
	if noticeData["timer"] then
		if isTimer(noticeData["timer"]) then
			killTimer(noticeData["timer"])
		end
	end
	
	noticeData = {
		["text"] = text,
		["type"] = type,
		["tick"] = getTickCount(),
		["state"] = "showNotice",
		["height"] = 0,
		["timer"] = nil
	}
	
	--playSoundEffect("notification.mp3")
	exports.crime_gui:addNoti(text, "info")
end

function getNavbarWidth()
	local barOffsetX = 0
		
		local textLength = dxGetTextWidth(row[1], 0.5, availableczcionki["chalet"]) + 20
		local navWidth = 0
		
		for id, icon in ipairs(row[2]) do
			local buttonWidth = 0
			
			if type(row[3]) == "string" and row[3] == "image" then
				buttonWidth = row[4]
			elseif type(row[3]) == "boolean" and row[3] then
				buttonWidth = dxGetTextWidth(availableIcons[icon], 1.0, availableczcionki["icons"]) + (20 * responsiveMultiplier)
			elseif type(row[3]) == "boolean" and not row[3] then
				buttonWidth = dxGetTextWidth(icon, 0.5, availableczcionki["chalet"]) + (10 * responsiveMultiplier)
			end
			
			navWidth = navWidth + buttonWidth + (10 * responsiveMultiplier)
		end
		
		barOffsetX = barOffsetX + (navWidth + textLength)
	
	return barOffsetX
end

function hasPlayerMoney(money)
	if getPlayerMoney(localPlayer) >= money then
		return true
	end
	
	return false
end

function drawRoundedRectangle(x, y, w, h, rounding, borderColor, bgColor, postGUI)
	borderColor = borderColor or tocolor(0, 0, 0, 200)
	bgColor = bgColor or borderColor
	rounding = rounding or 2
	
	dxDrawRectangle(x, y, w, h, bgColor, postGUI)
	dxDrawRectangle(x + rounding, y - 1, w - (rounding * 2), 1, borderColor, postGUI)
	dxDrawRectangle(x + rounding, y + h, w - (rounding * 2), 1, borderColor, postGUI)
	dxDrawRectangle(x - 1, y + rounding, 1, h - (rounding * 2), borderColor, postGUI)
	dxDrawRectangle(x + w, y + rounding, 1, h - (rounding * 2), borderColor, postGUI)
end

function showDefaultOpticalUpgrade()
	if panelState then
		if enteredVehicle then
			if equippedTuning ~= 0 then
				removeVehicleUpgrade(enteredVehicle, equippedTuning)
			elseif equippedTuning == 0 then
				removeVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[hoveredCategory])
			end
		end
	end
end

function showNextOpticalUpgrade()
	if panelState then
		if enteredVehicle then
			addVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[hoveredCategory - 1])
		end
	end
end

function resetOpticalUpgrade()
	if panelState then
		if enteredVehicle then
			if equippedTuning ~= 0 then
				addVehicleUpgrade(enteredVehicle, equippedTuning)
			else
				if hoveredCategory - 1 == 0 then
					removeVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[hoveredCategory])
				else
					removeVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[hoveredCategory - 1])
				end
			end
		end
	end
end

function formatNumber(amount, spacer)
	if not spacer then
		spacer = ","
	end
	
	amount = math.floor(amount)
	
	local left, num, right = string.match(tostring(amount), "^([^%d]*%d)(%d*)(.-)$")
	return left .. (num:reverse():gsub("(%d%d%d)", "%1" .. spacer):reverse()) .. right
end

function playSoundEffect(soundFile)
	if soundFile then
		local soundEffect = playSound("pliki/dzwieki/" .. soundFile, false)
		
		setSoundVolume(soundEffect, 0.5)
	end
end

function getPositionFromElementOffset(element, offsetX, offsetY, offsetZ)
	local elementMatrix = getElementMatrix(element)
    local elementX = offsetX * elementMatrix[1][1] + offsetY * elementMatrix[2][1] + offsetZ * elementMatrix[3][1] + elementMatrix[4][1]
    local elementY = offsetX * elementMatrix[1][2] + offsetY * elementMatrix[2][2] + offsetZ * elementMatrix[3][2] + elementMatrix[4][2]
    local elementZ = offsetX * elementMatrix[1][3] + offsetY * elementMatrix[2][3] + offsetZ * elementMatrix[3][3] + elementMatrix[4][3]
	
    return elementX, elementY, elementZ
end

function getVehicleOffroadAbility(vehicle)
	if vehicle then
		local flags = getVehicleHandling(vehicle)["handlingFlags"]
		
		for name, flag in pairs(availableOffroadAbilities) do
			if isFlagSet(flags, flag[1]) then
				return flag[2]
			end
		end
		
		return 1
	end
end

function getVehicleWheelSize(vehicle, side)
	if vehicle and side then
		local flags = getVehicleHandling(vehicle)["handlingFlags"]
		
		for name, flag in pairs(availableWheelSizes[side]) do
			if isFlagSet(flags, flag[1]) then
				return flag[2]
			end
		end
		
		return 3
	end
end

function isGTAUpgradeSlot(slot)
	if slot then
		for i = 0, 16 do
			if slot == i then
				return true
			end
		end
	end
	
	return false
end

function isFlagSet(val, flag)
	return (bitAnd(val, flag) == flag)
end

function moveCameraToComponent(component, offsetX, offsetZ, zoom)
	if component then
		local _, _, vehicleRotation = getElementRotation(enteredVehicle)
		
		offsetX = offsetX or cameraSettings["defaultX"]
		offsetZ = offsetZ or 15
		zoom = zoom or 9
		
		local cameraRotation = vehicleRotation + offsetX
		
		cameraSettings["moveState"] = "moveToElement"
		cameraSettings["moveTick"] = getTickCount()
		cameraSettings["viewingElement"] = component
		cameraSettings["currentX"] = math.rad(cameraRotation)
		cameraSettings["currentY"] = math.rad(cameraRotation)
		cameraSettings["currentZ"] = math.rad(offsetZ)
		cameraSettings["distance"] = zoom
	end
end

function moveCameraToDefaultPosition()
	cameraSettings["moveState"] = "backToVehicle"
	cameraSettings["moveTick"] = getTickCount()
	cameraSettings["viewingElement"] = enteredVehicle
	
	cameraSettings["currentX"] = cameraSettings["defaultX"]
	cameraSettings["currentY"] = cameraSettings["defaultX"]
	cameraSettings["currentZ"] = math.rad(15)
	cameraSettings["distance"] = 9
end

function _getCameraPosition(element)
	if element == "component" then
		local componentX, componentY, componentZ = getVehicleComponentPosition(enteredVehicle, cameraSettings["viewingElement"])
		local elementX, elementY, elementZ = getPositionFromElementOffset(enteredVehicle, componentX, componentY, componentZ)
		local elementZ = elementZ + 0.2
		
		local cameraX = elementX + math.cos(cameraSettings["currentX"]) * cameraSettings["distance"]
		local cameraY = elementY + math.sin(cameraSettings["currentY"]) * cameraSettings["distance"]
		local cameraZ = elementZ + math.sin(cameraSettings["currentZ"]) * cameraSettings["distance"]
		
		return cameraX, cameraY, cameraZ, elementX, elementY, elementZ
	elseif element == "vehicle" then
		local elementX, elementY, elementZ = getElementPosition(enteredVehicle)
		local elementZ = elementZ + 0.2
		
		local cameraX = elementX + math.cos(cameraSettings["currentX"]) * cameraSettings["distance"]
		local cameraY = elementY + math.sin(cameraSettings["currentY"]) * cameraSettings["distance"]
		local cameraZ = elementZ + math.sin(cameraSettings["currentZ"]) * cameraSettings["distance"]
		
		return cameraX, cameraY, cameraZ, elementX, elementY, elementZ
	elseif element == "both" then
		if type(cameraSettings["viewingElement"]) == "string" then
			local componentX, componentY, componentZ = getVehicleComponentPosition(enteredVehicle, cameraSettings["viewingElement"])
			
			elementX, elementY, elementZ = getPositionFromElementOffset(enteredVehicle, componentX, componentY, componentZ)
		else
			elementX, elementY, elementZ = getElementPosition(enteredVehicle)
		end
		
		local elementZ = elementZ + 0.2
		
		local cameraX = elementX + math.cos(cameraSettings["currentX"]) * cameraSettings["distance"]
		local cameraY = elementY + math.sin(cameraSettings["currentY"]) * cameraSettings["distance"]
		local cameraZ = elementZ + math.sin(cameraSettings["currentZ"]) * cameraSettings["distance"]
		
		return cameraX, cameraY, cameraZ, elementX, elementY, elementZ
	end
end

function isValidComponent(vehicle, componentName)
	if vehicle and componentName then
		for component in pairs(getVehicleComponents(vehicle)) do
			if componentName == component then
				return true
			end
		end
	end
	
	return false
end

function setVehicleColorsToDefault()
	local vehicleColor = savedVehicleColors["all"]
	local vehicleLightColor = savedVehicleColors["headlight"]
	
	setVehicleColor(enteredVehicle, vehicleColor[1], vehicleColor[2], vehicleColor[3], vehicleColor[4], vehicleColor[5], vehicleColor[6], vehicleColor[7], vehicleColor[8], vehicleColor[9], vehicleColor[10], vehicleColor[11], vehicleColor[12])
	setVehicleHeadLightColor(enteredVehicle, vehicleLightColor[1], vehicleLightColor[2], vehicleLightColor[3])
end

function setCameraAndComponentVisible()
	if getVehicleType(enteredVehicle) == "Automobile" then
		if loopTable[hoveredCategory]["cameraSettings"] then
			local cameraSetting = loopTable[hoveredCategory]["cameraSettings"]
		
			if isValidComponent(enteredVehicle, cameraSetting[1]) then
				moveCameraToComponent(cameraSetting[1], cameraSetting[2], cameraSetting[3], cameraSetting[4])
			end
			
			if cameraSetting[5] then
				setVehicleComponentVisible(enteredVehicle, cameraSetting[1], false)
			end
		end
	end
end

function generateString(len)
	if tonumber(len) then
		local allowed = {{48, 57}, {97, 122}}
		
		math.randomseed(getTickCount())

		local str = ""
		
		for i = 1, len do
			local charlist = allowed[math.random(1, 2)]
			
			if i == 4 then
				str = str .. " "
			else
				str = str .. string.char(math.random(charlist[1], charlist[2]))
			end
		end

		return utf8.upper(str)
	end

	return false
end

function isComponentCompatible(vehicle, vehicleType)
	if vehicle and vehicleType then
		if type(vehicleType) == "string" then
			if getVehicleType(vehicle) == vehicleType then
				return true
			else
				giveNotification("error", getLocalizedText("notification.error.notCompatible", loopTable[hoveredCategory]["categoryName"]))
			end
		elseif type(vehicleType) == "table" then
			local typeFounded = false
			
			for _, modelType in pairs(vehicleType) do
				if modelType == getVehicleType(vehicle) then
					typeFounded = true
				end
			end
			
			if typeFounded then
				return true
			else
				giveNotification("error", getLocalizedText("notification.error.notCompatible", loopTable[hoveredCategory]["categoryName"]))
			end
		end
	end
	
	return false
end

function drawBorder(x, y, w, h, size, color, postGUI)
	size = size or 2
	
	dxDrawRectangle(x - size, y, size, h, color or tocolor(0, 0, 0, 200), postGUI)
	dxDrawRectangle(x + w, y, size, h, color or tocolor(0, 0, 0, 200), postGUI)
	dxDrawRectangle(x - size, y - size, w + (size * 2), size, color or tocolor(0, 0, 0, 200), postGUI)
	dxDrawRectangle(x - size, y + h, w + (size * 2), size, color or tocolor(0, 0, 0, 200), postGUI)
end

function drawBorderedRectangle(x, y, w, h, borderSize, borderColor, bgColor, postGUI)
	borderSize = borderSize or 2
	borderColor = borderColor or tocolor(0, 0, 0, 200)
	bgColor = bgColor or borderColor
	
	dxDrawRectangle(x, y, w, h, bgColor, postGUI)
	drawBorder(x, y, w, h, borderSize, borderColor, postGUI)
end



local oldDoorRatios = {}
local doorStatus = {}
local doorTimers = {}
local vehiclesWithScissorDoor = {}
local doorAnimTime = 250

addEventHandler("onClientResourceStart", resourceRoot, function()
	for _, vehicle in pairs(getElementsByType("vehicle")) do
		if isElementStreamedIn(vehicle) then
			if getElementData(vehicle, "tuning.lsdDoor") then
				vehiclesWithScissorDoor[vehicle] = true
			end
		end
	end
end)

addEventHandler("onClientElementDestroy", root, function()
	removeVehicleFromTable(source)
end)

addEventHandler("onClientElementStreamOut", root, function()
	removeVehicleFromTable(source)
end)

addEventHandler("onClientVehicleExplode", root, function()
	removeVehicleFromTable(source)
end)

addEventHandler("onClientElementStreamIn", root, function()
	if isVehicle(source) then
		if getElementData(source, "tuning.lsdDoor") then
			vehiclesWithScissorDoor[source] = true
		end
	end
end)

addEventHandler("onClientElementDataChange", root, function(data)
	if isVehicle(source) then
		if data == "tuning.lsdDoor" then
			if isElementStreamedIn(source) then
				vehiclesWithScissorDoor[source] = getElementData(source, "tuning.lsdDoor")
				
				if not vehiclesWithScissorDoor[source] then
					removeVehicleFromTable(source)
				end
			end
		end
	end
end)

addEventHandler("onClientPreRender", root, function()
	for vehicle in pairs(vehiclesWithScissorDoor) do
		if isElement(vehicle) then
			if not doorTimers[vehicle] then
				doorTimers[vehicle] = {}
			end
			
			local doorRatios = {}
			
			for i = 1, 4 do
				local i = i + 1
				local doorRatio = getVehicleDoorOpenRatio(vehicle, i)
 
				if doorRatio and oldDoorRatios[vehicle] and oldDoorRatios[vehicle][i] then
					local oldDoorRatio = oldDoorRatios[vehicle][i]
 
					if not doorStatus[vehicle] then
						doorStatus[vehicle] = {}
					end
					
					local doorPreviousState = doorStatus[vehicle][i]
					
					if not doorPreviousState then
						doorPreviousState = "closed"
					end
					
					if doorPreviousState == "closed" and doorRatio > oldDoorRatio then
						doorStatus[vehicle][i] = "opening"
						doorTimers[vehicle][i] = setTimer(function(vehicle,i)
							doorStatus[vehicle][i] = "open"
							doorTimers[vehicle][i] = nil
						end, doorAnimTime, 1, vehicle, i)
					elseif doorPreviousState == "open" and doorRatio < oldDoorRatio then
						doorStatus[vehicle][i] = "closing"
						doorTimers[vehicle][i] = setTimer(function(vehicle, i)
							doorStatus[vehicle][i] = "closed"
							doorTimers[vehicle][i] = nil
						end, doorAnimTime, 1, vehicle, i)
					end
				elseif not oldDoorRatios[vehicle] then
					oldDoorRatios[vehicle] = {}
				end
				
				if doorRatio then
					oldDoorRatios[vehicle][i] = doorRatio
				end
			end
		else
			vehiclesWithScissorDoor[vehicle] = nil
			oldDoorRatios[vehicle] = nil
			doorStatus[vehicle] = nil
			doorTimers[vehicle] = nil
		end
	end
	
	for vehicle, doors in pairs(doorStatus) do
		if vehiclesWithScissorDoor[vehicle] then
			local doorX, doorY, doorZ = -72, -25, 0
			
			for door, status in pairs(doors) do
				local ratio = 0
				
				if status == "open" then
					ratio = 1
				end
				
				local doorTimer = doorTimers[vehicle][door]
				
				if doorTimer and isTimer(doorTimer) then
					local timeLeft = getTimerDetails(doorTimer)
					
					ratio = timeLeft / doorAnimTime
					
					if status == "opening" then
						ratio = 1 - ratio
					end
				end
				
				local dummyName = (door == 2 and "door_lf_dummy") or (door == 3 and "door_rf_dummy")
				
				if dummyName then
					local doorX, doorY, doorZ = doorX * ratio, doorY * ratio, doorZ * ratio
					
					if string.find(dummyName, "rf") then
						doorY, doorZ = doorY * -1, doorZ * -1
					end
					
					setVehicleComponentRotation(vehicle, dummyName, doorX, doorY, doorZ)
				end
			end
		end
	end
end)

addEventHandler("onClientVehicleDamage", root, function()
	local leftDoor = getVehicleDoorState(source, 2)
	local rightDoor = getVehicleDoorState(source, 3)
	
	if leftDoor == 1 then
		setVehicleDoorOpenRatio(source, 2, 0, 500)
	end
	
	if rightDoor == 1 then
		setVehicleDoorOpenRatio(source, 3, 0, 500)
	end
end)

function setVehicleDoorToLSD(vehicle, state)
	if isVehicle(vehicle) then
		setElementData(vehicle, "tuning.lsdDoor", state, true)
		setElementData(vehicle, "vehicle:drzwidogory", 1)
	
		if not state then
			removeVehicleFromTable(vehicle)
			resetVehicleComponentRotation(vehicle, "door_lf_dummy")
			resetVehicleComponentRotation(vehicle, "door_rf_dummy")
			vehiclesWithScissorDoor[vehicle] = false
		else
			vehiclesWithScissorDoor[vehicle] = true
		end
	end
end

function removeVehicleFromTable(vehicle)
	if isVehicle(vehicle) then
		oldDoorRatios[vehicle] = nil
		doorStatus[vehicle] = nil
		doorTimers[vehicle] = nil
		vehiclesWithScissorDoor[vehicle] = nil
	end
end

function isVehicle(vehicle)
	if vehicle and isElement(vehicle) and getElementType(vehicle) == "vehicle" then
		return true
	end
end



function formatujnaprzecinki(amount) 
	local formatted = amount 
	while true do   
	  formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2') 
	  if (k==0) then 
		break 
	  end 
	end 
	return formatted 
  end