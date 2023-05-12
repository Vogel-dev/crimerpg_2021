--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local blip = createBlip(1782.37, -1723.00, 13.55, 55, 0, 0, 0, 0, 0, 0, 200) --salon samochodowy
local blip = createBlip(2127.89, -1127.12, 25.58, 55, 0, 0, 0, 0, 0, 0, 200) --komis samochodowy
-- local blip = createBlip(1782.37, -1723.00, 13.55, 54, 0, 0, 0, 0, 0, 0, 200) --salon motocyklowy
local blip = createBlip(532.34, -1921.81, 0.07, 5, 0, 0, 0, 0, 0, 0, 200) --lodzie


function formatujnaprzecinki(amount) 
	local formatted = amount 
	while true do   
	  formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2') 
	  if (k==0) then 
		break 
	  end 
	end 
	return formatted 
end

local positionVehicles = {
	--NAZWA ID PRZEBIEG CENA X Y Z RX RY RZ SILNK CYLINDRY JAKISILNIK TYP WARIANT
	
	--zlomowisko
		{'Dodge Monaco 74', 604, math.random(23112,99999), 8000,2356.53, -1926.48, 13.14, 0.9, 0.2, 58.9, 1.21, 2,"Diesel","cygan", 0},
		{'Annis Vassal', 422, math.random(23412,99999), 31500,2364.09, -1920.95, 13.37, 359.3, 0.5, 356.3, 1.21, 4,"Diesel","cygan", 0},
		{'Hedgehog', 589, math.random(23412,99999), 31500,2349.33, -1905.88, 13.22, 360.0, 359.9, 267.7, 1.21, 4,"Diesel","cygan", 0},
		{'Fiat Abarth 595', 410, math.random(23112,99999), 20000,2363.35, -1899.76, 13.07, 0.5, 359.9, 148.6, 1.21, 4,"Diesel","cygan", 0},
		{'Audi A6 C4', 516, math.random(23142,99999), 50000,2358.28, -1886.42, 13.39, 359.9, 359.4, 169.1, 1.41, 4,"Diesel","cygan", 0},
		{'BMW M635', 439, math.random(23141,99999), 58000,2364.43, -1907.16, 13.18, 0.1, 360.0, 179.0, 1.41, 4,"Diesel","cygan", 0},
		{'Mercedes-Benz W126', 533, math.random(23141,99999), 40000,2350.51, -1889.52, 13.26, 0.3, 360.0, 265.4, 1.41, 4,"Diesel","cygan", 0},
		{'Honda Civic', 436, math.random(23142,99999), 35000,2348.66, -1927.51, 13.23, 359.6, 0.6, 323.4, 1.21, 4,"Diesel","cygan", 0},
		{'S150 Majesta', 421, math.random(23141,99999), 39000,2359.77, -1923.18, 13.25, 0.4, 0.4, 35.3, 1.41, 4,"Diesel","cygan", 0},
	--salon_tier1
		{'Aston Martin DBS', 429, 0, 200000, 1807.03, -1719.33, 13.41, 359.6, 0.0, 76.1, 2.61, 8, "Benzyna", "salon2", 0},
		{'Ferrari Testarossa', 415, 0, 168000, 1807.07, -1715.12, 13.32, 0.4, 0.0, 79.1, 2.41, 8, "Benzyna", "salon2", 0},
		{'Lamborghini Countach', 411, 0, 200000, 1807.38, -1711.54, 13.28, 0.3, 0.0, 79.1, 2.61, 8, "Benzyna", "salon2", 0},
		{'Ferrari Berlinetta F355', 451, 0, 168000, 1807.45, -1707.06, 13.25, 360.0, 360.0, 79.1, 2.41, 8, "Benzyna", "salon2", 0},
		{'BMW M1 E26', 559, 0, 105000, 1807.34, -1703.24, 13.22, 0.4, 0.0, 79.1, 2.21, 8, "Benzyna", "salon2", 0},
		{'Feroci', 477, 0, 105000, 1807.63, -1699.27, 13.30, 359.1, 0.0, 91.1, 2.01, 8, "Benzyna", "salon2", 0},
		{'Deluxo', 587, 0, 149000, 1807.41, -1695.32, 13.24, 359.7, 360.0, 91.1, 2.21, 6, "Benzyna", "salon2", 0},
		{'Chevrolet Camaro Z28', 402, 0, 127000, 1807.28, -1691.40, 13.25, 0.8, 360.0, 91.1, 2.01, 6, "Benzyna", "salon2", 0},
		{'Lincoln Town', 409, 0, 500000, 1794.13, -1717.15, 13.28, 359.7, 360.0, 91.1, 1.81, 6, "Benzyna", "salon2", 0},
	--salon_tier2
		{'Porsche 911 Carrera S', 480, 0, 375000, 1775.61, -1701.71, 12.97, 359.2, 0.0, 195.0, 3.41, 10, "Benzyna", "salon2", 0},
        {'Mercedes-Benz G63 AMG', 579, 0, 300000, 1765.92, -1701.66, 13.51, 359.7, 0.0, 195.0, 3.01, 10, "Benzyna", "salon2", 0},
        {'Mercedes-Benz C63 AMG', 602, 0, 265000, 1761.23, -1702.17, 13.33, 359.9, 360.0, 195.0, 2.81, 8, "Benzyna", "salon2", 0},
        {'Mercedes-Benz S600', 551, 0, 280000, 1775.79, -1718.35, 13.32, 0.0, 0.0, 348.2, 2.81, 8, "Benzyna", "salon2", 0},
        {'BMW M5 F10', 405 , 0, 215000, 1770.71, -1718.52, 13.46, 0.2, 360.0, 348.2, 3.01, 8, "Benzyna", "salon2", 0},
        {'BMW M5 F90', 560 , 0, 265000, 1765.86, -1718.59, 13.35, 0.0, 0.0, 348.2, 3.01, 10, "Benzyna", "salon2", 0},
        {'BMW X5M', 400 , 0, 220000, 1761.29, -1718.42, 13.37, 0.9, 360.0, 348.2, 2.61, 8, "Benzyna", "salon2", 0},
        {'Mercedes-Benz G63 AMG 6X6', 495, 0, 350000, 1770.96, -1703.32, 13.76, 0.1, 0.0, 195.0, 2.81, 10, "Benzyna", "salon2", 0},
	--komis
		{'Nissan Silvia S15', 507, math.random(30000,70000), 85000, 2135.11, -1126.62, 25.45, 0.1, 2.5, 82.4, 1.81, 6, "Benzyna", "fcsalon", 0},
		{'Audi A6 C4', 516, math.random(50000,70000), 71000, 2134.94, -1130.38, 25.51, 359.8, 1.2, 84.4, 1.61, 6, "Benzyna", "fcsalon", 0},
		{'Honda Accord', 550, math.random(30000,70000), 60000, 2135.00, -1134.36, 24.86, 359.6, 0.3, 84.4, 1.41, 6, "Benzyna", "fcsalon", 0},
		{'Nissan Silvia S15', 562, math.random(10000,70000), 110000, 2134.89, -1138.41, 25.09, 359.1, 353.7, 84.4, 1.81, 8, "Benzyna", "fcsalon", 0},
		{'Nissan Stagea', 561, math.random(10000,90000), 65000, 2134.61, -1142.39, 24.88, 359.4, 353.4, 84.4, 1.61, 6, "Benzyna", "fcsalon", 0},
		{'Ferrari 365 GTB4 Spyder', 555, math.random(10000,140000), 100000, 2134.46, -1146.14, 24.39, 359.8, 353.5, 84.4, 1.81, 8, "Benzyna", "fcsalon", 0},
		{'Dodge Monaco 74', 466, math.random(1200,170000), 55000, 2134.66, -1149.53, 23.97, 0.1, 353.2, 84.4, 1.41, 6, "Benzyna", "fcsalon", 0},
		{'Lizard', 496, math.random(1200,80000), 69500, 2119.27, -1128.52, 25.09, 2.5, 0.7, 265.6, 1.6, 6, "Benzyna", "fcsalon", 0},
		{'Dukes', 475, math.random(1200,68888), 55000, 2119.52, -1125.15, 25.16, 1.6, 0.8, 266.2, 1.4, 6, "Benzyna", "fcsalon", 0},
		{'Dodge Diplomat', 492, math.random(1200,68888), 52000, 2119.03, -1134.84, 25.02, 2.3, 2.1, 266.7, 1.4, 6, "Benzyna", "fcsalon", 0},
		{'Imperial', 491, math.random(1200,100000), 88000, 2118.87, -1137.82, 24.87, 358.9, 2.8, 266.2, 1.6, 6, "Benzyna", "fcsalon", 0},
		{'Chevrolet Impala SS', 426, math.random(45660,100000), 50000, 2118.63, -1141.26, 24.93, 357.5, 4.1, 268.1, 1.6, 6, "Benzyna", "fcsalon", 0},
		{'El Camino', 600, math.random(45660,100000), 62500, 2118.64, -1144.90, 24.53, 356.8, 4.4, 266.6, 1.6, 6, "Benzyna", "fcsalon", 0},
		{'Invetero Coquette G1', 467, math.random(45660,100000), 87500, 2118.93, -1131.58, 24.95, 2.9, 0.8, 265.3, 1.8, 6, "Benzyna", "fcsalon", 0},
	--motory
		-- {'BF-400 Typ 1', 581, 0, 90000, 523.96, -1286.98, 16.84, 359.2, 0.0, 253.8, 2.41, 6, "Benzyna", "motory", 0},
	--łodzie
		{'Dinghy', 473, 0, 300000, 526.93, -1910.86, -0.22, 6.0, 359.9, 179.6, 1.41, 4, "Benzyna", "lodzie", 0},
		{'Jetmax', 493, 0, 900000, 527.12, -1934.50, -0.20, 2.8, 360.0, 181.8, 1.41, 6, "Benzyna", "lodzie", 0},
		{'Marquis', 484, 0, 600000, 516.75, -1936.95, 0.30, 1.5, 359.9, 180.1, 1.41, 6, "Benzyna", "lodzie", 0},
		{'Speeder', 452, 0, 650000, 514.27, -1922.92, -0.60, 3.8, 354.3, 103.0, 1.41, 6, "Benzyna", "lodzie", 0},
		{'Squalo', 446, 0, 1100000, 545.53, -1923.52, -0.60, 2.5, 1.0, 195.3, 1.41, 6, "Benzyna", "lodzie", 0},
		{'Tropic', 454, 0, 700000, 503.24, -1914.49, 0.36, 0.3, 359.9, 113.6, 1.41, 6, "Benzyna", "lodzie", 0},
}
for i,v in pairs(positionVehicles) do
	local cub = createColSphere(v[5], v[6], v[7], 3)
	setElementData(cub, "salon", {
	["name"] = v[1],
	["model"] = v[2],
	["przebieg"] = v[3],
	["cost"] = v[4],
	["silnik"] = v[11],
	["cylindry"] = v[12],
	["typsilnika"] = v[13],
	["typ"] = v[14],

	})
	
	if v[14] then
	setElementData(cub, "salon", {
		["name"] = v[1],
		["model"] = v[2],
		["przebieg"] = v[3],
		["cost"] = v[4],
		["silnik"] = v[11],
		["cylindry"] = v[12],
		["typsilnika"] = v[13],
		["typ"] = v[14],
		["wariant"] = v[15],
	})
	end

	
	silnikxd = string.format("%.1f", v[11]).." V"..v[12].." "..v[13]

	local veh=createVehicle(v[2], v[5], v[6], v[7], v[8], v[9], v[10])
	
	if v[15] then
		setVehicleVariant(veh,v[15],255)
	else
		setVehicleVariant(veh,255,255)
	end
	local cena; if type(v[4]) == "table" then cena=(math.random(v[4][1],v[4][2])) else cena = v[4] end
	local przebieg; if type(v[3]) == "table" then przebieg=(math.random(v[3][1],v[3][2])) else przebieg = v[3] end

    setElementData(veh,'vehicle:desc','#CCCCCCModel:#5a3795 '..v[1]..'\n#CCCCCCCena:#5a3795 '..formatujnaprzecinki(cena)..'  PLN\n#CCCCCCPrzebieg:#5a3795 ' ..v[3]..' KM\n#CCCCCCSilnik:#5a3795 ' ..silnikxd..' #CCCCCC\nAby dokonać zakupu podejdź do drzwi pojazdu')
    setVehicleOverrideLights(veh, 2)
    setElementFrozen(veh,true)
	setVehicleLocked(veh,true)
	local g = math.random(0,200)
	local g2 = math.random(0,200)
	setVehicleColor(veh, 255, 255, 255, 255, 255, 255)
	--setVehiclePlateText(veh,Kupmnie)
	setElementData(veh,"vehicle:mileage",przebieg)
    setVehicleDamageProof(veh, true)
    setElementData(veh,'vehicle.selling', true)
    veh:setData('vehsell:info', {
        ['cost']=cena,
        ['model']=v[2],
        ['mileage']=przebieg,
        ['selling']=v[12],
		['id']=i,
	}, false)
	
