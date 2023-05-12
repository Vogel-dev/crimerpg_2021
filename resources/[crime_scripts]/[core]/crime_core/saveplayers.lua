--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local koszulki = {
    {"player_torso","torso"},
    {"vestblack","vest"},
    {"vest","vest"},
    {"tshirt2horiz","tshirt2"},
    {"tshirtwhite","tshirt"},
    {"tshirtilovels","tshirt"},
    {"tshirtblunts","tshirt"},
    {"shirtbplaid","shirtb"},
    {"shirtbcheck","shirtb"},
    {"field","field"},
    {"tshirterisyell","tshirt"},
    {"tshirterisorn","tshirt"},
    {"trackytop2eris","trackytop1"},
    {"bbjackrim","bbjack"},
    {"bballjackrstar","bbjack"},
    {"baskballdrib","baskball"},
    {"baskballrim","baskball"},
    {"sixtyniners","tshirt"},
    {"bandits","baseball"},
    {"tshirtprored","tshirt"},
    {"tshirtproblk","tshirt"},
    {"trackytop1pro","trackytop1"},
    {"hockeytop","sweat"},
    {"bbjersey","sleevt"},
    {"shellsuit","trackytop1"},
    {"tshirtheatwht","tshirt"},
    {"tshirtbobomonk","tshirt"},
    {"tshirtbobored","tshirt"},
    {"tshirtbase5","tshirt"},
    {"tshirtsuburb","tshirt"},
    {"hoodyamerc","hoodya"},
    {"hoodyabase5","hoodya"},
    {"hoodyarockstar","hoodya"},
    {"wcoatblue","wcoat"},
    {"coach","coach"},
    {"coachsemi","coach"},
    {"sweatrstar","sweat"},
    {"hoodyAblue","hoodyA"},
    {"hoodyAblack","hoodyA"},
    {"hoodyAgreen","hoodyA"},
    {"sleevtbrown","sleevt"},
    {"shirtablue","shirta"},
    {"shirtayellow","shirta"},
    {"shirtagrey","shirta"},
    {"shirtbgang","shirtb"},
    {"tshirtzipcrm","tshirt"},
    {"tshirtzipgry","tshirt"},
    {"denimfade","denim"},
    {"bowling","hawaii"},
    {"hoodjackbeige","hoodjack"},
    {"baskballloc","baskball"},
    {"tshirtlocgrey","tshirt"},
    {"tshirtmaddgrey","tshirt"},
    {"tshirtmaddgrn","tshirt"},
    {"suit1grey","suit1"},
    {"suit1blk","suit1"},
    {"leather","leather"},
    {"painter","painter"},
    {"hawaiiwht","hawaii"},
    {"hawaiired","hawaii"},
    {"sportjack","trackytop1"},
    {"suit1red","suit1"},
    {"suit1blue","suit1"},
    {"suit1yellow","suit1"},
    {"suit2grn","suit2"},
    {"tuxedo","suit2"},
    {"suit1gang","suit1"},
    {"letter","sleevt"},
}

local fryzury = {
    {"player_face","head"},
    {"hairblond","head"},
    {"hairred","head"},
    {"hairblue","head"},
    {"hairgreen","head"},
    {"hairpink","head"},
    {"bald","head"},
    {"baldbeard","head"},
    {"baldtash","head"},
    {"baldgoatee","head"},
    {"highfade","head"},
    {"highafro","highafro"},
    {"wedge","wedge"},
    {"slope","slope"},
    {"jhericurl","jheri"},
    {"cornrows","cornrows"},
    {"cornrowsb","cornrows"},
    {"tramline","tramline"},
    {"groovecut","groovecut"},
    {"mohawk","mohawk"},
    {"mohawkblond","mohawk"},
    {"mohawkpink","mohawk"},
    {"mohawkbeard","mohawk"},
    {"afro","afro"},
    {"afrotash","afro"},
    {"afrobeard","afro"},
    {"afroblond","afro"},
    {"flattop","flattop"},
    {"elvishair","elvishair"},
    {"beard","head"},
    {"tash","head"},
    {"goatee","head"},
    {"afrogoatee","afro"},
}

local spodnie = {
    {"player_legs","legs"},
    {"worktrcamogrn","worktr"},
    {"worktrcamogry","worktr"},
    {"worktrgrey","worktr"},
    {"worktrkhaki","worktr"},
    {"tracktr","tracktr"},
    {"tracktreris","tracktr"},
    {"jeansdenim","jeans"},
    {"legsblack","legs"},
    {"legsheart","legs"},
    {"biegetr","chinosb"},
    {"tracktrpro","tracktr"},
    {"tracktrwhstr","tracktr"},
    {"tracktrblue","tracktr"},
    {"tracktrgang","tracktr"},
    {"bbshortwht","boxingshort"},
    {"boxshort","boxingshort"},
    {"bbshortred","boxingshort"},
    {"shellsuittr","tracktr"},
    {"shortsgrey","shorts"},
    {"shortskhaki","shorts"},
    {"chongergrey","chonger"},
    {"chongergang","chonger"},
    {"chongerred","chonger"},
    {"chongerblue","chonger"},
    {"shortsgang","shorts"},
    {"denimsgang","jeans"},
    {"denimsred","jeans"},
    {"chinosbiege","chinosb"},
    {"chinoskhaki","chinosb"},
    {"cutoffchinos","shorts"},
    {"cutoffchinosblue","shorts"},
    {"chinosblack","chinosb"},
    {"chinosblue","chinosb"},
    {"leathertr","leathertr"},
    {"leathertrchaps","leathertr"},
    {"suit1trgrey","suit1tr"},
    {"suit1trblk","suit1tr"},
    {"cutoffdenims","shorts"},
    {"suit1trred","suit1tr"},
    {"suit1trblue","suit1tr"},
    {"suit1tryellow","suit1tr"},
    {"suit1trgreen","suit1tr"},
    {"suit1trblk2","suit1tr"},
    {"suit1trgang","suit1tr"},
}

