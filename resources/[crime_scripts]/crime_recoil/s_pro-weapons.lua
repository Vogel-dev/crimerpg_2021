--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

addEventHandler( 'onResourceStart', getResourceRootElement( getThisResource( ) ),
    function( )
		setWeaponProperty( 31, "poor", "accuracy", 99 )
		setWeaponProperty( 31, "std", "accuracy", 99 )
		setWeaponProperty( 31, "pro", "accuracy", 99 )
		setWeaponProperty( 24, "poor", "accuracy", 99 )
		setWeaponProperty( 24, "std", "accuracy", 99 )
		setWeaponProperty( 24, "pro", "accuracy", 99 )
		setWeaponProperty( 23, "poor", "accuracy", 99 )
		setWeaponProperty( 23, "std", "accuracy", 99 )
		setWeaponProperty( 23, "pro", "accuracy", 99 )
		setWeaponProperty( 22, "poor", "accuracy", 99 )
		setWeaponProperty( 22, "std", "accuracy", 99 )
		setWeaponProperty( 22, "pro", "accuracy", 99 )
		setWeaponProperty( 28, "poor", "accuracy", 99 )
		setWeaponProperty( 28, "std", "accuracy", 99 )
		setWeaponProperty( 28, "pro", "accuracy", 99 ) 
		setWeaponProperty( 29, "poor", "accuracy", 99 )
		setWeaponProperty( 29, "std", "accuracy", 99 )
		setWeaponProperty( 29, "pro", "accuracy", 99 )
		setWeaponProperty( 32, "poor", "accuracy", 99 )
		setWeaponProperty( 32, "std", "accuracy", 99 )
		setWeaponProperty( 32, "pro", "accuracy", 99 )
		setWeaponProperty( 30, "poor", "accuracy", 99 )
		setWeaponProperty( 30, "std", "accuracy", 99 )
		setWeaponProperty( 30, "pro", "accuracy", 99 )

	end
)

addEventHandler( 'onResourceStop', getResourceRootElement( getThisResource( ) ),
    function( )
        local range = getOriginalWeaponProperty( 31, "poor", "accuracy" )
		setWeaponProperty( 31, "poor", "accuracy", range )
		local range = getOriginalWeaponProperty( 31, "std", "accuracy" )
		setWeaponProperty( 31, "std", "accuracy", range )
		local range = getOriginalWeaponProperty( 31, "pro", "accuracy" )
		setWeaponProperty( 31, "pro", "accuracy", range )
        
		local range = getOriginalWeaponProperty( 24, "poor", "accuracy" )
		setWeaponProperty( 24, "poor", "accuracy", range )
		local range = getOriginalWeaponProperty( 24, "std", "accuracy" )
		setWeaponProperty( 24, "std", "accuracy", range )
		local range = getOriginalWeaponProperty( 24, "pro", "accuracy" )
		setWeaponProperty( 24, "pro", "accuracy", range )
		
		local range = getOriginalWeaponProperty( 23, "poor", "accuracy" )
		setWeaponProperty( 23, "poor", "accuracy", range )
		local range = getOriginalWeaponProperty( 23, "std", "accuracy" )
		setWeaponProperty( 23, "std", "accuracy", range )
		local range = getOriginalWeaponProperty( 23, "pro", "accuracy" )
		setWeaponProperty( 23, "pro", "accuracy", range )
		
		local range = getOriginalWeaponProperty( 22, "poor", "accuracy" )
		setWeaponProperty( 22, "poor", "accuracy", range )
		local range = getOriginalWeaponProperty( 22, "std", "accuracy" )
		setWeaponProperty( 22, "std", "accuracy", range )
		local range = getOriginalWeaponProperty( 22, "pro", "accuracy" )
		setWeaponProperty( 22, "pro", "accuracy", range )
		
		local range = getOriginalWeaponProperty( 28, "poor", "accuracy" )
		setWeaponProperty( 28, "poor", "accuracy", range )
		local range = getOriginalWeaponProperty( 28, "std", "accuracy" )
		setWeaponProperty( 28, "std", "accuracy", range )
		local range = getOriginalWeaponProperty( 28, "pro", "accuracy" )
		setWeaponProperty( 28, "pro", "accuracy", range )
		
		local range = getOriginalWeaponProperty( 28, "poor", "accuracy" )
		setWeaponProperty( 28, "poor", "accuracy", range )
		local range = getOriginalWeaponProperty( 28, "std", "accuracy" )
		setWeaponProperty( 28, "std", "accuracy", range )
		local range = getOriginalWeaponProperty( 28, "pro", "accuracy" )
		setWeaponProperty( 28, "pro", "accuracy", range )
		
		local range = getOriginalWeaponProperty( 29, "poor", "accuracy" )
		setWeaponProperty( 29, "poor", "accuracy", range )
		local range = getOriginalWeaponProperty( 29, "std", "accuracy" )
		setWeaponProperty( 29, "std", "accuracy", range )
		local range = getOriginalWeaponProperty( 29, "pro", "accuracy" )
		setWeaponProperty( 29, "pro", "accuracy", range )		
		
		local range = getOriginalWeaponProperty( 32, "poor", "accuracy" )
		setWeaponProperty( 32, "poor", "accuracy", range )
		local range = getOriginalWeaponProperty( 32, "std", "accuracy" )
		setWeaponProperty( 32, "std", "accuracy", range )
		local range = getOriginalWeaponProperty( 32, "pro", "accuracy" )
		setWeaponProperty( 32, "pro", "accuracy", range )	
		
		local range = getOriginalWeaponProperty( 30, "poor", "accuracy" )
		setWeaponProperty( 30, "poor", "accuracy", range )
		local range = getOriginalWeaponProperty( 30, "std", "accuracy" )
		setWeaponProperty( 30, "std", "accuracy", range )
		local range = getOriginalWeaponProperty( 30, "pro", "accuracy" )
		setWeaponProperty( 30, "pro", "accuracy", range )
	end
)