--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function playMySound(plr)
	local veh=getPedOccupiedVehicle(plr)
	local seat=getPedOccupiedVehicleSeat(plr)
	if veh then
		if seat == 0 then
			triggerClientEvent("dajklaksona", root, veh, veh, "dej") 
		end
	end
end

function stopMySound(plr)
	local veh=getPedOccupiedVehicle(plr)
	local seat=getPedOccupiedVehicleSeat(plr)
	if veh then
		if seat == 0 then
			triggerClientEvent("dajklaksona", root, veh, veh, "niedej") 
		end
	end
end

local players = getElementsByType("player") 
for index, player in pairs(players) do 
	--toggleControl(player, 'horn', false )
	bindKey(player, "h", "down", playMySound)
	bindKey(player, "h", "up", stopMySound)
end 

function taakxd () 
    --toggleControl(source, 'horn', false )
	bindKey(source, "h", "down", playMySound) 
	bindKey(source, "h", "up", stopMySound)
end 
addEventHandler("onPlayerJoin",root, taakxd) 


--[[
function redskill(plr,cmd)
	if getElementData(plr,"player:uid") == 1 then 
		setTimer ( function()
			local r = math.random(0,255)
			local g = math.random(0,255)
			local b = math.random(0,255)
			local veh = getPedOccupiedVehicle(plr)
			if veh then 
				setVehicleColor(veh,r,g,b,r,g,b,r,g,b,r,g,b)
				setVehicleHeadLightColor(veh,r,g,b)
			end
		end, 50, 0)
	end
end
addCommandHandler("redskilltykurwoxd",redskill)
]]--