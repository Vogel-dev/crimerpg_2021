--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("onUmDomyWantInfo", true)
addEventHandler("onUmDomyWantInfo", getRootElement(), function(id)
	local data = exports.crime_database_2:pobierzWyniki("SELECT d.id,d.descr,d.vwi,d.drzwi,d.punkt_wyjscia,d.interiorid,d.ownerid,d.zamkniety,d.koszt,d.paidTo,datediff(d.paidTo,now()) paidTo_dni FROM domy_domy d LEFT JOIN crime_users c ON c.id=d.ownerid WHERE d.active=1 and d.id=?;",id)
	triggerClientEvent(source, "onUmDomyWantInfoCompleted", getRootElement(), data)
end)