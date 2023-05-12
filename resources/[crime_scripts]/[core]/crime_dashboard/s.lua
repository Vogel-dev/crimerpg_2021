--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("znajdzznajomych", true)
addEventHandler("znajdzznajomych", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_friends WHERE uid=?", uid)
    if not result then return end
    for i,v in pairs(result) do
        local resultdwa=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", v["uidznajomego"])
        if #resultdwa > 0 then
            triggerClientEvent(source, "dashboard:dotabeli", source, resultdwa)
            for i,vtest in pairs(resultdwa) do
                if vtest["avatarlink"] ~= "" then 
                    fetchRemote ( vtest["avatarlink"], myCallbackznajomy, "", false, source, v["uidznajomego"])
                end
            end
        end
	end
end)

addEvent("savesettings", true)
addEventHandler("savesettings", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if getElementData(source,"pmoff") == false then pmoff = 1 else pmoff = 0 end
    if getElementData(source,"wiecejinfo") == false then wiecejinfo = 0 else wiecejinfo = 1 end
    if getElementData(source,"hudoff") == false then hudoff = 1 else hudoff = 0 end
    if getElementData(source,"radaroff") == false then radaroff = 1 else radaroff = 0 end
    if getElementData(source,"lowpc") == false then lowpc = 0 else lowpc = 1 end
    if getElementData(source,"voiceon") == false then voiceon = 1 else voiceon = 0 end
    if getElementData(source,"dalekirender") == false then dalekirender = 0 else dalekirender = 1 end
    if getElementData(source,"shaderkaroseria") == false then shaderkaroseria = 0 else shaderkaroseria = 1 end
    if getElementData(source,"shaderwoda") == false then shaderwoda = 0 else shaderwoda = 1 end
    if getElementData(source,"shaderniebo") == false then shaderniebo = 0 else shaderniebo = 1 end
    if getElementData(source,"shaderdetale") == false then shaderdetale = 0 else shaderdetale = 1 end
    if getElementData(source,"shaderblur") == false then shaderblur = 0 else shaderblur = 1 end
    if getElementData(source,"player:changemap") == false then changemap = 0 else changemap = 1 end
    if getElementData(source,"player:engines") == false then engines = 1 else engines = 0 end
    if getElementData(source,"newhud") == false then newhud = 0 else newhud = 1 end
    if getElementData(source,"newspeed") == false then newspeed = 0 else newspeed = 1 end
    if getElementData(source,"roleplay") == false then roleplay = 0 else roleplay = 1 end


    local querydas = exports["crime_database"]:dbSet("UPDATE crime_users SET settingpmon=?, settinginfohud=?, settinghud=?, settingradar=?, settinglowpc=?, settingvoicechat=?, settingrender=?, settingkaro=?, settingwater=?, settingsky=?, settingdetal=?, settingblur=?, settingnewradar=?, settingsounds=?, 	settingnewhud=?, settingnewspeed=?, roleplay=? WHERE id=?", pmoff, wiecejinfo, hudoff, radaroff, lowpc, voiceon, dalekirender, shaderkaroseria, shaderwoda, shaderniebo, shaderdetale, shaderblur, changemap, engines, newhud, newspeed, roleplay, uid)
end)

addEvent("umarlessobie", true)
addEventHandler("umarlessobie", root, function(killer)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    exports["crime_database"]:dbSet("UPDATE crime_users SET zgony=zgony+?? WHERE id=? LIMIT 1",1,uid)
    if killer then 
        local uidkiller = getElementData(killer,"player:uid") 
        if not uidkiller then return end 
        exports["crime_database"]:dbSet("UPDATE crime_users SET kille=kille+?? WHERE id=? LIMIT 1",1,uidkiller)
        triggerClientEvent(killer, "zabilesgo", killer)
    end
end)

addEvent("zmienavatarlink", true)
addEventHandler("zmienavatarlink", root, function(link)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if string.len(link) >= 10 then triggerClientEvent(source, "addNoti", source, "Twój kod jest za długi, postępuj według poradnika.", "error" ) return end 
    if link == "" then 
        exports["crime_database"]:dbSet("UPDATE crime_users SET avatarlink=? WHERE id=? LIMIT 1","http://crimerpg.mtasa.eu/avatar.png",uid)
        setElementData(source,"avatarlink","http://crimerpg.mtasa.eu/avatar.png")
    else
        exports["crime_database"]:dbSet("UPDATE crime_users SET avatarlink=? WHERE id=? LIMIT 1","https://i.imgur.com/"..link..".png",uid)
        setElementData(source,"avatarlink","https://i.imgur.com/"..link..".png")
    end
    triggerClientEvent(source, "addNoti", source, "Avatar został zmieniony pomyślnie.", "success" )
    triggerClientEvent(source, "refreshavatarka", source)
    triggerEvent("core:newAv", source, source)
end)

