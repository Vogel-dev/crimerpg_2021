--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx

local light = dxCreateTexture("img/light.png", "argb")
local iconfont = dxCreateFont ( ":crime_files/fontawesome/FA5.ttf" ,110/zmienna)
local textfont = dxCreateFont ( ":crime_files/fonts/FiraEC.ttf" ,23/zmienna)
local distance = 100


addEventHandler("onClientRender", root, function()
	for i, v in ipairs(getElementsByType("marker")) do
		if getElementData(v, "mpod") then
			local x, y, z = getElementPosition(v)
			local sy, sx = getScreenFromWorldPosition(x, y, z + 1)
			if not sy then sy = 0 end 
			if not sx then sx = 0 end
			local rootx, rooty, rootz = getCameraMatrix()
			local x2, y2, z2 = getElementPosition(localPlayer)
			local r, g, b, a = getMarkerColor(v)
			local size = getMarkerSize(v)/1.5
			local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
			if getElementData(v, "mtype") == "praca" then
				distance = 10000
			else 
				distance = 100
			end
			if (distanceBetweenPoints < distance) then 
				sadstory = 0.5/(distanceBetweenPoints/10)
				if sadstory > 0.5 then sadstory = 0.5 end
				sadstory2 = 150/(distanceBetweenPoints/10)
				if sadstory2 > 150 then sadstory2 = 150 end

				if getElementData(v, "mtype") == "praca" then
					sadstory = 0.25/(distanceBetweenPoints/10)
					if sadstory < 0.25 then sadstory = 0.25 end
					if distanceBetweenPoints < 5 then 
						sadstory = 0.5
					end
				end

				if getElementDimension(localPlayer) == getElementDimension(v) then 
					if getElementInterior(localPlayer) == getElementInterior(v) then 
						if getElementData(v,"mtekst") == "Odłóż towar" then 
							if getElementData(v, "mtype") == "praca" then
								czystalinia = processLineOfSight (rootx,rooty,rootz,x,y,z+1,false,false,false,false,false)
							else
								czystalinia = processLineOfSight (rootx,rooty,rootz,x,y,z+1,true,false,false,false)
							end
						else 
							if getElementData(v, "mtype") == "praca" then
								czystalinia = processLineOfSight (rootx,rooty,rootz,x,y,z+1,false,false,false,false,false)
							else
								czystalinia = processLineOfSight (rootx,rooty,rootz,x,y,z+1,true,false,false,true)
							end
						end
						if czystalinia == false then
							if sy <= 0 then sy = -50 end
							dxDrawMaterialLine3D(x+size, y+size, z+0.04, x-size, y-size, z+0.04, light, size*3, tocolor(r,g,b, 155),x,y,z)
							if getElementData(v,"mtekst") and string.find(getElementData(v,"mtekst"),"Wejście") then setElementData(v,"mikona","") end
							if getElementData(v,"mtekst") and string.find(getElementData(v,"mtekst"),"Wyjście") then setElementData(v,"mikona","") end
							if getElementData(v,"mikona") then 
								dxDrawText(getElementData(v,"mikona"), sy+1, sx-sadstory2+1, sy+1, sx+1, tocolor(0, 0, 0, 255), sadstory, iconfont, "center", "center", false)
								dxDrawText(getElementData(v,"mikona"), sy, sx-sadstory2, sy, sx, tocolor(r, g, b, 255), sadstory, iconfont, "center", "center", false)
							end

							if getElementData(v,"mtekst") then 
								if getElementData(v, "mtype") == "praca" then
									dxDrawText(math.floor(distanceBetweenPoints).." m", sy+1, sx-sadstory2+151, sy+1, sx+1, tocolor(0, 0, 0, 255), sadstory, textfont, "center", "center", false)
									dxDrawText(math.floor(distanceBetweenPoints).." m", sy, sx-sadstory2+150, sy, sx, tocolor(200, 200, 200, 255), sadstory, textfont, "center", "center", false)
								else
									dxDrawText(getElementData(v,"mtekst"), sy+1, sx-sadstory2+151, sy+1, sx+1, tocolor(0, 0, 0, 255), sadstory, textfont, "center", "center", false)
									dxDrawText(getElementData(v,"mtekst"), sy, sx-sadstory2+150, sy, sx, tocolor(200, 200, 200, 255), sadstory, textfont, "center", "center", false)
								end
							end
						end
					end
				end
			end
		end
	end
end)