addEvent("addNoti", true)

local resourceRoot = getResourceRootElement(getThisResource())
local screenW, screenH = guiGetScreenSize()

tick = getTickCount()

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx

local font = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 10/zmienna)
local notis = {}
local settings = {
  ['time'] = 5000,
  ['max'] = 7,
}
local sx, sy = guiGetScreenSize()
local hardY


function scale_x(x)
  return (x/1920) * sx
end

function scale_y(y)
  return (y/1080) * sy
end

addEventHandler("onClientRender", root, function()
  if not getElementData(localPlayer, "player:hide_minimap") and not getElementData(localPlayer, "player:always_hide_minimap") and getElementInterior(localPlayer) ~= 1 then
    hardY = 305
  else
    hardY = 45
  end

  for i=1, #notis do
    local v = notis[i]
    if v then
      if v.state == "show" then
        local x, alpha = interpolateBetween(-15, 0, 0, 18, 255, 0, (getTickCount() - v.start) / 500, "OutQuad")
        dxDrawImage(x, sy - hardY - ((i - 1) * (v.height + 2)), 353, v.height, ":crime_files/noti/background.png", 0, 0, 0, tocolor(255, 255, 255, alpha), v.postgui)
        dxDrawText(v.text, x + 55, sy - hardY - ((i - 1) * (v.height + 2)), x + 353, sy - (hardY - 39) - ((i - 1) * (v.height + 2)), tocolor(255, 255, 255, alpha), 1, font, "left", "center", false, true, v.postgui)
        dxDrawImage(x + 15,  sy - (hardY - 6) - ((i - 1) * (v.height + 2)), 27, 27, ":crime_files/noti/"..v.type..".png", 0, 0, 0, tocolor(255, 255, 255, alpha), v.postgui)

        if getTickCount() - v.start > v.time then
          v.start = getTickCount()
          v.state = "hide"
        end
      elseif v.state == "hide" then
        local x, alpha = interpolateBetween(18, 255, 0, -15, 0, 0, (getTickCount() - v.start) / 500, "OutQuad")
        dxDrawImage(x, sy - hardY - ((i - 1) * (v.height + 2)), 353, v.height, ":crime_files/noti/background.png", 0, 0, 0, tocolor(255, 255, 255, alpha), v.postgui)
        dxDrawText(v.text, x + 55, sy - hardY - ((i - 1) * (v.height + 2)), x + 353, sy - (hardY - 39) - ((i - 1) * (v.height + 2)), tocolor(255, 255, 255, alpha), 1, font, "left", "center", false, true, v.postgui)
        dxDrawImage(x + 15,  sy - (hardY - 6) - ((i - 1) * (v.height + 2)), 27, 27, ":crime_files/noti/"..v.type..".png", 0, 0, 0, tocolor(255, 255, 255, alpha), v.postgui)


        if getTickCount() - v.start > 500 then
          table.remove(notis, i)
        end
      end
    end
  end
end)


function addNoti(text, type, postgui)
  table.insert(notis, {type = type or "success", text = text, state = "show", postgui = postgui, height = 39, start = getTickCount(), time = settings['time'] + utf8.len(tostring(text)) * 50})
  outputConsole("["..(type or "success").."] "..text)
  if #notis > settings['max'] then
    table.remove(notis, 1)
  elseif #notis >= settings['max'] - 2 then
    notis[1].start = getTickCount()
    notis[1].state = "hide"
  end
end
addEventHandler("addNoti", root, addNoti)
