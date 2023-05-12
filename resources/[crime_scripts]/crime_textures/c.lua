--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

podmienianie = false
textureSelected = false

sx, sy = guiGetScreenSize(  )

-- ładowanie shadera i textur

textury = {}
texture = {}
lastTexture = {}
for i = 1, 317 do
	textury[i] = dxCreateTexture( "textury/" .. i .. ".jpg" )
	texture[i] = dxCreateShader("replace.fx")
	dxSetShaderValue(texture[i], "gTexture", textury[i])
end

-- nakładanie textur

function setElementTexture( element, id, texturename )
	for i = 1, 317 do
		engineRemoveShaderFromWorldTexture( texture[i], texturename, element )
	end
	if tonumber(getElementData(element,"crimerpg")) ~= 0 then 
		engineApplyShaderToWorldTexture( texture[id], texturename, element )
	end
end

-- sprawdzanie

function nadajteksture()
		for k,v in ipairs(getElementsByType("object")) do
			if getElementData( v, "crimerpg" ) ~= lastTexture[v] and getElementData( v, "crimerpg" ) ~= 0 and tonumber(getElementData( v, "crimerpg" )) then
				setElementTexture( v, tonumber(getElementData( v, "crimerpg" )), "*" )
				lastTexture[v] = getElementData( v, "crimerpg" )
				setElementData(v,"nadanoteksture",true)
			end
		end
end
nadajteksture()

addEvent("nadajteksturenowa",true)
addEventHandler("nadajteksturenowa",root,function()
	for k,v in ipairs(getElementsByType("object")) do
		if getElementData( v, "crimerpg" ) ~= lastTexture[v] and getElementData( v, "crimerpg" ) ~= 0 and tonumber(getElementData( v, "crimerpg" )) then
			if not getElementData(v,"nadanoteksture") then
				setElementTexture( v, tonumber(getElementData( v, "crimerpg" )), "*" )
				lastTexture[v] = getElementData( v, "crimerpg" )
				setElementData(v,"nadanoteksture",true)
			end
		end
	end
end)

setTimer(nadajteksture,1000*60*30,0)



