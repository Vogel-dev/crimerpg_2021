--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

bindKey( 'o', 'both', function( key, keyState )
	if keyState == 'down' then
		for k, v in ipairs ( getElementsByType( 'colshape', resourceRoot ) ) do
			local dom=getElementData(v,"dom")
			if (dom and dom.ownerid) then
				createBlipAttachedTo( v, 32, 2, 255,0,0,255,100,500 );
			else
				createBlipAttachedTo( v, 31, 2, 255,0,0,255,100,500 );
			end
		end
	else
		for k, v in ipairs( getElementsByType( 'blip', getResourceRootElement() ) ) do
			destroyElement(v)
		end
	end

end)
