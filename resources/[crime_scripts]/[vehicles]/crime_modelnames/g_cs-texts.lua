--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

availableTranslations = {
	["pl"] = {
		{"Elegant", "BMW Series 7 E38"},
        {"Comet", "Porsche 911 Carrera S"},
        {"Nebula", "Audi A6 C4"},
        {"Sunrise", "Honda Accord"},
        {"Turismo", "Ferrari Berlinetta F355"},
        {"Alpha", "Mercedes-Benz C63 AMG"},
        {"Buffalo", "Chevrolet Camaro Z28"},
        {"Picador", "El Camino"},
        {"Previon", "Honda Civic"},
        {"Admiral", "Mercedes-Benz CLS63"},
        {"Oceanic", "Invetero Coquette G1"},
        {"Infernus", "Lamborghini Countach"},
        {"Banshee", "Aston Martin DBS"},
        {"Euros", "Deluxo"},
        {"Greenwood", "Dodge Diplomat"},
        {"Sabre", "Dukes"},
        {"Sentinel", "BMW M5 F10"},
        {"ZR-350", "Feroci"},
        {"Manana", "Fiat Abarth 595"},
        {"Trashmaster", "Ford Cargo"},
        {"Burrito", "Ford E150"},
        {"Huntley", "Mercedes-Benz G63 AMG"},
        {"Sandking", "Mercedes-Benz G63 AMG 6X6"},
        {"Stafford", "Maserati Ghibli S Q4"},
        {"Club", "Hedgehog"},
        {"Premier", "Chevrolet Impala SS"},
        {"Voodoo", "Chevrolet Impala 59"},
        {"Virgo", "Imperial"},
        {"Stretch", "Lincoln Town"},
        {"Blista Compact", "Lizard"},
        {"Jester", "BMW M1 E26"},
        {"Sultan", "BMW M5 F90"},
        {"Stallion", "BMW M635"},
        {"Washington", "S150 Majesta"},
        {"Bullet", "MCLaren F1"},
        {"Glendale", "Dodge Monaco '74"},
        {"Glendale Damaged", "Dodge Monaco '74"},
		{"Merit", "Mercedes-Benz S600"},
        {"Elegy", "Nissan Silvia S15"},
        {"Windsor", "Ferrari 365 GTB4 Spyder"},
        {"Stratum", "Nissan Stagea"},
        {"Cheetah", "Ferrari Testarossa"},
        {"Bobcat", "Annis Vassal"},
        {"Feltzer", "Mercedes-Benz W126"},
        {"Landstalker", "BMW X5M"},
	},
}

function getText(stringCode)
    selectedLanguage = "pl"
	if stringCode then
		if availableTranslations[selectedLanguage] then
			for i,v in pairs (availableTranslations[selectedLanguage]) do
				if string.lower(availableTranslations[selectedLanguage][i][1]) == string.lower(stringCode) then
					return availableTranslations[selectedLanguage][i][2]
				end
			end
		end
	end
	
	return stringCode
end

function getText2(stringCode)
    selectedLanguage = "pl"
	if stringCode then
		if availableTranslations[selectedLanguage] then
			for i,v in pairs (availableTranslations[selectedLanguage]) do
				if string.lower(availableTranslations[selectedLanguage][i][2]) == string.lower(stringCode) then
					return availableTranslations[selectedLanguage][i][2]
				end
			end
		end
	end
	
	return stringCode
end


function getText3(stringCode)
    selectedLanguage = "pl"
	if stringCode then
		if availableTranslations[selectedLanguage] then
			for i,v in pairs (availableTranslations[selectedLanguage]) do
				if string.lower(availableTranslations[selectedLanguage][i][2]) == string.lower(stringCode) then
					return availableTranslations[selectedLanguage][i][1]
				end
			end
		end
	end
	
	return stringCode
end