--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

updateRanking=(
	function(plr,co)--dla kogo ma się updateować (jeżeli dla wszystkich to root)
		local tabela_z_danymi={}
		for i,v in ipairs(tbl) do
			if not praca or (praca==v.nazwa) then
				if v.typ == "TopCzas" then
					dane = exports['crime_database']:dbGet('SELECT login, hours FROM crime_users ORDER BY hours DESC LIMIT 10')
					table.insert(tabela_z_danymi,{index=i,dane=dane,typ=v.typ})
				elseif v.typ == "TopRep" then
					dane = exports['crime_database']:dbGet('SELECT login, level FROM crime_users ORDER BY level DESC LIMIT 10')
					table.insert(tabela_z_danymi,{index=i,dane=dane,typ=v.typ})
				elseif v.typ == "TopDonate" then
					dane = exports['crime_database']:dbGet('SELECT uid, nick, points FROM crime_topdonate ORDER BY points DESC LIMIT 10')
					table.insert(tabela_z_danymi,{index=i,dane=dane,typ=v.typ})
				elseif v.typ == "TopAll" then
					dane = exports['crime_database']:dbGet('SELECT uid, nick, points FROM crime_drifts ORDER BY points DESC LIMIT 10')
					table.insert(tabela_z_danymi,{index=i,dane=dane,typ=v.typ})
				end
			end			
		end
		triggerClientEvent(plr,"evc",resourceRoot,"addtxt",tabela_z_danymi,praca)
	end
)



addEvent("ev",true)
addEventHandler("ev",resourceRoot,
	function()
		updateRanking(client)
	end
)

setTimer(function()
	exports["crime_tables"]:updateRanking(root,"TopCzas")
	exports["crime_tables"]:updateRanking(root,"TopRep")
	exports["crime_tables"]:updateRanking(root,"TopDonate")
	exports["crime_tables"]:updateRanking(root,"TopAll")
end, 1000*60, 0)
	