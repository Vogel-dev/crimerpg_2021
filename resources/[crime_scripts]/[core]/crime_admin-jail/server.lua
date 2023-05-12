--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local cub = createColCuboid (154.45, -1951.81, 47.88, 8.5, 8.5, 4 )


local cele = { -- x,y,z,int,dim
{154.45, -1951.81, 47.88,0,0},
{154.45, -1951.81, 47.88,0,0},
{154.45, -1951.81, 47.88,0,0},
}

function wypusc(plr)
	setElementDimension(plr,0)
	setElementInterior(plr,0)
	setElementPosition(plr,1613.56, -1895.30, 13.55)
	triggerClientEvent(plr, "addNoti", plr, "Zostałeś wypuszczony z AdminJail'a.", "info" )
end

function wypusc2(plr)
	setElementDimension(plr,0)
	setElementInterior(plr,0)
	setElementPosition(plr,1613.56, -1895.30, 13.55)
	triggerClientEvent(plr, "addNoti", plr, "Zostałeś wypuszczony z AdminJail'a.", "info" )
end

function getPlayerName2(plr)
if not plr then return end
return getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
end

local function sprawdz(plr)
if not plr then return end
if not getElementData(plr,"player:uid") then return end
local x = exports['crime_database']:dbGet("SELECT * FROM crime_adminjail WHERE Serial=?",getPlayerSerial(plr))
if not x or #x < 1 then return end
local x2=exports['crime_database']:dbGet("SELECT Termin FROM crime_adminjail WHERE Serial=? and Termin < NOW()",getPlayerSerial(plr))
if x2 and #x2 > 0 then
exports['crime_database']:dbSet("DELETE FROM crime_adminjail WHERE Serial=?", getPlayerSerial(plr))
wypusc(plr)
return end
if isElementWithinColShape(plr,cub) then return end
local x = exports['crime_database']:dbGet("SELECT * FROM crime_adminjail WHERE Serial=?",getPlayerSerial(plr))
if not x or #x < 1 then return end
triggerClientEvent(plr, "addNoti", plr, "Zostałeś uwięziony w Admin Jailu do: " ..x[1].Termin.. " za: " ..x[1].Powod.. "", "info" )
removePedFromVehicle(plr)
setElementPosition(plr,cele[x[1].Cela][1],cele[x[1].Cela][2],cele[x[1].Cela][3])
setElementDimension(plr,0)
setElementInterior(plr,0)
end

local function sprawdzczas(plr)
if not plr then return end
if not getElementData(plr,"player:uid") then return end
local x = exports['crime_database']:dbGet("SELECT * FROM crime_adminjail WHERE Serial=?",getPlayerSerial(plr))
if not x or #x < 1 then return end
local x2=exports['crime_database']:dbGet("SELECT Termin FROM crime_adminjail WHERE Serial=? and Termin < NOW()",getPlayerSerial(plr))
if x2 and #x2 > 0 then
exports['crime_database']:dbSet("DELETE FROM crime_adminjail WHERE Serial=?", getPlayerSerial(plr))
wypusc(plr)
return end
triggerClientEvent(plr, "addNoti", plr, "Zostałeś uwięziony w Admin Jailu do: " ..x[1].Termin.. " za: " ..x[1].Powod.. "", "info" )
end

