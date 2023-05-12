--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

wiadomosci= {}

addEventHandler('onPlayerChat', root, function(msg, typ)
	cancelEvent()
	if string.find(msg,"#%x%x%x%x%x%x") then
		triggerClientEvent(source, "addNoti", source, "Usuń kolor HEX z wiadomości.", "error" )
	return end
	mojeuid=getElementData(source,"player:uid")
	if not mojeuid then cancelEvent() 
	return end
	local tick=getTickCount()
	id=getElementData(source,"id")
	if typ==0 then
		cancelEvent()
		if ninjaban(msg) and not getAdmin(source, 5) then
		triggerClientEvent(root, "adminRender", root, ""..getPlayerName(source).." został wyrzucony, powód: Reklama")
		kickPlayer (source, "Zostałeś wyrzucony za prawdopodobną reklame, zaloguj sie ponownie!")
		return end
		local resultA=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE type=? AND active=1 AND serial=? AND time>NOW() LIMIT 1","mute", getPlayerSerial(source))
		if #resultA > 0 then 
			triggerClientEvent(source, "addNoti", source, 'Posiadasz blokadę komunikacji do:\n '..resultA[1].time..' z powodu:\n '..resultA[1].reason..'', "error" )
		return end
		if not isElement(source) then return end
		local x,y,z=getElementPosition(source)
		local sphere=createColSphere(x,y,z, 30)
		local players=getElementsWithinColShape(sphere, 'player')
		for i,v in pairs(players) do
			local id=getElementData(source,"id")
			outputChatBox("#4A4A4A["..getElementData(source,"id").."] #FFFFFF"..getPlayerName(source)..":#FFFFFF "..msg:gsub("#%x%x%x%x%x%x",""), v, _, _, _, true)
		end
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_chat (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(source,"id").."] "..getPlayerName(source).."", "#5a3795CHAT >#FFFFFF "..removeHex(msg))
		destroyElement(sphere)

		local desc = string.format("Czat Lokalny> %s(%d): %s",getPlayerName(source),id,msg:gsub("#%x%x%x%x%x%x",""))
		--triggerClientEvent(root, "onDebugMessage", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""),1, "CZAT")
		triggerClientEvent("onChatbubblesMessageIncome",source,msg:gsub("#%x%x%x%x%x%x",""),0)
		triggerEvent("admin:addText", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""),math.random(0,99))
		x,y,z=getElementPosition(source)
	elseif typ==1 then
		cancelEvent()
		if ninjaban(msg) and not getAdmin(source, 5) then
		kickPlayer (source, "Zostałeś wyrzucony za prawdopodobną reklame, zaloguj sie ponownie!")
		triggerClientEvent(root, "adminRender", root, ""..getPlayerName(source).." został wyrzucony, powód: Reklama")
		return end
		local x,y,z=getElementPosition(source)
		local sphere=createColSphere(x,y,z, 30)
		local players=getElementsWithinColShape(sphere, 'player')
		destroyElement(sphere)
		local resultA=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE type=? AND active=1 AND serial=? AND time>NOW() LIMIT 1","mute", getPlayerSerial(source))
		if #resultA > 0 then 
			triggerClientEvent(plr, "addNoti", plr, 'Posiadasz blokadę komunikacji do:\n '..resultA[1].time..' z powodu:\n '..resultA[1].reason..'', "error" )
		return end
		for i,v in pairs(players) do
			outputChatBox("** "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").." "..msg:gsub("#%x%x%x%x%x%x",""), v, 202, 67, 255)
		end
		local q = string.format(">>/me "..getPlayerName(source).."("..getElementData(source,"id").."): "..msg:gsub("#%x%x%x%x%x%x",""))
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_chat (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(source,"id").."] "..getPlayerName(source).."", "#d200ff/me >#FFFFFF "..removeHex(msg))
		triggerEvent("admin:addText", resourceRoot, q:gsub("#%x%x%x%x%x%x",""),math.random(0,99))
		--triggerClientEvent("onDebugMessage", resourceRoot, q,1, "/me")
		x,y,z=getElementPosition(source)
	end
end)

