--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

--komenda, typ, nazwa
anims = {
    {"sex1", "sex", "sex_1_cum_p", -1, true, false},
    {"sex2","sex", "sex_1_cum_w", -1, true, false},
    {"rece", "ped", "handsup", -1, false, false},
    {"taichi", "PARK", "Tai_Chi_Loop", -1, true, false},
    {"predator", "BSKTBALL", "BBALL_def_loop", -1, true, false},
    {"podkrecasz", "BAR", "Barserve_glass", -1, false, false},
    {"podsluchujesz", "BAR", "Barserve_order", -1, false, false},
    {"wedkarz", "SWORD", "sword_block", -1, false, false},
    {"pijesz", "BAR", "dnk_stndM_loop", -1, true, false},
    {"taniec", "CHAINSAW", "CSAW_Hit_2", -1, true, true},
    {"taniec2", "SKATE", "skate_idle", -1, true, false},
    {"taniec3", "STRIP", "strip_B", -1, true, false},
    {"taniec4", "DANCING", "dance_loop", -1, true, false},
    {"taniec5", "DANCING", "DAN_Down_A", -1, true, false},
    {"taniec6", "STRIP", "strip_G", -1, true, false},
    {"taniec7", "STRIP", "STR_C2", -1, true, false},
    {"taniec8", "DANCING", "dnce_M_b", -1, true, false},
    {"taniec9", "DANCING", "DAN_Loop_A", -1, true, false},
    {"taniec10", "DANCING", "dnce_M_d", -1, true, false},
    {"taniec11", "STRIP", "strip_D", -1, true, false},
    {"taniec12", "STRIP", "strip_E", -1, true, false},
    {"taniec13", "STRIP", "STR_Loop_A", -1, true, false},
    {"taniec14", "STRIP", "STR_Loop_B", -1, true, false},
    {"taniec15", "FINALE", "FIN_Cop1_Stomp", -1, true, false},
    {"taniec16", "DANCING", "dnce_M_a", -1, true, false},
    {"taniec17", "GFUNK", "Dance_G10", -1, true, false},
    {"taniec18", "GFUNK", "Dance_G11", -1, true, false},
    {"taniec19", "GFUNK", "Dance_G12", -1, true, false},
    {"taniec20", "RUNNINGMAN", "Dance_B1", -1, true, false},
    {"palisz", "LOWRIDER", "M_smklean_loop", -1, true, false},
    {"lezysz", "BEACH", "Lay_Bac_Loop", -1, true, false},
    {"lezysz2", "CRACK", "crckidle2", -1, true, false},
    {"lezysz3", "CRACK", "crckidle4", -1, true, false},
    {"lezysz4", "BEACH", "ParkSit_W_loop", -1, false, false},
    {"lezysz5", "BEACH", "SitnWait_loop_W", -1, true, false},
    {"siedzisz", "BEACH", "ParkSit_M_loop", -1, true, false},
    {"siedzisz2", "INT_OFFICE", "OFF_Sit_Idle_Loop", -1, true, false},
    {"siedzisz3", "JST_BUISNESS", "girl_02", -1, false, false},
    {"klekasz", "CAMERA", "camstnd_to_camcrch", -1, false, false},
    {"klekasz2", "COP_AMBIENT", "Copbrowse_nod", -1, true, false},
    {"czekasz", "COP_AMBIENT", "Coplook_loop", -1, true, false},
    {"akrobata", "DAM_JUMP", "DAM_Dive_Loop", -1, false, false},
    {"msza", "DEALER", "DEALER_IDLE", -1, true, false},
    {"msza2", "GRAVEYARD", "mrnM_loop", -1, false, false},
    {"znakkrzyza", "GANGS", "hndshkcb", -1, true, false},
    {"rzygasz", "FOOD", "EAT_Vomit_P", -1, true, false},
    {"jesz", "FOOD", "EAT_Burger", -1, true, false},
    {"cpun1", "GANGS", "drnkbr_prtl", -1, true, false},
    {"cpun2", "GANGS", "smkcig_prtl", -1, true, false},
    {"cpun3", "CRACK", "Bbalbat_Idle_01", -1, true, false},
    {"cpun4", "CRACK", "Bbalbat_Idle_02", -1, true, false},
    {"witasz", "GANGS", "hndshkba", -1, true, false},
    {"rozmawiasz", "GANGS", "prtial_gngtlkH", -1, true, false},
    {"rozmawiasz2", "GANGS", "prtial_gngtlkG", -1, true, false},
    {"rozmawiasz3", "GANGS", "prtial_gngtlkD", -1, true, false},
    {"nerwowy", "GHANDS", "gsign2", -1, true, false},
    {"piszesz", "INT_OFFICE", "OFF_Sit_Type_Loop", -1, true, false},
    {"gay", "ped", "WOMAN_walksexy", -1, true, true},
    {"gay2", "ped", "WOMAN_walkpro", -1, true, true},
    {"gay3", "ped", "WOMAN_runsexy", -1, true, true},
    {"wreczasz", "KISSING", "gift_give", -1, false, false},
    {"machasz", "KISSING", "gfwave2", -1, true, false},
    {"walisz", "PAULNMAC", "wank_loop", -1, true, false},
    {"walisz2", "MISC", "Scratchballs_01", -1, true, false},
    {"sikasz", "PAULNMAC", "Piss_loop", -1, true, false},
    {"pijany", "ped", "WALK_drunk", -1, true, true},
    {"pijany2", "PAULNMAC", "PnM_Loop_A", -1, true, false},
    {"pijany3", "PAULNMAC", "PnM_Argue2_A", -1, true, false},
    {"rapujesz", "SCRATCHING", "scmid_l", -1, true, false},
    {"rapujesz2", "SCRATCHING", "scdldlp", -1, true, false},
    {"rapujesz3", "Flowers", "Flower_Hit", -1, true, false},
    {"rapujesz4", "RAPPING", "RAP_C_Loop", -1, true, false},
    {"rapujesz5", "RAPPING", "RAP_B_Loop", -1, true, false},
    {"rapujesz6", "SCRATCHING", "scdrdlp", -1, true, false},
    {"rapujesz7", "SCRATCHING", "scdrulp", -1, true, false},
    {"rapujesz8", "RAPPING", "RAP_A_Loop", -1, true, false},
    {"rolki", "SKATE", "skate_run", -1, true, true},
    {"rolki2", "SKATE", "skate_sprint", -1, true, true},
    {"umierasz", "ped", "FLOOR_hit_f", -1, false, false},
    {"umierasz2", "ped", "FLOOR_hit", -1, false, false},
    {"bijesz", "BASEBALL", "Bat_M", -1, true, false},
    {"bijesz2", "RIOT", "RIOT_PUNCHES", -1, true, false},
    {"bijesz3", "FIGHT_B", "FightB_M", -1, true, false},
    {"bijesz4", "MISC", "bitchslap", -1, true, false},
    {"bijesz5", "ped", "BIKE_elbowR", -1, true, false},
    {"wolasz", "RYDER", "RYD_Beckon_01", -1, true, false},
    {"wolasz2", "POLICE", "CopTraf_Come", -1, true, false},
    {"wolasz3", "RYDER", "RYD_Beckon_02", -1, true, false},
    {"zatrzymujesz", "POLICE", "CopTraf_Stop", -1, true, false},
    {"wskazujesz", "SHOP", "ROB_Loop", -1, true, false},
    {"rozgladasz", "ON_LOOKERS", "lkaround_loop", -1, true, false},
    {"krzyczysz", "ON_LOOKERS", "shout_in", -1, true, false},
    {"fuckyou", "RIOT", "RIOT_FUKU", -1, true, false},
    {"tchorz", "ped", "cower", -1, false, false},
    {"kopiesz", "GANGS", "shake_carK", -1, true, false},
    {"kopiesz2", "FIGHT_D", "FightD_G", -1, true, false},
    {"kopiesz3", "FIGHT_C", "FightC_3", -1, false},
    {"wywazasz", "GANGS", "shake_carSH", -1, true, false},
    {"wywazasz2", "POLICE", "Door_Kick", -1, true, false},
    {"kieszen", "GANGS", "leanIDLE", -1, true, false},
    {"celujesz", "ped", "ARRESTgun", -1, false, false},
    {"kichasz", "VENDING", "vend_eat1_P", -1, true, false},
    {"pocalunek", "BD_FIRE", "Grlfrd_Kiss_03", -1, true, false},
    {"taxi", "MISC", "Hiker_Pose", -1, false, false},
    {"taxi2", "MISC", "Hiker_Pose_L", -1, false, false},
    {"noga", "SHOP", "SHP_Jump_Glide", -1, false, false},
    {"pozegnanie", "BD_FIRE", "BD_Panic_03", -1, true, false},
    {"cud", "CARRY", "crry_prtial", -1, true, false},
    {"cud2", "ON_LOOKERS", "Pointup_loop", -1, false, false},
    {"delirium", "CRACK", "crckdeth1", -1, false},
    {"delirium2", "CRACK", "crckdeth2", -1, true, false},
    {"delirium3", "CRACK", "crckidle3", -1, true, false},
    {"delirium4", "CHAINSAW", "csaw_part", -1, true, false},
    {"delirium5", "CASINO", "Roulette_loop", -1, true, false},
    {"naprawiasz", "CAR", "flag_drop", -1, true, false},
    {"naprawiasz2", "CAR", "Fixn_Car_Loop", -1, true, false},
    {"placzesz", "GRAVEYARD", "mrnF_loop", -1, true, false},
    {"kibicujesz", "RIOT", "RIOT_ANGRY_B", -1, true, false},
    {"kibicujesz2", "ON_LOOKERS", "wave_loop", -1, true, false},
    {"bioenergoterapeuta", "WUZI", "Wuzi_Greet_Wuzi", -1, true, false},
    {"meteorolog", "WUZI", "Wuzi_grnd_chk", -1, true, false},
    {"klepiesz", "SWEET", "sweet_ass_slap", -1, true, false},
    {"cierpisz", "SWEET", "Sweet_injuredloop", -1, true, false},
    {"starzec", "ped", "WALK_shuffle", -1, true, true},
    {"starzec2", "ped", "WOMAN_walkfatold", -1, true, true},
    {"starzec3", "ped", "WOMAN_walkshop", -1, true, true},
    {"reanimujesz", "MEDIC", "CPR", -1, false, false},
    {"myjesz", "CASINO", "dealone", -1, true, false},
    {"zadowolony", "CASINO", "manwind", -1, true, false},
    {"zadowolony2", "CASINO", "manwinb", -1, true, false},
    {"zalamany", "CASINO", "Roulette_lose", -1, true, false},
    {"zmeczony", "FAT", "IDLE_tired", -1, true, false},
    {"ochnie", "MISC", "plyr_shkhead", -1, true, false},
    {"cwaniak1", "GHANDS", "gsign1", -1, true, false},
    {"cwaniak2", "GHANDS", "gsign1LH", -1, true, false},
    {"cwaniak3", "GHANDS", "gsign2", -1, true, false},
    {"cwaniak4", "GHANDS", "gsign2LH", -1, true, false},
    {"cwaniak5", "GHANDS", "gsign3", -1, true, false},
    {"cwaniak6", "GHANDS", "gsign3LH", -1, true, false},
    {"cwaniak7", "GHANDS", "gsign4", -1, true, false},
    {"cwaniak8", "GHANDS", "gsign4LH", -1, true, false},
    {"cwaniak9", "GHANDS", "gsign5", -1, true, false},
    {"cwaniak10", "GHANDS", "gsign5LH", -1, true, false},
    {"pijak", "CRACK", "crckidle4", -1, true, false},
}