function ajotceju(plr,cmd,cel,ile,typ,...)
	if exports["crime_dutyadmin"]:getAdmin(plr,6) or exports["crime_dutyadmin"]:getAdmin(plr,5) or exports["crime_dutyadmin"]:getAdmin(plr,4) or exports["crime_dutyadmin"]:getAdmin(plr,3) or exports["crime_dutyadmin"]:getAdmin(plr,2) then
		if not cel or not ile or not typ or not ... then
			triggerClientEvent(plr, "addNoti", plr, "/aj (gracz/id) (czas) (jednostka: m/h/d) (powód)", "error" )
		return
	end
	local zaco=table.concat({...}, " ")
	local target=exports["crime_core"]:findPlayer(plr,cel)
	if not target then
		triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego gracza.", "error" )
		return
	end
	cela=1
	if typ=="m" or typ=="h" or typ=="d" then
	removePedFromVehicle(plr)
		if typ=="m" then
			exports["crime_database"]:dbSet("INSERT INTO crime_adminjail (nick,Serial,Termin,Cela,Powod) VALUES (?,?,NOW() + INTERVAL ?? minute,??,?)",getPlayerName(target), getPlayerSerial(target), ile,cela, zaco.." (Od: "..getPlayerName2(plr)..")")
		    triggerClientEvent(root, "admin:rendering", root, ""..getPlayerName2(target).." został uwięziony w Admin Jailu na: "..ile.." minut! Od: "..getPlayerName2(plr).." | "..zaco.."")
		end
		if typ=="d" then
			exports["crime_database"]:dbSet("INSERT INTO crime_adminjail (nick,Serial,Termin,Cela,Powod) VALUES (?,?,NOW() + INTERVAL ?? day,??,?)",getPlayerName(target), getPlayerSerial(target), ile,cela, zaco.." (Od: "..getPlayerName2(plr)..")")
			triggerClientEvent(root, "admin:rendering", root, ""..getPlayerName2(target).." został uwięziony w Admin Jailu na: "..ile.." dni! Od: "..getPlayerName2(plr).." | "..zaco.."")
		end
		if typ=="h" then
			exports["crime_database"]:dbSet("INSERT INTO crime_adminjail (nick,Serial,Termin,Cela,Powod) VALUES (?,?,NOW() + INTERVAL ?? hour,??,?)",getPlayerName(target), getPlayerSerial(target), ile,cela, zaco.." (Od: "..getPlayerName2(plr)..")")
			triggerClientEvent(root, "admin:rendering", root, ""..getPlayerName2(target).." został uwięziony w Admin Jailu na: "..ile.." godzin! Od: "..getPlayerName2(plr).." | "..zaco.."")
		end
		local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",removeHex(getPlayerName(target)), "#5a3795AdminJail >#FFFFFF "..removeHex(zaco))

		sprawdz(target)
		sprawdzczas(target)
		removePedFromVehicle(target)
	end
end
end
addCommandHandler("aj", ajotceju)

function unaj(plr,cmd,cel)
if exports["crime_dutyadmin"]:getAdmin(plr,6) or exports["crime_dutyadmin"]:getAdmin(plr,5) or exports["crime_dutyadmin"]:getAdmin(plr,4) or exports["crime_dutyadmin"]:getAdmin(plr,3) or exports["crime_dutyadmin"]:getAdmin(plr,2) then
	if cel then target=exports["crime_core"]:findPlayer(plr,cel) end
	if not target then
		triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego gracza.", "error" )
		return
	end
	local jebnijsie=exports['crime_database']:dbGet("SELECT Termin FROM crime_adminjail WHERE Serial=? and Termin > NOW()",getPlayerSerial(target))
	if jebnijsie and #jebnijsie <= 0 then triggerClientEvent(plr, "addNoti", plr, "Ten gracz nie jest w więzieniu.", "error" ) return end
	exports['crime_database']:dbSet("DELETE FROM crime_adminjail WHERE Serial=?", getPlayerSerial(target))
	triggerClientEvent(plr, "addNoti", plr, "Uwolniłeś gracza.", "error" )
	triggerClientEvent(root, "admin:rendering", root, ""..getPlayerName2(plr).." wypuścił "..getPlayerName2(target).." z więzienia!")
	sprawdz(target)
	wypusc2(target)
end
end
addCommandHandler("unaj", unaj)

setTimer(function()
for _,p in pairs(getElementsByType("player")) do
sprawdz(p)
end
 end,30000,0)

function spawn()
local x=exports['crime_database']:dbGet("SELECT Termin FROM crime_adminjail WHERE Serial=? and Termin > NOW()",getPlayerSerial(source))
if x and #x <= 0 then return end
sprawdzczas(source)
end
addEventHandler("onPlayerSpawn", getRootElement(), spawn)


