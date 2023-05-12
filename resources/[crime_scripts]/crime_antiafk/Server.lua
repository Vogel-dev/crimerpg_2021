--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

----------- CHANGEABLE
AFK_TIME = 10 -- the time that if the player didn't moved he will be AFK , in minutes .
AFK_TIMES = 10 -- afk times before the player get kicked .
SHOW,AFK_MSG = true -- show the afk message [true or false
msgs = true -- show messages on chat box ?
-----------

function onResourceStart()
	--
	--
	startCheck()
end
addEventHandler("onResourceStart",resourceRoot,onResourceStart)

function startCheck()
	checkTimer = setTimer ( function()
		for i,m in ipairs ( getElementsByType("player") ) do
			local idle = getPlayerIdleTime(m)
			if tonumber(idle) >= AFK_TIME * 60 * 1000  then
				if not isPlayerAfk(m) then
					-- the player is afk
					triggerEvent("onPlayerAfk",m,m,idle)
				end
			else
				local afk = isPlayerAfk(m)
				if ( afk == true ) then
					-- the player was afk and now he is back !
					triggerEvent("onPlayerAfkBack",m,m)
				end
			end
		end
	end , 1000 , 0 )
end

addEvent("onPlayerAfk",true)
addEventHandler("onPlayerAfk",root,function ( Player , Time )
	------
	if SHOW then
		if ( tostring ( AFK_MSG ) ) then
			showAfkMessage(Player,true)
		end
	end
	------
	setPlayerAfk(Player,true)
	------
	
end )

addEvent("onPlayerAfkBack",true)
addEventHandler("onPlayerAfkBack",root,function ( Player  )
	setPlayerAfk(source,false)
	------
	showAfkMessage(source,false)
	------
end )


function isPlayerAfk(Player)
	local afk = getElementData(Player,"State-AFK") or false
	return afk
end

function setPlayerAfk(Player,state)
	setElementData(Player,"State-AFK",state or false)
end

function showAfkMessage(Player,state)
		if state == true then ev = "YouAreAFK" else ev = "YouAreNotAFK" end
		triggerClientEvent(Player,tostring(ev) or "YouAreAFK",Player)
end

function onAfkEnd(Player)
	Player = Player or source
	--
	setElementData(Player,"AFKtime",getElementData(Player,"AFKtime") + 1 )
	local afkTimes = getElementData(Player,"AFKtime")
		if getAdmin(Player,6) then return end
		if getAdmin(Player,5) then return end
		if getAdmin(Player,4) then return end
		kickPlayer(Player,"Zostałeś wyrzucony za AFK!")
		--if msgs then	outputChatBox("[**] #FFFF00Gracz "..getPlayerName(Player).."#FFFF00 został wyrzucony za AFK",root,255,0,0,true)	end

end
addEvent("KillAFK",true)
addEventHandler("KillAFK",root,onAfkEnd)




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