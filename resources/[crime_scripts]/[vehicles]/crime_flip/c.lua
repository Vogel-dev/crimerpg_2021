--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
guisad = false
spacje = 0

local dxfont0_PantonBold = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 19/zmienna)

function gui()
	if guisad == true then
		dxDrawImage(664/zmienna, 972/zmienna, 627/zmienna, 91/zmienna, ":crime_flip/spacja.png", 0, 0, 0, tocolor(200, 200, 200, 255), false)
		if getKeyState("space") == true then
			dxDrawImage(664/zmienna, 972/zmienna, 627/zmienna, 91/zmienna, ":crime_flip/spacja.png", 0, 0, 0, tocolor(90, 55, 150, 255), false)
		end
		exports["crime_gui"]:guitext("Klikaj #5a3795spację#FFFFFF, aby obrócić pojazd\n#5a3795"..spacje.."#FFFFFF/25", 664/zmienna, 900/zmienna, 1291/zmienna, 982/zmienna, 200, 200, 200, 255, dxfont0_PantonBold)
	end
end

function sprawdzse()
	if getPedOccupiedVehicle(localPlayer) then 
		if getPedOccupiedVehicleSeat(localPlayer) == 0 then
			local veh = getPedOccupiedVehicle(localPlayer)
			if getElementData(veh,"derby") == true then return end
			local rx,ry,rz = getElementRotation(veh)
			if rx > 160 and rx < 200 then 
				if guisad == false then 
					spacje = 0
					addEventHandler("onClientRender", root, gui)
					guisad = true
				end
			else
				if guisad == true then 
					removeEventHandler("onClientRender", root, gui)
					guisad = false
				end
			end
		end
	end
end
setTimer(sprawdzse,500,0)

function spacjuje()
	if guisad == true then 
		spacje = spacje+1
		if spacje >= 25 then 
			spacje = 0
			removeEventHandler("onClientRender", root, gui)
			guisad = false
			obrocfure()
		end
	end
end
bindKey("space","down",spacjuje)

function obrocfure()
	if getPedOccupiedVehicle(localPlayer) then 
		if getPedOccupiedVehicleSeat(localPlayer) == 0 then
			local veh = getPedOccupiedVehicle(localPlayer)
			setElementFrozen(veh,true)
			setTimer(function()
				local x,y,z = getElementPosition(veh)
				setElementPosition(veh,x,y,z+0.08)
				local rx,ry,rz = getElementRotation(veh)
				setElementRotation(veh,rx+3,ry,rz)
			end, 10, 60)
			setTimer(function()
				setTimer(function()
					local x,y,z = getElementPosition(veh)
					setElementPosition(veh,x,y,z-0.08)
				end, 10, 60)
				setTimer(function()
					setElementFrozen(veh,false)
					setVehicleEngineState(veh,true)
				end, 1000, 1)
			end, 400, 1)

		end
	end
end