local buty = {
    {"foot","feet"},
    {"cowboyboot2","biker"},
    {"bask2semi","bask1"},
    {"bask1eris","bask1"},
    {"sneakerbincgang","sneaker"},
    {"sneakerbincblue","sneaker"},
    {"sneakerbincblk","sneaker"},
    {"sandal","flipflop"},
    {"sandalsock","flipflop"},
    {"flipflop","flipflop"},
    {"hitop","bask1"},
    {"convproblk","conv"},
    {"convproblu","conv"},
    {"convprogrn","conv"},
    {"sneakerprored","sneaker"},
    {"sneakerproblu","sneaker"},
    {"sneakerprowht","sneaker"},
    {"bask1prowht","bask1"},
    {"bask1problk","bask1"},
    {"boxingshoe","biker"},
    {"convheatblk","conv"},
    {"convheatred","conv"},
    {"convheatorn","conv"},
    {"sneakerheatwht","sneaker"},
    {"sneakerheatgry","sneaker"},
    {"sneakerheatblk","sneaker"},
    {"bask2heatwht","bask1"},
    {"bask2heatband","bask1"},
    {"timbergrey","bask1"},
    {"timberred","bask1"},
    {"timberfawn","bask1"},
    {"timberhike","bask1"},
    {"cowboyboot","biker"},
    {"biker","biker"},
    {"snakeskin","biker"},
    {"shoedressblk","shoe"},
    {"shoedressbrn","shoe"},
    {"shoespatz","shoe"},
}

local naszyjniki = {
    {"dogtag","neck"},
    {"neckafrica","neck"},
    {"stopwatch","neck"},
    {"necksaints","neck"},
    {"neckhash","neck"},
    {"necksilver","neck2"},
    {"neckgold","neck2"},
    {"neckropes","neck2"},
    {"neckropeg","neck2"},
    {"neckls","neck"},
    {"neckdollar","neck"},
    {"neckcross","neck"},
}

local zegarki = {
    {"watchpink","watch"},
    {"watchyellow","watch"},
    {"watchpro","watch"},
    {"watchpro2","watch"},
    {"watchsub1","watch"},
    {"watchsub2","watch"},
    {"watchzip1","watch"},
    {"watchzip2","watch"},
    {"watchgno","watch"},
    {"watchgno2","watch"},
    {"watchcro","watch"},
    {"watchcro2","watch"},
}

local twarz = {
    {"groucho","grouchos"},
    {"zorro","zorromask"},
    {"eyepatch","eyepatch"},
    {"glasses01","glasses01"},
    {"glasses04","glasses04"},
    {"bandred3","bandmask"},
    {"bandblue3","bandmask"},
    {"bandgang3","bandmask"},
    {"bandblack3","bandmask"},
    {"glasses01dark","glasses01"},
    {"glasses04dark","glasses04"},
    {"glasses03","glasses03"},
    {"glasses03red","glasses03"},
    {"glasses03blue","glasses03"},
    {"glasses03dark","glasses03"},
    {"glasses05dark","glasses03"},
    {"glasses05","glasses03"},
}

local czapka = {
    {"bandred","bandana"},
    {"bandblue","bandana"},
    {"bandgang","bandana"},
    {"bandblack","bandana"},
    {"bandred2","bandknots"},
    {"bandblue2","bandknots"},
    {"bandblack2","bandknots"},
    {"bandgang2","bandknots"},
    {"capknitgrn","capknit"},
    {"captruck","captruck"},
    {"cowboy","cowboy"},
    {"hattiger","cowboy"},
    {"helmet","helmet"},
    {"moto","moto"},
    {"boxingcap","boxingcap"},
    {"hockey","hockeymask"},
    {"capgang","cap"},
    {"capgangback","capback"},
    {"capgangside","capside"},
    {"capgangover","capovereye"},
    {"capgangup","caprimup"},
    {"bikerhelmet","bikerhelmet"},
    {"capred","cap"},
    {"capredback","capback"},
    {"capredside","capside"},
    {"capredover","capovereye"},
    {"capredup","caprimup"},
    {"capblue","cap"},
    {"capblueback","capback"},
    {"capblueside","capside"},
    {"capblueover","capovereye"},
    {"capblueup","caprimup"},
    {"skullyblk","skullycap"},
    {"skullygrn","skullycap"},
    {"hatmancblk","hatmanc"},
    {"hatmancplaid","hatmanc"},
    {"capzip","cap"},
    {"capzipback","capback"},
    {"capzipside","capside"},
    {"capzipover","capovereye"},
    {"capzipup","caprimup"},
    {"beretred","beret"},
    {"beretblk","beret"},
    {"capblk","cap"},
    {"capblkback","capback"},
    {"capblkside","capside"},
    {"capblkover","capovereye"},
    {"capblkup","caprimup"},
    {"trilbydrk","trilby"},
    {"trilbylght","trilby"},
    {"bowler","bowler"},
    {"bowlerred","bowler"},
    {"bowlerblue","bowler"},
    {"bowleryellow","bowler"},
    {"boater","boater"},
    {"bowlergang","bowler"},
    {"boaterblk","boater"},
}



