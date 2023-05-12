--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEventHandler( "onClientElementStreamIn", root,
    function ( )
        if getElementType( source ) == "object" then
			setObjectBreakable(source, false)
		end
end)
addEvent("setBreakable",true)
addEventHandler("setBreakable",root,function(obj)
setObjectBreakable(obj, false)
end)


addEvent("addNotification",true)
addEventHandler("addNotification",root,function(tekst,typ)
if not tekst then return end
if not typ then return end
outputChatBox(tekst)
end)

addEvent("addNotificatione",true)
addEventHandler("addNotificatione",root,function(tekst,typ)
if not tekst then return end
if not typ then return end
end)


function stopMinigunDamage ( attacker, weapon, bodypart )
	if ( weapon == 0 ) then 
		cancelEvent()
	end
end

function nodamage(attacker, bodypart)
	if not attacker then return end
	if getElementType(attacker) == 'vehicle' then
		cancelEvent()
	end
end

--[[
function blokada ( prevSlot, newSlot )
	if getElementData(getLocalPlayer(),"player:admin") == true then
		toggleControl ( "fire", true )
		toggleControl("aim_weapon", true)
	else
		toggleControl ( "fire", false )
		toggleControl("aim_weapon", false)
	end
	
	if getElementData(getLocalPlayer(),"player:frakcjaduty") == true then
		toggleControl ( "fire", true )
		toggleControl("aim_weapon", true)
	end
	
	if getPedWeapon(getLocalPlayer(),newSlot) == 22 then
		toggleControl ("fire", false ) 
		toggleControl("aim_weapon", true)
	end
	
end
addEventHandler ( "onClientPlayerWeaponSwitch", getRootElement(), blokada )]]--

setTimer(function()
local czas=tonumber(getElementData(localPlayer, "player:online"))
if not czas then return end
setElementData(localPlayer, "player:online", czas+1)
end, 60000, 0)

addEvent("core:blipyaut", true)
addEventHandler("core:blipyaut", root, function(plr)
if plr ~= localPlayer then return end
local uid=getElementData(plr,"player:uid")
for id, veh in ipairs( getElementsByType ( "vehicle" ) ) do
if uid == getElementData(veh,"vehicle:ownedPlayer") then
--createBlipAttachedTo(veh,0,0,5000,0,0.3,0,255,0,255,1,99999)
end
end
end)
function destroyBlipsAttachedTo(elemente)
	local attached = getAttachedElements ( elemente )
	if ( attached ) then
		for k,element in ipairs(attached) do
			if getElementType ( element ) == "blip" then
				destroyElement ( element )
			end
		end
	end
end
function veh_blips()
    for i,v in pairs(getElementsByType("vehicle")) do
        if getElementData(v,"vehicle:spawn") == true then
            if getElementData(v,"vehicle:ownedPlayer") == getElementData(localPlayer,"player:uid") then
				--createBlipAttachedTo(v,0,1,255,0,0,255,1,9999)
            end
			local rent = getElementData(v,"vehicle:rent")
			if rent and (type(rent) == "table") then
				for i,s in pairs(rent) do
					if tonumber(s) == getElementData(localPlayer,"player:uid") then
						--createBlipAttachedTo(v,0,1,0,0,255,255,1,9999)
					end
				end
			end
        end
    end
end
setTimer(veh_blips,10000,0)
addEventHandler("onClientElementDestroy", root, function ()
	if getElementType(source) == "vehicle" then
	destroyBlipsAttachedTo(source)
	end
end)
addEventHandler ( "onClientElementDataChange", root,
function ( dataName )
	if getElementType ( source ) == "vehicle" and dataName == "vehicle:ownedPlayer" then
		destroyBlipsAttachedTo(source)
	end
	if getElementType ( source ) == "vehicle" and dataName == "vehicle:rent" then
		destroyBlipsAttachedTo(source)
	end
end )

setTimer(function()
local czas=tonumber(getElementData(localPlayer, "player:hours"))
if not czas then return end
setElementData(localPlayer, "player:hours", czas+1)
end, 60000, 0)


function cancelPedDamage ( attacker )
	cancelEvent() -- cancel any damage done to peds
end
addEventHandler ( "onClientPedDamage", getRootElement(), cancelPedDamage )




