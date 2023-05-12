--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

function getAdmin(plr,level)
	--if getElementData(plr,"Ryj123123ea9isd9uas9udk") then return true end
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

addCommandHandler("duty", function(plr,cmd)
	if getAdmin(plr,1) or getAdmin(plr,2) or getAdmin(plr,3) or getAdmin(plr,4) or getAdmin(plr,5) or getAdmin(plr,6) then
		if not getElementData(plr,"player:admin") then
			if getElementData(plr,"player:pracadorywczna") then triggerClientEvent(plr, "addNoti", plr, "Zakończ pracę dorywczą, zanim rozpoczniesz służbę.", "error" ) return end
			if getAdmin(plr, 1) then
			setElementData(plr,"player:level",1)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
			setPlayerName(plr,"#2BFFB4"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			triggerClientEvent(plr, "addNoti", plr, "Rozpoczynasz służbę w administracji serwera.", "success" )
			
			elseif getAdmin(plr, 2) then
			setElementData(plr,"player:level",2)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
	        setPlayerName(plr,"#33cc99"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			triggerClientEvent(plr, "addNoti", plr, "Rozpoczynasz służbę w administracji serwera.", "success" )
			
			elseif getAdmin(plr, 3) then
			setElementData(plr,"player:level",3)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
	        setPlayerName(plr,"#3399ff"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			triggerClientEvent(plr, "addNoti", plr, "Rozpoczynasz służbę w administracji serwera.", "success" )
			
			elseif getAdmin(plr, 4) then
			setElementData(plr,"player:level",4)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
	        setPlayerName(plr,"#ff0000"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			triggerClientEvent(plr, "addNoti", plr, "Rozpoczynasz służbę w administracji serwera.", "success" )
			
            elseif getAdmin(plr, 5) then
			setElementData(plr,"player:level",5)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
	        setPlayerName(plr,"#CA43FF"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			triggerClientEvent(plr, "addNoti", plr, "Rozpoczynasz służbę w administracji serwera.", "success" )

			elseif getAdmin(plr, 6) then
			setElementData(plr,"player:level",6)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
	        setPlayerName(plr,"#CA43FF"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			triggerClientEvent(plr, "addNoti", plr, "Rozpoczynasz służbę w administracji serwera.", "success" )
			end
			
			setElementData(plr,"player:admin",true)
			setElementData(plr,"player:ucho",true)
		else
			removeElementData(plr,"player:admin")
			removeElementData(plr,"player:level")
			setElementData(plr,"player:ucho",false)
			triggerClientEvent(plr, "addNoti", plr, "Kończysz służbę w administracji serwera.", "success" )
			setPlayerName(plr,getElementData(plr,"last:nick"))
		end
	else

	end
end)

scianarapsow = createObject ( 16637,-1931.6,883.27,35.41 )
setObjectScale(scianarapsow,3)
setElementDimension(scianarapsow,9999)
reportView = {{"Raporty",0}}
setElementData(scianarapsow,"sciana:raportow",reportView)

addEvent("admin:addReport", true)
addEventHandler("admin:addReport", root, function(text,id,id2)
	table.insert(reportView, {text,id,id2})
	if #reportView > 35 then
		table.remove(reportView, 2)
	end
	setElementData(scianarapsow,"sciana:raportow",reportView)
end)

addEvent("admin:removeReport", true)
addEventHandler("admin:removeReport", root, function(id, plr, reason)
	local plr = plr or nil
	for i=#reportView, 2, -1 do
		if reportView[i][2] == id then
			local targyts=exports["crime_core"]:findPlayer(plr,reportView[i][3])
			if targyts then 
				triggerClientEvent(targyts, "addNoti", targyts, ""..removeHex(getPlayerName(plr)).." wyczyścił/a twój raport z powodem: "..reason..".", "info")
			end
			table.remove(reportView,i)
		end
	end
	setElementData(scianarapsow,"sciana:raportow",reportView)
end)

scianatext = createObject ( 981,0,0,0 )
textView = {{"Logi",0}}
setElementDimension(scianatext,9999)
setElementData(scianatext,"sciana:text",textView)


addEvent("admin:addText", true)
addEventHandler("admin:addText", root, function(text,id)
	exports["crime_database"]:dbSet("INSERT INTO logs_adminfull (tresc) VALUES (?)", tostring(text))
	table.insert(textView, {text,id})
	if #textView > 17 then
		table.remove(textView, 2)
	end
	setElementData(scianatext,"sciana:text",textView)
end)

addEvent("admin:removeText", true)
addEventHandler("admin:removeText", root, function(id)
	for i=#textView, 2, -1 do
		if textView[i][2] == id then
			table.remove(textView,i)
		end
	end
	setElementData(scianatext,"sciana:text",textView)
end)


addCommandHandler("raport", function(plr,cmd,cel,...)
	if not cel then
		triggerClientEvent(plr, "addNoti", plr, "Użycie: /raport (id/nick) (powód)", "error" )
		return
	end
	local target=exports["crime_core"]:findPlayer(plr,cel)
	if not target then
		triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego gracza.", "error" )
		return
	end
	local text=table.concat({...}, " ")
	
	if getElementData(plr,"player:premium") then premium = "#ff0000" end
	if not getElementData(plr,"player:premium") then premium = "#cccccc" end
	desc=""..premium.." "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."("..getElementData(plr,"id")..") >> "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."("..getElementData(target,"id").."): "..text:gsub("#%x%x%x%x%x%x","")
	triggerEvent("admin:addReport", resourceRoot, desc, getElementData(target,"id"), getElementData(plr,"id"))
	triggerClientEvent(plr, "addNoti", plr, "Pomyślnie wysłano zgłoszenie.", "success" )
end)

addCommandHandler("report", function(plr,cmd,cel,...)
	if not cel then
		triggerClientEvent(plr, "addNoti", plr, "Użycie: /raport (id/nick) (powód)", "error" )
		return
	end
	local target=exports["crime_core"]:findPlayer(plr,cel)
	if not target then
		triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego gracza.", "error" )
		return
	end
	local text=table.concat({...}, " ")
	
	if getElementData(plr,"player:premium") then premium = "#ff0000" end
	if not getElementData(plr,"player:premium") then premium = "#cccccc" end
	desc=""..premium.." "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."("..getElementData(plr,"id")..") >> "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."("..getElementData(target,"id").."): "..text:gsub("#%x%x%x%x%x%x","")
	triggerEvent("admin:addReport", resourceRoot, desc, getElementData(target,"id"), getElementData(plr,"id"))
	triggerClientEvent(plr, "addNoti", plr, "Pomyślnie wysłano zgłoszenie.", "success" )
end)

addCommandHandler("cl", function(plr,cmd,id,...)
	if not getAdmin(plr) then
		triggerClientEvent(plr, "addNoti", plr, "Nie posiadasz uprawnień.", "error" )
		return
	end
	local sad = false
	local reason=table.concat({...}, " ")
	local target=exports["crime_core"]:findPlayer(plr,id)
	opis = "OFFLINE"
	if target then
		id=getElementData(target,"id")
		opis=getPlayerName(target)
		if target == plr and not getAdmin(target) then
		end
	end

	for i,v in pairs(reportView) do 
		if reportView[i][2] == id then sad = true end
	end
	if sad == false then return end
	for i,v in ipairs(getElementsByType("player")) do
		if getAdmin(v) then
			if getElementData(v,"player:admin") then
				triggerEvent("admin:removeReport", resourceRoot, id, plr, reason)
				triggerClientEvent(v, "addNoti", v, ""..removeHex(getPlayerName(plr)).." wyczyścił/a raporta na "..removeHex(getPlayerName(target)).." z powodem: "..reason..".", "info" )
			end
		end
	end
				local val2 = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
				local val3 = opis:gsub("#%x%x%x%x%x%x","")
				local val4 = reason
				local kasapremka = math.random(15,20)
				triggerEvent("rapss", plr, kasapremka, val2, val3, val4)
end)

addEventHandler("onPlayerQuit", root, function()
	local id=getElementData(source,"id")
	if id then
		triggerEvent("admin:removeReport", resourceRoot, id, source, "Ten gracz wyszedł z gry.")
	end
end)

addEventHandler("onPlayerCommand",root,
    function(command)
	if (command == "login") then
		if getPlayerSerial(source) ~= "B6B0B2C2BB2A2E806AE553BF30894E62" and getPlayerSerial(source)~= "7A070007535FDEB0AD27A94FF09C2812" and getPlayerSerial(source)~= "6F16B5ADE1605A1A4144035AF85AA7E2" then outputChatBox("Nie posiadasz dostępu do tej komendy.", source) cancelEvent() return end
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