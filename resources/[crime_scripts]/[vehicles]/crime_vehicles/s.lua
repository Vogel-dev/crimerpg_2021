--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

vehicles=0
root=getRootElement()
resourceRoot=getResourceRootElement(getThisResource())

local nlOffsets={
	[411]={-1,0,-0.6},
	[470]={-1,0,-0.4},
	[541]={-0.9,0,-0.4},
	[549]={-0.9,0,-0.4},
	[587]={-1,0,-0.5},
}

local nlIDX={
	3962,1784,2113,2428,2352,2054
}

function getAdmin2(plr,level)
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
--///////////////////////////////////// WCZYTYWANIE POJAZDÓW /////////////////////////////////
function getVehicleHandlingProperty ( element, property )
    if isElement ( element ) and getElementType ( element ) == "vehicle" and type ( property ) == "string" then
        local handlingTable = getVehicleHandling ( element )
        local value = handlingTable[property]
 
        if value then
            return value
        end
    end
 
    return false
end

function table.random ( theTable )
    return theTable[math.random ( #theTable )]
end

function onRespawnVehicles(_,id,poss,nick)
	-- Settings (QUERY)
	if id then
		result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE parking=1 and not(police=1) AND id=?", id)
		query=exports["crime_database"]:dbSet("UPDATE crime_vehicles SET parking=0 WHERE id=?", id)
	else
		result=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE parking=0 and not(police=1)")
	end

	-- Pairs
	for ile,vehicle in pairs(result) do
        vehicles=ile
        if id then pos={poss[1], poss[2], poss[3], poss[4], poss[5], poss[6]}
        else pos=split(vehicle["pos"], ",") end

        local color=split(vehicle["color"], ",")
        local lights=split(vehicle["headlights"], ",")
        local veh=createVehicle(vehicle["model"], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6])
        setVehicleColor(veh, color[1], color[2], color[3], color[4],color[5], color[6], color[7], color[8],color[9], color[10], color[11], color[12])
		setVehicleHeadLightColor(veh, lights[1], lights[2], lights[3])
		setVehicleFuelTankExplodable ( veh, false )
        for i,v in ipairs(split(vehicle["panelstates"], ",")) do setVehiclePanelState(veh, i, tonumber(v)) end
		setVehicleDamageProof(veh, true)
		setVehicleFuelTankExplodable ( veh, false )
		setVehicleHandling(veh, "handlingFlags", 16777216)

		 for i,v in ipairs(split(vehicle["tuning"], ",")) do addVehicleUpgrade(veh, v) end

		setVehiclePlateText(veh, vehicle["rejestracja"])
		setElementFrozen(veh, (vehicle["frozen"]) > 0)
		setVehicleVariant(veh,vehicle['wariant'],255)
		setElementHealth(veh, vehicle["health"])
		setElementData(veh,"vehicle:spawn",true)

		if vehicle["paintjob"] ~= 3 then
        	setVehiclePaintjob(veh, vehicle["paintjob"])
		end
		
		--ITEMY AUTA

		itemy = {}

		setElementData(veh,"vehicle:ekwipunek",itemy)
		
		local resultcyce=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles_eq WHERE vid=?", vehicle["id"])
		if #resultcyce > 0 then
			local takiecos = 0
			for i,vcyce in pairs(resultcyce) do
				takiecos = takiecos+1
				if vcyce["przedmiot"] == "ziolo" then waga = 1 end 
				if vcyce["przedmiot"] == "kokaina" then waga = 1 end 
				if vcyce["przedmiot"] == "amunicja" then waga = 10 end 
				if vcyce["przedmiot"] == "rakietnica" then waga = 8000 end
				if vcyce["przedmiot"] == "ak47" then waga = 3420 end
				if vcyce["przedmiot"] == "m4" then waga = 3000 end
				if vcyce["przedmiot"] == "tec" then waga = 2000 end
				if vcyce["przedmiot"] == "pila" then waga = 3000 end
				if vcyce["przedmiot"] == "deagle" then waga = 1700 end
				if vcyce["przedmiot"] == "uzi" then waga = 2200 end
				if vcyce["przedmiot"] == "mp5" then waga = 2600 end
				if vcyce["przedmiot"] == "kastet" then waga = 600 end
				if vcyce["przedmiot"] == "palka" then waga = 500 end
				if vcyce["przedmiot"] == "snajperka" then waga = 5000 end
				if vcyce["przedmiot"] == "gasnica" then waga = 2000 end
				if vcyce["przedmiot"] == "spadochron" then waga = 500 end
				if vcyce["przedmiot"] == "cola" then waga = 500 end
				if vcyce["przedmiot"] == "woda" then waga = 300 end
				if vcyce["przedmiot"] == "kajdanki" then waga = 1000 end
				if vcyce["przedmiot"] == "kebab" then waga = 500 end
				if vcyce["przedmiot"] == "hamburger" then waga = 300 end
				if vcyce["przedmiot"] == "paralizator" then waga = 1300 end 
				if vcyce["przedmiot"] == "maska1" then waga = 500 end 
				if vcyce["przedmiot"] == "maska2" then waga = 500 end 
				if vcyce["przedmiot"] == "maska3" then waga = 500 end 
				if vcyce["przedmiot"] == "maska4" then waga = 500 end 

				if vcyce["przedmiot"] == "kanister" then waga = 5000 end
				if vcyce["przedmiot"] == "zestaw" then waga = 3000 end
				if vcyce["przedmiot"] == "zestawdwa" then waga = 5000 end

				if vcyce["przedmiot"] == "wedka" then waga = 500 end
				if vcyce["przedmiot"] == "wedka2" then waga = 600 end
				if vcyce["przedmiot"] == "wedka3" then waga = 700 end
				if vcyce["przedmiot"] == "karas" then waga = 200 end
				if vcyce["przedmiot"] == "leszcz" then waga = 200 end
				if vcyce["przedmiot"] == "okon" then waga = 200 end
				if vcyce["przedmiot"] == "ploc" then waga = 200 end
				if vcyce["przedmiot"] == "pstrag" then waga = 200 end
				if vcyce["przedmiot"] == "sandacz" then waga = 200 end
				if vcyce["przedmiot"] == "sum" then waga = 200 end
				if vcyce["przedmiot"] == "karp" then waga = 200 end
				if vcyce["przedmiot"] == "lin" then waga = 200 end
				if vcyce["przedmiot"] == "amur" then waga = 200 end
				if vcyce["przedmiot"] == "wegorz" then waga = 200 end
				if vcyce["przedmiot"] == "fladra" then waga = 300 end
				if vcyce["przedmiot"] == "rekin" then waga = 1000 end
				if vcyce["przedmiot"] == "plecak" then waga = 500 end

				table.insert(itemy, {vcyce["przedmiot"], vcyce["ilosc"], waga, false, takiecos})
			end
			setElementData(veh,"vehicle:ekwipunek",itemy)
		end

		--END ITEMY AUTA
		
		setElementData(veh,"vehicle:id",vehicle["id"])
		setElementData(veh,"vehicle:desc",vehicle["desc"] or false)
		setElementData(veh,"vehicle:fuel",vehicle["fuel"])
		setElementData(veh,"vehicle:bak",vehicle["bak"])
		setElementData(veh,"vehicle:mileage",vehicle["mileage"])
		setElementData(veh,"vehicle:driver",vehicle["driver"])
		setElementData(veh,"vehicle:ownedPlayer",vehicle["ownedPlayer"])
		setElementData(veh,"vehicle:ownedGroup",vehicle["ownedGroup"])
		if vehicle["neon"] == 1 then 
			setElementData(veh,"vehicle:neon",1)
		end
		if vehicle["neon"] == 2 then 
			setElementData(veh,"vehicle:neon",2)
		end
		setElementData(veh,"vehicle:zamaskowany",vehicle["zamaskowany"])
		setElementData(veh,"vehicle:naped",vehicle["naped"])
		setElementData(veh,"vehicle:drzwidogory",vehicle["drzwidogory"])
		if vehicle["drzwidogory"] == 1 then 
			setElementData(veh,"tuning.lsdDoor",1)
		else
			setElementData(veh,"tuning.lsdDoor",false)
		end
		setElementData(veh,"vehicle:atrapa",vehicle["atrapa"])
		setElementData(veh,"vehicle:silnik",vehicle["silnik"])
		setElementData(veh,"vehicle:tarcze",vehicle["tarcze"])
		setElementData(veh,"vehicle:zawieszenie",vehicle["zawieszenie"])
		setElementData(veh,"vehicle:zawieszeniepoziom",0)
		setElementData(veh,"vehicle:karbon",vehicle["karbon"])
		setElementData(veh,"vehicle:chiptuning",vehicle["chiptuning"])
		setElementData(veh,"vehicle:klakson",vehicle["klakson"])
		setElementData(veh,"vehicle:typsilnika",vehicle["typsilnika"])
		setElementData(veh,"vehicle:cylindry",vehicle["cylindry"])
		setElementData(veh,"vehicle:trakcja",vehicle["trakcja"])
		setElementData(veh,"vehicle:lpg",vehicle["lpg"])
		setElementData(veh,"vehicle:lpgfuel",vehicle["lpgfuel"])
		setElementData(veh,"vehicle:wlaczonelpg",false)
		setElementData(veh,"vehicle:us1",vehicle["us1"])
		setElementData(veh,"vehicle:us2",vehicle["us2"])
		setElementData(veh,"vehicle:us3",vehicle["us3"])
		setElementData(veh,"vehicle:cpj",vehicle["cpj"])

		if vehicle["cpj"] == 1 then 
			triggerClientEvent(root, "paintjob->TryToAddToVehicle", root, veh, 1)
			setElementData(veh, "vehicle.paintjob", 1)
		end

		neon = vehicle["neon"]
		zamaskowany = vehicle["zamaskowany"]
		drzwidogory = vehicle["drzwidogory"]
		atrapa = vehicle["atrapa"]
		silnik = vehicle["silnik"]
		tarcze = vehicle["tarcze"]
		karbon = vehicle["karbon"]
		chiptuning = vehicle["chiptuning"]
		cylindry = vehicle["cylindry"]
		trakcja = vehicle["trakcja"]
		us1 = vehicle["us1"]
		us2 = vehicle["us2"]
		us3 = vehicle["us3"]

		local trujcipa=getVehicleHandling ( veh )
		local fast = trujcipa["engineAcceleration"]-3
		local maxfast = trujcipa["maxVelocity"]-20
		local masa = trujcipa["mass"]
		local silnik = string.format("%.1f", silnik)
		if tonumber(silnik) == 1.0 then 
			setVehicleHandling(veh,"engineAcceleration",fast)
			setVehicleHandling(veh,"maxVelocity",maxfast)
			setVehicleHandling(veh,"mass",masa)
		elseif tonumber(silnik) == 1.2 then 
			setVehicleHandling(veh,"engineAcceleration",fast+0.2)
			setVehicleHandling(veh,"maxVelocity",maxfast+5)
			setVehicleHandling(veh,"mass",masa+50)
		elseif tonumber(silnik) == 1.4 then 
			setVehicleHandling(veh,"engineAcceleration",fast+0.5)
			setVehicleHandling(veh,"maxVelocity",maxfast+10)
			setVehicleHandling(veh,"mass",masa+80)
		elseif tonumber(silnik) == 1.6 then 
			setVehicleHandling(veh,"engineAcceleration",fast+0.8)
			setVehicleHandling(veh,"maxVelocity",maxfast+15)
			setVehicleHandling(veh,"mass",masa+120)
		elseif tonumber(silnik) == 1.8 then 
			setVehicleHandling(veh,"engineAcceleration",fast+1.1)
			setVehicleHandling(veh,"maxVelocity",maxfast+20)
			setVehicleHandling(veh,"mass",masa+150)
		elseif tonumber(silnik) == 2.0 then 
			setVehicleHandling(veh,"engineAcceleration",fast+1.5)
			setVehicleHandling(veh,"maxVelocity",maxfast+25)
			setVehicleHandling(veh,"mass",masa+160)
		elseif tonumber(silnik) == 2.2 then 
			setVehicleHandling(veh,"engineAcceleration",fast+1.7)
			setVehicleHandling(veh,"maxVelocity",maxfast+31)
			setVehicleHandling(veh,"mass",masa+170)
		elseif tonumber(silnik) == 2.4 then 
			setVehicleHandling(veh,"engineAcceleration",fast+2)
			setVehicleHandling(veh,"maxVelocity",maxfast+35)
			setVehicleHandling(veh,"mass",masa+180)
		elseif tonumber(silnik) == 2.6 then 
			setVehicleHandling(veh,"engineAcceleration",fast+2.5)
			setVehicleHandling(veh,"maxVelocity",maxfast+38)
			setVehicleHandling(veh,"mass",masa+190)
		elseif tonumber(silnik) == 2.8 then 
			setVehicleHandling(veh,"engineAcceleration",fast+3)
			setVehicleHandling(veh,"maxVelocity",maxfast+41)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 3.0 then 
			setVehicleHandling(veh,"engineAcceleration",fast+3.5)
			setVehicleHandling(veh,"maxVelocity",maxfast+45)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 3.2 then 
			setVehicleHandling(veh,"engineAcceleration",fast+4)
			setVehicleHandling(veh,"maxVelocity",maxfast+49)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 3.4 then 
			setVehicleHandling(veh,"engineAcceleration",fast+4.5)
			setVehicleHandling(veh,"maxVelocity",maxfast+52)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 3.6 then 
			setVehicleHandling(veh,"engineAcceleration",fast+5)
			setVehicleHandling(veh,"maxVelocity",maxfast+55)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 3.8 then 
			setVehicleHandling(veh,"engineAcceleration",fast+5.5)
			setVehicleHandling(veh,"maxVelocity",maxfast+57)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 4.0 then 
			setVehicleHandling(veh,"engineAcceleration",fast+6)
			setVehicleHandling(veh,"maxVelocity",maxfast+60)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 4.2 then 
			setVehicleHandling(veh,"engineAcceleration",fast+6.5)
			setVehicleHandling(veh,"maxVelocity",maxfast+63)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 4.4 then 
			setVehicleHandling(veh,"engineAcceleration",fast+7)
			setVehicleHandling(veh,"maxVelocity",maxfast+66)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 4.6 then 
			setVehicleHandling(veh,"engineAcceleration",fast+7.3)
			setVehicleHandling(veh,"maxVelocity",maxfast+69)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 4.8 then 
			setVehicleHandling(veh,"engineAcceleration",fast+7.5)
			setVehicleHandling(veh,"maxVelocity",maxfast+72)
			setVehicleHandling(veh,"mass",masa+200)
		elseif tonumber(silnik) == 5.0 then 
			setVehicleHandling(veh,"engineAcceleration",fast+7.8)
			setVehicleHandling(veh,"maxVelocity",maxfast+75)
			setVehicleHandling(veh,"mass",masa+200)
		end
		
		local trujcipa=getVehicleHandling ( veh )
		local fast = trujcipa["engineAcceleration"]
		local maxfast = trujcipa["maxVelocity"]
		local masa = trujcipa["mass"]
		if cylindry == 4 then 
			setVehicleHandling(veh,"engineAcceleration",fast)
			setVehicleHandling(veh,"maxVelocity",maxfast)
		elseif cylindry == 6 then
			setVehicleHandling(veh,"engineAcceleration",fast+0.4)
			setVehicleHandling(veh,"maxVelocity",maxfast+10)
		elseif cylindry == 8 then
			setVehicleHandling(veh,"engineAcceleration",fast+0.7)
			setVehicleHandling(veh,"maxVelocity",maxfast+14)
		elseif cylindry == 10 then
			setVehicleHandling(veh,"engineAcceleration",fast+1)
			setVehicleHandling(veh,"maxVelocity",maxfast+17)
		elseif cylindry == 12 then
			setVehicleHandling(veh,"engineAcceleration",fast+1.3)
			setVehicleHandling(veh,"maxVelocity",maxfast+24)
		elseif cylindry == 14 then
			setVehicleHandling(veh,"engineAcceleration",fast+1.6)
			setVehicleHandling(veh,"maxVelocity",maxfast+27)
		elseif cylindry == 16 then
			setVehicleHandling(veh,"engineAcceleration",fast+1.9)
			setVehicleHandling(veh,"maxVelocity",maxfast+30)
		elseif cylindry == 18 then
			setVehicleHandling(veh,"engineAcceleration",fast+2.3)
			setVehicleHandling(veh,"maxVelocity",maxfast+34)
		elseif cylindry == 20 then
			setVehicleHandling(veh,"engineAcceleration",fast+2.6)
			setVehicleHandling(veh,"maxVelocity",maxfast+39)
		end

		local trujcipa=getVehicleHandling ( veh )
		local fast = trujcipa["engineAcceleration"]
		local maxfast = trujcipa["maxVelocity"]
		local masa = trujcipa["mass"]
		if chiptuning == 1 then 
			setVehicleHandling(veh,"engineAcceleration",fast+0.3)
			setVehicleHandling(veh,"maxVelocity",maxfast+5)
		elseif chiptuning == 2 then 
			setVehicleHandling(veh,"engineAcceleration",fast+0.6)
			setVehicleHandling(veh,"maxVelocity",maxfast+7)
		elseif chiptuning == 3 then 
			setVehicleHandling(veh,"engineAcceleration",fast+0.9)
			setVehicleHandling(veh,"maxVelocity",maxfast+10)
		end
		if us1 == 1 then 
			local trujcipa=getVehicleHandling ( veh )
			local fast = trujcipa["engineAcceleration"]
			local maxfast = trujcipa["maxVelocity"]
			local masa = trujcipa["mass"]
			setVehicleHandling(veh,"engineAcceleration",fast+0.3)
			setVehicleHandling(veh,"maxVelocity",maxfast+5)
		end	
		if us2 == 1 then 
			local trujcipa=getVehicleHandling ( veh )
			local fast = trujcipa["engineAcceleration"]
			local maxfast = trujcipa["maxVelocity"]
			local masa = trujcipa["mass"]
			setVehicleHandling(veh,"engineAcceleration",fast+0.3)
			setVehicleHandling(veh,"maxVelocity",maxfast+5)
		end	
		if us3 == 1 then 
			local trujcipa=getVehicleHandling ( veh )
			local fast = trujcipa["engineAcceleration"]
			local maxfast = trujcipa["maxVelocity"]
			local masa = trujcipa["mass"]
			setVehicleHandling(veh,"engineAcceleration",fast+0.3)
			setVehicleHandling(veh,"maxVelocity",maxfast+5)
		end	

		local trujcipa=getVehicleHandling ( veh )
		local trak1 = trujcipa["tractionMultiplier"]
		local trak2 = trujcipa["tractionLoss"]
		if trakcja == 1 then 
			setVehicleHandling(veh,"tractionMultiplier",trak1+0.07)
			setVehicleHandling(veh,"tractionLoss",trak2+0.05)
		elseif trakcja == 2 then 
			setVehicleHandling(veh,"tractionMultiplier",trak1+0.14)
			setVehicleHandling(veh,"tractionLoss",trak2+0.10)
		elseif trakcja == 3 then 
			setVehicleHandling(veh,"tractionMultiplier",trak1+0.21)
			setVehicleHandling(veh,"tractionLoss",trak2+0.15)
		end

		local trujcipa=getVehicleHandling ( veh )
		local ham = trujcipa["brakeDeceleration"]
		if tarcze == 1 then 
			setVehicleHandling(veh,"brakeDeceleration",ham+5)
		elseif tarcze == 2 then 
			setVehicleHandling(veh,"brakeDeceleration",ham+15)
		elseif tarcze == 3 then 
			setVehicleHandling(veh,"brakeDeceleration",ham+25)
		end
		

		if zamaskowany ~= 0 then 
			setTimer(function()
				triggerClientEvent(root, "vehicle:szyby", root, veh)
			end, 1000, 1)
		end
		
		if atrapa == 1 then
			addVehicleUpgrade(veh,1010)
			setTimer(function()
				triggerClientEvent(root, "vehicle:nitrooff", root, veh)
			end, 1000, 1)
		end

		if drzwidogory == 1 then
			setTimer(function()
				triggerClientEvent(root, "vehicle:drzwi", root, veh)
			end, 1000, 1)
		end
		
		if karbon == 1 then
			triggerClientEvent(root, "paintjob->TryToAddToVehicle", root, veh, 1)
			setElementData(veh, "vehicle.paintjob", 1)
			local trujcipa=getVehicleHandling ( veh )
			local masa = trujcipa["mass"]
			liczesobie = masa/4
			--setVehicleHandling(veh,"mass",masa+-liczesobie)
		end
		
		
		if nick then
			local kto = getPlayerFromName ( nick )
			setElementPosition(kto, poss[1], poss[2], poss[3])
			warpPedIntoVehicle(kto, veh)
			setVehicleEngineState(veh,true)
			setElementFrozen(veh,false)
			setVehicleOverrideLights ( veh, 2 )
		end

		if (type(vehicle['rent']) == "string") then
			local tabelka = {}
			local rente = split(vehicle['rent'], ',')
			for k,v in ipairs(rente) do
			table.insert(tabelka,v)
			end
			setElementData(veh,"vehicle:rent", tabelka or false)
			else
			setElementData(veh,"vehicle:rent",0)
			end
		

		--[[if getElementData(veh,"vehicle:neon") ~= 0 then
			local m = getElementModel(veh)
			local of
			if not nlOffsets[m] then
				of={-1,0,-0.5}
			else
				of=nlOffsets[m]
			end
			neon1=createObject(nlIDX[getElementData(veh,"vehicle:neon")],0,0,0)
			neon2=createObject(nlIDX[getElementData(veh,"vehicle:neon")],0,0,0)
			setElementData(veh,"zneony", {neon1, neon2})
			attachElements(neon1,veh,of[1],of[2],of[3])
			attachElements(neon2,veh,-of[1],of[2],of[3])
			setElementAlpha(neon1,0)
			setElementAlpha(neon2,0)
		end]]--
	end
end	

--///////////////////////////////////// ZAPISYWANIE POJAZDÓW /////////////////////////////////

function onSaveVehicle(vehicle)
    if getElementData(vehicle,"vehicle:spawn") then
    	-- Setting
        local panelstates={}
		local model=getElementModel(vehicle)
        local health=getElementHealth(vehicle)
        local x,y,z=getElementPosition(vehicle)
        local rx,ry,rz=getElementRotation(vehicle)
        local desc=getElementData(vehicle,"vehicle:desc") or ""
        local id=getElementData(vehicle,"vehicle:id")
		local fuel=getElementData(vehicle,"vehicle:fuel")
		local lpgfuel=getElementData(vehicle,"vehicle:lpgfuel") or 0
        local mileage=getElementData(vehicle,"vehicle:mileage")
        local c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12=getVehicleColor(vehicle, true)
        local driver=getElementData(vehicle,"vehicle:driver") or ""
        local rent=getElementData(vehicle,"vehicle:rent")
		local player=getElementData(vehicle,"vehicle:ownedPlayer")

		local lsddoor = getElementData(vehicle,"tuning.lsdDoor")

		if lsddoor == true then 
			lsddoor = 1 
		else 
			lsddoor = 0 
		end
		if getElementData(vehicle,"vehicle:drzwidogory") == 1 then 
			lsddoor = 1 
		end

		if getElementData(vehicle,"tuning.lsdDoor") == 0 or getElementData(vehicle,"tuning.lsdDoor") == false then 
			lsddoor = 0
		end
		
		local itemy = getElementData(vehicle,"vehicle:ekwipunek")

		local usunto=exports["crime_database"]:dbGet("DELETE FROM crime_vehicles_eq WHERE vid=?", id) -- usuwanie całego eq auta
		for i,v in pairs(itemy) do 
			local zapiszto=exports["crime_database"]:dbSet("INSERT INTO crime_vehicles_eq (vid, przedmiot, ilosc) VALUES (?,?,?)", id, itemy[i][1], itemy[i][2])
		end

		
        local h1,h2,h3=getVehicleHeadLightColor(vehicle)
        local paintjob=getVehiclePaintjob(vehicle)
		local rear="Brak"

        local frozen= isElementFrozen(vehicle) and 1 or 0
        for i=0,6 do table.insert(panelstates, getVehiclePanelState(vehicle,i)) end
        panelstates=table.concat(panelstates,",")
        upgrades=getVehicleUpgrades(vehicle)
        if not upgrades then upgrades={} end
        upgrades=table.concat(upgrades, ",")
        -- Query
        local query = exports["crime_database"]:dbSet(string.format("UPDATE crime_vehicles SET model='%d', drzwidogory='%d', pos='%.2f,%.2f,%.2f,%.2f,%.2f,%.2f', rent='%d',text='%s', health='%d', fuel='%d', lpgfuel='%d', mileage='%d', frozen='%d', driver='%s', color='%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d', panelstates='%s', paintjob='%d', tuning='%s', headlights='%d,%d,%d', blokada='%s' WHERE id=%d",
		model, lsddoor, x,y,z, rx,ry,rz, "0",desc,health, fuel, lpgfuel, mileage, frozen, driver, c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12, panelstates, paintjob, upgrades, h1,h2,h3, tostring(blokada), id))
		if (type(rent) == "table") then
		local rr = string.format("%s", table.concat(rent, ',') )
	--	outputDebugString(rr)
		local query2= exports['crime_database']:dbSet("UPDATE crime_vehicles SET rent=? WHERE id=?",rr,id)
		end
    end
end

function onParkVehicle(vehicle) 
	local query=exports["crime_database"]:dbSet("UPDATE crime_vehicles SET parking=1 WHERE id=?", getElementData(vehicle,"vehicle:id"))
	if query then
		local zneony=getElementData(vehicle,"zneony")
		if (zneony and type(zneony)=="table") then
		destroyElement(zneony[1])
		destroyElement(zneony[2])
		removeElementData(vehicle,"zneony")
		end
        destroyElement(vehicle)
	end
end

--///////////////////////////////////// SPRAWDZANIE USTAWIEŃ /////////////////////////////////
function getSettings(plr,code,value)
	local uid=getElementData(plr,"player:uid")
	if not uid then return end
	if value == "faction" then
		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_factions WHERE code=? AND uid=?", code, uid)
		if result and #result > 0 then
			return result[1].code
		else
			return false
		end
	end
	if value == "organization" then
		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE org=? AND id=?", code, uid)
		if result and #result > 0 then
			return result[1].code
		else
			return false
		end
	end
	if value == "owner" then
		local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", uid)
		if result and #result > 0 then
			return result[1].id
		else
			return false
		end
	end
end

--///////////////////////////////////// INNE USTAWIENIA /////////////////////////////////
addEventHandler("onVehicleExit", root, function(plr,seat)
    if seat ~= 0 then return end 
	if isElement(source) then
   	onSaveVehicle(source)
   	--setVehicleEngineState(source, false)
	setVehicleDamageProof(source, true)
	end
end)


addEventHandler("onPlayerQuit", root, function()
    local veh=getPedOccupiedVehicle(source)
    if veh then
		setVehicleDamageProof(source, true)
    	onSaveVehicle(veh)
    end
end)

addEventHandler("onResourceStop", resourceRoot, function()
    for i,v in ipairs(getElementsByType("vehicle")) do
    	onSaveVehicle(v)
		local zneony=getElementData(v,"zneony")
		if (zneony and type(zneony)=="table") then
		destroyElement(zneony[1])
		destroyElement(zneony[2])
		removeElementData(v,"zneony")
		end
    end
end)

addEventHandler("onVehicleEnter", root, function(plr,seat)
	if getElementType(plr) ~= "player" then return end
	if seat ~= 0 then return end
	if source then
		for i=0,5 do
			setVehicleDoorOpenRatio ( source, i, 0, 2500 )
		end
	end
	--setVehicleEngineState(source, false)
	setElementData(source,"vehicle:driver",getPlayerName(plr))
end)


--///////////////////////////////////// SPRAWDZENIE WŁAŚCICIELA /////////////////////////////////
addEventHandler("onVehicleStartEnter", resourceRoot, function(plr,seat,jacked)
    if seat == 0 then
    	local rent=getElementData(source, "vehicle:rent")
    	local group=getElementData(source, "vehicle:ownedGroup")
		if group == "0" then group = "Brak" end
    	local player=getElementData(source, "vehicle:ownedPlayer")
		if getAdmin2(plr, 6) then
			return
		end
		if rent and (type(rent) == "table") then
			for i,s in pairs(rent) do
				if tonumber(s) == getElementData(plr,"player:uid") then
				return end
			end
		end
		
		local plrgroup = getElementData(plr,"player:organization")
		if plrgroup then
			if plrgroup == group then return end
		end
		if player and player ~= getSettings(plr,false,"owner") then
			triggerClientEvent(plr, "addNoti", plr, "Nie posiadasz kluczy do tego pojazdu.", "error" )
			cancelEvent()
		end
    end
end)

addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
	if jacked then 
		if getElementData(source,"vehicle:ownedPlayer") == getElementData(plr,"player:uid") then return end
		cancelEvent()
	end
end)

addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
	if seat == 0 then
		if getElementData(source,"spawnowany")== true then
			if getElementData(plr,"player:admin")== false then
				cancelEvent()
			end
		end
	end
end)

addEventHandler("onElementDestroy", getRootElement(), function ()
  if getElementType(source) == "vehicle" then
  	local zneony=getElementData(source,"zneony")
	if (zneony and type(zneony)=="table") then
		destroyElement(zneony[1])
		destroyElement(zneony[2])
		removeElementData(source,"zneony")
		end
	end
end)


addEventHandler("onResourceStart", resourceRoot, function() onRespawnVehicles(_,false) end)


--[[
vehicles retrieval - mechanizm wylawiajacy pojazdy z wody
@author Lukasz Biegaj <wielebny@bestplay.pl>
@author Karer <karer.programmer@gmail.com>
@author WUBE <wube@lss-rp.pl>
@copyright 2011-2013 Lukasz Biegaj <wielebny@bestplay.pl>
]]--



function shuffle(t)
  local n = #t
 
  while n >= 2 do
    -- n is now the last pertinent index
    local k = math.random(n) -- 1 <= k <= n
    -- Quick swap
    t[n], t[k] = t[k], t[n]
    n = n - 1
  end
  return t
end

function pojazdywoda()
	for i,v in pairs(getElementsByType("vehicle")) do 
		if isVehicleBlown(v) == true then 
			fixVehicle(v)
			setElementHealth(v,1000)
		end

		local mod = getElementModel(v)
		if mod == 472 or mod == 473 or mod == 493 or mod == 595 or mod == 484 or mod == 430 or mod == 453 or mod == 452 or mod == 446 or mod == 454 then
			
		else 
			if isElementInWater(v) and getVehicleOccupant(v,0) then 
				local x,y,z = getElementPosition(v)
				setElementPosition(v,x,y,z-100)
			end

			if isElementInWater(v) and not getVehicleController(v) then
				if getElementData(v, "vehicle:id") then
					onParkVehicle(v)
				else
					respawnVehicle(v)
				end
			end
		end
	end
