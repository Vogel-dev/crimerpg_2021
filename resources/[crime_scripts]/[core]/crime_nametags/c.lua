--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local screenSizeX, screenSizeY = guiGetScreenSize()
local zmienna = 1920/screenSizeX
--Fonty!

local nametagFont = dxCreateFont( ":crime_files/fonts/FiraEC.ttf", 19 )

local vopisFont = dxCreateFont( ":crime_files/fonts/FiraEC.ttf", 18/zmienna )


local nametagScale = 0.6
local nametagScale2 = 0.58
local nametagAlpha = 180
local nametagColor =
{
	r = 255,
	g = 255,
	b = 255
}
-- Funkcja nametagów graczy i pojazdów
-- zazwyczaj są dla ułatwienia wyglądu.
local tabela_auta = {}
local tabela_gracze= {}

function num2hex(n) local i;local r="";for i=1,2 do r=r..string.char(n%256);n=math.floor(n/256);end return r;end
function str2hex(str)
    local hex = ''
    while #str > 0 do
        local hb = num2hex(string.byte(str, 1, 1))
        if #hb < 2 then hb = '0' .. hb end
        hex = hex .. hb
        str = string.sub(str, 2)
    end
    return hex
end

ikona1 = false
ikona2 = false 
ikona3 = false 
ikona4 = false
ikona5 = false

