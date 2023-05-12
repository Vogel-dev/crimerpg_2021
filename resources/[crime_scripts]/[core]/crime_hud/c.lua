--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx,sy=guiGetScreenSize()
tick = getTickCount()
hud = 'tak'
f11 = 'nie'
zmienna = 1366/sx
zmiennadwa = 1920/sx
local fontxd123 = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 11/zmienna)
local dxfont0_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 15/zmiennadwa)

local dxfont1_FA5 = dxCreateFont(":crime_files/fontawesome/FA5.ttf", 13/zmiennadwa)
local dxfont1_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 13/zmiennadwa)
local dxfont2_SegoeLight = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 17/zmiennadwa)


myTexture = dxCreateShader(":crime_dashboard/files/shader/hud_mask.fx")
avatar = dxCreateTexture(":crime_dashboard/files/avatar.png")
maska = dxCreateTexture(":crime_dashboard/files/shader/circle_mask.png")

dxSetShaderValue( myTexture, "sPicTexture", avatar )
dxSetShaderValue( myTexture, "sMaskTexture", maska )

addEventHandler("onClientResourceStart", resourceRoot, function()
    setPlayerHudComponentVisible("ammo", false)
    setPlayerHudComponentVisible("area_name", false)
    setPlayerHudComponentVisible("armour", false)
    setPlayerHudComponentVisible("breath", false)
    setPlayerHudComponentVisible("clock", false)
    setPlayerHudComponentVisible("health", false)
    setPlayerHudComponentVisible("money", false)
    setPlayerHudComponentVisible("weapon", false)
    setPlayerHudComponentVisible("radio", false)
    setPlayerHudComponentVisible("vehicle_name", false)
    setPlayerHudComponentVisible("wanted", false)
    setPlayerHudComponentVisible("crosshair", true)
    setPlayerHudComponentVisible("radar",false)
end)

