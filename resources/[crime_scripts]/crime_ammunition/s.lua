--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local cub = createColCuboid (2281.8491210938, -1961.7932128906, 11.89687538147,9,16.5,6)
local cubsapd = createColCuboid (-1348.11, 2457.25, 83.43,70,100,13)



function strzelnicawlazl (plr)
	if getElementType ( plr ) == "player" then
		triggerClientEvent(plr, "addNoti", plr, "Wchodzisz na strzelnice.", "info" )
		setElementData(plr,"wstrzelnicy",true)
		if not getElementData(plr,"player:duty") then 
			toggleControl(plr,"fire", true )
			toggleControl(plr,"aim_weapon", true)
			toggleControl(plr,"vehicle_fire", true)
			toggleControl(plr,"vehicle_secondary_fire", true)
			toggleControl(plr,"action", true)
			--if getElementData(plr,"player:admin") then toggleControl(plr,"aim_weapon", true) end 
		end
    end
end
addEventHandler ( "onColShapeHit", cub, strzelnicawlazl )
addEventHandler ( "onColShapeHit", cubsapd, strzelnicawlazl )

function strzelnicawylazl (plr)
	if getElementType ( plr ) == "player" then 
		triggerClientEvent(plr, "addNoti", plr, "Wychodzisz ze strzelnicy.", "info" )
		setElementData(plr,"wstrzelnicy",false)
		if not getElementData(plr,"player:duty") then 
			toggleControl(plr,"fire", false )
			toggleControl(plr,"aim_weapon", false)
			toggleControl(plr,"vehicle_fire", false)
			toggleControl(plr,"vehicle_secondary_fire", false)
			toggleControl(plr,"action", false)
			--if getElementData(plr,"player:admin") then toggleControl(plr,"aim_weapon", true) end
		end
    end
end
addEventHandler ( "onColShapeLeave", cub, strzelnicawylazl )
addEventHandler ( "onColShapeLeave", cubsapd, strzelnicawylazl )