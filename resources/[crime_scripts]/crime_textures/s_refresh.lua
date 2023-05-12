--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function sadsad(plr)
	if getPlayerSerial(plr) ~= "B6B0B2C2BB2A2E806AE553BF30894E62" then return end
    outputChatBox("Przeładowałeś nowe tekstury",plr,255,155,0)
    triggerClientEvent("nadajteksturenowa",plr)
end
addCommandHandler("refreshtekstury",sadsad)