-- When a relic is vaulted, it cannot be obtained through in-game missions.
-- In other words, they do not appear in any mission drop tables. When a relic
-- is vaulted, that means at least one item part that drops from that relic is
-- also vaulted. An item part is defined as being vaulted when all the relics
-- that it can be dropped from are vaulted.

-- Normally, relics that have been vaulted will not be unvaulted in the future.
-- Exceptions are:
-- * 2016, 2019, and 2020 Frost & Ember Prime Vault with Lith G1, Meso F2, Neo S5, and Axi E1
-- * 2018, 2019, and 2021 Nyx & Rhino Prime Vault Lith B4, Meso N6, Neo R1, and Axi S3
-- * Baro relics Neo O1, Axi A2, Axi A5, Axi M5, Axi V8

local Table = require('Module:Table')

-- Exceptions to the ducat prices due to distribution of rarities, probably if
-- at least 2/3 of drop rarities are a single type, then the ducat value will be basedv
-- on that type; TODO: figure out a pattern in which DE decides these exceptions
-- Nikana Prime Blueprint is an interesting edge case at 25 ducats with 2 rare, 1 uncommon, and 3 common drops
local DUCAT_EXCEPTIONS = {
		Forma = { Blueprint = 0 },
		["Khora Prime"] = {Blueprint = 65},
		["Akstiletto Prime"] = { Receiver = 45 },
		["Knell Prime"] = { Receiver = 45 },
		["Braton Prime"] = { Receiver = 45 },
		["Rubico Prime"] = { Stock = 45 },
		["Saryn Prime"] = { ["Neuroptics Blueprint"] = 45 },
		["Soma Prime"] = { Blueprint = 15 },
		["Mesa Prime"] = { ["Systems Blueprint"] = 100 },
		["Bronco Prime"] = { Barrel = 45 },
		["Gauss Prime"] = {["Blueprint"] = 25 },
		["Panthera Prime"] = { Receiver = 100 },
		["Fang Prime"] = { Blueprint = 15 },
		["Limbo Prime"] = { ["Neuroptics Blueprint"] = 100 },
		["Exilus Weapon Adapter"] = { Blueprint = 0 },
		["Riven Sliver"] = { [""] = 0 },
		["Kuva"] = { [""] = 0 },
		["Ayatan Amber Star"] = { [""] = 0 },
		["Xata"] = { [""] = 0 },
		["Lohk"] = { [""] = 0 },
		["Vome"] = { [""] = 0 },
		["Jahu"] = { [""] = 0 },
		["Fass"] = { [""] = 0 },
		["Ris"] = { [""] = 0 },
		["Netra"] = { [""] = 0 },
		["Khra"] = { [""] = 0 },
	}

local RelicData = {}

-- contains item part drops by relic the 'inverse' of RelicData or a different 
-- view of the same dataset in RelicData contains relic appearances by item part
local PrimeData = {}

-- Some notes on relationship of database entities from point of view of relational databases:
-- A Void Relic has multiple prime item parts that it can drop
-- A prime part can drop from multiple Void Relics 
-- > Thus the relationship between Relic and Part is many-to-many

-- A Primed item is made up of multiple prime parts
-- A specific prime part is associated with a single Primed item
-- > Thus the relationship between Item and Part is one-to-many

-- |Relic|
-- *FullName (string)
-- *Part (string)
-- Name (string)
-- Tier (string)
-- Introduced (string)
-- Vaulted (string)

-- |Item|
-- *Name (string)
-- Part (string)
-- IsVaulted (boolean)

-- |Part|
-- *Item (string)
-- *Relic (string)
-- Rarity (string)
-- DucatCost (number)

