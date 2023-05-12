--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local sx,sy=guiGetScreenSize()
local font1=dxCreateFont(":crime_files/fonts/FiraEC.ttf",25)
local font2=dxCreateFont(":crime_files/fonts/FiraEC.ttf",18)

triggerServerEvent("ev",resourceRoot)

for i,v in ipairs(tbl) do
	v.obj=createObject(2691,v.poz[1],v.poz[2],v.poz[3],v.poz[4],v.poz[5],v.poz[6])
	
	if v.int then
		setElementInterior(v.obj,v.int)
	end
	if v.dim then
		setElementDimension(v.obj,v.dim)
	end
	v.rt=dxCreateRenderTarget(512,512,false)
end

godziny = {}
repka = {}
topone = {}
topall = {}

addEvent("evc",true)
addEventHandler("evc",resourceRoot,
	function(ev,arg1,arg2)
		if (ev=="addtxt") then
			local tabela_z_danymi=arg1
			local praca=arg2
			local txt = ""
			local nazwa= ""
			for i,v in ipairs(tabela_z_danymi) do
				local rt=nil
				for k,value in ipairs(tbl) do
					if (v.index==k) then
						rt=value.rt
					end
				end			
					if v.typ == "TopCzas" then
						txt = ""
						tytul="Top 10 przegranego czasu"
						dane = v.dane
						godziny.table = {}
						for _, v in pairs (dane) do
							table.insert(godziny.table, string.format((#godziny.table+1)..'. '..v.login..' - '..v.hours..' minut'))
						end
						godziny.table[1] = "#F79C00۩ "..godziny.table[1]..""
						if godziny.table[2] then godziny.table[2] = "#6E6E6E۩ "..godziny.table[2].."" end 
						if godziny.table[3] then godziny.table[3] = "#B82200۩ "..godziny.table[3].."" end 
						if godziny.table[4] then godziny.table[4] = "#FFFFFF"..godziny.table[4].."" end 
						txt =txt..''..table.concat(godziny.table, '\n')
					elseif v.typ == "TopRep" then
						txt = ""
						tytul="Top 10 leveli"
						dane = v.dane
						repka.table = {}
						for _, v in pairs (dane) do
							table.insert(repka.table, string.format((#repka.table+1)..'. '..v.login..' - '..v.level..' Lvl'))
						end
						repka.table[1] = "#F79C00۩ "..repka.table[1]..""
						if repka.table[2] then repka.table[2] = "#6E6E6E۩ "..repka.table[2].."" end 
						if repka.table[3] then repka.table[3] = "#B82200۩ "..repka.table[3].."" end 
						if repka.table[4] then repka.table[4] = "#FFFFFF"..repka.table[4].."" end 
						txt =txt..''..table.concat(repka.table, '\n')
					elseif v.typ == "TopDonate" then
						txt = ""
						tytul="Top 10 donatorów"
						dane = v.dane
						topone.table = {}
						for _, v in pairs (dane) do
							table.insert(topone.table, string.format((#topone.table+1)..'. '..v.nick..' - '..v.points..' zł'))
						end
						topone.table[1] = "#F79C00۩ "..topone.table[1]..""
						if topone.table[2] then topone.table[2] = "#6E6E6E۩ "..topone.table[2].."" end 
						if topone.table[3] then topone.table[3] = "#B82200۩ "..topone.table[3].."" end 
						if topone.table[4] then topone.table[4] = "#FFFFFF"..topone.table[4].."" end 
						txt =txt..''..table.concat(topone.table, '\n')
					elseif v.typ == "TopAll" then
						txt = ""
						tytul="Top 10 driftu"
						dane = v.dane
						topall.table = {}
						for _, v in pairs (dane) do
							table.insert(topall.table, string.format((#topall.table+1)..'. '..v.nick..' - '..v.points..' pkt'))
						end
						topall.table[1] = "#F79C00۩ "..topall.table[1]..""
						if topall.table[2] then topall.table[2] = "#6E6E6E۩ "..topall.table[2].."" end 
						if topall.table[3] then topall.table[3] = "#B82200۩ "..topall.table[3].."" end 
						if topall.table[4] then topall.table[4] = "#FFFFFF"..topall.table[4].."" end 
						txt =txt..''..table.concat(topall.table, '\n')
					end

				dxSetRenderTarget(rt,true)
					dxDrawImage(0,0,512,560,"tlo.png",0,0,0,tocolor(255,255,255,255),false,false)
					dxDrawImage(85,10,340,100,"logo.png",0,0,0,tocolor(255,255,255,255),false,false)
				dxDrawText(tytul:gsub("#%x%x%x%x%x%x",""),512+1,110+1,0,0,tocolor(200, 200, 200,255),1,font1,"center","top",false,false,false,false,false,0,0,0)
				dxDrawText(tytul,512,110,0,0,tocolor(90, 55, 150,255),1,font1,"left","top",false,false,false,false,false,0,0,0)

				dxDrawText(txt:gsub("#%x%x%x%x%x%x",""),512+1,180+1,0,0,tocolor(0,0,0,255),1,font2,"center","top",false,false,false,true,false,0,0,0)
				dxDrawText(txt,512,180,0,0,tocolor(90, 55, 150,255),1,font2,"center","top",false,false,false,true,false,0,0,0)

				dxSetRenderTarget()
				
				if v.shd then
					destroyElement(v.shd)
					v.shd=nil
				end
				v.shd=dxCreateShader("replace.fx",0,0,false,"object")
				dxSetShaderValue(v.shd, "CUSTOMTEX0", rt)
				local obj=nil
				for k,value in ipairs(tbl) do
					if (v.index==k) then
						obj=value.obj
					end
				end
				engineApplyShaderToWorldTexture(v.shd, "base5_2", obj)
			end
		end
	end
)