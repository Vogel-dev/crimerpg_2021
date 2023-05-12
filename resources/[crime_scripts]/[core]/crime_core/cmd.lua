--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function onPrivateMessage(plr, cmd, target, ...)
	if not (getElementData(plr, "player:logged") == true) then return end
    if not target or not {...} then
	triggerClientEvent(plr, "addNoti", plr, "Użycie: /pm (nick/id) (wiadomość)", "error" )
    	return
    end
	if ninjaban(...) then
	kickPlayer (plr, "Zostałeś wyrzucony za prawdopodobną reklame, zaloguj sie ponownie")
	-- triggerClientEvent(root, "admin:rendering", root, "* "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."("..getElementData(plr,"id")..") został wyrzucony, powód: Reklama")
	return end
    local text=table.concat({...}, ' ')
    local target=findPlayer(plr, target)
	if not target then
		triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego gracza!", "error" )
        return
    end
	if not (getElementData(target, "player:logged") == true) then
		triggerClientEvent(plr, "addNoti", plr, "Gracz nie jest zalogowany", "error" )
	return end
	
	local pmoff=getElementData(target,"pmoff")
	if pmoff == true then
		triggerClientEvent(plr, "addNoti", plr, getPlayerName(target):gsub('#%x%x%x%x%x%x','')..' nie akceptuje wiadomości PM!', "error" )
	return end
	
	if getElementData(plr,"pmoff") then
		triggerClientEvent(plr, "addNoti", plr, "Posiadasz wyłączone wiadomości, ta osoba ci nie odpisze", "info" )
    end
	
	local resultA=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE type=? AND active=1 AND serial=? AND time>NOW() LIMIT 1","mute", getPlayerSerial(plr))
		if #resultA > 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Posiadasz blokadę komunikacji do:\n "..resultA[1].time.." z powodu:\n "..resultA[1].reason.."", "error" )
	return end
	
	local resultAs=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE type=? AND active=1 AND serial=? AND time>NOW() LIMIT 1","mute", getPlayerSerial(target))
		if #resultAs > 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Ten gracz posiada blokadę mowy, nie odpisze ci.", "info" )
	end
	
	if string.find(text,"#%x%x%x%x%x%x") then
		triggerClientEvent(plr, "addNoti", plr, "Usuń kolor HEX z wiadomości.", "error" )
	return end
	
	local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_pm (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(plr,"id").."] "..getPlayerName(plr).."", "#5a3795PM DO #FFFFFF"..getPlayerName(target).."#FFFFFF > "..removeHex(text))
    outputChatBox("#db9514>> "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."("..getElementData(target,"id").."): #ffae19"..text.."", plr, _, _, _, true)
    outputChatBox("#db9514<< "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."("..getElementData(plr,"id").."): #ffae19"..text.."", target, _, _, _, true)
       	
  	local pm_text=('Czat Prywatny> %s(%d)(uid:%d) >> %s(%d)(uid:%d): %s'):format(getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), getElementData(plr,"id"), getElementData(plr,"player:uid"), getPlayerName(target):gsub("#%x%x%x%x%x%x",""), getElementData(target,"id"),getElementData(target,"player:uid"), text)
	triggerEvent("admin:logs", root, pm_text)
	--triggerClientEvent("onDebugMessage", resourceRoot, pm_text,3, "PM")
		triggerEvent("admin:addText", root, pm_text)
		--triggerClientEvent("onDebugMessage", resourceRoot, pm_text,3, "/pm")
end
addCommandHandler('pw', onPrivateMessage)
addCommandHandler('pm', onPrivateMessage)


--[[
 addCommandHandler("pmon", function(plr,cmd)
   removeElementData(plr,"pmoff")
   --exports["LS-Notyfikacje"]:noti("Od teraz akceptujesz wiadomosci prywatne",plr)
	triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Włączyłeś pm!') 
   return
   end)

   addCommandHandler("pmoff", function(plr,cmd,...)
   local powod=table.concat({...}, ' ')
   if string.len(powod) > 37 then triggerClientEvent(plr, 'alerts:create_alert', root, 'error', 'Powód nie może przekraczać 37 znaków!') return end
   if (not powod or string.len(powod)<2) then powod=true end
   setElementData(plr, "pmoff", powod)
   --exports["LS-Notyfikacje"]:noti("Od teraz nie akceptujesz wiadomosci prywatnych",plr)
	triggerClientEvent(plr, 'alerts:create_alert', root, 'success', 'Wyłączyłeś pm!') 
   return
   end)
   
]]--
	