function loadPlayerData(plr)
	local result=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", getElementData(plr,"player:uid"))
	if result and #result > 0 then
		local v=result[1]
		setPlayerMoney(plr,v.money)
		setElementModel(plr,v.skin)
		setElementData(plr,"status","Aktywny")
		setElementData(plr,"player:logged",true)
		setElementData(plr,"mahud",true)
		setElementData(plr,"player:mandate",v.mandate)
		setElementData(plr,"player:license:pjA",v.pjA)
		setElementData(plr,"player:license:pjB",v.pjB)
		setElementData(plr,"player:license:pjC",v.pjC)
		setElementData(plr,"player:license:pjL",v.pjL)
		setElementData(plr,"player:teoria:pjA",v.teoriaA)
		setElementData(plr,"player:teoria:pjB",v.teoriaB)
		setElementData(plr,"player:teoria:pjC",v.teoriaC)
		setElementData(plr,"player:teoria:pjL",v.teoriaL)
		setElementData(plr,"player:lvl",v.level)
		setElementData(plr,"player:exp",v.exp)
		setElementData(plr,"player:strzelec",v.strzelec)
		setElementData(plr,"player:plantacjakg",v.gornikkg)
		setElementData(plr,"player:sweeperykg",v.sweeperykg)
		setElementData(plr,"player:bewu",v.bw)
		exports["crime_voice"]:setPlayerChannel (plr,1)
		setPedFightingStyle(plr,v.stylwalki)

		if v.org == "" then v.org = false end
		setElementData(plr,"player:organization",v.org)
		setElementData(plr,"player:organization_level",v.orgrank)

		itemy = {}

		setElementData(plr,"player:ekwipunek",itemy)
		
		local resultcyce=exports["crime_database"]:dbGet("SELECT * FROM crime_equipment WHERE uid=?", getElementData(plr,"player:uid"))
		if #resultcyce > 0 then
			local takiecos = 0
			for i,vcyce in pairs(resultcyce) do
				takiecos = takiecos+1
				if vcyce["przedmiot"] == "ziolo" then waga = 1 end 
				if vcyce["przedmiot"] == "kokaina" then waga = 1 end 
				if vcyce["przedmiot"] == "amunicja" then waga = 10 end 
				if vcyce["przedmiot"] == "rakietnica" then waga = 8000 end
				if vcyce["przedmiot"] == "ak47" then waga = 3420 end
				if vcyce["przedmiot"] == "m4" then waga = 3000 end
				if vcyce["przedmiot"] == "tec" then waga = 2000 end
				if vcyce["przedmiot"] == "pila" then waga = 3000 end
				if vcyce["przedmiot"] == "deagle" then waga = 1700 end
				if vcyce["przedmiot"] == "uzi" then waga = 2200 end
				if vcyce["przedmiot"] == "mp5" then waga = 2600 end
				if vcyce["przedmiot"] == "kastet" then waga = 600 end
				if vcyce["przedmiot"] == "palka" then waga = 500 end
				if vcyce["przedmiot"] == "snajperka" then waga = 5000 end
				if vcyce["przedmiot"] == "gasnica" then waga = 2000 end
				if vcyce["przedmiot"] == "spadochron" then waga = 500 end
				if vcyce["przedmiot"] == "cola" then waga = 500 end
				if vcyce["przedmiot"] == "woda" then waga = 300 end
				if vcyce["przedmiot"] == "kajdanki" then waga = 1000 end
				if vcyce["przedmiot"] == "kebab" then waga = 500 end
				if vcyce["przedmiot"] == "hamburger" then waga = 300 end
				if vcyce["przedmiot"] == "paralizator" then waga = 1300 end 
				if vcyce["przedmiot"] == "maska1" then waga = 500 end 
				if vcyce["przedmiot"] == "maska2" then waga = 500 end 
				if vcyce["przedmiot"] == "maska3" then waga = 500 end 
				if vcyce["przedmiot"] == "maska4" then waga = 500 end 

				if vcyce["przedmiot"] == "kanister" then waga = 5000 end
				if vcyce["przedmiot"] == "zestaw" then waga = 3000 end
				if vcyce["przedmiot"] == "zestawdwa" then waga = 5000 end

				if vcyce["przedmiot"] == "wedka" then waga = 500 end
				if vcyce["przedmiot"] == "wedka2" then waga = 600 end
				if vcyce["przedmiot"] == "wedka3" then waga = 700 end
				if vcyce["przedmiot"] == "karas" then waga = 200 end
				if vcyce["przedmiot"] == "leszcz" then waga = 200 end
				if vcyce["przedmiot"] == "okon" then waga = 200 end
				if vcyce["przedmiot"] == "ploc" then waga = 200 end
				if vcyce["przedmiot"] == "pstrag" then waga = 200 end
				if vcyce["przedmiot"] == "sandacz" then waga = 200 end
				if vcyce["przedmiot"] == "sum" then waga = 200 end
				if vcyce["przedmiot"] == "karp" then waga = 200 end
				if vcyce["przedmiot"] == "lin" then waga = 200 end
				if vcyce["przedmiot"] == "amur" then waga = 200 end
				if vcyce["przedmiot"] == "wegorz" then waga = 200 end
				if vcyce["przedmiot"] == "fladra" then waga = 300 end
				if vcyce["przedmiot"] == "rekin" then waga = 1000 end
				if vcyce["przedmiot"] == "plecak" then waga = 500 end
				
				table.insert(itemy, {vcyce["przedmiot"], vcyce["ilosc"], waga, false, takiecos})
			end
			setElementData(plr,"player:ekwipunek",itemy)
		end

		setPedStat(plr,76,1000)
		setPedStat(plr,77,1000)
		setPedStat(plr,78,1000)

		local resultcycedwa=exports["crime_database"]:dbGet("SELECT * FROM crime_plantation WHERE uid=?", getElementData(plr,"player:uid"))
		if #resultcycedwa > 0 then
			setElementData(plr,"player:plantacja1",true)
		else
			setElementData(plr,"player:plantacja1",false)
		end



		--USTAWIENIAAAAAAAAAAAAAA
		if v.settingpmon == 1 then
			setElementData(plr,"pmoff",false)
		else
			setElementData(plr,"pmoff",true)
		end

		if v.settinginfohud == 0 then
			setElementData(plr,"wiecejinfo",false)
		else
			setElementData(plr,"wiecejinfo",true)
		end

		if v.settinghud == 1 then
			setElementData(plr,"hudoff",false)
		else
			setElementData(plr,"hudoff",true)
		end

		if v.settingradar == 1 then
			setElementData(plr,"radaroff",false)
		else
			setElementData(plr,"radaroff",true)
		end

		if v.settinglowpc == 0 then
			setElementData(plr,"lowpc",false)
			triggerClientEvent(plr, "dashboard:toggleRender", plr, 10,800 )
		else
			setElementData(plr,"lowpc",true)
			triggerClientEvent(plr, "dashboard:toggleRender", plr, 100,100 )
		end

		if v.settingvoicechat == 1 then
			setElementData(plr,"voiceon",false)
			triggerEvent("voicechanyl",plr, false)
		else
			setElementData(plr,"voiceon",true)
			triggerEvent("voicechanyl",plr, true)
		end

		if v.settingrender == 0 then
			setElementData(plr,"dalekirender",false)
			triggerClientEvent(plr, "dashboard:toggleRenderdwa", plr, 800 )
		else
			setElementData(plr,"dalekirender",true)
			triggerClientEvent(plr, "dashboard:toggleRenderdwa", plr, 5000 )
		end

		if v.settingkaro == 0 then
			setElementData(plr,"shaderkaroseria",false)
			triggerClientEvent(plr, "switchCarPaintReflect", root, false )
		else
			setElementData(plr,"shaderkaroseria",true)
			triggerClientEvent(plr, "switchCarPaintReflect", root, true )
		end

		if v.settingwater == 0 then
			setElementData(plr,"shaderwoda",false)
			triggerClientEvent(plr, "switchWaterRef", root, false )
			triggerClientEvent(plr, "switchWaterShine", root, false )
		else
			setElementData(plr,"shaderwoda",true)
			triggerClientEvent(plr, "switchWaterRef", root, true )
			triggerClientEvent(plr, "switchWaterShine", root, true )
		end

		if v.settingsky == 0 then
			setElementData(plr,"shaderniebo",false)
			triggerClientEvent(plr, "switchDynamicSky", root, false )
		else
			setElementData(plr,"shaderniebo",true)
			triggerClientEvent(plr, "switchDynamicSky", root, true )
		end

		if v.settingdetal == 0 then
			setElementData(plr,"shaderdetale",false)
			triggerClientEvent(plr, "onClientSwitchDetail", root, false )
		else
			setElementData(plr,"shaderdetale",true)
			triggerClientEvent(plr, "onClientSwitchDetail", root, true )
		end

		if v.settingblur == 0 then
			setElementData(plr,"shaderblur",false)
			triggerClientEvent(plr, "switchRadialBlur", root, false )
			triggerClientEvent(plr, "switchContrast", root, false )
		else
			setElementData(plr,"shaderblur",true)
			triggerClientEvent(plr, "switchRadialBlur", root, true )
			triggerClientEvent(plr, "switchContrast", root, true )
		end

		if v.settingnewradar == 0 then
			setElementData(plr,"player:changemap",false)
		else
			setElementData(plr,"player:changemap",true)
			triggerClientEvent(plr,"radar:changemap",plr)
		end

		if v.settingsounds == 1 then
			setElementData(plr,"player:engines",false)
			triggerClientEvent(plr, "dashboard:toggleEngines", plr, true )
		else
			setElementData(plr,"player:engines",true)
			--triggerClientEvent(plr,"player:engines",plr)
			triggerClientEvent(plr, "dashboard:toggleEngines", plr, false )
		end

		if v.settingnewhud == 0 then
			setElementData(plr,"newhud",false)
		else
			setElementData(plr,"newhud",true)
		end

		if v.settingnewspeed == 0 then
			setElementData(plr,"newspeed",false)
		else
			setElementData(plr,"newspeed",true)
		end

		if v.roleplay == 0 then
			setElementData(plr,"roleplay",false)
		else
			setElementData(plr,"roleplay",true)
		end

		local strefadm = getElementData(plr,"wstrefiedm") or 0 
		if strefadm == 1 then 
			toggleControl(plr,"fire", true )
			toggleControl(plr,"aim_weapon", true)
			toggleControl(plr,"vehicle_fire", true)
			toggleControl(plr,"vehicle_secondary_fire", true)
			toggleControl(plr,"action", true)
		else
			toggleControl(plr,"fire", false )
			toggleControl(plr,"aim_weapon", false)
			toggleControl(plr,"vehicle_fire", false)
			toggleControl(plr,"vehicle_secondary_fire", false)
			toggleControl(plr,"action", false)
		end
		if getElementData(plr,"player:admin") then toggleControl(plr,"aim_weapon", true) end

		setTimer(function()
			if v.ubrania == "" then v.ubrania = "1,0,13,12,-1,-1,-1,-1" end

		if v.skin == 0 then
			local ub = split(v.ubrania, ",")
			if ub[1] ~= -1 then
				liczba = -1
				for _,s in ipairs(koszulki)do
					liczba = liczba+1
					if tonumber(liczba) == tonumber(ub[1]) then
						addPedClothes(plr,s[1],s[2],0)
					end
				end
			end
			if ub[2] ~= -1 then
				liczba = -1
				for _,s in ipairs(fryzury)do
					liczba = liczba+1
					if tonumber(liczba) == tonumber(ub[2]) then
						addPedClothes(plr,s[1],s[2],1)
					end
				end
			end
			if ub[3] ~= -1 then
				liczba = -1
				for _,s in ipairs(spodnie)do
					liczba = liczba+1
					if tonumber(liczba) == tonumber(ub[3]) then
						addPedClothes(plr,s[1],s[2],2)
					end
				end
			end
			if ub[4] ~= -1 then
				liczba = -1
				for _,s in ipairs(buty)do
					liczba = liczba+1
					if tonumber(liczba) == tonumber(ub[4]) then
						addPedClothes(plr,s[1],s[2],3)
					end
				end
			end
			if ub[5] ~= -1 then
				liczba = -1
				for _,s in ipairs(naszyjniki)do
					liczba = liczba+1
					if tonumber(liczba) == tonumber(ub[5]) then
						addPedClothes(plr,s[1],s[2],13)
					end
				end
			end
			if ub[6] ~= -1 then
				liczba = -1
				for _,s in ipairs(zegarki)do
					liczba = liczba+1
					if tonumber(liczba) == tonumber(ub[6]) then
						addPedClothes(plr,s[1],s[2],14)
					end
				end
			end
			if ub[7] ~= -1 then
				liczba = -1
				for _,s in ipairs(twarz)do
					liczba = liczba+1
					if tonumber(liczba) == tonumber(ub[7]) then
						addPedClothes(plr,s[1],s[2],15)
					end
				end
			end
			if ub[8] ~= -1 then
				liczba = -1
				for _,s in ipairs(czapka)do
					liczba = liczba+1
					if tonumber(liczba) == tonumber(ub[8]) then
						addPedClothes(plr,s[1],s[2],16)
					end
				end
			end
		end

		setElementData(plr,"player:ciuchycj",v.ubrania)
		end, 1000, 1)
		
		fetchRemote (v.avatarlink, myCallback, "", false, plr )
		setElementData(plr,"avatarlink",v.avatarlink)
		
		setElementData(plr,"bitcoiny",v.bitcoiny)
		setElementData(plr,"ethereum",v.ethereum)
		setElementData(plr,"monero",v.monero)
		setElementData(plr,"x",v.x)
		setElementData(plr,"y",v.y)
		setElementData(plr,"z",v.z)

		setElementData(plr,"ppoints",v.ppoints)

		local nickxd = removeHex(getPlayerName(plr))
		if v.nick == "bialy" then hex = "#FFFFFF" end 
		if v.nick == "zolty" then hex = "#FFFF00" end
		if v.nick == "limonkowy" then hex = "#99FF00" end 
		if v.nick == "niebieski" then hex = "#00b7ff" end 
		if v.nick == "fioletowy" then hex = "#ab00ff" end 
		if v.nick == "zielony" then hex = "#00ff00" end 
		if v.nick == "czerwony" then hex = "#ff0000" end 
		if v.nick == "pomaranczowy" then hex = "#ffaa00" end 
		if v.nick == "szary" then hex = "#d6d6d6" end  
		setPlayerName(plr,nickxd)
		
		setElementData(plr,"odebral",v.odebral)
		
		setElementData(plr,"kolor",v.kolor)
		
		setElementData(plr,"player:reputation",v.reputation)
		setElementData(plr,"player:workinjob",v.worker)
		setElementData(plr,"player:registerdate",v.registered)
		setElementData(plr,"player:hours",v.hours)
		local uid = getElementData(plr,"player:uid")
		local uzyte=exports["crime_database"]:dbGet("SELECT * FROM crime_users WHERE id=?", uid)
		
		if uzyte[1].tec9 == 1 then
		giveWeapon( plr, 32, 9999 )
		setElementData(plr,"tec9",true)
		end
		if uzyte[1].deagle == 1 then
		giveWeapon( plr, 24, 9999 )
		setElementData(plr,"deagle",true)
		end
		if uzyte[1].rifle == 1 then
		giveWeapon( plr, 34, 9999 )
		setElementData(plr,"rifle",true)
		end
		if uzyte[1].mp5 == 1 then
		giveWeapon( plr, 29, 9999 )
		setElementData(plr,"mp5",true)
		end
		if uzyte[1].ak == 1 then
		giveWeapon( plr, 30, 9999 )
		setElementData(plr,"ak",true)
		end

		
		local queryA=string.format("SELECT * FROM crime_users WHERE id=%d AND premiumdate>NOW() LIMIT 1", getElementData(plr,"player:uid"))
		local resultA=exports["crime_database"]:pobierzWyniki(queryA)
		if (resultA) then
			setElementData(plr,"player:premium",true)
			setElementData(plr,"player:premiumdate",v.premiumdate)
			setPlayerName(plr,"#E6CF00"..getPlayerName(plr))
		else
			setElementData(plr,"player:premium",false)
			setElementData(plr,"player:premiumdate",false)
		end
		

		if hex == "#FFFFFF" and getElementData(plr,"player:premium") == true then 
			setPlayerName(plr,"#FFFFFF"..removeHex(getPlayerName(plr)))
			setElementData(plr,"player:hex","#FFFFFF")
		else
			setPlayerName(plr,""..hex..""..removeHex(getPlayerName(plr)))
			setElementData(plr,"player:hex",hex)
		end
	
		if getElementData(plr,"player:bewu") == 1 then 
			killPed(plr)
			setElementData(plr,"player:bewu",false)
			local x,y,z = getElementPosition(plr)
			setElementData(plr,"testpos",{x,y,z})
			setElementData(plr,"player:spawn",{x,y,z})
		end
		
		triggerClientEvent(plr, "dajmitenawatarxd", root)
		--print 'test'
		
		setElementData(plr,"player:skin",v.skin)

		return true
	end
	return false