local sx, sy = guiGetScreenSize()
zmienna = 1920/sx
onoff = false

local dxfont0_FiraEC = dxCreateFont(":crime_files/fonts/FiraEC.ttf", 18/zmienna)

local naekranie = 22
naekranie = naekranie-1
local obecnie = 1

function gui()
    local ticki = getTickCount()
    if progressdwa == "wlacza" then
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(0,0,0,200,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(0,0,0,255,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 200 end 
        if alp2 then alp2test = alp2 else alp2 = 255 end
    else 
        local Progress = (ticki-tickistart)/czas
        local alp = interpolateBetween(200,0,0,0,0,0,Progress,"Linear")
        local alp2 = interpolateBetween(255,0,0,0,0,0,Progress,"Linear")
        if alp then alptest = alp else alp = 0 end 
        if alp2 then alp2test = alp2 else alp2 = 0 end
    end
    if onoff == true then
        exports["crime_gui"]:guitext("#ccccccAby aktywować animację wpisz #5a3795komendę#cccccc lub kliknij #5a3795E\n#ccccccAby wyłączyć kliknij #5a3795ENTER",1671/zmienna, (185+696-29)/zmienna, 1900/zmienna, (214+696-29)/zmienna , 255, 255, 255, alp2test, dxfont0_FiraEC, "right", "center")
        local liczmnie = 0
        for ID2=obecnie,naekranie+obecnie do
            liczmnie = liczmnie+1
            local space = 29*(liczmnie-1)
            if not anims[ID2] then return end
            if liczmnie == 1 then 
                exports["crime_gui"]:guitext("/"..anims[ID2][1],1671/zmienna, (185+space)/zmienna, 1900/zmienna, (214+space)/zmienna , 90, 55, 150, alp2test, dxfont0_FiraEC, "right", "center")
            else 
                exports["crime_gui"]:guitext("/"..anims[ID2][1],1671/zmienna, (185+space)/zmienna, 1900/zmienna, (214+space)/zmienna , 200, 200, 200, alp2test, dxfont0_FiraEC, "right", "center")
            end
        end
    end
end


function onofftest()
    if onoff == true then 
        tickistart = getTickCount()
		czas = 500
        progressdwa = "wylacza"
		setTimer(function()
            if isEventHandlerAdded("onClientRender", root, gui) then
				removeEventHandler ("onClientRender", root, gui)
                onoff = false 
                toggleControl("next_weapon", true) 
                toggleControl("previous_weapon", true) 
			end
		end, 500, 1)
    else
        if not getElementData(localPlayer,"player:logged") then return end
        onoff = true
        tickistart = getTickCount()
        czas = 500
        progressdwa = "wlacza"
        addEventHandler("onClientRender",root,gui)
        toggleControl("next_weapon", false) 
        toggleControl("previous_weapon", false) 
    end
end

bindKey("F4","down",onofftest)

function turnanim()
    if onoff == true then 
        triggerServerEvent("anims:startanim", localPlayer, anims[obecnie][2], anims[obecnie][3])
    end
end
bindKey("e","down",turnanim)

function dogory() 
    if onoff ~= true then return end 
    if obecnie == 1 then return end
    obecnie = obecnie-1
end

function dodolu()
	if onoff ~= true then return end 
    if obecnie+1 > table.maxn(anims) then return end
    obecnie = obecnie+1
end
bindKey ("mouse_wheel_up", "down", dogory )
bindKey ("mouse_wheel_down", "down", dodolu )


function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end

	return false
end

--[[
function movew() 
    if getPedAnimation(localPlayer) then 
        local anim1, anim2 = getPedAnimation(localPlayer)
        local x,y,z = getElementPosition(localPlayer)
        local test = getElementData(localPlayer,"player:posanim")
        if getDistanceBetweenPoints3D (x,y,z, test[1], test[2], test[3]) >= 1.11 then return end
        setElementPosition(localPlayer,x,y+0.1,z)
        triggerServerEvent("anims:startanim2", localPlayer, anim1, anim2)
    end
end
bindKey ("arrow_u", "down", movew )
function moves() 
    if getPedAnimation(localPlayer) then 
        local anim1, anim2 = getPedAnimation(localPlayer)
        local x,y,z = getElementPosition(localPlayer)
        local test = getElementData(localPlayer,"player:posanim")
        if getDistanceBetweenPoints3D (x,y,z, test[1], test[2], test[3]) >= 1.11 then return end
        setElementPosition(localPlayer,x,y-0.1,z)
        triggerServerEvent("anims:startanim2", localPlayer, anim1, anim2)
    end
end
bindKey ("arrow_d", "down", moves )
function movea() 
    if getPedAnimation(localPlayer) then 
        local anim1, anim2 = getPedAnimation(localPlayer)
        local x,y,z = getElementPosition(localPlayer)
        local test = getElementData(localPlayer,"player:posanim")
        if getDistanceBetweenPoints3D (x,y,z, test[1], test[2], test[3]) >= 1.11 then return end
        setElementPosition(localPlayer,x+0.1,y,z)
        triggerServerEvent("anims:startanim2", localPlayer, anim1, anim2)
    end
end
bindKey ("arrow_r", "down", movea )
function moved() 
    if getPedAnimation(localPlayer) then 
        local anim1, anim2 = getPedAnimation(localPlayer)
        local x,y,z = getElementPosition(localPlayer)
        local test = getElementData(localPlayer,"player:posanim")
        if getDistanceBetweenPoints3D (x,y,z, test[1], test[2], test[3]) >= 1.11 then return end
        setElementPosition(localPlayer,x-0.1,y,z)
        triggerServerEvent("anims:startanim2", localPlayer, anim1, anim2)
    end
end
bindKey ("arrow_l", "down", moved )]]--