function onTransferMoney(plr, cmd, target, value)
	if not target or not tonumber(value) then
		triggerClientEvent(plr, "addNoti", plr, "Użycie /przelej (nick/id) (suma)", "error" )
        return
    end
    value=math.floor(tonumber(value))
    local target=findPlayer(plr,target)
	if not target then
		triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego gracza.", "error" )
        return
    end
	if not (getElementData(target, "player:logged") == true) then
		triggerClientEvent(plr, "addNoti", plr, "Poczekaj, aż gracz się zaloguje.", "error" )
	return end
	if getPlayerMoney(plr) < value then
		triggerClientEvent(plr, "addNoti", plr, "Nie posiadasz tylu pieniędzy.", "error" )
        return
    end
	if value == 0 or value < 0 then
		triggerClientEvent(plr, "addNoti", plr, "Nie posiadasz tylu pieniędzy.", "error" )
        return
    end
    takePlayerMoney(plr, value)
	givePlayerMoney(target ,value)
	local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_pay (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(plr,"id").."] "..getPlayerName(plr).."", "#5a3795PRZELEW DO #FFFFFF"..getPlayerName(target).."#FFFFFF > "..value.." PLN")
	triggerClientEvent(plr, "addNoti", plr, "Przelałeś pieniądze graczowi "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." w wysokości: "..value.." PLN", "money" )
	triggerClientEvent(target, "addNoti", target, "Otrzymałeś pieniądze od: "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." w wysokości: "..value.." PLN", "money" )

    local transfer_text=('>>/przelej> %s(%d)(uid:%d)>> %s(%d)(uid:%d): %d'):format(getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), getElementData(plr,"id"), getElementData(plr,"player:uid"), getPlayerName(target):gsub("#%x%x%x%x%x%x",""), getElementData(target,"id"),getElementData(target,"player:uid"), value)
	--triggerClientEvent("onDebugMessage", resourceRoot, transfer_text,4, "TRANSFER")
		triggerEvent("admin:addText", root, transfer_text)
	triggerEvent("admin:logs", root, transfer_text)
	local uid=getElementData(target,"player:uid")
	if not uid then return end
	local money=getPlayerMoney(target)
	exports["crime_database"]:dbSet("insert into logi_przelewy values(NULL,NOW(),?,?,?,?,?)",getElementData(plr, "player:uid"), getPlayerSerial(plr), getElementData(target,"player:uid"), getPlayerSerial(target),  value)
	local query=exports["crime_database"]:dbSet("UPDATE crime_users SET money=? WHERE id=?",
	money, uid)
end
addCommandHandler('przelej', onTransferMoney)
addCommandHandler('zaplac', onTransferMoney)
addCommandHandler('pay', onTransferMoney)
addCommandHandler('przelew', onTransferMoney)

addEventHandler("onPlayerCommand", root, function(command)
if command == "register" then cancelEvent() return end
if command == "hania" then cancelEvent() return end
if command == "hania2" then cancelEvent() return end
if command == "hania3" then cancelEvent() return end
--if command == "logout" then cancelEvent() return end
if command == "msg" then cancelEvent() return end
if command == "Toggle" then cancelEvent() return end
if command == "Next" then  cancelEvent() return end
if command == "Previous" then cancelEvent() return end
if command == "say" then return end
end
)


function onTransferPP(plr, cmd, target, value)
	if not target or not tonumber(value) then
		triggerClientEvent(plr, "addNoti", plr, "Użycie: /przelejpp (nick/id) (suma)", "error" )
        return
    end
    value=math.floor(tonumber(value))
    local target=findPlayer(plr,target)
	if not target then
		triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego gracza.", "error" )
        return
    end
	if not (getElementData(target, "player:logged") == true) then
		triggerClientEvent(plr, "addNoti", plr, "Poczekaj, aż gracz się zaloguje.", "error" )
	return end
	if getElementData(plr,"ppoints") < value then
		triggerClientEvent(plr, "addNoti", plr, "Nie posiadasz tylu punktów premium.", "error" )
        return
    end
	if value == 0 or value < 0 then
		triggerClientEvent(plr, "addNoti", plr, "Nie posiadasz tylu punktów premium.", "error" )
        return
    end
	local ppointsg = getElementData(plr,"ppoints")
	setElementData(plr,"ppoints",ppointsg-value)
	
	local ppointst = getElementData(target,"ppoints")
	setElementData(target,"ppoints",ppointst+value)
	local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_paypp (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(plr,"id").."] "..getPlayerName(plr).."", "#5a3795PRZELEW PP DO #FFFFFF"..getPlayerName(target).."#FFFFFF > "..value.."PP")
	triggerClientEvent(plr, "addNoti", plr, "Przekazałeś punkty premium graczowi "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." w wysokości: "..value.."", "premium" )
	triggerClientEvent(target, "addNoti", target, "Otrzymałeś punkty premium od: "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." w wysokości: "..value.."", "premium" )

    local transfer_text=('>>/przelejpp> %s(%d)(uid:%d)>> %s(%d)(uid:%d): %d'):format(getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), getElementData(plr,"id"), getElementData(plr,"player:uid"), getPlayerName(target):gsub("#%x%x%x%x%x%x",""), getElementData(target,"id"),getElementData(target,"player:uid"), value)
	--triggerClientEvent("onDebugMessage", resourceRoot, transfer_text,4, "TRANSFERPP")
		triggerEvent("admin:addText", root, transfer_text)
	triggerEvent("admin:logs", root, transfer_text)
	local uid=getElementData(target,"player:uid")
	if not uid then return end
	local money=getElementData(target,"ppoints")
	exports["crime_database"]:dbSet("insert into logi_przelewy_pp values(NULL,NOW(),?,?,?,?,?)",getElementData(plr, "player:uid"), getPlayerSerial(plr), getElementData(target,"player:uid"), getPlayerSerial(target),  value)
end

-- addCommandHandler('przelejpp', onTransferPP)
-- addCommandHandler('zaplacpp', onTransferPP)
-- addCommandHandler('paypp', onTransferPP)
-- addCommandHandler('przelewpp', onTransferPP)