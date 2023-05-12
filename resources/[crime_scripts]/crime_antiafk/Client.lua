--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

-------------- CHANGEABLE
NumToCount = 10 -- the number to count before the player get killed / kicked
MSGtoShow = "Posiadasz status AFK" -- the Message to show
CountSpeed = 1500 -- less number will be faster.
-------------- UNCHANGEABLE
rRoot = getResourceRootElement(getThisResource()) -- Resource Root ,,
setElementData(getLocalPlayer(),"AFKtime",0) -- Rest AFK Times For Player
setElementData(localPlayer,"State-AFK",false)
--- DX ---
sw, sh = guiGetScreenSize() -- Get The Screen Size
x,y = sw/2,sh/2 -- Using Math to Set The Text in center

addEvent("YouAreAFK",true) -- AFK Message Event
addEventHandler("YouAreAFK",root, -- AFK Message Event Handler
function() -- AFK Message Function
	function You() -- AFK Message Function

	--dxDrawText(  MSGtoShow, x-700,y-497,sw,sh,tocolor ( 0, 0, 0, 255 ), 4, "pricedown","center", "center", false, false, false)-- AFK Message Shaddow
	--dxDrawText( MSGtoShow, x-700,y-500,sw,sh,tocolor ( 255, 0, 0, 255 ), 4, "pricedown","center", "center", false, false, false)-- AFK Message

	end -- END of AFK Message Function
addEventHandler ( "onClientRender",root,You) -- AFK Message Event Handler
Count() -- Kill Player Counting Trigger
end )

function Count()-- Counting
-- Count --
		local n = NumToCount -- Count Number
		local count = ""..n.."" -- Count Number
		local x,y = sw/2,sh/2 -- Center Text

		function txt()
			--dxDrawText(" Zostaniesz wyrzucony za "..count.." sekund", x-700,y-292,sw,sh,tocolor ( 0, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false) -- Counting DX
			--dxDrawText(" Zostaniesz wyrzucony za "..count.." sekund", x-700,y-295,sw,sh,tocolor ( 179, 179, 179, 255 ), 1, "pricedown","center", "center", false, false, false)-- Counting DX
			
			--dxDrawText(" Porusz sie aby anulowac", x-700,y-241,sw,sh,tocolor ( 0, 0, 0, 255 ), 1, "pricedown","center", "center", false, false, false)-- Text DX
			--dxDrawText(" Porusz sie aby anulowac", x-700,y-243,sw,sh,tocolor ( 179, 179, 179, 255 ), 1, "pricedown","center", "center", false, false, false)-- Text DX
		end
		
		addEventHandler ( "onClientRender" , root ,txt)-- Adding DX Event Handler
		
	timer =	setTimer ( -- Count 
			function()-- Count 
				n = n - 1 -- Count 
				count = ""..n.."" -- Count 
			if n == 0 then -- on Count END
					triggerServerEvent ("KillAFK", getLocalPlayer()) -- Triggers Killing Function
					playSoundFrontEnd ( 101 ) -- Play SOund on Count END
					removeEventHandler ( "onClientRender" , root ,txt) -- Remove DX Text's After Count END
					removeEventHandler ( "onClientRender",root,You)-- Remove DX Text's After Count END
				end
			end
		, CountSpeed , NumToCount ) -- End Of Count Timer
		
--- Count---
end	

addEvent("YouAreNotAFK",true) -- Removing Message Event
addEventHandler("YouAreNotAFK",root,-- Removing Message Event
function()-- Removing Message Function
removeEventHandler ( "onClientRender",root,You)-- Removing Message 1
removeEventHandler ( "onClientRender" , root ,txt)-- Removing Message 2
	if isTimer(timer) then
		killTimer(timer)-- Killing The Timer
	end
end ) -- END of Removing Message Event

--- DX ---	