end
setTimer(pojazdywoda, 5000, 0)


local pozwolone ={ 
[471] = true, -- quad
[453] = true, -- kutry
}
--//////////////////////////////////////////////////////// Licencje
local categoryA={[463] = true,[461] = true,[581] = true,[448] = true,[468] = true,[521] = true,[522] = true,[523] = true} 
local categoryB={[602] = true,[545] = true,[496] = true,[517] = true,[401] = true,[410] = true,[518] = true,[600] = true,[527] = true,[436] = true,[589] = true,[580] = true,[419] = true,[439] = true,[533] = true,[549] = true,[526] = true,[491] = true,[474] = true,[445] = true,[467] = true,[604] = true,[426] = true,[507] = true,[547] = true,[585] = true,[405] = true,[587] = true,[409] = true,[466] = true,[550] = true,[492] = true,[566] = true,[546] = true,[540] = true,[551] = true,[421] = true,[516] = true,[529] = true,[488] = true,[460] = true,
[469] = true,[487] = true,[510] = true,[509] = true,[481] = true,[586] = true,[472] = true,[473] = true,[493] = true,[595] = true,[484] = true,[430] = true,[453] = true,[452] = true,[446] = true,[454] = true,[485] = true,[552] = true,
[438] = true,[574] = true,[420] = true,[525] = true,[408] = true,[596] = true,[597] = true,[427] = true,[599] = true,[490] = true,[432] = true,[528] = true,[601] = true,[407] = true,[544] = true,[470] = true,[598] = true,[588] = true,
[532] = true,[443] = true,[486] = true,[531] = true,[543] = true,[422] = true,[583] = true,[478] = true,[605] = true,[554] = true,[530] = true,[418] = true,[572] = true,[582] = true,[536] = true,[575] = true,[534] = true,
[567] = true,[535] = true,[576] = true,[412] = true,[402] = true,[542] = true,[603] = true,[475] = true,[449] = true,[537] = true,[570] = true,[441] = true,[464] = true,[501] = true,[465] = true,[564] = true,[568] = true,[557] = true,[424] = true,[504] = true,[495] = true,[457] = true,[539] = true,[483] = true,[571] = true,[500] = true, 
[444] = true,[556] = true,[429] = true,[411] = true,[541] = true,[559] = true,[415] = true,[561] = true,[480] = true,[560] = true,[562] = true,[506] = true,[565] = true,[451] = true,[434] = true,[558] = true,[494] = true,[555] = true,[502] = true,[477] = true,[503] = true,[579] = true,[400] = true,[404] = true,[489] = true,[505] = true,[479] = true,[442] = true,[458] = true,
[606] = true,[607] = true,[610] = true,[590] = true,[569] = true,[611] = true,[584] = true,[608] = true,[435] = true,[450] = true,[591] = true,[594] = true,[482] = true,[413] = true}
local categoryC={[403] = true,[406] = true,[414] = true,[416] = true,[423] = true,[428] = true,[431] = true,[433] = true,[437] = true,[440] = true,[455] = true,[456] = true,[459] = true,[498] = true,[499] = true,[508] = true,[514] = true,[515] = true,[524] = true,[538] = true,[573] = true}
addEventHandler("onVehicleStartEnter", resourceRoot, function(plr,seat,jacked)
    if seat == 0 then
		if pozwolone[getElementModel(source)] then return end
		if categoryA[getElementModel(source)] then
		   if exports["crime_settings"]:getVehicleLicense(plr,"A","prawko") then
			cancelEvent()
			end
		elseif categoryB[getElementModel(source)] then
			if exports["crime_settings"]:getVehicleLicense(plr,"B","prawko") then
			cancelEvent()
			end
		elseif categoryC[getElementModel(source)] then
			if exports["crime_settings"]:getVehicleLicense(plr,"C","prawko") then
			cancelEvent()
			end
		end
    end
end)

--[[

function zrespcj(plr,cmd,test)
	local x,y,z = getElementPosition(plr)
	local veh = createVehicle(528,x,y,z)
	attachElementToElement(plr,veh,0,-1,1.5)
end
addCommandHandler("zrespcj", zrespcj)


function zrespcj(plr,cmd,test)
	local veh = getPedOccupiedVehicle(plr)
	local hand = getVehicleHandling (veh)
	outputChatBox(tostring(hand["handlingFlags"]))
end
addCommandHandler("siemakurwa", zrespcj)]]--