addEvent("zmienpytanie", true)
addEventHandler("zmienpytanie", root, function(pytanie)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    exports["crime_database"]:dbSet("UPDATE crime_users SET pytanie=? WHERE id=? LIMIT 1",pytanie,uid)
    triggerClientEvent(source, "addNoti", source, "Zmieniono pomyślnie.", "success" )
end)

addEvent("voicechanyl", true)
addEventHandler("voicechanyl", root, function(chanyl)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if chanyl == true then 
        setPlayerVoiceIgnoreFrom(source, root)
    else    
        setPlayerVoiceIgnoreFrom(source, nil)
    end
end)

addEvent("losujesobietypek", true)
addEventHandler("losujesobietypek", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    exports["crime_database"]:dbSet("insert into logs_ppspent values(NOW(),?,?,?,?)","LOTERIA",1,uid)
end)

addEvent("dash:namierzjcoba", true)
addEventHandler("dash:namierzjcoba", root, function(idpojazdu)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if not idpojazdu then return end
    local vehs = getElementsByType("vehicle")
    for i,v in ipairs(vehs) do 
        if getElementData(v,"vehicle:id") == idpojazdu then 
            if getElementData(v,"vehicle:namiezany") == true then 
                triggerClientEvent(source,"namierz:removeblip",source, v)
                triggerClientEvent(source, "addNoti", source, "Przestałeś namierzac pojazd o ID "..idpojazdu.."", "success" )
            else
                triggerClientEvent(source,"namierz:createblip",source, v)
                triggerClientEvent(source, "addNoti", source, "Namierzasz pojazd o ID "..idpojazdu.."", "success" )
            end
        end
    end
end)

addEvent("dash:otworzjcoba", true)
addEventHandler("dash:otworzjcoba", root, function(idpojazdu)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if not idpojazdu then return end
    local vehs = getElementsByType("vehicle")
    for i,v in ipairs(vehs) do 
        if getElementData(v,"vehicle:id") == idpojazdu then 
            if isVehicleLocked(v) == true then 
                setVehicleLocked(v,false)
                triggerClientEvent(source, "addNoti", source, "Otwierasz pojazdo o ID "..idpojazdu.."", "success" )
            else
                setVehicleLocked(v,true)
                triggerClientEvent(source, "addNoti", source, "Zamykasz pojazd o ID "..idpojazdu.."", "success" )
            end
        end
    end
end)

addEvent("dash:wyszukajpojazdy", true)
addEventHandler("dash:wyszukajpojazdy", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", uid)
    if #result > 0 then
        triggerClientEvent(source, "dash:dotabeliveh", source, result)
    end
end)

addEvent("dash:wyszukajaktualizacje", true)
addEventHandler("dash:wyszukajaktualizacje", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_updates ORDER BY data DESC")
    if #result > 0 then
        triggerClientEvent(source, "dash:dotabeliaktualizacje", source, result)
    end
end)

addEvent("infogracz", true)
addEventHandler("infogracz", root, function()
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", uid)
    if not result then return end
    local sprawdz=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", uid) 
    liczbagracza = table.maxn(sprawdz) or 0
    local resultludzie = exports["crime_database"]:dbGet("SELECT * FROM crime_factions WHERE uid=?", uid)
    if #result > 0 and #resultludzie > 0 then
        triggerClientEvent(source, "dashboard:infogracz", source, result, liczbagracza, resultludzie)
    elseif #result > 0 then
        triggerClientEvent(source, "dashboard:infogracz", source, result, liczbagracza)
    end
end)

addEvent("dodajznajomego", true)
addEventHandler("dodajznajomego", root, function(uidznajomego)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if not uidznajomego then return end 
        
    local resultxdd=exports["crime_database"]:dbGet("SELECT * FROM crime_friends WHERE uid=? AND uidznajomego=?", uid, uidznajomego)
    if table.maxn(resultxdd) > 0 then triggerClientEvent(source, "addNoti", source, "Posiadasz już takiego znajomego.", "error" ) return end

    local resultdwa=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", uidznajomego)
    if table.maxn(resultdwa) <= 0 then triggerClientEvent(client, "addNoti", client, "Nie znaleziono takiego gracza.", "error" ) return end

    local query=exports["crime_database"]:dbSet("INSERT INTO crime_friends (uid, uidznajomego) VALUES (?,?)", uid, uidznajomego)
    triggerClientEvent(source, "dashboard:refresh", source)
end)

addEvent("usunznajomego", true)
addEventHandler("usunznajomego", root, function(uidznajomego)
    local uid=getElementData(source,"player:uid")
    if not uid then return end
    if not uidznajomego then return end 
    local query=exports["crime_database"]:dbSet("DELETE FROM crime_friends WHERE uid=? AND uidznajomego=?",uid, uidznajomego)
    triggerClientEvent(source, "dashboard:refresh", source)
end)


