--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local vehiclesWithPaintjob = {}

addEventHandler("onClientResourceStart", resourceRoot, function()
	for _, vehicle in ipairs(getElementsByType("vehicle", root, true)) do
		local isVehicleHavePaintjob = getElementData(vehicle, "vehicle.paintjob") or 0
		
		if isVehicleHavePaintjob ~= 0 then
			addVehiclePaintjob(vehicle, isVehicleHavePaintjob)
		end
	end
end)

addEvent("paintjob->TryToAddToVehicle", true)
addEventHandler("paintjob->TryToAddToVehicle", root, function(vehicle, paintjobID)
	if vehicle then
		if paintjobID and paintjobID ~= 0 then
			addVehiclePaintjob(vehicle, paintjobID)
		end
		if paintjobID and paintjobID == "stary" then
			removeVehiclePaintjob(vehicle)
		end
	end
end)

addEventHandler("onClientElementStreamIn", root, function()
	if getElementType(source) == "vehicle" then
		local isVehicleHavePaintjob = getElementData(source, "vehicle.paintjob") or 0
		
		if isVehicleHavePaintjob ~= 0 then
			addVehiclePaintjob(source, isVehicleHavePaintjob)
		end
	end
end)

addEventHandler("onClientElementStreamOut", root, function()
	if getElementType(source) == "vehicle" then
		local isVehicleHavePaintjob = getElementData(source, "vehicle.paintjob") or 0
		
		if isVehicleHavePaintjob ~= 0 then
			removeVehiclePaintjob(source)
		end
	end
end)

addEventHandler("onClientElementDestroy", root, function()
	if getElementType(source) == "vehicle" then
		local isVehicleHavePaintjob = getElementData(source, "vehicle.paintjob") or 0
		
		if isVehicleHavePaintjob ~= 0 then
			removeVehiclePaintjob(source)
		end
	end
end)

local texturegrun = {
			"predator92body128", "monsterb92body256a", "monstera92body256a", "andromeda92wing","fcr90092body128",
			"hotknifebody128b", "hotknifebody128a", "rcbaron92texpage64", "rcgoblin92texpage128", "rcraider92texpage128", 
			"rctiger92body128","rhino92texpage256", "petrotr92interior128","artict1logos","rumpo92adverts256","dash92interior128",
			"coach92interior128","combinetexpage128","hotdog92body256",
			"raindance92body128", "cargobob92body256", "andromeda92body", "at400_92_256", "nevada92body256",
			"polmavbody128a" , "sparrow92body128" , "hunterbody8bit256a" , "seasparrow92floats64" , 
			"dodo92body8bit256" , "cropdustbody256", "beagle256", "hydrabody256", "rustler92body256", 
			"shamalbody256", "skimmer92body128", "stunt256", "maverick92body128", "leviathnbody8bit256" }

function addVehiclePaintjob(vehicle, paintjobID)
	if vehicle and paintjobID then
			removeVehiclePaintjob(vehicle)
			
			vehiclesWithPaintjob[vehicle] = {}
			vehiclesWithPaintjob[vehicle][1] = dxCreateShader("files/textureChanger.fx", 0, 100, false, "vehicle")
			if vehicle then 
				if getElementData(vehicle,"vehicle:karbon") == 1 then 
					vehiclesWithPaintjob[vehicle][2] = dxCreateTexture("files/karbon.png")
					if getElementData(vehicle,"vehicle:cpj") == 1 then 
						local ajdi = getElementData(vehicle,"vehicle:id")
						if ajdi then 
							if fileExists("files/"..getElementData(vehicle,"vehicle:id")..".png") then
								vehiclesWithPaintjob[vehicle][2] = dxCreateTexture("files/"..getElementData(vehicle,"vehicle:id")..".png")
							end 
						end
						if getElementData(vehicle,"vehicle:job") == "elektryk" then 
							vehiclesWithPaintjob[vehicle][2] = dxCreateTexture("files/elektryk.png")
						end
					end
				else 
					if getElementData(vehicle,"vehicle:cpj") == 1 then 
						local ajdi = getElementData(vehicle,"vehicle:id")
						if ajdi then
							if fileExists("files/"..getElementData(vehicle,"vehicle:id")..".png") then
								vehiclesWithPaintjob[vehicle][2] = dxCreateTexture("files/"..getElementData(vehicle,"vehicle:id")..".png")
							end
						end
						if getElementData(vehicle,"vehicle:job") == "elektryk" then 
							vehiclesWithPaintjob[vehicle][2] = dxCreateTexture("files/elektryk.png")
						end
					end
				end
			end
			
			if vehiclesWithPaintjob[vehicle][1] and vehiclesWithPaintjob[vehicle][2] then
				dxSetShaderValue(vehiclesWithPaintjob[vehicle][1], "TEXTURE", vehiclesWithPaintjob[vehicle][2])
				engineApplyShaderToWorldTexture(vehiclesWithPaintjob[vehicle][1], "*vehiclegrunge256*", vehicle)
				engineApplyShaderToWorldTexture ( vehiclesWithPaintjob[vehicle][1], "?emap*", vehicle)
				
				for _,addList in ipairs(texturegrun) do
					engineApplyShaderToWorldTexture(vehiclesWithPaintjob[vehicle][1], addList, vehicle )
				end
				
				
			else
				--outputDebugString("[PAINTJOB]: Shader or Texture create failed!", 3)
			end
	end
end

function removeVehiclePaintjob(vehicle)
	if vehicle then
		if vehiclesWithPaintjob[vehicle] then
			destroyElement(vehiclesWithPaintjob[vehicle][1])
			if vehiclesWithPaintjob[vehicle][2] then
				destroyElement(vehiclesWithPaintjob[vehicle][2])
			end
			vehiclesWithPaintjob[vehicle] = nil
		end
	end
end