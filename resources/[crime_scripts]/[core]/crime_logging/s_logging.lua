--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("logging:checkAccount", true)
addEventHandler("logging:checkAccount", resourceRoot, function()
	exports["crime_voice"]:setPlayerChannel (client,6969)
	local serial = getPlayerSerial(client)
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE register_serial=?", serial)
	if result and #result > 0 then
	
		local serial = getPlayerSerial(client)
		if result[1].register_serial == serial then
			for i,player in pairs(getElementsByType("player")) do
				if getElementData(player,"player:uid") == result[1].id then
				triggerClientEvent(client, "logging:result", resourceRoot, false, "","blad")
				triggerClientEvent(client, "setwarninglogin", client, "Ktoś już przebywa na tym koncie!")
				return
			end
			end

			setPlayerName(client, result[1].login)
			setElementData(client, "player:uid", result[1].id)
			triggerEvent("SprawdzDom",root,client)
			
			local testres=exports["crime_database"]:dbGet("SELECT * FROM crime_friends WHERE uidznajomego=?", getElementData(client,"player:uid"))
			if testres and #testres > 0 then 
				for i,v in pairs(testres) do 
					for is,vs in pairs(getElementsByType("player")) do 
						if testres[i].uid == getElementData(vs,"player:uid") then 
							triggerClientEvent(vs, 'alerts:create_alert', root, 'info', 'Twój znajomy '..removeHex(getPlayerName(client))..' dołączył do gry!') 
						end
					end
				end
			end

			setElementData(client,"x",result[1].x)
			setElementData(client,"y",result[1].y)
			setElementData(client,"z",result[1].z)
			triggerClientEvent(client, "logging:result", resourceRoot, true, "","git")
	end
	end
end)


local maks_ilosc_kont = 1 -- Maksymalna ilosc kont do rejestracji
addEvent("logging:newAccount", true)
addEventHandler("logging:newAccount", resourceRoot, function(login,pass,email)
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE register_serial=?", getPlayerSerial(client))
	if result and #result >= maks_ilosc_kont then
		triggerClientEvent(client, "logging:result", resourceRoot, false, "","blad")
		triggerClientEvent(client, "setwarninglogin", client, "Ten serial posiada już jedno konto!")
	return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE email=?", email)
	if result and #result > 0 then
		triggerClientEvent(client, "logging:result", resourceRoot, false, "","blad")
		triggerClientEvent(client, "setwarninglogin", client, "Już ktoś zarejestrował ten e-mail!")
	return end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=?", login:gsub('#%x%x%x%x%x%x', ''))
	if result and #result > 0 then
		triggerClientEvent(client, "logging:result", resourceRoot, false, "","blad")
		triggerClientEvent(client, "setwarninglogin", client, "Ten login posiada już jedno konto!")
	else
		if string.find(login,"#%x%x%x%x%x%x") then triggerClientEvent(client, 'alerts:create_alert', root, 'error', 'Usuń kolor HEX z loginu!')  return end
		local query=exports["crime_database"]:dbSet("INSERT INTO crime_users (login,email,pytanie,register_serial,changedpw,skin,user_ip) VALUES (?,?,?,?,??,?,?)", login:gsub('#%x%x%x%x%x%x', ''), email, pass,getPlayerSerial(client),1,0,getPlayerIP(client))
		if query then
			
			triggerClientEvent(client, "setwarninglogin", client, "Utworzyłeś nowe konto!")
			setElementData(client,"x","2476.08")
			setElementData(client,"y","-1569.02")
			setElementData(client,"z","772.55")
			triggerClientEvent(client, "logging:testxd123", resourceRoot)
			
		end
	end
end)


addEvent("logging:getMyAccount", true)
addEventHandler("logging:getMyAccount", resourceRoot, function(login,pass,pass2,email)
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=? AND pytanie=? AND email=?", login,pass,email)
	if result and #result > 0 then
		local serial = getPlayerSerial(client)
		exports["crime_database"]:dbSet("UPDATE crime_users SET register_serial=?, pytanie=? WHERE login=? AND email=? LIMIT 1",serial, pass2, login, email)
		exports["crime_database"]:dbSet("INSERT INTO logs_serialchange (login, haslo1, haslo2, email, serial, ip) VALUES (?,?,?,?,?,?)", login, pass, pass2,email,getPlayerSerial(client),getPlayerIP(client))
		kickPlayer(client,"Zmieniono serial przypisany do konta, wejdź ponownie!")
	else 
		triggerClientEvent(client, "setwarninglogin", client, "Dane się nie zgadzają, spróbuj ponownie.\nJeżeli potrzebujesz pomocy zgłoś się do administracji.\ndiscord.gg/qcK3vjN")
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