end
       
addEvent("load:player",true)
addEventHandler("load:player", root, function(player)
if isElement(player) and player then
if getElementType(player) ~= "player" then return end
loadPlayerData(player)
outputDebugString("Wczytano "..getPlayerName(player))
end
end)

function savePlayerDataa(plr)
	if not getElementData(plr,"player:logged") then return end
	local uid=getElementData(plr,"player:uid")
	if not uid then return end
	local money=getPlayerMoney(plr)
	local mandate=getElementData(plr,"player:mandate")
	local licensea=getElementData(plr,"player:license:pjA")
	local licenseb=getElementData(plr,"player:license:pjB")
	
	local avatar = getElementData(plr,"avatar") or ""
	local ppoints = getElementData(plr,"ppoints")

	local level = getElementData(plr,"player:lvl")
	local exp = getElementData(plr,"player:exp")

	local gornikkg = getElementData(plr,"player:plantacjakg")

	local sweeperykg = getElementData(plr,"player:sweeperykg")

	local strzelec = getElementData(plr,"player:strzelec")
	local stylwalki = getPedFightingStyle(plr)

	local itemy = getElementData(plr,"player:ekwipunek") or {}

	local usunto=exports["crime_database"]:dbGet("DELETE FROM crime_equipment WHERE uid=?", uid) -- usuwanie całego eq gracza
	for i,v in pairs(itemy) do 
		local zapiszto=exports["crime_database"]:dbSet("INSERT INTO crime_equipment (uid, przedmiot, ilosc) VALUES (?,?,?)", uid, itemy[i][1], itemy[i][2])
	end

	if getElementModel(plr) == 0 then
		local texture, model = getPedClothes (plr, 0)
		if texture and model then
			liczba = -1
			for _,s in ipairs(koszulki)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						koszulka = liczba
					end
				end
			end
		else 
			koszulka = -1
		end
		local texture, model = getPedClothes (plr, 1)
		if texture and model then
			liczba = -1
			for _,s in ipairs(fryzury)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						fryzura = liczba
					end
				end
			end
		else 
			fryzura = -1
		end
		local texture, model = getPedClothes (plr, 2)
		if texture and model then
			liczba = -1
			for _,s in ipairs(spodnie)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						spodenki = liczba
					end
				end
			end
		else 
			spodenki = -1
		end
		local texture, model = getPedClothes (plr, 3)
		if texture and model then
			liczba = -1
			for _,s in ipairs(buty)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						butki = liczba
					end
				end
			end
		else 
			butki = -1
		end
		local texture, model = getPedClothes (plr, 13)
		if texture and model then
			liczba = -1
			for _,s in ipairs(naszyjniki)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						naszyjnik = liczba
					end
				end
			end
		else 
			naszyjnik = -1
		end
		local texture, model = getPedClothes (plr, 14)
		if texture and model then
			liczba = -1
			for _,s in ipairs(zegarki)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						zegarek = liczba
					end
				end
			end
		else 
			zegarek = -1
		end
		local texture, model = getPedClothes (plr, 15)
		if texture and model then
			liczba = -1
			for _,s in ipairs(twarz)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						oksy = liczba
					end
				end
			end
		else 
			oksy = -1
		end
		local texture, model = getPedClothes (plr, 16)
		if texture and model then
			liczba = -1
			for _,s in ipairs(czapka)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						czapeczka= liczba
					end
				end
			end
		else 
			czapeczka = -1
		end
	end

	ubrania = {}
	ubrania[1] = koszulka
	ubrania[2] = fryzura
	ubrania[3] = spodenki
	ubrania[4] = butki
	ubrania[5] = naszyjnik
	ubrania[6] = zegarek
	ubrania[7] = oksy
	ubrania[8] = czapeczka
	
	local avatarlink = getElementData(plr,"avatarlink") or ""
	
	local bitcoiny=getElementData(plr,"bitcoiny")
	local ethereum=getElementData(plr,"ethereum")
	local monero=getElementData(plr,"monero")
	
	local odebral=getElementData(plr,"odebral")
	
	local kolor=getElementData(plr,"kolor")
	
	local licensec=getElementData(plr,"player:license:pjC")
	local licensel=getElementData(plr,"player:license:pjL")

	local teoriaa = getElementData(plr,"player:teoria:pjA")
	local teoriab = getElementData(plr,"player:teoria:pjB")
	local teoriac = getElementData(plr,"player:teoria:pjC")
	local teorial = getElementData(plr,"player:teoria:pjL")

	local reputation=getElementData(plr,"player:reputation")
	local worker =getElementData(plr,"player:workinjob")
        local x,y,z=getElementPosition(plr)
	local hours= tonumber(getElementData(plr,"player:hours")) or 0
	local query=exports["crime_database"]:dbSet("UPDATE crime_users SET money=?, reputation=?, ppoints=?, mandate=?, pjA=?, pjB=?, pjC=?, pjL=?, teoriaA=?, teoriaB=?, teoriaC=?, teoriaL=?, worker=?, hours=?, bitcoiny=?, ethereum=?, monero=?, odebral=?, kolor=?, x=?, y=?, z=?, avatar=?, avatarlink=?, level=?, exp=?, strzelec=?, stylwalki=?, gornikkg=?, sweeperykg=? WHERE id=?",
	money, reputation, ppoints, mandate, licensea, licenseb, licensec, licensel, teoriaa, teoriab, teoriac, teorial, worker, hours, bitcoiny, ethereum, monero, odebral, kolor, x, y, z, avatar, avatarlink, level, exp, strzelec, stylwalki, gornikkg, sweeperykg, uid)
	if (type(ubrania) == "table") then
		local rr = string.format("%s", table.concat(ubrania, ',') )
		local query2 = exports["crime_database"]:dbSet("UPDATE crime_users SET ubrania=? WHERE id=?", rr, uid)
	end