--avatarki


addEvent("fcstartImageDownload", true)
addEventHandler("fcstartImageDownload", resourceRoot, function(playerToReceive, link)
	fetchRemote ( link, myCallback, "", false, playerToReceive )
end)

function myCallback( responseData, errno, playerToReceive )
    if errno == 0 then
        triggerClientEvent( playerToReceive, "onClientGotImage", resourceRoot, responseData )
    end
end

function myCallbackznajomy( responseData, errno, playerToReceive, uidznajomegosad )
    if errno == 0 then
        triggerClientEvent( playerToReceive, "onClientGotImageznajomy", resourceRoot, responseData, uidznajomegosad )
    end
end

function dodajaktualizacje(plr,cmd,...)
    if getElementData(plr,"player:uid") ~= 1 then return end 
    local tresc=table.concat({...}, ' ')
	if not tresc then return end
    local kto = getPlayerName(plr)
    local query=exports["crime_database"]:dbSet("INSERT INTO crime_updates (kto, tresc) VALUES (?,?)", kto:gsub('#%x%x%x%x%x%x', ''), tresc)
    triggerClientEvent(source, "addNoti", source, "Dodałeś aktualizację.", "success" )
    triggerClientEvent(root, "addNoti", root, "Została dodana nowa aktualizacja.", "info" )
end

addCommandHandler("addupdate",dodajaktualizacje)



addEvent("premium:checkCode", true)
addEventHandler("premium:checkCode", root, function(kod, dni)
    if not dni then dni = 0 end
	local spr = "http://microsms.pl/api/v2/multi.php?userid=4619&code="..kod.."&serviceid=5212"
	fetchRemote(spr, nadajP, "", false, client, dni, kod)
end)

function nadajP(responseData, errno, playerToReceive, amount, kod)
	if errno == 0 then
	if string.find(string.lower(responseData), ""..string.lower(kod).."") then
		if string.find(responseData, '"number":"73480"') then
			amount = 3
		elseif string.find(responseData, '"number":"75480"') then
			amount = 7
		elseif string.find(responseData, '"number":"79480"') then
                        amount = 15
                elseif string.find(responseData, '"number":"91400"') then
			amount = 30
		end
                local ppoints = getElementData(playerToReceive,"ppoints") or 0
                setElementData(playerToReceive,"ppoints",ppoints+amount)
                local ppoints = getElementData(playerToReceive,"ppoints")
                triggerClientEvent(playerToReceive, "addNoti", playerToReceive, "Doładowałeś swoje konto o: "..amount.." punktów, aktualnie masz: "..ppoints.." punktów.", "success" )
				exports["crime_database"]:dbSet("insert into logs_premiumshop values(?,NOW(),?,?,?,?)",kod,"POPRAWNY",amount,getElementData(playerToReceive,"player:uid"))


	else
                triggerClientEvent(playerToReceive, "addNoti", playerToReceive, "Podany kod jest nieprawidłowy lub został wykorzystany.", "error" )
				if not amount then amount = 0 end
				exports["crime_database"]:dbSet("insert into logs_premiumshop values(?,NOW(),?,?,?,?)",kod,"BLEDNY",amount,getElementData(playerToReceive,"player:uid"))
	end
end
end




--KUPOWANIE PREMKI

