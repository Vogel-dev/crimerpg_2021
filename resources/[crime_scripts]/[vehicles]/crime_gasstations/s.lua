--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local stacje={
	{-2029.65,156.79,28.84},
	{-2416.11,975.36,45.30},
	{2149.53,2748.28,10.50},
	{2199.98,2474.98,10.50},
	{2114.87,919.88,10.50},
	{2640.27,1106.91,10.51},
	{608.66,1700.29,6.68},
	{-1328.90,2677.17,49.74},
	{-1470.59,1863.39,32.31},
	{1381.37,458.11,19.65},
	{655.36, -565.28, 16.34},
	{-1676.75,413.22,7.18},
	{1939.59, -1773.79, 13.39},
	{1945.19, -1772.96, 13.39},
	{1004.98, -938.79, 42.18},
	{1003.51, -933.36, 42.18},
	{-2023.89, 156.20, 28.80},
	{581.75, -1922.32, -0.60}
}
for _,v in ipairs(stacje)do
	local marker=createMarker(v[1],v[2],v[3]-1,"cylinder",3,90, 55, 150,0)
	setElementData(marker,"stacja",true)
	setElementData(marker,"x",v[1])
	setElementData(marker,"y",v[2])
	setElementData(marker,"z",v[3])
	setElementData(marker,"mpod",true)
	setElementData(marker,"mikona","")
	local blipStacji =createBlipAttachedTo ( marker, 23 )
	setBlipVisibleDistance(blipStacji, 200)
	mkr=marker
end

addEvent("TANKUJ",true)
addEventHandler("TANKUJ",root,function(ile,cena,wybrane,bak)
	if ile < 1 then triggerClientEvent(source, "addNoti", source, "Zatankuj min. 1L.", "error" ) return end
	local koszt = ile*cena
	if wybrane ~= "lpg" then 
		local fuel=getElementData(getPedOccupiedVehicle(source),"vehicle:fuel")
		if getPlayerMoney(source) < koszt then triggerClientEvent(source, "addNoti", source, "Nie posiadasz tyle pieniędzy.", "error" ) return end
		local brakuje = bak-fuel
		if ile > brakuje then
			local przelal = ile - brakuje
			local kosztp = cena*przelal
			takePlayerMoney(source,koszt)
			triggerClientEvent("TANKUJ",source,bak,wybrane)
			triggerClientEvent(source, "addNoti", source, "Zatankowałeś "..string.format("%.02f",ile).."L paliwa, zapłaciłeś "..string.format("%.02f",koszt).." PLN", "success" )
		else
			takePlayerMoney(source,koszt)
			triggerClientEvent("TANKUJ",source,ile,wybrane)
			triggerClientEvent(source, "addNoti", source, "Zatankowałeś "..string.format("%.02f",ile).."L paliwa, zapłaciłeś "..string.format("%.02f",koszt).." PLN", "success" )
		end
	else
		local fuel=getElementData(getPedOccupiedVehicle(source),"vehicle:lpgfuel")
		if getPlayerMoney(source) < koszt then triggerClientEvent(source, "addNoti", source, "Nie posiadasz tyle pieniędzy.", "error" ) return end
		local brakuje = 100-fuel
		if ile > brakuje then
			local przelal = ile - brakuje
			local kosztp = cena*przelal
			takePlayerMoney(source,koszt)
			triggerClientEvent("TANKUJ",source,100,wybrane)
			triggerClientEvent(source, "addNoti", source, "Zatankowałeś "..string.format("%.02f",ile).."L LPG, zapłaciłeś "..string.format("%.02f",koszt).." PLN", "success" )
		else
			takePlayerMoney(source,koszt)
			triggerClientEvent("TANKUJ",source,ile,wybrane)
			triggerClientEvent(source, "addNoti", source, "Zatankowałeś "..string.format("%.02f",ile).."L paliwa, zapłaciłeś "..string.format("%.02f",koszt).." PLN", "success" )
		end
	end
end)


function zgasSilnik()
    for i,veh in ipairs(getElementsByType("vehicle")) do
		if getElementData(veh,"vehicle:wlaczonelpg") == true then 
			local fuel = getElementData(veh,"vehicle:lpgfuel") or 0
			if fuel < 1 then 
				setVehicleEngineState(veh,false)
			end
		end 
		if getElementData(veh,"vehicle:wlaczonelpg") == false then 
			local fuel = getElementData(veh,"vehicle:fuel") or 0
			if fuel < 1 then 
				setVehicleEngineState(veh,false)
			end
		end 

    end
end
setTimer(zgasSilnik, 1000, 0)
