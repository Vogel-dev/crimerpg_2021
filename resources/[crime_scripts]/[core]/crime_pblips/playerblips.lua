root = getRootElement ()
color = { 255, 255, 255 }
players = {}
resourceRoot = getResourceRootElement ( getThisResource () )

function onResourceStart ( resource )
  	for id, player in ipairs( getElementsByType ( "player" ) ) do
		if ( players[player] ) then
			createBlipAttachedTo ( player, 12, 2, players[source][1], players[source][2], players[source][3], 255, 0, 300 )
		else
			createBlipAttachedTo ( player, 12, 2, color[1], color[2], color[3], 255, 0, 300 )
		end
	end
end

function onPlayerSpawn ( spawnpoint )
	if ( players[source] ) then
		createBlipAttachedTo ( source, 12, 2, players[source][1], players[source][2], players[source][3], 255, 0, 300 )
	else
		createBlipAttachedTo ( source, 12, 2, color[1], color[2], color[3], 255, 0, 300 )
	end
end

function onPlayerQuit ()
	destroyBlipsAttachedTo ( source )
end

function onPlayerWasted ( totalammo, killer, killerweapon )
	destroyBlipsAttachedTo ( source )
end

function setBlipsColor ( source, commandName, r, g, b )
	if ( tonumber ( b ) ) then
		color = { tonumber ( r ), tonumber ( g ), tonumber ( b ) }
  		for id, player in ipairs( getElementsByType ( "player" ) ) do
			destroyBlipsAttachedTo ( player )
			if ( players[player] ) then
				createBlipAttachedTo ( player, 12, 2, players[source][1], players[source][2], players[source][3], 255, 0, 300)

			else
				createBlipAttachedTo ( player, 12, 2, color[1], color[2], color[3], 255, 0, 300 )
			end
		end
	end
end

function setBlipColor ( source, commandName, r, g, b )
	if ( tonumber ( b ) ) then
		destroyBlipsAttachedTo ( source )
		players[source] = { tonumber ( r ), tonumber ( g ), tonumber ( b ) }
  		createBlipAttachedTo ( source, 12, 2, players[source][1], players[source][2], players[source][3], 255, 0, 300 )
	end
end

addEventHandler ( "onResourceStart", resourceRoot, onResourceStart )
addEventHandler ( "onPlayerSpawn", root, onPlayerSpawn )
addEventHandler ( "onPlayerQuit", root, onPlayerQuit )
addEventHandler ( "onPlayerWasted", root, onPlayerWasted )

function destroyBlipsAttachedTo(player)
	local attached = getAttachedElements ( player )
	if ( attached ) then
		for k,element in ipairs(attached) do
			if getElementType ( element ) == "blip" then
				destroyElement ( element )
			end
		end
	end
end