end

addEventHandler('onVehicleEnter', resourceRoot, function(plr, seat, jacked)
    if seat~=0 then return end
	if source:getData('vehsell:info') and source:getData('vehsell:info').selling==1 then
		triggerClientEvent(plr, "addNoti", plr, "Ten pojazd nie jest na sprzedaż.", "error" )
        return
    end

    local data=source:getData('vehsell:info')
    if not data then return end

    plr:setData('vehsell:info', {
        ['cost']=data.cost,
        ['model']=data.model,
        ['mileage']=data.mileage,
    }, false)

    --plr:outputChat(' Aby zakupiÄ‡ ten pojazd wpisz /kuppojazd')
end)

addEventHandler('onVehicleExit', resourceRoot, function(plr, seat, jacked)
    if seat~=0 then return end

    local data=plr:getData('vehsell:info')
    if not data then return end

    plr:removeData('vehsell:info')
end)


addEvent("zakupPojazdSalon", true)
addEventHandler("zakupPojazdSalon", root, function(id, cena, bak, przebieg, kolor, lampy, neony, zamaskowany, naped, drzwidogory, atrapa, silnik, tarcze, zawieszenie, karbon, chiptuning, wariant, typsilnika, cylindry, trakcja, lpg, us1, us2, us3, typ) 

	local uid = getElementData(source,"player:uid")
	local lvl = getElementData(source,"player:lvl") or 0
	maxauta = 432234

	local sprawdz=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE ownedPlayer=?", uid) 
	if sprawdz then 
		liczbagracza = table.maxn(sprawdz)
		if liczbagracza >= maxauta then
			triggerClientEvent(source, "addNoti", source, "Posiadasz "..liczbagracza.."/"..maxauta.." pojazdów, więcej nie kupisz", "error" )
		return end
	end

	if not id then return end 
	if not cena then return end
	if not typ then return end
	if not bak then bak = 25 end 
	if not przebieg then przebieg = 0 end 
	if not kolor then kolor = "255,255,255" end 
	if not lampy then lampy = "255,255,255" end 
	if not neony then neony = 0 end 
	if not zamaskowany then zamaskowany = 0 end 
	if not naped then naped = 0 end 
	if not drzwidogory then drzwidogory = 0 end 
	if not atrapa then atrapa = 0 end 
	if not silnik then silnik = 1.21 end 
	if not tarcze then tarcze = 0 end 
	if not zawieszenie then zawieszenie = 0 end
	if not karbon then karbon = 0 end 
	if not chiptuning then chiptuning = 0 end 
	if not wariant then wariant = 255 end 
	if not typsilnika then typsilnika = "Benzyna" end 
	if not cylindry then cylindry = 2 end 
	if not trakcja then trakcja = 0 end 
	if not lpg then lpg = 0 end 
	lpgfuel = 0
	if lpg == 1 then lpgfuel = 100 end 

			local katA = {581,462,521,463,522,461,448,468,586}
			local katC = {431,437,408,416,433,427,528,407,544,601,428,499,609,498,524,578,486,406,573,455,588,403,423,414,443,515,514,456,408,444,556,557}
			local katAll = {400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415,
			416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433,
			434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451,
			452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469,
			470, 471, 472, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487,
			488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505,
			506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523,
			524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541,
			542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559,
			560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577,
			578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595,
			596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611}

			for i,v in ipairs(katA) do 
				if id == v then 
					if getElementData(source,"player:license:pjA") ~= 1 then
						triggerClientEvent(source, "addNoti", source, "Nie posiadasz prawa jazdy kat A.", "error" )
					return end
				end
			end

			for i,v in ipairs(katC) do 
				if id == v then 
					if getElementData(source,"player:license:pjC") ~= 1 then
						triggerClientEvent(source, "addNoti", source, "Nie posiadasz prawa jazdy kat C.", "error" )
					return end
				end
			end

			for i,v in ipairs(katAll) do 
				if id == v then 
					if getElementData(source,"player:license:pjB") ~= 1 then
						triggerClientEvent(source, "addNoti", source, "Nie posiadasz prawa jazdy kat B.", "error" )
					return end
				end
			end
	
	if getPlayerMoney(source) < cena then
		triggerClientEvent(source, "addNoti", source, "Nie posiadasz tylu pieniędzy.", "error" )
	return end
	
	
	

	if typ == "cygan" then
		x,y,z,rx,ry,rz = 2517.94, -1509.90, 23.47, 0.2, 6.4, 89.4
	end
	if typ == "salon2" then
		x,y,z,rx,ry,rz = 1865.48, -1387.05, 13.22, 0.0, 0.4, 180.9
	end
	if typ == "salon1" then
		x,y,z,rx,ry,rz = 937.66, -1646.59, 13.08, 360.0, 0.0, 107.1
	end
	if typ == "loteria" then 
		x,y,z,rx,ry,rz = 1817.63, -1402.69, 12.95, 0.1, 0.0, 306.6
	end
	if typ == "motory" then 
		x,y,z,rx,ry,rz = 567.69, -1291.21, 16.81, 359.0, 0.0, 55.4
	end
	if typ == "lodzie" then 
		x,y,z,rx,ry,rz = 559.57, -1945.40, 0.10, 0.9, 358.5, 175.0
	end
	if typ == "fcsalon" then 
		x,y,z,rx,ry,rz = -316.89, 1313.43, 53.71, 353.7, 359.6, 71.9
	end
	
	takePlayerMoney(source, cena)
	local nick = getPlayerName(source)

	local sprawdz=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE model=?", id) 
	if sprawdz[1] then
		pierwszyczynie = 0
	else 
		pierwszyczynie = 1
	end

	local zapiszlog = exports["crime_database"]:dbSet("INSERT INTO logs_cars (nick,tresc) VALUES (?,?)", "#DDDDDD["..getElementData(source,"id").."] "..getPlayerName(source).."", "#5a3795KUPIŁ POJAZD Z SALONU #CCCCCC "..getVehicleNameFromModel(id).." za "..cena.." PLN")
	
	local stworz = exports["crime_database"]:dbSet("INSERT INTO crime_vehicles (model, fuel, bak, mileage, color, headlights, rejestracja, ownedPlayer, neon, zamaskowany, firstowner, naped, drzwidogory, atrapa, silnik, posalon, tarcze, zawieszenie, karbon, chiptuning, wariant, typsilnika, cylindry, trakcja, lpg, lpgfuel, 1naserwerze, parking) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1)", id, bak, bak, przebieg, kolor, lampy, "", uid, neony, zamaskowany, nick:gsub('#%x%x%x%x%x%x', ''), naped, drzwidogory, atrapa, silnik, 1, tarcze, zawieszenie, karbon, chiptuning, wariant, typsilnika, cylindry, trakcja, lpg, lpgfuel, pierwszyczynie)

	local q = exports["crime_database"]:dbGet("select * from crime_vehicles where posalon=?",1)
	testid = q[1].id

	losowe = {"A","a","B","B","C","c","D","d","E","e","F","f","G","g","H","h","I","i","J","j","K","k","L","l","M","m","N","n","O","o","P","P","Q","q","R","r","S","s","T","t","U","u","W","w","X","x","Y","y","Z","z","1","2","3","4","5","6","7","8","9","0"}
	l1 = table.random(losowe)
	l2 = table.random(losowe)
	l3 = table.random(losowe)
	l4 = table.random(losowe)
	rejestracja = tostring("LS "..testid.." "..l1..""..l2..""..l3..""..l4)

	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET rejestracja=? WHERE id=?",rejestracja,testid)
	exports["crime_vehicles"]:onRespawnVehicles(_,testid,{x,y,z,rx,ry,rz},nick)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET posalon=? WHERE id=?",0,testid)
	liczbagracza = liczbagracza+1
	triggerClientEvent(source, "addNoti", source, "Zakupiłeś pojazd "..liczbagracza.."/"..maxauta.."", "success" )
end)