end
addEvent("save:player",true)
addEventHandler("save:player", root, function(player)
if isElement(player) and player then
if getElementType(player) ~= "player" then return end
savePlayerDataa(player)
outputDebugString("Zapisano "..getPlayerName(player))
end
end)

function savePlayerData(plr)
	if not getElementData(plr,"player:logged") then return end
	local uid=getElementData(plr,"player:uid")
	if not uid then return end
	local money=getPlayerMoney(plr)
	local mandate=getElementData(plr,"player:mandate")
	local licensea=getElementData(plr,"player:license:pjA")
	local licenseb=getElementData(plr,"player:license:pjB")
	
	local avatar = getElementData(plr,"avatar")
	local avatarlink = getElementData(plr,"avatarlink")

	local ppoints = getElementData(plr,"ppoints")
	local gornikkg = getElementData(plr,"player:plantacjakg")
	
	local sweeperykg = getElementData(plr,"player:sweeperykg")

	local level = getElementData(plr,"player:lvl")
	local exp = getElementData(plr,"player:exp")

	local itemy = getElementData(plr,"player:ekwipunek")

	local usunto=exports["crime_database"]:dbGet("DELETE FROM crime_equipment WHERE uid=?", uid) -- usuwanie całego eq gracza
	for i,v in pairs(itemy) do 
		local zapiszto=exports["crime_database"]:dbSet("INSERT INTO crime_equipment (uid, przedmiot, ilosc) VALUES (?,?,?)", uid, itemy[i][1], itemy[i][2])
	end

	local strzelec = getElementData(plr,"player:strzelec")
	local stylwalki = getPedFightingStyle(plr)

		local texture, model = getPedClothes (plr, 0)
		if texture and model then
			liczba = -1
			for _,s in ipairs(koszulki)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						koszulka = liczba
					end
				end
			end
		else 
			koszulka = -1
		end
		local texture, model = getPedClothes (plr, 1)
		if texture and model then
			liczba = -1
			for _,s in ipairs(fryzury)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						fryzura = liczba
					end
				end
			end
		else 
			fryzura = -1
		end
		local texture, model = getPedClothes (plr, 2)
		if texture and model then
			liczba = -1
			for _,s in ipairs(spodnie)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						spodenki = liczba
					end
				end
			end
		else 
			spodenki = -1
		end
		local texture, model = getPedClothes (plr, 3)
		if texture and model then
			liczba = -1
			for _,s in ipairs(buty)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						butki = liczba
					end
				end
			end
		else 
			butki = -1
		end
		local texture, model = getPedClothes (plr, 13)
		if texture and model then
			liczba = -1
			for _,s in ipairs(naszyjniki)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						naszyjnik = liczba
					end
				end
			end
		else 
			naszyjnik = -1
		end
		local texture, model = getPedClothes (plr, 14)
		if texture and model then
			liczba = -1
			for _,s in ipairs(zegarki)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						zegarek = liczba
					end
				end
			end
		else 
			zegarek = -1
		end
		local texture, model = getPedClothes (plr, 15)
		if texture and model then
			liczba = -1
			for _,s in ipairs(twarz)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						oksy = liczba
					end
				end
			end
		else 
			oksy = -1
		end
		local texture, model = getPedClothes (plr, 16)
		if texture and model then
			liczba = -1
			for _,s in ipairs(czapka)do
				liczba = liczba+1
				if s[1] == texture then 
					if s[2] == model then 
						czapeczka= liczba
					end
				end
			end
		else 
			czapeczka = -1
		end
		ubrania = {}
		ubrania[1] = koszulka
		ubrania[2] = fryzura
		ubrania[3] = spodenki
		ubrania[4] = butki
		ubrania[5] = naszyjnik
		ubrania[6] = zegarek
		ubrania[7] = oksy
		ubrania[8] = czapeczka

	
	local bitcoiny=getElementData(plr,"bitcoiny")
	local ethereum=getElementData(plr,"ethereum")
	local monero=getElementData(plr,"monero")
	
		local odebral=getElementData(plr,"odebral")
		
			local kolor=getElementData(plr,"kolor")
	
	local licensec=getElementData(plr,"player:license:pjC")
	local licensel=getElementData(plr,"player:license:pjL")

	local teoriaa = getElementData(plr,"player:teoria:pjA")
	local teoriab = getElementData(plr,"player:teoria:pjB")
	local teoriac = getElementData(plr,"player:teoria:pjC")
	local teorial = getElementData(plr,"player:teoria:pjL")

	if isPedDead(plr) == true then 
		bewu = 1
	else
		bewu = 0 
	end
	if getElementData(plr,"bewu") == 1 then bewu = 1 end

	local reputation=getElementData(plr,"player:reputation")
	local worker =getElementData(plr,"player:workinjob")
        local x,y,z=getElementPosition(plr)
	local hours= tonumber(getElementData(plr,"player:hours")) or 0
	local query=exports["crime_database"]:dbSet("UPDATE crime_users SET money=?, reputation=?, ppoints=?, mandate=?, bw=?, pjA=?, pjB=?, pjC=?, pjL=?, teoriaA=?, teoriaB=?, teoriaC=?, teoriaL=?, worker=?, hours=?, bitcoiny=?, ethereum=?, monero=?, odebral=?, kolor=?, x=?, y=?, z=?, avatar=?, avatarlink=?, strzelec=?, stylwalki=?, gornikkg=?, sweeperykg=?, level=?, exp=? WHERE id=?",money, reputation, ppoints, mandate, bewu, licensea, licenseb, licensec, licensel, teoriaa, teoriab, teoriac, teorial, worker, hours, bitcoiny, ethereum, monero, odebral, kolor, x, y, z, avatar, avatarlink, strzelec, stylwalki, gornikkg, sweeperykg, level, exp, uid)
	if (type(ubrania) == "table") then
		local rr = string.format("%s", table.concat(ubrania, ',') )
		local query2 = exports["crime_database"]:dbSet("UPDATE crime_users SET ubrania=? WHERE id=?", rr, uid)
	end
