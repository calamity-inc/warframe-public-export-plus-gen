local MissionData = {
	["FactionImages"] = {
		["Grineer"] = "IconGrineerB.svg",
		["Corpus"] = "IconCorpusB.svg",
		["Infested"] = "IconInfestedB.svg",
		["Orokin"] = "IconOrokinB.svg",
		["Corrupted"] = "IconOrokinB.svg",
		["Crossfire"] = "InvasionIcon_b.png",
		["Tenno"] = "IconTenno.png",
		["Grineer or Corpus"] = "IconGrineerOrCorpus.png",
		["Grineer and Corpus"] = "IconGrineerOrCorpus.png",
		["The Murmur"] = "MurmurIcon.png",
		["Scaldra"] = "ScaldraIcon.png",
		["Techrot"] = "TechrotIcon.png",
		["Duviri"] = "DuviriIcon.png"
	},
	["RegionResources"] = {
		Mercury = { "Ferrite", "Polymer Bundle", "Morphics", "Detonite Ampule" },
		Venus = { "Alloy Plate", "Polymer Bundle", "Circuits", "Fieldron Sample" },
		Earth = { "Ferrite", "Rubedo", "Neurodes", "Detonite Ampule" },
		Mars = { "Gallium", "Morphics", "Salvage", "Fieldron Sample" },
		Phobos = { "Rubedo", "Morphics", "Plastids", "Alloy Plate" },
		Deimos = { "Nano Spores", "Mutagen Sample", "Orokin Cell", "Neurodes" },
		Ceres = { "Alloy Plate", "Circuits", "Orokin Cell", "Detonite Ampule" },
		Jupiter = { "Salvage", "Hexenon", "Neural Sensors", "Alloy Plate" },
		Europa = { "Morphics", "Rubedo", "Fieldron Sample", "Control Module" },
		Saturn = { "Nano Spores", "Plastids", "Orokin Cell", "Detonite Ampule" },
		Uranus = { "Gallium", "Plastids", "Polymer Bundle", "Detonite Ampule" },
		Neptune = { "Nano Spores", "Ferrite", "Control Module", "Fieldron Sample" },
		Pluto = { "Rubedo", "Morphics", "Plastids", "Alloy Plate", "Fieldron Sample" },
		Sedna = { "Alloy Plate", "Rubedo", "Salvage", "Detonite Ampule" },
		Eris = { "Nano Spores", "Plastids", "Neurodes", "Mutagen Sample" },
		Void = { "Ferrite", "Rubedo", "Argon Crystal", "Control Module" },
		Lua = { "Ferrite", "Rubedo", "Neurodes", "Detonite Ampule" },
		['Höllvania'] = { "Höllvanian Pitchweave Fragment", "Experimental Arc-Relay", "Efervon Sample", "Techrot Chitin", "Techrot Motherboard"},
		["Kuva Fortress"] = { "Salvage", "Circuits", "Neural Sensors", "Detonite Ampule" },
		["Zariman Ten Zero"] = { "Ferrite", "Alloy Plate", "Voidgel Orb", "Entrati Lanthorn" },
	},
	["MissionTypes"] = {
		Assassination = {
			Name = "Assassination",
			Link = "Assassination",
			Introduced = "Vanilla",
			Index = 0,
			InternalName = "MT_ASSASSINATION",
			IsEndless = false
		},
		Exterminate = {
			Name = "Exterminate",
			Link = "Exterminate",
			Introduced = "Vanilla",
			Index = 1,
			InternalName = "MT_EXTERMINATION",
			IsEndless = false
		},
		Survival = {
			Name = "Survival",
			Link = "Survival",
			Introduced = "9.7",
			Index = 2,
			InternalName = "MT_SURVIVAL",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		Rescue = {
			Name = "Rescue",
			Link = "Rescue",
			Introduced = "Vanilla",
			Index = 3,
			InternalName = "MT_RESCUE",
			IsEndless = false
		},
		Sabotage = {
			Name = "Sabotage",
			Link = "Sabotage",
			Introduced = "Vanilla",
			Index = 4,
			InternalName = "MT_SABOTAGE",
			IsEndless = false
		},
		Capture = {
			Name = "Capture",
			Link = "Capture",
			Introduced = "Vanilla",
			Index = 5,
			InternalName = "MT_CAPTURE",
			IsEndless = false
		},
		Deception = {
			Name = "Deception",
			Link = "Deception",
			Introduced = "Vanilla",
			Index = 6,
			InternalName = "MT_COUNTER_INTEL",
			IsEndless = false
		},
		Spy = {
			Name = "Spy",
			Link = "Spy",
			Introduced = "Vanilla",
			Index = 7,
			InternalName = "MT_INTEL",
			IsEndless = false
		},
		Defense = {
			Name = "Defense",
			Link = "Defense",
			Introduced = "Vanilla",
			Index = 8,
			InternalName = "MT_DEFENSE",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		["Mobile Defense"] = {
			Name = "Mobile Defense",
			Link = "Mobile Defense",
			Introduced = "Vanilla",
			Index = 9,
			InternalName = "MT_MOBILE_DEFENSE",
			IsEndless = false
		},
		["Conclave"] = {
			Name = "Conclave",
			Link = "Conclave",
			Introduced = "10",
			Index = 10,
			InternalName = "MT_PVP",
			IsEndless = false
		},
		["Mastery Test"] = {
			Name = "Mastery Test",
			Link = "Mastery Rank",
			Introduced = "7",
			Index = 11,
			InternalName = "MT_MASTERY",
			IsEndless = false
		},
		Recovery = {
			Name = "Recovery",
			Link = "Recovery",
			Introduced = "11.7.3",
			Index = 12,
			InternalName = "MT_RECOVERY",
			IsEndless = false
		},
		Interception = {
			Name = "Interception",
			Link = "Interception",
			Introduced = "12",
			Index = 13,
			InternalName = "MT_TERRITORY",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		Hijack = {
			Name = "Hijack",
			Link = "Hijack",
			Introduced = "12.4",
			Index = 14,
			InternalName = "MT_RETRIEVAL",
			IsEndless = false
		},
		["Hive Sabotage"] = {
			Name = "Hive Sabotage",
			Link = "Sabotage/Hive",
			Introduced = "13.8",
			Index = 15,
			InternalName = "MT_HIVE",
			IsEndless = false
		},
		["Solar Rail Conflict"] = {
			Name = "Solar Rail Conflict",
			Link = "Solar Rail Conflict",
			Introduced = "14",
			Index = 16,
			InternalName = "MT_SALVAGE",
			IsEndless = false
		},
		Excavation = {
			Name = "Excavation",
			Link = "Excavation",
			Introduced = "14.5",
			Index = 17,
			InternalName = "MT_EXCAVATE",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		Relay = {
			Name = "Relay",
			Link = "Relay",
			Introduced = "15.5.3",
			InternalName = "",
			IsEndless = false
		},
		["Trial"] = {
			Name = "Trial",
			Link = "Trial",
			Introduced = "16",
			Index = 18,
			InternalName = "MT_RAID",
			IsEndless = false
		},
		["Annihilation"] = {
			Name = "Annihilation",
			Link = "Annihilation",
			Introduced = "16",
			InternalName = "",
			IsEndless = false
		},
		["Cephalon Capture"] = {
			Name = "Cephalon Capture",
			Link = "Cephalon Capture",
			Introduced = "16",
			InternalName = "",
			IsEndless = false
		},
		["Team Annihilation"] = {
			Name = "Team Annihilation",
			Link = "Team Annihilation",
			Introduced = "16",
			InternalName = "",
			IsEndless = false
		},
		["MT_PURGE"] = {
			Name = "MT_PURGE",
			Link = "MT_PURGE",
			Introduced = "999",
			Index = 19,
			InternalName = "MT_PURGE"
		},
		["MT_GENERIC"] = {
			Name = "MT_GENERIC",
			Link = "MT_GENERIC",
			Introduced = "999",
			Index = 20,
			InternalName = "MT_GENERIC"
		},
		["Infested Salvage"] = {
			Name = "Infested Salvage",
			Link = "Infested Salvage",
			Introduced = "19.5",
			Index = 21,
			InternalName = "MT_PURIFY",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		Arena = {
			Name = "Arena",
			Link = "Arena",
			Index = 22,
			Introduced = "18.10",
			InternalName = "MT_ARENA",
			IsEndless = false
		},
		Lunaro = {
			Name = "Lunaro",
			Link = "Lunaro",
			Introduced = "Lunaro",
			Index = 10,
			InternalName = "MT_PVP",
			IsEndless = false
		},
		["Solar Rail Junction"] = {
			Name = "Solar Rail Junction",
			Link = "Junction",
			Introduced = "Specters of the Rail",
			Index = 23,
			InternalName = "MT_JUNCTION",
			IsEndless = false
		},
		Pursuit = {
			Name = "Pursuit",
			Link = "Pursuit",
			Introduced = "Specters of the Rail",
			Index = 24,
			InternalName = "MT_PURSUIT",
			IsEndless = false
		},
		Rush = {
			Name = "Rush",
			Link = "Rush (Archwing)",
			Introduced = "Specters of the Rail",
			Index = 25,
			InternalName = "MT_RACE",
			IsEndless = false
		},
		Assault = {
			Name = "Assault",
			Link = "Assault",
			Introduced = "19",
			Index = 26,
			InternalName = "MT_ASSAULT",
			IsEndless = false
		},
		Defection = {
			Name = "Defection",
			Link = "Defection",
			Introduced = "19.12",
			Index = 27,
			InternalName = "MT_EVACUATION",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		["Free Roam"] = {
			Name = "Free Roam",
			Link = "Open World",
			Introduced = "22",
			Index = 28,
			InternalName = "MT_LANDSCAPE",
			IsEndless = false
		},
		Hub = {
			Name = "Hub",
			Link = "Hub",
			Introduced = "22",
			InternalName = "",
			IsEndless = false
		},
		["MT_RESOURCE_THEFT"] = {
			Name = "MT_RESOURCE_THEFT",
			Link = "",
			Introduced = "999",
			Index = 29,
			InternalName = "MT_RESOURCE_THEFT",
			IsEndless = false
		},
		["Sanctuary Onslaught"] = {
			Name = "Sanctuary Onslaught",
			Link = "Sanctuary Onslaught",
			Introduced = "22.18",
			Index = 30,
			InternalName = "MT_ENDLESS_EXTERMINATION",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		["The Circuit"] = {
			Name = "The Circuit",
			Link = "The Circuit",
			Introduced = "33",
			Index = 31,
			InternalName = "MT_ENDLESS_DUVIRI",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		Disruption = {
			Name = "Disruption",
			Link = "Disruption",
			Introduced = "25",
			Index = 33,
			InternalName = "MT_ARTIFACT",
			IsEndless = true,
			RewardRotation = "Unique, see [[Disruption#Rewards]]"
		},
		["Free Flight"] = {
			Name = "Free Flight",
			Link = "Free Flight",
			Introduced = "27",
			Index = 32,
			InternalName = "MT_RAILJACK",
			IsEndless = false
		},
		Skirmish = {
			Name = "Skirmish",
			Link = "Skirmish",
			Introduced = "27",
			Index = 32,
			InternalName = "MT_RAILJACK",
			IsEndless = false
		},
		Orphix = {
			Name = "Orphix",
			Link = "Orphix (Mission)",
			Introduced = "29.6",
			Index = 32,
			InternalName = "MT_RAILJACK",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		Volatile = {
			Name = "Volatile",
			Link = "Volatile",
			Introduced = "29.10",
			Index = 32,
			InternalName = "MT_RAILJACK",
			IsEndless = false
		},
		["Void Flood"] = {
			Name = "Void Flood",
			Link = "Void Flood",
			Introduced = "31.5",
			Index = 34,
			InternalName = "MT_CORRUPTION",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		["Void Cascade"] = {
			Name = "Void Cascade",
			Link = "Void Cascade",
			Introduced = "31.5",
			Index = 35,
			InternalName = "MT_VOID_CASCADE",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		["Void Armageddon"] = {
			Name = "Void Armageddon",
			Link = "Void Armageddon",
			Introduced = "31.5",
			Index = 36,
			InternalName = "MT_ARMAGEDDON",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		["Mirror Defense"] = {
			Name = "Mirror Defense",
			Link = "Mirror Defense",
			Introduced = "32.3",
			Index = 8,
			InternalName = "MT_DEFENSE",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		Netracells = {
			Name = "Netracells",
			Link = "Netracells",
			Introduced = "35",
			Index = 37,
			InternalName = "MT_VAULTS",
			IsEndless = false
		},
		Alchemy = {
			Name = "Alchemy",
			Link = "Alchemy",
			Introduced = "35",
			Index = 38,
			InternalName = "MT_ALCHEMY",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		Ascension = {
			Name = "Ascension",
			Link = "Ascension",
			Introduced = "36",
			Index = 39,
			InternalName = "MT_ASCENSION",
			IsEndless = false
		},
		["Shrine Defense"] = {
			Name = "Shrine Defense",
			Link = "Shrine Defense",
			Index = 41,
			Introduced = "37",
			InternalName = "MT_OFFERING",
			IsEndless = false
		},
		["Hell-Scrub"] = {
			Name = "Hell-Scrub",
			Link = "Hell-Scrub",
			Introduced = "38",
			InternalName = "MT_EXTERMINATION",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		["Legacyte Harvest"] = {
			Name = "Legacyte Harvest",
			Link = "Legacyte Harvest",
			Index = 40,
			Introduced = "38",
			InternalName = "MT_ENDLESS_CAPTURE",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		["Faceoff"] = {
			Name = "Faceoff",
			Link = "Faceoff",
			Index = 42,
			Introduced = "38",
			InternalName = "MT_PVPVE",
			IsEndless = false
		},
		["Stage Defense"] = {
			Name = "Stage Defense",
			Link = "Stage Defense",
			Index = 8,
			Introduced = "38.5",
			InternalName = "MT_DEFENSE",
			IsEndless = true,
			RewardRotation = "AABC"
		},
		["The Descendia"] = {
			Name = "The Descendia",
			Link = "The Descendia",
			Index = 43,
			Introduced = "41",
			InternalName = "MT_DESCENT",
			IsEndless = false,
		},
		["The Perita Rebellion"] = {
			Name = "The Perita Rebellion",
			Link = "The Perita Rebellion",
			Index = 44,
			Introduced = "41",
			InternalName = "MT_TAU_WAR",
			IsEndless = false,
		},
		["The Guilty"] = {
			Name = "The Guilty",
			Link = "The Guilty",
			Index = 44,
			Introduced = "42",
			InternalName = "MT_TAU_WAR",
			IsEndless = false,
		},
		["Follie's Hunt"] = {
			Name = "Follie's Hunt",
			Link = "Follie's Hunt",
			Index = 45,
			Introduced = "42",
			InternalName = "MT_PAINT_FLOOD",
			IsEndless = false
		}
	},
	-- Gameplay modifiers or unique gameplay objectives within a particular the mission type
	-- ("the mission/gamemode within the mission" or "the mission on top of the base mission").
	-- Basically any gamemodes that are not necessarily attached to a particular node
	-- Currently in use in M:DropTables
	["MissionModifiers"] = {
		["Arcana Isolation Vault Bounty"] = {
			Name = "Arcana Isolation Vault Bounty",
			Link = "Isolation Vault",
			LocationNote = "*[[Cambion Drift]], [[Deimos]]; must complete initial [[Isolation Vault]] Bounty to unlock access to Arcana Vaults from [[Mother]] outside of Vaults"
		},
		["Arbitrations"] = {
			Name = "Arbitrations",
			Link = "Arbitrations",
			LocationNote = "See alerts tab in in-game [[World State Window]], must unlock from [[Junction|Eris Junction]] on [[Pluto]]"
		},
		["Archon Hunt"] = {
			Name = "Archon Hunt",
			Link = "Archon Hunt",
			LocationNote = "See in-game [[World State Window]], must complete [[Veilbreaker]] quest"
		},
		["Bounty"] = {
			Name = "Bounty",
			Link = "Bounty",
			LocationNote = "*[[Plains of Eidolon]]/[[Cetus]], [[Earth]]\n*[[Orb Vallis]]/[[Fortuna]], [[Venus]]\n*[[Cambion Drift]]/[[Necralisk]], [[Deimos]]\n*[[Chrysalith]], [[Zariman]]\n*[[Sanctum Anatomica]], [[Deimos]]"
		},
		["Cetus Bounty"] = {
			Name = "Cetus Bounty",
			Link = "Plains of Eidolon#Bounties",
			LocationNote = "*[[Plains of Eidolon]]/[[Cetus]], [[Earth]]; talk to [[Konzu]]"
		},
		["Conjunction Survival"] = {
			Introduced = "32.2",
			Name = "Conjunction Survival",
			Link = "Survival#Conjunction Survival",
			LocationNote = "[[Yuvarium]], [[Lua]] or [[Circulus]], [[Lua]]"
		},
		["Corpus Veil Proxima Point of Interest"] = {
			Name = "Corpus Veil Proxima Point of Interest",
			Link = "Veil Proxima",
			LocationNote = "Completing [[Points of Interest]] on any Corpus-controlled node in [[Veil Proxima]]"
		},
		["Crossfire"] = {
			Introduced = "15.13.8",
			Name = "Crossfire",
			Link = "Crossfire",
			LocationNote = "See [[Crossfire#Locations]] for specific locations"
		},
		["Dark Sectors"] = {
			Name = "Dark Sectors",
			Link = "Dark Sectors",
			LocationNote = "See [[Dark Sectors#Locations]] for specific locations"
		},
		["Deepmines Bounty"] = {
			Name = "Deepmines Bounty",
			Link = "Deepmines#Bounties",
			LocationNote = "*[[Fortuna]], [[Venus]]; talk to [[Nightcap]]; Must complete [[The New War]] quest"
		},
		["Deep Archimedea"] ={
			Name = "Deep Archimedea",
			Link = "Deep Archimedea",
			LocationNote = "*[[Sanctum Anatomica]], [[Deimos]]; Must complete [[Whispers in the Walls]] quest and being Rank 5: Illuminate with the [[Cavia]]."
		},
		["Earth Proxima Completion Bonuses"] = {
			Name = "Earth Proxima Completion Bonuses",
			Link = "Earth Proxima",
			LocationNote = "Complete all mission objectives in any node in [[Earth Proxima]]"
		},
		["Earth Proxima Derelict Point of Interest"] = {
			Name = "Earth Proxima Derelict Point of Interest",
			Link = "Earth Proxima",
			LocationNote = "Completing [[Points of Interest]] on any node in [[Earth Proxima]]"
		},
		["Enter Nihil's Oubliette"] = {
			Name = "Enter Nihil's Oubliette",
			Link = "Enter Nihil's Oubliette",
			LocationNote = "Purchase [[Enter Nihil's Oubliette]] key from [[Nightwave]] offerings when available for 60 Nightwave Cred"
		},
		["Fortuna Bounty"] = {
			Name = "Fortuna Bounty",
			Link = "Orb Vallis#Bounties",
			LocationNote = "*[[Orb Vallis]]/[[Fortuna]], [[Venus]]; talk to [[Eudico]]"
		},
		["Fomorian Sabotage"] = {
			Name = "Fomorian Sabotage",
			Link = "Fomorian Sabotage",
			LocationNote = "Near [[Relay]] that is being attacked during [[Fomorian Sabotage]] event"
		},
		["Follie's Hunt"] = {
			Name = "Follie's Hunt",
			Link = "Follie's Hunt",
			LocationNote = "*[[Vesper Relay]], [[Venus]]; Must complete [[Chains of Harrow]] quest to access."
		},
		["Ghoul Bounty"] = {
			Name = "Ghoul Bounty",
			Link = "Ghoul Purge",
			LocationNote = "*[[Plains of Eidolon]]/[[Cetus]], [[Earth]] during [[Ghoul Purge]] event"
		},
		["Granum Void"] = {
			Name = "Granum Void",
			Link = "Granum Void",
			LocationNote = "See [[Granum Void#Mechanics]] for specific locations"
		},
		["Grineer Veil Proxima Derelict Point of Interest"] = {
			Name = "Grineer Veil Proxima Derelict Point of Interest",
			Link = "Veil Proxima",
			LocationNote = "Completing [[Points of Interest]] on any Grineer-controlled node in [[Veil Proxima]]"
		},
		Heist = {
			Name = "Heist",
			Link = "Heist",
			LocationNote = ""
		},
		["Höllvania Central Mall Bounty"] = {
			Name = "Höllvania Central Mall Bounty",
			Link = "Höllvania Central Mall#Bounties",
			LocationNote = "*[[Höllvania Central Mall]], Must complete [[The Hex (Quest)]] to access." 
		},
		["Invasion"] = {
			Name = "Invasion",
			Link = "Invasion",
			LocationNote = "See in-game [[World State Window]] for active Invasion nodes" 
		},
		["Isolation Vault Bounty"] = {
			Name = "Isolation Vault Bounty",
			Link = "Isolation Vault",
			LocationNote = "*[[Cambion Drift]]/[[Necralisk]], [[Deimos]]; talk to [[Mother]]"
		},
		["Kuva Lich Controlled Territory"] = {
			Name = "Kuva Lich Controlled Territory",
			Link = "Kuva Lich",
			LocationNote = "Must complete [[The War Within]] quest to spawn your [[Kuva Lich]]"
		},
		["Kuva Siphon"] = {
			Name = "Kuva Siphon",
			Link = "Kuva Siphon",
			LocationNote = "See alerts tab in in-game [[World State Window]] for active Kuva Siphon nodes, must complete [[The War Within]] quest" 
		},
		["Necralisk Bounty"] = {
			Name = "Necralisk Bounty",
			Link = "Cambion Drift#Bounties",
			LocationNote = "*[[Cambion Drift]]/[[Necralisk]], [[Deimos]]; talk to [[Mother]]"
		},
		["Neptune Proxima Completion Bonuses"] = {
			Name = "Neptune Proxima Completion Bonuses",
			Link = "Neptune Proxima",
			LocationNote = "Complete all mission objectives in any node in [[Neptune Proxima]]"
		},
		["Neptune Proxima Point of Interest"] = {
			Name = "Neptune Proxima Point of Interest",
			Link = "Neptune Proxima",
			LocationNote = "Completing [[Points of Interest]] on any node in [[Neptune Proxima]]"
		},
		["Nightmare Mode"] = {
			Name = "Nightmare Mode",
			Link = "Nightmare Mode",
			LocationNote = "See in-game [[World State Window]] for active Nightmare Mode nodes"
		},
		["Operation: Orphix Venom"] = {
			Name = "Operation: Orphix Venom",
			Link = "Operation: Orphix Venom",
			LocationNote = "Depreciated content, unavailable to players"
		},
		["Operation: Scarlet Spear"] = {
			Name = "Operation: Scarlet Spear",
			Link = "Operation: Scarlet Spear",
			LocationNote = "Depreciated content, unavailable to players"
		},
		["Orokin Vault"] = {
			Name = "Orokin Vault",
			Link = "Orokin Vault",
			LocationNote = "Any mission node on [[Deimos]] except [[Cambion Drift]], [[Magnacidium]], [[Exequias]], and [[Hyf]]"
		},
		["Plague Star"] = {
			Name = "Plague Star",
			Link = "Operation: Plague Star",
			LocationNote = "*[[Plains of Eidolon]]/[[Cetus]], [[Earth]] during [[Plague Star]] event"
		},
		["Pluto Proxima Completion Bonuses"] = {
			Name = "Pluto Proxima Completion Bonuses",
			Link = "Pluto Proxima",
			LocationNote = "Complete all mission objectives in any node in [[Pluto Proxima]]"
		},
		["Pluto Proxima Point of Interest"] = {
			Name = "Pluto Proxima Point of Interest",
			Link = "Pluto Proxima",
			LocationNote = "Completing [[Points of Interest]] on any node in [[Pluto Proxima]]"
		},
		["Profit-Taker Bounty"] = {
			Name = "Profit-Taker Bounty",
			Link = "Profit-Taker Bounty",
			LocationNote = "*[[Fortuna]], [[Venus]]; must be Rank 5: Old Mate with [[Solaris United]] syndicate to access"
		},
		["Razorback Armada"] = {
			Name = "Razorback Armada",
			Link = "Razorback",
			LocationNote = "Near [[Relay]] that is being attacked during [[Razorback Armada]] event"
		},
		["Sanctum Anatomica Bounty"] = {
			Name = "Sanctum Anatomica Bounty",
			Link = "Sanctum Anatomica#Bounties",
			LocationNote = "*[[Sanctum Anatomica]], [[Deimos]]; talk to [[Fibonacci]]"
		},
		["Saturn Proxima Completion Bonuses"] = {
			Name = "Saturn Proxima Completion Bonuses",
			Link = "Saturn Proxima",
			LocationNote = "Complete all mission objectives in any node in [[Saturn Proxima]]"
		},
		["Saturn Proxima Derelict Point of Interest"] = {
			Name = "Saturn Proxima Derelict Point of Interest",
			Link = "Saturn Proxima",
			LocationNote = "Completing [[Points of Interest]] on any node in [[Saturn Proxima]]"
		},
		["Sister of Parvos Controlled Territory"] = {
			Name = "Sister of Parvos Controlled Territory",
			Link = "Sisters of Parvos",
			LocationNote = "Must complete [[Call of the Tempestarii]] quest to spawn your [[Sisters of Parvos|Sister]]"
		},
		["Sortie"] = {
			Name = "Sortie",
			Link = "Sortie",
			LocationNote = "See in-game [[World State Window]]"
		},
		["Tactical Alert"] = {
			Name = "Tactical Alert",
			Link = "Tactical Alert",
			LocationNote = "Depreciated content, unavailable to players; see [[Tactical Alert]] for past alerts"
		},
		["Temporal Archimedea"] ={
			Name = "Temporal Archimedea",
			Link = "Temporal Archimedea",
			LocationNote = "*[[Höllvania Central Mall]], [[Höllvania]]; Must complete [[The Hex (Quest)|The Hex]] quest and obtain Rank 5: Pizza Party with the [[The Hex (Syndicate)]]."
		},
		["The Circuit"] = {
			Name = "The Circuit",
			Link = "The Circuit",
			LocationNote = "Accessed through [[Duviri]]'s The Circuit gamemode"
		},
		["The Steel Path"] = {
			Name = "The Steel Path",
			Link = "The Steel Path",
			LocationNote = "Must complete all nodes on [[Star Chart]] accessible prior to [[The New War]] to toggle The Steel Path difficulty"
		},
		["Veil Proxima Completion Bonuses"] = {
			Name = "Veil Proxima Completion Bonuses",
			Link = "Veil Proxima",
			LocationNote = "Complete all mission objectives in any Grineer node in [[Veil Proxima]]"
		},
		["Veil Proxima Corpus Completion Bonuses"] = {
			Name = "Veil Proxima Corpus Completion Bonuses",
			Link = "Veil Proxima",
			LocationNote = "Complete all mission objectives in any Corpus node in [[Veil Proxima]]"
		},
		["Venus Proxima Completion Bonuses"] = {
			Name = "Venus Proxima Completion Bonuses",
			Link = "Venus Proxima",
			LocationNote = "Complete all mission objectives in any node in [[Venus Proxima]]"
		},
		["Venus Proxima Point of Interest"] = {
			Name = "Venus Proxima Point of Interest",
			Link = "Venus Proxima",
			LocationNote = "Completing [[Points of Interest]] on any node in [[Venus Proxima]]"
		},
		["Void Fissure"] = {
			Name = "Void Fissure",
			Link = "Void Fissure",
			LocationNote = "See in-game [[World State Window]]"
		},
		["Void Storm"] = {
			Name = "Void Storm",
			Link = "Void Fissure",
			LocationNote = "See in-game [[World State Window]] in [[Railjack]] Proxima Star Chart"
		},
		["Weekly Conclave Challenge Reward"] = {
			Name = "Weekly Conclave Challenge Reward",
			Link = "Conclave",
			LocationNote = "Complete all weekly Conclave challenges to get this reward in your in-game inbox:\n*Match Won: Win 6 matches of any game type.\n*Match Complete: Complete 20 matches of any game type.\n*Conditioning: Complete 10 Daily Challenges."
		},
		["Zariman Bounty"] = {
			Name = "Zariman Bounty",
			Link = "Zariman Ten Zero#Bounties",
			LocationNote = "*[[Chrysalith]], [[Zariman]]; talk to [[Quinn]]"
		},
	},
 	["MissionDetails"] = {
		{ Name = "Sanctuary Onslaught", Link = "Sanctuary Onslaught", Image = "SanctuaryOnslaught.png", Planet = "Sanctuary Onslaught", Type = "Sanctuary Onslaught", Quotes = "Sanctuary Onslaught/Quotes", Tileset = "", Enemy = "", MinLevel = 20, MaxLevel = 30, MasteryExp = 0, InternalName = "SolNode801", DropTableAlias = "SanctuaryOnslaughtNormal", IsHidden = true, Introduced = "22.18", Requirements = "Must have [[The New Strange]] completed to access" },
		{ Name = "Elite Sanctuary Onslaught", Link = "Elite Sanctuary Onslaught", Image = "SanctuaryOnslaught.png", Planet = "Sanctuary Onslaught", Type = "Sanctuary Onslaught", Quotes = "Sanctuary Onslaught/Quotes", Tileset = "", Enemy = "", MinLevel = 60, MaxLevel = 70, MasteryExp = 0, InternalName = "SolNode802", DropTableAlias = "SanctuaryOnslaughtElite", IsHidden = true, Introduced = "22.18", Requirements = "Must have [[The New Strange]] completed to access and a level 30 Warframe" },
		
		{ Name = "Cephalon Capture", Link = "Cephalon Capture", Planet = "Saturn", Type = "Conclave", Quotes = "Conclave/Quotes", Tileset = "Tile Sets#Conclave Maps", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "PvpNode0", DropTableAlias = "ConclaveCephalonCapture", ExtraDropTableAlias = "ConclaveCephalonCapture", IsHidden = true, Introduced = "16", CreditReward = 0 },
		{ Name = "Team Annihilation", Link = "Team Annihilation", Planet = "Saturn", Type = "Conclave", Quotes = "Conclave/Quotes", Tileset = "Tile Sets#Conclave Maps", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "PvpNode9", DropTableAlias = "ConclaveTeamAnnihilation", ExtraDropTableAlias = "ConclaveTeamAnnihilation", IsHidden = true, Introduced = "16", CreditReward = 0 },
		{ Name = "Annihilation", Link = "Annihilation", Planet = "Saturn", Type = "Conclave", Quotes = "Conclave/Quotes", Tileset = "Tile Sets#Conclave Maps", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "PvpNode10", DropTableAlias = "ConclaveAnnihilation", ExtraDropTableAlias = "ConclaveAnnihilation", IsHidden = true, Introduced = "16", CreditReward = 0 },
		{ Name = "Lunaro Arena", Link = "Lunaro", Planet = "Saturn", Type = "Conclave", Quotes = "Conclave/Quotes", Tileset = "Tile Sets#Conclave Maps", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "", DropTableAlias = "ConclaveLunaro", ExtraDropTableAlias = "ConclaveLunaro", IsHidden = true, Introduced = "Update: Lunaro", CreditReward = 0 },
		
		{ Name = "Apollodorus", Link = "Apollodorus", Planet = "Mercury", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 6, MaxLevel = 11, DropTableAlias = "Survival1", MasteryExp = 0, InternalName = "SolNode94", Introduced = "Vanilla", PreviousNodes = { "Boethius" }, IsTracked = true },
		{ Name = "Boethius", Link = "Boethius", Planet = "Mercury", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 8, MaxLevel = 10, MasteryExp = 3, InternalName = "SolNode223", NextNodes = { "Apollodorus" }, PreviousNodes = { "M Prime" }, IsTracked = true },
		{ Name = "Caloris", Link = "Caloris", Planet = "Mercury", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 6, MaxLevel = 8, DropTableAlias = "Rescue1", MasteryExp = 3, InternalName = "SolNode119", Introduced = "Vanilla", NextNodes = { "Elion" }, PreviousNodes = { "Pantheon" }, IsTracked = true },
		{ Name = "Elion", Link = "Elion", Planet = "Mercury", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 7, MaxLevel = 9, DropTableAlias = "Capture", MasteryExp = 3, InternalName = "SolNode12", Introduced = "Vanilla", NextNodes = { "Suisei" }, PreviousNodes = { "Caloris" }, IsTracked = true, CreditsReward = 1600 },
		{ Name = "Lares", Link = "Lares", Planet = "Mercury", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 6, MaxLevel = 11, DropTableAlias = "Defense1", Other = "B", MasteryExp = 3, InternalName = "SolNode130", Introduced = "6", PreviousNodes = { "Terminus" }, IsTracked = true },
		{ Name = "M Prime", Link = "M Prime", Planet = "Mercury", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Asteroid", Enemy = {"Infested", "Grineer"}, MinLevel = 7, MaxLevel = 9, MasteryExp = 3, InternalName = "SolNode103", Introduced = "Vanilla", NextNodes = { "Boethius", "Terminus" }, PreviousNodes = { "Mercury Junction" }, IsTracked = true, CreditsReward = 1600 },
		{ Name = "Odin", Link = "Odin", Planet = "Mercury", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 6, MaxLevel = 11, DropTableAlias = "Interception1", MasteryExp = 3, InternalName = "SolNode224", Introduced = "12", PreviousNodes = { "Suisei" }, IsTracked = true },
		{ Name = "Pantheon", Link = "Pantheon", Planet = "Mercury", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 6, MaxLevel = 8, MasteryExp = 3, InternalName = "SolNode226", NextNodes = { "Caloris" }, PreviousNodes = { "Mercury Junction" }, IsTracked = true },
		{ Name = "Suisei", Link = "Suisei", Planet = "Mercury", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, DropTableAlias = "Spy1", MasteryExp = 3, InternalName = "SolNode225", NextNodes = { "Odin", "Tolstoj" }, PreviousNodes = { "Elion" }, IsTracked = true },
		{ Name = "Terminus", Link = "Terminus", Planet = "Mercury", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Grineer Galleon", Enemy = {"Infested", "Grineer"}, MinLevel = 8, MaxLevel = 10, CacheDropTableAlias = "Reactor1", MasteryExp = 0, InternalName = "SolNode28", Introduced = "Vanilla", NextNodes = { "Lares" }, PreviousNodes = { "M Prime" }, IsTracked = true },
		{ Name = "Tolstoj", Link = "Tolstoj", Planet = "Mercury", Type = "Assassination", Quotes = "Captain Vor/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, DropTableAlias = "Vor", Boss = "Captain Vor", Pic = "CaptainVor_sigil_b.png", Drops = {"Cronus","Seer"}, MasteryExp = 25, InternalName = "SolNode108", Introduced = "Vanilla", PreviousNodes = { "Suisei" }, IsTracked = true },
		{ Name = "Larunda Relay", Link = "Relay", Planet = "Mercury", Type = "Relay", Quotes = "Relay/Quotes", Tileset = "Relay", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "MercuryHUB", Introduced = "15.6", PreviousNodes = { "Mercury Junction" }, CreditReward = 0 },
		
		{ Name = "Fortuna", Link = "Fortuna", Planet = "Venus", Type = "Hub", Quotes = "Fortuna/Quotes", Tileset = "Fortuna", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "SolarisUnitedHub1", Introduced = "24", NextNodes = { "Orb Vallis" }, PreviousNodes = { "E Gate" }, CreditReward = 0 },
		{ Name = "Orb Vallis", Link = "Orb Vallis", Image = "Orb Vallis.png", Planet = "Venus", Type = "Free Roam", Quotes = "Free Roam/Quotes", Tileset = "Orb Vallis", Enemy = "Corpus", MinLevel = 10, MaxLevel = 30, DropTableAlias = "Landscape", Pic = "SolarisUnitedSigil.png", MasteryExp = 24, InternalName = "SolNode129", Introduced = "24", PreviousNodes = { "Fortuna" }, IsTracked = true, CreditReward = 0, NextNodes = { "Fossa" }},
		{ Name = "Deepmines", Link = "Deepmines", Image = "Deepmines.png", Planet = "Venus", Type = "Free Roam", Quotes = "Deepmines/Quotes", Tileset = "Deepmines", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Landscape", MasteryExp = 0, InternalName = "NokkoColony", Introduced = "40", IsTracked = false, CreditReward = 0 },
		{ Name = "Aphrodite", Link = "Aphrodite", Planet = "Venus", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 6, MaxLevel = 8, MasteryExp = 18, InternalName = "SolNode2", NextNodes = { "Fossa", "Cytherean" }, PreviousNodes = { "Kiliken" }, IsTracked = true },
		{ Name = "Cytherean", Link = "Cytherean", Planet = "Venus", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, DropTableAlias = "Interception1", MasteryExp = 18, InternalName = "SolNode23", PreviousNodes = { "Aphrodite" },NextNodes = { "Romula", "V Prime" }, IsTracked = true },
		{ Name = "E Gate", Link = "E Gate", Planet = "Venus", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 3, MaxLevel = 5, MasteryExp = 18, InternalName = "SolNode128", NextNodes = { "Tessera", "Fortuna", "Kiliken" }, PreviousNodes = { "Venus Junction" }, IsTracked = true, CreditsReward = 1200 },
		{ Name = "Ishtar", Link = "Ishtar", Planet = "Venus", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 6, MaxLevel = 8, CacheDropTableAlias = "Reactor1", MasteryExp = 24, InternalName = "SolNode61", NextNodes = { "Malva", "Montes" }, PreviousNodes = { "Linea" }, IsTracked = true },
		{ Name = "Kiliken", Link = "Kiliken", Planet = "Venus", Type = "Excavation", Quotes = "Excavation/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, DropTableAlias = "Excavation1", MasteryExp = 18, InternalName = "SolNode101", NextNodes = { "Aphrodite" }, PreviousNodes = { "E Gate" }, IsTracked = true },
		{ Name = "Linea", Link = "Linea", Planet = "Venus", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 5, MaxLevel = 7, DropTableAlias = "Rescue1", MasteryExp = 18, InternalName = "SolNode109", NextNodes = { "Ishtar" }, PreviousNodes = { "Tessera" }, IsTracked = true },
		{ Name = "Malva", Link = "Malva", Planet = "Venus", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Corpus Ship", Enemy = "Infested", MinLevel = 8, MaxLevel = 18, DropTableAlias = "DSSurvival1", AdditionalCreditReward = 10000, DSResourceBonus = 0.1, DSXPBonus = 0.1, DSWeaponBonus = 0.05, DSWeapon = "Rifles", MasteryExp = 0, InternalName = "ClanNode1", Introduced = "13", PreviousNodes = { "Ishtar" }, IsTracked = true },
		{ Name = "Montes", Link = "Montes", Planet = "Venus", Type = "Exterminate", Quotes = "Exterminate/Quotes", IsArchwing = true, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, DropTableAlias = "AWExterminate", MasteryExp = 18, InternalName = "SolNode902", Introduced = "15", PreviousNodes = { "Ishtar" }, IsTracked = true },
		{ Name = "Romula", Link = "Romula", Planet = "Venus", Type = "Defense", Quotes = "Defense/Quotes", IsDarkSector = true, Tileset = "Corpus Outpost", Enemy = "Infested", MinLevel = 8, MaxLevel = 18, DropTableAlias = "DSDefense", AdditionalCreditReward = 10000, DSResourceBonus = 0.1, DSXPBonus = 0.1, DSWeaponBonus = 0.05, DSWeapon = "Rifles", MasteryExp = 0, InternalName = "ClanNode0", Introduced = "13", PreviousNodes = { "Cytherean" }, IsTracked = true },
		{ Name = "Tessera", Link = "Tessera", Planet = "Venus", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, DropTableAlias = "Defense1", Other = "E", MasteryExp = 18, InternalName = "SolNode22", NextNodes = { "Linea", "Venera" }, PreviousNodes = { "E Gate" }, IsTracked = true },
		{ Name = "Unda", Link = "Unda", Planet = "Venus", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 4, MaxLevel = 6, DropTableAlias = "Spy1", MasteryExp = 18, InternalName = "SolNode66", NextNodes = { "Fossa" }, PreviousNodes = { "Venera" }, IsTracked = true },
		{ Name = "Venera", Link = "Venera", Planet = "Venus", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 5, MaxLevel = 7, DropTableAlias = "Capture", MasteryExp = 18, InternalName = "SolNode107", NextNodes = { "Aphrodite" }, PreviousNodes = { "Tessera", "Unda" }, IsTracked = true, CreditsReward = 1400 },
		{ Name = "V Prime", Link = "V Prime", Planet = "Venus", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 3, MaxLevel = 8, DropTableAlias = "Survival1", MasteryExp = 18, InternalName = "SolNode123",  PreviousNodes = { "Cytherean" }, IsTracked = true },
		{ Name = "Fossa", Link = "Fossa", Planet = "Venus", Type = "Assassination", Quotes = "Jackal/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 6, MaxLevel = 8, DropTableAlias = "Jackal",  Boss = "Jackal", Pic = "Jackal_sigil_b.png", Drops = {"Rhino"}, MasteryExp = 41, InternalName = "SolNode104", PreviousNodes = { "Unda", "Orb Vallis", "Aphrodite" }, NextNodes = { "Mercury Junction" }, IsTracked = true },
		{ Name = "Mercury Junction", Planet = "Venus", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 3, Link = "Mercury Junction", MasteryExp = 1000, InternalName = "VenusToMercuryJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "M Prime", "Pantheon", "Larunda Relay" }, PreviousNodes = { "Fossa" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Vesper Relay", Image = "FolliesHuntEntrance.jpg", Planet = "Venus", Type = "Follie's Hunt", Quotes = "Follie's Hunt/Quotes", Tileset = "Relay", Enemy = "Tenno", MinLevel = 35, MaxLevel = 45, DropTableAlias = "Follie's Hunt", Link = "Follie's Hunt", MasteryExp = 0, InternalName = "SolNode239", Introduced = "42.0", PreviousNodes = { "Venus Junction" }, IsTracked = true, CreditReward = 0 },
		
		{ Name = "Cetus", Link = "Cetus", Planet = "Earth", Type = "Hub", Quotes = "Cetus/Quotes", Tileset = "Cetus", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "CetusHub4", Introduced = "22", NextNodes = { "Plains of Eidolon", "Saya's Visions" }, PreviousNodes = { "Mantle" }, CreditReward = 0 },
		{ Name = "Plains of Eidolon", Link = "Plains of Eidolon", Image = "Plains of Eidolon.png", Planet = "Earth", Type = "Free Roam", Quotes = "Plains of Eidolon/Quotes", Tileset = "Plains of Eidolon", Enemy = "Grineer", MinLevel = 10, MaxLevel = 30, DropTableAlias = "Landscape", Pic = "DawnsEarlyLight.png", MasteryExp = 24, InternalName = "SolNode228", Introduced = "22", NextNodes = { "Everest" }, PreviousNodes = { "Cetus" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Cambria", Link = "Cambria", Planet = "Earth", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 2, MaxLevel = 4, DropTableAlias = "Spy1", MasteryExp = 24, InternalName = "SolNode79", NextNodes = { "Venus Junction" }, PreviousNodes = { "Gaia" }, IsTracked = true },
		{ Name = "Cervantes", Link = "Cervantes", Planet = "Earth", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 4, MaxLevel = 6, CacheDropTableAlias = "EarthCaches", MasteryExp = 24, InternalName = "SolNode75", NextNodes = { "Erpo", "Plato" }, PreviousNodes = { "Everest" }, IsTracked = true },
		{ Name = "E Prime", Link = "E Prime", Planet = "Earth", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 3, MasteryExp = 24, InternalName = "SolNode27", NextNodes = { "Mariana" }, IsTracked = true },
		{ Name = "Erpo", Link = "Erpo", Planet = "Earth", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", IsArchwing = true, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, DropTableAlias = "AWMobileDefense", MasteryExp = 24, InternalName = "SolNode903", Introduced = "15", NextNodes = { "Oro" }, PreviousNodes = { "Cervantes" }, IsTracked = true },
		{ Name = "Eurasia", Link = "Eurasia", Planet = "Earth", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 3, MaxLevel = 5, MasteryExp = 24, InternalName = "SolNode59", NextNodes = { "Mars Junction" }, PreviousNodes = { "Lith" }, IsTracked = true },
		{ Name = "Everest", Link = "Everest", Planet = "Earth", Type = "Excavation", Quotes = "Excavation/Quotes", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, DropTableAlias = "Excavation1", MasteryExp = 24, InternalName = "SolNode39", NextNodes = { "Cervantes", "Coba" }, PreviousNodes = { "Plains of Eidolon" }, IsTracked = true },
		{ Name = "Gaia", Link = "Gaia", Planet = "Earth", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, DropTableAlias = "Interception1", MasteryExp = 20, InternalName = "SolNode85", NextNodes = { "Cambria", "Pacific" }, PreviousNodes = { "Mantle" }, IsTracked = true },
		{ Name = "Lith", Link = "Lith", Planet = "Earth", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 1, MaxLevel = 6, DropTableAlias = "Defense1", Other = "J", MasteryExp = 24, InternalName = "SolNode26", NextNodes = { "Cambria" }, PreviousNodes = { "Mantle" }, IsTracked = true },
		{ Name = "Mantle", Link = "Mantle", Planet = "Earth", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 2, MaxLevel = 4, DropTableAlias = "Capture", MasteryExp = 24, InternalName = "SolNode63", NextNodes = { "Cetus", "Gaia" }, PreviousNodes = { "Mariana" }, IsTracked = true, CreditsReward = 1100 },
		{ Name = "Mariana", Link = "Mariana", Planet = "Earth", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 1, MaxLevel = 3, MasteryExp = 24, InternalName = "SolNode89", NextNodes = { "Mantle" }, PreviousNodes = { "E Prime" }, IsTracked = true, CreditsReward = 1000 },
		{ Name = "Pacific", Link = "Pacific", Planet = "Earth", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 3, MaxLevel = 6, DropTableAlias = "Rescue1", MasteryExp = 24, InternalName = "SolNode15", PreviousNodes = { "Gaia" }, IsTracked = true },
		{ Name = "Coba", Link = "Coba", Planet = "Earth", Type = "Defense", Quotes = "Defense/Quotes", IsDarkSector = true, Tileset = "Grineer Forest", Enemy = "Infested", MinLevel = 6, MaxLevel = 16, DropTableAlias = "DSDefense", AdditionalCreditReward = 12000, DSResourceBonus = 0.15, DSXPBonus = 0.12, DSWeaponBonus = 0.08, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode2", Introduced = "13", PreviousNodes = { "Everest" }, IsTracked = true },
		{ Name = "Oro", Link = "Oro (Node)", Planet = "Earth", Type = "Assassination", Quotes = "Councilor Vay Hek/Quotes", Tileset = "Grineer Forest", Enemy = "Grineer", MinLevel = 20, MaxLevel = 25, DropTableAlias = "Vay Hek",  Boss = "Councilor Vay Hek", Pic = "VeyHek_sigil_b.png", Drops = {"Hydroid"}, MasteryExp = 24, InternalName = "SolNode24", NextNodes = { "Tikal" }, PreviousNodes = { "Erpo" }, IsTracked = true, Requirements = "Must be [[Mastery Rank]] 5 or higher to access" },
		{ Name = "Tikal", Link = "Tikal", Planet = "Earth", Type = "Excavation", Quotes = "Excavation/Quotes", IsDarkSector = true, Tileset = "Grineer Forest", Enemy = "Infested", MinLevel = 6, MaxLevel = 16, DropTableAlias = "Excavation1", AdditionalCreditReward = 12000, DSResourceBonus = 0.15, DSXPBonus = 0.12, DSWeaponBonus = 0.08, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode3", Introduced = "13", PreviousNodes = { "Oro" }, IsTracked = true, Requirements = "Must have [[Saya's Vigil]] completed to access" },
		{ Name = "Saya's Visions", Link = "Saya's Visions", Planet = "Earth", Type = "Shrine Defense", Quotes = "Shrine Defense/Quotes", Tileset = "Cetus", Enemy = "Infested", MinLevel = 5, MaxLevel = 15, DropTableAlias = "ShrineDefense", MasteryExp = 0, InternalName = "SolNode451", Introduced = "37", PreviousNodes = { "Cetus" }, IsTracked = false },
		{ Name = "Venus Junction", Planet = "Earth", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 3, Link = "Venus Junction", MasteryExp = 1000, InternalName = "EarthToVenusJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "E Gate" }, PreviousNodes = { "Cambria" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Mars Junction", Planet = "Earth", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 1, Link = "Mars Junction", MasteryExp = 1000, InternalName = "EarthToMarsJunction", Introduced = "Specters of the Rail 0.0", PreviousNodes = { "Eurasia" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Drifter's Camp", Link = "Drifter's Camp", Planet = "Earth", Type = "Hub", Quotes = "Drifter's Camp/Quotes", Tileset = "Grineer Forest", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "ToggleBootLevel", IsHidden = true, Introduced = "31", CreditReward = 0 },
		{ Name = "The Orbiter", Link = "Orbiter", Planet = "Earth", Type = "Hub", Quotes = "Hub/Quotes", Tileset = "Orbiter", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "ToggleBootLevel", IsHidden = true, Introduced = "31", CreditReward = 0 },
		{ Name = "Strata Relay", Link = "Relay", Planet = "Earth", Type = "Relay", Quotes = "Relay/Quotes", Tileset = "Relay", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "EarthHUB", Introduced = "15.6", PreviousNodes = { "Mars Junction" }, CreditReward = 0 },
			
		{ Name = "Maroo's Bazaar", Link = "Maroo's Bazaar", Planet = "Mars", Type = "Relay", Quotes = "Relay/Quotes", Tileset = "Relay", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "TradeHUB1", Introduced = "18", PreviousNodes = { "Tharsis" }, CreditReward = 0 },
		{ Name = "Alator", Link = "Alator", Planet = "Mars", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 13, DropTableAlias = "Interception1", MasteryExp = 51, InternalName = "SolNode106", NextNodes = { "Ultor" }, PreviousNodes = { "Ara" }, IsTracked = true },
		{ Name = "Ara", Link = "Ara", Planet = "Mars", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 10, MaxLevel = 12, DropTableAlias = "Capture", MasteryExp = 51, InternalName = "SolNode45", NextNodes = { "Alator", "Syrtis" }, PreviousNodes = { "Martialis", "Spear" }, IsTracked = true, CreditsReward = 1900 },
		{ Name = "Ares", Link = "Ares", Planet = "Mars", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 9, MaxLevel = 11, MasteryExp = 51, InternalName = "SolNode113", NextNodes = { "Tharsis", "Augustus" }, PreviousNodes = { "Mars Junction" }, IsTracked = true },
		{ Name = "Arval", Link = "Arval", Planet = "Mars", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 9, MaxLevel = 11, DropTableAlias = "Spy1", MasteryExp = 51, InternalName = "SolNode41", PreviousNodes = { "Augustus" }, NextNodes = { "Spear", "Hellas" }, IsTracked = true },
		{ Name = "Augustus", Link = "Augustus", Planet = "Mars", Type = "Excavation", Quotes = "Excavation/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 9, MaxLevel = 14, DropTableAlias = "Excavation1", MasteryExp = 51, InternalName = "SolNode16", NextNodes = { "Arval", "War" }, PreviousNodes = { "Ares" }, IsTracked = true },
		{ Name = "Gradivus", Link = "Gradivus", Planet = "Mars", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 9, MaxLevel = 11, CacheDropTableAlias = "Reactor1", MasteryExp = 45, InternalName = "SolNode65", NextNodes = { "Phobos Junction" }, PreviousNodes = { "Hellas", "Tharsis" }, IsTracked = true },
		{ Name = "Hellas", Link = "Hellas", Planet = "Mars", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, MasteryExp = 51, InternalName = "SolNode58", NextNodes = { "Gradivus", "Olympus" }, PreviousNodes = { "Arval" }, IsTracked = true },
		{ Name = "Kadesh", Link = "Kadesh", Planet = "Mars", Type = "Defense", Quotes = "Defense/Quotes", IsDarkSector = true, Tileset = "Grineer Settlement", Enemy = "Infested", MinLevel = 10, MaxLevel = 20, DropTableAlias = "DSDefense", AdditionalCreditReward = 14000, DSResourceBonus = 0.2, DSXPBonus = 0.15, DSWeaponBonus = 0.1, DSWeapon = "Pistols", MasteryExp = 0, InternalName = "ClanNode8", Introduced = "13", PreviousNodes = { "Ultor" }, IsTracked = true },
		{ Name = "Martialis", Link = "Martialis", Planet = "Mars", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 10, MaxLevel = 12, DropTableAlias = "Rescue1", MasteryExp = 51, InternalName = "SolNode36", NextNodes = { "Ceres Junction", "Vallis", "Ara" }, PreviousNodes = { "War" }, IsTracked = true },
		{ Name = "Olympus", Link = "Olympus", Planet = "Mars", Type = "Disruption", Quotes = "Disruption/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 15, MaxLevel = 20, DropTableAlias = "DisruptionMars", MasteryExp = 51, InternalName = "SolNode30", PreviousNodes = { "Augustus" }, IsTracked = true },
		{ Name = "Spear", Link = "Spear", Planet = "Mars", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 13, DropTableAlias = "Defense1", Other = "B", MasteryExp = 51, InternalName = "SolNode46", NextNodes = { "Ara", "Tyana Pass" }, PreviousNodes = { "Arval" }, IsTracked = true },
		{ Name = "Syrtis", Link = "Syrtis", Planet = "Mars", Type = "Exterminate", Quotes = "Exterminate/Quotes", IsArchwing = true, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 8, MaxLevel = 13, DropTableAlias = "AWExterminate", MasteryExp = 51, InternalName = "SolNode904", Introduced = "15", PreviousNodes = { "Ara" }, IsTracked = true },
		{ Name = "Tharsis", Link = "Tharsis", Planet = "Mars", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 8, MaxLevel = 10, MasteryExp = 51, InternalName = "SolNode11", NextNodes = { "Gradivus", "Maroo's Bazaar" }, PreviousNodes = { "Ares" }, IsTracked = true },
		{ Name = "Tyana Pass", Link = "Tyana Pass", Planet = "Mars", Type = "Mirror Defense", Quotes = "Mirror Defense/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer and Corpus", MinLevel = 25, MaxLevel = 30, DropTableAlias = "MirrorDefense", MasteryExp = 18, InternalName = "SolNode450", PreviousNodes = { "Spear" }, IsHidden = true, IsTracked = true, Requirements = "Must have [[Heart of Deimos]] completed to access", Introduced = "32.3" },
		{ Name = "Ultor", Link = "Ultor", Planet = "Mars", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Corpus Ice Planet", Enemy = {"Grineer", "Corpus"}, MinLevel = 11, MaxLevel = 13, MasteryExp = 51, InternalName = "SolNode14", NextNodes = { "Wahiba" }, PreviousNodes = { "Alator" }, IsTracked = true },
		{ Name = "Vallis", Link = "Vallis", Planet = "Mars", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 11, MaxLevel = 13, MasteryExp = 51, InternalName = "SolNode68", PreviousNodes = { "Martialis" }, IsTracked = true },
		{ Name = "Wahiba", Link = "Wahiba", Planet = "Mars", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Corpus Ship", Enemy = "Infested", MinLevel = 10, MaxLevel = 20, DropTableAlias = "DSSurvival2", AdditionalCreditReward = 14000, DSResourceBonus = 0.2, DSXPBonus = 0.15, DSWeaponBonus = 0.1, DSWeapon = "Pistols", MasteryExp = 0, InternalName = "ClanNode9", Introduced = "13", PreviousNodes = { "Ultor" }, IsTracked = true },
		{ Name = "War", Link = "War (Node)", Planet = "Mars", Type = "Assassination", Quotes = "Lieutenant Lech Kril/Quotes", Tileset = "Grineer Settlement", Enemy = "Grineer", MinLevel = 11, MaxLevel = 13, DropTableAlias = "Lech Kril", Boss = "Lieutenant Lech Kril", Pic = "LechKril_sigil_b.png", Drops = {"Excalibur"}, MasteryExp = 51, InternalName = "SolNode99", NextNodes = { "Martialis", "Horend" }, PreviousNodes = { "Augustus" }, IsTracked = true },
		{ Name = "Ceres Junction", Planet = "Mars", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 1, Link = "Ceres Junction", MasteryExp = 1000, InternalName = "MarsToCeresJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Pallas" }, PreviousNodes = { "Martialis" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Phobos Junction", Planet = "Mars", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 3, Link = "Phobos Junction", MasteryExp = 1000, InternalName = "MarsToPhobosJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Roche" }, PreviousNodes = { "Gradivus" }, IsTracked = true, CreditReward = 0 },
		
		{ Name = "Roche", Link = "Roche", Planet = "Phobos", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 10, MaxLevel = 12, MasteryExp = 157, InternalName = "SettlementNode1", NextNodes = { "Sharpless", "Shklovsky" }, PreviousNodes = { "Phobos Junction" }, IsTracked = true },
		{ Name = "Sharpless", Link = "Sharpless", Planet = "Phobos", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 11, MaxLevel = 13, MasteryExp = 157, InternalName = "SettlementNode15", NextNodes = { "Gulliver", "Kepler" }, PreviousNodes = { "Roche" }, IsTracked = true },
		{ Name = "Gulliver", Link = "Gulliver", Planet = "Phobos", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 10, MaxLevel = 15, DropTableAlias = "Defense1", Other = "C", MasteryExp = 157, InternalName = "SettlementNode11", PreviousNodes = { "Sharpless" }, IsTracked = true },
		{ Name = "Kepler", Link = "Kepler", Planet = "Phobos", Type = "Rush", Quotes = "Rush (Archwing)/Quotes", IsArchwing = true, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 12, MaxLevel = 14, DropTableAlias = "AWRush", MasteryExp = 157, InternalName = "SettlementNode10", Introduced = "Specters of the Rail", NextNodes = { "Iliad", "Memphis", "Zeugma" }, PreviousNodes = { "Sharpless" }, IsTracked = true },
		{ Name = "Memphis", Link = "Memphis", Planet = "Phobos", Type = "Defection", Quotes = "Defection/Quotes", IsDarkSector = true, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, DropTableAlias = "Defection1", AdditionalCreditReward = 16000, DSResourceBonus = 0.25, DSXPBonus = 0.18, DSWeaponBonus = 0.13, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode10", Introduced = "13", PreviousNodes = { "Kepler" }, IsTracked = true },
		{ Name = "Monolith", Link = "Monolith", Planet = "Phobos", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 13, MaxLevel = 15, DropTableAlias = "Rescue1", MasteryExp = 157, InternalName = "SettlementNode12", NextNodes = { "Iliad" }, PreviousNodes = { "Skyresh" }, IsTracked = true },
		{ Name = "Shklovsky", Link = "Shklovsky", Planet = "Phobos", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 11, MaxLevel = 13, DropTableAlias = "Spy1", MasteryExp = 157, InternalName = "SettlementNode14", NextNodes = { "Skyresh" }, PreviousNodes = { "Roche" }, IsTracked = true },
		{ Name = "Skyresh", Link = "Skyresh", Planet = "Phobos", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 12, MaxLevel = 14, DropTableAlias = "Capture", MasteryExp = 157, InternalName = "SettlementNode2", NextNodes = { "Monolith", "Stickney" }, PreviousNodes = { "Shklovsky" }, IsTracked = true, CreditsReward = 2100 },
		{ Name = "Stickney", Link = "Stickney", Planet = "Phobos", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 10, MaxLevel = 15, DropTableAlias = "Survival1", MasteryExp = 157, InternalName = "SettlementNode3", NextNodes = { "Teshub" }, PreviousNodes = { "Skyresh" }, IsTracked = true },
		{ Name = "Zeugma", Link = "Zeugma", Planet = "Phobos", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, DropTableAlias = "DSSurvival2", AdditionalCreditReward = 16000, DSResourceBonus = 0.25, DSXPBonus = 0.18, DSWeaponBonus = 0.13, DSWeapon = "Rifles", MasteryExp = 0, InternalName = "ClanNode11", Introduced = "13", PreviousNodes = { "Kepler" }, IsTracked = true },
		{ Name = "Iliad", Link = "Iliad", Planet = "Phobos", Type = "Assassination", Quotes = "The Sergeant/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 13, MaxLevel = 15, DropTableAlias = "Sergeant", Boss = "The Sergeant", Pic = "NefAnyo_sigil_b.png", Drops = {"Mag"}, MasteryExp = 100, InternalName = "SettlementNode20", PreviousNodes = { "Monolith", "Kepler" }, IsTracked = true },
		
		{ Name = "Necralisk", Link = "Necralisk", Planet = "Deimos", Type = "Hub", Quotes = "Necralisk/Quotes", Tileset = "Necralisk", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "DeimosHub", Introduced = "29", NextNodes = { "Sanctum Anatomica" }, PreviousNodes = { "Cambion Drift" }, CreditReward = 0 },
		{ Name = "Horend", Link = "Horend", Planet = "Deimos", Type = "Capture", Quotes = "Capture/Quotes",  Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 12, MaxLevel = 14, DropTableAlias = "Capture", MasteryExp = 0, InternalName = "SolNode706", Introduced = "29", NextNodes = { "Phlegyas" }, PreviousNodes = { "War" }, IsTracked = true, CreditsReward = 2100 },
		{ Name = "Phlegyas", Link = "Phlegyas", Planet = "Deimos", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 13, MaxLevel = 15, MasteryExp = 0, InternalName = "SolNode708", Introduced = "29", NextNodes = { "Cambion Drift", "Formido" }, PreviousNodes = { "Horend" }, IsTracked = true },
		{ Name = "Cambion Drift", Link = "Cambion Drift", Image = "CambionDrift.jpg", Planet = "Deimos", Type = "Free Roam", Quotes = "Cambion Drift/Quotes", Tileset = "Cambion Drift", Enemy = "Infested", MinLevel = 20, MaxLevel = 35, Pic = "EntratiIcon.png", MasteryExp = 0, InternalName = "SolNode229", Introduced = "29", NextNodes = { "Necralisk" }, PreviousNodes = { "Phlegyas" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Formido", Link = "Formido", Planet = "Deimos", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 14, MaxLevel = 16, CacheDropTableAlias = "DerelictCaches", MasteryExp = 0, InternalName = "SolNode710", Introduced = "29", NextNodes = { "Dirus", "Hyf" }, PreviousNodes = { "Phlegyas" }, IsTracked = true },
		{ Name = "Hyf", Link = "Hyf", Planet = "Deimos", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 15, MaxLevel = 20, DropTableAlias = "DerelictDefense", MasteryExp = 0, InternalName = "SolNode707", Introduced = "29", NextNodes = { "Magnacidium" }, PreviousNodes = { "Formido" }, IsTracked = true },
		{ Name = "Dirus", Link = "Dirus", Planet = "Deimos", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 15, MaxLevel = 17, MasteryExp = 0, InternalName = "SolNode709", Introduced = "29", NextNodes = { "Magnacidium" }, PreviousNodes = { "Formido" }, IsTracked = true },
		{ Name = "Magnacidium", Link = "Magnacidium", Planet = "Deimos", Type = "Assassination", Quotes = "Lephantis/Quotes", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 20, MaxLevel = 25, DropTableAlias = "Lephantis", Boss = "Lephantis", Pic = "Lephantis_sigil_b.png", Drops = {"Nekros"}, MasteryExp = 0, InternalName = "SolNode712", Introduced = "29", NextNodes = { "Terrorem" }, PreviousNodes = { "Dirus", "Hyf" }, IsTracked = true },
		{ Name = "Terrorem", Link = "Terrorem", Planet = "Deimos", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 25, MaxLevel = 35, DropTableAlias = "DerelictSurvival", MasteryExp = 0, InternalName = "SolNode711", Introduced = "29", NextNodes = { "Exequias" }, PreviousNodes = { "Magnacidium" }, IsTracked = true },
		{ Name = "Exequias", Link = "Exequias", Planet = "Deimos", Type = "Assassination", Quotes = "Zealoid Prelate/Quotes", Tileset = "Orokin Derelict", Enemy = "Infested", MinLevel = 30, MaxLevel = 35, Boss = "Zealoid Prelate", Pic = "ZealoidPrelate.png", Drops = {"Pathocyst"}, MasteryExp = 0, InternalName = "SolNode713", Introduced = "29", PreviousNodes = { "Terrorem" }, IsTracked = true },
		{ Name = "Sanctum Anatomica", Link = "Sanctum Anatomica", Image = "SanctumAnatomicaSplashArt.jpg", Planet = "Deimos", Type = "Hub", Quotes = "Sanctum Anatomica/Quotes", Tileset = "Albrecht's Laboratories", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "EntratiLabHub", Introduced = "35", NextNodes = { "Effervo", "Nex", "Persto", "Cambire", "Munio", "Testudo", "Armatus" }, PreviousNodes = { "Necralisk" }, CreditReward = 0 , IsTracked = false },
		{ Name = "Effervo", Link = "Effervo", Planet = "Deimos", Type = "Assassination", Quotes = "The Fragmented/Quotes", Tileset = "Albrecht's Laboratories", Enemy = "The Murmur", MinLevel = 55, MaxLevel = 60, DropTableAlias = "The Fragmented", Boss = "The Fragmented", Pic = "TheFragmentedSuzerain.png", Drops = {}, MasteryExp = 0, InternalName = "SolNode715", Introduced = "35", PreviousNodes = { "Sanctum Anatomica" }, IsTracked = false, Requirements = "Must have [[Whispers in the Walls]] completed to access" },
		{ Name = "Nex", Link = "Nex", Planet = "Deimos", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Albrecht's Laboratories", Enemy = "The Murmur", MinLevel = 55, MaxLevel = 60, DropTableAlias = "EntratiExterminate", MasteryExp = 0, InternalName = "SolNode716", Introduced = "35", PreviousNodes = { "Sanctum Anatomica" }, IsTracked = false, Requirements = "Must have [[Whispers in the Walls]] completed to access" },
		{ Name = "Persto", Link = "Persto", Planet = "Deimos", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Albrecht's Laboratories", Enemy = "The Murmur", MinLevel = 55, MaxLevel = 60, DropTableAlias = "EntratiSurvival", MasteryExp = 0, InternalName = "SolNode717", Introduced = "35", PreviousNodes = { "Sanctum Anatomica" }, IsTracked = false, Requirements = "Must have [[Whispers in the Walls]] completed to access" },
		{ Name = "Cambire", Link = "Cambire", Planet = "Deimos", Type = "Alchemy", Quotes = "Alchemy/Quotes", Tileset = "Albrecht's Laboratories", Enemy = "The Murmur", MinLevel = 55, MaxLevel = 60, DropTableAlias = "EntratiAlchemy", MasteryExp = 0, InternalName = "SolNode718", Introduced = "35", PreviousNodes = { "Sanctum Anatomica" }, IsTracked = false, Requirements = "Must have [[Whispers in the Walls]] completed to access" },
		{ Name = "Munio", Link = "Munio", Planet = "Deimos", Type = "Mirror Defense", Quotes = "Mirror Defense/Quotes", Tileset = "Albrecht's Laboratories", Enemy = "The Murmur", MinLevel = 55, MaxLevel = 60, DropTableAlias = "EntratiMirrorDefense", MasteryExp = 0, InternalName = "SolNode719", Introduced = "35", PreviousNodes = { "Sanctum Anatomica" }, IsTracked = false, Requirements = "Must have [[Whispers in the Walls]] completed to access" },
		{ Name = "Testudo", Link = "Testudo", Planet = "Deimos", Type = "Netracells", Quotes = "Netracells/Quotes", Tileset = "Albrecht's Laboratories", Enemy = "The Murmur", MinLevel = 220, MaxLevel = 240, DropTableAlias = "Netracells", MasteryExp = 0, InternalName = "SolNode720", Introduced = "35", PreviousNodes = { "Sanctum Anatomica" }, IsHidden = true, IsTracked = false },
		{ Name = "Armatus", Link = "Armatus", Planet = "Deimos", Type = "Disruption", Quotes = "Disruption/Quotes", Tileset = "Albrecht's Laboratories", Enemy = "The Murmur", MinLevel = 55, MaxLevel = 60, DropTableAlias = "EntratiDisruption", MasteryExp = 0, InternalName = "SolNode721", Introduced = "35.5", PreviousNodes = { "Sanctum Anatomica" }, IsTracked = false, Requirements = "Must have [[Whispers in the Walls]] completed to access" },
		{ Name = "Jupiter Junction", Planet = "Deimos", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 3, Link = "Jupiter Junction", MasteryExp = 1000, InternalName = "CeresToJupiterJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Elara" }, PreviousNodes = { "Formido" }, IsTracked = true, CreditReward = 0 },
		
		{ Name = "Abyssal Zone", Link = "Abyssal Zone", Planet = "Ceres", Type = "Exterminate", Quotes = "Abyssal_Zone/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 40, MaxLevel = 45, DropTableAlias = "AbyssalZoneRewards", MasteryExp = 0, InternalName = "/Lotus/Types/Keys/SyndicateCacheHuntBaseKeyItem", Introduced = "34.0", IsTracked = true },
		{ Name = "Bode", Link = "Bode", Planet = "Ceres", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 14, DropTableAlias = "Spy2", MasteryExp = 163, InternalName = "SolNode132", NextNodes = { "Casta", "Nuovo" }, PreviousNodes = { "Pallas" }, IsTracked = true },
		{ Name = "Casta", Link = "Casta", Planet = "Ceres", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 17, DropTableAlias = "Defense1", Other = "I", MasteryExp = 163, InternalName = "SolNode149", NextNodes = { "Lex", "Seimeni" }, PreviousNodes = { "Bode" }, IsTracked = true },
		{ Name = "Cinxia", Link = "Cinxia", Planet = "Ceres", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 17, DropTableAlias = "Interception1", MasteryExp = 163, InternalName = "SolNode147", NextNodes = { "Kiste", "Nuovo" }, PreviousNodes = { "Pallas" }, IsTracked = true },
		{ Name = "Draco", Link = "Draco", Planet = "Ceres", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 12, MaxLevel = 17, DropTableAlias = "Survival2", MasteryExp = 163, InternalName = "SolNode146", PreviousNodes = { "Ker" }, IsTracked = true },
		{ Name = "Gabii", Link = "Gabii", Planet = "Ceres", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, DropTableAlias = "DSSurvival1", AdditionalCreditReward = 20000, DSResourceBonus = 0.35, DSXPBonus = 0.26, DSWeaponBonus = 0.21, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode23", Introduced = "13", PreviousNodes = { "Lex" }, IsTracked = true },
		{ Name = "Ker", Link = "Ker", Planet = "Ceres", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 14, MaxLevel = 16, CacheDropTableAlias = "Reactor2", MasteryExp = 163, InternalName = "SolNode141", NextNodes = { "Draco", "Ludi" }, PreviousNodes = { "Kiste" }, IsTracked = true },
		{ Name = "Kiste", Link = "Kiste", Planet = "Ceres", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 13, MaxLevel = 15, MasteryExp = 163, InternalName = "SolNode140", NextNodes = { "Ker", "Thon" }, PreviousNodes = { "Cinxia" }, IsTracked = true },
		{ Name = "Lex", Link = "Lex (Node)", Planet = "Ceres", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 14, MaxLevel = 16, DropTableAlias = "Capture", MasteryExp = 163, InternalName = "SolNode139", NextNodes = { "Gabii", "Ludi" }, PreviousNodes = { "Casta" }, IsTracked = true, CreditsReward = 2300 },
		{ Name = "Ludi", Link = "Ludi", Planet = "Ceres", Type = "Hijack", Quotes = "Hijack/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 15, MaxLevel = 17, MasteryExp = 163, InternalName = "SolNode138", PreviousNodes = { "Exta", "Ker", "Lex" }, IsTracked = true },
		{ Name = "Nuovo", Link = "Nuovo", Planet = "Ceres", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 13, MaxLevel = 15, DropTableAlias = "Rescue1", MasteryExp = 163, InternalName = "SolNode137", NextNodes = { "Exta" }, PreviousNodes = { "Bode", "Cinxia" }, IsTracked = true },
		{ Name = "Pallas", Link = "Pallas", Planet = "Ceres", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 12, MaxLevel = 14, MasteryExp = 163, InternalName = "SolNode131", NextNodes = { "Bode", "Cinxia" }, PreviousNodes = { "Ceres Junction" }, IsTracked = true },
		{ Name = "Seimeni", Link = "Seimeni", Planet = "Ceres", Type = "Defense", Quotes = "Defense/Quotes", IsDarkSector = true, Tileset = "Grineer Shipyard", Enemy = "Infested", MinLevel = 15, MaxLevel = 25, DropTableAlias = "DSDefense", AdditionalCreditReward = 20000, DSResourceBonus = 0.35, DSXPBonus = 0.26, DSWeaponBonus = 0.21, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode22", Introduced = "13", PreviousNodes = { "Casta" }, IsTracked = true },
		{ Name = "Thon", Link = "Thon", Planet = "Ceres", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 15, MaxLevel = 17, CacheDropTableAlias = "Reactor2", MasteryExp = 163, InternalName = "SolNode135", PreviousNodes = { "Kiste" }, IsTracked = true },
		{ Name = "Exta", Link = "Exta", Planet = "Ceres", Type = "Assassination", Quotes = "Captain Vor & Lieutenant Lech Kril/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 14, MaxLevel = 16, DropTableAlias = "KrilAndVorAssasinate", ExtraDropTableAlias = "KrilAndVorAssasinateExtra", Boss = "Captain Vor & Lieutenant Lech Kril", Pic = "Vor Krill Icon.png", Drops = {"Frost","Miter","Twin Gremlins"}, MasteryExp = 163, InternalName = "SolNode144", NextNodes = { "Ludi" }, PreviousNodes = { "Nuovo" }, IsTracked = true },
	
		{ Name = "Adrastea", Link = "Adrastea", Planet = "Jupiter", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, CacheDropTableAlias = "Reactor2", MasteryExp = 51, InternalName = "SolNode88", NextNodes = { "Io" }, PreviousNodes = { "Elara" }, IsTracked = true },
		{ Name = "Amalthea", Link = "Amalthea", Planet = "Jupiter", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 17, MaxLevel = 19, DropTableAlias = "Spy2", MasteryExp = 51, InternalName = "SolNode97", NextNodes = { "Sinai", "Thebe" }, PreviousNodes = { "Ananke" }, IsTracked = true },
		{ Name = "Ananke", Link = "Ananke", Planet = "Jupiter", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 16, MaxLevel = 18, DropTableAlias = "Capture", MasteryExp = 51, InternalName = "SolNode73", NextNodes = { "Amalthea", "Callisto" }, PreviousNodes = { "Metis" }, IsTracked = true, CreditsReward = 2500 },
		{ Name = "Callisto", Link = "Callisto", Planet = "Jupiter", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, DropTableAlias = "Interception2", MasteryExp = 51, InternalName = "SolNode25", NextNodes = { "Cameria" }, PreviousNodes = { "Ananke" }, IsTracked = true },
		{ Name = "Carme", Link = "Carme", Planet = "Jupiter", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 16, MaxLevel = 18, MasteryExp = 51, InternalName = "SolNode74", NextNodes = { "Carpo" }, PreviousNodes = { "Metis" }, IsTracked = true },
		{ Name = "Carpo", Link = "Carpo", Planet = "Jupiter", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 17, MaxLevel = 19, CacheDropTableAlias = "JupiterCaches", MasteryExp = 51, InternalName = "SolNode121", NextNodes = { "Europa Junction", "Thebe" }, PreviousNodes = { "Carme" }, IsTracked = true },
		{ Name = "Elara", Link = "Elara", Planet = "Jupiter", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, DropTableAlias = "Survival2", MasteryExp = 51, InternalName = "SolNode100", NextNodes = { "Adrastea" }, PreviousNodes = { "Metis" }, IsTracked = true },
		{ Name = "Galilea", Link = "Galilea", Planet = "Jupiter", Type = "Sabotage", Quotes = "Sabotage/Quotes", IsArchwing = true, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, DropTableAlias = "AWSabotage", MasteryExp = 51, InternalName = "SolNode905", Introduced = "15", PreviousNodes = { "Thebe" }, IsTracked = true },
		{ Name = "Ganymede", Link = "Ganymede", Planet = "Jupiter", Type = "Disruption", Quotes = "Disruption/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 30, MaxLevel = 35, DropTableAlias = "DisruptionJupiter", MasteryExp = 51, InternalName = "SolNode87", NextNodes = { "The Ropalolyst" }, PreviousNodes = { "Themisto" }, IsTracked = true, Requirements = "Must have [[Natah (Quest)]] completed to access" },
		{ Name = "Io", Link = "Io", Planet = "Jupiter", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 20, DropTableAlias = "Defense2", Other = "H", MasteryExp = 51, InternalName = "SolNode125", NextNodes = { "Themisto" }, PreviousNodes = { "Adrastea" }, IsTracked = true },
		{ Name = "Metis", Link = "Metis", Planet = "Jupiter", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 15, MaxLevel = 17, DropTableAlias = "Rescue2", MasteryExp = 51, InternalName = "SolNode126", NextNodes = { "Ananke", "Carme" }, PreviousNodes = { "Elara" }, IsTracked = true },
		{ Name = "Thebe", Link = "Thebe", Planet = "Jupiter", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, MasteryExp = 51, InternalName = "SolNode10", NextNodes = { "Galilea", "Themisto" }, PreviousNodes = { "Amalthea", "Carpo" }, IsTracked = true },
		{ Name = "Cameria", Link = "Cameria", Planet = "Jupiter", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Corpus Gas City", Enemy = "Infested", MinLevel = 20, MaxLevel = 30, DropTableAlias = "DSSurvival2", AdditionalCreditReward = 14000, DSResourceBonus = 0.2, DSXPBonus = 0.15, DSWeaponBonus = 0.1, DSWeapon = "Shotguns", MasteryExp = 0, InternalName = "ClanNode5", Introduced = "13", PreviousNodes = { "Callisto" }, IsTracked = true },
		{ Name = "Sinai", Link = "Sinai", Planet = "Jupiter", Type = "Defense", Quotes = "Defense/Quotes", IsDarkSector = true, Tileset = "Corpus Gas City", Enemy = "Infested", MinLevel = 20, MaxLevel = 30, DropTableAlias = "DSDefense", AdditionalCreditReward = 14000, DSResourceBonus = 0.2, DSXPBonus = 0.15, DSWeaponBonus = 0.1, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode4", Introduced = "13", PreviousNodes = { "Amalthea" }, IsTracked = true },
		{ Name = "Themisto", Link = "Themisto", Planet = "Jupiter", Type = "Assassination", Quotes = "Alad V/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, DropTableAlias = "Alad V", Boss = "Alad V", Pic = "AladV_sigil_b.png", Drops = {"Valkyr"}, MasteryExp = 51, InternalName = "SolNode53", Introduced = "11", NextNodes = { "Saturn Junction" }, PreviousNodes = { "Io", "Thebe" }, IsTracked = true },
		{ Name = "The Ropalolyst", Link = "The Ropalolyst", Planet = "Jupiter", Type = "Assassination", Quotes = "Ropalolyst/Quotes", Tileset = "Corpus Gas City", Enemy = "Corpus", MinLevel = 40, MaxLevel = 40, DropTableAlias = "Ropalolyst", ExtraDropTableAlias = "RopalolystExtra", Boss = "Ropalolyst", Pic = "Ropalolyst.png", Drops = {"Wisp"}, MasteryExp = 55, InternalName = "SolNode740", Introduced = "25", PreviousNodes = { "Ganymede" }, IsTracked = true, Requirements = "Must complete [[Chimera Prologue]] to access" },
		{ Name = "Europa Junction", Planet = "Jupiter", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 3, Link = "Europa Junction", MasteryExp = 1000, InternalName = "JupiterToEuropaJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Morax" }, PreviousNodes = { "Carpo" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Saturn Junction", Planet = "Jupiter", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 3, Link = "Saturn Junction", MasteryExp = 1000, InternalName = "JupiterToSaturnJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Cassini", "Dione", "Kronia Relay" }, PreviousNodes = { "Themisto" }, IsTracked = true, CreditReward = 0 },
		
		{ Name = "Abaddon", Link = "Abaddon", Planet = "Europa", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 21, MaxLevel = 23, DropTableAlias = "Capture", MasteryExp = 138, InternalName = "SolNode203", NextNodes = { "Larzac" }, PreviousNodes = { "Kokabiel" }, IsTracked = true, CreditsReward = 3000 },
		{ Name = "Armaros", Link = "Armaros", Planet = "Europa", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Infested Ship", Enemy = {"Infested", "Corpus"}, MinLevel = 18, MaxLevel = 20, MasteryExp = 138, InternalName = "SolNode204", PreviousNodes = { "Naamah" }, IsTracked = true },
		{ Name = "Baal", Link = "Baal", Planet = "Europa", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 21, MaxLevel = 23, MasteryExp = 138, InternalName = "SolNode205", NextNodes = { "Cholistan", "Tiwaz" }, PreviousNodes = { "Sorath" }, IsTracked = true },
		{ Name = "Kokabiel", Link = "Kokabiel", Planet = "Europa", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 20, MaxLevel = 22, MasteryExp = 138, InternalName = "SolNode220", NextNodes = { "Abaddon", "Naamah" }, PreviousNodes = { "Valefor" }, IsTracked = true },
		{ Name = "Morax", Link = "Morax", Planet = "Europa", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 20, MasteryExp = 138, InternalName = "SolNode209", NextNodes = { "Orias", "Ose", "Valefor" }, PreviousNodes = { "Europa Junction" }, IsTracked = true },
		{ Name = "Orias", Link = "Orias", Planet = "Europa", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 20, MaxLevel = 22, DropTableAlias = "Rescue2", MasteryExp = 138, InternalName = "SolNode217", NextNodes = { "Valac" }, PreviousNodes = { "Morax" }, IsTracked = true },
		{ Name = "Ose", Link = "Ose", Planet = "Europa", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 23, DropTableAlias = "Interception2", MasteryExp = 138, InternalName = "SolNode211", NextNodes = { "Sorath" }, PreviousNodes = { "Morax" }, IsTracked = true },
		{ Name = "Paimon", Link = "Paimon", Planet = "Europa", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 23, DropTableAlias = "Defense2", Other = "D/E/F", MasteryExp = 138, InternalName = "SolNode212", PreviousNodes = { "Sorath" }, IsTracked = true },
		{ Name = "Sorath", Link = "Sorath", Planet = "Europa", Type = "Hijack", Quotes = "Hijack/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 19, MaxLevel = 21, MasteryExp = 138, InternalName = "SolNode214", NextNodes = { "Baal", "Paimon" }, PreviousNodes = { "Ose" }, IsTracked = true },
		{ Name = "Valac", Link = "Valac", Planet = "Europa", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Corpus Ship", Enemy = {"Grineer", "Corpus"}, MinLevel = 18, MaxLevel = 20, DropTableAlias = "Spy2", MasteryExp = 138, InternalName = "SolNode215", PreviousNodes = { "Orias" }, IsTracked = true },
		{ Name = "Valefor", Link = "Valefor", Planet = "Europa", Type = "Excavation", Quotes = "Excavation/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 18, MaxLevel = 23, DropTableAlias = "Excavation2", MasteryExp = 138, InternalName = "SolNode216", NextNodes = { "Kokabiel" }, PreviousNodes = { "Morax" }, IsTracked = true },
		{ Name = "Cholistan", Link = "Cholistan", Planet = "Europa", Type = "Excavation", Quotes = "Excavation/Quotes", IsDarkSector = true, Tileset = "Corpus Ice Planet", Enemy = "Infested", MinLevel = 23, MaxLevel = 33, DropTableAlias = "Excavation3", AdditionalCreditReward = 16000, DSResourceBonus = 0.25, DSXPBonus = 0.18, DSWeaponBonus = 0.12, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode7", Introduced = "13", PreviousNodes = { "Baal" }, IsTracked = true },
		{ Name = "Larzac", Link = "Larzac", Planet = "Europa", Type = "Defense", Quotes = "Defense/Quotes", IsDarkSector = true, Tileset = "Corpus Ice Planet", Enemy = "Infested", MinLevel = 23, MaxLevel = 33, DropTableAlias = "DSDefense", AdditionalCreditReward = 16000, DSResourceBonus = 0.25, DSXPBonus = 0.18, DSWeaponBonus = 0.12, DSWeapon = "Pistols", MasteryExp = 0, InternalName = "ClanNode6", Introduced = "13", PreviousNodes = { "Abaddon" }, IsTracked = true },
		{ Name = "Naamah", Link = "Naamah", Planet = "Europa", Type = "Assassination", Quotes = "Raptors/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 21, MaxLevel = 23, DropTableAlias = "Raptor", Boss = "Raptors", Pic = "Raptor_sigil_b.png", Drops = {"Nova"}, MasteryExp = 138, InternalName = "SolNode210", NextNodes = { "Armaros" }, PreviousNodes = { "Kokabiel" }, IsTracked = true },
		{ Name = "Archaeo-freighter", Link = "Archaeo-freighter", Planet = "Europa", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, MasteryExp = 0, InternalName = "GrendelKeyBMissionName", Introduced = "26", IsHidden = true, Requirements = "Must have [[Grendel Neuroptics Locator]] to access" },
		{ Name = "Icefields of Riddah", Link = "Icefields of Riddah", Planet = "Europa", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, MasteryExp = 0, InternalName = "GrendelKeyAMissionName", Introduced = "26", IsHidden = true, Requirements = "Must have [[Grendel Chassis Locator]] to access" },
		{ Name = "Mines of Karishh", Link = "Mines of Karishh", Planet = "Europa", Type = "Excavation", Quotes = "Excavation/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, MasteryExp = 0, InternalName = "GrendelKeyCMissionName", Introduced = "26", IsHidden = true, Requirements = "Must have [[Grendel Systems Locator]] to access" },
		
		{ Name = "Anthe", Link = "Anthe", Planet = "Saturn", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 22, MaxLevel = 24, DropTableAlias = "Rescue3", MasteryExp = 55, InternalName = "SolNode31", NextNodes = { "Rhea" }, PreviousNodes = { "Dione" }, IsTracked = true },
		{ Name = "Calypso", Link = "Calypso", Planet = "Saturn", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 24, MaxLevel = 26, CacheDropTableAlias = "Reactor2", MasteryExp = 55, InternalName = "SolNode82", NextNodes = { "Keeler" }, PreviousNodes = { "Piscinas" }, IsTracked = true },
		{ Name = "Caracol", Link = "Caracol", Planet = "Saturn", Type = "Defection", Quotes = "Defection/Quotes", IsDarkSector = true, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 26, MaxLevel = 36, DropTableAlias = "Defection2", AdditionalCreditReward = 14000, DSResourceBonus = 0.2, DSXPBonus = 0.15, DSWeaponBonus = 0.1, DSWeapon = "Rifles", MasteryExp = 0, InternalName = "ClanNode12", Introduced = "13", PreviousNodes = { "Pandora" }, IsTracked = true },
		{ Name = "Cassini", Link = "Cassini", Planet = "Saturn", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 21, MaxLevel = 23, DropTableAlias = "Capture", MasteryExp = 55, InternalName = "SolNode70", NextNodes = { "Numa" }, PreviousNodes = { "Saturn Junction" }, IsTracked = true, CreditsReward = 3000 },
		{ Name = "Dione", Link = "Dione", Planet = "Saturn", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 21, MaxLevel = 23, DropTableAlias = "Spy2", MasteryExp = 55, InternalName = "SolNode67", NextNodes = { "Anthe","Telesto" }, PreviousNodes = { "Saturn Junction" }, IsTracked = true },
		{ Name = "Enceladus", Link = "Enceladus", Planet = "Saturn", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 23, MaxLevel = 25, MasteryExp = 49, InternalName = "SolNode19", NextNodes = { "Helene", "Titan" }, PreviousNodes = { "Numa" }, IsTracked = true },
		{ Name = "Helene", Link = "Helene", Planet = "Saturn", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, DropTableAlias = "Defense2", Other = "A", MasteryExp = 55, InternalName = "SolNode42", NextNodes = { "Tethys" }, PreviousNodes = { "Enceladus" }, IsTracked = true },
		{ Name = "Keeler", Link = "Keeler", Planet = "Saturn", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 23, MaxLevel = 25, MasteryExp = 55, InternalName = "SolNode93", NextNodes = { "Calypso" }, PreviousNodes = { "Telesto" }, IsTracked = true },
		{ Name = "Numa", Link = "Numa", Planet = "Saturn", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 22, MaxLevel = 24, DropTableAlias = "Rescue2", MasteryExp = 55, InternalName = "SolNode50", NextNodes = { "Enceladus", "Pandora" }, PreviousNodes = { "Cassini" }, IsTracked = true },
		{ Name = "Pandora", Link = "Pandora", Planet = "Saturn", Type = "Pursuit", Quotes = "Pursuit/Quotes", IsArchwing = true, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 21, MaxLevel = 23, DropTableAlias = "AWPursuit", MasteryExp = 55, InternalName = "SolNode906", Introduced = "Specters of the Rail", NextNodes = { "Caracol" }, PreviousNodes = { "Numa" }, IsTracked = true },
		{ Name = "Piscinas", Link = "Piscinas", Planet = "Saturn", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 26, MaxLevel = 36, DropTableAlias = "DSSurvival2", AdditionalCreditReward = 14000, DSResourceBonus = 0.2, DSXPBonus = 0.15, DSWeaponBonus = 0.1, DSWeapon = "Shotguns", MasteryExp = 0, InternalName = "ClanNode13", Introduced = "13", PreviousNodes = { "Rhea" },NextNodes = { "Calypso" }, IsTracked = true },
		{ Name = "Rhea", Link = "Rhea", Planet = "Saturn", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, DropTableAlias = "Interception2", MasteryExp = 55, InternalName = "SolNode18", NextNodes = { "Piscinas" }, PreviousNodes = { "Anthe" }, IsTracked = true },
		{ Name = "Telesto", Link = "Telesto", Planet = "Saturn", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 22, MaxLevel = 24, MasteryExp = 55, InternalName = "SolNode20", NextNodes = { "Tethys" }, PreviousNodes = { "Dione" }, IsTracked = true },
		{ Name = "Titan", Link = "Titan", Planet = "Saturn", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, DropTableAlias = "Survival2", MasteryExp = 55, InternalName = "SolNode96", PreviousNodes = { "Enceladus" }, IsTracked = true },
		{ Name = "Tethys", Link = "Tethys", Planet = "Saturn", Type = "Assassination", Quotes = "General Sargas Ruk/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 24, MaxLevel = 26, DropTableAlias = "Sargas Ruk", Boss = "General Sargas Ruk", Pic = "SargusRuk_sigil_b.png", Drops = {"Ember"}, MasteryExp = 55, InternalName = "SolNode32", NextNodes = { "Uranus Junction" }, PreviousNodes = { "Telesto", "Helene", "Keeler" }, IsTracked = true },
		{ Name = "Uranus Junction", Planet = "Saturn", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 3, Link = "Uranus Junction", MasteryExp = 1000, InternalName = "SaturnToUranusJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Sycorax" }, PreviousNodes = { "Tethys" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Kronia Relay", Planet = "Saturn", Type = "Relay", Quotes = "Relay/Quotes", Tileset = "Relay", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, Link = "Relay", MasteryExp = 0, InternalName = "SaturnHUB", Introduced = "15.6", PreviousNode = "Saturn Junction", Requirements = "Must be [[Mastery Rank]] 4 or higher to access", CreditReward = 0 },
		
		{ Name = "Ariel", Link = "Ariel", Planet = "Uranus", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 25, MaxLevel = 27, DropTableAlias = "Capture", MasteryExp = 69, InternalName = "SolNode33", NextNodes = { "Cressida" }, PreviousNodes = { "Sycorax" }, IsTracked = true, CreditsReward = 3400 },
		{ Name = "Assur", Link = "Assur", Planet = "Uranus", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 25, MaxLevel = 35, DropTableAlias = "DSSurvival3", AdditionalCreditReward = 16000, DSResourceBonus = 0.25, DSXPBonus = 0.18, DSWeaponBonus = 0.13, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode17", Introduced = "13", PreviousNodes = { "Puck" }, IsTracked = true },
		{ Name = "Caelus", Link = "Caelus", Planet = "Uranus", Type = "Interception", Quotes = "Interception/Quotes", IsArchwing = true, Tileset = "Free Space", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, DropTableAlias = "AWInterception", MasteryExp = 69, InternalName = "SolNode907", Introduced = "15", PreviousNodes = { "Cressida" }, IsTracked = true },
		{ Name = "Caliban", Link = "Caliban (Node)", Planet = "Uranus", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 25, MaxLevel = 27, DropTableAlias = "Rescue3", MasteryExp = 69, InternalName = "SolNode60", NextNodes = { "Stephano", "Puck" }, PreviousNodes = { "Sycorax" }, IsTracked = true },
		{ Name = "Cressida", Link = "Cressida", Planet = "Uranus", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, MasteryExp = 69, InternalName = "SolNode83", NextNodes = { "Caelus", "Titania", "Ur" }, PreviousNodes = { "Ariel" }, IsTracked = true },
		{ Name = "Desdemona", Link = "Desdemona", Planet = "Uranus", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 26, MaxLevel = 28, CacheDropTableAlias = "SealabCaches", MasteryExp = 69, InternalName = "SolNode98", NextNodes = { "Rosalind", "Brutus" }, PreviousNodes = { "Sycorax" }, IsTracked = true },
		{ Name = "Brutus", Link = "Brutus", Planet = "Uranus", Type = "Ascension", Quotes = "Ascension/Quotes", Tileset = "Stalker's Lair", Enemy = "Corpus", MinLevel = 45, MaxLevel = 50, DropTableAlias = "Ascension", MasteryExp = 0, InternalName = "SolNode723", PreviousNodes = { "Desdemona" }, IsHidden = true, IsTracked = false, Requirements = "Must have [[Jade Shadows]] completed to access" },
		{ Name = "Ophelia", Link = "Ophelia", Planet = "Uranus", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, DropTableAlias = "Survival3", MasteryExp = 69, InternalName = "SolNode69", NextNodes = { "Puck" }, PreviousNodes = { "Umbriel" }, IsTracked = true },
		{ Name = "Puck", Link = "Puck", Planet = "Uranus", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, MasteryExp = 44, InternalName = "SolNode114", NextNodes = { "Assur", "Titania" }, PreviousNodes = { "Ophelia", "Caliban" }, IsTracked = true },
		{ Name = "Rosalind", Link = "Rosalind", Planet = "Uranus", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, DropTableAlias = "Spy3", MasteryExp = 69, InternalName = "SolNode9", NextNodes = { "Titania" }, PreviousNodes = { "Desdemona" }, IsTracked = true },
		{ Name = "Stephano", Link = "Stephano", Planet = "Uranus", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, DropTableAlias = "Defense3", Other = "O", MasteryExp = 69, InternalName = "SolNode122", NextNodes = { "Umbriel" }, PreviousNodes = { "Caliban" }, IsTracked = true },
		{ Name = "Sycorax", Link = "Sycorax", Planet = "Uranus", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 26, MasteryExp = 69, InternalName = "SolNode34", NextNodes = { "Ariel", "Caliban", "Desdemona" }, PreviousNodes = { "Uranus Junction" }, IsTracked = true },
		{ Name = "Umbriel", Link = "Umbriel", Planet = "Uranus", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 24, MaxLevel = 29, DropTableAlias = "Interception2", MasteryExp = 69, InternalName = "SolNode64", NextNodes = { "Ophelia" }, PreviousNodes = { "Stephano" }, IsTracked = true },
		{ Name = "Ur", Link = "Ur", Planet = "Uranus", Type = "Disruption", Quotes = "Disruption/Quotes", IsDarkSector = true, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 30, MaxLevel = 35, DropTableAlias = "DisruptionUranus", AdditionalCreditReward = 16000, DSResourceBonus = 0.25, DSXPBonus = 0.18, DSWeaponBonus = 0.13, DSWeapon = "Pistols", MasteryExp = 0, InternalName = "ClanNode16", Introduced = "13", PreviousNodes = { "Cressida" }, IsTracked = true },
		{ Name = "Titania", Link = "Titania (Node)", Planet = "Uranus", Type = "Assassination", Quotes = "Tyl Regor/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 27, MaxLevel = 29, DropTableAlias = "Tyl Regor", Boss = "Tyl Regor", Pic = "TylRegor_sigil_b.png", Drops = {"Equinox"}, MasteryExp = 69, InternalName = "SolNode105", NextNodes = { "Neptune Junction" }, PreviousNodes = { "Cressida", "Puck", "Rosalind" }, IsTracked = true },
		{ Name = "Neptune Junction", Planet = "Uranus", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 3, Link = "Neptune Junction", MasteryExp = 1000, InternalName = "UranusToNeptuneJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Galatea" }, PreviousNodes = { "Titania" }, IsTracked = true, CreditReward = 0 },
		
		{ Name = "Despina", Link = "Despina", Planet = "Neptune", Type = "Excavation", Quotes = "Excavation/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 27, MaxLevel = 32, DropTableAlias = "Excavation3", MasteryExp = 52, InternalName = "SolNode6", NextNodes = { "Sao" }, PreviousNodes = { "Galatea" }, IsTracked = true },
		{ Name = "Galatea", Link = "Galatea", Planet = "Neptune", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 27, MaxLevel = 29, DropTableAlias = "Capture", MasteryExp = 52, InternalName = "SolNode1", NextNodes = { "Despina", "Triton" }, PreviousNodes = { "Neptune Junction" }, IsTracked = true, CreditsReward = 3500 },
		{ Name = "Kelashin", Link = "Kelashin", Planet = "Neptune", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, DropTableAlias = "DSSurvival3", AdditionalCreditReward = 18000, DSResourceBonus = 0.3, DSXPBonus = 0.23, DSWeaponBonus = 0.18, DSWeapon = "Rifles", MasteryExp = 0, InternalName = "ClanNode21", Introduced = "13", PreviousNodes = { "Proteus" }, IsTracked = true },
		{ Name = "Laomedeia", Link = "Laomedeia", Planet = "Neptune", Type = "Disruption", Quotes = "Disruption/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, DropTableAlias = "DisruptionNeptune", MasteryExp = 52, InternalName = "SolNode118", NextNodes = { "Psamathe" }, PreviousNodes = { "Sao" }, IsTracked = true },
		{ Name = "Larissa", Link = "Larissa", Planet = "Neptune", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 29, MaxLevel = 31, MasteryExp = 52, InternalName = "SolNode49", NextNodes = { "Ukko" }, PreviousNodes = { "Triton" }, IsTracked = true },
		{ Name = "Nereid", Link = "Nereid", Planet = "Neptune", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 30, MaxLevel = 32, DropTableAlias = "Spy3", MasteryExp = 52, InternalName = "SolNode84", NextNodes = { "Psamathe", "The Index: Endurance" }, PreviousNodes = { "Neso" }, IsTracked = true },
		{ Name = "Neso", Link = "Neso", Planet = "Neptune", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Corpus Ice Planet", Enemy = "Corpus", MinLevel = 29, MaxLevel = 31, MasteryExp = 52, InternalName = "SolNode62", NextNodes = { "Nereid", "Salacia" }, PreviousNodes = { "Triton" }, IsTracked = true },
		{ Name = "Proteus", Link = "Proteus", Planet = "Neptune", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 27, MaxLevel = 32, DropTableAlias = "Defense3", Other = "D/E/F", MasteryExp = 52, InternalName = "SolNode17", NextNodes = { "Kelashin" }, PreviousNodes = { "Sao" }, IsTracked = true },
		{ Name = "Salacia", Link = "Salacia", Planet = "Neptune", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", IsArchwing = true, Tileset = "Corpus Ship (Archwing)", Enemy = "Corpus", MinLevel = 27, MaxLevel = 32, DropTableAlias = "AWMobileDefense", MasteryExp = 52, InternalName = "SolNode908", Introduced = "15", NextNodes = { "Yursa" }, PreviousNodes = { "Neso" }, IsTracked = true },
		{ Name = "Sao", Link = "Sao", Planet = "Neptune", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 29, MaxLevel = 31, MasteryExp = 52, InternalName = "SolNode57", NextNodes = { "Laomedeia", "Proteus", "Pluto Junction" }, PreviousNodes = { "Despina" }, IsTracked = true },
		{ Name = "Triton", Link = "Triton", Planet = "Neptune", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 28, MaxLevel = 30, DropTableAlias = "Rescue3", MasteryExp = 52, InternalName = "SolNode78", NextNodes = { "Neso", "Larissa" }, PreviousNodes = { "Galatea" }, IsTracked = true },
		{ Name = "Yursa", Link = "Yursa", Planet = "Neptune", Type = "Defection", Quotes = "Defection/Quotes", IsDarkSector = true, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Defection3", AdditionalCreditReward = 18000, DSResourceBonus = 0.3, DSXPBonus = 0.23, DSWeaponBonus = 0.18, DSWeapon = "Shotguns", MasteryExp = 0, InternalName = "ClanNode20", Introduced = "13", PreviousNodes = { "Salacia" }, IsTracked = true },
		{ Name = "Psamathe", Link = "Psamathe", Planet = "Neptune", Type = "Assassination", Quotes = "Hyena Pack/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 30, MaxLevel = 32, DropTableAlias = "Hyena Pack", Boss = "Hyena Pack", Pic = "HyenaPack_sigil_b.png", Drops = {"Loki"}, MasteryExp = 52, InternalName = "SolNode127", NextNodes = { "Pluto Junction" }, PreviousNodes = { "Laomedeia", "Nereid" }, IsTracked = true },
		{ Name = "The Index: Endurance", Link = "The Index", Planet = "Neptune", Type = "Arena", Quotes = "Arena/Quotes", Tileset = "The Index", Enemy = "Corpus", MinLevel = 30, MaxLevel = 30, DropTableAlias = "TheIndex", MasteryExp = 0, InternalName = "EventNode763", PreviousNodes = { "Nereid" }, CreditReward = 0 },
		{ Name = "Pluto Junction", Planet = "Neptune", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 3, Link = "Pluto Junction", MasteryExp = 1000, InternalName = "NeptuneToPlutoJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Hydra", "Minthe", "Orcus Relay" }, PreviousNodes = { "Psamathe" }, IsTracked = true, CreditReward = 0 },
		
		{ Name = "Acheron", Link = "Acheron", Planet = "Pluto", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 34, MaxLevel = 38, MasteryExp = 51, InternalName = "SolNode4", NextNodes = { "Eris Junction" }, PreviousNodes = { "Oceanum" }, IsTracked = true },
		{ Name = "Cerberus", Link = "Cerberus", Planet = "Pluto", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Interception3", MasteryExp = 51, InternalName = "SolNode43", NextNodes = { "Palus" }, PreviousNodes = { "Cypress" }, IsTracked = true },
		{ Name = "Cypress", Link = "Cypress", Planet = "Pluto", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 34, MaxLevel = 38, CacheDropTableAlias = "Reactor3", MasteryExp = 51, InternalName = "SolNode56", NextNodes = { "Cerberus" }, PreviousNodes = { "Narcissus" }, IsTracked = true },
		{ Name = "Hydra", Link = "Hydra", Planet = "Pluto", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 30, MaxLevel = 34, DropTableAlias = "Capture", MasteryExp = 51, InternalName = "SolNode76", NextNodes = { "Narcissus" }, PreviousNodes = { "Pluto Junction" }, IsTracked = true, CreditsReward = 3900 },
		{ Name = "Minthe", Link = "Minthe", Planet = "Pluto", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 30, MaxLevel = 34, MasteryExp = 51, InternalName = "SolNode38", NextNodes = { "Oceanum" }, PreviousNodes = { "Pluto Junction" }, IsTracked = true },
		{ Name = "Narcissus", Link = "Narcissus", Planet = "Pluto", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 32, MaxLevel = 36, MasteryExp = 51, InternalName = "SolNode21", NextNodes = { "Cypress", "Outer Terminus" }, PreviousNodes = { "Hydra" }, IsTracked = true },
		{ Name = "Oceanum", Link = "Oceanum", Planet = "Pluto", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 32, MaxLevel = 36, DropTableAlias = "Spy3", MasteryExp = 51, InternalName = "SolNode102", NextNodes = { "Acheron", "Regna", "Outer Terminus" }, PreviousNodes = { "Minthe" }, IsTracked = true },
		{ Name = "Outer Terminus", Link = "Outer Terminus", Planet = "Pluto", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Defense3", Other = "D/E/F", MasteryExp = 51, InternalName = "SolNode72", NextNodes = { "Sechura" }, PreviousNodes = { "Narcissus", "Oceanum" }, IsTracked = true },
		{ Name = "Palus", Link = "Palus", Planet = "Pluto", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Corpus Ship", Enemy = "Corpus", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Survival3", MasteryExp = 51, InternalName = "SolNode81", NextNodes = { "Hades" }, PreviousNodes = { "Cerberus" }, IsTracked = true },
		{ Name = "Regna", Link = "Regna", Planet = "Pluto", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 34, MaxLevel = 38, DropTableAlias = "Rescue3", MasteryExp = 51, InternalName = "SolNode48", NextNodes = { "Hieracon", "Sedna Junction" }, PreviousNodes = { "Oceanum" }, IsTracked = true },
		{ Name = "Hieracon", Link = "Hieracon", Planet = "Pluto", Type = "Excavation", Quotes = "Excavation/Quotes", IsDarkSector = true, Tileset = "Corpus Outpost", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, DropTableAlias = "Excavation3", AdditionalCreditReward = 20000, DSResourceBonus = 0.35, DSXPBonus = 0.3, DSWeaponBonus = 0.25, DSWeapon = "Pistols", MasteryExp = 0, InternalName = "ClanNode25", Introduced = "13", PreviousNodes = { "Regna" }, IsTracked = true },
		{ Name = "Sechura", Link = "Sechura", Planet = "Pluto", Type = "Defense", Quotes = "Defense/Quotes", IsDarkSector = true, Tileset = "Corpus Outpost", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, DropTableAlias = "DSDefense", AdditionalCreditReward = 20000, DSResourceBonus = 0.35, DSXPBonus = 0.3, DSWeaponBonus = 0.25, DSWeapon = "Rifles", MasteryExp = 0, InternalName = "ClanNode24", Introduced = "13", PreviousNodes = { "Outer Terminus" }, IsTracked = true },
		{ Name = "Hades", Link = "Hades", Planet = "Pluto", Type = "Assassination", Quotes = "Ambulas/Quotes", Tileset = "Corpus Outpost", Enemy = "Corpus", MinLevel = 35, MaxLevel = 45, DropTableAlias = "Ambulas", Boss = "Ambulas", Pic = "Ambulas_sigil_b.png", Drops = {"Trinity"}, MasteryExp = 51, InternalName = "SolNode51", PreviousNodes = { "Palus" }, IsTracked = true, Requirements = "Must have 5 [[Animo Nav Beacon]]s to access" },
		{ Name = "Eris Junction", Planet = "Pluto", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 1, Link = "Eris Junction", MasteryExp = 1000, InternalName = "PlutoToErisJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Naeglar" }, PreviousNodes = { "Acheron" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Sedna Junction", Planet = "Pluto", Type = "Solar Rail Junction", Quotes = "Junction/Quotes", Tileset = "Solar Rail", Enemy = "Tenno", MinLevel = 1, MaxLevel = 1, Link = "Sedna Junction", MasteryExp = 1000, InternalName = "ErisToSednaJunction", Introduced = "Specters of the Rail 0.0", NextNodes = { "Naga" }, PreviousNodes = { "Oestrus" }, IsTracked = true, CreditReward = 0 },
		{ Name = "Orcus Relay", Link = "Relay", Planet = "Pluto", Type = "Relay", Quotes = "Relay/Quotes", Tileset = "Relay", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "PlutoHUB", Introduced = "15.6", PreviousNodes = { "Pluto Junction" }, Requirements = "Must be [[Mastery Rank]] 8 or higher to access", CreditReward = 0 },
			
		{ Name = "Naga", Link = "Naga", Planet = "Sedna", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 30, MaxLevel = 34, DropTableAlias = "Rescue3", MasteryExp = 177, InternalName = "SolNode189", NextNodes = { "Adaro", "Rusalka" }, PreviousNodes = { "Sedna Junction" }, IsTracked = true },
		{ Name = "Berehynia", Link = "Berehynia", Planet = "Sedna", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Interception3", MasteryExp = 50, InternalName = "SolNode185", NextNodes = { "Sangeru" }, PreviousNodes = { "Rusalka" }, IsTracked = true },
		{ Name = "Hydron", Link = "Hydron", Planet = "Sedna", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Defense3", Other = "A", MasteryExp = 177, InternalName = "SolNode195", NextNodes = { "Amarna", "Kappa" }, PreviousNodes = { "Rusalka" }, IsTracked = true },
		{ Name = "Selkie", Link = "Selkie", Planet = "Sedna", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Survival3", MasteryExp = 177, InternalName = "SolNode187", NextNodes = { "Charybdis", "Marid" }, PreviousNodes = { "Adaro" }, IsTracked = true },
		{ Name = "Adaro", Link = "Adaro", Planet = "Sedna", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 32, MaxLevel = 36, MasteryExp = 177, InternalName = "SolNode181", NextNodes = { "Selkie" }, PreviousNodes = { "Naga" }, IsTracked = true },
		{ Name = "Rusalka", Link = "Rusalka", Planet = "Sedna", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 32, MaxLevel = 36, CacheDropTableAlias = "Reactor3", MasteryExp = 177, InternalName = "SolNode184", NextNodes = { "Berehynia", "Hydron" }, PreviousNodes = { "Naga" }, IsTracked = true },
		{ Name = "Kelpie", Link = "Kelpie", Planet = "Sedna", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 35, MaxLevel = 40, DropTableAlias = "Spy3", MasteryExp = 177, InternalName = "SolNode188", NextNodes = { "Aten" }, PreviousNodes = { "Charybdis" }, IsTracked = true },
		{ Name = "Marid", Link = "Marid", Planet = "Sedna", Type = "Hijack", Quotes = "Hijack/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 34, MaxLevel = 38, MasteryExp = 177, InternalName = "SolNode191", NextNodes = { "Nakki" }, PreviousNodes = { "Selkie" }, IsTracked = true },
		{ Name = "Charybdis", Link = "Charybdis", Planet = "Sedna", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 34, MaxLevel = 38, MasteryExp = 177, InternalName = "SolNode196", NextNodes = { "Kelpie" }, PreviousNodes = { "Selkie" }, IsTracked = true },
		{ Name = "Amarna", Link = "Amarna", Planet = "Sedna", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Grineer Galleon", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, DropTableAlias = "DSSurvival3", AdditionalCreditReward = 16000, DSResourceBonus = 0.25, DSXPBonus = 0.18, DSWeaponBonus = 0.13, DSWeapon = "Rifles", MasteryExp = 0, InternalName = "ClanNode14", Introduced = "13", PreviousNodes = { "Hydron" }, IsTracked = true },
		{ Name = "Sangeru", Link = "Sangeru", Planet = "Sedna", Type = "Defense", Quotes = "Defense/Quotes", IsDarkSector = true, Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, DropTableAlias = "DSDefense", AdditionalCreditReward = 16000, DSResourceBonus = 0.25, DSXPBonus = 0.18, DSWeaponBonus = 0.13, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode15", Introduced = "13", PreviousNodes = { "Berehynia" }, IsTracked = true },
		{ Name = "Kappa", Link = "Kappa", Planet = "Sedna", Type = "Disruption", Quotes = "Disruption/Quotes", Tileset = "Grineer Galleon", Enemy = "Grineer", MinLevel = 34, MaxLevel = 38, DropTableAlias = "DisruptionSedna", MasteryExp = 177, InternalName = "SolNode177", PreviousNodes = { "Hydron" }, IsTracked = true },
		{ Name = "Nakki", Link = "Nakki", Planet = "Sedna", Type = "Arena", Quotes = "Arena/Quotes", Tileset = "Grineer Shipyard", Enemy = "Grineer", MinLevel = 40, MaxLevel = 40, DropTableAlias = "Rathuum1", MasteryExp = 177, InternalName = "SolNode190", NextNodes = { "Merrow", "Yam" }, PreviousNodes = { "Marid" }, IsTracked = true },
		{ Name = "Yam", Link = "Yam", Planet = "Sedna", Type = "Arena", Quotes = "Arena/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 60, MaxLevel = 60, DropTableAlias = "Rathuum2", MasteryExp = 177, InternalName = "SolNode199", NextNodes = { "Vodyanoi" }, PreviousNodes = { "Nakki" }, IsTracked = true, Requirements = "Must have 10 [[Judgement Points]] to access" },
		{ Name = "Vodyanoi", Link = "Vodyanoi", Planet = "Sedna", Type = "Arena", Quotes = "Arena/Quotes", Tileset = "Grineer Sealab", Enemy = "Grineer", MinLevel = 85, MaxLevel = 85, DropTableAlias = "Rathuum2", MasteryExp = 177, InternalName = "SolNode183", PreviousNodes = { "Yam" }, IsTracked = true, Requirements = "Must have 15 [[Judgement Points]] to access" },
		{ Name = "Merrow", Link = "Merrow", Planet = "Sedna", Type = "Assassination", Quotes = "Kela De Thaym/Quotes", Tileset = "Grineer Asteroid", Enemy = "Grineer", MinLevel = 35, MaxLevel = 40, DropTableAlias = "Kela De Thaym", Boss = "Kela De Thaym", Pic = "KelaDeThaym_sigil_b.png", Drops = {"Saryn","Twin Kohmak"}, MasteryExp = 100, InternalName = "SolNode193", PreviousNodes = { "Nakki" }, IsTracked = true, Requirements = "Must have 25 [[Judgement Points]] to access" },
		
		{ Name = "Brugia", Link = "Brugia", Planet = "Eris", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 32, MaxLevel = 36, DropTableAlias = "Rescue3", MasteryExp = 279, InternalName = "SolNode153", NextNodes = { "Kala-azar", "Saxis" }, PreviousNodes = { "Naeglar" }, IsTracked = true },
		{ Name = "Isos", Link = "Isos (Node)", Planet = "Eris", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 32, MaxLevel = 36, DropTableAlias = "Capture", MasteryExp = 279, InternalName = "SolNode162", NextNodes = { "Oestrus", "Solium" }, PreviousNodes = { "Naeglar" }, IsTracked = true, CreditsReward = 4100 },
		{ Name = "Kala-azar", Link = "Kala-azar", Planet = "Eris", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Defense3", Other = "C", MasteryExp = 279, InternalName = "SolNode164", NextNodes = { "Xini" }, PreviousNodes = { "Brugia" }, IsTracked = true },
		{ Name = "Naeglar", Link = "Naeglar", Planet = "Eris", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 34, CacheDropTableAlias = "HiveCaches", MasteryExp = 279, InternalName = "SolNode175", NextNodes = { "Brugia", "Isos" }, PreviousNodes = { "Eris Junction" }, IsTracked = true },
		{ Name = "Nimus", Link = "Nimus", Planet = "Eris", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Survival3", MasteryExp = 279, InternalName = "SolNode166", NextNodes = { "Akkad" }, PreviousNodes = { "Solium" }, IsTracked = true },
		{ Name = "Oestrus", Link = "Oestrus", Planet = "Eris", Type = "Infested Salvage", Quotes = "Infested Salvage/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 34, MaxLevel = 38, DropTableAlias = "Salvage", MasteryExp = 279, InternalName = "SolNode167", PreviousNodes = { "Isos" }, IsTracked = true },
		{ Name = "Saxis", Link = "Saxis", Planet = "Eris", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 34, MaxLevel = 38, MasteryExp = 279, InternalName = "SolNode171", PreviousNodes = { "Brugia" }, IsTracked = true },
		{ Name = "Solium", Link = "Solium", Planet = "Eris", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 34, MaxLevel = 38, MasteryExp = 279, InternalName = "SolNode173", NextNodes = { "Nimus" }, PreviousNodes = { "Isos" }, IsTracked = true },
		{ Name = "Xini", Link = "Xini", Planet = "Eris", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Corpus Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 40, DropTableAlias = "Interception3", MasteryExp = 279, InternalName = "SolNode172", NextNodes = { "Zabala" }, PreviousNodes = { "Kala-azar" }, IsTracked = true },
		{ Name = "Akkad", Link = "Akkad", Planet = "Eris", Type = "Defense", Quotes = "Defense/Quotes", IsDarkSector = true, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, DropTableAlias = "DSDefense", AdditionalCreditReward = 18000, DSResourceBonus = 0.3, DSXPBonus = 0.23, DSWeaponBonus = 0.18, DSWeapon = "Melee", MasteryExp = 0, InternalName = "ClanNode18", Introduced = "13", PreviousNodes = { "Nimus" }, IsTracked = true },
		{ Name = "Zabala", Link = "Zabala", Planet = "Eris", Type = "Survival", Quotes = "Survival/Quotes", IsDarkSector = true, Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 35, MaxLevel = 45, DropTableAlias = "DSSurvival4", AdditionalCreditReward = 18000, DSResourceBonus = 0.3, DSXPBonus = 0.23, DSWeaponBonus = 0.18, DSWeapon = "Pistols", MasteryExp = 0, InternalName = "ClanNode19", Introduced = "13", PreviousNodes = { "Xini" }, IsTracked = true },
		{ Name = "Jordas Golem Assassinate", Link = "Jordas Golem Assassinate", Planet = "Eris", Type = "Assassination", Quotes = "Jordas Golem/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 32, MaxLevel = 34, DropTableAlias = "Jordas Golem", Boss = "Jordas Golem", Pic = "J3Golem.png", Drops = {"Atlas"}, MasteryExp = 0, InternalName = "SolNode701", Introduced = "17.5", Requirements = "Must complete [[The Jordas Precept]] to access" },
		{ Name = "Mutalist Alad V Assassinate", Link = "Mutalist Alad V Assassinate", Planet = "Eris", Type = "Assassination", Quotes = "Mutalist Alad V/Quotes", Tileset = "Infested Ship", Enemy = "Infested", MinLevel = 30, MaxLevel = 35, DropTableAlias = "Mutalist Alad V", Boss = "Mutalist Alad V", Pic = "InfestedAladV2.png", Drops = {"Mesa"}, MasteryExp = 0, InternalName = "SolNode705", Introduced = "15.5", Requirements = "Must have [[Mutalist Alad V Assassinate Key]] to access" },
		
		{ Name = "Apollo", Link = "Apollo", Planet = "Lua", Type = "Disruption", Quotes = "Disruption/Quotes", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 35, MaxLevel = 40, DropTableAlias = "DisruptionLua", MasteryExp = 0, InternalName = "SolNode308", Introduced = "25.7", PreviousNodes = { "Pavlov", "Stöfler" }, Requirements = "Must have [[The War Within]] completed to access", IsTracked = true },
		{ Name = "Circulus", Link = "Circulus", Planet = "Lua", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Orokin Moon", Enemy = "Corrupted", MinLevel = 80, MaxLevel = 100, DropTableAlias = "ConjunctionSurvival2", ExtraDropTableAlias = "ConjunctionSurvival2Extra", MasteryExp = 0, InternalName = "SolNode310", Introduced = "18", PreviousNodes = { "Yuvarium" }, IsTracked = true, Requirements = "Must complete [[The War Within]] to access" },
		{ Name = "Copernicus", Link = "Copernicus", Planet = "Lua", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, DropTableAlias = "Capture", MasteryExp = 0, InternalName = "SolNode304", Introduced = "18", NextNodes = { "Grimaldi" }, PreviousNodes = { "Plato" }, IsTracked = true, CreditsReward = 3400 },
		{ Name = "Grimaldi", Link = "Grimaldi", Planet = "Lua", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Orokin Moon", Enemy = "Grineer", MinLevel = 25, MaxLevel = 30, MasteryExp = 0, InternalName = "SolNode301", Introduced = "18", NextNodes = { "Stöfler", "Yuvarium" }, PreviousNodes = { "Copernicus" }, IsTracked = true },
		{ Name = "Pavlov", Link = "Pavlov", Planet = "Lua", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Orokin Moon", Enemy = {"Grineer", "Corpus"}, MinLevel = 25, MaxLevel = 30, DropTableAlias = "LuaSpy", MasteryExp = 0, InternalName = "SolNode306", Introduced = "18", NextNodes = { "Apollo" }, PreviousNodes = { "Tycho" }, IsTracked = true },
		{ Name = "Plato", Link = "Plato", Planet = "Lua", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Orokin Moon", Enemy = {"Grineer", "Corpus"}, MinLevel = 25, MaxLevel = 30, CacheDropTableAlias = "LuaCaches", MasteryExp = 0, InternalName = "SolNode300", Introduced = "18", NextNodes = { "Copernicus", "Zeipel" }, PreviousNodes = { "Cervantes" }, IsTracked = true, Requirements = "Must have [[The Second Dream]] completed to access" },
		{ Name = "Stöfler", Link = "Stöfler", Planet = "Lua", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Orokin Moon", Enemy = "Grineer", MinLevel = 25, MaxLevel = 30, DropTableAlias = "Defense3", Other = "?", MasteryExp = 0, InternalName = "SolNode305", Introduced = "18", PreviousNodes = { "Grimaldi" }, NextNodes = { "Apollo" }, IsTracked = true },
		{ Name = "Tycho", Link = "Tycho", Planet = "Lua", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, DropTableAlias = "Survival3", MasteryExp = 0, InternalName = "SolNode302", Introduced = "18", NextNodes = { "Pavlov" }, PreviousNodes = { "Zeipel" }, IsTracked = true },
		{ Name = "Yuvarium", Link = "Yuvarium", Planet = "Lua", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Orokin Moon", Enemy = "Corrupted", MinLevel = 25, MaxLevel = 30, DropTableAlias = "ConjunctionSurvival1", ExtraDropTableAlias = "ConjunctionSurvival1Extra", MasteryExp = 0, InternalName = "SolNode309", Introduced = "32.2", NextNodes = { "Circulus" }, PreviousNodes = { "Grimaldi" }, IsTracked = true, Requirements = "Must complete [[The War Within]] to access" },
		{ Name = "Zeipel", Link = "Zeipel", Planet = "Lua", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Orokin Moon", Enemy = "Corpus", MinLevel = 25, MaxLevel = 30, DropTableAlias = "Rescue3", MasteryExp = 0, InternalName = "SolNode307", Introduced = "32.2", NextNodes = { "Tycho" }, PreviousNodes = { "Plato" }, IsTracked = true },
		
		{ Name = "Dakata", Link = "Dakata", Planet = "Kuva Fortress", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 28, MaxLevel = 30, CacheDropTableAlias = "KuvaCaches", MasteryExp = 0, InternalName = "SolNode746", Introduced = "19", NextNodes = { "Koro" }, IsTracked = true, Requirements = "Must have [[The War Within]] completed to access" },
		{ Name = "Garus", Link = "Garus", Planet = "Kuva Fortress", Type = "Rescue", Quotes = "Rescue/Quotes", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 31, MaxLevel = 33, DropTableAlias = "Rescue3", MasteryExp = 0, InternalName = "SolNode748", Introduced = "19", NextNodes = { "Tamu" }, PreviousNodes = { "Rotuma" }, IsTracked = true },
		{ Name = "Koro", Link = "Koro", Planet = "Kuva Fortress", Type = "Assault", Quotes = "Assault/Quotes", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 29, MaxLevel = 31, MasteryExp = 0, InternalName = "SolNode741", Introduced = "19", NextNodes = { "Rotuma", "Nabuk" }, PreviousNodes = { "Dakata" }, IsTracked = true },
		{ Name = "Nabuk", Link = "Nabuk", Planet = "Kuva Fortress", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 30, MaxLevel = 32, DropTableAlias = "Defense3", MasteryExp = 0, InternalName = "SolNode742", Introduced = "19", NextNodes = { "Pago" }, PreviousNodes = { "Koro" }, IsTracked = true },
		{ Name = "Pago", Link = "Pago", Planet = "Kuva Fortress", Type = "Spy", Quotes = "Spy/Quotes", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 31, MaxLevel = 33, DropTableAlias = "KuvaSpy", MasteryExp = 0, InternalName = "SolNode747", Introduced = "19", NextNodes = { "Taveuni" }, PreviousNodes = { "Nabuk" }, IsTracked = true },
		{ Name = "Rotuma", Link = "Rotuma", Planet = "Kuva Fortress", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 30, MaxLevel = 32, MasteryExp = 0, InternalName = "SolNode743", Introduced = "19", NextNodes = { "Garus" }, PreviousNodes = { "Koro" }, IsTracked = true },
		{ Name = "Tamu", Link = "Tamu", Planet = "Kuva Fortress", Type = "Disruption", Quotes = "Disruption/Quotes", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 35, MaxLevel = 40, DropTableAlias = "DisruptionKuva", Other = "?", MasteryExp = 0, InternalName = "SolNode745", Introduced = "19", PreviousNodes = { "Garus" }, IsTracked = true },
		{ Name = "Taveuni", Link = "Taveuni", Planet = "Kuva Fortress", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Grineer Asteroid Fortress", Enemy = "Grineer", MinLevel = 32, MaxLevel = 37, DropTableAlias = "KuvaSurvival3", MasteryExp = 0, InternalName = "SolNode744", Introduced = "19", PreviousNodes = { "Pago" }, IsTracked = true },
		
		{ Name = "Teshub", Link = "Teshub", Planet = "Void", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 10, MaxLevel = 15, DropTableAlias = "VoidExterminate1", MasteryExp = 0, InternalName = "SolNode400", Introduced = "Specters of the Rail 0.0", NextNodes = { "Hepit" }, PreviousNodes = { "Stickney" }, IsTracked = true },
		{ Name = "Hepit", Link = "Hepit", Planet = "Void", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 10, MaxLevel = 15, DropTableAlias = "VoidCapture1", MasteryExp = 0, InternalName = "SolNode401", Introduced = "Specters of the Rail 0.0", NextNodes = { "Taranis" }, PreviousNodes = { "Teshub" }, IsTracked = true, CreditsReward = 1900 },
		{ Name = "Taranis", Link = "Taranis", Planet = "Void", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 10, MaxLevel = 15, DropTableAlias = "VoidDefense1", Other = "K", MasteryExp = 0, InternalName = "SolNode402", Introduced = "Specters of the Rail 0.0", PreviousNodes = { "Hepit" }, IsTracked = true },
		{ Name = "Tiwaz", Link = "Tiwaz", Planet = "Void", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, DropTableAlias = "VoidMobileDefense2", MasteryExp = 0, InternalName = "SolNode403", Introduced = "Specters of the Rail 0.0", NextNodes = { "Stribog" }, PreviousNodes = { "Baal" }, IsTracked = true },
		{ Name = "Stribog", Link = "Stribog", Planet = "Void", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, DropTableAlias = "VoidSabotage2", CacheDropTableAlias = "VoidCaches1", MasteryExp = 0, InternalName = "SolNode404", Introduced = "Specters of the Rail 0.0", NextNodes = { "Ani" }, PreviousNodes = { "Tiwaz" }, IsTracked = true },
		{ Name = "Ani", Link = "Ani", Planet = "Void", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 20, MaxLevel = 25, DropTableAlias = "VoidSurvival2", MasteryExp = 0, InternalName = "SolNode405", Introduced = "Specters of the Rail 0.0", PreviousNodes = { "Stribog" }, IsTracked = true },
		{ Name = "Ukko", Link = "Ukko", Planet = "Void", Type = "Capture", Quotes = "Capture/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 30, MaxLevel = 35, DropTableAlias = "VoidCapture3", MasteryExp = 0, InternalName = "SolNode406", Introduced = "Specters of the Rail 0.0", NextNodes = { "Oxomoco" }, PreviousNodes = { "Larissa" }, IsTracked = true, CreditsReward = 3900 },
		{ Name = "Oxomoco", Link = "Oxomoco", Planet = "Void", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 30, MaxLevel = 35, DropTableAlias = "VoidExterminate3", MasteryExp = 0, InternalName = "SolNode407", Introduced = "Specters of the Rail 0.0", NextNodes = { "Belenus" }, PreviousNodes = { "Ukko" }, IsTracked = true },
		{ Name = "Belenus", Link = "Belenus", Planet = "Void", Type = "Defense", Quotes = "Defense/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 30, MaxLevel = 35, DropTableAlias = "VoidDefense3", Other = "K", MasteryExp = 0, InternalName = "SolNode408", Introduced = "Specters of the Rail 0.0", PreviousNodes = { "Oxomoco" }, IsTracked = true },
		{ Name = "Aten", Link = "Aten", Planet = "Void", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, DropTableAlias = "VoidMobileDefense4", MasteryExp = 0, InternalName = "SolNode410", Introduced = "Specters of the Rail 0.0", NextNodes = { "Marduk" }, PreviousNodes = { "Kelpie" }, IsTracked = true },
		{ Name = "Marduk", Link = "Marduk", Planet = "Void", Type = "Sabotage", Quotes = "Sabotage/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, DropTableAlias = "VoidSabotage4", CacheDropTableAlias = "VoidCaches2", MasteryExp = 0, InternalName = "SolNode411", Introduced = "Specters of the Rail 0.0", NextNodes = { "Mithra" }, PreviousNodes = { "Aten" }, IsTracked = true },
		{ Name = "Mithra", Link = "Mithra", Planet = "Void", Type = "Interception", Quotes = "Interception/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, DropTableAlias = "VoidInterception4", MasteryExp = 0, InternalName = "SolNode412", Introduced = "Specters of the Rail 0.0", NextNodes = { "Mot" }, PreviousNodes = { "Marduk" }, IsTracked = true },
		{ Name = "Mot", Link = "Mot", Planet = "Void", Type = "Survival", Quotes = "Survival/Quotes", Tileset = "Orokin Tower", Enemy = "Corrupted", MinLevel = 40, MaxLevel = 45, DropTableAlias = "VoidSurvival4", MasteryExp = 0, InternalName = "SolNode409", Introduced = "Specters of the Rail 0.0", PreviousNodes = { "Mithra" }, IsTracked = true },
		
		{ Name = "Phorid Alert", Link = "Phorid", Planet = "Invasion", Type = "Assassination", Quotes = "Phorid/Quotes", Tileset = "Grineer Asteroid", Enemy = "Infested", MinLevel = 0, MaxLevel = 0, DropTableAlias = "Phorid", Boss = "Phorid", Pic = "Phorid_sigil_b.png", Drops = {"Nyx"}, MasteryExp = 0, InternalName = "", CreditReward = 0 },
		
		-- Zariman
		{ Name = "Tuvul Commons", Link = "Tuvul Commons", Planet = "Zariman", Type = "Void Cascade", Quotes = "Void Cascade/Quotes", Tileset = "Zariman (Tileset)", Enemy = "Grineer or Corpus", MinLevel = 50, MaxLevel = 55, DropTableAlias = "VoidCascade", MasteryExp = 0, InternalName = "SolNode232", Introduced = "31.5", PreviousNodes = { "Chrysalith" }, Requirements = "Must have [[Angels of the Zariman]] completed to access", IsTracked = true },
		{ Name = "Everview Arc", Link = "Everview Arc", Planet = "Zariman", Type = "Void Flood", Quotes = "Void Flood/Quotes", Tileset = "Zariman (Tileset)", Enemy = "Grineer or Corpus", MinLevel = 50, MaxLevel = 55, DropTableAlias = "VoidFlood", MasteryExp = 0, InternalName = "SolNode230", Introduced = "31.5", PreviousNodes = { "Chrysalith" }, Requirements = "Must have [[Angels of the Zariman]] completed to access", IsTracked = true },
		{ Name = "Halako Perimeter", Link = "Halako Perimeter", Planet = "Zariman", Type = "Exterminate", Quotes = "Exterminate/Quotes", Tileset = "Zariman (Tileset)", Enemy = "Grineer or Corpus", MinLevel = 50, MaxLevel = 55, DropTableAlias = "ZarimanExterminate", MasteryExp = 0, InternalName = "SolNode231", Introduced = "31.5", PreviousNodes = { "Chrysalith" }, Requirements = "Must have [[Angels of the Zariman]] completed to access", IsTracked = true },
		{ Name = "The Greenway", Link = "The Greenway", Planet = "Zariman", Type = "Mobile Defense", Quotes = "Mobile Defense/Quotes", Tileset = "Zariman (Tileset)", Enemy = "Grineer or Corpus", MinLevel = 50, MaxLevel = 55, DropTableAlias = "ZarimanMobileDefense", MasteryExp = 0, InternalName = "SolNode235", Introduced = "31.5", PreviousNodes = { "Chrysalith" }, Requirements = "Must have [[Angels of the Zariman]] completed to access", IsTracked = true },
		{ Name = "Oro Works", Link = "Oro Works", Planet = "Zariman", Type = "Void Armageddon", Quotes = "Void Armageddon/Quotes", Tileset = "Zariman (Tileset)", Enemy = "Grineer or Corpus", MinLevel = 50, MaxLevel = 55, DropTableAlias = "VoidArmageddon", MasteryExp = 0, InternalName = "SolNode233", Introduced = "31.5", PreviousNodes = { "Chrysalith" }, Requirements = "Must have [[Angels of the Zariman]] completed to access", IsTracked = true },
		{ Name = "Chrysalith", Link = "Chrysalith", Image = "Chrysalith.jpg", Planet = "Zariman", Type = "Hub", Quotes = "Chrysalith/Quotes", Tileset = "Chrysalith", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "ZarimanHub", Introduced = "31.5", NextNodes = { "Everview Arc", "Halako Perimeter", "Tuvul Commons", "Oro Works", "The Greenway" }, Requirements = "Must have [[Angels of the Zariman]] completed to access", CreditReward = 0 },
		{ Name = "Dormizone", Link = "Dormizone", Planet = "Zariman", Type = "Hub", Quotes = "Dormizone/Quotes", Tileset = "Dormizone", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "SolNode234", Introduced = "31.5", CreditReward = 0 },
		
		-- Duviri
		{ Name = "The Duviri Experience", Link = "The Duviri Experience", Planet = "Duviri", Type = "Free Roam", Quotes = "Duviri/Quotes", Tileset = "Duviri", Enemy = "Duviri", MinLevel = 20, MaxLevel = 20, DropTableAlias = "TheDuviriExperience", MasteryExp = 0, InternalName = "SolNode236", IsHidden = true, Introduced = "33", Requirements = "Must have [[The Duviri Paradox]] completed to access", IsTracked = true, CreditReward = 0 },
		{ Name = "The Lone Story (Duviri)", Link = "The Lone Story", Planet = "Duviri", Type = "Free Roam", Quotes = "Duviri/Quotes", Tileset = "Duviri", Enemy = "Duviri", MinLevel = 20, MaxLevel = 20, DropTableAlias = "TheDuviriExperience", MasteryExp = 0, InternalName = "SolNode237", IsHidden = true, Introduced = "33", Requirements = "Must have [[The Duviri Paradox]] completed to access", IsTracked = true, CreditReward = 0 },
		{ Name = "The Circuit", Link = "The Circuit", Planet = "Duviri", Type = "Free Roam", Quotes = "The Circuit/Quotes", Tileset = "Duviri", Enemy = "Duviri", MinLevel = 20, MaxLevel = 20, DropTableAlias = "TheCircuit", MasteryExp = 0, InternalName = "SolNode238", IsHidden = true, Introduced = "33", Requirements = "Must have [[The Duviri Paradox]] completed to access", IsTracked = true, CreditReward = 0 },
		{ Name = "Isleweaver", Link = "Isleweaver", Planet = "Duviri", Type = "Free Roam", Quotes = "Isleweaver/Quotes", Tileset = "Duviri", Enemy = "The Murmur", MinLevel = 60, MaxLevel = 62, DropTableAlias = "Isleweaver", Pic = "MurmurIcon.png", MasteryExp = 0, InternalName = "SolNode236", IsHidden = true, Introduced = "39", Requirements = "Must have [[The Hex]] completed to access", IsTracked = true, CreditReward = 0 },
		
		-- 1999
		{ Name = "Köbinn West", Link = "Köbinn West", Planet = "Höllvania", Type = "Legacyte Harvest", Quotes = "Legacyte Harvest/Quotes", Tileset = "Höllvania", Enemy = "Techrot", MinLevel = 65, MaxLevel = 70, DropTableAlias = "1999LegacyteHarvest", MasteryExp = 0, InternalName = "SolNode850", Introduced = "38", Requirements = "Must have [[The Hex (Quest)]] completed to access", IsTracked = true },
		{ Name = "Mischta Ramparts", Link = "Mischta Ramparts", Planet = "Höllvania", Type = "Hell-Scrub", Quotes = "Survival/Quotes#Scaldra", Tileset = "Höllvania", Enemy = "Scaldra", MinLevel = 65, MaxLevel = 70, DropTableAlias = "1999Hell-Scrub1", MasteryExp = 0, InternalName = "SolNode851", Introduced = "38", Requirements = "Must have [[The Hex (Quest)]] completed to access", IsTracked = true },
		{ Name = "Old Konderuk", Link = "Old Konderuk", Planet = "Höllvania", Type = "Hell-Scrub", Quotes = "Survival/Quotes#Techrot", Tileset = "Höllvania", Enemy = "Techrot", MinLevel = 65, MaxLevel = 70, DropTableAlias = "1999Hell-Scrub2", MasteryExp = 0, InternalName = "SolNode852", Introduced = "38", Requirements = "Must have [[The Hex (Quest)]] completed to access", IsTracked = true },
		{ Name = "Mausoleum East", Link = "Mausoleum East", Planet = "Höllvania", Type = "Exterminate", Quotes = "Exterminate/Quotes/Scaldra", Tileset = "Höllvania", Enemy = "Scaldra", MinLevel = 65, MaxLevel = 70, CacheDropTableAlias = "1999ExterminateCache", DropTableAlias = "1999Exterminate", MasteryExp = 0, InternalName = "SolNode853", Introduced = "38", Requirements = "Must have [[The Hex (Quest)]] completed to access", IsTracked = true },
		{ Name = "Rhu Manor", Link = "Rhu Manor", Planet = "Höllvania", Type = "Exterminate", Quotes = "Exterminate/Quotes/Techrot", Tileset = "Höllvania", Enemy = "Techrot", MinLevel = 65, MaxLevel = 70, CacheDropTableAlias = "1999ExterminateCache", DropTableAlias = "1999Exterminate", MasteryExp = 0, InternalName = "SolNode854", Introduced = "38", Requirements = "Must have [[The Hex (Quest)]] completed to access", IsTracked = true },
		{ Name = "Lower Vehrvod", Link = "Lower Vehrvod", Planet = "Höllvania", Type = "Faceoff", Quotes = "Faceoff/Quotes", Tileset = "Höllvania", Enemy = "Scaldra", MinLevel = 65, MaxLevel = 70, DropTableAlias = "Faceoff", MasteryExp = 0, InternalName = "SolNode855", Introduced = "38", Requirements = "Must have [[The Hex (Quest)]] completed to access", IsTracked = true },
		{ Name = "Victory Plaza", Link = "Victory Plaza", Planet = "Höllvania", Type = "Assassination", Quotes = "Victory Plaza/Quotes", Tileset = "Höllvania", Enemy = "Scaldra", MinLevel = 65, MaxLevel = 70, Drops = {}, DropTableAlias = "1999Assassination", MasteryExp = 0, InternalName = "SolNode856", Introduced = "38", Requirements = "Must have [[The Hex (Quest)]] completed to access", IsTracked = true, Boss = "H-09 Efervon Tank", Pic = "H-09-Efervon-Tank-Icon.png" },
		{ Name = "Vehrvod District", Link = "Vehrvod District", Planet = "Höllvania", Type = "Faceoff", Quotes = "Faceoff/Quotes", Tileset = "Höllvania", Enemy = "Scaldra", MinLevel = 65, MaxLevel = 70, DropTableAlias = "Faceoff", MasteryExp = 0, InternalName = "SolNode857", Introduced = "38", Requirements = "Must have [[The Hex (Quest)]] completed to access\nMust have [[Lower Vehrvod]] completed", IsTracked = true },
		{ Name = "Solstice Square", Link = "Solstice Square", Planet = "Höllvania", Type = "Stage Defense", Quotes = "Solstice Square/Quotes", Tileset = "Höllvania", Enemy = "Scaldra", MinLevel = 65, MaxLevel = 70, DropTableAlias = "1999Defense", MasteryExp = 0, InternalName = "SolNode858", Introduced = "38.5", Requirements = "Must have [[The Hex (Quest)]] completed to access", IsTracked = true },
		{ Name = "Höllvania Central Mall", Link = "Höllvania Central Mall", Planet = "Höllvania", Type = "Hub", Quotes = "", Tileset = "Höllvania", Enemy = "Tenno", MinLevel = 0, MaxLevel = 0, MasteryExp = 0, InternalName = "1999Hub", Introduced = "38", Requirements = "Must have [[The Hex (Quest)]] completed to access", CreditReward = 0 , IsTracked = false },
	
		-- The Dark Refractory
		{ Name = "The Descendia", Link = "The Descendia", Planet = "Dark Refractory", Image = "CohPrecpice.png", Type = "The Descendia", Quotes = "The Descendia/Quotes", Tileset = "Descendia", Enemy = "Orokin", MinLevel = 65, MaxLevel = 85, DropTableAlias = "The Descendia", MasteryExp = 0, InternalName = "SolNode253", Introduced = "41", Requirements = "Must have [[The Old Peace]] completed to access", IsTracked = true, Boss = "Roathe (Boss)" },
		{ Name = "Recall: Hunhullus", Link = "The Perita Rebellion", Image = "Tau12MinHunhullus.png", Planet = "Dark Refractory", Type = "The Perita Rebellion", Quotes = "The Perita Rebellion/Quotes", Tileset = "Perita", Enemy = "Anarchs", MinLevel = 65, MaxLevel = 70, DropTableAlias = "Recall: Hunhullus", MasteryExp = 0, InternalName = "SolNode250", Introduced = "41", Requirements = "Must have [[The Old Peace]] completed to access", IsTracked = true, Boss = "Hunhullus", Pic = "Hunhullus.png" },
		{ Name = "Recall: Dactolyst", Link = "The Perita Rebellion", Image = "Tau12MinOkokin.png", Planet = "Dark Refractory", Type = "The Perita Rebellion", Quotes = "The Perita Rebellion/Quotes", Tileset = "Perita", Enemy = "Anarchs", MinLevel = 65, MaxLevel = 70, DropTableAlias = "Recall: Dactolyst", MasteryExp = 0, InternalName = "SolNode251", Introduced = "41", Requirements = "Must have [[The Old Peace]] completed to access", IsTracked = true, Boss = "Dactolyst", Pic = "Dactolyst.png" },
		{ Name = "Recall: Prime Vanguard", Link = "The Perita Rebellion", Image = "Tau12MinPeople.png", Planet = "Dark Refractory", Type = "The Perita Rebellion", Quotes = "The Perita Rebellion/Quotes", Tileset = "Perita", Enemy = "Anarchs", MinLevel = 65, MaxLevel = 70, DropTableAlias = "Recall: Prime Vanguard", MasteryExp = 0, InternalName = "SolNode252", Introduced = "41", Requirements = "Must have [[The Old Peace]] completed to access", IsTracked = true, Boss = "Prime Vanguard" },
		{ Name = "The Guilty", Link = "The Guilty", Image = "PeritaHardModeImageWide.png", Planet = "Dark Refractory", Type = "The Guilty", Quotes = "The Guilty/Quotes", Tileset = "Perita", Enemy = "Anarchs", MinLevel = 165, MaxLevel = 170, DropTableAlias = "The Guilty", MasteryExp = 0, InternalName = "SolNode257", Introduced = "42", Requirements = "", IsTracked = true },

		-- Empyrean
		{ Name = "Technocyte Coda Concert", Link = "Technocyte Coda", Planet = "Earth Proxima", Type = "Assassination", Quotes = "Assassination/Quotes", Tileset = "Technocyte Coda Stadium", Enemy = "Techrot", MinLevel = 100, MaxLevel = 100, FighterMinLevel = 20, FighterMaxLevel = 30, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, Drops = {}, MasteryExp = 0, InternalName = "CrewBattleNode559", IsHidden = true, Introduced = "38.5", IsRailjack = true, Requirements = "Must complete [[The Hex (Quest)|The Hex]] quest to access and active [[Technocyte Coda]]." },
		{ Name = "Free Flight", Link = "Free Flight", Planet = "Earth Proxima", Type = "Free Flight", Quotes = "Free Flight/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 1, MaxLevel = 1, MasteryExp = 0, FighterMinLevel = 1, FighterMaxLevel = 1, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, InternalName = "CrewBattleNode556", Introduced = "27", IsRailjack = true, CreditReward = 0 },
		{ Name = "Sover Strait", Link = "Sover Strait", Planet = "Earth Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 15, MaxLevel = 20, DropTableAlias = "EarthProximaSkirmish", CacheDropTableAlias = "EarthProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 3, FighterMaxLevel = 6, MaxFighters = 30, MaxCrewships = 2, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode502", Introduced = "27", IsRailjack = true, NextNodes = { "Iota Temple" }, Requirements = "Must have [[Rising Tide]] completed to access", AdditionalCreditReward = 32000 },
		{ Name = "Iota Temple", Link = "Iota Temple", Planet = "Earth Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 20, MaxLevel = 28, DropTableAlias = "EarthProximaSkirmish", CacheDropTableAlias = "EarthProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 6, FighterMaxLevel = 10, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "CrewBattleNode509", Introduced = "27", IsRailjack = true, NextNodes = { "Ogal Cluster" }, PreviousNodes = { "Sover Strait" }, AdditionalCreditReward = 38000 },
		{ Name = "Ogal Cluster", Link = "Ogal Cluster", Planet = "Earth Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 21, MaxLevel = 26, DropTableAlias = "EarthProximaSkirmish", CacheDropTableAlias = "EarthProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 9, FighterMaxLevel = 13, MaxFighters = 30, MaxCrewships = 2, Objectives = 1, MasteryExp = 0, InternalName = "CrewBattleNode518", Introduced = "27", IsRailjack = true, NextNodes = { "Korm's Belt" }, PreviousNodes = { "Iota Temple" }, AdditionalCreditReward = 42500 },
		{ Name = "Korm's Belt", Link = "Korm's Belt", Planet = "Earth Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 24, MaxLevel = 30, DropTableAlias = "EarthProximaSkirmish", CacheDropTableAlias = "EarthProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 12, FighterMaxLevel = 15, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, ObjectiveDetails = "Chance for Galleon Assassinate", MasteryExp = 0, InternalName = "CrewBattleNode519", Introduced = "27", IsRailjack = true, NextNodes = { "Bendar Cluster" }, PreviousNodes = { "Ogal Cluster" }, AdditionalCreditReward = 45000 },
		{ Name = "Bendar Cluster", Link = "Bendar Cluster", Planet = "Earth Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 29, MaxLevel = 36, DropTableAlias = "EarthProximaSkirmish", CacheDropTableAlias = "EarthProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 14, FighterMaxLevel = 17, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "CrewBattleNode522", Introduced = "27", IsRailjack = true, NextNodes = { "Nodo Gap" }, PreviousNodes = { "Korm's Belt" }, AdditionalCreditReward = 45000 },

		{ Name = "Beacon Shield Ring", Link = "Beacon Shield Ring", Planet = "Venus Proxima", Type = "Volatile", Quotes = "Volatile/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 17, MaxLevel = 20, DropTableAlias = "VenusProximaVolatile", CacheDropTableAlias = "VenusProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 6, FighterMaxLevel = 10, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode511", Introduced = "29.10", IsRailjack = true, NextNodes = { "Orvin-Haarc" }, PreviousNodes = { "Bifrost Echo" }, Requirements = "Must have [[Rising Tide]] completed to access", AdditionalCreditReward = 33750 },
		{ Name = "Vesper Strait", Link = "Vesper Strait", Planet = "Venus Proxima", Type = "Orphix", Quotes = "Orphix (Mission)/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 21, MaxLevel = 24, DropTableAlias = "VenusProximaOrphix", CacheDropTableAlias = "VenusProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 12, FighterMaxLevel = 16, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode513", Introduced = "29.10", IsRailjack = true, NextNodes = { "Luckless Expanse" }, PreviousNodes = { "Orvin-Haarc" }, Requirements = "Must have [[The War Within]] completed to access", AdditionalCreditReward = 41250 },
		{ Name = "Luckless Expanse", Link = "Luckless Expanse", Planet = "Venus Proxima", Type = "Survival", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 22, MaxLevel = 25, DropTableAlias = "VenusProximaSurvival", CacheDropTableAlias = "VenusProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 14, FighterMaxLevel = 17, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode515", Introduced = "29.10", IsRailjack = true, NextNodes = { "Falling Glory" }, PreviousNodes = { "Vesper Strait" }, AdditionalCreditReward = 41250 },
		{ Name = "Falling Glory", Link = "Falling Glory", Planet = "Venus Proxima", Type = "Defense", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 23, MaxLevel = 26, DropTableAlias = "VenusProximaDefense", CacheDropTableAlias = "VenusProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 14, FighterMaxLevel = 18, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode514", Introduced = "29.10", IsRailjack = true, NextNodes = { "Nodo Gap" }, PreviousNodes = { "Luckless Expanse" }, AdditionalCreditReward = 45000 },
		{ Name = "Bifrost Echo", Link = "Bifrost Echo", Planet = "Venus Proxima", Type = "Exterminate", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 15, MaxLevel = 18, DropTableAlias = "VenusProximaExterminate", CacheDropTableAlias = "VenusProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 4, FighterMaxLevel = 8, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode503", Introduced = "29.10", IsRailjack = true, NextNodes = { "Beacon Shield Ring" }, AdditionalCreditReward = 30000 },
		{ Name = "Orvin-Haarc", Link = "Orvin-Haarc", Planet = "Venus Proxima", Type = "Spy", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 19, MaxLevel = 22, DropTableAlias = "VenusProximaSpy", CacheDropTableAlias = "VenusProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 9, FighterMaxLevel = 13, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode512", Introduced = "29.10", IsRailjack = true, NextNodes = { "Vesper Strait" }, PreviousNodes = { "Beacon Shield Ring" }, AdditionalCreditReward = 37500 },
		
		{ Name = "Kuva Lich Confrontation", Link = "Kuva Lich", Planet = "Saturn Proxima", Type = "Assassination", Quotes = "Assassination/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 63, MaxLevel = 70, FighterMinLevel = 31, FighterMaxLevel = 36, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, Drops = {}, MasteryExp = 0, InternalName = "CrewBattleNode557", IsHidden = true, Introduced = "30.5", IsRailjack = true, Requirements = "Must have [[Intrinsics]] Rank 3 or higher and an active [[Kuva Lich]] to access" },
		{ Name = "Mordo Cluster", Link = "Mordo Cluster", Planet = "Saturn Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 55, MaxLevel = 60, DropTableAlias = "SaturnProximaSkirmish", CacheDropTableAlias = "SaturnProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 24, FighterMaxLevel = 26, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "CrewBattleNode501", Introduced = "27", IsRailjack = true, NextNodes = { "Lupal Pass" }, PreviousNodes = { "Nodo Gap" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 50000 },
		{ Name = "Lupal Pass", Link = "Lupal Pass", Planet = "Saturn Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 48, MaxLevel = 56, DropTableAlias = "SaturnProximaSkirmish", CacheDropTableAlias = "SaturnProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 22, FighterMaxLevel = 26, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "CrewBattleNode534", Introduced = "27", IsRailjack = true, NextNodes = { "Vand Cluster" }, PreviousNodes = { "Mordo Cluster" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 50000 },
		{ Name = "Nodo Gap", Link = "Nodo Gap", Planet = "Saturn Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 54, MaxLevel = 60, DropTableAlias = "SaturnProximaSkirmish", CacheDropTableAlias = "SaturnProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 22, FighterMaxLevel = 25, MaxFighters = 60, MaxCrewships = 4, Objectives = 1, MasteryExp = 0, InternalName = "CrewBattleNode533", Introduced = "27", IsRailjack = true, NextNodes = { "Mordo Cluster" }, PreviousNodes = { "Bendar Cluster", "Falling Glory" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 50000 },
		{ Name = "Vand Cluster", Link = "Vand Cluster", Planet = "Saturn Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 65, MaxLevel = 70, DropTableAlias = "SaturnProximaSkirmish", CacheDropTableAlias = "SaturnProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 29, FighterMaxLevel = 32, MaxFighters = 90, MaxCrewships = 6, Objectives = 1, MasteryExp = 0, InternalName = "CrewBattleNode535", Introduced = "27", IsRailjack = true, NextNodes = { "Kasio's Rest" }, PreviousNodes = { "Lupal Pass" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 70000 },
		{ Name = "Kasio's Rest", Link = "Kasio's Rest", Planet = "Saturn Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 70, MaxLevel = 75, DropTableAlias = "SaturnProximaSkirmish", CacheDropTableAlias = "SaturnProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 30, FighterMaxLevel = 33, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, ObjectiveDetails = "1 is an Asteroid Assassinate", MasteryExp = 0, InternalName = "CrewBattleNode530", Introduced = "27", IsRailjack = true, NextNodes = { "Arva Vector" }, PreviousNodes = { "Vand Cluster" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 75000 },

		{ Name = "Sister of Parvos Confrontation", Link = "Sisters of Parvos", Planet = "Neptune Proxima", Type = "Assassination", Quotes = "Sisters of Parvos/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 63, MaxLevel = 70, FighterMinLevel = 31, FighterMaxLevel = 36, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, Drops = {}, MasteryExp = 0, InternalName = "CrewBattleNode558", IsHidden = true, Introduced = "30.5", IsRailjack = true, Requirements = "Must have [[Intrinsics]] Rank 3 or higher and an active [[Sister of Parvos]] to access" },
		{ Name = "Arva Vector", Link = "Arva Vector", Planet = "Neptune Proxima", Type = "Defense", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 25, MaxLevel = 28, DropTableAlias = "NeptuneProximaDefense", CacheDropTableAlias = "NeptuneProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 18, FighterMaxLevel = 20, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode504", Introduced = "29.10", IsRailjack = true, NextNodes = { "Nu-gua Mines" }, PreviousNodes = { "Kasio's Rest" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 50000 },
		{ Name = "Nu-gua Mines", Link = "Nu-gua Mines", Planet = "Neptune Proxima", Type = "Exterminate", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 27, MaxLevel = 30, DropTableAlias = "NeptuneProximaExterminate", CacheDropTableAlias = "NeptuneProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 20, FighterMaxLevel = 24, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode516", Introduced = "29.10", IsRailjack = true, NextNodes = { "Enkidu Ice Drifts" }, PreviousNodes = { "Arva Vector" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 56250 },
		{ Name = "Mammon's Prospect", Link = "Mammon's Prospect", Planet = "Neptune Proxima", Type = "Orphix", Quotes = "Orphix (Mission)/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 31, MaxLevel = 34, DropTableAlias = "NeptuneProximaOrphix", CacheDropTableAlias = "NeptuneProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 27, FighterMaxLevel = 32, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode523", Introduced = "29.10", IsRailjack = true, NextNodes = { "Brom Cluster" }, PreviousNodes = { "Enkidu Ice Drifts" }, Requirements = "Must have [[The War Within]] completed and [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 68750 },
		{ Name = "Brom Cluster", Link = "Brom Cluster", Planet = "Neptune Proxima", Type = "Spy", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 32, MaxLevel = 35, DropTableAlias = "NeptuneProximaSpy", CacheDropTableAlias = "NeptuneProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 28, FighterMaxLevel = 34, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode525", Introduced = "29.10", IsRailjack = true, NextNodes = { "Sovereign Grasp" }, PreviousNodes = { "Mammon's Prospect" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 75000 },
		{ Name = "Enkidu Ice Drifts", Link = "Enkidu Ice Drifts", Planet = "Neptune Proxima", Type = "Survival", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 29, MaxLevel = 32, DropTableAlias = "NeptuneProximaSurvival", CacheDropTableAlias = "NeptuneProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 23, FighterMaxLevel = 28, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode521", Introduced = "29.10", IsRailjack = true, NextNodes = { "Mammon's Prospect" }, PreviousNodes = { "Nu-gua Mines" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 62500 },
		{ Name = "Sovereign Grasp", Link = "Sovereign Grasp", Planet = "Neptune Proxima", Type = "Volatile", Quotes = "Volatile/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 33, MaxLevel = 36, DropTableAlias = "NeptuneProximaVolatile", CacheDropTableAlias = "NeptuneProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 31, FighterMaxLevel = 36, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode524", Introduced = "29.10", IsRailjack = true, NextNodes = { "Khufu Envoy" }, PreviousNodes = { "Brom Cluster" }, Requirements = "Must have [[Intrinsics]] Rank 3 or higher to access", AdditionalCreditReward = 75000 },

		{ Name = "Khufu Envoy", Link = "Khufu Envoy", Planet = "Pluto Proxima", Type = "Orphix", Quotes = "Orphix (Mission)/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 35, MaxLevel = 38, DropTableAlias = "PlutoProximaOrphix", CacheDropTableAlias = "PlutoProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 32, FighterMaxLevel = 35, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode526", Introduced = "29.10", IsRailjack = true, NextNodes = { "Seven Sirens" }, PreviousNodes = { "Sovereign Grasp" }, Requirements = "Must have [[The War Within]] completed and [[Intrinsics]] Rank 5 or higher to access", AdditionalCreditReward = 80000 },
		{ Name = "Seven Sirens", Link = "Seven Sirens", Planet = "Pluto Proxima", Type = "Exterminate", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 37, MaxLevel = 40, DropTableAlias = "PlutoProximaExterminate", CacheDropTableAlias = "PlutoProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 34, FighterMaxLevel = 38, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode527", Introduced = "29.10", IsRailjack = true, NextNodes = { "Obol Crossing" }, PreviousNodes = { "Khufu Envoy" }, Requirements = "Must have [[Intrinsics]] Rank 5 or higher to access", AdditionalCreditReward = 90000 },
		{ Name = "Obol Crossing", Link = "Obol Crossing", Planet = "Pluto Proxima", Type = "Defense", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 39, MaxLevel = 42, DropTableAlias = "PlutoProximaDefense", CacheDropTableAlias = "PlutoProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 37, FighterMaxLevel = 42, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode528", Introduced = "29.10", IsRailjack = true, NextNodes = { "Fenton's Field" }, PreviousNodes = { "Seven Sirens" }, Requirements = "Must have [[Intrinsics]] Rank 5 or higher to access", AdditionalCreditReward = 100000 },
		{ Name = "Fenton's Field", Link = "Fenton's Field", Planet = "Pluto Proxima", Type = "Survival", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 40, MaxLevel = 43, DropTableAlias = "PlutoProximaSurvival", CacheDropTableAlias = "PlutoProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 38, FighterMaxLevel = 44, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode531", Introduced = "29.10", IsRailjack = true, NextNodes = { "Profit Margin" }, PreviousNodes = { "Obol Crossing" }, Requirements = "Must have [[Intrinsics]] Rank 5 or higher to access", AdditionalCreditReward = 100000 },
		{ Name = "Profit Margin", Link = "Profit Margin", Planet = "Pluto Proxima", Type = "Volatile", Quotes = "Volatile/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 41, MaxLevel = 44, DropTableAlias = "PlutoProximaVolatile", CacheDropTableAlias = "PlutoProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 41, FighterMaxLevel = 45, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode529", Introduced = "29.10", IsRailjack = true, NextNodes = { "Peregrine Axis" }, PreviousNodes = { "Fenton's Field" }, Requirements = "Must have [[Intrinsics]] Rank 5 or higher to access", AdditionalCreditReward = 110000 },
		{ Name = "Peregrine Axis", Link = "Peregrine Axis", Planet = "Pluto Proxima", Type = "Spy", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 43, MaxLevel = 46, DropTableAlias = "PlutoProximaSpy", CacheDropTableAlias = "PlutoProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 44, FighterMaxLevel = 48, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode536", Introduced = "29.10", IsRailjack = true, NextNodes = { "Nsu Grid" }, PreviousNodes = { "Profit Margin" }, Requirements = "Must have [[Intrinsics]] Rank 5 or higher to access", AdditionalCreditReward = 120000 },
		
		{ Name = "Nsu Grid", Link = "Nsu Grid", Planet = "Veil Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, DropTableAlias = "VeilProximaSkirmish", CacheDropTableAlias = "VeilProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 32, FighterMaxLevel = 35, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, MasteryExp = 0, InternalName = "CrewBattleNode550", Introduced = "27", IsRailjack = true, NextNodes = { "Flexa" }, PreviousNodes = { "Peregrine Axis" }, Requirements = "Must have [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 80000 },
		{ Name = "R-9 Cloud", Link = "R-9 Cloud", Planet = "Veil Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, DropTableAlias = "VeilProximaSkirmish", CacheDropTableAlias = "VeilProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 40, FighterMaxLevel = 43, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, MasteryExp = 0, InternalName = "CrewBattleNode555", Introduced = "27", IsRailjack = true, NextNodes = { "Calabash" }, PreviousNodes = { "H-2 Cloud" }, Requirements = "Must have [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 115000 },
		{ Name = "H-2 Cloud", Link = "H-2 Cloud", Planet = "Veil Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, DropTableAlias = "VeilProximaSkirmish", CacheDropTableAlias = "VeilProximaCaches", ExtraDropTableAlias = "GrineerProximaExtra", FighterMinLevel = 38, FighterMaxLevel = 41, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, MasteryExp = 0, InternalName = "CrewBattleNode554", Introduced = "27", IsRailjack = true, NextNodes = { "R-9 Cloud" }, PreviousNodes = { "Flexa" }, Requirements = "Must have [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 135000 },
		{ Name = "Flexa", Link = "Flexa", Planet = "Veil Proxima", Type = "Skirmish", Quotes = "Skirmish/Quotes", Tileset = "Free Space", Enemy = "Grineer", MinLevel = 80, MaxLevel = 90, DropTableAlias = "VeilProximaSkirmish", CacheDropTableAlias = "VeilProximaCaches", ExtraDropTableAlias = "VeilProximaExtra", FighterMinLevel = 36, FighterMaxLevel = 39, MaxFighters = 90, MaxCrewships = 6, Objectives = 2, ObjectiveDetails = "Chance for Galleon Assassinate", MasteryExp = 0, InternalName = "CrewBattleNode553", Introduced = "27", IsRailjack = true, NextNodes = { "H-2 Cloud" }, PreviousNodes = { "Nsu Grid" }, Requirements = "Must have [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 85000 },
		{ Name = "Calabash", Link = "Calabash", Planet = "Veil Proxima", Type = "Exterminate", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 45, MaxLevel = 49, DropTableAlias = "VeilProximaExterminate", CacheDropTableAlias = "CorpusVeilProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 45, FighterMaxLevel = 48, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode538", Introduced = "29.10", IsRailjack = true, NextNodes = { "Numina" }, PreviousNodes = { "R-9 Cloud" }, Requirements = "Must have [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 125000 },
		{ Name = "Numina", Link = "Numina", Planet = "Veil Proxima", Type = "Volatile", Quotes = "Volatile/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 48, MaxLevel = 52, DropTableAlias = "VeilProximaVolatile", CacheDropTableAlias = "CorpusVeilProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 48, FighterMaxLevel = 52, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode539", Introduced = "29.10", IsRailjack = true, NextNodes = { "Arc Silver" }, PreviousNodes = { "Calabash" }, Requirements = "Must have [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 131250 },
		{ Name = "Arc Silver", Link = "Arc Silver", Planet = "Veil Proxima", Type = "Defense", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 51, MaxLevel = 55, DropTableAlias = "VeilProximaDefense", CacheDropTableAlias = "CorpusVeilProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 51, FighterMaxLevel = 55, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode540", Introduced = "29.10", IsRailjack = true, NextNodes = { "Erato" }, PreviousNodes = { "Numina" }, Requirements = "Must have [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 137500 },
		{ Name = "Erato", Link = "Erato", Planet = "Veil Proxima", Type = "Orphix", Quotes = "Orphix (Mission)/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 54, MaxLevel = 58, DropTableAlias = "VeilProximaOrphix", CacheDropTableAlias = "CorpusVeilProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 55, FighterMaxLevel = 59, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode541", Introduced = "29.10", IsRailjack = true, NextNodes = { "Lu-yan" }, PreviousNodes = { "Arc Silver" }, Requirements = "Must have [[The War Within]] completed and [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 143750 },
		{ Name = "Lu-yan", Link = "Lu-yan", Planet = "Veil Proxima", Type = "Survival", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 55, MaxLevel = 59, DropTableAlias = "VeilProximaSurvival", CacheDropTableAlias = "CorpusVeilProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 56, FighterMaxLevel = 60, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode542", Introduced = "29.10", IsRailjack = true, NextNodes = { "Sabmir Cloud" }, PreviousNodes = { "Erato" }, Requirements = "Must have [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 150000 },
		{ Name = "Sabmir Cloud", Link = "Sabmir Cloud", Planet = "Veil Proxima", Type = "Spy", Quotes = "Empyrean/Quotes", Tileset = "Free Space", Enemy = "Corpus", MinLevel = 57, MaxLevel = 60, DropTableAlias = "VeilProximaSpy", CacheDropTableAlias = "CorpusVeilProximaCaches", ExtraDropTableAlias = "CorpusProximaExtra", FighterMinLevel = 59, FighterMaxLevel = 62, MaxFighters = 0, MaxCrewships = 0, Objectives = 0, MasteryExp = 0, InternalName = "CrewBattleNode543", Introduced = "29.10", IsRailjack = true, PreviousNodes = { "Lu-yan" }, Requirements = "Must have [[Intrinsics]] Rank 7 or higher to access and [[Chimera Prologue]] completed", AdditionalCreditReward = 150000 },
	},
	by = { Name = {} },
	dictionary = {},
	vars = {
		'Name',
		'Enemy',
		'Planet',
		'Type',
		'Tileset',
		'DropTableAlias',
		'Boss',
		'Drops',
		'Pic',
		'MasteryExp',
		'ObjectiveDetails',
		'InternalName',
		'IsDarkSector',
	},
}

table.sort(MissionData["MissionDetails"], function(a,b) 
	return a.MinLevel < b.MinLevel or (a.MinLevel == b.MinLevel and a.MaxLevel < b.MaxLevel)
end)

for i, obj in ipairs(MissionData["MissionDetails"]) do
	obj.IsDarkSector = obj.IsDarkSector and true or false	-- default
	obj.IsCrossfire = (type(obj.Enemy) == 'table') and (obj.Enemy[1] ~= 'Infested') and true or false
	
	if not obj.IgnoreInList then
		for valname, v in pairs(obj) do 
			if not MissionData.by[valname] then
				MissionData.by[valname] = {}
			end
			for i, val in ipairs(type(v) == 'table' and v or {v}) do
				if not MissionData.by[valname][val] then
					MissionData.by[valname][val] = {}
				end
				
				table.insert(MissionData.by[valname][val], obj)
				
				if type(val) ~= 'number' and val ~= 'Capture' then 
					if not MissionData.dictionary[val] then
						MissionData.dictionary[val] = valname
					elseif MissionData.dictionary[val] ~= valname then
						local order = MissionData.vars
						for i,v in ipairs(order) do
							order[i] = nil
							order[v] = i
						end
						
						MissionData.dictionary[val] = 
							(order[valname] or #order+1) < (order[MissionData.dictionary[val]] or #order+1) and valname or MissionData.dictionary[val]
					end
				end
			end
		end
	end
	obj.Id = i
	obj.FactionImage = obj.Pic or 
		MissionData.FactionImages[(type(obj.Enemy) == 'table') and (obj.Enemy[1] ~= 'Infested' and 'Crossfire' or 'Infested') or obj.Enemy]
	obj.RegionResources = MissionData.RegionResources[obj.Planet]
	if (obj.CreditReward == nil) then
		obj.CreditReward = 1000 + 100 * (obj.MinLevel - 1)
	end
end

MissionData.dictionary.Capture = 'Type'

for k in pairs(MissionData.by) do table.insert(MissionData.vars, k) end

--list vars:
-- for k,v in ipairs(p.vars) do mw.log(k) end
-- error(mw.dumpObject(MissionData))
return MissionData
