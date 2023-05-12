--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local textsToDraw = {}

local hideown = false
local showtime = 5500
local characteraddition = 100
local maxbubbles = 2
local showthebubbles = true


function income(message,messagetype)
    if source ~= getLocalPlayer() or not hideown then
        if messagetype == 2 then
            if getPlayerTeam(source) == getPlayerTeam(getLocalPlayer()) then
                addText(source,message,messagetype)
            end
        else
            addText(source,message,messagetype)
        end
    end
end
    addEvent("onChatbubblesMessageIncome",true)
    addEventHandler("onChatbubblesMessageIncome",getRootElement(),income)
function addText(source,message,messagetype)
    local notfirst = false
    for i,v in ipairs(textsToDraw) do
        if v[1] == source then
            v[4] = v[4] + 1
            notfirst = true
        end
    end
    local infotable = {source,message,messagetype,0}
    table.insert(textsToDraw,infotable)
    if not notfirst then
        setTimer(removeText,showtime + (tonumber(#message) * 100),1,infotable)
    end
end

function removeText(infotable)
    for i,v in ipairs(textsToDraw) do
        if v[1] == infotable[1] and v[2] == infotable[2] then
            for i2,v2 in ipairs(textsToDraw) do
                if v2[1] == v[1] and v[4] - v2[4] == 1 then
                    setTimer(removeText,showtime + (tonumber(#v2[2]) * 100),1,v2)
                end
            end
            table.remove(textsToDraw,i)
            break
        end
    end
end

function getTextsToRemove()
    for i,v in ipairs(textsToDraw) do
        if v[1] == source then
            removeText(v)
        end
    end
end

function handleDisplay()
    if showthebubbles then
        for i,v in ipairs(textsToDraw) do
            if isElement(v[1]) then
                if getElementHealth(v[1]) > 0 then
                    local camPosXl, camPosYl, camPosZl = getPedBonePosition (v[1], 6)
                    local camPosXr, camPosYr, camPosZr = getPedBonePosition (v[1], 7)
                    local x,y,z = (camPosXl + camPosXr) / 2, (camPosYl + camPosYr) / 2, (camPosZl + camPosZr) / 2
                    --local posx,posy = getScreenFromWorldPosition(x,y,z+0.25)
                    local cx,cy,cz = getCameraMatrix()
                    local px,py,pz = getElementPosition(v[1])
                    local distance = getDistanceBetweenPoints3D(cx,cy,cz,px,py,pz)
                    local posx,posy = getScreenFromWorldPosition(x,y,z+0.020*distance-0.5)
                    local elementtoignore1 = getPedOccupiedVehicle(getLocalPlayer()) or getLocalPlayer()
                    local elementtoignore2 = getPedOccupiedVehicle(v[1]) or v[1]
                    if posx and distance <= 45 and ( isLineOfSightClear(cx,cy,cz,px,py,pz,true,true,false,true,false,true,true,elementtoignore1) or isLineOfSightClear(cx,cy,cz,px,py,pz,true,true,false,true,false,true,true,elementtoignore2) ) and ( not maxbubbles or  v[4] < maxbubbles ) then -- change this when multiple ignored elements can be specified
                        local width = dxGetTextWidth(v[2],1,"default")
                        
                        --dxDrawRectangle(posx - (3 + (0.5 * width)),posy - (2 + (v[4] * 20)),width + 5,19,tocolor(102,178,255,67))
                        --dxDrawRectangle(posx - (6 + (0.5 * width)),posy - (2 + (v[4] * 20)),width + 11,19,tocolor(102,178,255,20))
                        --dxDrawRectangle(posx - (8 + (0.5 * width)),posy - (1 + (v[4] * 20)),width + 15,17,tocolor(102,178,255,67))
                        --dxDrawRectangle(posx - (10 + (0.5 * width)),posy - (1 + (v[4] * 20)),width + 19,17,tocolor(102,178,255,20))
                      --  dxDrawRectangle(posx - (10 + (0.5 * width)),posy - (v[4] * 20) + 1,width + 19,13,tocolor(255,155,0,90))
                        --dxDrawRectangle(posx - (12 + (0.5 * width)),posy - (v[4] * 20) + 1,width + 23,13,tocolor(255,155,0,20))
                        --dxDrawRectangle(posx - (12 + (0.5 * width)),posy - (v[4] * 20) + 4,width + 23,7,tocolor(255,155,0, 90))
                        
                        local r,g,b = 255,255,255
                        if v[3] == 2 then
                            r,g,b = getTeamColor(getPlayerTeam(v[1]))
                        end
                        
                        --dxDrawText(v[2]:gsub("#%x%x%x%x%x%x",""),posx - (0.5 * width),posy - (v[4] * 20),posx - (0.5 * width),posy - (v[4] * 20),tocolor(r,g,b,255),1,"default","left","top",false,false,false)
                    end
                end
            end
        end
    end
end





function toggleBubblesOnOff()
    showthebubbles = not showthebubbles
    outputChatBox("Toggled chatbubbles " ..( not showthebubbles and "#FF0000off#FFFFFF." or "#00FF00on#FFFFFF." ),255,255,255,true)
end

addEventHandler("onClientPlayerQuit",getRootElement(),getTextsToRemove)
addEventHandler("onClientRender",getRootElement(),handleDisplay)
--addCommandHandler("chatbubbles",toggleBubblesOnOff)

gada = false

function rozmawiasobie()
    if not localPlayer then return end 
    if gada == false then 
        if isChatBoxInputActive() == false then return end 
        if isChatBoxInputActive() == true then
            local spid1 = getElementSpeed(localPlayer,"km/h")
            if spid1 <= 0 then  
                if getPedAnimation(localPlayer) then return end
                gada = true
                triggerServerEvent("anims:startanim", localPlayer, "GANGS", "prtial_gngtlkH")
            end
        end 
    end
    if gada == true then 
        if isChatBoxInputActive() == true then return end 
        if isChatBoxInputActive() == false then 
            gada = false 
            triggerServerEvent("anims:stopanim", localPlayer)
        end
    end
end
addEventHandler("onClientRender",root,rozmawiasobie)

function getElementSpeed(theElement, unit)
    -- Check arguments for errors
    assert(isElement(theElement), "Bad argument 1 @ getElementSpeed (element expected, got " .. type(theElement) .. ")")
    local elementType = getElementType(theElement)
    assert(elementType == "player" or elementType == "ped" or elementType == "object" or elementType == "vehicle" or elementType == "projectile", "Invalid element type @ getElementSpeed (player/ped/object/vehicle/projectile expected, got " .. elementType .. ")")
    assert((unit == nil or type(unit) == "string" or type(unit) == "number") and (unit == nil or (tonumber(unit) and (tonumber(unit) == 0 or tonumber(unit) == 1 or tonumber(unit) == 2)) or unit == "m/s" or unit == "km/h" or unit == "mph"), "Bad argument 2 @ getElementSpeed (invalid speed unit)")
    -- Default to m/s if no unit specified and 'ignore' argument type if the string contains a number
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    -- Setup our multiplier to convert the velocity to the specified unit
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)
    -- Return the speed by calculating the length of the velocity vector, after converting the velocity to the specified unit
    return (Vector3(getElementVelocity(theElement)) * mult).length
end

    