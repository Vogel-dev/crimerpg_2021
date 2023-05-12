--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

----------------------------------------------------------------
----------------------------------------------------------------
-- Effect switching on and off
--
--	To switch on:
--			triggerEvent( "switchCarPaint", root, true )
--
--	To switch off:
--			triggerEvent( "switchCarPaint", root, false )
--
----------------------------------------------------------------
----------------------------------------------------------------

--------------------------------
-- onClientResourceStart
--		Auto switch on at start
--------------------------------
addEventHandler( "onClientResourceStart", getResourceRootElement( getThisResource()),
	function()
		outputDebugString('/sCarPaint to switch the effect')
		triggerEvent( "switchCarPaint", resourceRoot, true )
		addCommandHandler( "sCarPaint",
			function()
				triggerEvent( "switchCarPaint", resourceRoot, not cpEffectEnabled )
			end
		)
	end
)


--------------------------------
-- Switch effect on or off
--------------------------------
function switchCarPaint( cpOn )
	outputDebugString( "switchCarPaint: " .. tostring(cpOn) )
	if cpOn then
		startCarPaint()
	else
		stopCarPaint()
	end
end

addEvent( "switchCarPaint", true )
addEventHandler( "switchCarPaint", resourceRoot, switchCarPaint )