addEventHandler("onVehicleStartEnter", root, function(player, seat)
	if getElementData(source, "vehicle.selling") then
		cancelEvent()
	end
end)

function table.random ( theTable )
    return theTable[math.random ( #theTable )]
end

addEvent("zakupPojazdSalonloteria", true)
addEventHandler("zakupPojazdSalonloteria", root, function(id, cena, bak, przebieg, kolor, lampy, neony, zamaskowany, naped, drzwidogory, atrapa, silnik, tarcze, zawieszenie, karbon, chiptuning, wariant, typsilnika, cylindry, trakcja, lpg, us1, us2, us3, typ) 

	local uid = getElementData(source,"player:uid")

	if not id then return end 
	if not cena then return end
	if not typ then return end
	if not bak then bak = 25 end 
	if not przebieg then przebieg = 0 end 
	if not kolor then kolor = "255,255,255" end 
	if not lampy then lampy = "255,255,255" end 
	if not neony then neony = 0 end 
	if not zamaskowany then zamaskowany = 0 end 
	if not naped then naped = 0 end 
	if not drzwidogory then drzwidogory = 0 end 
	if not atrapa then atrapa = 0 end 
	if not silnik then silnik = 1.21 end 
	if not tarcze then tarcze = 0 end 
	if not zawieszenie then zawieszenie = 0 end
	if not karbon then karbon = 0 end 
	if not chiptuning then chiptuning = 0 end 
	if not wariant then wariant = 255 end 
	if not typsilnika then typsilnika = "Benzyna" end 
	if not cylindry then cylindry = 2 end 
	if not trakcja then trakcja = 0 end 
	if not lpg then lpg = 0 end 
	if not us1 then us1 = 0 end 
	if not us2 then us2 = 0 end 
	if not us3 then us3 = 0 end 
	lpgfuel = 0
	if lpg == 1 then lpgfuel = 100 end 
	
	x,y,z,rx,ry,rz = 1817.63, -1402.69, 12.95, 0.1, 0.0, 306.6
	
	
	local nick = getPlayerName(source)

	local sprawdz=exports["crime_database"]:dbGet("SELECT * FROM crime_vehicles WHERE model=?", id) 
	if sprawdz[1] then
		pierwszyczynie = 0
	else 
		pierwszyczynie = 1
	end

	local stworz = exports["crime_database"]:dbSet("INSERT INTO crime_vehicles (model, fuel, bak, mileage, color, headlights, rejestracja, ownedPlayer, neon, zamaskowany, firstowner, naped, drzwidogory, atrapa, silnik, posalon, tarcze, zawieszenie, karbon, chiptuning, wariant, typsilnika, cylindry, trakcja, lpg, lpgfuel, us1, us2, us3, 1naserwerze, parking) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1)", id, bak, bak, przebieg, kolor, lampy, "", uid, neony, zamaskowany, nick:gsub('#%x%x%x%x%x%x', ''), naped, drzwidogory, atrapa, silnik, 1, tarcze, zawieszenie, karbon, chiptuning, wariant, typsilnika, cylindry, trakcja, lpg, lpgfuel, us1, us2, us3, pierwszyczynie)

	local q = exports["crime_database"]:dbGet("select * from crime_vehicles where posalon=?",1)
	testid = q[1].id

	losowe = {"A","a","B","B","C","c","D","d","E","e","F","f","G","g","H","h","I","i","J","j","K","k","L","l","M","m","N","n","O","o","P","P","Q","q","R","r","S","s","T","t","U","u","W","w","X","x","Y","y","Z","z","1","2","3","4","5","6","7","8","9","0"}
	l1 = table.random(losowe)
	l2 = table.random(losowe)
	l3 = table.random(losowe)
	l4 = table.random(losowe)
	rejestracja = tostring("LS "..testid.." "..l1..""..l2..""..l3..""..l4)

	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET rejestracja=? WHERE id=?",rejestracja,testid)
	exports["crime_database"]:dbSet("UPDATE crime_vehicles SET posalon=? WHERE id=?",0,testid)
end)