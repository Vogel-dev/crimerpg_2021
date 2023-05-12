--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local cuboids = {
	{1807.9069824219, -1422.2432861328, 11.924078941345, 43,75, 25},
	{2497.2451171875, -1549.2149658203, 22.484685897827, 60.75, 50.75, 30},
	{1052.14, -2293.44, -64.79, 70.75, 90.75, 12},
	{1828.58, -1861.87, -67.99, 45, 110, 12},
	{1730.48, -1899.77, -31.89,40,40,4},
	{931.95593261719, -1652.1539306641, 11.547053337097, 15,12,4},
	{299.49, -1837.27, 3.40,10,20,4},
	{563.88, -1295.25, 16.00,8,8,4},
	{466.32, -1550.19, -38.09,20,20,3},
}

for i,v in ipairs(cuboids) do
	local cs = createColCuboid(v[1], v[2], v[3], v[4], v[5], v[6])
	setElementData(cs, "ghostcuboid", true)
end

addEventHandler("onColShapeHit", resourceRoot, function(hit)
	if not getElementData(source, "ghostcuboid") then return end
	if hit then 
		if getElementData(hit,"ghostniezcuba") then return end
		if getElementData(hit,"samouczek") then return end 
		triggerClientEvent(root, "ghostmode", resourceRoot, hit, "on", "cuboid")
	end
end)

addEventHandler("onColShapeLeave", resourceRoot, function(hit)
	if not getElementData(source, "ghostcuboid") then return end
	if hit then  
		if getElementData(hit,"ghostniezcuba") then return end
		if getElementData(hit,"samouczek") then return end 
		triggerClientEvent(root, "ghostmode", resourceRoot, hit, "off", "cuboid")
	end
end)