function nametag()
		if getElementData(localPlayer,"nametagioff") == true then return end
		if getElementData(localPlayer,"hudoff") == true then return end
		local rootx, rooty, rootz = getCameraMatrix()

		for i,player in ipairs(getElementsByType("ped")) do
			if getElementDimension(localPlayer) == getElementDimension(player) and getElementInterior(localPlayer) == getElementInterior(player) then
				local x,y,z = getPedBonePosition(player,6)
				local sx, sy = getScreenFromWorldPosition(x, y, z+0.23)
				local sxc,syc =getScreenFromWorldPosition(x, y, z+0.32)
				if sx and sy and sxc and syc then
					local distance = getDistanceBetweenPoints3D(rootx, rooty, rootz, x, y, z)	
					if getElementData(player,"ped:name") then 
						if(distance <= 6) then
							if getElementData(player,"dog") then 
								dxDrawText ((getElementData(player,"ped:name").."\n"..math.floor(getElementHealth(player)).."% HP"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
								dxDrawText (getElementData(player,"ped:name").."\n#FF0000"..math.floor(getElementHealth(player)).."% HP",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							else 
								dxDrawText (getElementData(player,"ped:name"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
								dxDrawText (getElementData(player,"ped:name"),sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							end
						end
					end
				end
			end
		end

		for i,player in ipairs(getElementsByType("player")) do
			if getElementDimension(localPlayer) == getElementDimension(player) and getElementInterior(localPlayer) == getElementInterior(player) then
				local x,y,z = getPedBonePosition(player,6)
				local sx, sy = getScreenFromWorldPosition(x, y, z+0.23)
				local sxc,syc =getScreenFromWorldPosition(x, y, z+0.32)
				if sx and sy and sxc and syc then
				local distance = getDistanceBetweenPoints3D(rootx, rooty, rootz, x, y, z)
				
				--if localPlayer ~= player then
					if getElementData(localPlayer,"player:admin") then 
						testcycsad = 25
					else 
						testcycsad = 15
					end
			    if(distance <= testcycsad) then
					local level = getElementData(player, "player:level")
					local premium = getElementData(player,"player:premium")
			--  if isLineOfSightClear( rootx,rooty,rootz, x,y,z, true, false, false, false, false, false, true,localPlayer ) then
				
					if premium then ikona1 = "premium.png" end
					if not premium and ikona1 == "premium.png" then ikona1 = "gracz.png" end
					if ikona1 == false then ikona1 = "gracz.png" end
					if getElementAlpha(player) > 1 then
					-- if getPlayerName(player) ~= getPlayerName(localPlayer) then 
					if not level and not premium then
						dxDrawText (("#cccccc"..getPlayerName(player).." ["..getElementData(player,"id").."]"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
						dxDrawText ("#cccccc"..getPlayerName(player).." ["..getElementData(player,"id").."]",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
					end
					if premium and not level then
						if getElementData(localPlayer,"player:hex") == "#E6CF00" or getElementData(localPlayer,"player:hex") == "#FFDD00" then
							dxDrawText (("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." ["..getElementData(player,"id").."]\n(Premium)"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							dxDrawText ("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." #FFDD00["..getElementData(player,"id").."]\n(Premium)",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
						else 
							dxDrawText (("#cccccc"..getPlayerName(player).." ["..getElementData(player,"id").."]\n(Premium)"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							dxDrawText ("#cccccc"..getPlayerName(player).." #FFDD00["..getElementData(player,"id").."]\n(Premium)",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
						end	
					end
					if level then
						if level == 1 then
							dxDrawText (("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." ["..getElementData(player,"id").."]\n(Trial Support)"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							dxDrawText ("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." #2BFFB4["..getElementData(player,"id").."]\n(Trial Support)",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							ikona2 = "pomocnik.png"
						end
						if level == 2 then
							dxDrawText (("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." ["..getElementData(player,"id").."]\n(Support)"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							dxDrawText ("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." #33cc99["..getElementData(player,"id").."]\n(Support)",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							ikona2 = "mod.png"
						end
						if level == 3 then
							dxDrawText (("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." ["..getElementData(player,"id").."]\n(Moderator)"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							dxDrawText ("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." #3399ff["..getElementData(player,"id").."]\n(Moderator)",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							ikona2 = "admin.png"
						end
						if level == 4 then
							dxDrawText (("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." ["..getElementData(player,"id").."]\n(Administrator)"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							dxDrawText ("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." #ff0000["..getElementData(player,"id").."]\n(Administrator)",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							ikona2 = "ceo.png"
						end
						if level == 5 then
							dxDrawText (("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." ["..getElementData(player,"id").."]\n(Programista)"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							dxDrawText ("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." #CA43FF["..getElementData(player,"id").."]\n(Programista)",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							ikona2 = "zarzad.png" 
						end
						if level == 6 then
							dxDrawText (("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." ["..getElementData(player,"id").."]\n(Programista)"):gsub("#%x%x%x%x%x%x",""),sx, sy, sx, sy,tocolor(0, 0, 56,255),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							dxDrawText ("#cccccc"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").." #CA43FF["..getElementData(player,"id").."]\n(Programista)",sx+1, sy+1, sx+1, sy+1,tocolor(255,255,255,190),nametagScale,nametagFont,"center","center",false,false,false,true,true,0,0,-50 )
							ikona2 = "zarzad.png"
						end
					else 
						ikona2 = false
					end

					if getElementData(player,"gadateraz") == true then
						ikona3 = "mowi.png"
					end

					if getElementData(player,"piszecos") == true then
						ikona3 = "pisze.png"
					end

					if getElementData(player,"gadateraz") == false and getElementData(player,"piszecos") == false then
						if ikona3 then
							ikona3 = false
						end
					end
										
					if getElementData(player,"player:drugs") == true then
						ikona3 = "drugs.png"
					else 
						ikona3 = false
					end
					
					if getElementData(player,"player:drugs") == true and getElementData(player, "piszecos") == true then
						ikona3 = "pisze.png"
					end

					if getElementData(player,"player:drugs") == true and getElementData(player, "gadateraz") == true then
						ikona3 = "mowi.png"
					end

					if getElementData(player,"player:drugs") == false and getElementData(player, "piszecos") == true then
						ikona3 = "pisze.png"
					end

					if getElementData(player,"player:drugs") == false and getElementData(player, "gadateraz") == true then
						ikona3 = "mowi.png"
					end

					if getElementData(player,"afczy") == true then
						ikona4 = "afk.png"
					else
						ikona4 = false
					end

					
					if getElementData(player,"afczyesc") == true then
						ikona4 = "afk.png"
					end

					if getElementData(player,"roleplay") == true then
						ikona4 = "rp.png"
					else 
						ikona4 = false
					end
					
					if getElementData(player,"roleplay") == true and getElementData(player, "afczy") == true then
						ikona4 = "afk.png"
					end

					if getElementData(player,"roleplay") == true and getElementData(player, "afczyesc") == true then
						ikona4 = "afk.png"
					end

					if getElementData(player,"roleplay") == false and getElementData(player, "afczy") == true then
						ikona4 = "afk.png"
					end

					if getElementData(player,"roleplay") == false and getElementData(player, "afczyesc") == true then
						ikona4 = "afk.png"
					end

					if ikona1 then 
						if ikona2 == false and ikona3 == false and ikona4 == false then
							dxDrawImage(sx-13,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona1,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 and ikona3 == false and ikona4 == false then
							dxDrawImage(sx-25,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona1,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 and ikona3 and ikona4 == false then
							dxDrawImage(sx-37,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona1,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 and ikona3 == false and ikona4 then 
							dxDrawImage(sx-37,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona1,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 and ikona3 and ikona4 then 
							dxDrawImage(sx-50,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona1,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 == false and ikona3 and ikona4 then 
							dxDrawImage(sx-37,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona1,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 == false and ikona3 and ikona4 == false then 
							dxDrawImage(sx-25,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona1,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 == false and ikona4 and ikona3 == false then 
							dxDrawImage(sx-25,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona1,0,0,0,tocolor(255,255,255,255))
						end
					end
					if ikona2 then 
						if ikona3 == false and ikona4 == false then
							dxDrawImage(sx,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona2,0,0,0,tocolor(255,255,255,255))
						end
						if ikona3 and ikona4 == false then 
							dxDrawImage(sx-12,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona2,0,0,0,tocolor(255,255,255,255))
						end 
						if ikona3 == false and ikona4 then 
							dxDrawImage(sx-12,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona2,0,0,0,tocolor(255,255,255,255))
						end 
						if ikona3 and ikona4 then 
							dxDrawImage(sx-25,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona2,0,0,0,tocolor(255,255,255,255))
						end
					end
					if ikona3 then 
						if ikona2 and ikona4 == false then 
							dxDrawImage(sx+13,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona3,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 and ikona4 then 
							dxDrawImage(sx,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona3,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 == false and ikona4 then 
							dxDrawImage(sx-12,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona3,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 == false and ikona4 == false then 
							dxDrawImage(sx,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona3,0,0,0,tocolor(255,255,255,255))
						end 
					end 
					if ikona4 then
						if ikona2 and ikona3 == false then 
							dxDrawImage(sx+13,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona4,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 and ikona3 then 
							dxDrawImage(sx+25,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona4,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 == false and ikona3 then 
							dxDrawImage(sx+13,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona4,0,0,0,tocolor(255,255,255,255))
						end
						if ikona2 == false and ikona3 == false then 
							dxDrawImage(sx,sy-45,24, 24,":crime_files/nametags/ikony/"..ikona4,0,0,0,tocolor(255,255,255,255))
						end 
					end

					
					if not getElementData(player,"p:inv") then
					if type(level) == "number" then
					if level == 1 then
					--dxDrawText("Pomocnik", sxc, syc, sxc, syc, tocolor(0, 255, 140, 255), nametagScale2, nametagFont, "center", "center")
					--dxDrawText("Pomocnik", sxc+1, syc+1, sxc+1, syc+1, tocolor(0, 0, 0, 110), nametagScale2, nametagFont, "center", "center")
					elseif level == 2 then
					--dxDrawText("Moderator", sxc, syc, sxc, syc, tocolor(0, 134, 175, 255), nametagScale2, nametagFont, "center", "center")
					--dxDrawText("Moderator", sxc+1, syc+1, sxc+1, syc+1, tocolor(0, 0, 0, 110), nametagScale2, nametagFont, "center", "center")
					elseif level == 3 then
					--dxDrawText("Administrator", sxc, syc, sxc, syc, tocolor(58, 114, 57, 255), nametagScale2, nametagFont, "center", "center")
					--dxDrawText("Administrator", sxc+1, syc+1, sxc+1, syc+1, tocolor(0, 0, 0, 110), nametagScale2, nametagFont, "center", "center")
					elseif level == 4 then
					--dxDrawText("MZarząd", sxc, syc, sxc, syc, tocolor(232, 0, 0, 255), nametagScale2, nametagFont, "center", "center")
					--dxDrawText("MZarząd", sxc+1, syc+1, sxc+1, syc+1, tocolor(0, 0, 0, 110), nametagScale2, nametagFont, "center", "center")
					elseif level == 5 then
				--	dxDrawText("Zarząd", sxc, syc, sxc, syc, tocolor(163, 0, 0, 255), nametagScale2, nametagFont, "center", "center")
				---	dxDrawText("Zarząd", sxc+1, syc+1, sxc+1, syc+1, tocolor(0, 0, 0, 110), nametagScale2, nametagFont, "center", "center")
					end
					elseif type(level) == "table" then
				--	dxDrawText("#ffffff["..level[2].."#ffffff]", sxc, syc, sxc, syc, tocolor(64,96,224, 255), nametagScale2+0.05, nametagFont, "center","center",false,false,false,true,true)
					end
				--	end
				  end
				end
				end
			end
		--end
		--end
		-- end
	end
	end
	for i,vehicle in ipairs(getElementsByType("vehicle",root,true)) do
		if isElement(vehicle) then
		local x,y,z=getElementPosition(vehicle)
		local rootx, rooty, rootz = getCameraMatrix()
		local sx,sy=getScreenFromWorldPosition(x,y,z)
		if sx and sy then
		local desc = getElementData(vehicle,"vehicle:desc")
			if desc then
				local distance=getDistanceBetweenPoints3D(rootx,rooty,rootz,x,y,z)
					if distance <= 25 then
						if isLineOfSightClear( rootx,rooty,rootz, x,y,z, true, true, false, true, false, true, true,vehicle ) then
							dxDrawText(desc:gsub("#%x%x%x%x%x%x",""), sx, sy, sx, sy, tocolor(0, 0, 0, 255), 0.64, vopisFont, "center", "center")
							dxDrawText(desc, sx, sy, sx, sy, tocolor(90, 55, 150, 255), 0.65, vopisFont, "center", "center",false,false,false,true)
						end
					end
				end
			end
		end
	end
end


function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end


function pobierzdane()
	for i=1,#tabela_gracze do
		if not isElement(tabela_gracze[i]) then table.remove(tabela_gracze,i) end
	end
	for i,player in ipairs(getElementsByType("player",root,true)) do
		if player ~= localPlayer then
			if inTable(tabela_gracze,player) then return end
			table.insert(tabela_gracze,player)
		end
	end
	for i=1,#tabela_auta do
		if not isElement(tabela_auta[i]) then table.remove(tabela_auta,i) end
	end
	for i,vehicle in ipairs(getElementsByType("vehicle",root,true)) do
		if inTable(tabela_auta,vehicle) then return end
		table.insert(tabela_auta,vehicle)
	end
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
		 local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		 if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			  for i, v in ipairs( aAttachedFunctions ) do
				   if v == func then
					return true
			   end
		  end
	 end
	end
	return false
end



addEventHandler("onClientResourceStart", resourceRoot, function()
	for _,v in ipairs(getElementsByType("player")) do
		setPlayerNametagShowing(v, false)
		if not isEventHandlerAdded( 'onClientHUDRender', root, nametag) then
			addEventHandler("onClientHUDRender", root, nametag)
		end
triggerEvent("gui:start2",root)
	end
end)


addEventHandler("onClientPlayerSpawn", root,  function()
	setPlayerNametagShowing(source, false)
end)


addEvent("gui:start",true)
addEventHandler("gui:start",root,function()
if not isEventHandlerAdded( 'onClientHUDRender', root, nametag) then
	addEventHandler("onClientHUDRender", root, nametag)
end
triggerEvent("gui:start2",root)
end)

local screenW, screenH = guiGetScreenSize()





function handleMinimize()
    setElementData(localPlayer,"afczy",true)
end
addEventHandler( "onClientMinimize", root, handleMinimize )


function handleRestore()
	setElementData(localPlayer,"afczy",false)
end
addEventHandler("onClientRestore",root,handleRestore)

function isLocalPlayerActive ()
	if isMainMenuActive() == true then
	   setElementData(localPlayer,"afczyesc",true)
	else
	   setElementData(localPlayer,"afczyesc",false)
	end
	if isChatBoxInputActive() == true then
		setElementData(localPlayer,"piszecos",true)
	else
	   setElementData(localPlayer,"piszecos",false)
	end
 end
 setTimer(isLocalPlayerActive,1000,0)

 function RGBToHex(red, green, blue, alpha)
	
	-- Make sure RGB values passed to this function are correct
	if( ( red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255 ) or ( alpha and ( alpha < 0 or alpha > 255 ) ) ) then
		return nil
	end

	-- Alpha check
	if alpha then
		return string.format("#%.2X%.2X%.2X%.2X", red, green, blue, alpha)
	else
		return string.format("#%.2X%.2X%.2X", red, green, blue)
	end

end

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end