addCommandHandler('do', function(source, cmd, ...)
	local text=table.concat({...}, ' ')
	if not text then return end
	if string.find(text,"#%x%x%x%x%x%x") then
		triggerClientEvent(plr, "addNoti", plr, "Użycie: /"..cmd.." <nick/id> <tekst>", "error" )
		triggerClientEvent(source, "addNoti", source, "Usuń kolor HEX z wiadomości.", "error" )
	return end
	
			local resultA=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE type=? AND active=1 AND serial=? AND time>NOW() LIMIT 1","mute", getPlayerSerial(source))
		if #resultA > 0 then 
			triggerClientEvent(source, "addNoti", source, 'Posiadasz blokadę komunikacji do:\n '..resultA[1].time..' z powodu:\n '..resultA[1].reason..'', "error" )
		return end

	local msg=table.concat({...}, " ")
	local x,y,z=getElementPosition(source)
	local sphere=createColSphere(x,y,z, 30)
	local players=getElementsWithinColShape(sphere, 'player')
	destroyElement(sphere)

	for i,v in ipairs(players) do
		outputChatBox("** "..msg.." ("..getPlayerName(source):gsub("#%x%x%x%x%x%x","")..") **", v, 138, 151, 186)
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_chat (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(source,"id").."] "..getPlayerName(source).."", "#a000aa/do >#FFFFFF "..removeHex(msg))
		local q = string.format(">>/do "..getPlayerName(source).."("..getElementData(source,"id").."): "..msg:gsub("#%x%x%x%x%x%x",""))
		triggerEvent("admin:addText", resourceRoot, q:gsub("#%x%x%x%x%x%x",""),math.random(0,99))
		--triggerClientEvent("onDebugMessage", resourceRoot, q,1, "/do")
	end
end)







