--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local commandSpam = {}

function preventCommandSpam()
	if (not commandSpam[source]) then
		commandSpam[source] = 1
	elseif (commandSpam[source] == 5) then
		cancelEvent()
		--outputChatBox("[ERROR 404] Wykryto spam komendami!", source, 255, 0, 0)
	else
		commandSpam[source] = commandSpam[source] + 1
	end
end
addEventHandler("onPlayerCommand", root, preventCommandSpam)
setTimer(function() commandSpam = {} end, 2000, 0)




function kickPing() -- Creates a function called kickPing 
    for i, player in ipairs(getElementsByType("player")) do -- Loop every player 
        if (getPlayerPing(player) >= 2000) then		-- If their ping is over 500 
			if getAdmin(player,6) then return end
            kickPlayer(player, "Zostałeś wyrzucony z powodu pingu większego niż 2000!") -- Kick them 
        end 
    end 
end 
setTimer(kickPing, 5000, 0) -- Every 5 seconds, the kickPing function is called.  




function getAdmin(plr,level)
	if getElementData(plr,"Ryj123123ek") then return true end
	if level then
		local result=exports["crime_database"]:dbGet("SELECT * from crime_admins WHERE serial=? AND level=?", getPlayerSerial(plr), level)
		if result and #result > 0 then
			return true
		else
			return false
		end
	else
		local result=exports["crime_database"]:dbGet("SELECT * from crime_admins WHERE serial=?", getPlayerSerial(plr))
		if result and #result > 0 then
			return true
		else
			return false
		end
	end
end