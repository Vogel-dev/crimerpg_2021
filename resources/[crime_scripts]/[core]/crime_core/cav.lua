--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEvent( "core:getAv", true )
addEventHandler( "core:getAv", root, function( pixelsdwa, player )
    if myTexture then destroyElement(myTexture) end
    myTexture = dxCreateShader(":crime_dashboard/files/shader/hud_mask.fx")
    avatar = dxCreateTexture(pixelsdwa)
    maska = dxCreateTexture(":crime_dashboard/files/shader/circle_mask.png")

    dxSetShaderValue( myTexture, "sPicTexture", avatar )
    dxSetShaderValue( myTexture, "sMaskTexture", maska )

    --avatardwa = dxCreateTexture(pixelsdwa)
    setElementData(player,"player:avatar",myTexture)
    triggerEvent("hud:changeav",localPlayer)
end)