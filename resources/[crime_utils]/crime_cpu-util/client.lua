--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx,sy = guiGetScreenSize()
local resStat = false
local serverStats = nil
local serverColumns, serverRows = {}, {}

addCommandHandler("cpu", function()
	if getPlayerSerial(localPlayer) == "B6B0B2C2BB2A2E806AE553BF30894E62" then
		resStat = not resStat
		if resStat then
			exports.crime_gui:addNoti("Widok poboru CPU serwera, włączony.", "info")
			addEventHandler("onClientRender", root, resStatRender)
			triggerServerEvent("getServerStat", localPlayer)
		else
			exports.crime_gui:addNoti("Widok poboru CPU serwera, wyłączony.", "info")
			removeEventHandler("onClientRender", root, resStatRender)
			serverStats = nil
			serverColumns, serverRows = {}, {}
			triggerServerEvent("destroyServerStat", localPlayer)
		end
	end
end)

addEvent("receiveServerStat", true)
addEventHandler("receiveServerStat", root, function(stat1,stat2)
	serverStats = true
	serverColumns, serverRows = stat1,stat2
end)

function resStatRender()
	local x = sx-300
	if #serverRows == 0 then
		x = sx-140
	end
	local columns, rows = getPerformanceStats("Lua timing")
	local height = (15*#rows)
	local y = sy/2-height/2
	if #serverRows == 0 then
		dxDrawText("Client",sx-75,y-20,sx-75,y-20,tocolor(255,255,255,255),1.2,"default","center")
	else
		dxDrawText("Client",sx-235,y-20,sx-235,y-20,tocolor(255,255,255,255),1.2,"default","center")
	end
	dxDrawRectangle(x-10,y,150,height,tocolor(0,0,0,150))
	y = y + 5
	for i, row in ipairs(rows) do
		local text = row[1]:sub(0,15)..": "..row[2]
		dxDrawText(text,x+1,y+1,150,15,tocolor(0,0,0,255),1,"default")
		dxDrawText(text,x,y,150,15,tocolor(255,255,255,255),1,"default")
		y = y + 15
	end
	
	if #serverRows ~= 0 then
		local x = sx-140
		local height = (15*#serverRows)
		local y = sy/2-height/2
		dxDrawText("Server",sx-75,y-20,sx-75,y-20,tocolor(255,255,255,255),1.2,"default","center")
		dxDrawRectangle(x-10,y,150,height+15,tocolor(0,0,0,150))
		y = y + 5
		for i, row in ipairs(serverRows) do
			local text = row[1]:sub(0,15)..": "..row[2]
			dxDrawText(text,x+1,y+1,150,15,tocolor(0,0,0,255),1,"default")
			dxDrawText(text,x,y,150,15,tocolor(255,255,255,255),1,"default")
			y = y + 15
		end
	end
end