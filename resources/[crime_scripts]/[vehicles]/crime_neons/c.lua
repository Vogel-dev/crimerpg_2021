--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

w, h = guiGetScreenSize()
local neon = dxCreateTexture("neon.png")
local tick = getTickCount()
rand = 255

function loop()
  for forv_3, forv_4 in ipairs(getElementsByType("vehicle")) do
    x, y, z = getElementPosition(forv_4)
    a, b, c = getCameraMatrix()
    dis = getDistanceBetweenPoints3D(x, y, z, a, b, c)
    vis = isElementOnScreen(forv_4)
    if vis and dis < 50 then
      x, y, rot = getElementRotation(forv_4)

      if (x < 50 or x > 310) and (y < 50 or y > 310) and getElementData(forv_4, "vehicle:neon") then
        if getElementData(forv_4, "vehicle:neon") == 1 then 
            rand = 255
        elseif getElementData(forv_4, "vehicle:neon") == 2 then 
            local neon_setting_miganie = 5000
            rand = interpolateBetween(55, 0, 0, 255, 0, 0, (getTickCount()-tick)/neon_setting_miganie, "SineCurve")
        end
        drawIt(forv_4, rot)
      end
    end
  end
end
addEventHandler("onClientPreRender", root, loop)

function drawIt(arg1, arg2)
  x, y, z = getElementPosition(arg1)
  az = getGroundPosition(x, y, z)
  dis = getDistanceBetweenPoints3D(x, y, z, x, y, az)
  if dis < 2 then
    model = getElementModel(arg1)
    data = getElementData(arg1, "vehicle:neon")
    if data == 1 or data == 2 then
      --if getElementData(arg1, "vehicle:neon:state") then
      
      local k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12 = getVehicleColor(arg1,true)

      rx, ry, rz = getElementRotation(arg1)
      x, y, z = getElementPosition(arg1)
      r3 = rz - 30
      r4 = rz - 150
      r3 = math.abs(r3 - 360)
      r4 = math.abs(r4 - 360)
      r1 = r3 - 60
      r2 = r4 - 300
      r1 = math.rad(r1)
      r2 = math.rad(r2)
      r3 = math.rad(r3)
      r4 = math.rad(r4)
      cr1 = math.cos(r1)
      sr1 = math.sin(r1)
      cr2 = math.cos(r2)
      sr2 = math.sin(r2)
      cr3 = math.cos(r3)
      sr3 = math.sin(r3)
      cr4 = math.cos(r4)
      sr4 = math.sin(r4)
      cr1 = 1.8 * cr1
      sr1 = 1.8 * sr1
      cr2 = 1.8 * cr2
      sr2 = 1.8 * sr2
      cr3 = 1.8 * cr3
      sr3 = 1.8 * sr3
      cr4 = 1.8 * cr4
      sr4 = 1.8 * sr4
      x1 = sr1 + x
      y1 = cr1 + y
      x2 = sr2 + x
      y2 = cr2 + y
      x3 = sr3 + x
      y3 = cr3 + y
      x4 = sr4 + x
      y4 = cr4 + y
      az1 = getGroundPosition(x1, y1, z)
      az2 = getGroundPosition(x2, y2, z)
      az3 = getGroundPosition(x3, y3, z)
      az4 = getGroundPosition(x4, y4, z)
      dxDrawMaterialLine3D(x1, y1, az1 + 0.05, x2, y2, az2 + 0.05, neon, 0.75, tocolor(k10, k11, k12, rand), x1, y1, z + 4)
      dxDrawMaterialLine3D(x3, y3, az3 + 0.05, x4, y4, az4 + 0.05, neon, 0.75, tocolor(k10, k11, k12, rand), x3, y3, az3 + 4)
    end
  --end
end
end