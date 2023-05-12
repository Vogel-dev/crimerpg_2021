--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

function pozycja1()
	local element = getPedOccupiedVehicle(localPlayer) or localPlayer
	local x,y,z = getElementPosition(element)
	local txt = '{'..x..','..y..','..z..'},'
	outputChatBox(txt)
	setClipboard(txt)
end
addCommandHandler('gp3',pozycja1)

function pozycja2()
	local element = getPedOccupiedVehicle(localPlayer) or localPlayer
	local x,y,z = getElementPosition(element)
	local _,_,rz = getElementRotation(element)
	local txt = x..','..y..','..z..','..rz
	outputChatBox(txt)
	setClipboard(txt)
end
addCommandHandler('gp2',pozycja2)

function pozycjacar()
	local element = getPedOccupiedVehicle(localPlayer) or localPlayer
	local veh = getPedOccupiedVehicle(localPlayer)
	local x,y,z = getElementPosition(veh)
	local rx,ry,rz = getElementRotation(veh)
	local model = getElementModel(veh)
	local txt = '{'..model..','..x..','..y..','..z..','..rx..','..ry..','..rz..'},'
	outputChatBox(txt)
	setClipboard(txt)
end
addCommandHandler('gpcar',pozycjacar)

function pozycja3()
	local element = getPedOccupiedVehicle(localPlayer) or localPlayer
	local x,y,z = getElementPosition(element)
	local txt = x..','..y..','..z
	outputChatBox(txt)
	setClipboard(txt)
end
addCommandHandler('gp',pozycja3)

function camera()
	local cx,cy,cz,cx2,cy2,cz2 = getCameraMatrix()
	local txt = cx..','..cy..','..cz..','..cx2..','..cy2..','..cz2
	outputChatBox(txt)
	setClipboard(txt)
end
addCommandHandler('gc',camera)
