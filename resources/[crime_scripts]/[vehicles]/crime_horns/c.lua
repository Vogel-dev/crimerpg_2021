--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent( "dajklaksona", true ) 
addEventHandler( "dajklaksona", getRootElement(), function(veh,costamsad,costam) 
    local x,y,z = getElementPosition(veh) 
	local klakson = getElementData(veh,"vehicle:klakson")
	if not klakson then klakson = 1 end
	if klakson then
		if costam == "dej" then 
			if getVehicleOccupant(veh,0) then 
				if getElementData(veh,"vehicle:duty") == "SAPD" then 
					dzwiek = playSound3D("police.wav", x, y, z, false,true ) 
					setSoundVolume(dzwiek,10)
				else 
					dzwiek = playSound3D(klakson..".wav", x, y, z, false,true ) 
				end
				attachElements(dzwiek,veh,0,0,0)
				setSoundMaxDistance( dzwiek, 80 ) 
			end
		elseif costam == "niedej" then 
			if isElement(dzwiek) then 
				stopSound(dzwiek)
			end
		end
	end
end ) 

setWorldSoundEnabled ( 17, -1, false )