RelicData = {
	["Axi A1"] = {
		Drops = {
			{
				Item = "Trinity Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Head",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Axi A1",
		Tier = "Axi",
		Vaulted = "21.6",
	},
	["Axi A2"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Aklex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Aklex Prime",
				Part = "Link",
				Rarity = "Rare",
			},
		},
		Introduced = "19.8.1",
		IsBaro = true,
		Name = "Axi A2",
		Tier = "Axi",
	},
	["Axi A3"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Kogake Prime",
				Part = "Boot",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbolto Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "22.7",
		Name = "Axi A3",
		Tier = "Axi",
		Vaulted = "23.9",
	},
	["Axi A4"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zephyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbolto Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Axi A4",
		Tier = "Axi",
		Vaulted = "25.3",
	},
	["Axi A5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Akvasto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Vasto Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akvasto Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.0.6",
		IsBaro = true,
		Name = "Axi A5",
		Tier = "Axi",
	},
	["Axi A6"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Ornament",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Atlas Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Axi A6",
		Tier = "Axi",
		Vaulted = "28.2",
	},
	["Axi A7"] = {
		Drops = {
			{
				Item = "Akstiletto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Carrier Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fragor Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "26.0.8",
		Name = "Axi A7",
		Tier = "Axi",
		Vaulted = "27.1.1",
	},
	["Axi A8"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Aksomati Prime",
				Part = "Link",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Axi A8",
		Tier = "Axi",
		Vaulted = "27.3.6",
	},
	["Axi A9"] = {
		Drops = {
			{
				Item = "Gram Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Atlas Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Axi A9",
		Tier = "Axi",
		Vaulted = "28.2",
	},
	["Axi A10"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Aksomati Prime",
				Part = "Link",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Axi A10",
		Tier = "Axi",
		Vaulted = "29.9",
	},
	["Axi A11"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Atlas Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Axi A11",
		Tier = "Axi",
		Vaulted = "30.3",
	},
	["Axi A12"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kogake Prime",
				Part = "Boot",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbolto Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "29.5.9",
		Name = "Axi A12",
		Tier = "Axi",
		Vaulted = "31.5.8",
	},
	["Axi A13"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Aksomati Prime",
				Part = "Link",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Axi A13",
		Tier = "Axi",
		Vaulted = "31",
	},
	["Axi A14"] = {
		Drops = {
			{
				Item = "Volnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Karyst Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Aksomati Prime",
				Part = "Link",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Axi A14",
		Tier = "Axi",
		Vaulted = "31",
	},
	["Axi A15"] = {
		Drops = {
			{
				Item = "Baza Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Aksomati Prime",
				Part = "Link",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2",
		Name = "Axi A15",
		Tier = "Axi",
		Vaulted = "32.2",
	},
	["Axi A16"] = {
		Drops = {
			{
				Item = "Scourge Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Afuris Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Axi A16",
		Tier = "Axi",
		Vaulted = "34",
	},
	["Axi A17"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wisp Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Afuris Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Axi A17",
		Tier = "Axi",
		Vaulted = "37.0.9",
	},
	["Axi A18"] = {
		Drops = {
			{
				Item = "Cobra & Crane Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Hildryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Axi A18",
		Tier = "Axi",
		Vaulted = "37.0.9",
	},
	["Axi A19"] = {
		Drops = {
			{
				Item = "Epitaph Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Axi A19",
		Tier = "Axi",
		Vaulted = "38.0.10",
	},
	["Axi A20"] = {
		Drops = {
			{
				Item = "Cedo Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Velox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Kompressa Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Lavos Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Alternox Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Axi A20",
		Tier = "Axi",
		Vaulted = "42.0.6",
	},	
	["Axi A21"] = {
		Drops = {
			{
				Item = "Vadarya Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Styanax Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cedo Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Voruna Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Alternox Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Axi A21",
		Tier = "Axi",
	},	
	["Axi A22"] = {
		Drops = {
			{
				Item = "Venato Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kompressa Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Afentis Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Axi A22",
		Tier = "Axi",
	},	
	["Axi B1"] = {
		Drops = {
			{
				Item = "Euphona Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Buckle",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Axi B1",
		Tier = "Axi",
		Vaulted = "20.6.2",
	},
	["Axi B2"] = {
		Drops = {
			{
				Item = "Fragor Prime",
				Part = "Head",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Axi B2",
		Tier = "Axi",
		Vaulted = "22.16.4",
	},
	["Axi B3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Axi B3",
		Tier = "Axi",
		Vaulted = "29.9",
	},
	["Axi B4"] = {
		Drops = {
			{
				Item = "Akjagara Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Aksomati Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Karyst Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Axi B4",
		Tier = "Axi",
		Vaulted = "29.3",
	},
	["Axi B5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Knell Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Volnus Prime",
				Part = "Head",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Axi B5",
		Tier = "Axi",
		Vaulted = "32.3.6",
	},
	["Axi B6"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Shade Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Axi B6",
		Tier = "Axi",
		Vaulted = "35.0.9",
	},
	["Axi B7"] = {
		Drops = {
			{
				Item = "Wisp Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hystrix Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Axi B7",
		Tier = "Axi",
		Vaulted = "35.5.9",
	},
	["Axi B8"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Okina Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Axi B8",
		Tier = "Axi",
		Vaulted = "36.1",
	},
	["Axi B9"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6.3",
		Name = "Axi B9",
		Tier = "Axi",
		Vaulted = "38.6.3",
	},
	["Axi C1"] = {
		Drops = {
			{
				Item = "Trinity Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vectis Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "Lower Limb",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Axi C1",
		Tier = "Axi",
		Vaulted = "20.6.2",
	},
	["Axi C2"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Fragor Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "Lower Limb",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Axi C2",
		Tier = "Axi",
		Vaulted = "21.6",
	},
	["Axi C3"] = {
		Drops = {
			{
				Item = "Hydroid Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Chroma Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Axi C3",
		Tier = "Axi",
		Vaulted = "24.2.2",
	},
	["Axi C4"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hydroid Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Kogake Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Chroma Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Axi C4",
		Tier = "Axi",
		Vaulted = "24.5.8",
	},
	["Axi C5"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Panthera Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tekko Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Tipedo Prime",
				Part = "Ornament",
				Rarity = "Uncommon",
			},
			{
				Item = "Corinth Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Axi C5",
		Tier = "Axi",
		Vaulted = "29.9",
	},
	["Axi C6"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pandero Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Corinth Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Axi C6",
		Tier = "Axi",
		Vaulted = "31",
	},
	["Axi C7"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Volnus Prime",
				Part = "Head",
				Rarity = "Uncommon",
			},
			{
				Item = "Corinth Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Axi C7",
		Tier = "Axi",
		Vaulted = "31.3",
	},
	["Axi C8"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Volnus Prime",
				Part = "Head",
				Rarity = "Uncommon",
			},
			{
				Item = "Corinth Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "35.1.2",
		Name = "Axi C8",
		Tier = "Axi",
		Vaulted = "35.1.2",
	},
	["Axi C9"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6.3",
		Name = "Axi C9",
		Tier = "Axi",
		Vaulted = "38.6.3",
	},
	["Axi C10"] = {
		Drops = {
			{
				Item = "Lavos Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Epitaph Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Okina Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Daikyu Prime",
				Part = "Lower Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Caliban Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Axi C10",
		Tier = "Axi",
		Vaulted = "42.0.6",
	},
	["Axi C11"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Epitaph Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Perigale Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Daikyu Prime",
				Part = "Lower Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Caliban Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Axi C11",
		Tier = "Axi",
		Vaulted = "43.0",
	},
	["Axi D1"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tiberon Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Destreza Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Axi D1",
		Tier = "Axi",
		Vaulted = "27.0.4",
	},
	["Axi D2"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Destreza Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Axi D2",
		Tier = "Axi",
		Vaulted = "27.3.6",
	},
	["Axi D3"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Axi D3",
		Tier = "Axi",
		Vaulted = "30.9.4",
	},
	["Axi D4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Latron Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Frost Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mag Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Boar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Dakra Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6.6",
		Name = "Axi D4",
		Tier = "Axi",
		Vaulted = "33.6.6",
	},
	["Axi D5"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Akarius Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Afuris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Axi D5",
		Tier = "Axi",
		Vaulted = "35.5.9",
	},
	["Axi D6"] = {
		Drops = {
			{
				Item = "Lavos Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Cedo Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Axi D6",
		Tier = "Axi",
	},
	["Axi E1"] = {
		Drops = {
			{
				Item = "Latron Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Sicarus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Frost Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Glaive Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ember Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.3",
		Name = "Axi E1",
		Tier = "Axi",
		Vaulted = "24.5.6",
	},
	["Axi E2"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Euphona Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Axi E2",
		Tier = "Axi",
		Vaulted = "24.2.2",
	},
	["Axi F1"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fragor Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.8",
		Name = "Axi F1",
		Tier = "Axi",
		Vaulted = "32.2.8",
	},
	["Axi F2"] = {
		Drops = {
			{
				Item = "Masseter Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Wisp Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Velox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Axi F2",
		Tier = "Axi",
		Vaulted = "36.1",
	},
	["Axi F3"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Epitaph Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lavos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Axi F3",
		Tier = "Axi",
		Vaulted = "38.6",
	},
	["Axi G1"] = {
		Drops = {
			{
				Item = "Nekros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kavasa Prime",
				Part = "Kubrow Collar Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Axi G1",
		Tier = "Axi",
		Vaulted = "21.6",
	},
	["Axi G2"] = {
		Drops = {
			{
				Item = "Akbolto Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Wukong Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tipedo Prime",
				Part = "Ornament",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Axi G2",
		Tier = "Axi",
		Vaulted = "25.8",
	},
	["Axi G3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Axi G3",
		Tier = "Axi",
		Vaulted = "27.0.4",
	},
	["Axi G4"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tekko Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Axi G4",
		Tier = "Axi",
		Vaulted = "28.2",
	},
	["Axi G5"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tiberon Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "30.0.8",
		Name = "Axi G5",
		Tier = "Axi",
		Vaulted = "32.0.3",
	},
	["Axi G6"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Axi G6",
		Tier = "Axi",
		Vaulted = "31",
	},
	["Axi G7"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Axi G7",
		Tier = "Axi",
		Vaulted = "31.7",
	},
	["Axi G8"] = {
		Drops = {
			{
				Item = "Corvas Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Axi G8",
		Tier = "Axi",
		Vaulted = "32.3.6",
	},
	["Axi G9"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Axi G9",
		Tier = "Axi",
		Vaulted = "32.3.6",
	},
	["Axi G10"] = {
		Drops = {
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hystrix Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Axi G10",
		Tier = "Axi",
		Vaulted = "35.0.9",
	},
	["Axi G11"] = {
		Drops = {
			{
				Item = "Shade Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Afuris Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Axi G11",
		Tier = "Axi",
		Vaulted = "37.0.9",
	},
	["Axi G12"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Masseter Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Axi G12",
		Tier = "Axi",
		Vaulted = "35.0.9",
	},
	["Axi G13"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hystrix Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.7",
		Name = "Axi G13",
		Tier = "Axi",
		Vaulted = "37.0.7",
	},
	["Axi G14"] = {
		Drops = {
			{
				Item = "Sevagoth Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Zylok Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Axi G14",
		Tier = "Axi",
		Vaulted = "39.1" 
	},
	["Axi G15"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Grendel Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Zylok Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.7",
		Name = "Axi G15",
		Tier = "Axi",
		Vaulted = "42.0.7" 
	},
	["Axi H1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Head",
				Rarity = "Common",
			},
			{
				Item = "Vectis Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Trinity Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Axi H1",
		Tier = "Axi",
		Vaulted = "20.6.2",
	},
	["Axi H2"] = {
		Drops = {
			{
				Item = "Oberon Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Axi H2",
		Tier = "Axi",
		Vaulted = "21.6",
	},
	["Axi H3"] = {
		Drops = {
			{
				Item = "Kronen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Axi H3",
		Tier = "Axi",
		Vaulted = "23.9",
	},
	["Axi H4"] = {
		Drops = {
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Axi H4",
		Tier = "Axi",
		Vaulted = "25.3",
	},
	["Axi H5"] = {
		Drops = {
			{
				Item = "Akbolto Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Euphona Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mirage Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "29.5.9",
		Name = "Axi H5",
		Tier = "Axi",
		Vaulted = "31.5.8",
	},
	["Axi H6"] = {
		Drops = {
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Axi H6",
		Tier = "Axi",
		Vaulted = "35.0.9",
	},
	["Axi H7"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Axi H7",
		Tier = "Axi",
		Vaulted = "30.7",
	},
	["Axi H8"] = {
		Drops = {
			{
				Item = "Akarius Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zylok Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Shade Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Axi H8",
		Tier = "Axi",
		Vaulted = "38.0.10",
	},
	["Axi I1"] = {
		Drops = {
			{
				Item = "Dethcube Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Panthera Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Volnus Prime",
				Part = "Head",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Axi I1",
		Tier = "Axi",
		Vaulted = "30.7",
	},
	["Axi I2"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baza Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Axi I2",
		Tier = "Axi",
		Vaulted = "31",
	},
	["Axi I3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Panthera Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "33.0.14",
		Name = "Axi I3",
		Tier = "Axi",
		Vaulted = "33.0.14",
	},
	["Axi K1"] = {
		Drops = {
			{
				Item = "Odonata Prime",
				Part = "Harness Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hikou Prime",
				Part = "Pouch",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Buckle",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Axi K1",
		Tier = "Axi",
		Vaulted = "The Silver Grove 3",
	},
	["Axi K2"] = {
		Drops = {
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Axi K2",
		Tier = "Axi",
		Vaulted = "23.0.3",
	},
	["Axi K3"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tiberon Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Axi K3",
		Tier = "Axi",
		Vaulted = "23.9",
	},
	["Axi K4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kogake Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Axi K4",
		Tier = "Axi",
		Vaulted = "24.5.8",
	},
	["Axi K5"] = {
		Drops = {
			{
				Item = "Ballistica Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Axi K5",
		Tier = "Axi",
		Vaulted = "25.3",
	},
	["Axi K6"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Karyst Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Axi K6",
		Tier = "Axi",
		Vaulted = "31.7",
	},
	["Axi K7"] = {
		Drops = {
			{
				Item = "Karyst Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Corvas Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Axi K7",
		Tier = "Axi",
		Vaulted = "31.7",
	},
	["Axi K8"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Khora Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Axi K8",
		Tier = "Axi",
		Vaulted = "32.2.5",
	},
	["Axi K9"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Volnus Prime",
				Part = "Head",
				Rarity = "Uncommon",
			},
			{
				Item = "Hystrix Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Axi K9",
		Tier = "Axi",
		Vaulted = "32.3.6",
	},
	["Axi K10"] = {
		Drops = {
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Axi K10",
		Tier = "Axi",
		Vaulted = "32.2.5",
	},
	["Axi K11"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Scourge Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Axi K11",
		Tier = "Axi",
		Vaulted = "34",
	},
	["Axi K12"] = {
		Drops = {
			{
				Item = "Ash Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Carrier Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Karyst Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "33.0.14",
		Name = "Axi K12",
		Tier = "Axi",
		Vaulted = "33.0.14",
	},
	["Axi L1"] = {
		Drops = {
			{
				Item = "Latron Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Reaper Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wyrm Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Glaive Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Loki Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.11.1",
		Name = "Axi L1",
		Tier = "Axi",
		Vaulted = "22.17.3",
	},
	["Axi L2"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tiberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Axi L2",
		Tier = "Axi",
		Vaulted = "25.3",
	},
	["Axi L3"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Kronen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Axi L3",
		Tier = "Axi",
		Vaulted = "25.3",
	},
	["Axi L4"] = {
		Drops = {
			{
				Item = "Bo Prime",
				Part = "Ornament",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wyrm Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Odonata Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Volt Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Loki Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.8.2",
		Name = "Axi L4",
		Tier = "Axi",
		Vaulted = "25.3",
	},
	["Axi L5"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Axi L5",
		Tier = "Axi",
		Vaulted = "27.0.4",
	},
	["Axi L6"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zylok Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Axi L6",
		Tier = "Axi",
		Vaulted = "37.0.9",
	},
	["Axi M1"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Mirage Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Axi M1",
		Tier = "Axi",
		Vaulted = "25.8",
	},
	["Axi M2"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Magnus Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Axi M2",
		Tier = "Axi",
		Vaulted = "31.3",
	},
	["Axi M3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Axi M3",
		Tier = "Axi",
		Vaulted = "30.9.4",
	},
	["Axi M4"] = {
		Drops = {
			{
				Item = "Destreza Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3",
		Name = "Axi M4",
		Tier = "Axi",
		Vaulted = "32.3",
	},
	["Axi M5"] = {
		Drops = {
			{
				Item = "Akmagnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akmagnus Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Magnus Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Magnus Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.8",
		IsBaro = true,
		Name = "Axi M5",
		Tier = "Axi",
	},
	["Axi M6"] = {
		Drops = {
			{
				Item = "Grendel Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cedo Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Masseter Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Axi M6",
		Tier = "Axi",
		Vaulted = "39.1" 
	},
	["Axi N1"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Odonata Prime",
				Part = "Wings Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Axi N1",
		Tier = "Axi",
		Vaulted = "19.11.5",
	},
	["Axi N2"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Hilt",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Axi N2",
		Tier = "Axi",
		Vaulted = "20.6.2",
	},
	["Axi N3"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Axi N3",
		Tier = "Axi",
		Vaulted = "19.11.5",
	},
	["Axi N4"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Nekros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Hilt",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Axi N4",
		Tier = "Axi",
		Vaulted = "22.7",
	},
	["Axi N5"] = {
		Drops = {
			{
				Item = "Euphona Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Oberon Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Axi N5",
		Tier = "Axi",
		Vaulted = "23.0.3",
	},
	["Axi N6"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nikana Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Hilt",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.15",
		Name = "Axi N6",
		Tier = "Axi",
		Vaulted = "24.2.15",
	},
	["Axi N7"] = {
		Drops = {
			{
				Item = "Octavia Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Baza Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Carapace",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Axi N7",
		Tier = "Axi",
		Vaulted = "30.7",
	},
	["Axi N8"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Pandero Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Axi N8",
		Tier = "Axi",
		Vaulted = "32.0.9",
	},
	["Axi N9"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pandero Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Axi N9",
		Tier = "Axi",
		Vaulted = "32.2.5",
	},
	["Axi N10"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Axi N10",
		Tier = "Axi",
		Vaulted = "33.6",
	},
	["Axi N11"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.7",
		Name = "Axi N11",
		Tier = "Axi",
		Vaulted = "37.0.7",
	},
	["Axi N12"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nikana Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.12",
		Name = "Axi N12",
		Tier = "Axi",
		Vaulted = "38.0.12",
	},
	["Axi N13"] = {
		Drops = {
			{
				Item = "Okina Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kompressa Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Axi N13",
		Tier = "Axi",
		Vaulted = "42.0.6",
	},
	["Axi O1"] = {
		Drops = {
			{
				Item = "Euphona Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Axi O1",
		Tier = "Axi",
		Vaulted = "22.16.4",
	},
	["Axi O2"] = {
		Drops = {
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Tiberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Axi O2",
		Tier = "Axi",
		Vaulted = "23.0.3",
	},
	["Axi O3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Axi O3",
		Tier = "Axi",
		Vaulted = "23.9",
	},
	["Axi O4"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zephyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Tiberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Axi O4",
		Tier = "Axi",
		Vaulted = "24.5.8",
	},
	["Axi O5"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Panthera Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Octavia Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Axi O5",
		Tier = "Axi",
		Vaulted = "31.7",
	},
	["Axi O6"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Epitaph Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Zylok Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Okina Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Axi O6",
		Tier = "Axi",
		Vaulted = "39.1" 
	},
	["Axi Y2"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Kompressa Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Epitaph Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Axi Y2",
		Tier = "Axi",
		Vaulted = "41",
	},
	["Axi Y3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Epitaph Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vadarya Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Axi Y3",
		Tier = "Axi",
		Vaulted = "43.0",
	},
	["Axi P1"] = {
		Drops = {
			{
				Item = "Akjagara Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kogake Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Chain",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Axi P1",
		Tier = "Axi",
		Vaulted = "25.8",
	},
	["Axi P2"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dethcube Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Tiberon Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Axi P2",
		Tier = "Axi",
		Vaulted = "27.0.4",
	},
	["Axi P3"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Axi P3",
		Tier = "Axi",
		Vaulted = "27.3.6",
	},
	["Axi P4"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Knell Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pandero Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Axi P4",
		Tier = "Axi",
		Vaulted = "31.3",
	},
	["Axi P5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Vasto Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pandero Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Axi P5",
		Tier = "Axi",
		Vaulted = "34",
	},
	["Axi P6"] = {
		Drops = {
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hystrix Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Masseter Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Axi P6",
		Tier = "Axi",
		Vaulted = "35.5.9",
	},
	["Axi P7"] = {
		Drops = {
			{
				Item = "Tatsu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Axi P7",
		Tier = "Axi",
		Vaulted = "36.1",
	},
	["Axi P8"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Velox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Epitaph Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Axi P8",
		Tier = "Axi",
		Vaulted = "42.0.6",
	},
	["Axi P9"] = {
		Drops = {
			{
				Item = "Trumna Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gunsen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Axi P9",
		Tier = "Axi",
		Vaulted = "38.6",
	},
	["Axi P10"] = {
		Drops = {
			{
				Item = "Caliban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lavos Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Athodai Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Perigale Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Axi P10",
		Tier = "Axi",
	},
	["Axi R1"] = {
		Drops = {
			{
				Item = "Boltor Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Mag Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Boar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Dakra Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ankyros Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Rhino Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.7.4",
		Name = "Axi R1",
		Tier = "Axi",
		Vaulted = "21.2.1",
	},
	["Axi R2"] = {
		Drops = {
			{
				Item = "Destreza Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mirage Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Axi R2",
		Tier = "Axi",
		Vaulted = "25.8",
	},
	["Axi R3"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Zephyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Axi R3",
		Tier = "Axi",
		Vaulted = "27.0.4",
	},
	["Axi R4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Boltor Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Glaive Prime",
				Part = "Disc",
				Rarity = "Uncommon",
			},
			{
				Item = "Ember Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rhino Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.5",
		Name = "Axi R4",
		Tier = "Axi",
		Vaulted = "36.0.5",
	},
	["Axi S1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Trinity Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scindo Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Axi S1",
		Tier = "Axi",
		Vaulted = "The Silver Grove 3",
	},
	["Axi S2"] = {
		Drops = {
			{
				Item = "Latron Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Loki Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wyrm Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ember Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sicarus Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "22.11.1",
		Name = "Axi S2",
		Tier = "Axi",
		Vaulted = "22.17.3",
	},
	["Axi S3"] = {
		Drops = {
			{
				Item = "Boltor Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Hikou Prime",
				Part = "Stars",
				Rarity = "Common",
			},
			{
				Item = "Rhino Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ankyros Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Nyx Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scindo Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "23.1.2",
		Name = "Axi S3",
		Tier = "Axi",
		Vaulted = "31.1.3",
	},
	["Axi S4"] = {
		Drops = {
			{
				Item = "Boar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mag Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dakra Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Nova Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Soma Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "24.0.6",
		Name = "Axi S4",
		Tier = "Axi",
		Vaulted = "24.2.11",
	},
	["Axi S5"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blades",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Pouch",
				Rarity = "Rare",
			},
		},
		Introduced = "25.7.3",
		Name = "Axi S5",
		Tier = "Axi",
		Vaulted = "26.0.8",
	},
	["Axi S6"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nekros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "27.1.1",
		Name = "Axi S6",
		Tier = "Axi",
		Vaulted = "27.5.6",
	},
	["Axi S7"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nova Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Kavasa Prime",
				Part = "Kubrow Collar Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Trinity Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Soma Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "27.5.6",
		Name = "Axi S7",
		Tier = "Axi",
		Vaulted = "29.2",
	},
	["Axi S8"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hikou Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nyx Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Venka Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scindo Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "29.10",
		Name = "Axi S8",
		Tier = "Axi",
	},
	["Axi S9"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Axi S9",
		Tier = "Axi",
		Vaulted = "31.3",
	},
	["Axi S10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Panthera Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Axi S10",
		Tier = "Axi",
		Vaulted = "31.7",
	},
	["Axi S11"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Panthera Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Octavia Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Axi S11",
		Tier = "Axi",
		Vaulted = "31.7",
	},
	["Axi S12"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Axi S12",
		Tier = "Axi",
		Vaulted = "32.0.9",
	},
	["Axi S13"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baza Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2",
		Name = "Axi S13",
		Tier = "Axi",
		Vaulted = "32.2",
	},
	["Axi S14"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Axi S14",
		Tier = "Axi",
		Vaulted = "32.3.6",
	},
	["Axi S15"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.4",
		Name = "Axi S15",
		Tier = "Axi",
		Vaulted = "36.0.4",
	},
	["Axi S16"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Shade Prime",
				Part = "Carapace",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Axi S16",
		Tier = "Axi",
		Vaulted = "38.0.10",
	},
	["Axi S17"] = {
		Drops = {
			{
				Item = "Grendel Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Axi S17",
		Tier = "Axi",
		Vaulted = "38.0.10",
	},
	["Axi S18"] = {
		Drops = {
			{
				Item = "Cedo Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Velox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vadarya Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Axi S18",
		Tier = "Axi",
		Vaulted = "42.0.6",
	},
	["Axi S19"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gunsen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Shade Prime",
				Part = "Carapace",
				Rarity = "Rare",
			},
		},
		Introduced = "40.0.5.1",
		Name = "Axi S19",
		Tier = "Axi",
		Vaulted = "40.0.5.1",
	},
	["Axi S20"] = {
		Drops = {
			{
				Item = "Dual Zoren Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sarofang Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Axi S20",
		Tier = "Axi",
	},
	["Axi T1"] = {
		Drops = {
			{
				Item = "Vectis Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Odonata Prime",
				Part = "Harness Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Axi T1",
		Tier = "Axi",
		Vaulted = "19.11.5",
	},
	["Axi T2"] = {
		Drops = {
			{
				Item = "Kogake Prime",
				Part = "Boot",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tipedo Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Axi T2",
		Tier = "Axi",
		Vaulted = "25.8",
	},
	["Axi T3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tipedo Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Axi T3",
		Tier = "Axi",
		Vaulted = "27.3.6",
	},
	["Axi T4"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wukong Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tipedo Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Axi T4",
		Tier = "Axi",
		Vaulted = "29.9",
	},
	["Axi T5"] = {
		Drops = {
			{
				Item = "Chroma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Axi T5",
		Tier = "Axi",
		Vaulted = "28.2",
	},
	["Axi T6"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tekko Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Axi T6",
		Tier = "Axi",
		Vaulted = "30.3",
	},
	["Axi T7"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Tekko Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Axi T7",
		Tier = "Axi",
		Vaulted = "30.7",
	},
	["Axi T8"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Magnus Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Axi T8",
		Tier = "Axi",
		Vaulted = "32.2.5",
	},
	["Axi T9"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tipedo Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "32",
		Name = "Axi T9",
		Tier = "Axi",
		Vaulted = "32.1.1",
	},
	["Axi T10"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tatsu Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Axi T10",
		Tier = "Axi",
		Vaulted = "33.6",
	},
	["Axi T11"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Scourge Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.4",
		Name = "Axi T11",
		Tier = "Axi",
		Vaulted = "36.0.4",
	},
	["Axi T12"] = {
		Drops = {
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gunsen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Axi T12",
		Tier = "Axi",
		Vaulted = "38.0.10",
	},
	["Axi T13"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gyre Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Axi T13",
		Tier = "Axi",
	},	
	["Axi V1"] = {
		Drops = {
			{
				Item = "Odonata Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Carrier Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Axi V1",
		Tier = "Axi",
		Vaulted = "19.11.5",
	},
	["Axi V2"] = {
		Drops = {
			{
				Item = "Hikou Prime",
				Part = "Pouch",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mag Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Boar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Axi V2",
		Tier = "Axi",
		Vaulted = "Specters of the Rail 13",
	},
	["Axi V3"] = {
		Drops = {
			{
				Item = "Trinity Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail 13",
		Name = "Axi V3",
		Tier = "Axi",
		Vaulted = "19.0.7",
	},
	["Axi V4"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Odonata Prime",
				Part = "Harness Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Axi V4",
		Tier = "Axi",
		Vaulted = "19.11.5",
	},
	["Axi V5"] = {
		Drops = {
			{
				Item = "Venka Prime",
				Part = "Blades",
				Rarity = "Common",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Axi V5",
		Tier = "Axi",
		Vaulted = "21.6",
	},
	["Axi V6"] = {
		Drops = {
			{
				Item = "Ballistica Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Axi V6",
		Tier = "Axi",
		Vaulted = "23.0.3",
	},
	["Axi V7"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kogake Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Venka Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "22.7",
		Name = "Axi V7",
		Tier = "Axi",
		Vaulted = "23.9",
	},
	["Axi V8"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Odonata Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Odonata Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Volt Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.15.1",
		IsBaro = true,
		Name = "Axi V8",
		Tier = "Axi",
	},
	["Axi V9"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Venka Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "25.7.3",
		Name = "Axi V9",
		Tier = "Axi",
		Vaulted = "26.0.8",
	},
	["Axi V10"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Hikou Prime",
				Part = "Stars",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Venka Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "29.10",
		Name = "Axi V10",
		Tier = "Axi",
	},
	["Axi V11"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Volnus Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "35.1.2",
		Name = "Axi V11",
		Tier = "Axi",
		Vaulted = "35.1.2",
	},
	["Axi V12"] = {
		Drops = {
			{
				Item = "Zylok Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Velox Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Axi V12",
		Tier = "Axi",
		Vaulted = "39.1" 
	},
	["Axi V13"] = {
		Drops = {
			{
				Item = "Protea Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nautilus Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Venato Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Axi V13",
		Tier = "Axi",
		Vaulted = "41",
	},
	["Axi V14"] = {
		Drops = {
			{
				Item = "Alternox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kompressa Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Voruna Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Axi V14",
		Tier = "Axi",
	},
	["Axi W1"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Axi W1",
		Tier = "Axi",
		Vaulted = "29.9",
	},
	["Axi W2"] = {
		Drops = {
			{
				Item = "Baza Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tekko Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Axi W2",
		Tier = "Axi",
		Vaulted = "30.3",
	},
	["Axi W4"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "40.0.5.1",
		Name = "Axi W4",
		Tier = "Axi",
		Vaulted = "40.0.5.1",
	},
	["Axi W3"] = {
		Drops = {
			{
				Item = "Baruuk Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Knell Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Shade Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Axi W3",
		Tier = "Axi",
		Vaulted = "34",
	},
	["Axi Y1"] = {
		Drops = {
			{
				Item = "Sevagoth Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lavos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Axi Y1",
		Tier = "Axi",
		Vaulted = "43.0",
	},
	["Axi Z1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Panthera Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wukong Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baza Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Axi Z1",
		Tier = "Axi",
		Vaulted = "30.3",
	},
	["Axi Z2"] = {
		Drops = {
			{
				Item = "Fulmin Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Receiver",
				Rarity = 'Uncommon',
			},
			{
				Item = "Zylok Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Axi Z2",
		Tier = "Axi",
		Vaulted = "38.6",
	},
	["Lith A1"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Lith A1",
		Tier = "Lith",
		Vaulted = "19.0.7",
	},
	["Lith A2"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Lith A2",
		Tier = "Lith",
		Vaulted = "22.16.4",
	},
	["Lith A3"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Tiberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akjagara Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Lith A3",
		Tier = "Lith",
		Vaulted = "25.8",
	},
	["Lith A4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baza Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Astilla Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Lith A4",
		Tier = "Lith",
		Vaulted = "31",
	},
	["Lith A5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tekko Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Atlas Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.8",
		Name = "Lith A5",
		Tier = "Lith",
		Vaulted = "32.2.8",
	},
	["Lith A6"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Lith A6",
		Tier = "Lith",
		Vaulted = "38.0.10",
	},
	["Lith A7"] = {
		Drops = {
			{
				Item = "Nautilus Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Cedo Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wisp Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Lith A7",
		Tier = "Lith",
		Vaulted = "38.6",
	},
	["Lith A8"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Daikyu Prime",
				Part = "Lower Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Lith A8",
		Tier = "Lith",
		Vaulted = "39.1" 
	},
	["Lith A9"] = {
		Drops = {
			{
				Item = "Cobra & Crane Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Afuris Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6.3",
		Name = "Lith A9",
		Tier = "Lith",
		Vaulted = "38.6.3",
	},
	["Lith A10"] = {
		Drops = {
			{
				Item = "Yareli Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Lith A10",
		Tier = "Lith",
		Vaulted = "41", 
	},
	["Lith A11"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Zylok Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Akarius Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.7",
		Name = "Lith A11",
		Tier = "Lith",
		Vaulted = "42.0.7", 
	},
	["Lith A12"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Daikyu Prime",
				Part = "Lower Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Alternox Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Lith A12",
		Tier = "Lith",
	},
	["Lith B1"] = {
		Drops = {
			{
				Item = "Mag Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ankyros Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rhino Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Boltor Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Boar Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "20.7.4",
		Name = "Lith B1",
		Tier = "Lith",
		Vaulted = "21.2.1",
	},
	["Lith B2"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Ballistica Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Lith B2",
		Tier = "Lith",
		Vaulted = "23.0.3",
	},
	["Lith B3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Ballistica Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Lith B3",
		Tier = "Lith",
		Vaulted = "23.9",
	},
	["Lith B4"] = {
		Drops = {
			{
				Item = "Ankyros Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nyx Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rhino Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scindo Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Boltor Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.1.2",
		Name = "Lith B4",
		Tier = "Lith",
		Vaulted = "31.1.3",
	},
	["Lith B5"] = {
		Drops = {
			{
				Item = "Oberon Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Ballistica Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Lith B5",
		Tier = "Lith",
		Vaulted = "24.2.2",
	},
	["Lith B6"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ballistica Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Lith B6",
		Tier = "Lith",
		Vaulted = "25.3",
	},
	["Lith B7"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Aksomati Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Lith B7",
		Tier = "Lith",
		Vaulted = "29.9",
	},
	["Lith B8"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Dethcube Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Lith B8",
		Tier = "Lith",
		Vaulted = "30.7",
	},
	["Lith B9"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Oberon Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2",
		Name = "Lith B9",
		Tier = "Lith",
		Vaulted = "32.2",
	},
	["Lith B10"] = {
		Drops = {
			{
				Item = "Astilla Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Lith B10",
		Tier = "Lith",
		Vaulted = "32.3.6",
	},
	["Lith B11"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Knell Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Lith B11",
		Tier = "Lith",
		Vaulted = "34",
	},
	["Lith C1"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Nova Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nova Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kavasa Prime",
				Part = "Band",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Carrier Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Lith C1",
		Tier = "Lith",
		Vaulted = "19.0.7",
	},
	["Lith C2"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blades",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "Lower Limb",
				Rarity = "Rare",
			},
		},
		Introduced = "22.7",
		Name = "Lith C2",
		Tier = "Lith",
		Vaulted = "23.9",
	},
	["Lith C3"] = {
		Drops = {
			{
				Item = "Sybaris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Chroma Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Lith C3",
		Tier = "Lith",
		Vaulted = "24.2.2",
	},
	["Lith C4"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Chroma Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Lith C4",
		Tier = "Lith",
		Vaulted = "28.2",
	},
	["Lith C5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Venka Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "Lower Limb",
				Rarity = "Rare",
			},
		},
		Introduced = "25.7.3",
		Name = "Lith C5",
		Tier = "Lith",
		Vaulted = "26.0.8",
	},
	["Lith C6"] = {
		Drops = {
			{
				Item = "Equinox Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Corinth Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Lith C6",
		Tier = "Lith",
		Vaulted = "29.3",
	},
	["Lith C7"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hikou Prime",
				Part = "Pouch",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nyx Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scindo Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "Lower Limb",
				Rarity = "Rare",
			},
		},
		Introduced = "29.10",
		Name = "Lith C7",
		Tier = "Lith",
	},
	["Lith C8"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Tiberon Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zephyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Chroma Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.0.8",
		Name = "Lith C8",
		Tier = "Lith",
		Vaulted = "32.0.3",
	},
	["Lith C9"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Pandero Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Corinth Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Lith C9",
		Tier = "Lith",
		Vaulted = "31.3",
	},
	["Lith C10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Lith C10",
		Tier = "Lith",
		Vaulted = "35.0.9",
	},
	["Lith C11"] = {
		Drops = {
			{
				Item = "Gunsen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Lith C11",
		Tier = "Lith",
		Vaulted = "36.1",
	},
	["Lith C12"] = {
		Drops = {
			{
				Item = "Okina Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Grendel Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Lith C12",
		Tier = "Lith",
		Vaulted = "37.0.9",
	},
	["Lith C13"] = {
		Drops = {
			{
				Item = "Gauss Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Caliban Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Lith C13",
		Tier = "Lith",
		Vaulted = "41",
	},
	["Lith C14"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kestrel Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lavos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Perigale Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Cedo Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Lith C14",
		Tier = "Lith",
		Vaulted = "43.0",
	},
	["Lith D1"] = {
		Drops = {
			{
				Item = "Atlas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Chain",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Lith D1",
		Tier = "Lith",
		Vaulted = "29.3",
	},
	["Lith D2"] = {
		Drops = {
			{
				Item = "Equinox Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wukong Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Lith D2",
		Tier = "Lith",
		Vaulted = "29.3",
	},
	["Lith D3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Chain",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Lith D3",
		Tier = "Lith",
		Vaulted = "29.9",
	},
	["Lith D4"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Chain",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Lith D4",
		Tier = "Lith",
		Vaulted = "30.3",
	},
	["Lith D5"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Destreza Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3",
		Name = "Lith D5",
		Tier = "Lith",
		Vaulted = "32.3",
	},
	["Lith D6"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.7",
		Name = "Lith D6",
		Tier = "Lith",
		Vaulted = "37.0.7",
	},
	["Lith D7"] = {
		Drops = {
			{
				Item = "Epitaph Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kestrel Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Velox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Daikyu Prime",
				Part = "Grip",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Lith D7",
		Tier = "Lith",
		Vaulted = "42.0.6",
	},	
	["Lith E1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Boltor Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Ankyros Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Rhino Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ember Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.5",
		Name = "Lith E1",
		Tier = "Lith",
		Vaulted = "36.0.5",
	},
		["Lith E2"] = {
		Drops = {
			{
				Item = "Daikyu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
			   Item = "Venato Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{				
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Epitaph Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Lith E2",
		Tier = "Lith",
		Vaulted = "43.0",
	},
	["Lith F1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Scindo Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Odonata Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fragor Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Lith F1",
		Tier = "Lith",
		Vaulted = "The Silver Grove 3",
	},
	["Lith F2"] = {
		Drops = {
			{
				Item = "Odonata Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hikou Prime",
				Part = "Stars",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Lith F2",
		Tier = "Lith",
		Vaulted = "The Silver Grove 3",
	},
	["Lith F3"] = {
		Drops = {
			{
				Item = "Shade Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "40.0.5.1",
		Name = "Lith F3",
		Tier = "Lith",
		Vaulted = "40.0.5.1",
	},
	["Lith G1"] = {
		Drops = {
			{
				Item = "Latron Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Frost Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Reaper Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Ember Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Glaive Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.3",
		Name = "Lith G1",
		Tier = "Lith",
		Vaulted = "24.5.6",
	},
	["Lith G2"] = {
		Drops = {
			{
				Item = "Bo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Latron Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Wyrm Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Frost Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Loki Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Glaive Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.11.1",
		Name = "Lith G2",
		Tier = "Lith",
		Vaulted = "22.17.3",
	},
	["Lith G3"] = {
		Drops = {
			{
				Item = "Octavia Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Guandao Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Lith G3",
		Tier = "Lith",
		Vaulted = "30.3",
	},
	["Lith G4"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Guandao Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Lith G4",
		Tier = "Lith",
		Vaulted = "31.3",
	},
	["Lith G5"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Lith G5",
		Tier = "Lith",
		Vaulted = "32.2.5",
	},
	["Lith G6"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Knell Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Lith G6",
		Tier = "Lith",
		Vaulted = "34",
	},
	["Lith G7"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Guandao Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Lith G7",
		Tier = "Lith",
		Vaulted = "34",
	},
	["Lith G8"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Lith G8",
		Tier = "Lith",
		Vaulted = "35.0.9",
	},
	["Lith G9"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Khora Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Lith G9",
		Tier = "Lith",
		Vaulted = "35.5.9",
	},
	["Lith G10"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gunsen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Lith G10",
		Tier = "Lith",
		Vaulted = "37.0.9",
	},
	["Lith G11"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.1.2",
		Name = "Lith G11",
		Tier = "Lith",
		Vaulted = "35.1.2",
	},
	["Lith G12"] = {
		Drops = {
			{
				Item = "Zylok Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Lith G12",
		Tier = "Lith",
		Vaulted = "37.0.9",
	},
	["Lith G13"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Grendel Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gunsen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Lith G13",
		Tier = "Lith",
		Vaulted = "38.6",
	},
	["Lith G14"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lavos Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Vadarya Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Gyre Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Lith G14",
		Tier = "Lith",
	},	
	["Lith H1"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Lith H1",
		Tier = "Lith",
		Vaulted = "22.7",
	},
	["Lith H2"] = {
		Drops = {
			{
				Item = "Zephyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Lith H2",
		Tier = "Lith",
		Vaulted = "24.2.2",
	},
	["Lith H3"] = {
		Drops = {
			{
				Item = "Astilla Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Lith H3",
		Tier = "Lith",
		Vaulted = "31.3",
	},
	["Lith H4"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Lith H4",
		Tier = "Lith",
		Vaulted = "31.7",
	},
	["Lith H5"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pandero Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Lith H5",
		Tier = "Lith",
		Vaulted = "32.2.5",
	},
	["Lith H6"] = {
		Drops = {
			{
				Item = "Volnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Hystrix Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Lith H6",
		Tier = "Lith",
		Vaulted = "32.3.6",
	},
	["Lith H7"] = {
		Drops = {
			{
				Item = "Cobra & Crane Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Lith H7",
		Tier = "Lith",
		Vaulted = "32.3.6",
	},
	["Lith H8"] = {
		Drops = {
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Hystrix Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Lith H8",
		Tier = "Lith",
		Vaulted = "33.6",
	},
	["Lith H9"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hystrix Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Lith H9",
		Tier = "Lith",
		Vaulted = "35.0.9",
	},
	["Lith H10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Nekros Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.4",
		Name = "Lith H10",
		Tier = "Lith",
		Vaulted = "36.0.4",
	},
	["Lith I1"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pandero Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Karyst Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Lith I1",
		Tier = "Lith",
		Vaulted = "31",
	},
	["Lith K1"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Odonata Prime",
				Part = "Harness Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Trinity Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Buckle",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Lith K1",
		Tier = "Lith",
		Vaulted = "19.11.5",
	},
	["Lith K2"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Zephyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kogake Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Lith K2",
		Tier = "Lith",
		Vaulted = "25.8",
	},
	["Lith K3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Tiberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Lith K3",
		Tier = "Lith",
		Vaulted = "27.0.4",
	},
	["Lith K4"] = {
		Drops = {
			{
				Item = "Dual Kamas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nova Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Soma Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Trinity Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Buckle",
				Rarity = "Rare",
			},
		},
		Introduced = "27.5.6",
		Name = "Lith K4",
		Tier = "Lith",
		Vaulted = "29.2",
	},
	["Lith K5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kogake Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "29.5.9",
		Name = "Lith K5",
		Tier = "Lith",
		Vaulted = "31.5.8",
	},
	["Lith K6"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Karyst Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Lith K6",
		Tier = "Lith",
		Vaulted = "30.7",
	},
	["Lith K7"] = {
		Drops = {
			{
				Item = "Baza Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Octavia Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Karyst Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Lith K7",
		Tier = "Lith",
		Vaulted = "31",
	},
	["Lith K8"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Buckle",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Lith K8",
		Tier = "Lith",
		Vaulted = "30.9.4",
	},
	["Lith K9"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Guandao Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Khora Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Lith K9",
		Tier = "Lith",
		Vaulted = "32.0.9",
	},
	["Lith K10"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Lith K10",
		Tier = "Lith",
		Vaulted = "33.6",
	},
	["Lith K11"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.4",
		Name = "Lith K11",
		Tier = "Lith",
		Vaulted = "36.0.4",
	},
	["Lith K12"] = {
		Drops = {
			{
				Item = "Trumna Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Caliban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cedo Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Kompressa Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Lith K12",
		Tier = "Lith",
	},
	["Lith L1"] = {
		Drops = {
			{
				Item = "Destreza Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kogake Prime",
				Part = "Boot",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Lith L1",
		Tier = "Lith",
		Vaulted = "25.8",
	},
	["Lith L2"] = {
		Drops = {
			{
				Item = "Equinox Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Tekko Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Lith L2",
		Tier = "Lith",
		Vaulted = "27.3.6",
	},
	["Lith L3"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kavasa Prime",
				Part = "Band",
				Rarity = "Uncommon",
			},
			{
				Item = "Trinity Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Lith L3",
		Tier = "Lith",
		Vaulted = "30.9.4",
	},
	["Lith L4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mag Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Boar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Reaper Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Latron Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6.6",
		Name = "Lith L4",
		Tier = "Lith",
		Vaulted = "33.6.6",
	},
	["Lith L5"] = {
		Drops = {
			{
				Item = "Okina Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Zylok Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Lavos Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Lith L5",
		Tier = "Lith",
		Vaulted = "39.1" 
	},
	["Lith L6"] = {
		Drops = {
			{
				Item = "Gunsen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "40.0.5.1",
		Name = "Lith L6",
		Tier = "Lith",
		Vaulted = "40.0.5.1",
	},
	["Lith L7"] = {
		Drops = {
			{
				Item = "Okina Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nautilus Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vadarya Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Lavos Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Lith L7",
		Tier = "Lith",
		Vaulted = "42.0.6",
	},	
	["Lith M1"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Boar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Soma Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dakra Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mag Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Lith M1",
		Tier = "Lith",
		Vaulted = "Specters of the Rail 13",
	},
	["Lith M2"] = {
		Drops = {
			{
				Item = "Dakra Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Nova Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Soma Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Boar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mag Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.0.6",
		Name = "Lith M2",
		Tier = "Lith",
		Vaulted = "24.2.11",
	},
	["Lith M3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Oberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Lith M3",
		Tier = "Lith",
		Vaulted = "24.5.8",
	},
	["Lith M4"] = {
		Drops = {
			{
				Item = "Akjagara Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Lith M4",
		Tier = "Lith",
		Vaulted = "27.3.6",
	},
	["Lith M5"] = {
		Drops = {
			{
				Item = "Atlas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Lith M5",
		Tier = "Lith",
		Vaulted = "29.3",
	},
	["Lith M6"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Carapace",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Lith M6",
		Tier = "Lith",
		Vaulted = "29.3",
	},
	["Lith M7"] = {
		Drops = {
			{
				Item = "Akbolto Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kogake Prime",
				Part = "Boot",
				Rarity = "Common",
			},
			{
				Item = "Euphona Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mirage Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.5.9",
		Name = "Lith M7",
		Tier = "Lith",
		Vaulted = "31.5.8",
	},
	["Lith M8"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Dakra Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Reaper Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Frost Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mag Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6.6",
		Name = "Lith M8",
		Tier = "Lith",
		Vaulted = "33.6.6",
	},
	["Lith M9"] = {
		Drops = {
			{
				Item = "Gauss Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Masseter Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Lith M9",
		Tier = "Lith",
		Vaulted = "38.0.10",
	},
	["Lith M10"] = {
		Drops = {
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Masseter Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Lith M10",
		Tier = "Lith",
		Vaulted = "39.1" 
	},
	["Lith N1"] = {
		Drops = {
			{
				Item = "Nekros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nova Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Lith N1",
		Tier = "Lith",
		Vaulted = "19.0.7",
	},
	["Lith N2"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Carrier Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Band",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Lith N2",
		Tier = "Lith",
		Vaulted = "20.6.2",
	},
	["Lith N3"] = {
		Drops = {
			{
				Item = "Sybaris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Lith N3",
		Tier = "Lith",
		Vaulted = "23.0.3",
	},
	["Lith N4"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gram Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.9",
		Name = "Lith N4",
		Tier = "Lith",
		Vaulted = "28.2",
	},
	["Lith N5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Lith N5",
		Tier = "Lith",
		Vaulted = "29.9",
	},
	["Lith N6"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Lith N6",
		Tier = "Lith",
		Vaulted = "30.3",
	},
	["Lith N7"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Lith N7",
		Tier = "Lith",
		Vaulted = "31",
	},
	["Lith N8"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Pandero Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Lith N8",
		Tier = "Lith",
		Vaulted = "31",
	},
	["Lith N9"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Lith N9",
		Tier = "Lith",
		Vaulted = "30.9.4",
	},
	["Lith N10"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Lith N10",
		Tier = "Lith",
		Vaulted = "31.3",
	},
	["Lith N11"] = {
		Drops = {
			{
				Item = "Pandero Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Astilla Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Lith N11",
		Tier = "Lith",
		Vaulted = "32.0.9",
	},
	["Lith N12"] = {
		Drops = {
			{
				Item = "Nezha Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Lith N12",
		Tier = "Lith",
		Vaulted = "32.0.9",
	},
	["Lith N13"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Ornament",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "32",
		Name = "Lith N13",
		Tier = "Lith",
		Vaulted = "32.1.1",
	},
	["Lith N14"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Hystrix Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Lith N14",
		Tier = "Lith",
		Vaulted = "35.0.9",
	},
	["Lith N15"] = {
		Drops = {
			{
				Item = "Wisp Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Lith N15",
		Tier = "Lith",
		Vaulted = "37.0.9",
	},
	["Lith N16"] = {
		Drops = {
			{
				Item = "Gunsen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Lith N16",
		Tier = "Lith",
		Vaulted = "38.6",
	},
	["Lith N17"] = {
		Drops = {
			{
				Item = "Xaku Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Lith N17",
		Tier = "Lith", 
		Vaulted = "41",
	},
	["Lith N18"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Alternox Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Quassus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Lith N18",
		Tier = "Lith",
		Vaulted = "43.0",
	},
	["Lith N19"] = {
		Drops = {
			{
				Item = "Daikyu Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Vadarya Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				ItemCount = 2,
				Rarity = "Uncommon",
			},
			{
				Item = "Voruna Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Lith N19",
		Tier = "Lith",
		Vaulted = "43.0",
	},
	["Lith O1"] = {
		Drops = {
			{
				Item = "Ballistica Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbolto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Lith O1",
		Tier = "Lith",
		Vaulted = "24.5.8",
	},
	["Lith O2"] = {
		Drops = {
			{
				Item = "Bo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wyrm Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Loki Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Odonata Prime",
				Part = "Wings Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.8.2",
		Name = "Lith O2",
		Tier = "Lith",
		Vaulted = "25.3",
	},
	["Lith O3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Octavia Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Lith O3",
		Tier = "Lith",
		Vaulted = "34",
	},
	["Lith O4"] = {
		Drops = {
			{
				Item = "Akarius Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Vadarya Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Okina Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Lith O4",
		Tier = "Lith",
		Vaulted = "41",
	},
	["Lith P1"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Lith P1",
		Tier = "Lith",
		Vaulted = "24.2.2",
	},
	["Lith P2"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Lith P2",
		Tier = "Lith",
		Vaulted = "25.3",
	},
	["Lith P3"] = {
		Drops = {
			{
				Item = "Atlas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Lith P3",
		Tier = "Lith",
		Vaulted = "29.3",
	},
	["Lith P4"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Lith P4",
		Tier = "Lith",
		Vaulted = "29.9",
	},
	["Lith P5"] = {
		Drops = {
			{
				Item = "Atlas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tekko Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Lith P5",
		Tier = "Lith",
		Vaulted = "30.7",
	},
	["Lith P6"] = {
		Drops = {
			{
				Item = "Gara Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Volnus Prime",
				Part = "Head",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Lith P6",
		Tier = "Lith",
		Vaulted = "32.3.6",
	},
	["Lith P7"] = {
		Drops = {
			{
				Item = "Akjagara Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3",
		Name = "Lith P7",
		Tier = "Lith",
		Vaulted = "32.3",
	},
	["Lith P8"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Lith P8",
		Tier = "Lith",
		Vaulted = "36.1",
	},
	["Lith P9"] = {
		Drops = {
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Lith P9",
		Tier = "Lith",
		Vaulted = "38.0.10",
	},
	["Lith Q1"] = {
		Drops = {
			{
				Item = "Wisp Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Zylok Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Quassus Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Lith Q1",
		Tier = "Lith",
		Vaulted = "38.6",
	},
	["Lith Q2"] = {
		Drops = {
			{
				Item = "Trumna Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Nautilus Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Epitaph Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Quassus Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Lith Q2",
		Tier = "Lith",
		Vaulted = "43.0",
	},
	["Lith Q3"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Afentis Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cedo Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Gyre Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Quassus Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Lith Q3",
		Tier = "Lith",
	},
	["Lith R1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hydroid Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Ballistica Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Lith R1",
		Tier = "Lith",
		Vaulted = "30.9.4",
	},
	["Lith R2"] = {
		Drops = {
			{
				Item = "Scourge Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Lith R2",
		Tier = "Lith",
		Vaulted = "32.2.5",
	},
	["Lith R3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Scourge Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Lith R3",
		Tier = "Lith",
		Vaulted = "34",
	},
	["Lith R4"] = {
		Drops = {
			{
				Item = "Khora Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zylok Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Lith R4",
		Tier = "Lith",
		Vaulted = "35.0.9",
	},
	["Lith R5"] = {
		Drops = {
			{
				Item = "Zylok Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Lith R5",
		Tier = "Lith",
		Vaulted = "36.1",
	},
	["Lith S1"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Hikou Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Pouch",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Lith S1",
		Tier = "Lith",
		Vaulted = "The Silver Grove 3",
	},
	["Lith S2"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nyx Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Band",
				Rarity = "Uncommon",
			},
			{
				Item = "Soma Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Lith S2",
		Tier = "Lith",
		Vaulted = "The Silver Grove 3",
	},
	["Lith S3"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Soma Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Pouch",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Lith S3",
		Tier = "Lith",
		Vaulted = "19.0.7",
	},
	["Lith S4"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Kubrow Collar Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Lith S4",
		Tier = "Lith",
		Vaulted = "21.6",
	},
	["Lith S5"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Lith S5",
		Tier = "Lith",
		Vaulted = "20.6.2",
	},
	["Lith S6"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kavasa Prime",
				Part = "Band",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Pouch",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Lith S6",
		Tier = "Lith",
		Vaulted = "21.6",
	},
	["Lith S7"] = {
		Drops = {
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "22.7",
		Name = "Lith S7",
		Tier = "Lith",
		Vaulted = "23.0.3",
	},
	["Lith S8"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gram Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Lith S8",
		Tier = "Lith",
		Vaulted = "28.2",
	},
	["Lith S9"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Oberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "27.1.1",
		Name = "Lith S9",
		Tier = "Lith",
		Vaulted = "27.5.6",
	},
	["Lith S10"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dethcube Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baza Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Lith S10",
		Tier = "Lith",
		Vaulted = "29.3",
	},
	["Lith S11"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Lith S11",
		Tier = "Lith",
		Vaulted = "31.3",
	},
	["Lith S12"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Lith S12",
		Tier = "Lith",
		Vaulted = "32.3.6",
	},
	["Lith S13"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wukong Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Equinox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32",
		Name = "Lith S13",
		Tier = "Lith",
		Vaulted = "32.1.1",
	},
	["Lith S14"] = {
		Drops = {
			{
				Item = "Knell Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Lith S14",
		Tier = "Lith",
		Vaulted = "34",
	},
	["Lith S15"] = {
		Drops = {
			{
				Item = "Hystrix Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Shade Prime",
				Part = "Carapace",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Lith S15",
		Tier = "Lith",
		Vaulted = "34",
	},
	["Lith S16"] = {
		Drops = {
			{
				Item = "Xaku Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Lith S16",
		Tier = "Lith",
		Vaulted = "39.1" 
	},
	["Lith S17"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.12",
		Name = "Lith S17",
		Tier = "Lith",
		Vaulted = "38.0.12",
	},
	["Lith S18"] = {
		Drops = {
			{
				Item = "Kestrel Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Vadarya Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Styanax Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Lith S18",
		Tier = "Lith",
	},
	["Lith T1"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Lith T1",
		Tier = "Lith",
		Vaulted = "23.0.3",
	},
	["Lith T2"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tiberon Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Lith T2",
		Tier = "Lith",
		Vaulted = "23.9",
	},
	["Lith T3"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Oberon Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.1.1",
		Name = "Lith T3",
		Tier = "Lith",
		Vaulted = "27.5.6",
	},
	["Lith T4"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Tekko Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Dethcube Prime",
				Part = "Carapace",
				Rarity = "Uncommon",
			},
			{
				Item = "Karyst Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Lith T4",
		Tier = "Lith",
		Vaulted = "30.7",
	},
	["Lith T5"] = {
		Drops = {
			{
				Item = "Corinth Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Lith T5",
		Tier = "Lith",
		Vaulted = "30.3",
	},
	["Lith T6"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Tiberon Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "30.0.8",
		Name = "Lith T6",
		Tier = "Lith",
		Vaulted = "32.0.3",
	},
	["Lith T7"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Lith T7",
		Tier = "Lith",
		Vaulted = "31",
	},
	["Lith T8"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Lith T8",
		Tier = "Lith",
		Vaulted = "31.3",
	},
	["Lith T9"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Lith T9",
		Tier = "Lith",
		Vaulted = "32.0.9",
	},
	["Lith T10"] = {
		Drops = {
			{
				Item = "Phantasma Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Tatsu Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Lith T10",
		Tier = "Lith",
		Vaulted = "35.5.9",
	},
	["Lith T11"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.1.2",
		Name = "Lith T11",
		Tier = "Lith",
		Vaulted = "35.1.2",
	},
	["Lith T12"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Velox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Tatsu Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Lith T12",
		Tier = "Lith",
		Vaulted = "36.1",
	},
	["Lith T13"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tatsu Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6.3",
		Name = "Lith T13",
		Tier = "Lith",
		Vaulted = "38.6.3",
	},
	["Lith T14"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lavos Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Perigale Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Lith T14",
		Tier = "Lith",
	},
	["Lith V1"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fragor Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Lith V1",
		Tier = "Lith",
		Vaulted = "19.11.5",
	},
	["Lith V2"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Lith V2",
		Tier = "Lith",
		Vaulted = "22.16.4",
	},
	["Lith V3"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Lith V3",
		Tier = "Lith",
		Vaulted = "23.0.3",
	},
	["Lith V4"] = {
		Drops = {
			{
				Item = "Spira Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nekros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blades",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Lith V4",
		Tier = "Lith",
		Vaulted = "22.7",
	},
	["Lith V5"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Ballistica Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Lith V5",
		Tier = "Lith",
		Vaulted = "23.9",
	},
	["Lith V6"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Nikana Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blades",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.7.3",
		Name = "Lith V6",
		Tier = "Lith",
		Vaulted = "26.0.8",
	},
	["Lith V7"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Head",
				Rarity = "Common",
			},
			{
				Item = "Vectis Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "26.0.8",
		Name = "Lith V7",
		Tier = "Lith",
		Vaulted = "27.1.1",
	},
	["Lith V8"] = {
		Drops = {
			{
				Item = "Ash Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "26.0.8",
		Name = "Lith V8",
		Tier = "Lith",
		Vaulted = "27.1.1",
	},
	["Lith V9"] = {
		Drops = {
			{
				Item = "Atlas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Carapace",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.8",
		Name = "Lith V9",
		Tier = "Lith",
		Vaulted = "32.2.8",
	},
	["Lith V10"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Carrier Prime",
				Part = "Carapace",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "33.0.14",
		Name = "Lith V10",
		Tier = "Lith",
		Vaulted = "33.0.14",
	},
	["Lith V11"] = {
		Drops = {
			{
				Item = "Kompressa Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Caliban Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Voruna Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Lith V11",
		Tier = "Lith",
	},
	["Lith W1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gram Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Lith W1",
		Tier = "Lith",
		Vaulted = "25.8",
	},
	["Lith W2"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Baza Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Lith W2",
		Tier = "Lith",
		Vaulted = "28.2",
	},
	["Lith W3"] = {
		Drops = {
			{
				Item = "Dual Keres Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Lith W3",
		Tier = "Lith",
		Vaulted = "35.0.9",
	},
	["Lith W4"] = {
		Drops = {
			{
				Item = "Protea Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Epitaph Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Lith W4",
		Tier = "Lith",
		Vaulted = "38.6",
	},
	["Lith X1"] = {
		Drops = {
			{
				Item = "Larkspur Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Lith X1",
		Tier = "Lith",
		Vaulted = "38.0.10",
	},
	["Lith Y1"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nautilus Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Zylok Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Lith Y1",
		Tier = "Lith",
		Vaulted = "39.1" 
	},
	["Lith Z1"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Lith Z1",
		Tier = "Lith",
		Vaulted = "23.9",
	},
	["Lith Z2"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Lith Z2",
		Tier = "Lith",
		Vaulted = "24.2.2",
	},
	["Lith Z3"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Volnus Prime",
				Part = "Head",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Lith Z3",
		Tier = "Lith",
		Vaulted = "32.0.9",
	},
	["Lith Z4"] = {
		Drops = {
			{
				Item = "Yareli Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Velox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Okina Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Zylok Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Lith Z4",
		Tier = "Lith",
		Vaulted = "39.1" 
	},
	["Meso A1"] = {
		Drops = {
			{
				Item = "Ballistica Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Akjagara Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Meso A1",
		Tier = "Meso",
		Vaulted = "24.5.8",
	},
	["Meso A2"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbolto Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Meso A2",
		Tier = "Meso",
		Vaulted = "25.8",
	},
	["Meso A3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Astilla Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Meso A3",
		Tier = "Meso",
		Vaulted = "32.2.5",
	},
	["Meso A4"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Scourge Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Afuris Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Meso A4",
		Tier = "Meso",
		Vaulted = "32.3.6",
	},
	["Meso A5"] = {
		Drops = {
			{
				Item = "Khora Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Grendel Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Afuris Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Meso A5",
		Tier = "Meso",
		Vaulted = "35.5.9",
	},
	["Meso A6"] = {
		Drops = {
			{
				Item = "Corinth Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vasto Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Astilla Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "35.1.2",
		Name = "Meso A6",
		Tier = "Meso",
		Vaulted = "35.1.2",
	},
	["Meso A7"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Meso A7",
		Tier = "Meso",
		Vaulted = "41",
	},
	["Meso A8"] = {
		Drops = {
			{
				Item = "Quassus Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Okina Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Lavos Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Meso A8",
		Tier = "Meso",
		Vaulted = "41",
	},
	["Meso A9"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "Lower Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Venato Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Alternox Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Meso A9",
		Tier = "Meso",
		Vaulted = "43.0",
	},
	["Meso A10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Alternox Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Meso A10",
		Tier = "Meso",
		Vaulted = "43.0",
	},
	["Meso A11"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Masseter Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.7",
		Name = "Meso A11",
		Tier = "Meso",
		Vaulted = "42.0.7",
	},
	["Meso A12"] = {
		Drops = {
			{
				Item = "Perigale Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sarofang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Voruna Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Afentis Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Meso A12",
		Tier = "Meso",
	},
	["Meso B1"] = {
		Drops = {
			{
				Item = "Dakra Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mag Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Boar Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Meso B1",
		Tier = "Meso",
		Vaulted = "Specters of the Rail 13",
	},
	["Meso B2"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Oberon Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Hydroid Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Meso B2",
		Tier = "Meso",
		Vaulted = "24.2.2",
	},
	["Meso B3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nova Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Soma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dakra Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mag Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Boar Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "24.0.6",
		Name = "Meso B3",
		Tier = "Meso",
		Vaulted = "24.2.11",
	},
	["Meso B4"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Meso B4",
		Tier = "Meso",
		Vaulted = "28.2",
	},
	["Meso B5"] = {
		Drops = {
			{
				Item = "Karyst Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volnus Prime",
				Part = "Head",
				Rarity = "Uncommon",
			},
			{
				Item = "Guandao Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Meso B5",
		Tier = "Meso",
		Vaulted = "31",
	},
	["Meso B6"] = {
		Drops = {
			{
				Item = "Octavia Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Meso B6",
		Tier = "Meso",
		Vaulted = "31",
	},
	["Meso B7"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akjagara Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Ballistica Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Meso B7",
		Tier = "Meso",
		Vaulted = "30.9.4",
	},
	["Meso B8"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Grendel Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Meso B8",
		Tier = "Meso",
		Vaulted = "35.0.9",
	},
	["Meso B9"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Shade Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Meso B9",
		Tier = "Meso",
		Vaulted = "37.0.9",
	},
	["Meso B10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ember Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Sicarus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Glaive Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Boltor Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.5",
		Name = "Meso B10",
		Tier = "Meso",
		Vaulted = "36.0.5",
	},
	["Meso C1"] = {
		Drops = {
			{
				Item = "Nova Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Scindo Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Carrier Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Meso C1",
		Tier = "Meso",
		Vaulted = "The Silver Grove 3",
	},
	["Meso C2"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Odonata Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Carrier Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Meso C2",
		Tier = "Meso",
		Vaulted = "19.11.5",
	},
	["Meso C3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "Lower Limb",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Meso C3",
		Tier = "Meso",
		Vaulted = "22.7",
	},
	["Meso C4"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Chroma Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Meso C4",
		Tier = "Meso",
		Vaulted = "28.2",
	},
	["Meso C5"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Corinth Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Meso C5",
		Tier = "Meso",
		Vaulted = "28.2",
	},
	["Meso C6"] = {
		Drops = {
			{
				Item = "Baza Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Corinth Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Meso C6",
		Tier = "Meso",
		Vaulted = "31",
	},
	["Meso C7"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Carrier Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "33.0.14",
		Name = "Meso C7",
		Tier = "Meso",
		Vaulted = "33.0.14",
	},
	["Meso C8"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Meso C8",
		Tier = "Meso",
		Vaulted = "34",
	},
	["Meso C9"] = {
		Drops = {
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Corvas Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Meso C9",
		Tier = "Meso",
		Vaulted = "35.0.9",
	},
	["Meso C10"] = {
		Drops = {
			{
				Item = "Astilla Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Corinth Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "35.1.2",
		Name = "Meso C10",
		Tier = "Meso",
		Vaulted = "35.1.2",
	},
	["Meso D1"] = {
		Drops = {
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Meso D1",
		Tier = "Meso",
		Vaulted = "21.6",
	},
	["Meso D2"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Destreza Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Meso D2",
		Tier = "Meso",
		Vaulted = "23.9",
	},
	["Meso D3"] = {
		Drops = {
			{
				Item = "Akbolto Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Kronen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Destreza Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Meso D3",
		Tier = "Meso",
		Vaulted = "25.3",
	},
	["Meso D4"] = {
		Drops = {
			{
				Item = "Akjagara Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Meso D4",
		Tier = "Meso",
		Vaulted = "28.2",
	},
	["Meso D5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Soma Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nova Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vasto Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "27.5.6",
		Name = "Meso D5",
		Tier = "Meso",
		Vaulted = "29.2",
	},
	["Meso D6"] = {
		Drops = {
			{
				Item = "Ivara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Aksomati Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Meso D6",
		Tier = "Meso",
		Vaulted = "30.7",
	},
	["Meso D7"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Meso D7",
		Tier = "Meso",
		Vaulted = "33.6",
	},
	["Meso D8"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Voruna Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Daikyu Prime",
				Part = "Grip",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Meso D8",
		Tier = "Meso",
	},
	["Meso E1"] = {
		Drops = {
			{
				Item = "Bo Prime",
				Part = "Ornament",
				Rarity = "Common",
			},
			{
				Item = "Frost Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Latron Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wyrm Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Ember Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.11.1",
		Name = "Meso E1",
		Tier = "Meso",
		Vaulted = "22.17.3",
	},
	["Meso E2"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Equinox Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Meso E2",
		Tier = "Meso",
		Vaulted = "25.8",
	},
	["Meso E3"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Equinox Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Meso E3",
		Tier = "Meso",
		Vaulted = "27.3.6",
	},
	["Meso E4"] = {
		Drops = {
			{
				Item = "Baza Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tekko Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Equinox Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Meso E4",
		Tier = "Meso",
		Vaulted = "29.9",
	},
	["Meso E5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Euphona Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "29.5.9",
		Name = "Meso E5",
		Tier = "Meso",
		Vaulted = "31.5.8",
	},
	["Meso E6"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Epitaph Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Meso E6",
		Tier = "Meso",
		Vaulted = "39.1" 
	},
	["Meso E7"] = {
		Drops = {
			{
				Item = "Cedo Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gyre Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Sarofang Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Epitaph Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Meso E7",
		Tier = "Meso",
		Vaulted = "43.0",
	},
	["Meso F1"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nekros Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Fragor Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Meso F1",
		Tier = "Meso",
		Vaulted = "21.6",
	},
	["Meso F2"] = {
		Drops = {
			{
				Item = "Latron Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Ember Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sicarus Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Reaper Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Frost Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.3",
		Name = "Meso F2",
		Tier = "Meso",
		Vaulted = "24.5.6",
	},
	["Meso F3"] = {
		Drops = {
			{
				Item = "Ember Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Loki Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Reaper Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Glaive Prime",
				Part = "Disc",
				Rarity = "Uncommon",
			},
			{
				Item = "Frost Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.11.1",
		Name = "Meso F3",
		Tier = "Meso",
		Vaulted = "22.17.3",
	},
	["Meso F4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Latron Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Reaper Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Boar Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mag Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Frost Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6.6",
		Name = "Meso F4",
		Tier = "Meso",
		Vaulted = "33.6.6",
	},
	["Meso F5"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Gunsen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Meso F5",
		Tier = "Meso",
		Vaulted = "38.0.10",
	},
	["Meso G1"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blades",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Meso G1",
		Tier = "Meso",
		Vaulted = "23.0.3",
	},
	["Meso G2"] = {
		Drops = {
			{
				Item = "Equinox Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Guandao Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Meso G2",
		Tier = "Meso",
		Vaulted = "29.9",
	},
	["Meso G3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Meso G3",
		Tier = "Meso",
		Vaulted = "31.7",
	},
	["Meso G4"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Guandao Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Meso G4",
		Tier = "Meso",
		Vaulted = "32.0.9",
	},
	["Meso G5"] = {
		Drops = {
			{
				Item = "Corvas Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gunsen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Meso G5",
		Tier = "Meso",
		Vaulted = "35.0.9",
	},
	["Meso G6"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Zylok Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Meso G6",
		Tier = "Meso",
		Vaulted = "36.1",
	},
	["Meso G7"] = {
		Drops = {
			{
				Item = "Wisp Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Okina Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Meso G7",
		Tier = "Meso",
		Vaulted = "36.1",
	},
	["Meso G8"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Quassus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Meso G8",
		Tier = "Meso",
		Vaulted = "39.1" 
	},
	["Meso G9"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venato Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Meso G9",
		Tier = "Meso",
		Vaulted = "41",
	},
	["Meso G10"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Wisp Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gunsen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "40.0.5.1",
		Name = "Meso G10",
		Tier = "Meso",
		Vaulted = "40.0.5.1",
	},
	["Meso H1"] = {
		Drops = {
			{
				Item = "Hydroid Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "22.7",
		Name = "Meso H1",
		Tier = "Meso",
		Vaulted = "22.16.4",
	},
	["Meso H2"] = {
		Drops = {
			{
				Item = "Nidus Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Meso H2",
		Tier = "Meso",
		Vaulted = "32.0.9",
	},
	["Meso H3"] = {
		Drops = {
			{
				Item = "Octavia Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hystrix Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Meso H3",
		Tier = "Meso",
		Vaulted = "32.0.9",
	},
	["Meso H4"] = {
		Drops = {
			{
				Item = "Nagantaka Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Knell Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Meso H4",
		Tier = "Meso",
		Vaulted = "33.6",
	},
	["Meso H5"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Meso H5",
		Tier = "Meso",
		Vaulted = "36.1",
	},
	["Meso H6"] = {
		Drops = {
			{
				Item = "Baruuk Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hystrix Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Meso H6",
		Tier = "Meso",
		Vaulted = "35.5.9",
	},
	["Meso H7"] = {
		Drops = {
			{
				Item = "Baruuk Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Meso H7",
		Tier = "Meso",
		Vaulted = "37.0.9",
	},
	["Meso H8"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Corvas Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hystrix Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.7",
		Name = "Meso H8",
		Tier = "Meso",
		Vaulted = "37.0.7",
	},
	["Meso I1"] = {
		Drops = {
			{
				Item = "Corinth Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Meso I1",
		Tier = "Meso",
		Vaulted = "30.7",
	},
	["Meso I2"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Guandao Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Meso I2",
		Tier = "Meso",
		Vaulted = "31.7",
	},
	["Meso K1"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Nekros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Kogake Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "22.7",
		Name = "Meso K1",
		Tier = "Meso",
		Vaulted = "22.16.4",
	},
	["Meso K2"] = {
		Drops = {
			{
				Item = "Mirage Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Meso K2",
		Tier = "Meso",
		Vaulted = "25.8",
	},
	["Meso K3"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Karyst Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Meso K3",
		Tier = "Meso",
		Vaulted = "30.3",
	},
	["Meso K4"] = {
		Drops = {
			{
				Item = "Nagantaka Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Knell Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Khora Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Meso K4",
		Tier = "Meso",
		Vaulted = "34",
	},
	["Meso K5"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Meso K5",
		Tier = "Meso",
		Vaulted = "32.3.6",
	},
	["Meso K6"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hystrix Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Meso K6",
		Tier = "Meso",
		Vaulted = "34",
	},
	["Meso K7"] = {
		Drops = {
			{
				Item = "Protea Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Epitaph Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kompressa Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Meso K7",
		Tier = "Meso",
		Vaulted = "39.1" 
	},
	["Meso K8"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Alternox Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Kestrel Prime",
				Part = "Grip",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Meso K8",
		Tier = "Meso",
	},
	["Meso L1"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Carapace",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Meso L1",
		Tier = "Meso",
		Vaulted = "27.3.6",
	},
	["Meso L2"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Vasto Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3",
		Name = "Meso L2",
		Tier = "Meso",
		Vaulted = "32.3",
	},
	["Meso L3"] = {
		Drops = {
			{
				Item = "Sevagoth Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Okina Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Lavos Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Meso L3",
		Tier = "Meso",
		Vaulted = "41",
	},
	["Meso L4"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Perigale Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Quassus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Lavos Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Meso L4",
		Tier = "Meso",
		Vaulted = "43.0",
	},
	["Meso L5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Athodai Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Vadarya Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Lavos Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Meso L5",
		Tier = "Meso",
	},
	["Meso M1"] = {
		Drops = {
			{
				Item = "Dakra Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Boltor Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Ankyros Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Boar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Rhino Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mag Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.7.4",
		Name = "Meso M1",
		Tier = "Meso",
		Vaulted = "21.2.1",
	},
	["Meso M2"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Kogake Prime",
				Part = "Boot",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Mirage Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Meso M2",
		Tier = "Meso",
		Vaulted = "24.5.8",
	},
	["Meso M3"] = {
		Drops = {
			{
				Item = "Ballistica Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Gram Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kogake Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mirage Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Meso M3",
		Tier = "Meso",
		Vaulted = "25.3",
	},
	["Meso M4"] = {
		Drops = {
			{
				Item = "Dual Keres Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Masseter Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Meso M4",
		Tier = "Meso",
		Vaulted = "35.5.9",
	},
	["Meso M5"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Magnus Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.12",
		Name = "Meso M5",
		Tier = "Meso",
		Vaulted = "38.0.12",
	},
	["Meso N1"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Nyx Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Meso N1",
		Tier = "Meso",
		Vaulted = "The Silver Grove 3",
	},
	["Meso N2"] = {
		Drops = {
			{
				Item = "Hikou Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Meso N2",
		Tier = "Meso",
		Vaulted = "The Silver Grove 3",
	},
	["Meso N3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Euphona Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Carrier Prime",
				Part = "Cerebrum",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Meso N3",
		Tier = "Meso",
		Vaulted = "20.6.2",
	},
	["Meso N4"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Meso N4",
		Tier = "Meso",
		Vaulted = "22.7",
	},
	["Meso N5"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Hydroid Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Meso N5",
		Tier = "Meso",
		Vaulted = "23.0.3",
	},
	["Meso N6"] = {
		Drops = {
			{
				Item = "Boltor Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hikou Prime",
				Part = "Pouch",
				Rarity = "Common",
			},
			{
				Item = "Rhino Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scindo Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Nyx Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.1.2",
		Name = "Meso N6",
		Tier = "Meso",
		Vaulted = "31.1.3",
	},
	["Meso N7"] = {
		Drops = {
			{
				Item = "Kronen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Meso N7",
		Tier = "Meso",
		Vaulted = "27.0.4",
	},
	["Meso N8"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Hilt",
				Rarity = "Rare",
			},
		},
		Introduced = "25.7.3",
		Name = "Meso N8",
		Tier = "Meso",
		Vaulted = "26.0.8",
	},
	["Meso N9"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Tekko Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Meso N9",
		Tier = "Meso",
		Vaulted = "29.3",
	},
	["Meso N10"] = {
		Drops = {
			{
				Item = "Ivara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Meso N10",
		Tier = "Meso",
		Vaulted = "30.3",
	},
	["Meso N11"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Scindo Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nyx Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.10",
		Name = "Meso N11",
		Tier = "Meso",
	},
	["Meso N12"] = {
		Drops = {
			{
				Item = "Knell Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Meso N12",
		Tier = "Meso",
		Vaulted = "31.7",
	},
	["Meso N13"] = {
		Drops = {
			{
				Item = "Harrow Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Astilla Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Meso N13",
		Tier = "Meso",
		Vaulted = "32.3.6",
	},
	["Meso N14"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Shade Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Meso N14",
		Tier = "Meso",
		Vaulted = "33.6",
	},
	["Meso N15"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pandero Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Octavia Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Meso N15",
		Tier = "Meso",
		Vaulted = "34",
	},
	["Meso N16"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Scourge Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.4",
		Name = "Meso N16",
		Tier = "Meso",
		Vaulted = "36.0.4",
	},
	["Meso N17"] = {
		Drops = {
			{
				Item = "Masseter Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Velox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Meso N17",
		Tier = "Meso",
		Vaulted = "39.1" 
	},
	["Meso O1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Meso O1",
		Tier = "Meso",
		Vaulted = "22.16.4",
	},
	["Meso O2"] = {
		Drops = {
			{
				Item = "Tiberon Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Meso O2",
		Tier = "Meso",
		Vaulted = "23.9",
	},
	["Meso O3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Loki Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Odonata Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wyrm Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Odonata Prime",
				Part = "Wings Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.8.2",
		Name = "Meso O3",
		Tier = "Meso",
		Vaulted = "25.3",
	},
	["Meso O4"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.1.1",
		Name = "Meso O4",
		Tier = "Meso",
		Vaulted = "27.5.6",
	},
	["Meso O5"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Octavia Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Meso O5",
		Tier = "Meso",
		Vaulted = "32.2.5",
	},
	["Meso O6"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2",
		Name = "Meso O6",
		Tier = "Meso",
		Vaulted = "32.2",
	},
	["Meso P1"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Oberon Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Meso P1",
		Tier = "Meso",
		Vaulted = "24.5.8",
	},
	["Meso P2"] = {
		Drops = {
			{
				Item = "Baza Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Meso P2",
		Tier = "Meso",
		Vaulted = "30.3",
	},
	["Meso P3"] = {
		Drops = {
			{
				Item = "Karyst Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Meso P3",
		Tier = "Meso",
		Vaulted = "29.3",
	},
	["Meso P4"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Meso P4",
		Tier = "Meso",
		Vaulted = "31.3",
	},
	["Meso P5"] = {
		Drops = {
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Meso P5",
		Tier = "Meso",
		Vaulted = "31.7",
	},
	["Meso P6"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Kubrow Collar Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Meso P6",
		Tier = "Meso",
		Vaulted = "30.9.4",
	},
	["Meso P7"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Guandao Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Meso P7",
		Tier = "Meso",
		Vaulted = "31.7",
	},
	["Meso P8"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pandero Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Meso P8",
		Tier = "Meso",
		Vaulted = "32.0.9",
	},
	["Meso P9"] = {
		Drops = {
			{
				Item = "Khora Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pandero Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Meso P9",
		Tier = "Meso",
		Vaulted = "32.2.5",
	},
	["Meso P10"] = {
		Drops = {
			{
				Item = "Strun Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Meso P10",
		Tier = "Meso",
		Vaulted = "33.6",
	},
	["Meso P11"] = {
		Drops = {
			{
				Item = "Harrow Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Meso P11",
		Tier = "Meso",
		Vaulted = "34",
	},
	["Meso P12"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vectis Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "33.0.14",
		Name = "Meso P12",
		Tier = "Meso",
		Vaulted = "33.0.14",
	},
	["Meso P13"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Meso P13",
		Tier = "Meso",
		Vaulted = "35.0.9",
	},
	["Meso P14"] = {
		Drops = {
			{
				Item = "Baruuk Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Meso P14",
		Tier = "Meso",
		Vaulted = "35.0.9",
	},
	["Meso P15"] = {
		Drops = {
			{
				Item = "Zylok Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gunsen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.11",
		Name = "Meso P15",
		Tier = "Meso",
		Vaulted = "38.6",
	},
	["Meso P16"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Trumna Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akarius Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Daikyu Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Meso P16",
		Tier = "Meso",
		Vaulted = "41",
	},
	["Meso P17"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Venato Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Kestrel Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Meso P17",
		Tier = "Meso",
		Vaulted = "42.0.6",
	},	
	["Meso R1"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Tiberon Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Meso R1",
		Tier = "Meso",
		Vaulted = "25.3",
	},
	["Meso R2"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Meso R2",
		Tier = "Meso",
		Vaulted = "27.3.6",
	},
	["Meso R3"] = {
		Drops = {
			{
				Item = "Akjagara Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Carapace",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Meso R3",
		Tier = "Meso",
		Vaulted = "28.2",
	},
	["Meso R4"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Gram Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Zephyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.0.8",
		Name = "Meso R4",
		Tier = "Meso",
		Vaulted = "32.0.3",
	},
	["Meso R5"] = {
		Drops = {
			{
				Item = "Baruuk Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hystrix Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Meso R5",
		Tier = "Meso",
		Vaulted = "32.3.6",
	},
	["Meso R6"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6.3",
		Name = "Meso R6",
		Tier = "Meso",
		Vaulted = "38.6.3",
	},
	["Meso S1"] = {
		Drops = {
			{
				Item = "Nova Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Odonata Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Soma Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Meso S1",
		Tier = "Meso",
		Vaulted = "19.0.7",
	},
	["Meso S2"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Meso S2",
		Tier = "Meso",
		Vaulted = "22.7",
	},
	["Meso S3"] = {
		Drops = {
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nekros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Pouch",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Meso S3",
		Tier = "Meso",
		Vaulted = "20.6.2",
	},
	["Meso S4"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Trinity Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Meso S4",
		Tier = "Meso",
		Vaulted = "21.6",
	},
	["Meso S5"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Meso S5",
		Tier = "Meso",
		Vaulted = "22.7",
	},
	["Meso S6"] = {
		Drops = {
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.4",
		Name = "Meso S6",
		Tier = "Meso",
		Vaulted = "22.7",
	},
	["Meso S7"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blades",
				Rarity = "Common",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Meso S7",
		Tier = "Meso",
		Vaulted = "23.9",
	},
	["Meso S8"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gram Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Ballistica Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Meso S8",
		Tier = "Meso",
		Vaulted = "24.5.8",
	},
	["Meso S9"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Pouch",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.15",
		Name = "Meso S9",
		Tier = "Meso",
		Vaulted = "24.2.15",
	},
	["Meso S10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Aksomati Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Meso S10",
		Tier = "Meso",
		Vaulted = "31",
	},
	["Meso S11"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Meso S11",
		Tier = "Meso",
		Vaulted = "31.3",
	},
	["Meso S12"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Meso S12",
		Tier = "Meso",
		Vaulted = "34",
	},
	["Meso S13"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Knell Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.4",
		Name = "Meso S13",
		Tier = "Meso",
		Vaulted = "36.0.4",
	},
	["Meso S14"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Ankyros Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Ember Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rhino Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sicarus Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.5",
		Name = "Meso S14",
		Tier = "Meso",
		Vaulted = "36.0.5",
	},
	["Meso S15"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nikana Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Pouch",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.12",
		Name = "Meso S15",
		Tier = "Meso",
		Vaulted = "38.0.12",
	},
	["Meso T1"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tiberon Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Meso T1",
		Tier = "Meso",
		Vaulted = "27.0.4",
	},
	["Meso T2"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tiberon Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Meso T2",
		Tier = "Meso",
		Vaulted = "23.0.3",
	},
	["Meso T3"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Chroma Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tiberon Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Meso T3",
		Tier = "Meso",
		Vaulted = "27.0.4",
	},
	["Meso T4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Meso T4",
		Tier = "Meso",
		Vaulted = "30.3",
	},
	["Meso T5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tekko Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Meso T5",
		Tier = "Meso",
		Vaulted = "30.7",
	},
	["Meso T6"] = {
		Drops = {
			{
				Item = "Dethcube Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tekko Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.8",
		Name = "Meso T6",
		Tier = "Meso",
		Vaulted = "32.2.8",
	},
	["Meso T7"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Okina Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Wisp Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akarius Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Meso T7",
		Tier = "Meso",
		Vaulted = "38.6",
	},
	["Meso T8"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Akarius Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6.2",
		Name = "Meso T8",
		Tier = "Meso",
		Vaulted = "41",
	},
	["Meso V1"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Carrier Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Meso V1",
		Tier = "Meso",
		Vaulted = "20.6.2",
	},
	["Meso V2"] = {
		Drops = {
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Volt Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Meso V2",
		Tier = "Meso",
		Vaulted = "19.0.7",
	},
	["Meso V3"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kavasa Prime",
				Part = "Band",
				Rarity = "Uncommon",
			},
			{
				Item = "Volt Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Meso V3",
		Tier = "Meso",
		Vaulted = "19.11.5",
	},
	["Meso V4"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Meso V4",
		Tier = "Meso",
		Vaulted = "20.6.2",
	},
	["Meso V5"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Euphona Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Venka Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Meso V5",
		Tier = "Meso",
		Vaulted = "22.7",
	},
	["Meso V6"] = {
		Drops = {
			{
				Item = "Akstiletto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Carrier Prime",
				Part = "Cerebrum",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "26.0.8",
		Name = "Meso V6",
		Tier = "Meso",
		Vaulted = "27.1.1",
	},
	["Meso V7"] = {
		Drops = {
			{
				Item = "Scourge Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Knell Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Volnus Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Meso V7",
		Tier = "Meso",
		Vaulted = "32.3.6",
	},
	["Meso V8"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Head",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
						{
				Item = "Vasto Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tekko Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.8",
		Name = "Meso V8",
		Tier = "Meso",
		Vaulted = "32.2.8",
	},
	["Meso V9"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Afuris Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Velox Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Meso V9",
		Tier = "Meso",
		Vaulted = "37.0.9",
	},
	["Meso V10"] = {
		Drops = {
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Velox Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Meso V10",
		Tier = "Meso",
		Vaulted = "38.6",
	},
	["Meso V11"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Nautilus Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Caliban Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Velox Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Meso V11",
		Tier = "Meso",
		Vaulted = "42.0.6",
	},
	["Meso V12"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Velox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Vadarya Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Meso V12",
		Tier = "Meso",
		Vaulted = "42.0.6",
	},
	["Meso V13"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Caliban Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Venato Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Meso V13",
		Tier = "Meso",
	},
	["Meso V14"] = {
		Drops = {
			{
				Item = "Gyre Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Velox Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Meso V14",
		Tier = "Meso",
		Vaulted = "42.0.6",
	},
	["Meso V15"] = {
		Drops = {
			{
				Item = "Caliban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trumna Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venato Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Caliban Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vadarya Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Meso V15",
		Tier = "Meso",
	},
	["Meso W1"] = {
		Drops = {
			{
				Item = "Tekko Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Meso W1",
		Tier = "Meso",
		Vaulted = "27.0.4",
	},
	["Meso W2"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32",
		Name = "Meso W2",
		Tier = "Meso",
		Vaulted = "32.1.1",
	},
	["Meso W3"] = {
		Drops = {
			{
				Item = "Hystrix Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Meso W3",
		Tier = "Meso",
		Vaulted = "35.5.9",
	},
	["Meso W4"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Gunsen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Meso W4",
		Tier = "Meso",
		Vaulted = "37.0.9",
	},
	["Meso W5"] = {
		Drops = {
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Meso W5",
		Tier = "Meso",
		Vaulted = "36.1",
	},
	["Meso X1"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Vadarya Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Yareli Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Meso X1",
		Tier = "Meso",
	},
	["Meso Y1"] = {
		Drops = {
			{
				Item = "Caliban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trumna Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cedo Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Okina Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Meso Y1",
		Tier = "Meso",
		Vaulted = "42.0.6",
	},	
	["Meso Y2"] = {
		Drops = {
			{
				Item = "Gyre Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Styanax Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Meso Y2",
		Tier = "Meso",
	},	
	["Meso Z1"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Meso Z1",
		Tier = "Meso",
		Vaulted = "24.2.2",
	},
	["Meso Z2"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hydroid Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Meso Z2",
		Tier = "Meso",
		Vaulted = "24.5.8",
	},
	["Meso Z3"] = {
		Drops = {
			{
				Item = "Chroma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Meso Z3",
		Tier = "Meso",
		Vaulted = "27.0.4",
	},
	["Meso Z4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Meso Z4",
		Tier = "Meso",
		Vaulted = "31.3",
	},
	["Meso Z5"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Meso Z5",
		Tier = "Meso",
		Vaulted = "34",
	},
	["Meso Z6"] = {
		Drops = {
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zylok Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.7",
		Name = "Meso Z6",
		Tier = "Meso",
		Vaulted = "42.0.7",
	},
	["Neo A1"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Neo A1",
		Tier = "Neo",
		Vaulted = "20.6.2",
	},
	["Neo A2"] = {
		Drops = {
			{
				Item = "Kronen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbolto Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Neo A2",
		Tier = "Neo",
		Vaulted = "25.8",
	},
	["Neo A3"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Equinox Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akjagara Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Neo A3",
		Tier = "Neo",
		Vaulted = "29.3",
	},
	["Neo A4"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vauban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vectis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "26.0.8",
		Name = "Neo A4",
		Tier = "Neo",
		Vaulted = "27.1.1",
	},
	["Neo A5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Octavia Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Atlas Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Neo A5",
		Tier = "Neo",
		Vaulted = "30.7",
	},
	["Neo A6"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "String",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akjagara Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Neo A6",
		Tier = "Neo",
		Vaulted = "30.9.4",
	},
	["Neo A7"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Cerebrum",
				Rarity = "Uncommon",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.8",
		Name = "Neo A7",
		Tier = "Neo",
		Vaulted = "32.2.8",
	},
	["Neo A8"] = {
		Drops = {
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Astilla Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Neo A8",
		Tier = "Neo",
		Vaulted = "32.3.6",
	},
	["Neo A9"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akjagara Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3",
		Name = "Neo A9",
		Tier = "Neo",
		Vaulted = "32.3",
	},
	["Neo A10"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Panthera Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "33.0.14",
		Name = "Neo A10",
		Tier = "Neo",
		Vaulted = "33.0.14",
	},
	["Neo A11"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Akarius Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Neo A11",
		Tier = "Neo",
		Vaulted = "36.1",
	},
	["Neo A12"] = {
		Drops = {
			{
				Item = "Akarius Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Neo A12",
		Tier = "Neo",
		Vaulted = "36.1",
	},
	["Neo A13"] = {
		Drops = {
			{
				Item = "Akarius Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Wisp Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Neo A13",
		Tier = "Neo",
		Vaulted = "38.6",
	},
	["Neo A14"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cedo Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Neo A14",
		Tier = "Neo",
		Vaulted = "41",
	},
	["Neo A15"] = {
		Drops = {
			{
				Item = "Gauss Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vadarya Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "39.1",
		Name = "Neo A15",
		Tier = "Neo",
		Vaulted = "41",
	},
	["Neo A16"] = {
		Drops = {
			{
				Item = "Dual Zoren Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Perigale Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Yareli Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lavos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sarofang Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Athodai Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Neo A16",
		Tier = "Neo",
	},
	["Neo B1"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Vectis Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Neo B1",
		Tier = "Neo",
		Vaulted = "20.6.2",
	},
	["Neo B2"] = {
		Drops = {
			{
				Item = "Tigris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Neo B2",
		Tier = "Neo",
		Vaulted = "23.0.3",
	},
	["Neo B3"] = {
		Drops = {
			{
				Item = "Boar Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rhino Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mag Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dakra Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Boltor Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.7.4",
		Name = "Neo B3",
		Tier = "Neo",
		Vaulted = "21.2.1",
	},
	["Neo B4"] = {
		Drops = {
			{
				Item = "Hydroid Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kronen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Neo B4",
		Tier = "Neo",
		Vaulted = "23.0.3",
	},
	["Neo B5"] = {
		Drops = {
			{
				Item = "Ballistica Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Neo B5",
		Tier = "Neo",
		Vaulted = "24.2.2",
	},
	["Neo B6"] = {
		Drops = {
			{
				Item = "Euphona Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Kogake Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Banshee Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.5.9",
		Name = "Neo B6",
		Tier = "Neo",
		Vaulted = "31.5.8",
	},
	["Neo B7"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dethcube Prime",
				Part = "Carapace",
				Rarity = "Uncommon",
			},
			{
				Item = "Tekko Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Neo B7",
		Tier = "Neo",
		Vaulted = "30.7",
	},
	["Neo B8"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Frost Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Latron Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Dakra Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Boar Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6.6",
		Name = "Neo B8",
		Tier = "Neo",
		Vaulted = "33.6.6",
	},
	["Neo B9"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Velox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gunsen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Baruuk Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Neo B9",
		Tier = "Neo",
		Vaulted = "37.0.9",
	},
	["Neo C1"] = {
		Drops = {
			{
				Item = "Kronen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Chroma Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Neo C1",
		Tier = "Neo",
		Vaulted = "27.0.4",
	},
	["Neo C2"] = {
		Drops = {
			{
				Item = "Nidus Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Corvas Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Neo C2",
		Tier = "Neo",
		Vaulted = "33.6",
	},
	["Neo C3"] = {
		Drops = {
			{
				Item = "Corvas Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Neo C3",
		Tier = "Neo",
		Vaulted = "33.6",
	},
	["Neo C4"] = {
		Drops = {
			{
				Item = "Gunsen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Scourge Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Hildryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Corvas Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Neo C4",
		Tier = "Neo",
		Vaulted = "34",
	},
	["Neo C5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hystrix Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Corvas Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.7",
		Name = "Neo C5",
		Tier = "Neo",
		Vaulted = "37.0.7",
	},
	["Neo C6"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				ItemCount = 2,
				Rarity = "Uncommon",
			},
			{
				Item = "Velox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cedo Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Neo C6",
		Tier = "Neo",
		Vaulted = "42.0.6",
	},
	["Neo C7"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kompressa Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vadarya Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Daikyu Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Caliban Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Neo C7",
		Tier = "Neo",
	},	
	["Neo C8"] = {
		Drops = {
			{
				Item = "Daikyu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Cedo Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Venato Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Afentis Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Caliban Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Neo C8",
		Tier = "Neo",
	},	
	["Neo C9"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Alternox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cedo Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Neo C9",
		Tier = "Neo",
	},	
	["Neo D1"] = {
		Drops = {
			{
				Item = "Mag Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Boar Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dakra Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Neo D1",
		Tier = "Neo",
		Vaulted = "Specters of the Rail 13",
	},
	["Neo D2"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Cerebrum",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Neo D2",
		Tier = "Neo",
		Vaulted = "29.9",
	},
	["Neo D3"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Neo D3",
		Tier = "Neo",
		Vaulted = "30.7",
	},
	["Neo D4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Destreza Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Neo D4",
		Tier = "Neo",
		Vaulted = "30.9.4",
	},
	["Neo D5"] = {
		Drops = {
			{
				Item = "Volnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Neo D5",
		Tier = "Neo",
		Vaulted = "32.3.6",
	},
	["Neo D6"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Fragor Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Dethcube Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.8",
		Name = "Neo D6",
		Tier = "Neo",
		Vaulted = "32.2.8",
	},
	["Neo D7"] = {
		Drops = {
			{
				Item = "Corvas Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wisp Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Neo D7",
		Tier = "Neo",
		Vaulted = "34",
	},
	["Neo D8"] = {
		Drops = {
			{
				Item = "Tatsu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Neo D8",
		Tier = "Neo",
		Vaulted = "35.0.9",
	},
	["Neo D9"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Protea Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Dual Zoren Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Neo D9",
		Tier = "Neo",
		Vaulted = "42.0.6",
	},
	["Neo D10"] = {
		Drops = {
			{
				Item = "Akarius Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Velox Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Daikyu Prime",
				Part = "Grip",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Neo D10",
		Tier = "Neo",
		Vaulted = "41",
	},
	["Neo E1"] = {
		Drops = {
			{
				Item = "Frost Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Loki Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wyrm Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Reaper Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Ember Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.11.1",
		Name = "Neo E1",
		Tier = "Neo",
		Vaulted = "22.17.3",
	},
	["Neo E2"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dethcube Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zakti Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Equinox Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Neo E2",
		Tier = "Neo",
		Vaulted = "29.9",
	},
	["Neo E3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Equinox Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32",
		Name = "Neo E3",
		Tier = "Neo",
		Vaulted = "32.1.1",
	},
	["Neo E4"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Afuris Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Epitaph Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Neo E4",
		Tier = "Neo",
		Vaulted = "37.0.9",
	},
	["Neo F1"] = {
		Drops = {
			{
				Item = "Ember Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sicarus Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Sicarus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bo Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Frost Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.11.1",
		Name = "Neo F1",
		Tier = "Neo",
		Vaulted = "22.17.3",
	},
	["Neo F2"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Neo F2",
		Tier = "Neo",
		Vaulted = "35.0.9",
	},
	["Neo F3"] = {
		Drops = {
			{
				Item = "Phantasma Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Larkspur Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Acceltra Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Neo F3",
		Tier = "Neo",
		Vaulted = "35.5.9",
	},
	["Neo G1"] = {
		Drops = {
			{
				Item = "Kogake Prime",
				Part = "Boot",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hydroid Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Neo G1",
		Tier = "Neo",
		Vaulted = "25.3",
	},
	["Neo G2"] = {
		Drops = {
			{
				Item = "Dethcube Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Neo G2",
		Tier = "Neo",
		Vaulted = "27.3.6",
	},
	["Neo G3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.1.1",
		Name = "Neo G3",
		Tier = "Neo",
		Vaulted = "27.5.6",
	},
	["Neo G4"] = {
		Drops = {
			{
				Item = "Pandero Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Hystrix Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Neo G4",
		Tier = "Neo",
		Vaulted = "32.2.5",
	},
	["Neo G5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nekros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Harrow Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.4",
		Name = "Neo G5",
		Tier = "Neo",
		Vaulted = "36.0.4",
	},
	["Neo G6"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sicarus Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Rhino Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ankyros Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Boltor Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Glaive Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.0.5",
		Name = "Neo G6",
		Tier = "Neo",
		Vaulted = "36.0.5",
	},
	["Neo G7"] = {
		Drops = {
			{
				Item = "Fulmin Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Nautilus Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Afuris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hildryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Neo G7",
		Tier = "Neo",
		Vaulted = "37.0.9",
	},
	["Neo G8"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fulmin Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Okina Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Neo G8",
		Tier = "Neo",
		Vaulted = "38.6",
	},
	["Neo G9"] = {
		Drops = {
			{
				Item = "Gauss Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kompressa Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6",
		Name = "Neo G9",
		Tier = "Neo",
		Vaulted = "39.1" 
	},
	["Neo G10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akarius Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.7",
		Name = "Neo G10",
		Tier = "Neo",
		Vaulted = "42.0.7" 
	},
	["Neo H1"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Head",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Neo H1",
		Tier = "Neo",
		Vaulted = "22.16.4",
	},
	["Neo H2"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Euphona Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Neo H2",
		Tier = "Neo",
		Vaulted = "24.2.2",
	},
	["Neo H3"] = {
		Drops = {
			{
				Item = "Ballistica Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Hydroid Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.9.4",
		Name = "Neo H3",
		Tier = "Neo",
		Vaulted = "30.9.4",
	},
	["Neo H4"] = {
		Drops = {
			{
				Item = "Larkspur Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wisp Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "40.0.5.1",
		Name = "Neo H4",
		Tier = "Neo",
		Vaulted = "40.0.5.1",
	},
	["Neo I1"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Wukong Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zhuge Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Neo I1",
		Tier = "Neo",
		Vaulted = "27.3.6",
	},
	["Neo I2"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Dethcube Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Stradavar Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Neo I2",
		Tier = "Neo",
		Vaulted = "29.9",
	},
	["Neo I3"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Baza Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Ivara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2",
		Name = "Neo I3",
		Tier = "Neo",
		Vaulted = "32.2",
	},
	["Neo K1"] = {
		Drops = {
			{
				Item = "Euphona Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Valkyr Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kogake Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Neo K1",
		Tier = "Neo",
		Vaulted = "23.9",
	},
	["Neo K2"] = {
		Drops = {
			{
				Item = "Banshee Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Mirage Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kogake Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "23.9",
		Name = "Neo K2",
		Tier = "Neo",
		Vaulted = "24.2.2",
	},
	["Neo K3"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Rubico Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Tiberon Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "30.0.8",
		Name = "Neo K3",
		Tier = "Neo",
		Vaulted = "32.0.3",
	},
	["Neo K4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Panthera Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Knell Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Neo K4",
		Tier = "Neo",
		Vaulted = "31.7",
	},
	["Neo K5"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Afuris Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Khora Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2.5",
		Name = "Neo K5",
		Tier = "Neo",
		Vaulted = "34",
	},
	["Neo K6"] = {
		Drops = {
			{
				Item = "Cobra & Crane Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Hystrix Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Khora Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Neo K6",
		Tier = "Neo",
		Vaulted = "35.5.9",
	},
	["Neo K7"] = {
		Drops = {
			{
				Item = "Fulmin Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gunsen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Khora Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Neo K7",
		Tier = "Neo",
		Vaulted = "35.5.9",
	},
	["Neo K8"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Khora Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.7",
		Name = "Neo K8",
		Tier = "Neo",
		Vaulted = "37.0.7",
	},
	["Neo K9"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kestrel Prime",
				Part = "Grip",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Neo K9",
		Tier = "Neo",
		Vaulted = "43.0",
	},	
	["Neo L1"] = {
		Drops = {
			{
				Item = "Euphona Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kronen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Neo L1",
		Tier = "Neo",
		Vaulted = "24.2.2",
	},
	["Neo L2"] = {
		Drops = {
			{
				Item = "Strun Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Khora Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corvas Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Neo L2",
		Tier = "Neo",
		Vaulted = "33.6",
	},
	["Neo L3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Neo L3",
		Tier = "Neo",
		Vaulted = "34",
	},
	["Neo L4"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Velox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Neo L4",
		Tier = "Neo",
		Vaulted = "38.0.10",
	},
	["Neo M1"] = {
		Drops = {
			{
				Item = "Akbolto Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Euphona Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Helios Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mirage Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.7",
		Name = "Neo M1",
		Tier = "Neo",
		Vaulted = "24.2.2",
	},
	["Neo M2"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Limbo Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Neo M2",
		Tier = "Neo",
		Vaulted = "27.3.6",
	},
	["Neo M3"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Neo M3",
		Tier = "Neo",
		Vaulted = "29.3",
	},
	["Neo M4"] = {
		Drops = {
			{
				Item = "Strun Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Scourge Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Magnus Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Neo M4",
		Tier = "Neo",
		Vaulted = "33.6",
	},
	["Neo M5"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Grendel Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Masseter Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Neo M5",
		Tier = "Neo",
		Vaulted = "37.0.9",
	},
	["Neo M6"] = {
		Drops = {
			{
				Item = "Akarius Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Masseter Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.7",
		Name = "Neo M6",
		Tier = "Neo",
		Vaulted = "42.0.7",
	},
	["Neo N1"] = {
		Drops = {
			{
				Item = "Hikou Prime",
				Part = "Stars",
				Rarity = "Common",
			},
			{
				Item = "Vectis Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Soma Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Kubrow Collar Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nyx Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Neo N1",
		Tier = "Neo",
		Vaulted = "The Silver Grove 3",
	},
	["Neo N2"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nova Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Neo N2",
		Tier = "Neo",
		Vaulted = "19.0.7",
	},
	["Neo N3"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Odonata Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Neo N3",
		Tier = "Neo",
		Vaulted = "19.11.5",
	},
	["Neo N4"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Venka Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Neo N4",
		Tier = "Neo",
		Vaulted = "20.6.2",
	},
	["Neo N5"] = {
		Drops = {
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akstiletto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Neo N5",
		Tier = "Neo",
		Vaulted = "20.6.2",
	},
	["Neo N6"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Trinity Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Hilt",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Neo N6",
		Tier = "Neo",
		Vaulted = "21.6",
	},
	["Neo N7"] = {
		Drops = {
			{
				Item = "Trinity Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Euphona Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blades",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.4",
		Name = "Neo N7",
		Tier = "Neo",
		Vaulted = "21.6",
	},
	["Neo N8"] = {
		Drops = {
			{
				Item = "Hydroid Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbolto Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Neo N8",
		Tier = "Neo",
		Vaulted = "24.5.8",
	},
	["Neo N9"] = {
		Drops = {
			{
				Item = "Boar Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dakra Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Mag Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Soma Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Nova Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.0.6",
		Name = "Neo N9",
		Tier = "Neo",
		Vaulted = "24.2.11",
	},
	["Neo N10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Zephyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Tipedo Prime",
				Part = "Ornament",
				Rarity = "Uncommon",
			},
			{
				Item = "Nami Skyla Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Neo N10",
		Tier = "Neo",
		Vaulted = "25.3",
	},
	["Neo N11"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Sybaris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nekros Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.1.1",
		Name = "Neo N11",
		Tier = "Neo",
		Vaulted = "27.5.6",
	},
	["Neo N12"] = {
		Drops = {
			{
				Item = "Soma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Band",
				Rarity = "Uncommon",
			},
			{
				Item = "Nova Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.5.6",
		Name = "Neo N12",
		Tier = "Neo",
		Vaulted = "29.2",
	},
	["Neo N13"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Neo N13",
		Tier = "Neo",
		Vaulted = "30.3",
	},
	["Neo N14"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Titania Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Neo N14",
		Tier = "Neo",
		Vaulted = "30.3",
	},
	["Neo N15"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Baza Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Neo N15",
		Tier = "Neo",
		Vaulted = "30.7",
	},
	["Neo N16"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pandero Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Neo N16",
		Tier = "Neo",
		Vaulted = "32.0.9",
	},
	["Neo N17"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Pangolin Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Neo N17",
		Tier = "Neo",
		Vaulted = "31.3",
	},
	["Neo N18"] = {
		Drops = {
			{
				Item = "Corinth Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Scourge Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nidus Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31",
		Name = "Neo N18",
		Tier = "Neo",
		Vaulted = "31.3",
	},
	["Neo N19"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Hilt",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.12",
		Name = "Neo N19",
		Tier = "Neo",
		Vaulted = "38.0.12",
	},
	["Neo N20"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Garuda Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tenora Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Pandero Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Nezha Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.3",
		Name = "Neo N20",
		Tier = "Neo",
		Vaulted = "31.7",
	},
	["Neo N21"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gara Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Khora Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Neo N21",
		Tier = "Neo",
		Vaulted = "32.3.6",
	},
	["Neo N22"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Magnus Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Neo N22",
		Tier = "Neo",
		Vaulted = "33.6",
	},
	["Neo N23"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Nagantaka Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Neo N23",
		Tier = "Neo",
		Vaulted = "35.0.9",
	},
	["Neo N24"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Daikyu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venato Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Kestrel Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Lavos Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Neo N24",
		Tier = "Neo",
		Vaulted = "43.0",
	},
	["Neo O1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Odonata Prime",
				Part = "Harness Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Aklex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Volt Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Odonata Prime",
				Part = "Wings Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.15.1",
		IsBaro = true,
		Name = "Neo O1",
		Tier = "Neo",
	},
	["Neo O2"] = {
		Drops = {
			{
				Item = "Zylok Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Acceltra Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Fulmin Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Okina Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Neo O2",
		Tier = "Neo",
		Vaulted = "36.1",
	},
	["Neo O3"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Xaku Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Okina Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Neo O3",
		Tier = "Neo",
		Vaulted = "42.0.6",
	},	
	["Neo P1"] = {
		Drops = {
			{
				Item = "Ninkondi Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Neo P1",
		Tier = "Neo",
		Vaulted = "28.2",
	},
	["Neo P2"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pandero Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Neo P2",
		Tier = "Neo",
		Vaulted = "31",
	},
	["Neo P3"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Panthera Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Neo P3",
		Tier = "Neo",
		Vaulted = "31.3",
	},
	["Neo P4"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Zakti Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pandero Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "31.0.11",
		Name = "Neo P4",
		Tier = "Neo",
		Vaulted = "31.7",
	},
	["Neo P5"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volnus Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Gara Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.1.2",
		Name = "Neo P5",
		Tier = "Neo",
		Vaulted = "35.1.2",
	},
	["Neo P6"] = {
		Drops = {
			{
				Item = "Gunsen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Masseter Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Stock",
				Rarity = "Rare",
			},
		},
		Introduced = "35.5.9",
		Name = "Neo P6",
		Tier = "Neo",
		Vaulted = "36.1",
	},
	["Neo P7"] = {
		Drops = {
			{
				Item = "Gauss Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hildryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Larkspur Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Neo P7",
		Tier = "Neo",
		Vaulted = "38.0.10",
	},
	["Neo P8"] = {
		Drops = {
			{
				Item = "Baruuk Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Afuris Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Phantasma Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "38.6.3",
		Name = "Neo P8",
		Tier = "Neo",
		Vaulted = "38.6.3",
	},
	["Neo P9"] = {
		Drops = {
			{
				Item = "Alternox Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Epitaph Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Orthos Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Neo P9",
		Tier = "Neo",
		Vaulted = "42.0.6",
	},	
	["Neo P10"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nautilus Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Cedo Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Stock",
				Rarity = "Uncommon",
			},
			{
				Item = "Perigale Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Neo P10",
		Tier = "Neo",
		Vaulted = "43.0",
	},	
	["Neo Q1"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Grendel Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Quassus Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Neo Q1",
		Tier = "Neo",
		Vaulted = "38.0.10",
	},
	["Neo R1"] = {
		Drops = {
			{
				Item = "Ankyros Prime",
				Part = "Gauntlet",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hikou Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Boltor Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Nyx Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rhino Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.1.2",
		Name = "Neo R1",
		Tier = "Neo",
		Vaulted = "31.1.3",
	},
	["Neo R2"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Tiberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Rubico Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Neo R2",
		Tier = "Neo",
		Vaulted = "27.0.4",
	},
	["Neo R3"] = {
		Drops = {
			{
				Item = "Baza Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Chain",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Grip",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Neo R3",
		Tier = "Neo",
		Vaulted = "27.3.6",
	},
	["Neo R4"] = {
		Drops = {
			{
				Item = "Aksomati Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Chain",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "27.3.6",
		Name = "Neo R4",
		Tier = "Neo",
		Vaulted = "29.3",
	},
	["Neo R5"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Limbo Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3",
		Name = "Neo R5",
		Tier = "Neo",
		Vaulted = "32.3",
	},
	["Neo S1"] = {
		Drops = {
			{
				Item = "Carrier Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Soma Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Neo S1",
		Tier = "Neo",
		Vaulted = "19.0.7",
	},
	["Neo S2"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Nova Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nyx Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Neo S2",
		Tier = "Neo",
		Vaulted = "The Silver Grove 3",
	},
	["Neo S3"] = {
		Drops = {
			{
				Item = "Soma Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Carrier Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vasto Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Neo S3",
		Tier = "Neo",
		Vaulted = "19.0.7",
	},
	["Neo S5"] = {
		Drops = {
			{
				Item = "Latron Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Ember Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Reaper Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Glaive Prime",
				Part = "Disc",
				Rarity = "Uncommon",
			},
			{
				Item = "Frost Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Sicarus Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "19.3",
		Name = "Neo S5",
		Tier = "Neo",
		Vaulted = "24.5.6",
	},
	["Neo S6"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trinity Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Kavasa Prime",
				Part = "Buckle",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Neo S6",
		Tier = "Neo",
		Vaulted = "21.6",
	},
	["Neo S7"] = {
		Drops = {
			{
				Item = "Banshee Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Ballistica Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Sybaris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Neo S7",
		Tier = "Neo",
		Vaulted = "24.2.2",
	},
	["Neo S8"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Hydroid Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Spira Prime",
				Part = "Pouch",
				Rarity = "Rare",
			},
		},
		Introduced = "21.6",
		Name = "Neo S8",
		Tier = "Neo",
		Vaulted = "22.7",
	},
	["Neo S9"] = {
		Drops = {
			{
				Item = "Akjagara Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Destreza Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Neo S9",
		Tier = "Neo",
		Vaulted = "24.5.8",
	},
	["Neo S10"] = {
		Drops = {
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Nikana Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.15",
		Name = "Neo S10",
		Tier = "Neo",
		Vaulted = "24.3.3",
	},
	["Neo S11"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Hydroid Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kronen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.5.8",
		Name = "Neo S11",
		Tier = "Neo",
		Vaulted = "25.3",
	},
	["Neo S12"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Upper Limb",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Mirage Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Neo S12",
		Tier = "Neo",
		Vaulted = "25.8",
	},
	["Neo S13"] = {
		Drops = {
			{
				Item = "Nikana Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Spira Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.7.3",
		Name = "Neo S13",
		Tier = "Neo",
		Vaulted = "26.0.8",
	},
	["Neo S14"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Karyst Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Pangolin Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Stradavar Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Neo S14",
		Tier = "Neo",
		Vaulted = "29.9",
	},
	["Neo S15"] = {
		Drops = {
			{
				Item = "Astilla Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Garuda Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "31.7",
		Name = "Neo S15",
		Tier = "Neo",
		Vaulted = "32.2.5",
	},
	["Neo S16"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Aksomati Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Oberon Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Guard",
				Rarity = "Rare",
			},
		},
		Introduced = "32.2",
		Name = "Neo S16",
		Tier = "Neo",
		Vaulted = "32.2",
	},
	["Neo S17"] = {
		Drops = {
			{
				Item = "Paris Prime",
				Part = "Lower Limb",
				Rarity = "Common",
			},
			{
				Item = "Revenant Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Baruuk Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Hildryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "32.3.6",
		Name = "Neo S17",
		Tier = "Neo",
		Vaulted = "33.6",
	},
	["Neo S18"] = {
		Drops = {
			{
				Item = "Hildryn Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cobra & Crane Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Grendel Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Shade Prime",
				Part = "Carapace",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Neo S18",
		Tier = "Neo",
		Vaulted = "36.1",
	},
	["Neo S19"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Strun Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nidus Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Saryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Strun Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.12",
		Name = "Neo S19",
		Tier = "Neo",
		Vaulted = "38.0.12",
	},
	["Neo S20"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Kompressa Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sarofang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vadarya Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Neo S20",
		Tier = "Neo",
		Vaulted = "43.0",
	},
	["Neo T1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Fragor Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Tigris Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "19.11.5",
		Name = "Neo T1",
		Tier = "Neo",
		Vaulted = "21.6",
	},
	["Neo T2"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wukong Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dethcube Prime",
				Part = "Carapace",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tekko Prime",
				Part = "Blade",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Neo T2",
		Tier = "Neo",
		Vaulted = "30.3",
	},
	["Neo T3"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Atlas Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Inaros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "28.2",
		Name = "Neo T3",
		Tier = "Neo",
		Vaulted = "29.3",
	},
	["Neo T4"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ivara Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Astilla Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Neo T4",
		Tier = "Neo",
		Vaulted = "31",
	},
	["Neo T5"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Aksomati Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Corinth Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Magnus Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "30.7",
		Name = "Neo T5",
		Tier = "Neo",
		Vaulted = "31",
	},
	["Neo T6"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Astilla Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Tatsu Prime",
				Part = "Blade",
				Rarity = "Uncommon",
			},
			{
				Item = "Scourge Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32.0.9",
		Name = "Neo T6",
		Tier = "Neo",
		Vaulted = "32.2.5",
	},
	["Neo T7"] = {
		Drops = {
			{
				Item = "Afuris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Harrow Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gunsen Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Tatsu Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "33.6",
		Name = "Neo T7",
		Tier = "Neo",
		Vaulted = "34",
	},
	["Neo T8"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Octavia Prime",
				Part = "Systems Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Vasto Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Nezha Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pandero Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Tenora Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Neo T8",
		Tier = "Neo",
		Vaulted = "34",
	},
	["Neo T9"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Sevagoth Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Cedo Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Gauss Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Neo T9",
		Tier = "Neo",
		Vaulted = "41",
	},
	["Neo T10"] = {
		Drops = {
			{
				Item = "Dual Zoren Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gyre Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nautilus Prime",
				Part = "Systems",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "41",
		Name = "Neo T10",
		Tier = "Neo",
		Vaulted = "43.0",
	},	
	["Neo T11"] = {
		Drops = {
			{
				Item = "Perigale Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Yareli Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Kestrel Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Trumna Prime",
				Part = "Receiver",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Neo T11",
		Tier = "Neo",
	},	
	["Neo V1"] = {
		Drops = {
			{
				Item = "Nyx Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Dual Kamas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Volt Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Nova Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "Specters of the Rail",
		Name = "Neo V1",
		Tier = "Neo",
		Vaulted = "The Silver Grove 3",
	},
	["Neo V2"] = {
		Drops = {
			{
				Item = "Fang Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Galatine Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Neo V2",
		Tier = "Neo",
		Vaulted = "22.16.4",
	},
	["Neo V3"] = {
		Drops = {
			{
				Item = "Galatine Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Carrier Prime",
				Part = "Systems",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "The Silver Grove 3",
		Name = "Neo V3",
		Tier = "Neo",
		Vaulted = "20.6.2",
	},
	["Neo V4"] = {
		Drops = {
			{
				Item = "Cernos Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Tigris Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Saryn Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Venka Prime",
				Part = "Gauntlet",
				Rarity = "Rare",
			},
		},
		Introduced = "19.0.7",
		Name = "Neo V4",
		Tier = "Neo",
		Vaulted = "20.6.2",
	},
	["Neo V5"] = {
		Drops = {
			{
				Item = "Helios Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Silva & Aegis Prime",
				Part = "Hilt",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "20.6.2",
		Name = "Neo V5",
		Tier = "Neo",
		Vaulted = "22.16.4",
	},
	["Neo V6"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Grip",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fragor Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Mirage Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Vauban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.7",
		Name = "Neo V6",
		Tier = "Neo",
		Vaulted = "22.16.4",
	},
	["Neo V7"] = {
		Drops = {
			{
				Item = "Akbolto Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Pyrana Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Banshee Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Cernos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "23.0.3",
		Name = "Neo V7",
		Tier = "Neo",
		Vaulted = "23.9",
	},
	["Neo V8"] = {
		Drops = {
			{
				Item = "Loki Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Odonata Prime",
				Part = "Harness Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wyrm Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bo Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Volt Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.8.2",
		Name = "Neo V8",
		Tier = "Neo",
		Vaulted = "25.3",
	},
	["Neo V9"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nyx Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Venka Prime",
				Part = "Blades",
				Rarity = "Common",
			},
			{
				Item = "Cernos Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Valkyr Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "29.10",
		Name = "Neo V9",
		Tier = "Neo",
	},
	["Neo V10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Inaros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Volnus Prime",
				Part = "Handle",
				Rarity = "Rare",
			},
		},
		Introduced = "30.3",
		Name = "Neo V10",
		Tier = "Neo",
		Vaulted = "31.7",
	},
	["Neo V11"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Yareli Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Epitaph Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Voruna Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "42.0.6",
		Name = "Neo V11",
		Tier = "Neo",
		Vaulted = "43.0",
	},
	["Neo V12"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Yareli Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Voruna Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Neo V12",
		Tier = "Neo",
	},
	["Neo W1"] = {
		Drops = {
			{
				Item = "Shade Prime",
				Part = "Cerebrum",
				Rarity = "Common",
			},
			{
				Item = "Gauss Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Dual Keres Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Chassis Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "35.0.9",
		Name = "Neo W1",
		Tier = "Neo",
		Vaulted = "35.5.9",
	},
	["Neo W2"] = {
		Drops = {
			{
				Item = "Akbronco Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Trumna Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Nautilus Prime",
				Part = "Carapace",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Burston Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Wisp Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "37.0.9",
		Name = "Neo W2",
		Tier = "Neo",
		Vaulted = "38.6",
	},
	["Neo X1"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lavos Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akarius Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Quassus Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Braton Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Xaku Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "38.0.10",
		Name = "Neo X1",
		Tier = "Neo",
		Vaulted = "41",
	},
	["Neo Y1"] = {
		Drops = {
			{
				Item = "Trumna Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Fang Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Styanax Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Yareli Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "43.0",
		Name = "Neo Y1",
		Tier = "Neo",
	},
	["Neo Z1"] = {
		Drops = {
			{
				Item = "Orthos Prime",
				Part = "Handle",
				Rarity = "Common",
			},
			{
				Item = "Nekros Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Galatine Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "22.16.4",
		Name = "Neo Z1",
		Tier = "Neo",
		Vaulted = "23.0.3",
	},
	["Neo Z2"] = {
		Drops = {
			{
				Item = "Akbolto Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Pyrana Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "24.2.2",
		Name = "Neo Z2",
		Tier = "Neo",
		Vaulted = "25.8",
	},
	["Neo Z3"] = {
		Drops = {
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Zephyr Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akjagara Prime",
				Part = "Receiver",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "25.3",
		Name = "Neo Z3",
		Tier = "Neo",
		Vaulted = "27.0.4",
	},
	["Neo Z4"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Kronen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Redeemer Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "25.8",
		Name = "Neo Z4",
		Tier = "Neo",
		Vaulted = "27.0.4",
	},
	["Neo Z5"] = {
		Drops = {
			{
				Item = "Akjagara Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Burston Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Lex Prime",
				Part = "Barrel",
				Rarity = "Common",
			},
			{
				Item = "Aksomati Prime",
				Part = "Barrel",
				Rarity = "Uncommon",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "27.0.4",
		Name = "Neo Z5",
		Tier = "Neo",
		Vaulted = "29.3",
	},
	["Neo Z6"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Guandao Prime",
				Part = "Blade",
				Rarity = "Common",
			},
			{
				Item = "Paris Prime",
				Part = "String",
				Rarity = "Common",
			},
			{
				Item = "Tipedo Prime",
				Part = "Ornament",
				Rarity = "Uncommon",
			},
			{
				Item = "Titania Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "29.3",
		Name = "Neo Z6",
		Tier = "Neo",
		Vaulted = "29.9",
	},
	["Neo Z7"] = {
		Drops = {
			{
				Item = "Atlas Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Wukong Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Akbronco Prime",
				Part = "Link",
				Rarity = "Uncommon",
			},
			{
				Item = "Octavia Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "29.9",
		Name = "Neo Z7",
		Tier = "Neo",
		Vaulted = "30.3",
	},
	["Neo Z8"] = {
		Drops = {
			{
				Item = "Braton Prime",
				Part = "Stock",
				Rarity = "Common",
			},
			{
				Item = "Chroma Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Kronen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				ItemCount = 2,
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Gram Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zephyr Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "30.0.8",
		Name = "Neo Z8",
		Tier = "Neo",
		Vaulted = "32.0.3",
	},
	["Neo Z9"] = {
		Drops = {
			{
				Item = "Burston Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Equinox Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ninkondi Prime",
				Part = "Chain",
				Rarity = "Uncommon",
			},
			{
				Item = "Wukong Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zhuge Prime",
				Part = "Barrel",
				Rarity = "Rare",
			},
		},
		Introduced = "32",
		Name = "Neo Z9",
		Tier = "Neo",
		Vaulted = "32.1.1",
	},
	["Neo Z10"] = {
		Drops = {
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Afuris Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Gunsen Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Phantasma Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Revenant Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Zylok Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "34",
		Name = "Neo Z10",
		Tier = "Neo",
		Vaulted = "36.1",
	},
	["Neo Z11"] = {
		Drops = {
			{
				Item = "Acceltra Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Bronco Prime",
				Part = "Receiver",
				Rarity = "Common",
			},
			{
				Item = "Forma",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Shade Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Okina Prime",
				Part = "Handle",
				Rarity = "Uncommon",
			},
			{
				Item = "Zylok Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "36.1",
		Name = "Neo Z11",
		Tier = "Neo",
		Vaulted = "38.0.10",
	},
	["Requiem I"] = {
		Drops = {
			{
				Item = "Riven Sliver",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Kuva",
				ItemCount = 1200,
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Ayatan Amber Star",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Xata",
				Part = "",
				Rarity = "Uncommon",
			},
			{
				Item = "Lohk",
				Part = "",
				Rarity = "Uncommon",
			},
			{
				Item = "Exilus Weapon Adapter",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "26",
		Name = "Requiem I",
		Tier = "Requiem",
		Vaulted = "42",
	},
	["Requiem II"] = {
		Drops = {
			{
				Item = "Riven Sliver",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Kuva",
				ItemCount = 1200,
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Ayatan Amber Star",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Vome",
				Part = "",
				Rarity = "Uncommon",
			},
			{
				Item = "Jahu",
				Part = "",
				Rarity = "Uncommon",
			},
			{
				Item = "Exilus Weapon Adapter",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "26",
		Name = "Requiem II",
		Tier = "Requiem",
		Vaulted = "42",
	},
	["Requiem III"] = {
		Drops = {
			{
				Item = "Riven Sliver",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Kuva",
				ItemCount = 1200,
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Ayatan Amber Star",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Fass",
				Part = "",
				Rarity = "Uncommon",
			},
			{
				Item = "Ris",
				Part = "",
				Rarity = "Uncommon",
			},
			{
				Item = "Exilus Weapon Adapter",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "26",
		Name = "Requiem III",
		Tier = "Requiem",
		Vaulted = "42",
	},
	["Requiem IV"] = {
		Drops = {
			{
				Item = "Riven Sliver",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Kuva",
				ItemCount = 1200,
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Ayatan Amber Star",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Khra",
				Part = "",
				Rarity = "Uncommon",
			},
			{
				Item = "Netra",
				Part = "",
				Rarity = "Uncommon",
			},
			{
				Item = "Exilus Weapon Adapter",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "26",
		Name = "Requiem IV",
		Tier = "Requiem",
		Vaulted = "42",
	},
	["Requiem Eterna"] = {
		Drops = {
			{
				Item = "Khra",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Netra",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Fass",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Ris",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Vome",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Jahu",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Xata",
				Part = "",
				Rarity = "Common",
			},
			{
				Item = "Lohk",
				Part = "",
				Rarity = "Common",
			},
		},
		Introduced = "42",
		Name = "Requiem Eterna",
		Tier = "Requiem",
	},
	["Vanguard C1"] = {
		Drops = {
			{
				Item = "Protea Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ember Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Caliban Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41.0.5",
		Name = "Vanguard C1",
		Tier = "Vanguard",
		Vaulted = "41.0.5",
	},
	["Vanguard E1"] = {
		Drops = {
			{
				Item = "Protea Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Caliban Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ash Prime",
				Part = "Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ember Prime",
				Part = "Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41.0.5",
		Name = "Vanguard E1",
		Tier = "Vanguard",
		Vaulted = "41.0.5",
	},
	["Vanguard M1"] = {
		Drops = {
			{
				Item = "Ember Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Caliban Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Chassis Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Mesa Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41.0.5",
		Name = "Vanguard M1",
		Tier = "Vanguard",
		Vaulted = "41.0.5",
	},
	["Vanguard P1"] = {
		Drops = {
			{
				Item = "Caliban Prime",
				Part = "Chassis Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Mesa Prime",
				Part = "Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Ash Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Common",
			},
			{
				Item = "Volt Prime",
				Part = "Neuroptics Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Ember Prime",
				Part = "Systems Blueprint",
				Rarity = "Uncommon",
			},
			{
				Item = "Protea Prime",
				Part = "Systems Blueprint",
				Rarity = "Rare",
			},
		},
		Introduced = "41.0.5",
		Name = "Vanguard P1",
		Tier = "Vanguard",
		Vaulted = "41.0.5",
	},
}

--- Returns a table with an item part's drop rarity in all relics that it is dropped in.
--  @function	   getItemRarities
--  @param		  {table} primeData Table with item and part names mapped to their relics drops
--									to add DucatValue key to
--  @param		  {string} itemName Prime item name
--  @param		  {string} partName Part name
--  @return		 {table} A map that lists an item part's rarities (e.g. { Rare = true } or { Common = true, Uncommon = true })
local function getItemRarities(primeData, itemName, partName)
	local rarityDict = {}

	for relicName, rarity in pairs(primeData[itemName]['Parts'][partName]['Drops']) do
		rarityDict[rarity] = true
	end
	
	assert(Table.size(rarityDict) ~= 0, 'getItemRarities(itemName, partName): no drop rarities found for "'..itemName..'" and part "'..partName..'"')
	return rarityDict
end

--- Gets the ducat value of a Prime part or blueprint.
--  @function	  getDucatValue
--  @param		  {table} primeData Table with item and part names mapped to their relics drops
--						  to add DucatValue key to
--  @param		{string} itemName Prime item name
--  @param		{string} partName Part name
--  @return	  {number} The ducat value of that Prime part/blueprint
local function getDucatValue(primeData, itemName, partName)
	local rarities = getItemRarities(primeData, itemName, partName)
	
	-- Rare parts are worth 100 ducats
	-- Uncommon parts are worth 45 ducats
	-- Common parts are worth 15 ducats
	-- If an item part is a uncommon and rare drop in different relics, it is worth 65 ducats
	-- If an item part is a common and uncommon drop in different relics, it is worth 25 ducats
	-- If an item part is a common and rare drop in different relics, it is worth 25 ducsts
	
	if DUCAT_EXCEPTIONS[itemName] ~= nil and DUCAT_EXCEPTIONS[itemName][partName] ~= nil then
		return DUCAT_EXCEPTIONS[itemName][partName]
	end

	return ( rarities['Common'] and rarities['Rare'] ) and 25
		or ( rarities['Common'] and rarities['Uncommon'] ) and 25
		or ( rarities['Uncommon'] and rarities['Rare'] ) and 65 
		or rarities['Rare'] and 100
		or rarities['Uncommon'] and 45
		or rarities['Common'] and 15
		or error('getDucatValue(primeData, itemName, partName): "'..itemName..'" has unsupported rarities')
end

--- Adding "DucatValue" key; ducat price of a prime part is based on their rarity
--  of their drops in relics
--  @function	  addDucatValueKey
--  @param		{table} primeData Table with item and part names mapped to their relics drops
--						  to add DucatValue key to
local function addDucatValueKey(primeData)
	for itemName, itemTable in pairs(primeData) do
		for partName, relicTable in pairs(itemTable['Parts']) do
			primeData[itemName]['Parts'][partName]['DucatValue'] = getDucatValue(primeData, itemName, partName)
		end
	end
end

--- Adding "Vaulted" key; an item is vaulted if all its parts (including Blueprint) 
--  are vaulted, meaning that all the relics that it is dropped from are vaulted.
--  @function	  addVaultedKey
--  @param		{table} primeData Table with item and part names mapped to their relics drops
--						  to add Vaulted key to
local function addVaultedKey(primeData)
	for itemName, itemTable in pairs(primeData) do
		-- First assume item is vaulted until we can find a relic that is not vaulted
		-- to disprove this assumption
		local isVaulted = true
		for partName, relicTable in pairs(itemTable['Parts']) do
			for relicName, _ in pairs(relicTable['Drops']) do
				-- If we find at least one relic that is not vaulted,
				-- then that means that item part, thus the whole item, is not vaulted
				if (RelicData[relicName]['Vaulted'] == nil) then
					isVaulted = false
					break
				end
			end
			-- Some optimization once we already find an unvaulted relic
			if (not isVaulted) then
				break
			end
		end
		primeData[itemName]['IsVaulted'] = isVaulted
	end
end

PrimeData = (function() 
	local primeData = {}
	
	-- Looping through all relics and their drops
	for relicName, relicEntry in pairs(RelicData) do
		for i, drop in pairs(relicEntry['Drops']) do
			local itemName = drop['Item']
			local partName = drop['Part']
			-- Initiating an item entry
			if (primeData[itemName] == nil) then
				primeData[itemName] = {}
				primeData[itemName]['Parts'] = {}
			end
			-- Adding a part table to item entry
			if (primeData[itemName]['Parts'][partName] == nil) then
				primeData[itemName]['Parts'][partName] = {}
				primeData[itemName]['Parts'][partName]['Drops'] = {}
			end
			-- Insert the name of relic that an item part is dropped in
			primeData[itemName]['Parts'][partName]['Drops'][relicName] = drop['Rarity']
		end
	end
	
	addVaultedKey(primeData)
	addDucatValueKey(primeData)
	
	return primeData
end)()

return { RelicData = RelicData, PrimeData = PrimeData }