function getPremiumDate(plr)
	local queryA=exports['crime_database']:dbGet("SELECT * FROM crime_users WHERE id=? AND premiumdate>NOW() LIMIT 1", getElementData(plr,"player:uid"))
	if (queryA and #queryA > 0) then
		return queryA[1].premiumdate
	end
	return false
end


function setPremiumDay(plr,days)
	if getPremiumDate(plr) then
	local queryA=exports['crime_database']:dbSet(string.format("UPDATE crime_users SET premiumdate = DATE(premiumdate) + INTERVAL %d DAY WHERE id=%d",days,getElementData(plr,"player:uid")))
	return end
	local queryA=exports['crime_database']:dbSet(string.format("UPDATE crime_users SET premiumdate = DATE(curdate()) + INTERVAL %d DAY WHERE id=%d",days,getElementData(plr,"player:uid")))
end

addEvent("kuppremkef1",true)
addEventHandler("kuppremkef1",root,function(premium)
    if not premium then return end 
    local days = tonumber(premium)
    local ppoints = getElementData(source,"ppoints")
    if ppoints < days then triggerClientEvent(source, "addNoti", source, "Nie posiadasz tyle punktów premium.", "error" ) return end
    local cel = getElementData(source,"id")
    local target=exports["crime_core"]:findPlayer(source,cel)
    if not target then
        --outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
        return
    end
    local ppoints = getElementData(source,"ppoints")
    setElementData(source,"ppoints",ppoints-days)
    setPremiumDay(target,days)
    
    setTimer(function()
        triggerEvent("save:player",root,target)
        triggerEvent("load:player",root,target)
        setElementData(target,"player:premium",true)
    end, 1000, 1)
    triggerClientEvent(source, "addNoti", source, "Kupiłeś premium na: "..days.." dni.", "success" )
    exports["crime_database"]:dbSet("insert into logs_ppspent values(NOW(),?,?,?,?)","PREMIUM",days,getElementData(source,"player:uid"))
end)

addEvent("kupkolorf1",true)
addEventHandler("kupkolorf1",root,function(kolor)
    if not kolor then return end 
    local ppoints = getElementData(source,"ppoints")
    if ppoints < 3 then triggerClientEvent(source, "addNoti", source, "Nie posiadasz tyle punktów premium.", "error" ) return end
    local cel = getElementData(source,"id")
    local target=exports["crime_core"]:findPlayer(source,cel)
    if not target then
        --outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
        return
    end
    local ppoints = getElementData(source,"ppoints")
    setElementData(source,"ppoints",ppoints-3)
    
    local queryA=exports['crime_database']:dbSet("UPDATE crime_users SET nick=? WHERE id=?",kolor,getElementData(source,"player:uid"))

    
    setTimer(function()
        triggerEvent("save:player",root,target)
        triggerEvent("load:player",root,target)
    end, 1000, 1)
    triggerClientEvent(source, "addNoti", source, "Kupiłes kolorowy nick.", "success" )
    exports["crime_database"]:dbSet("insert into logs_ppspent values(NOW(),?,?,?,?)","KOLOR NICKU "..kolor,3,getElementData(source,"player:uid"))
end)

addEvent("kuppjf1",true)
addEventHandler("kuppjf1",root,function()
    local days = 15
    local ppoints = getElementData(source,"ppoints")
    if ppoints < days then triggerClientEvent(source, "addNoti", source, "Nie posiadasz tyle punktów premium.", "error" ) return end
    local cel = getPedOccupiedVehicle(source)
    if not cel then triggerClientEvent(source, "addNoti", source, "Nie siedzisz w żadnym pojeździe.", "error" ) return end
    local mod = getElementModel(cel)
    if mod == 581 or mod == 568 or mod == 575 or mod == 507 or mod == 604 or mod == 503 or mod == 545 or mod == 522 or mod == 576 or mod == 586 or mod == 424 then 
        triggerClientEvent(source, "addNoti", source, "Ten pojazd nie może mieć custom paintjobu.", "error" )
    return end
    local id = getElementData(cel,"vehicle:id")
    if not id then triggerClientEvent(source, "addNoti", source, "Ten pojazd nie posiada ID.", "error" ) return end
    if getElementData(cel,"vehicle:cpj") == 1 then triggerClientEvent(source, "addNoti", source, "Ten pojazd już posiada custom paintjob.", "error" ) return end

    local ppoints = getElementData(source,"ppoints")
    setElementData(source,"ppoints",ppoints-days)
    setElementData(cel,"vehicle:cpj",1)
    
    triggerClientEvent(source, "addNoti", source, "Kupiłeś custom paintjob za: "..days.." PP", "success" )
    exports["crime_database"]:dbSet("insert into logs_ppspent values(NOW(),?,?,?,?)","Custom paintjob",days,getElementData(source,"player:uid"))
    exports["crime_database"]:dbSet("UPDATE crime_vehicles SET cpj=? WHERE id=? LIMIT 1",1,id)
end)



local koszulki = {
    {"player_torso","torso"},
    {"vestblack","vest"},
    {"vest","vest"},
    {"tshirt2horiz","tshirt2"},
    {"tshirtwhite","tshirt"},
    {"tshirtilovels","tshirt"},
    {"tshirtblunts","tshirt"},
    {"shirtbplaid","shirtb"},
    {"shirtbcheck","shirtb"},
    {"field","field"},
    {"tshirterisyell","tshirt"},
    {"tshirterisorn","tshirt"},
    {"trackytop2eris","trackytop1"},
    {"bbjackrim","bbjack"},
    {"bballjackrstar","bbjack"},
    {"baskballdrib","baskball"},
    {"baskballrim","baskball"},
    {"sixtyniners","tshirt"},
    {"bandits","baseball"},
    {"tshirtprored","tshirt"},
    {"tshirtproblk","tshirt"},
    {"trackytop1pro","trackytop1"},
    {"hockeytop","sweat"},
    {"bbjersey","sleevt"},
    {"shellsuit","trackytop1"},
    {"tshirtheatwht","tshirt"},
    {"tshirtbobomonk","tshirt"},
    {"tshirtbobored","tshirt"},
    {"tshirtbase5","tshirt"},
    {"tshirtsuburb","tshirt"},
    {"hoodyamerc","hoodya"},
    {"hoodyabase5","hoodya"},
    {"hoodyarockstar","hoodya"},
    {"wcoatblue","wcoat"},
    {"coach","coach"},
    {"coachsemi","coach"},
    {"sweatrstar","sweat"},
    {"hoodyAblue","hoodyA"},
    {"hoodyAblack","hoodyA"},
    {"hoodyAgreen","hoodyA"},
    {"sleevtbrown","sleevt"},
    {"shirtablue","shirta"},
    {"shirtayellow","shirta"},
    {"shirtagrey","shirta"},
    {"shirtbgang","shirtb"},
    {"tshirtzipcrm","tshirt"},
    {"tshirtzipgry","tshirt"},
    {"denimfade","denim"},
    {"bowling","hawaii"},
    {"hoodjackbeige","hoodjack"},
    {"baskballloc","baskball"},
    {"tshirtlocgrey","tshirt"},
    {"tshirtmaddgrey","tshirt"},
    {"tshirtmaddgrn","tshirt"},
    {"suit1grey","suit1"},
    {"suit1blk","suit1"},
    {"leather","leather"},
    {"painter","painter"},
    {"hawaiiwht","hawaii"},
    {"hawaiired","hawaii"},
    {"sportjack","trackytop1"},
    {"suit1red","suit1"},
    {"suit1blue","suit1"},
    {"suit1yellow","suit1"},
    {"suit2grn","suit2"},
    {"tuxedo","suit2"},
    {"suit1gang","suit1"},
    {"letter","sleevt"},
}

local fryzury = {
    {"player_face","head"},
    {"hairblond","head"},
    {"hairred","head"},
    {"hairblue","head"},
    {"hairgreen","head"},
    {"hairpink","head"},
    {"bald","head"},
    {"baldbeard","head"},
    {"baldtash","head"},
    {"baldgoatee","head"},
    {"highfade","head"},
    {"highafro","highafro"},
    {"wedge","wedge"},
    {"slope","slope"},
    {"jhericurl","jheri"},
    {"cornrows","cornrows"},
    {"cornrowsb","cornrows"},
    {"tramline","tramline"},
    {"groovecut","groovecut"},
    {"mohawk","mohawk"},
    {"mohawkblond","mohawk"},
    {"mohawkpink","mohawk"},
    {"mohawkbeard","mohawk"},
    {"afro","afro"},
    {"afrotash","afro"},
    {"afrobeard","afro"},
    {"afroblond","afro"},
    {"flattop","flattop"},
    {"elvishair","elvishair"},
    {"beard","head"},
    {"tash","head"},
    {"goatee","head"},
    {"afrogoatee","afro"},
}

local spodnie = {
    {"player_legs","legs"},
    {"worktrcamogrn","worktr"},
    {"worktrcamogry","worktr"},
    {"worktrgrey","worktr"},
    {"worktrkhaki","worktr"},
    {"tracktr","tracktr"},
    {"tracktreris","tracktr"},
    {"jeansdenim","jeans"},
    {"legsblack","legs"},
    {"legsheart","legs"},
    {"biegetr","chinosb"},
    {"tracktrpro","tracktr"},
    {"tracktrwhstr","tracktr"},
    {"tracktrblue","tracktr"},
    {"tracktrgang","tracktr"},
    {"bbshortwht","boxingshort"},
    {"boxshort","boxingshort"},
    {"bbshortred","boxingshort"},
    {"shellsuittr","tracktr"},
    {"shortsgrey","shorts"},
    {"shortskhaki","shorts"},
    {"chongergrey","chonger"},
    {"chongergang","chonger"},
    {"chongerred","chonger"},
    {"chongerblue","chonger"},
    {"shortsgang","shorts"},
    {"denimsgang","jeans"},
    {"denimsred","jeans"},
    {"chinosbiege","chinosb"},
    {"chinoskhaki","chinosb"},
    {"cutoffchinos","shorts"},
    {"cutoffchinosblue","shorts"},
    {"chinosblack","chinosb"},
    {"chinosblue","chinosb"},
    {"leathertr","leathertr"},
    {"leathertrchaps","leathertr"},
    {"suit1trgrey","suit1tr"},
    {"suit1trblk","suit1tr"},
    {"cutoffdenims","shorts"},
    {"suit1trred","suit1tr"},
    {"suit1trblue","suit1tr"},
    {"suit1tryellow","suit1tr"},
    {"suit1trgreen","suit1tr"},
    {"suit1trblk2","suit1tr"},
    {"suit1trgang","suit1tr"},
}

local buty = {
    {"foot","feet"},
    {"cowboyboot2","biker"},
    {"bask2semi","bask1"},
    {"bask1eris","bask1"},
    {"sneakerbincgang","sneaker"},
    {"sneakerbincblue","sneaker"},
    {"sneakerbincblk","sneaker"},
    {"sandal","flipflop"},
    {"sandalsock","flipflop"},
    {"flipflop","flipflop"},
    {"hitop","bask1"},
    {"convproblk","conv"},
    {"convproblu","conv"},
    {"convprogrn","conv"},
    {"sneakerprored","sneaker"},
    {"sneakerproblu","sneaker"},
    {"sneakerprowht","sneaker"},
    {"bask1prowht","bask1"},
    {"bask1problk","bask1"},
    {"boxingshoe","biker"},
    {"convheatblk","conv"},
    {"convheatred","conv"},
    {"convheatorn","conv"},
    {"sneakerheatwht","sneaker"},
    {"sneakerheatgry","sneaker"},
    {"sneakerheatblk","sneaker"},
    {"bask2heatwht","bask1"},
    {"bask2heatband","bask1"},
    {"timbergrey","bask1"},
    {"timberred","bask1"},
    {"timberfawn","bask1"},
    {"timberhike","bask1"},
    {"cowboyboot","biker"},
    {"biker","biker"},
    {"snakeskin","biker"},
    {"shoedressblk","shoe"},
    {"shoedressbrn","shoe"},
    {"shoespatz","shoe"},
}

local naszyjniki = {
    {"dogtag","neck"},
    {"neckafrica","neck"},
    {"stopwatch","neck"},
    {"necksaints","neck"},
    {"neckhash","neck"},
    {"necksilver","neck2"},
    {"neckgold","neck2"},
    {"neckropes","neck2"},
    {"neckropeg","neck2"},
    {"neckls","neck"},
    {"neckdollar","neck"},
    {"neckcross","neck"},
}

local zegarki = {
    {"watchpink","watch"},
    {"watchyellow","watch"},
    {"watchpro","watch"},
    {"watchpro2","watch"},
    {"watchsub1","watch"},
    {"watchsub2","watch"},
    {"watchzip1","watch"},
    {"watchzip2","watch"},
    {"watchgno","watch"},
    {"watchgno2","watch"},
    {"watchcro","watch"},
    {"watchcro2","watch"},
}

local twarz = {
    {"groucho","grouchos"},
    {"zorro","zorromask"},
    {"eyepatch","eyepatch"},
    {"glasses01","glasses01"},
    {"glasses04","glasses04"},
    {"bandred3","bandmask"},
    {"bandblue3","bandmask"},
    {"bandgang3","bandmask"},
    {"bandblack3","bandmask"},
    {"glasses01dark","glasses01"},
    {"glasses04dark","glasses04"},
    {"glasses03","glasses03"},
    {"glasses03red","glasses03"},
    {"glasses03blue","glasses03"},
    {"glasses03dark","glasses03"},
    {"glasses05dark","glasses03"},
    {"glasses05","glasses03"},
}

local czapka = {
    {"bandred","bandana"},
    {"bandblue","bandana"},
    {"bandgang","bandana"},
    {"bandblack","bandana"},
    {"bandred2","bandknots"},
    {"bandblue2","bandknots"},
    {"bandblack2","bandknots"},
    {"bandgang2","bandknots"},
    {"capknitgrn","capknit"},
    {"captruck","captruck"},
    {"cowboy","cowboy"},
    {"hattiger","cowboy"},
    {"helmet","helmet"},
    {"moto","moto"},
    {"boxingcap","boxingcap"},
    {"hockey","hockeymask"},
    {"capgang","cap"},
    {"capgangback","capback"},
    {"capgangside","capside"},
    {"capgangover","capovereye"},
    {"capgangup","caprimup"},
    {"bikerhelmet","bikerhelmet"},
    {"capred","cap"},
    {"capredback","capback"},
    {"capredside","capside"},
    {"capredover","capovereye"},
    {"capredup","caprimup"},
    {"capblue","cap"},
    {"capblueback","capback"},
    {"capblueside","capside"},
    {"capblueover","capovereye"},
    {"capblueup","caprimup"},
    {"skullyblk","skullycap"},
    {"skullygrn","skullycap"},
    {"hatmancblk","hatmanc"},
    {"hatmancplaid","hatmanc"},
    {"capzip","cap"},
    {"capzipback","capback"},
    {"capzipside","capside"},
    {"capzipover","capovereye"},
    {"capzipup","caprimup"},
    {"beretred","beret"},
    {"beretblk","beret"},
    {"capblk","cap"},
    {"capblkback","capback"},
    {"capblkside","capside"},
    {"capblkover","capovereye"},
    {"capblkup","caprimup"},
    {"trilbydrk","trilby"},
    {"trilbylght","trilby"},
    {"bowler","bowler"},
    {"bowlerred","bowler"},
    {"bowlerblue","bowler"},
    {"bowleryellow","bowler"},
    {"boater","boater"},
    {"bowlergang","bowler"},
    {"boaterblk","boater"},
}

addEvent("dejnagrode", true)
addEventHandler("dejnagrode", root, function(jaka, cowybral)
    local uid=getElementData(source,"player:uid")
    local plr = source
    if not uid then return end
    if cowybral == "nie" then 
        exports["crime_database"]:dbSet("insert into logs_lotterywin values(NOW(),?,?,?,?)",jaka,cowybral,uid)
    else
        exports["crime_database"]:dbSet("insert into logs_lotterywin values(NOW(),?,?,?,?)",jaka,cowybral,uid)
        local nick = getPlayerName(plr)

        if jaka == "Nic" then
        
        end
        if jaka == "CJ" then 
            setElementModel(source,0)
            randomciuch()
            local query=exports["crime_database"]:dbSet("UPDATE crime_users SET skin=? WHERE id=?", 0, uid)
        end
        if jaka == "Żółty" then 
            local query=exports["crime_database"]:dbSet("UPDATE crime_users SET nick=? WHERE id=?", "zolty", uid)
        end
        if jaka == "Limonkowy" then 
            local query=exports["crime_database"]:dbSet("UPDATE crime_users SET nick=? WHERE id=?", "limonkowy", uid)
        end
        if jaka == "Niebieski" then 
            local query=exports["crime_database"]:dbSet("UPDATE crime_users SET nick=? WHERE id=?", "niebieski", uid)
        end
        if jaka == "Fioletowy" then 
            local query=exports["crime_database"]:dbSet("UPDATE crime_users SET nick=? WHERE id=?", "fioletowy", uid)
        end
        -- if jaka == "Zielony" then 
        --     local query=exports["crime_database"]:dbSet("UPDATE crime_users SET nick=? WHERE id=?", "zielony", uid)
        -- end
        -- if jaka == "Czerwony" then 
        --     local query=exports["crime_database"]:dbSet("UPDATE crime_users SET nick=? WHERE id=?", "czerwony", uid)
        -- end
        -- if jaka == "Pomarańczowy" then 
        --     local query=exports["crime_database"]:dbSet("UPDATE crime_users SET nick=? WHERE id=?", "pomaranczowy", uid)
        -- end
        -- if jaka == "Szary" then 
        --     local query=exports["crime_database"]:dbSet("UPDATE crime_users SET nick=? WHERE id=?", "szary", uid)
        -- end
        if jaka == "Fiat Abarth 595" then 
            triggerEvent("zakupPojazdSalonloteria", plr, 410, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        end
        if jaka == "El Camino" then 
            triggerEvent("zakupPojazdSalonloteria", plr, 600, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        end
        if jaka == "Mercedes-Benz CLS63" then 
            triggerEvent("zakupPojazdSalonloteria", plr, 445, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        end
        if jaka == "Chevrolet Impala SS" then 
            triggerEvent("zakupPojazdSalonloteria", plr, 426, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        end
        if jaka == "Mercedes-Benz S600" then 
            triggerEvent("zakupPojazdSalonloteria", plr, 551, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        end
        if jaka == "Chevrolet Impala 59" then 
            triggerEvent("zakupPojazdSalonloteria", plr, 412, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        end
        if jaka == "Ford E150" then 
            triggerEvent("zakupPojazdSalonloteria", plr, 482, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        end
        -- if jaka == "Lincoln Town" then 
        --     triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał pojazd "..jaka.." przy bardzo małej szansie, gratulacje.", "premium" )
        --     triggerEvent("zakupPojazdSalonloteria", plr, 457, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        -- end
        -- if jaka == "Lincoln Town" then 
        --     triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał pojazd "..jaka.." przy bardzo małej szansie, gratulacje.", "premium" )
        --     triggerEvent("zakupPojazdSalonloteria", plr, 483, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        -- end
        -- if jaka == "Lincoln Town" then 
        --     triggerEvent("zakupPojazdSalonloteria", plr, 507, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        --     triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał pojazd "..jaka.." przy bardzo małej szansie, gratulacje.", "premium" )
        -- end
        -- if jaka == "Lincoln Town" then 
        --     triggerEvent("zakupPojazdSalonloteria", plr, 434, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        --     triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał pojazd "..jaka.." przy bardzo małej szansie, gratulacje.", "premium" )
        -- end
        -- if jaka == "Lincoln Town" then 
        --     triggerEvent("zakupPojazdSalonloteria", plr, 539, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        --     triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał pojazd "..jaka.." przy bardzo małej szansie, gratulacje.", "premium" )
        -- end
        -- if jaka == "Lincoln Town" then 
        --     triggerEvent("zakupPojazdSalonloteria", plr, 409, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
        --     triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał pojazd "..jaka.." przy bardzo małej szansie, gratulacje.", "premium" )
        -- end
        if jaka == "Lincoln Town" then 
            triggerEvent("zakupPojazdSalonloteria", plr, 572, 0, 50, 0, "255,255,255", "255,255,255", 0, 0, 0, 0, 0, "1.81", 0, 0, 0, 0, 255, "Benzyna", 8, 0, 0, 0, 0, 0, "loteria")
            triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał pojazd "..jaka.." przy bardzo małej szansie, gratulacje.", "premium" )
        end
        if jaka == "5k" then 
            givePlayerMoney(plr,5000)
        end
        if jaka == "15k" then 
            givePlayerMoney(plr,15000)
        end
        if jaka == "30k" then 
            givePlayerMoney(plr,30000)
        end
        if jaka == "40" then 
            givePlayerMoney(plr,40000)
        end
        if jaka == "60k" then 
            givePlayerMoney(plr,60000)
        end
        if jaka == "75k" then 
            givePlayerMoney(plr,75000)
            triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał 100.000 PLN przy bardzo małej szansie, gratulacje.", "premium" )
        end
        if jaka == "100k" then 
            givePlayerMoney(plr,100000)
            triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał 150.000 PLN przy bardzo małej szansie, gratulacje.", "premium" )
        end
        if jaka == "1PP" then 
            local pp = getElementData(plr,"ppoints") or 0
            setElementData(plr,"ppoints",pp+1)
        end
        if jaka == "2PP" then 
            local pp = getElementData(plr,"ppoints") or 0
            setElementData(plr,"ppoints",pp+2)
        end
        if jaka == "3PP" then 
            local pp = getElementData(plr,"ppoints") or 0
            setElementData(plr,"ppoints",pp+3)
        end
        if jaka == "4PP" then 
            local pp = getElementData(plr,"ppoints") or 0
            setElementData(plr,"ppoints",pp+4)
        end
        if jaka == "5PP" then 
            local pp = getElementData(plr,"ppoints") or 0
            setElementData(plr,"ppoints",pp+5)
            triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał 5PP przy bardzo małej szansie, gratulacje.", "premium" )
        end
        if jaka == "7PP" then 
            local pp = getElementData(plr,"ppoints") or 0
            setElementData(plr,"ppoints",pp+7)
            triggerClientEvent(root, "addNoti", root, "Gracz "..removeHex(nick).." wygrał 7PP przy bardzo małej szansie, gratulacje.", "premium" )
        end
        
        
        setTimer(function()
            local cel = getElementData(plr,"id")
            local target=exports["crime_core"]:findPlayer(plr,cel)
            triggerEvent("save:player",root,target)
            triggerEvent("load:player",root,target)
        end, 1000, 1)
    end

end)

function table.random ( theTable )
    return theTable[math.random ( #theTable )]
end

function randomciuch()
    local random = table.random(czapka)
    local random1 = table.random(twarz)
    local random2 = table.random(zegarki)
    local random3 = table.random(naszyjniki)
    local random4 = table.random(buty)
    local random5 = table.random(spodnie)
    local random6 = table.random(fryzury)
    local random7 = table.random(koszulki)

    addPedClothes ( source, random[1], random[2], 16 )
    addPedClothes ( source, random1[1], random1[2], 15 )
    addPedClothes ( source, random2[1], random2[2], 14 )
    addPedClothes ( source, random3[1], random3[2], 13 )
    addPedClothes ( source, random4[1], random4[2], 3 )
    addPedClothes ( source, random5[1], random5[2], 2 )
    addPedClothes ( source, random6[1], random6[2], 1 )
    addPedClothes ( source, random7[1], random7[2], 0 )

    local ciuch1 = getTypeIndexFromClothes ( random7[1], random7[2] ) or -1
    local ciuch2 = getTypeIndexFromClothes ( random6[1], random6[2] ) or -1
    local ciuch3 = getTypeIndexFromClothes ( random5[1], random5[2] ) or -1
    local ciuch4 = getTypeIndexFromClothes ( random4[1], random4[2] ) or -1
    local ciuch5 = getTypeIndexFromClothes ( random3[1], random3[2] ) or -1
    local ciuch6 = getTypeIndexFromClothes ( random2[1], random2[2] ) or -1
    local ciuch7 = getTypeIndexFromClothes ( random1[1], random1[2] ) or -1
    local ciuch8 = getTypeIndexFromClothes ( random[1], random[2] ) or -1

    ubrania = ""..ciuch1..","..ciuch2..","..ciuch3..","..ciuch4..","..ciuch5..","..ciuch6..","..ciuch7..","..ciuch8..""
    setElementData(source,"player:ciuchycj",ubrania)
end

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end