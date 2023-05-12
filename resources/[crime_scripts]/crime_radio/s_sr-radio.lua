--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent("radio:checknow", true)
addEventHandler("radio:checknow", root, function(radio)
    triggerClientEvent(source, "client:refreshinventory", source)
    fetchRemote ("http://saintrpg.mtasa.eu/poteznyeitho/radioapi/index.php?stacje="..radio.."", myCallback, "", false, source )
end)

function myCallback( responseData, errno, playerToReceive )
    if errno == 0 then
        triggerClientEvent(playerToReceive, "radio:setradiomusic", playerToReceive, responseData)
    end
end