function gui()
    if not getElementData(localPlayer,"player:logged") then return end
    if not getElementData(localPlayer,"mahud") then return end
    if getElementData(localPlayer,"hudoff") == true then return end
    if getElementData(localPlayer,"f11wlaczone") == true then return end
    if hud == 'tak' then
        if getElementData(localPlayer,"newhud") == false then 
            local kasa = getPlayerMoney(localPlayer)
            local exp = getElementData(localPlayer,"player:exp") or 0
            local lvl = getElementData(localPlayer,"player:lvl") or 0
            local hp = getElementHealth(localPlayer)
            local liniahp = 366 * (hp / 100)
            local magazynek = getPedAmmoInClip (localPlayer)
            local full = getPedTotalAmmo (localPlayer) - magazynek
            
            --AVATAR
            if myTexture then
                if getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 1 then er,gie,be = 43, 255, 180
                elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 2 then er,gie,be = 51, 204, 153
                elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 3 then er,gie,be = 51, 153, 255
                elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 4 then er,gie,be = 255, 0, 0
                elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 5 then er,gie,be = 202, 67, 255
                elseif getElementData(localPlayer,"player:admin") == true and getElementData(localPlayer,"player:level") == 6 then er,gie,be = 202, 67, 255

                elseif getElementData(localPlayer,"player:duty") == "SAPD" then er,gie,be = 52, 131, 235
                elseif getElementData(localPlayer,"player:duty") == "SAFD" then er,gie,be = 255, 74, 74
                elseif getElementData(localPlayer,"player:duty") == "SAMD" then er,gie,be = 0, 255, 183
                else
                    er,gie,be = 90, 55, 150
                end
                if not er then er = 90 end 
                if not gie then gie = 55 end 
                if not be then be = 150 end

                dxDrawImage((1282-2)/zmienna, (4-2)/zmienna, (54+4)/zmienna, (53+4)/zmienna, ":crime_dashboard/files/shader/circle_mask.png", 0, 0, 0, tocolor(er, gie, be, 255), false)
                dxDrawImage(1282/zmienna, 4/zmienna, 54/zmienna, 53/zmienna, myTexture, 0, 0, 0, tocolor(255, 255, 255, 255), false)
            else
                dxDrawImage((1282-2)/zmienna, (4-2)/zmienna, (54+4)/zmienna, (53+4)/zmienna, ":crime_dashboard/files/shader/circle_mask.png", 0, 0, 0, tocolor(er, gie, be, 255), false)
                dxDrawImage(1282/zmienna, 4/zmienna, 54/zmienna, 53/zmienna, ":crime_dashboard/files/avatar.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            end

            --BRONIE
            if getPedWeapon(localPlayer) ~= 0 and getPedWeapon(localPlayer) ~= 42 and getPedWeapon(localPlayer) ~= 2 and getPedWeapon(localPlayer) ~= 22 and getPedWeapon(localPlayer) ~= 28 and getPedWeapon(localPlayer) ~= 32 and getPedWeapon(localPlayer) ~= 37 and getPedWeapon(localPlayer) ~= 40 and getPedWeapon(localPlayer) ~= 46 then
                exports["crime_gui"]:guitext("#c6c6c6"..magazynek.."/"..full.."", 1246/zmienna, 183/zmienna, 1345/zmienna, 57/zmienna, 200, 200, 200, 255, fontxd123, "right", "center")
            end
                
            if getPedWeapon(localPlayer) ~= 0 and getPedWeapon(localPlayer) ~= 22 and getPedWeapon(localPlayer) ~= 2 and getPedWeapon(localPlayer) == 42 or getPedWeapon(localPlayer) == 28 or getPedWeapon(localPlayer) == 32 or getPedWeapon(localPlayer) == 37 or getPedWeapon(localPlayer) == 40 or getPedWeapon(localPlayer) == 46 then
                exports["crime_gui"]:guitext("#c6c6c6"..magazynek.."/"..full.."", 1246/zmienna, 233/zmienna, 1345/zmienna, 57/zmienna, 200, 200, 200, 255, fontxd123, "right", "center")
            end
            --KASA
            exports["crime_gui"]:guitext(""..formatujnaprzecinki(string.format("%06d", kasa)).." #5a3795PLN#cccccc\n"..lvl.." #5a3795Poziom", 1125/zmienna, 6/zmienna, 1275/zmienna, 57/zmienna, 200, 200, 200, 255, fontxd123, "right", "center")
        -- else
        --     local hp = getElementHealth(localPlayer)
        --     local liniahp = 335 * (hp / 100)
        --     local armor = getPedArmor(localPlayer)
        --     local liniaarmor = 335 * (armor / 100)
        --     local exp = getElementData(localPlayer,"player:exp") or 0
        --     local lvl = getElementData(localPlayer,"player:lvl") or 0
        --     local liniaexp = 151 * (exp / 100)
        --     local kasa = getPlayerMoney(localPlayer)
        --     local magazynek = getPedAmmoInClip (localPlayer)
        --     local full = getPedTotalAmmo (localPlayer) - magazynek

        --     dxDrawRectangle(1569/zmiennadwa, 4/zmiennadwa, 347/zmiennadwa, 117/zmiennadwa, tocolor(40, 40, 60, 193), false)

        --     dxDrawImage(1575/zmiennadwa, 10/zmiennadwa, 335/zmiennadwa, 31/zmiennadwa, ":crime_hud/hp.png", 0, 0, 0, tocolor(215, 0, 0, 100), false) -- hp
        --     dxDrawImage(1575/zmiennadwa, 45/zmiennadwa, 335/zmiennadwa, 31/zmiennadwa, ":crime_hud/hp.png", 0, 0, 0, tocolor(45, 45, 45, 155), false) -- armor
        --     dxDrawImage(1759/zmiennadwa, 81/zmiennadwa, 151/zmiennadwa, 31/zmiennadwa, ":crime_hud/hp.png", 0, 0, 0, tocolor(18, 230, 38, 55), false) --exp

        --     dxDrawImage(1575/zmiennadwa, 10/zmiennadwa, liniahp/zmiennadwa, 31/zmiennadwa, ":crime_hud/hp.png", 0, 0, 0, tocolor(215, 0, 0, 255), false) -- hp
        --     dxDrawImage(1575/zmiennadwa, 45/zmiennadwa, liniaarmor/zmiennadwa, 31/zmiennadwa, ":crime_hud/hp.png", 0, 0, 0, tocolor(45, 45, 45, 255), false) -- armor
        --     dxDrawImage(1759/zmiennadwa, 81/zmiennadwa, liniaexp/zmiennadwa, 31/zmiennadwa, ":crime_hud/hp.png", 0, 0, 0, tocolor(18, 230, 38, 255), false) --exp

        --     exports["crime_gui"]:guitext("", 1575/zmiennadwa, 46/zmiennadwa, 1604/zmiennadwa, 76/zmiennadwa, 200, 200, 200, 255, dxfont1_FA5, "center", "center")
        --     exports["crime_gui"]:guitext("", 1575/zmiennadwa, 10/zmiennadwa, 1604/zmiennadwa, 40/zmiennadwa, 200, 200, 200, 255, dxfont1_FA5, "center", "center")
        --     exports["crime_gui"]:guitext("", 1759/zmiennadwa, 81/zmiennadwa, 1788/zmiennadwa, 111/zmiennadwa, 200, 200, 200, 255, dxfont1_FA5, "center", "center")

        --     exports["crime_gui"]:guitext(""..math.floor(hp).."%", 1859/zmiennadwa, 10/zmiennadwa, 1910/zmiennadwa, 41/zmiennadwa, 200, 200, 200, 255, dxfont1_SegoeLight, "center", "center")
        --     exports["crime_gui"]:guitext(""..math.floor(armor).."%", 1859/zmiennadwa, 45/zmiennadwa, 1910/zmiennadwa, 76/zmiennadwa, 200, 200, 200, 255, dxfont1_SegoeLight, "center", "center")
        --     exports["crime_gui"]:guitext("LVL: "..lvl.." "..math.floor(exp).."/100", 1800/zmiennadwa, 81/zmiennadwa, 1910/zmiennadwa, 112/zmiennadwa, 200, 200, 200, 255, dxfont1_SegoeLight, "center", "center")

        --     exports["crime_gui"]:guitext(""..formatujnaprzecinki(string.format("%06d", kasa)).." PLN", 1575/zmiennadwa, 81/zmiennadwa, 1754/zmiennadwa, 112/zmiennadwa, 18, 230, 38, 255, dxfont2_SegoeLight, "center", "center")
        
        --     --BRONIE
        --     if getPedWeapon(localPlayer) ~= 0 and getPedWeapon(localPlayer) ~= 42 and getPedWeapon(localPlayer) ~= 2 and getPedWeapon(localPlayer) ~= 22 and getPedWeapon(localPlayer) ~= 28 and getPedWeapon(localPlayer) ~= 32 and getPedWeapon(localPlayer) ~= 37 and getPedWeapon(localPlayer) ~= 40 and getPedWeapon(localPlayer) ~= 46 then
        --         exports["crime_gui"]:guitext("#ccccccAmmo: #c6c6c6"..magazynek.."/"..full.."", 1764/zmiennadwa, 170/zmiennadwa, 1910/zmiennadwa, 194/zmiennadwa, 200, 200, 200, 255, fontxd123, "right", "center")
        --     end
                
        --     if getPedWeapon(localPlayer) ~= 0 and getPedWeapon(localPlayer) ~= 22 and getPedWeapon(localPlayer) ~= 2 and getPedWeapon(localPlayer) == 42 or getPedWeapon(localPlayer) == 28 or getPedWeapon(localPlayer) == 32 or getPedWeapon(localPlayer) == 37 or getPedWeapon(localPlayer) == 40 or getPedWeapon(localPlayer) == 46 then
        --         exports["crime_gui"]:guitext("#ccccccAmmo: #c6c6c6"..magazynek.."/"..full.."", 1764/zmiennadwa, 197/zmiennadwa, 1910/zmiennadwa, 221/zmiennadwa, 200, 200, 200, 255, fontxd123, "right", "center")
        --     end
        
        
        end
        -- if getElementData(localPlayer,"wiecejinfo") == true then
        --     local nickk = getPlayerName(localPlayer):gsub('#%x%x%x%x%x%x', '') or "Error"
        --     local armor = getPedArmor(localPlayer) or 0
        --     local hape = getElementHealth(localPlayer) or 0
        --     local uid = getElementData(localPlayer,"player:uid") or 0
        --     local id = getElementData(localPlayer,"id") or 0
        --     local ping = getPlayerPing(localPlayer) or 0
        --     local fpsy = getElementData(localPlayer,"fps") or 0
        --     local x,y,z = getElementPosition(localPlayer)
        --     local zone = getZoneName(x, y, z) or ""
        --     local city = getZoneName(x, y, z, true) or ""
            
        --     exports["crime_gui"]:guitext("\n\n\n\n\n\n\n\nNick: #c6c6c6"..nickk.."\n#ccccccArmor: #c6c6c6"..string.format("%.02f",armor).."%\n#ccccccHP: #c6c6c6"..string.format("%.02f",hape).."%\n#ccccccUID: #c6c6c6"..uid.."\n#ccccccID: #c6c6c6"..id.."\n#ccccccFPS: #c6c6c6"..fpsy.."\n#ccccccPing: #c6c6c6"..ping.."\n#ccccccLokalizacja: #c6c6c6"..zone..", "..city.."",1246/zmienna, 233/zmienna, 1345/zmienna, 77/zmienna, 200, 200, 200, 255, fontxd123, "right", "center")
        -- end
        if getElementData(localPlayer,"newhud") == false then 
            dxDrawImage(1203/zmienna, 66/zmienna, 143/zmienna, 71/zmienna, "bronie/"..getPedWeapon(localPlayer)..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        else 
            dxDrawImage(1767/zmiennadwa, 126/zmiennadwa, 143/zmiennadwa, 71/zmiennadwa, "bronie/"..getPedWeapon(localPlayer)..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
    end
end
addEventHandler("onClientRender", root, gui)

function showHide_HUD()
    if getElementData(localPlayer,"f1wylaczone") == true then return end
    if hud == 'tak' then
        hud = 'nie'
    else
        hud = 'tak'
    end
end
bindKey("F11","down",showHide_HUD)


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
  
local root = getRootElement()
local player = getLocalPlayer()
local counter = 0
local starttick
local currenttick
addEventHandler("onClientRender",root,
	function()
		if not starttick then
			starttick = getTickCount()
		end
		counter = counter + 1
		currenttick = getTickCount()
		if currenttick - starttick >= 1000 then
			setElementData(player,"fps",counter)
			counter = 0
			starttick = false
		end
	end
)

function lolsad()
    if getElementData(localPlayer,"avatarlink") then
        local avatarlink = getElementData(localPlayer,"avatarlink")
        triggerServerEvent("core:newAv", localPlayer, localPlayer)
    end
end
lolsad()
addEventHandler("onClientResourceStart", resourceRoot, function()
    if getElementData(localPlayer,"avatarlink") then
        local avatarlink = getElementData(localPlayer,"avatarlink")
        triggerServerEvent("core:newAv", localPlayer, localPlayer)
    end
end)

addEvent("hud:changeav",true)
addEventHandler("hud:changeav",root,function()
    if isElement(myTexture) then destroyElement(myTexture) end
    myTexture = getElementData(localPlayer,"player:avatar")
    --myTexture = dxCreateShader(":crime_dashboard/files/shader/hud_mask.fx")
    --avatar = dxCreateTexture(getElementData(localPlayer,"player:avatar"))
    --maska = dxCreateTexture(":crime_dashboard/files/shader/circle_mask.png")

    --dxSetShaderValue( myTexture, "sPicTexture", avatar )
    --dxSetShaderValue( myTexture, "sMaskTexture", maska )
end)

addEvent("hud:removeavatar",true)
addEventHandler("hud:removeavatar",root,function()
    if isElement(myTexture) then destroyElement(myTexture) end
    myTexture = getElementData(localPlayer,"player:avatar")
    --myTexture = dxCreateShader(":crime_dashboard/files/shader/hud_mask.fx")
    --avatar = dxCreateTexture(getElementData(localPlayer,"player:avatar"))
    --maska = dxCreateTexture(":crime_dashboard/files/shader/circle_mask.png")

    --dxSetShaderValue( myTexture, "sPicTexture", avatar )
    --dxSetShaderValue( myTexture, "sMaskTexture", maska )
end)