end
addEventHandler("onPlayerQuit", root, function() savePlayerData(source) end)





addEventHandler("onPlayerWasted", root, 
    function() 
        local weapons = convertWeaponsToJSON(source) 
        setElementData(source,"tempWeapons",weapons) 
    end 
) 
  
addEventHandler("onPlayerSpawn", root, 
    function () 
        local weapons = getElementData(source,"tempWeapons") 
        if (weapons) then 
            giveWeaponsFromJSON(source, weapons) 
        end 
    end 
) 
  
function convertWeaponsToJSON(player) 
    local weaponSlots = 12 
    local weaponsTable = {} 
    for slot=1, weaponSlots do 
        local weapon = getPedWeapon( source, slot ) 
        local ammo = getPedTotalAmmo( source, slot ) 
        if (weapon > 0 and ammo > 0) then 
            weaponsTable[weapon] = ammo 
        end 
    end 
    return toJSON(weaponsTable) 
end 
  
function giveWeaponsFromJSON(player, weapons) 
    if (weapons and weapons ~= "") then 
        for weapon, ammo in pairs(fromJSON(weapons)) do 
            if (weapon and ammo) then 
                giveWeapon(player, tonumber(weapon), tonumber(ammo)) 
            end 
        end 
    end 
end


function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end

addEvent("core:newAv",true)
addEventHandler("core:newAv", root, function(player)
	local link = getElementData(player,"avatarlink")
	if link then 
		fetchRemote (link, myCallback, "", false, player )
	end
end)

function myCallback( responseData, error, playerToReceive )
    if error == 0 then
        triggerClientEvent( playerToReceive, "core:getAv", resourceRoot, responseData, playerToReceive )
    end
end