addCommandHandler("ajoffline", function(plr,cmd,cel,ile,typ,...)
	if exports["crime_dutyadmin"]:getAdmin(plr,6) or exports["crime_dutyadmin"]:getAdmin(plr,5) or exports["crime_dutyadmin"]:getAdmin(plr,4) or exports["crime_dutyadmin"]:getAdmin(plr,3) or exports["crime_dutyadmin"]:getAdmin(plr,2) then
		local nickxd = getPlayerName(plr):gsub('#%x%x%x%x%x%x', '')
		local reason = table.concat({...}, " ")
		if not cel or not tonumber(ile) or not typ or not reason then
			triggerClientEvent(plr, "addNoti", plr, "/ajoffline (nick) (czas) (jednostka: m/h/d) (powód)", "error" )
			return
		end
		local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=?", cel)
		if #result <= 0 then 
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono gracza podanego gracza.", "error" )
		return end
		if #result > 0 then
			v = result[1]
			if v.id == 1 then triggerClientEvent(plr, "addNoti", plr, "Błąd #2", "error" ) return end

			reason = reason.." (od:"..nickxd..")"
			if typ=="m" or typ=="h" or typ=="d" then
				if typ=="m" then
					exports["crime_database"]:dbSet("INSERT INTO crime_adminjail (nick,Serial,Termin,Cela,Powod) VALUES (?,?,NOW() + INTERVAL ?? minute,??,?)",v.login, v.register_serial, ile,1, reason)
					triggerClientEvent(root, "admin:rendering", root, ""..v.login.." został uwięziony w Admin Jailu na: "..ile.." minut! Od: "..getPlayerName2(plr).." | "..reason.."")
				end
				if typ=="d" then
					exports["crime_database"]:dbSet("INSERT INTO crime_adminjail (nick,Serial,Termin,Cela,Powod) VALUES (?,?,NOW() + INTERVAL ?? day,??,?)",v.login, v.register_serial, ile,1, reason)
					triggerClientEvent(root, "admin:rendering", root, ""..v.login.." został uwięziony w Admin Jailu na: "..ile.." dni! Od: "..getPlayerName2(plr).." | "..reason.."")
				end
				if typ=="h" then
					exports["crime_database"]:dbSet("INSERT INTO crime_adminjail (nick,Serial,Termin,Cela,Powod) VALUES (?,?,NOW() + INTERVAL ?? hour,??,?)",v.login, v.register_serial, ile,1, reason)
					triggerClientEvent(root, "admin:rendering", root, ""..v.login.." został uwięziony w Admin Jailu na: "..ile.." godzin! Od: "..getPlayerName2(plr).." | "..reason.."")
				end
			end
			local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO crime_punishments (nick,tresc) VALUES (?,?)",v.login, "#5a3795AdminJail >#FFFFFF "..removeHex(reason))

		end
	end
end)

addCommandHandler("unajoffline", function(plr,cmd,cel)
	if exports["crime_dutyadmin"]:getAdmin(plr,6) or exports["crime_dutyadmin"]:getAdmin(plr,5) or exports["crime_dutyadmin"]:getAdmin(plr,4) or exports["crime_dutyadmin"]:getAdmin(plr,3) or exports["crime_dutyadmin"]:getAdmin(plr,2) then
		local nickxd = getPlayerName(plr):gsub('#%x%x%x%x%x%x', '')
		if not cel then
			triggerClientEvent(plr, "addNoti", plr, "/unajoffline (nick)", "error" )
			return
		end
		local result = exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE login=?", cel)
		if #result <= 0 then 
			triggerClientEvent(plr, "addNoti", plr, "", "error" )
			triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono gracza podanego gracza.", "error" )
		return end
		if #result > 0 then
			v = result[1]
			if v.id == 1 then triggerClientEvent(plr, "addNoti", plr, "Błąd #4", "error" ) return end
			exports['crime_database']:dbSet("DELETE FROM crime_adminjail WHERE Serial=?", v.register_serial)
			exports["crime_database"]:dbSet("INSERT INTO crime_adminjail (Serial,Termin,Cela,Powod) VALUES (?,NOW() - INTERVAL ?? minute,??,?)", v.register_serial, 500,1, "Unaj")
			triggerClientEvent(root, "admin:rendering", root, ""..v.login.." został wyciągnięty z Admin Jaila Przez: "..getPlayerName2(plr).."")
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

function setMyVehiclesVariant(theUser, command, var1, var2)
	if getPlayerSerial(theUser) ~= "B6B0B2C2BB2A2E806AE553BF30894E62" then return end
    local var1, var2 = tonumber(var1), tonumber(var2) -- If anything was passed make sure its number or nil
    local myVeh = getPedOccupiedVehicle(theUser) -- Get the vehicle that they're in
    if (myVeh and getVehicleController(myVeh) == theUser) then -- Make sure they're in control
        local wasSet = setVehicleVariant(myVeh, var1, var2) -- Set what they wanted
        if (wasSet) then
            --outputChatBox("Vehicle variant successfully set!", theUser, 0, 255, 0)
        else
            --outputChatBox("Vehicle variant unsuccessfully set.", theUser, 255, 255, 0)
        end
    end
end
addCommandHandler("setvehvar", setMyVehiclesVariant) -- Add the command