function ninjaban(ip)
    -- must pass in a string value
    if ip == nil or type(ip) ~= "string" then
        return false
    end

    -- check for format 1.11.111.111 for ipv4
    local chunks = {ip:match("(%d+)%.(%d+)%.(%d+)%.(%d+)")}
    if (#chunks == 4) then
        for _,v in pairs(chunks) do
            if (tonumber(v) < 0 or tonumber(v) > 255) then
                return false
			else
			return true
			end
        end
    else
        return false
    end

    return false
end

addCommandHandler("v", function(plr, cmd, ...)
	if getElementData(plr, "player:premium") == false and getElementData(plr,"player:admin") == false then return end
	if not ... then
	 local x = getElementData(plr,"player:pchatoff")
	 if x == false then
		triggerClientEvent(plr, "addNoti", plr, "Wyłączyłeś chat premium.", "info" )
	 setElementData(plr,"player:pchatoff",true)
	 end
	 if x == true then
		triggerClientEvent(plr, "addNoti", plr, "Włączyłeś chat premium.", "info" )
	 setElementData(plr,"player:pchatoff",false)
	 end
	 return end
	 if ... then
	   local message = table.concat ( { ... }, " " )
	   if string.find(message,"#%x%x%x%x%x%x") then
		   triggerClientEvent(plr, "addNoti", plr, "Usuń kolor HEX z wiadomości.", "error" )
	   return end

	   local resultA=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE type=? AND active=1 AND serial=? AND time>NOW() LIMIT 1","mute", getPlayerSerial(plr))
		if #resultA > 0 then 
			triggerClientEvent(plr, "addNoti", plr, 'Posiadasz blokadę komunikacji do:\n '..resultA[1].time..' z powodu:\n '..resultA[1].reason..'', "error" )
		return end

	   local name = removeHex(getPlayerName(plr))
	   if getElementData(plr,"player:admin") then 
		name = getPlayerName(plr)
		end
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_v (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(plr,"id").."] "..getPlayerName(plr).."", "#F7E200CHAT >#FFFFFF "..removeHex(message))
	   for _,p in pairs(getElementsByType("player")) do
	if getElementData(p,"player:premium") or getElementData(p,"player:admin") then
		if not getElementData(p,"player:pchatoff") then
	   	outputChatBox("#F7E200★ #ffffff["..getElementData(plr,"id").."] #DDDDDD"..name.." #F7E200>> : #DDDDDD"..message, p, 255, 255, 255, true)
		end
	end
   
	   end
	   end
   end)

addCommandHandler("o", function(plr, cmd, ...)
if getElementData(plr, "player:organization") == false then return end
if not ... then
	local x = getElementData(plr,"player:ochatoff")
	if x == false then
		triggerClientEvent(plr, "addNoti", plr, "Wyłączyłeś chat organizacyjny", "info" )
		setElementData(plr,"player:ochatoff",true)
	end
	if x == true then
		triggerClientEvent(plr, "addNoti", plr, "Włączyłeś chat organizacyjny", "info" )
		setElementData(plr,"player:ochatoff",false)
	end
	return end
	if ... then
	local message = table.concat ( { ... }, " " )
	if string.find(message,"#%x%x%x%x%x%x") then
		triggerClientEvent(plr, "addNoti", plr, "Użycie: /"..cmd.." <nick/id> <tekst>", "error" )
		triggerClientEvent(plr, "addNoti", plr, "Usuń kolor HEX z wiadomości.", "error" )
	return end
	local name = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
	local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_v (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(plr,"id").."] "..getPlayerName(plr).."", "#AAAAAA"..getElementData(plr, "player:organization").." >#FFFFFF "..removeHex(message))

	for _,p in pairs(getElementsByType("player")) do
if getElementData(p,"player:organization") == getElementData(plr, "player:organization") and not getElementData(p,"player:ochatoff") then
	outputChatBox("#DDDDDD[#AAAAAA"..getElementData(plr, "player:organization").."#DDDDDD] #DDDDDD"..name.."("..getElementData(plr,"id")..") #AAAAAA>> : #DDDDDD"..message, p, 255, 255, 255, true)
end

	end
	end
end)

addCommandHandler("f", function(plr, cmd, ...)
	if getElementData(plr, "player:duty") == false then return end
	if ... then
		local message = table.concat ( { ... }, " " )
		if string.find(message,"#%x%x%x%x%x%x") then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /"..cmd.." <nick/id> <tekst>", "error" )
			triggerClientEvent(plr, "addNoti", plr, "Usuń kolor HEX z wiadomości.", "error" )
		return end
		local name = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_f (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(plr,"id").."] "..getPlayerName(plr).."", "#AAAAAA"..getElementData(plr, "player:duty").." >#FFFFFF "..removeHex(message))

		for _,p in pairs(getElementsByType("player")) do
			if getElementData(p,"player:duty") == getElementData(plr, "player:duty") then
				outputChatBox("#DDDDDD[#0055FFKrótkofalówka#DDDDDD] #DDDDDD"..name.."("..getElementData(plr,"id")..") #AAAAAA>> : #DDDDDD"..message, p, 255, 255, 255, true)
			end
		end
	end
end)

addCommandHandler("ce", function(plr, cmd, ...)
	if getElementData(plr, "player:duty") == false then return end
	if ... then
		local message = table.concat ( { ... }, " " )
		if string.find(message,"#%x%x%x%x%x%x") then
			triggerClientEvent(plr, "addNoti", plr, "Użycie: /"..cmd.." <nick/id> <tekst>", "error" )
			triggerClientEvent(plr, "addNoti", plr, "Usuń kolor HEX z wiadomości.", "error" )
		return end
		local name = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_ce (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(plr,"id").."] "..getPlayerName(plr).."", "#AAAAAA"..getElementData(plr, "player:duty").." >#FFFFFF "..removeHex(message))

		for _,p in pairs(getElementsByType("player")) do
			if getElementData(p,"player:duty") ~= false then
				outputChatBox("#DDDDDD[#DD0000Centrala#DDDDDD] #DDDDDD"..name.."("..getElementData(plr,"id")..") #AAAAAA>> : #DDDDDD"..message, p, 255, 255, 255, true)
			end
		end
	end
end)

   function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end