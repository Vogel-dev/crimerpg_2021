--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

if isVoiceEnabled() then
	function setPlayerVoiceMuted ( player, muted )
		if not checkValidPlayer ( player ) then return false end
		muted = not not muted or nil
		globalMuted[player] = muted
		return setPlayerVoiceBroadcastTo ( player, (not muted) and root or nil )
	end

	function isPlayerVoiceMuted ( player )
		if not checkValidPlayer ( player ) then return false end
		return not not globalMuted[player]
	end

	--Returns a list of players of which have muted the specified player
	function getPlayerVoiceMutedByList ( player ) 
		if not checkValidPlayer ( player ) then return false end
		return tableToArray(mutedBy[player] or {})
	end

	function updateMuted ( player )
		setPlayerVoiceIgnoreFrom ( player, getPlayerVoiceMutedByList ( player ) )
	end


	function addPlayerMutedBy ()	
		mutedBy[client] = mutedBy[client] or {}
		mutedBy[client][source] = true
		updateMuted ( client )
	end
	addEventHandler ( "voice_mutePlayerForPlayer", root, addPlayerMutedBy )

	function removePlayerMutedBy ()
		if mutedBy[client] then
			mutedBy[client][source] = nil
			--Refresh the player
			updateMuted ( client )
		end
	end
	addEventHandler ( "voice_unmutePlayerForPlayer", root, removePlayerMutedBy )
	
	function addPlayerMutedByTable (players) --Single packet for multiple muted players
		for i,player in ipairs(players) do
			source = player
			addPlayerMutedBy()
		end
	end
	addEventHandler ( "voice_muteTableForPlayer", root, addPlayerMutedByTable )

	addEventHandler ( "onPlayerQuit", root, 
		function()
			mutedBy[source] = nil
			globalMuted[source] = nil
		end
	)
else
	setPlayerVoiceMuted = outputVoiceNotLoaded
	isPlayerVoiceMuted = outputVoiceNotLoaded
	getPlayerVoiceMutedByList = outputVoiceNotLoaded
end

function isPlayerMuted ( player )			return isPlayerVoiceMuted ( player ) end
function setPlayerMuted ( player, muted )	return setPlayerVoiceMuted ( player, muted ) end
function getPlayerMutedByList ( player )	return getPlayerVoiceMutedByList ( player ) end

addEventHandler( 'onPlayerVoiceStart', root,function()
	local resultA=exports["crime_database"]:dbGet("SELECT * FROM crime_punish WHERE type=? AND active=1 AND serial=? AND time>NOW() LIMIT 1","mute", getPlayerSerial(source))
	if #resultA > 0 then
		setElementData(source,"mute:player",true) 
		triggerClientEvent(source, "addNoti", source, 'Posiadasz blokadę komunikacji do:\n '..resultA[1].time..' z powodu:\n '..resultA[1].reason..'', "error" )
		cancelEvent()
	else
		setElementData(source,"mute:player",false) 
	return end
end)

addEvent("voicechanyl",true)
addEventHandler("voicechanyl",root,function(onoff)
	if onoff == true then 
		local nextempty = getNextEmptyChannel ( )
        setPlayerChannel ( source, nextempty )
	else
		setPlayerChannel ( source, 1 )
	end
end)