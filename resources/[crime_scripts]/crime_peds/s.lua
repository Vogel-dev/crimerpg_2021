--[[
	
	@ Author: Vercetti 
	@ right: Vercetti for CrimeRPG ©2020
	
	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

	]]--
	-- CA43FF - me
	-- 8a97ba - do
	-- 40E0D0 - sojusznik
	-- 9FC693 - neutralny
	-- FF0000 - negatywny

	local peds = {
		--randoms
		{32,1007.95, -1333.85, 13.38, 100,'Parkingowy Steve',0,{"ON_LOOKERS", "lkaround_loop"},'',0},
		{162,1950.69, -1762.83, 13.55,60,'George Winston',0,{"ON_LOOKERS", "lkaround_loop"},'',0},
		{239, 2288.1423339844,-1718.1940917969,12.89687538147,180.5885925293,'Harrison Reed\n#9FC693*mówi* Dobry, po proszę paczkę Winstonów niebieskich i setkę jakąś najtańszą.',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		{277, 2287.70, -1719.82, 12.90, 0,'Kate Hill\n#9FC693*mówi* Mogę być winna grosika?',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		{78, 2345.5158691406,-1919.2954101563,13.55255317688,64.822235107422,'Złomiarz Bob\n#40E0D0*mówi* Ten chujec Bill znowu się naćpał.',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		{79, 2354.6994628906,-1902.9621582031,13.537665367126,176.32301330566,'Złomiarz Billy\n#40E0D0*mówi* Przez heroinę zostałem bezdomnym.\nTen złom tutaj to jedyne co mi zostało.',0,{"CRACK", "crckidle2"},'',0},
		{296,988.00, -1357.25, 13.56,262.359,'Huge Jason\n#CA43FF*Odpala tłustego jak sam Jason Jointa po czym łapie bucha*',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{291,976.08, -1292.06, 13.55,262.359,'Stoned Keith\n#9FC693*mówi* Zważaj czym dilujesz Joe, jak mi opierdolisz jakiś\nmajeranek to przyjdę po ciebie z czarnuchami z Idlewood.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{286,977.54, -1292.23, 13.55,90.359,'Skinny Joe\n#9FC693*mówi* Czarnuchu, mam najlepszy towar w okolicy, luzuj pory.',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		{268, 958.154296875,-1335.7689208984,13.53475856781,342.22747802734,'Adrian Morales\n#9FC693*mówi* A niech mnie chuj strzeli! Ten palant wyjebał mi zęba i w dodatku cała gęba mnie ostro napierdala.\nNiech go tylko dorwę to mu nogi z dupy powyrywam.',0,{"SWEET", "Sweet_injuredloop"},'',0},
		{305, 2129.5268554688,-1151.1544189453,24.04990196228,6.3328967094421,'Franklin Camelot\n#40E0D0*mówi* Witam i zapraszam do kupna!',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{288, 1783.4764404297,-1698.5615234375,13.54843711853,175.63877868652,'Mark Polo\n#40E0D0*mówi* Najbardziej luksusowe auta tylko u nas!',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{306, 1778.5329589844,-1705.6606445313,13.54843711853,177.07667541504,'Dominic Walter\n#40E0D0*mówi* W czym mogę pomóc?',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{302, 478.72708129883,-1539.2188720703,-37.103126525879,117.32403564453,'Victor Petrow\n#40E0D0*mówi* Najlepsze łachy w całym mieście tylko u nas!',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{303, 1422.4526367188,-1758.9692382813,13.546875,137.08882141113,'Pijany Bezdomny\n#40E0D0*mówi* Dorzuć pan 3 zł na browar.',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{221, 296.4404296875,-40.21639251709,1001.515625,358.45306396484,'Marec Bureš\n#40E0D0*mówi* Mówią na mnie Marec - spec od broni białej.',0,{"GANGS", "prtial_gngtlkH"},'',1},
		-- prawo jazdy	
		{237,1648.4521484375,-1547.6524658203,13.546875,271.20672607422,'John Blacksmith\n#9FC693*mówi* Pierdolony elegancik oblał mnie już 4 raz!\nPieprze to prawo jazdy, chuj do gęby egzaminatorowi.',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		{251,1639.2849121094,-1547.1400146484,13.6484375,89.855262756348,'Cristopher Lovato\n#9FC693*mówi* Kurwa, jestem tu już piąty raz, w sumie to mam w to wyjebane czy zdam.',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		{265,1647.4384765625,-1544.5128173828,13.6484375,90.458473205566,'Jim Hernandez\n#9FC693*mówi* Ale stres, chyba zaraz puszczę kleksa w gacie.',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		{295, 1643.1655273438,-1536.3665771484,13.638437271118,216.22785949707,'Egzaminator\n#40E0D0*mówi* Mam nadzieje, że jeździsz lepiej niż reszta tych patałachów.',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{295, 1640.2055664063,-1535.896484375,13.638437271118,123.4803237915,'Egzaminator\n#40E0D0*mówi* Siadaj i pisz.',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		--magazyn
		{247, 1893.4515380859,-1874.9682617188,13.524001121521,188.56661987305,'Rude Rick\n#40E0D0*mówi* Zakładaj te pieprzone rękawiczki, morda na kłódkę i do roboty\nNie mam czasu na gadkę z tobą.',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{267, 1892.0601806641,-1880.1538085938,13.476291656494,185.74659729004,'Big Condom\n#40E0D0*mówi* W budce za mną stoi Rick, on kieruje tym kurwidołkiem,\nidź zagadaj do niego a nie mi trujesz dupę kondomie.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{282, 1887.7856445313,-1866.3979736328,13.577073097229,175.04852294922,'Leo Coper\n#40E0D0*mówi* Ten sukinsyn Rick powinien mi płacić więcej za\npilnowanie tego pieprzonego magazynu.',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{312, 1889.5325927734,-1855.4388427734,13.573994636536,179.47967529297,'Kind Jimmy\n#40E0D0*mówi* Szybciej kurwa! Nie przyszedłeś się tu opierdalać nędzarzu!',0,{"DEALER", "DEALER_IDLE"},'',0},
		{292, 1893.1921386719,-1865.9135742188,13.575658798218,120.23572540283,'Casper Delin\n#40E0D0*mówi* Co się kurwa gapisz? Do roboty mule.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{223, 1071.8724365234,-1315.7244873047,13.546875,63.78844833374,'Rob Cuthbert\n#9FC693*mówi* Nienawidzę tej roboty, mój szef to zwykła pała.',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		{305, 1006.3817749023,-1311.0229003906,13.546875,178.75947570801,'Gary Sparkle\n#9FC693*mówi* Jebany autobus spóźnia się już 10 minut!',0,{"JST_BUISNESS", "girl_02"},'',0},
		-- pruszkowska
		{259,1574.03, -1622.83, 17.03,122,'Darrel Prussin\n#FF0000*mówi* Nienawidzę hipsterów.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{2,1558.78, -1620.37, 13.54,270,'Marec Greeny\n#FF0000*mówi* Całe jebane życie w tej dziurze...\nA ty co się gapisz? Wyjebać ci lapsie?',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{297,1575.37, -1622.65, 13.54,156,'Gabirel Spencer\n#CA43FF*W ręce trzyma w połowie opróżnioną butelkę taniej wódki*',0,{"BAR", "dnk_stndM_loop"},'',0},
		{294,1573.92, -1621.46, 13.54,203,'Shane Adams\n#CA43FF*Odpala czerwonego chesterfielda srebną zapalniczką ZIPPO*',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{304,1562.52, -1629.65, 13.54,156,'Tom Sheen\n#FF0000*mówi* Już zapierdalam szefie.',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		{258,1560.68, -1632.05, 13.54,314,'Adrian Brudnospodny\n#FF0000*mówi* Wódką się skończyła, nie widzisz kurwa?\nWypierdalaj do sklepu w podskokach czarna suko.',0,{"ON_LOOKERS", "shout_in"},'',0},
		{245,1554.94, -1628.09, 13.54,0,'Aleksiej Klimow\n#FF0000*mówi* A zajebać ci w pysk?',0,{"RAPPING", "RAP_C_Loop"},'',0},
		{278,1546.08, -1624.56, 13.54,117,'Maksim Morozow\n#FF0000*mówi* Wyskakuj z portfela suko.',0,{"GHANDS", "gsign1LH"},'',0},
		{256,1540.728515625,-1625.0791015625,13.540652275085,93.359237670898,'Iwan Wasin\n#FF0000*mówi* Wypierdalaj.',0,{"GHANDS", "gsign2"},'',0},
		--pruszkowska_klatka
		{256,2413.5224121094,-1639.6845703125,19640.916015625,90,'Colins Parker\n#FF0000*mówi* Otwieraj drzwi ruchaczu cudzych żon!\nJak cię dorwę to rozkurwie ci czachę patałachu!',0,{"GANGS", "shake_carSH"},'',1},
		{285, 2419.4069824219,-1633.3817138672,19639.693359375,326.17489624023,'Pharelll Lacs\n#FF0000*mówi* Ten cwel Colins tak mocno drze pizdę, że\nzaraz cała ulica się dowie o jego puszczalskiej żonie.',0,{"GHANDS", "gsign4"},'',1},
		{290, 2426.16796875,-1626.4084472656,19639.693359375,99.100578308105,'Hubert McGayer\n#FF0000*mówi* Ała! Pomocy! Jakieś gnoje mnie napierdalają!',0,{"ped", "cower"},'',1},
		{22, 2425.8879394531,-1627.3374023438,19639.693359375,2.8332216739655,'Victor Davis\n#FF0000*mówi* Stul ryja cipo!',0,{"FIGHT_D", "FightD_G"},'',1},
		--plantacja
		{219, 2378.3122558594,-1626.3948974609,957.6484375,266.75512695313,'Ricky Flop\n#40E0D0*mówi* Kurwa, czujesz ten zapach?',0,{"GANGS", "prtial_gngtlkH"},'',1},
		{231, 2369.2321777344,-1596.4068603516,957.6484375,175.65925598145,'Dominick Stick\n#40E0D0*mówi* Najchętniej bym to wszystko zjarał.',0,{"GANGS", "prtial_gngtlkG"},'',1},
		{218, 2362.8688964844,-1609.8848876953,957.6484375,263.427734375,'Ferb Collin\n#40E0D0*mówi* To najlepszy towar w całym Los Santos.',0,{"LOWRIDER", "M_smklean_loop"},'',1},
		{311, 2367.3173828125,-1627.5930175781,957.6484375,359.6071472168,'Max Fletcher\n#40E0D0*mówi* Dobra trawa to jest to co lubię.',0,{"DEALER", "DEALER_IDLE"},'',1},
		{255, 1522.8189697266,-1847.3365478516,13.546875,276.02816772461,'Jose Varela',0,{"DEALER", "DEALER_IDLE"},'',1},
		--wołomińska
		{225, 1560.5914306641,-1788.3901367188,13.546875,266.96356201172,'George Elmer\n#FF0000*mówi* Pucuj się pało!',0,{"GANGS", "leanIDLE"},'',0},
		{308, 1535.6890869141,-1786.3271484375,13.546875,3.5659642219543,'Willy Sooky\n#FF0000*mówi* Otwieraj bydlaku! Będziesz wpierdalał kał!',0,{"FIGHT_D", "FightD_G"},'',0},
		{266, 1534.1002197266,-1800.9185791016,13.546875,206.8777923584,'Samuel Augustus\n#FF0000*mówi* Daj kurwa głośniej tą muze czarnuchu bo nic nie słyszę!',0,{"GANGS", "prtial_gngtlkD"},'',0},
		{265, 1526.0018310547,-1793.6743164063,13.546875,193.89405822754,'Sandy Thomas\n#FF0000*mówi* Prawie się poszczałem w gacie, naszczęście zdążyłem.',0,{"PAULNMAC", "Piss_loop"},'',0},
		{253, 1511.7503662109,-1785.8518066406,13.546875,184.89039611816,'Big Sleepy Martin\n#FF0000*mówi* Ten skurwiel Mario dalej wisi mi 100 dolców.',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{239, 1507.3432617188,-1777.7030029297,13.546875,183.07632446289,'Dario Philips\n#FF0000*mówi* Lej tą sukę!',0,{"RIOT", "RIOT_ANGRY_B"},'',0},
		{252, 1524.3341064453,-1764.7679443359,13.546875,359.27774047852,'Young Gun\n#FF0000*mówi* Łapy w górę głupi białasie i wyskakuj z kapusty.',0,{"GHANDS", "gsign2"},'',0},
		{67, 1484.0452880859,-1791.2139892578,13.546875,178.22668457031,'Leo DiMeo\n#FF0000*mówi* Czego tu szukasz? Wyjebać ci?',0,{"GANGS", "leanIDLE"},'',0},
		{311, 1550.8486328125,-1792.8295898438,13.546875,291.89752197266,'John Alexander\n#8a97ba*Zakrwawiony czarnuch z rozjebanym nosem w brudnych ubraniach*',0,{"SWEET", "Sweet_injuredloop"},'',0},
		{303, 1533.9901123047,-1802.2757568359,13.546875,306.74069213867,'Smith Green\n#8a97ba*Obskórny czarnuch z głośnikem w ręce*',0,{"RAPPING", "RAP_B_Loop"},'',0},
		{283, 1535.5501708984,-1802.0972900391,13.546875,60.602634429932,'Stephen Olive\n#CA43FF*Czarnuch trzyma w łapach Jeffa i buja głową w rytm muzyki*',0,{"RAPPING", "RAP_A_Loop"},'',0},
		{251, 1505.6791992188,-1780.6993408203,13.546875,274.62255859375,'Mario Philips\n#CA43FF*Wkurwiony pener ogarnięty przez szał nie szczędzi sił w napierdalaniu Jima*',0,{"MISC", "bitchslap"},'',0},
		{228, 1506.7183837891,-1780.8765869141,13.546875,0.46334385871887,'Jim Simon\n#8a97ba*Ma strasznie obity pysk*',0,{"CRACK", "crckidle4"},'',0},
		{255, 1524.1278076172,-1762.0743408203,13.546875,179.87049865723,'Phil Pavano\n#CA43FF*Ze strachu zesrał się w gacie*',0,{},'',0},
		{160, 1497.6459960938,-1803.4133300781,13.546875,357.85040283203,'Lee Greeks\n#8a97ba*Śmierdzący bezdomny z flaszką wódki w ręce*',0,{"BAR", "dnk_stndM_loop"},'',0},
		{96, 1509.1556396484,-1850.1407470703,13.546875,357.71060180664,'Austin Morales\n#FF0000*mówi* Jestem gejem i jestem z tego dumny.',0,{"DEALER", "DEALER_IDLE"},'',1},
		{100, 1470.2401123047,-1847.6812744141,13.546875,4.8537783622742,'Brayden Vega\n#FF0000*mówi* Co za kurwa kretyn jebany mi postawił śmientik pod oknami.',0,{"DEALER", "DEALER_IDLE"},'',1},
		{124, 1445.3984375,-1840.2025146484,13.546875,73.998863220215,'Evan Paz\n#FF0000*mówi* Jebać potwierdaczy.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{125, 1443.8004150391,-1840.9744873047,13.546875,344.21014404297,'Miles Acosta\n#FF0000*mówi* Jebać konfidentów.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{126, 1441.7047119141,-1840.2843017578,13.546875,286.85403442383,'Axel Pérez\n#FF0000*mówi* Jebać kapusi.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{127, 1444.3708496094,-1839.5914306641,13.546875,184.6602935791,'Brayden Iglesias\n#FF0000*mówi* Przekaz jest prosty.',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{112, 1523.3293457031,-1847.7102050781,13.546875,350.42266845703,'Adrian González',0,{"DEALER", "DEALER_IDLE"},'',0},
		{112, 1526.1499023438,-1846.7044677734,13.546875,117.69972991943,'Josiah Castro',0,{"DEALER", "DEALER_IDLE"},'',0},
		{117, 1525.1751708984,-1845.8449707031,13.546875,150.29203796387,'Hudson Sosa',0,{"DEALER", "DEALER_IDLE"},'',0},
		{304, 1484.5537109375,-1804.2667236328,13.546875,90.428283691406,'Robert López\n#8a97ba*Wkurwiony wyraz twarzy, pistolet w łapie*',0,{"DEALER", "DEALER_IDLE"},'',0},
		{285, 1484.4932861328,-1807.2081298828,13.546875,93.62353515625,'Roman Ruiz\n#8a97ba*Wkurwiony wyraz twarzy, pistolet w łapie*',0,{"DEALER", "DEALER_IDLE"},'',0},
		{26, 1495.4294433594,-1813.9855957031,13.546875,55.542377471924,'Jeremiah Prieto\n#FF0000*mówi* Dzień dobry, ci dwaj czarnoskórzy panowie zabrali mi telefon i mnie tu zamkneli... Mógłby pan im coś powiedzieć?',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{29, 1452.1108398438,-1802.1671142578,13.546875,277.67446899414,'Sawyer Soto\n#CA43FF*W ręce trzyma kebaba którego bardzo szybko i łapczywie wpierdala*',0,{"FOOD", "EAT_Burger"},'',0},
		{36, 1481.3492431641,-1782.6496582031,13.546875,4.9480142593384,'Caleb Santos\n#FF0000*śpiewa* Whisky moja żono...',0,{"dnk_stndM_loop"},'',0},
		{135, 1475.3529052734,-1776.8083496094,13.546875,93.886268615723,'Dylan Vera\n#FF0000*mówi* Nie pamiętam jak to jest być trzeźwym.',0,{"dnk_stndM_loop"},'',0},
		{137, 1474.041015625,-1775.9925537109,13.546875,175.78970336914,'Luke Correa\n#FF0000*mówi* Te głupie czarne brudasy ukradły mi wszystkie puszki.',0,{"dnk_stndM_loop"},'',0},
		{78, 1474.0369873047,-1778.1668701172,13.546875,355.47024536133,'John Bianchi\n#FF0000*mówi* W tym tygodniu dostałem już 3 razy wpierdol.',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{80, 1459.7032470703,-1795.7222900391,13.546875,180.93363952637,'Owen Franco\n#FF0000*mówi* Trening robie, na chuj cie lampisz?',0,{"FIGHT_B", "FightB_M"},'',0},
		{79, 1483.0517578125,-1813.751953125,13.546875,268.00628662109,'Matthew Vidal\n#FF0000*mówi* A mogłem się kurwa uczyć... Teraz muszę zbierać puszki.',0,{"CASINO", "Roulette_loop"},'',0},
		{282, 1475.7884521484,-1790.9493408203,13.546875,182.72560119629,'Alexander Arias\n#FF0000*mówi* Zaraz rozpierdoli mi kichawe od tego towaru, ale mam to w dupie.',0,{"COP_AMBIENT", "Coplook_loop"},'',0},
		{263, 1473.3421630859,-1799.6739501953,13.546875,215.26123046875,'Logan Herrera\n#FF0000*mówi* Wyjebie mu każdego zęba. Nienawidzę tego parzydlaka Nathana, niech go dusi pyta po same jaja.',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{225, 1473.5925292969,-1801.0339355469,13.546875,326.89147949219,'Mason Benítez\n#FF0000*mówi* Dobrze pierdolisz Olivier, chętnie spiorę mu facjate na kwaśne jabłko.',0,{"GANGS", "prtial_gngtlkG"},'',0},
		{227, 1475.3018798828,-1799.9517822266,13.546875,98.265769958496,'Oliver Ferrari\n#FF0000*mówi* Ten lachociąg Nathan musi dostać w jape.',0,{"GANGS", "prtial_gngtlkG"},'',0},
		{182, 1466.6457519531,-1814.4428710938,13.546875,270.16394042969,'James Pereyra\n#FF0000*mówi* Won stąd bo ci wyjebie gonga. ',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{183, 1480.5186767578,-1827.5404052734,13.546875,271.86462402344,'William Hernández\n#FF0000*mówi* Gleba skurwydziadu! ',0,{"FIGHT_D", "FightD_G"},'',0},
		{200, 1481.3415527344,-1828.0971679688,13.546875,88.189979553223,'Noah Rossi\n#8a97ba*Przechlany ryj, podbite oko*',0,{"CRACK", "crckidle4"},'',0},
		{183, 1476.8089599609,-1837.1840820313,13.546875,179.46279907227,'Liam Silva\n#FF0000*mówi* Wypierdalaj skurwysynie.',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{257, 1482.7421875,-1837.201171875,13.546875,0.224624633789,'Matt Cuneo\n#8a97ba*Pijany wychudzony 30-latek leżący w kałuży swoich rzygów.*',0,{"CRACK", "crckidle4"},'',0},
		--mechanicy
		{50, 2236.529296875,-1452.7540283203,24.04843711853,112.08092498779,'Victor McWilliams\n#40E0D0*mówi* Wow koleś, ale bryka!',0,{'COP_AMBIENT', 'Coplook_loop'},'',0},
		--diler_praca
		{238, 2429.4956054688,-1670.9016113281,14.348437309265,151.7572479248,'Riggo Mulloni\n#40E0D0*mówi* Bierz towar i spierdalaj.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{241, 2428.7082519531,-1678.4305419922,14.348437309265,48.331100463867,'Oliver Felani\n#40E0D0*mówi* Towar jest już zapakowany, możesz zaczynać.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{253, 2424.9741210938,-1678.8649902344,14.348437309265,332.07623291016,'Mark Puccieto\n#40E0D0*mówi* Też kiedyś tu zapierdalałem z towarem jak ty.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{270, 2422.5014648438,-1670.7178955078,13.575231552124,90.189964294434,'Tony Guner\n#40E0D0*mówi* Możesz wjeżdżać.',0,{"COP_AMBIENT", "Coplook_loop"},'',0},
		--urzad
		{298, 2575.9145507813,-1630.6773681641,1672.1484375,359.38598632813,'Mario Stick\n#9FC693*mówi* Pierdolony automat zajebał mi 2 złote! Gdzie mój baton do chuja?.',0,{"FIGHT_D", "FightD_G"},'',1},
		{17, 2561.9943847656,-1635.0505371094,1672.1484375,255.37817382813,'Ricky Rioux\n#40E0D0*mówi* W czym mogę pomóc?',0,{'COP_AMBIENT', 'Coplook_loop'},'',1},
		{194, 2561.9953613281,-1637.3840332031,1672.1484375,267.36053466797,'Theodora Gallardo\n#40E0D0*mówi* Dzień dobry!',0,{'COP_AMBIENT', 'Coplook_loop'},'',1},
		{57, 2561.9907226563,-1639.8264160156,1672.1484375,267.67999267578,'Walter Muniz\n#40E0D0*mówi* Za rok idę na emeryturę.',0,{'COP_AMBIENT', 'Coplook_loop'},'',1},
		-- skin shop
		{218, 1712.3748779297,-1712.123046875,13.6484375,89.959747314453,'Timmy Spears\n#40E0D0*mówi* Witam! W czym mogę pomóc?',0,{"DEALER", "DEALER_IDLE"},'',0},
		{223, 1703.8588867188,-1710.4844970703,13.6484375,211.43898010254,'Daniel Lean\n#9FC693*mówi* Bolą mnie nogi od stania już kurwa.',0,{"GANGS", "leanIDLE"},'',0},
		{228, 1704.8112792969,-1715.8132324219,13.6484375,50.31468963623,'Piter Walter\n#9FC693*mówi* Kurwa ale drogo!',0,{"GANGS", "prtial_gngtlkD"},'',0},
		{224, 1711.0418701172,-1718.8865966797,13.6484375,218.16030883789,'Skinny Lee\n#9FC693*mówi* Pojebało ich z tymi cenami.',0,{"GANGS", "prtial_gngtlkD"},'',0},
		-- restauracja
		{229, 1725.08203125,-1705.3890380859,13.6484375,268.72866821289,'Tłusty Barman\n#40E0D0*mówi* Witam, co podać?',0,{"DEALER", "DEALER_IDLE"},'',0},
		{233, 1731.3157958984,-1706.6734619141,13.6484375,198.91073608398,'Lukas Black\n#9FC693*mówi* Kurwa, chyba ktoś mi napluł do zupy.',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{224, 1730.9365234375,-1707.9127197266,13.6484375,316.97814941406,'Oscar Black\n#9FC693*mówi* Dobre żarcie ale drogie jak skurwysyn.',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{241, 1740.0539550781,-1708.2427978516,13.6484375,164.67445373535,'Sergio Felani\n#CA43FF*Zaciąga się papierosem po czym bierze do ręki drinka*',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{262, 1740.208984375,-1709.4014892578,13.6484375,42.772686004639,'Dario Felani\n#CA43FF*Spokojnym ruchem sięga do kieszeni z której wyciąga telefon*',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{270, 1739.2301025391,-1709.1500244141,13.6484375,284.06622314453,'Giorgio Felani\n#CA43FF*Spogląda na swój złoty zegarek*',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{250, 1735.0502929688,-1710.5384521484,13.6484375,192.81875610352,'Sally Roan\n#9FC693*mówi* Dalej czuje smak spermy w ustach.',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{243, 1734.8010253906,-1711.8671875,13.6484375,319.97235107422,'Nataly Wilson\n#9FC693*mówi* Wczoraj obciągnełam Delingowi.',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{278, 1739.1383056641,-1713.8668212891,13.6484375,272.68145751953,'Max Greesy\n#9FC693*mówi* Ej Jeff, ty dalej bierzesz te sterydy?',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{227, 1740.2091064453,-1713.1068115234,13.6484375,158.12893676758,'Jeff Tomson\n#9FC693*mówi* A nie widać kurwa?',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{226, 1740.3470458984,-1714.4182128906,13.6484375,35.268585205078,'Jacob Little\n#9FC693*mówi* Annie mówiła, że skurczyły ci się jaja.',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{224, 1739.1866455078,-1718.1026611328,13.6484375,233.53869628906,'Liam Aiden\n#9FC693*mówi* Mam ochotę się zbombić.',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{232, 1740.4161376953,-1718.2121582031,13.6484375,112.75526428223,'Noah Grayson\n#9FC693*mówi* To dobrze się składa bo mam gieta przy sobie.',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{246, 1739.728515625,-1719.2470703125,13.6484375,355.646484375,'Elijah Caden\n#9FC693*mówi* Ja już rok nie tykam tego ścierwa, chuj wam w dupe.',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{236, 1734.4909667969,-1719.7141113281,13.6484375,91.666107177734,'Fat Bob\n#9FC693*mówi* Jestem tłustą świnią ale mam to w dupie i dalej wpierdalam.',0,{"INT_OFFICE", "OFF_Sit_Idle_Loop"},'',0},
		{216, 1737.3258056641,-1701.7434082031,13.6484375,177.80561828613,'Matt White\n#9FC693*mówi* Ja pierdole! Jebać tą robote! Jebany zmywak',0,{"SCRATCHING", "scmid_l"},'',0},
		-- melina hugo statforda
		{259, 2472.3427734375,-1567.7069091797,772.04846191406,283.27682495117,'Kim Brat\n#FF0000*mówi* Bierz dupe w troki i spierdalaj, jak coś to się nie znamy.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{261,2479.1689453125,-1564.5145263672,772.04846191406,117.87229919434,'Harold Sinker\n#FF0000*mówi* Aha, i Nelson kazał Ci to przekazać.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{288, 2489.7219238281,-1575.30859375,772.04846191406,48.487525939941,'Big Jimmy Jim\n#FF0000*mówi* Wyjebać ci w morde?',0,{"DEALER", "DEALER_IDLE"},'',0},
		{241, 2487.1911621094,-1576.4572753906,772.04846191406,357.95501708984,'Big Willy Will\n#FF0000*mówi* Co się głupio patrzysz? Chcesz zarobić w jape?',0,{"DEALER", "DEALER_IDLE"},'',0},
		{262, 2488.4672851563,-1575.8444824219,772.04846191406,13.555330276489,'Hugo Statford\n#FF0000*mówi* To ja tu rządze skurwysnie.',0,{"COP_AMBIENT", "Coplook_loop"},'',0},
		{282, 1648.5870361328,-1803.1196289063,13.535588264465,160.79010009766,'Geroge Stalone \n#FF0000*mówi* Najchętniej bym wciągnał cały ten towar.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{278,1641.1921386719,-1815.3079833984,13.529006958008,333.81976318359,'Joseph Mike\n#FF0000*mówi* Kokaina dała mi drugie życie.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{275, 1650.7568359375,-1810.5346679688,13.538766860962,90.335723876953,'Damian Speer\n#FF0000*mówi* Dzisiaj jeszcze nie ćpałem.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{272, 1650.9334716797,-1806.0406494141,13.539026260376,95.927551269531,'Roman Caleb\n#FF0000*mówi* Swędzi mnie nos.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{270, 1634.3969726563,-1805.4765625,13.523023605347,259.68811035156,'Kim Whale\n#FF0000*mówi* Zabiłem dziś policjanta.',0,{"COP_AMBIENT", "Coplook_loop"},'',0},
		{259, 1660.1483154297,-1824.994140625,13.55445098877,90.928451538086,'Harry Reece \n#FF0000*mówi* Won stąd bo cie odjebie stuknięty skurwielu.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{257,1640.2862548828,-1816.4254150391,13.529876708984,181.88182067871,'Charlie Rhys\n#FF0000*mówi* Zaraz wyciągne guna.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{256, 1626.8973388672,-1848.5743408203,13.537912368774,355.86743164063,'Thomas Connor\n#FF0000*mówi* Burdel jeszcze otwarty?.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{255, 1658.1793212891,-1817.0893554688,13.549642562866,161.06587219238,'James Kyle\n#FF0000*mówi* Nie śpię drugi dzień.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{254, 1617.0826416016,-1842.9564208984,13.539614677429,264.115234375,'Oliver Ethan \n#FF0000*mówi* Skończył mi się towar.',0,{"COP_AMBIENT", "Coplook_loop"},'',0},    
		{253, 1632.8266601563,-1817.7504882813,13.528838157654,351.510131835945,'Wkurwiony Patrick \n#FF0000*mówi* Otwieraj kurwa! Srać mi się chce.',0,{"FIGHT_D", "FightD_G"},'',0}, 
		-- park
		{292, 1487.5126953125,-1665.23828125,13.380000114441,7.0211610794067,'Kacper \n#FF0000*mówi* Ała! Moja dupa!',0,{"FAT", "IDLE_tired"},'',0},    
		{267, 1487.5798339844,-1666.1525390625,13.380000114441,13.41183757782,'Patryk \n#FF0000*mówi* Ale masz ciasną dupe Kacper.',0,{"PAULNMAC", "Piss_loop"},'',0},   
		{251, 1487.5397949219,-1664.1243896484,13.380000114441,174.29669189453,'Patryk \n#FF0000*mówi* Bierz go do japy Kapi.',0,{"PAULNMAC", "Piss_loop"},'',0},  
		-- kiosk
		{244, 1676.3071289063,-1743.099609375,13.558437347412,359.78094482422,'Rose Flayer \n#40E0D0*mówi* Co potrzeba?',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{260, 1673.7310791016,-1741.6868896484,13.546936988831,179.83772277832,'Filip Martin \n#FF0000*mówi* Ty stara kurwo z kiosku! Napraw ten automat!',0,{"FIGHT_D", "FightD_G"},'',0},    
		{248, 1664.8430175781,-1744.0003662109,13.980961799622,174.9303894043,'Majster \n#8a97ba*Żul cuchnący tanim alkoholem*',0,{"CRACK", "crckidle2"},'',0}, 
		-- park
		{268, 1470.0745849609,-1652.3087158203,13.380000114441,10.508847236633,'Pijak \n#FF0000*mówi* Spierdalaj bo cię obrzygam.',0,{"CRACK", "crckidle2"},'',0},    
		{243, 1478.4102783203,-1667.1668701172,13.481562614441,326.84631347656,'Julia Bednar \n#9FC693*mówi* Obciągne ci za sto złoty.',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{252, 1461.0421142578,-1648.1623535156,13.481562614441,244.50970458984,'Lincolm Gayer \n#8a97ba*30-sto letni, nie zabadny mężczyzna popalający śmierdzącą cygaretke.',0,{"LOWRIDER", "M_smklean_loop"},'',0},    
		{264, 1480.9093017578,-1617.7211914063,13.481562614441,93.278045654297,'Skinny G\n#FF0000*mówi* Jebany Matt spóźnia się już 20 minut, kurwa.',0,{"DEALER", "DEALER_IDLE"},'',0},    
		{249, 1477.2918701172,-1697.6490478516,13.481562614441,231.37286376953,'Lazy Ricky  \n#FF0000*mówi* Dawaj szluga psie.',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{263, 1437.0537109375,-1653.6346435547,13.481562614441,80.986320495605,'Charles Berton \n#FF0000*mówi* Żona mnie zostawiła, nie mam kogo ruchać, muszę walić konia.',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{258, 1466.171875,-1683.6756591797,13.380000114441,185.80381774902,'Lincolm Gayer \n#FF0000*mówi* Gdzie się patrzysz pedale.',0,{"PAULNMAC", "Piss_loop"},'',0},   
		-- sklep z bronia
		{222, 2566.8571777344,-2143.9809570313,-0.21875,261.04260253906,'Gregg Miller \n#9FC693*mówi* Jak chcesz jakieś guny to podbijaj do Diona.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{257, 2571.8081054688,-2163.2209472656,-0.21875,266.47467041016,'Leone Collins\n#FF0000*mówi* Ja pierdole, gdzie mój pistolet.',0,{"DEALER", "DEALER_IDLE"},'',0},    
		{261, 2581.3227539063,-2147.1350097656,-0.21875,77.903961181641,'Dell Weimann \n#FF0000*mówi* Mam w domu kolekcje spluw.',0,{"DEALER", "DEALER_IDLE"},'',0},    
		{263, 2584.5842285156,-2141.4997558594,-0.21875,50.903430938721,'Dax Toy \n#FF0000*mówi* Nie śpie już dwa dni.',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{282, 2556.0075683594,-2205.6979980469,-0.21875,337.43746948242,'Hudson Baumbach \n#FF0000*mówi* Nasz sprzęt jest z najwyższej pólki.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{275, 2555.9489746094,-2198.0795898438,-0.21875,247.5457611084,'Frederik Senger \n#FF0000*mówi* Sprzedajemy tylko porządne gnaty.',0,{"DEALER", "DEALER_IDLE"},'',0},    
		{272, 2568.8566894531,-2207.4167480469,-0.21875,88.212409973145,'Tyson Jacobson \n#9FC693*mówi* Moim pierwszym pistoletem był GLOCK 45.',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{271, 2572.0747070313,-2190.0002441406,-0.21875,176.98579406738,'Karson Nicolas\n#FF0000*mówi* Kurwa! Jebane kopyto, znowu się zacieło.',0,{"DEALER", "DEALER_IDLE"},'',0},    
		{300, 2612.6716308594,-2155.927734375,-0.21875,278.96304321289,'Carol Erdman  \n#FF0000*mówi* Jestem już kurwa zmęczony tą robotą.',0,{"CASINO", "dealone"},'',0},    
		{307, 2608.3227539063,-2156.0053710938,-0.21875,258.94598388672,'Ahmed Feil \n#FF0000*mówi* Zapierdalaj! Nie mamy całego dnia skurwysynie.',0,{"DEALER", "DEALER_IDLE"},'',0},    
		{309, 2610.853515625,-2177.244140625,-0.21875,311.66891479492,'Frederick Weimann \n#FF0000*mówi* Siedzę tu od rana i zapierdalam bez przerwy, mam tego dość do chuja.',0,{"CASINO", "dealone"},'',0},    
		{311, 2610.5935058594,-2175.5930175781,-0.21875,213.57229614258,'Judge Volkman \n#FF0000*mówi* Ja to samo! Jebać tą fuchę. Dion to cwel.',0,{"CASINO", "dealone"},'',0},    
		{312, 2611.84765625,-2194.3618164063,-0.21875,272.59338378906,'Floy Hudson \n#9FC693*mówi* Za godzinę mam koniec roboty, w końcu będe mógł się naćpać.',0,{"CASINO", "dealone"},'',0},
		{290, 2612.0739746094,-2197.2529296875,-0.21875,271.634765625,'Ellsworth Dach\n#FF0000*mówi* Mam to w dupie ziomek.',0,{"CASINO", "dealone"},'',0},    
		{233, 2554.3872070313,-2187.1965332031,-0.21875,264.18252563477,'Dion Runte  \n#FF0000*mówi* Trzymam w garści ten kurwidołek.',0,{"COP_AMBIENT", "Coplook_loop"},'',0},    
		{227, 2554.7263183594,-2188.3352050781,-0.21875,274.72711181641,'Lonny Emard \n#FF0000*mówi* Chcesz kupić klame to dawaj kapuche albo spierdalaj.',0,{"DEALER", "DEALER_IDLE"},'',0},    
		{227, 2555.3376464844,-2186.5126953125,-0.21875,244.10868835449,'Fredy Hauck \n#FF0000*mówi* Akurat dziś przyszedł nowy sort kul kurwiarzu.',0,{"DEALER", "DEALER_IDLE"},'',0},  
		-- stacja idlewood
		{234, 1915.755859375,-1776.4771728516,13.546875,267.72225952148,'Notlas Kirayas \n#40E0D0*mówi* Dzień dobry! Co podać?',0,{"DEALER", "DEALER_IDLE"},'',0},
		{235, 1917.7452392578,-1776.125,13.546875,83.990936279297,'Natorgi Scarth\n#FF0000*mówi* Proszę najtańszą wódkę jaką tu macie.',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{237, 1919.0684814453,-1775.4637451172,13.546875,105.53911590576,'Alkariak Jauron  \n#FF0000*mówi* Szybciej do chuja! Ruchy pedale za ladą!',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{242, 1922.1678466797,-1770.4581298828,13.546875,88.397804260254,' Crougen Markan \n#FF0000*mówi* Ja pierdole, jak drogo! Pojebało ich.',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{245    , 1926.5632324219,-1773.1279296875,13.546875,266.21783447266,'Dravend Festry \n#FF0000*mówi* Zaraz rozkurwie ten automat w drobny mak.',0,{"FIGHT_D", "FightD_G"},'',0},
		{251, 1926.1052246094,-1774.7531738281,13.546875,322.24945068359,'Patryk \n#FF0000*mówi* Na chuj kurwa kopiesz zjebie.',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{254, 1929.5639648438,-1772.6862792969,13.546875,269.85653686523,'Uriel Hahn \n#9FC693*mówi* Kurwa, skończyły mi się szlugi.',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		-- monopol idlewood
		{228, 1976.1135253906,-1784.1232910156,13.549437522888,285.0446472168,'Nick Gleason\n#FF0000*mówi* Daj mi tą flaszkę za dyszkę, chce się porządnie i nie drogo napierdolić.',0,{"GANGS", "prtial_gngtlkH"},'',0},    
		{236, 1977.7302246094,-1783.5798339844,13.549437522888,110.53337097168,'Theo Dietrich  \n#FF0000*mówi* Same żule tu przyłażą.',0,{"CASINO", "dealone"},'',0},    
		{238, 1974.4787597656,-1786.4019775391,13.549437522888,356.40344238281,'Oswaldo Nienow \n#FF0000*mówi* Pośpiesz się Nick, jebany alkoholiku.',0,{"LOWRIDER", "M_smklean_loop"},'',0},    
		{268, 1970.9993896484,-1779.8299560547,13.546875,91.784027099609,'Frederick Weimann \n#FF0000*mówi* Zaraz cie obrzygam, nie zbliżaj się.',0,{"CRACK", "crckidle4"},'',0},  
		-- siłownia idlewood
		{19, 2072.0180664063,-1877.1335449219,13.546875,270.15469360352,'Michale Ledner \n#FF0000*mówi* A karnet kurwa jest?',0,{"DEALER", "DEALER_IDLE"},'',0},
		{45, 2070.2629394531,-1871.8336181641,13.558437347412,261.51696777344,'Xander Wuckert\n#FF0000*mówi* Nie patrz mi się na fiuta pieprzony pedale!',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{97, 2070.0712890625,-1875.8316650391,13.558437347412,276.37524414063,'Nelson Schamberger\n#FF0000*mówi* Odpierdol się ode mnie Xander.',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{81, 2047.1072998047,-1868.7214355469,15.37384223938,162.20932006836,'Torey Turcotte\n#FF0000*mówi* Obiajnie pysków to jest to lubie.',0,{"FIGHT_B", "FightB_M"},'',0},
		{80, 2047.0159912109,-1869.9359130859,15.37384223938,357.17065429688,'Edgar Roob\n#FF0000*mówi* Chyba mi wyjebałeś zęba.',0,{"FIGHT_B", "FightB_M"},'',0},
		{28, 2045.8951416016,-1874.4713134766,14.448437690735,347.63098144531,'Gardner Crona \n#FF0000*mówi* Edgar! Najeb tej świni!.',0,{"ON_LOOKERS", "shout_in"},'',0},
		{179, 2062.5866699219,-1864.9443359375,13.558437347412,215.4681854248,'Kurtis Ferry\n#FF0000*mówi* Kurwa, zmęczyłem się.',0,{"FAT", "IDLE_tired"},'',0},
		{81, 2055.8757324219,-1867.9282226563,13.653672218323,265.9543762207,'Wilfrid Mohr	\n#FF0000*mówi* Ale te maty kurwią potem.',0,{"BEACH", "Lay_Bac_Loop"},'',0},
		{80, 2055.6765136719,-1864.7379150391,13.653672218323,181.59773254395,'Tillman Thompson\n#FF0000*mówi* Została mi ostatnia seria i spierdalam na chate.',0,{"CRACK", "crckidle4"},'',0},
		{19, 2064.8256835938,-1871.6793212891,13.558437347412,86.650146484375,'Charlie Bailey \n#FF0000*mówi* Spierdalaj, nie chce mi się chuderlaku.',0,{"BEACH", "ParkSit_M_loop"},'',0},
		{45, 2063.6752929688,-1872.5639648438,13.558437347412,306.11242675781,'Kip Miller \n#FF0000*mówi* Ej koleś, weź mi pomóż ze sztangą.',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{304, 2068.8537597656,-1865.2015380859,13.557437896729,143.20751953125,'Lemuel Hahn\n#FF0000*mówi* No a nie widać kurwa? Jasne, że tak.',0,{"GANGS", "prtial_gngtlkH"},'',0},
		{303, 2068.0920410156,-1866.2209472656,13.557437896729,315.49234008789,'Donnie Schowalter\n#FF0000*mówi* Ej ziom, ty jeszcze bierzesz te jebane sterydy?',0,{"GANGS", "prtial_gngtlkH"},'',0},
		-- składniki_ziolo
		{231, 1798.1342773438,-2143.0471191406,13.546875,89.870758056641,'Vladimir Cummings \n#FF0000*mówi* Jak nam sprowadzisz psy na głowe to osobiście cię znajdę.',0,{"LOWRIDER", "M_smklean_loop"},'',0},
		{230, 1798.4344482422,-2149.8959960938,13.546875,33.473247528076,'Schuyler Swift\n#FF0000*mówi* Właź do środka.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{232, 1802.2327880859,-2143.4135742188,13.546875,175.66523742676,'Brandt Witting\n#FF0000*mówi* Ale te śmieci jebią.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{249, 1804.8654785156,-2149.1225585938,13.546875,36.451927185059,'Orion Reilly\n#FF0000*mówi* To je wynieś do śmietnika zjebie.',0,{"DEALER", "DEALER_IDLE"},'',0},
		{219, 1805.0687255859,-2146.6306152344,13.546875,85.876541137695,'Tillman Nitzsche\n#FF0000*mówi* Czego ode mnie chcesz?',0,{"COP_AMBIENT", "Coplook_loop"},'',0},
		}
	
	for i,v in ipairs(peds) do
		local ped = createPed(v[1], v[2], v[3], v[4], v[5])
		setElementDimension(ped, v[7])
		setElementInterior(ped, v[10])
		setElementData(ped, 'ped', true)
		if v[8] then
			setTimer(function()
				setPedAnimation(ped, v[8][1], v[8][2], -1, true, false, false, true, 1500)
			end, 50, 1)
		end
		setElementFrozen(ped, true)
		setElementData(ped, 'ped:name', v[6])
	end

function this ( theResource ) 
	local they = getResourceFromName ( "crime_peds" ) 
if getResourceFromName then 
	restartResource(they) 
	end 
end 
setTimer(this, 1000*180,0)

local bmw_wolominska = {
	{507,1444.09, -1838.07, 13.46, 0.4, 0.0, 91.2, 15, 15, 15}
}

for i,v in pairs(bmw_wolominska) do 
	local bmw_wolominskas = createVehicle(v[1], v[2], v[3], v[4], v[5], v[6], v[7])
    setElementFrozen(bmw_wolominskas,true)
	setVehicleLocked(bmw_wolominskas,true)
	setVehicleOverrideLights (bmw_wolominskas, 2)
	setVehicleDoorOpenRatio(bmw_wolominskas, 1, 110)
	setVehicleColor(bmw_wolominskas,v[8], v[9], v[10])
end
