addEventHandler("onClientResourceStart", resourceRoot, function ()
	setPlayerHudComponentVisible("all", false)

	Radar.start()
	setRadarVisible(true)
	addEventHandler("onClientPreRender", root, updateRotations)
end)