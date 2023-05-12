--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

selectedLanguage = "pl"

availableTranslations = {
	["pl"] = {
		["menu.mainMenu"] = "Kategorie",
		["menu.performance"] = "Silnik i Napędy",
		["menu.fixvehicle"] = "Naprawa pojazdu",
		["menu.optical"] = "Tuning Wizualny",
		["menu.tarcze"] = "Tarcze Hamulcowe",
		["menu.zawieszenie"] = "Wysokość Zawieszenia",
		["menu.karoseria"] = "Karbowana Karoseria",
		["menu.chiptuning"] = "Chiptuning Silnika",
		["menu.klakson"] = "Klaksony",
		["menu.mileage"] = "Cofanie Przebiegu",
		["menu.extras"] = "Dodatki",
		["menu.color"] = "Kolor Samochodu",
		
		["menu.fixvehicle.full"] = "Napraw cały pojazd",
		["menu.fixvehicle.tires"] = "Napraw opony",
		
		
		["menu.performance.engine"] = "Silnik",
		["menu.performance.turbo"] = "Turbo",
		["menu.performance.nitro"] = "Nitro",
		["menu.performance.tires"] = "Opony",
		["menu.performance.brakes"] = "Hamulce",
		["menu.performance.weightReduction"] = "Redukcja Wagi",
		
		["menu.optical.frontBumper"] = "Przedni zderzak",
		["menu.optical.rearBumper"] = "Tylni zderzak",
		["menu.optical.hood"] = "Wlot powietrza - Maska",
		["menu.optical.exhaust"] = "Wydech",
		["menu.optical.spoiler"] = "Spoiler",
		["menu.optical.wheels"] = "Felgi",
		["menu.optical.sideSkirt"] = "Progi",
		["menu.optical.roofScoop"] = "Wlot powietrza - Dach",
		["menu.optical.hidraulics"] = "Hydraulika",
		["menu.optical.butterfly"] = "Drzwi otwierane do góry",
		["menu.optical.lampColor"] = "Kolor świateł",
		
		["menu.extras.frontWheelSize"] = "Wielkość przednich opon",
		["menu.extras.rearWheelSize"] = "Wielkość tylnich opon",
		["menu.extras.offroad"] = "Offroad",
		["menu.extras.driveType"] = "Typ jazdy",
		["menu.extras.bulletproofTires"] = "Kuloodporne opony",
		["menu.extras.lsdDoor"] = "Drzwi LSD?",
		["menu.extras.steeringLock"] = "Blokada sterowania",
		["menu.extras.numberplate"] = "Rejestracja",
		
		["tuningPack.0"] = "Bez tuningu",
		["tuningPack.1"] = "2",
		["tuningPack.2"] = "3",
		["tuningPack.3"] = "4",
		["tuningPack.wheelSize.veryNarrow"] = "Bardzo wąskie",
		["tuningPack.wheelSize.narrow"] = "Wąskie",
		["tuningPack.wheelSize.wide"] = "Szerokie",
		["tuningPack.wheelSize.veryWide"] = "Bardzo szerokie",
		["tuningPack.offroad.dirt"] = "Ziemia",
		["tuningPack.offroad.sand"] = "Piach",
		["tuningPack.driveType.front"] = "Przedni napęd",
		["tuningPack.driveType.all"] = "4x4",
		["tuningPack.driveType.rear"] = "Tylny napęd",
		["tuningPack.bulletproofTires"] = "Kuloodporne opony",
		["tuningPack.numberplate.random"] = "Rejestracja random",
		["tuningPack.numberplate.custom"] = "Rejestracja twoja",
		
		["tuningPack.optical.neon.1"] = "Białe",
		["tuningPack.optical.neon.2"] = "Niebieskie",
		["tuningPack.optical.neon.3"] = "Zielone",
		["tuningPack.optical.neon.4"] = "Czerwone",
		["tuningPack.optical.neon.5"] = "Żółte",
		["tuningPack.optical.neon.6"] = "Różowe",
		["tuningPack.optical.neon.7"] = "Pomarańczowe",
		["tuningPack.optical.neon.8"] = "Morskie",
		["tuningPack.optical.neon.9"] = "Czerwono zielono żółte",
		["tuningPack.optical.neon.10"] = "Biało morskie",
		
		["tuningPrice.free"] = "Za darmo",
		["tuningPack.remove"] = "Wymontuj",
		["tuningPack.install"] = "Zamontuj",
		["tuning.active"] = "Zamontowane",
		
		["navbar.select"] = "Wybierz",
		["navbar.buy"] = "Zamontuj",
		["navbar.navigate"] = "Nawiguj",
		["navbar.back"] = "Wróć",
		["navbar.exit"] = "Wyjdź",
		["navbar.camera"] = "Przemieszczanie Kamery",
		
		["notification.error.notCompatible"] = "Tej części nie zamontujesz w tym pojeździe!",
		["notification.error.itemIsPurchased"] = "Już to zamontowałeś!",
		["notification.error.notEnoughMoney"] = "Nie masz tylu pieniędzy!",
		["notification.success.purchased"] = "Zakupiono",
		["notification.warning.airRideInstalled"] = "USUŃ HYDRAULIKE",
		
		["prompt.text"] = "Czy napewno chcesz to zamontować?",
		["prompt.info.1"] = "Element",
		["prompt.info.2"] = "Cena",
		["prompt.button.1"] = "Enter",
		["prompt.button.2"] = "Backspace",
		
		["message.airride.error"] = "error",
	},
}

function getLocalizedText(stringCode, ...)
	if stringCode then
		if availableTranslations[selectedLanguage] then
			if availableTranslations[selectedLanguage][stringCode] then
				if ... then
					return availableTranslations[selectedLanguage][stringCode]:format(...)
				else
					return availableTranslations[selectedLanguage][stringCode]
				end
			end
		end
	end
	
	if ... then
		return stringCode .. "|" .. table.concat({...}, "|")
	else
		return stringCode
	end
end