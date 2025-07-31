-- 1.0 version config arrays Config.Baits, Config.Animals and Config.Areas/Config.Districts/Config.Districts2 can be used here

Config.Baits = {
    {"mutton", "Raw Mutton"},
    {"pork", "Raw Pork"},
    {"bird", "Raw Birdmeat"},
    {"beef", "Raw Beef"},
    {"woodlog", "Woodlog"},
    {"corn", "Corn"},
    {"wheat", "Wheat"},
    {"venison", "Raw Venison"},
    {"stringy", "Raw Stringy meat"},
    {"game", "Raw Game meat"},
    {"herptile", "Raw Herptile meat"},
    {"biggame", "Raw Big Game meat"},
}

--Now "xp" array can be configured for Animal entries, as #1 example shows
--Xp requirement can be configured to be able to spawn and hunt animal with placed trap once XP reached by player
--XP can be earned after successfully spawn an animal
Config.Animals = {
    [1] = {--ID
        name = "Legendary Teca Alligator",--NAME
        hash = `mp_a_c_alligator_01`,--MODEL
        outfit = 0,--OUTFIT
        bait = "mutton",--BAIT TYPE
        Time = {1,23},--SPAWN AFTER 1 AM AND BEFORE 11pm
        xp = {require = 0, earn = 10}, --NEW 2.0
        health = 250,--NEW 2.0
        blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},--NEW 2.0
    },
    [2] = {
        name = "Legendary Sun Alligator",
        hash = `mp_a_c_alligator_01`,
        outfit = 1,
        bait = "pork",
        Time = {15,18},--SPAWN AFTER 3 PM AND BEFORE 6PM
        xp = {require = 100, earn = 10}, --NEW 2.0
        health = 250,--NEW 2.0
        blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},--NEW 2.0
    },
    [3] = {
        name = "Legendary Banded Alligator",
        hash = `mp_a_c_alligator_01`,
        outfit = 2,
        bait = "bird",
        Time = {1,23},
    },
    [4] = {
        name = "Legendary Bullgator",
        hash = `a_c_alligator_02`,
        outfit = 0,
        bait = "beef",
        Time = {1,23},
    },
    [5] = {
        name = "Legendary Grey Beaver",
        hash = `mp_a_c_beaver_01`,
        outfit = 0,
        bait = "woodlog",
        Time = {1,23},
    },
    [6] = {
        name = "Legendary White Beaver",
        hash = `mp_a_c_beaver_01`,
        outfit = 1,
        bait = "corn",
        Time = {1,23},
    },
    [7] = {
        name = "Legendary Black Beaver",
        hash = `mp_a_c_beaver_01`,
        outfit = 2,
        bait = "wheat",
        Time = {1,23},
    },
    [8] = {
        name = "Legendary Cogi Boar",
        hash = `mp_a_c_boar_01`,
        outfit = 0,
        bait = "corn",
        Time = {1,23},
    },
    [9] = {
        name = "Legendary Wakpa Boar",
        hash = `mp_a_c_boar_01`,
        outfit = 1,
        bait = "wheat",
        Time = {1,23},
    },
    [10] = {
        name = "Legendary Icahi Boar",
        hash = `mp_a_c_boar_01`,
        outfit = 2,
        bait = "corn",
        Time = {1,23},
    },
    [11] = {
        name = "Legendary Wildhog",
        hash = `mp_a_c_boar_01`,
        outfit = 5,
        bait = "wheat",
        Time = {1,23},
    },
    [12] = {
        name = "Legendary Iguga Cougar",
        hash = `mp_a_c_cougar_01`,
        outfit = 0,
        bait = "pork",
        Time = {1,23},
    },
    [13] = {
        name = "Legendary Maza Cougar",
        hash = `mp_a_c_cougar_01`,
        outfit = 1,
        bait = "beef",
        Time = {1,23},
    },
    [14] = {
        name = "Legendary Sapa Cougar",
        hash = `mp_a_c_cougar_01`,
        outfit = 2,
        bait = "mutton",
        Time = {1,23},
    },
    [15] = {
        name = "Legendary Black Cougar",
        hash = `mp_a_c_cougar_01`,
        outfit = 3,
        bait = "venison",
        Time = {1,23},
    },
    [16] = {
        name = "Legendary Red Streak Coyote",
        hash = `mp_a_c_coyote_01`,
        outfit = 0,
        bait = "stringy",
        Time = {1,23},
    },
    [17] = {
        name = "Legendary Midnight Paw Coyote",
        hash = `mp_a_c_coyote_01`,
        outfit = 1,
        bait = "game",
        Time = {1,23},
    },
    [18] = {
        name = "Legendary Milk Coyote",
        hash = `mp_a_c_coyote_01`,
        outfit = 2,
        bait = "herptile",
        Time = {1,23},
    },
    [19] = {
        name = "Legendary Nightwalker Panther",
        hash = `mp_a_c_panther_01`,
        outfit = 0,
        bait = "biggame",
       Time = {15,18},
    },
    [20] = {
        name = "Legendary Ghost Panther",
        hash = `mp_a_c_panther_01`,
        outfit = 1,
        bait = "mutton",
        Time = {1,23},
    },
    [21] = {
        name = "Legendary Iwakta Panther",
        hash = `mp_a_c_panther_01`,
        outfit = 2,
        bait = "pork",
        Time = {1,23},
    },
    [22] = {
        name = "Legendary Emerald Wolf",
        hash = `mp_a_c_wolf_01`,
        outfit = 0,
        bait = "bird",
        Time = {1,23},
    },
    [23] = {
        name = "Legendary Onyx Wolf",
        hash = `mp_a_c_wolf_01`,
        outfit = 1,
        bait = "beef",
        Time = {1,23},
    },
    [24] = {
        name = "Legendary Moonstone Wolf",
        hash = `mp_a_c_wolf_01`,
        outfit = 2,
        bait = "bird",
        Time = {1,23},
    },
    [25] = {
        name = "Legendary Deadly Bear",
        hash = `mp_a_c_bear_01`,
        outfit = 0,
        bait = "mutton",
        Time = {1,23},
    },
    [26] = {
        name = "Legendary Owiza Bear",
        hash = `mp_a_c_bear_01`,
        outfit = 1,
        bait = "beef",
        Time = {1,23},
    },
    [27] = {
        name = "Legendary Ridgeback Spirit Bear",
        hash = `mp_a_c_bear_01`,
        outfit = 2,
        bait = "game",
        Time = {1,23},
    },
    [28] = {
        name = "Legendary Golden Spirit Bear",
        hash = `mp_a_c_bear_01`,
        outfit = 3,
        bait = "pork",
        Time = {1,23},
    },
    [29] = {
        name = "Legendary Gabbro Horn Ram",
        hash = `mp_a_c_bighornram_01`,
        outfit = 0,
        bait = "wheat",
        Time = {1,23},
    },
    [30] = {
        name = "Legendary Chalk Horn Ram",
        hash = `mp_a_c_bighornram_01`,
        outfit = 1,
        bait = "corn",
        Time = {1,23},
    },
    [31] = {
        name = "Legendary Rutile Horn Ram",
        hash = `mp_a_c_bighornram_01`,
        outfit = 2,
        bait = "corn",
        Time = {1,23},
    },
    [32] = {
        name = "Legendary GreatHorn Ram",
        hash = `mp_a_c_bighornram_01`,
        outfit = 3,
        bait = "wheat",
        Time = {1,23},
    },
    [33] = {
        name = "Legendary Buck",
        hash = `mp_a_c_buck_01`,
        outfit = 0,
        bait = "wheat",
        Time = {1,23},
    },
    [34] = {
        name = "Legendary Mudrunner Buck",
        hash = `mp_a_c_buck_01`,
        outfit = 2,
        bait = "corn",
        Time = {1,23},
    },
    [35] = {
        name = "Legendary Snow Buck",
        hash = `mp_a_c_buck_01`,
        outfit = 3,
        bait = "wheat",
        Time = {1,23},
    },
    [36] = {
        name = "Legendary Shadow Buck",
        hash = `mp_a_c_buck_01`,
        outfit = 4,
        bait = "corn",
        Time = {1,23},
    },
    [37] = {
        name = "Legendary Tatanka Bison",
        hash = `mp_a_c_buffalo_01`,
        outfit = 0,
        bait = "wheat",
        Time = {1,23},
    },
    [38] = {
        name = "Legendary Winyan Bison",
        hash = `mp_a_c_buffalo_01`,
        outfit = 1,
        bait = "corn",
        Time = {1,23},
    },
    [39] = {
        name = "Legendary Payata Bison",
        hash = `mp_a_c_buffalo_01`,
        outfit = 2,
        bait = "wheat",
        Time = {1,23},
    },
    [40] = {
        name = "Legendary Katata Elk",
        hash = `mp_a_c_elk_01`,
        outfit = 0,
        bait = "corn",
        Time = {1,23},
    },
    [41] = {
        name = "Legendary Ozula Elk",
        hash = `mp_a_c_elk_01`,
        outfit = 1,
        bait = "corn",
        Time = {1,23},
    },
    [42] = {
        name = "Legendary Inahme Elk",
        hash = `mp_a_c_elk_01`,
        outfit = 2,
        bait = "wheat",
        Time = {1,23},
    },
    [43] = {
        name = "Legendary Ota Fox",
        hash = `mp_a_c_fox_01`,
        outfit = 0,
        bait = "herptile",
        Time = {1,23},
    },
    [44] = {
        name = "Legendary Marble Fox",
        hash = `mp_a_c_fox_01`,
        outfit = 1,
        bait = "game",
        Time = {1,23},
    },
    [45] = {
        name = "Legendary Cross Fox",
        hash = `mp_a_c_fox_01`,
        outfit = 2,
        bait = "stringy",
        Time = {1,23},
    },
    [46] = {
        name = "Legendary Snowflake Moose",
        hash = `mp_a_c_moose_01`,
        outfit = 1,
        bait = "wheat",
        Time = {1,23},
    },
    [47] = {
        name = "Legendary Knight Moose",
        hash = `mp_a_c_moose_01`,
        outfit = 2,
        bait = "corn",
        Time = {1,23},
    },
    [48] = {
        name = "Legendary Ruddy Moose",
        hash = `mp_a_c_moose_01`,
        outfit = 3,
        bait = "wheat",
        Time = {1,23},
    },
    [49] = {
        name = "Legendary Giaguaro Cougar",
        hash = `a_c_cougar_01`,
        outfit = 5,
        bait = "beef",
        Time = {1,23},
    },
    [50] = {
        name = "Legendary Great Boar",
        hash = `a_c_boarlegendary_01`,
        outfit = 0,
        bait = "wheat",
        Time = {1,23},
    },
    [51] = {
        name = "Legendary Rattlesnake",
        hash = `a_c_snake_01`,
        outfit = 3,
        bait = "stringy",
        Time = {1,23},
    },
    [52] = { ------ HARD TO BE KILLED
        name = "Legendary Boa",
        hash = `a_c_snakeredboa10ft_01`,
        outfit = 0,
        bait = "game",
        Time = {1,23},
    },
    [53] = {
        name = "Legendary Bison",
        hash = `a_c_buffalo_01`,
        outfit = 4,
        bait = "wheat",
        Time = {1,23},
    },
    [54] = {
        name = "Legendary Boar",
        hash = `a_c_boar_01`,
        outfit = 2,
        bait = "corn",
        Time = {1,23},
    },
    [55] = {
        name = "Legendary Fox",
        hash = `a_c_fox_01`,
        outfit = 3,
        bait = "game",
        Time = {1,23},
    },
    [56] = {
        name = "Legendary Bighorn Ram",
        hash = `a_c_bighornram_01`,
        outfit = 12,
        bait = "corn",
        Time = {1,23},
    },
    [57] = {
        name = "Legendary Beaver",
        hash = `a_c_beaver_01`,
        outfit = 1,
        bait = "woodlog",
        Time = {1,23},
    },
    [58] = {
        name = "Legendary Buck",
        hash = `a_c_buck_01`,
        outfit = 3,
        bait = "wheat",
        Time = {1,23},
    },
    [59] = {
        name = "Legendary Tiger Cougar",
        hash = `a_c_cougar_01`,
        outfit = 2,
        bait = "biggame",
        Time = {1,23},
    },
    [60] = {
        name = "Legendary Black Cougar",
        hash = `a_c_cougar_01`,
        outfit = 5,
        bait = "bird",
        Time = {1,23},
    },
    [61] = {
        name = "Legendary Coyote",
        hash = `a_c_coyote_01`,
        outfit = 1,
        bait = "stringy",
        Time = {1,23},
    },
    [62] = {
        name = "Legendary Pronghorn",
        hash = `a_c_pronghorn_01`,
        outfit = 1,
        bait = "wheat",
        Time = {1,23},
    },
    [63] = {
        name = "Legendary Wolf",
        hash = `A_C_Wolf`,
        outfit = 3,
        bait = "game",
        Time = {1,23},
    },
    [64] = {
        name = "Legendary Moose",
        hash = `a_c_moose_01`,
        outfit = 6,
        bait = "wheat",
        Time = {1,23},
    },
    [65] = {
        name = "Legendary Bear",
        hash = `a_c_bear_01`,
        outfit = 10,
        bait = "biggame",
        Time = {1,23},
    },
    [66] = {
        name = "Legendary Tatanka Bison",
        hash = `a_c_buffalo_tatanka_01`,
        outfit = 0,
        bait = "corn",
        Time = {1,23},
    },
    [67] = {
        name = "Legendary Elk",
        hash = `a_c_elk_01`,
        outfit = 1,
        bait = "wheat",
        Time = {1,23},
    },
}

Config.Areas = {
    --{hashname, hash1, hash2, animal can be found, animalid, areaname}
    {"W_4_ABANDONED_MISSION", 0xD1113443, -787401661, false, nil,"Abandoned Mission"},
    {"W_4_ABANDONED_TRADING_POST", 0x44CE7B03, 1154382595, false, nil,"Abandoned Trading Post"},
    {"W_4_ABERDEEN_PIG_FARM", 0x0D0F2B79, 219097977, true, 67,"Aberdeen Pig Farm"},--ELK ID 67
    {"W_4_ADLER_RANCH", 0xC1CD737F, -1043500161, true, 63,"Adler Ranch"},--WOLF ID 63
    {"W_4_APPLESEED_TIMBER_COMPANY", 0xE6F7DBF9, -419963911, false, nil,"Appleseed Timber Company"},
    {"W_4_BAYGALL_EDGE", 0x0BE5C4CF, 199607503, false, nil,"Baygall Edge"},
    {"W_4_BEAR_CLAW", 0xF035FC69, -264897431, true, 65,"Bear Claw"},--BEAR ID 65
    {"W_4_BEECHERS_HOPE", 0x63F741E1, 1677148641, false, nil,"Beechers Hope"},
    {"W_4_BRITTLEBRUSH_TRAWL", 0xC9592823, -916903901, false, nil,"BrittleBrush Trawl"},
    {"W_4_BUTCHER_CREEK", 0xE6A471EB, -425430549, true, 7,"Butcher Creek"},--BEAVER ID 7
    {"W_4_CAIRN_LODGE", 0x88CA196B, -2000021141, false, nil,"Cairn Lodge"},
    {"W_4_CANEBREAK_MANOR", 0x229D05AC, 580715948, false, nil,"Canebreak Manor"},
    {"W_4_CARMODY_DELL", 0x8EA16502, -1902025470, true, 58,"Carmody Dell"},--BUCK ID 58
    {"W_4_CASTORS_RIDGE", 0xDB1A94C6, -619014970, false, nil,"Castors Ridge"},
    {"W_4_CATFISH_JACKSONS", 0x656FB687, 1701820039, false, nil,"Catfish Jacksons"},
    {"W_4_CENTRAL_UNION_RAILROAD_1", 0x20144315, 538198805, false, nil,"Central Union Railroad 1"},
    {"W_4_CENTRAL_UNION_RAILROAD_2", 0x5CDBBCA3, 1557904547, false, nil,"Central Union Railroad 2"},
    {"W_4_CENTRAL_UNION_RAILROAD_3", 0x4A98181C, 1251481628, false, nil,"Central Union Railroad 3"},
    {"W_4_CHEZ_PORTER", 0x86BE76ED, -2034338067, true, 56,"Chez Porter"},--BIGHORN RAM ID 56
    {"W_4_CLAWSONS_REST", 0x620D6F83, 1645047683, false, nil,"Clawsons Rest"},
    {"W_4_CLEMENS_POINT", 0x6D17AC2F, 1830267951, false, nil,"Clemens Point"},
    {"W_4_CLINGMAN", 0x767DC860, 1987954784, true, 8,"Clingman"}, --BOAR ID 8
    {"W_4_COCHINAY", 0x1321E567, 320988519, true, 22,"Cochinay"},--WOLF ID 22
    {"W_4_COLTER", 0xA6CC7164, -1496551068, false, nil,"Colter"},
    {"W_4_COMPSONS_STEAD", 0x1F24B6AE, 522499758, false, nil,"Compsons Stead"},
    {"W_4_COOTS_CHAPEL", 0xFC5A9494, -61172588, false, nil,"Coots Chapel"},
    {"W_4_COPPERHEAD_LANDING", 0x40815011, 1082216465, false, nil,"Copperhead Landing"},
    {"W_4_CORNWALL_KEROSENE_TAR", 0x1D5BC2A5, 492552869, false, nil,"Cornwall Kerosene Tar"},
    {"W_4_CRAWDAD_WILLIES", 0xBA9A795B, -1164281509, false, nil,"Crawdad Willies"},
    {"W_4_CUEVA_SECA", 0x4A606200, 1247830528, false, nil,"Cueva Seca"},
    {"W_4_DODDS_BLUFF", 0x96933878, -1768736648, false, nil,"Doods Bluff"},
    {"W_4_DORMIN_CREST", 0xC88AA5E6, -930437658, true, 26,"Dormin Crest"},--BEAR ID 26
    {"W_4_DOVERHILL", 0xD98BB81D, -645154787, false, nil,"Doverhill"},
    {"W_4_DOWNES_RANCH", 0xD8D62973, -657053325, false, nil,"Downes Ranch"},
    {"W_4_EL_NIDO", 0x18E91D1B, 417930523, false, nil,"El Nido"},--GUARMA
    {"W_4_EVELYN_MILLER_CAMP", 0x3D67DD7C, 1030217084, false, nil,"Evelyn Miller Camp"},
    {"W_4_EWING_BASIN", 0xDF753206, -545967610, true, 23,"Ewing Basin"},--WOLF ID 23
    {"W_4_FACE_ROCK", 0x9372C764, -1821194396, false, nil,"Face Rock"},
    {"W_4_FAIRVALE_SHANTY", 0x9F50855A, -1622112934, false, nil,"Fairvale Shanty"},
    {"W_4_FIRE_LOOKOUT_TOWER", 0xD3A671FC, -744066564, false, nil,"Fire Lookout Tower"},
    {"W_4_FIRWOOD_RISE", 0xF7453243, -146460093, true, 24,"Firwood Rise"},--WOLF ID 24
    {"W_4_FLATTENED_CABIN", 0x565B032F, 1448805167, false, nil,"Flattened Cabin"},
    {"W_4_FORT_RIGGS_HOLDING_CAMP", 0xCE9BA997, -828659305, false, nil,"Fort Riggs Holding Camp"},
    {"W_4_GAPTOOTH_BREACH", 0x026256CA, 39999178, true, 19,"Gaptooth Breach"},--PANTHER ID 19
    {"W_4_GILL_LANDING", 0xFF6DBCB4, -9585484, false, nil,"Gill Landing"},
    {"W_4_GRANGERS_HOGGERY", 0xCC18EFF5, -870780939, false, nil,"Grangers Hoggery"},
    {"W_4_GREENHOLLOW", 0x729C12AF, 1922831023, false, nil,"Green Hollow"},
    {"W_4_GUTHRIE_FARM", 0xA83D828C, -1472363892, false, nil,"Guthrie Farm"},
    {"W_4_HAGEN_ORCHARDS", 0x01D5FAC3, 30800579, true, 59,"Hagen Orchards"},--COUGAR ID 59
    {"W_4_HANGING_DOG_RANCH", 0xF9D63EB6, -103399754, true, 60,"Hanging Dog Ranch"},--COUGAR ID 60
    {"W_4_HANIS_BETHEL", 0x2202EE4D, 570617421, false, nil,"Hanis Bethel"},
    {"W_4_HILL_HAVEN_RANCH", 0x96872368, -1769528472, false, nil,"Hill Haven Ranch"},
    {"W_4_HORSESHOE_OVERLOOK", 0xAEF74FB9, -1359523911, false, nil,"Horseshoe Overlook"},
    {"W_4_HOUSEBOAT", 0x70F74B60, 1895254880, false, nil,"Houseboat"},
    --{"W_4_LAKE_DON_JULIO_HOUSE", 0x9B1E5B7F, -1692509313, false, nil,"Lake Don Julio House"},
    {"W_4_LARNED_SOD", 0x695954DA, 1767462106, false, nil,"Larned Sod"},
    {"W_4_LONE_MULE_STEAD", 0xDD9EFEE5, -576782619, false, nil,"Lone Mule Stead"},
    {"W_4_LONNIES_SHACK", 0x2DF010E2, 770707682, false, nil,"Lonnies Shack"},
    {"W_4_LUCKYS_CABIN", 0x0DAD94D2, 229479634, false, nil,"Lucky's Cabin"},
    {"W_4_MACLEANS_HOUSE", 0xA11AEDB9, -1592070727, false, nil,"Maclean's House"},
    {"W_4_MACOMBS_END", 0x3F53BC77, 1062452343, false, nil,"Macomb's End"},
    {"W_4_MANITO_GLADE", 0x55A6D12B, 1436995883, false, nil,"Manito Glade"},
    {"W_4_MARTHAS_SWAIN", 0x300DE595, 806217109, false, nil,"Martha's Swain"},
    {"W_4_MERKINS_WALLER", 0x5082CF03, 1350749955, false, nil,"Merkins Waller"},
    {"W_4_METEOR_HOUSE", 0x8C3CD7F3, -1942169613, false, nil,"Meteor House"},
    {"W_4_MICAHS_HIDEOUT", 0x59D077AC, 1506834348, false, nil,"Micah's Hideout"},
    {"W_4_MILLESANI_CLAIM", 0x7F1C3407, 2132554759, false, nil,"Millesani Claim"},
    {"W_4_MOSSY_FLATS", 0x3C93944A, 1016304714, false, nil,"Mossy Flats"},
    {"W_4_NEKOTI_ROCK", 0x1667C7A9, 375900073, true, 66,"Nekoti Rock"}, --BISON ID 66
    {"W_4_ODDFELLOWS_REST", 0xDA5FA6D8, -631265576, false, nil,"Oddfellows Rest"},
    {"W_4_OIL_DERRICK", 0x4DEBB513, 1307292947, false, nil,"Oil Derrick"},
    {"W_4_OLD_GREENBANK_MILL", 0xEEA64B2B, -291091669, false, nil,"Old Greenbank"},
    {"W_4_OLD_HARRY_FEN", 0x5055B4E0, 1347794144, false, nil,"Old Harry Fen"},
    {"W_4_OLD_TOMS_BLIND", 0x5F8E4341, 1603158849, false, nil,"Old Toms Blind"},
    {"W_4_OLD_TRAIL_RISE", 0xF32CB01B, -215175141, false, nil,"Old Trail Rise"},
    {"W_4_OSMAN_GROVE", 0x15673770, 359085936, false, nil,"Osman Grove"},
    {"W_4_PAINTED_SKY", 0xA54B8915, -1521776363, false, nil,"Painted Sky"},
    {"W_4_PIKES_BASIN", 0xEBEF68EE, -336631570, true, 9,"Pikes Basin"},--BOAR ID 9
    {"W_4_PLANTERS_BAWN", 0x9AAED2F4, -1699818764, true, 53,"Planters Bawn"},--BISON ID 53
    {"W_4_PLEASANCE", 0x353AC7BD, 893044669, false, nil,"Pleasance"},
    {"W_4_PLEASANCE_HOUSE", 0x86B12D24, -2035208924, false, nil,"Pleasance House"},
    {"W_4_PRINZ_CO", 0x6EE5C62B, 1860552235, false, nil,"Prinz Co"},
    {"W_4_PRONGHORN_RANCH", 0xF8D01ECE, -120578354, false, nil,"Pronghorn Ranch"},
    {"W_4_RATTLESNAKE_HOLLOW", 0x58105158, 1477464408, false, nil,"Rattlesnake Hollow"},
    {"W_4_REPENTANCE", 0x43BCB764, 1136441188, false, nil,"Repentance"},
    {"W_4_RIDGE_VIEW", 0xD0BA4C63, -793097117, false, nil,"Ridge View"},
    {"W_4_RIDGEWOOD_FARM", 0x5C0805AB, 1544029611, false, nil,"Ridgewood Farm"},
    {"W_4_RILEYS_CHARGE", 0x2C0B51CA, 738939338, false, nil,"Rileys Charge"},
    {"W_4_RIO_DEL_LOBO_HOUSE", 0xB5A7CAAE, -1247294802, false, nil,"Rio Del Lobo House"},
    {"W_4_ROADSIDE_BROTHEL", 0x664A6EF4, 1716154100, false, nil,"Roadside Brothel"},
    {"W_4_ROBARD_FARM", 0x53800035, 1400897589, false, nil,"Robard Farm"},
    {"W_4_SAWBONE_CLEARING", 0x3292E8D5, 848488661, false, nil,"Sawbone Clearing"},
    {"W_4_SCRATCHING_POST", 0x005E5CEB, 6184171, true, 18,"Scratching Post"},--COYOTE ID 18
    {"W_4_SHADY_BELLE", 0x33A0D3EC, 866178028, false, nil,"Shady Belle"},
    {"W_4_SHEPHERDS_RISE", 0xE1F57D42, -504005310, false, nil,"Shepherds Rise"},
    {"W_4_SILENT_STEAD", 0xCC3A1981, -868607615, false, nil,"Silent Stead"},
    {"W_4_SILTWATER_STRAND", 0x377AB2F9, 930788089, true, 51,"Siltwater Strand"},--SNAKE ID 51
    {"W_4_SIX_POINT_CABIN", 0x7A9A9F57, 2056953687, false, nil,"Six Point Cabin"},
    {"W_4_SOLOMONS_FOLLY", 0x345C766C, 878474860, true, 51,"Solomon's Folly"},--RATTLESNAKE ID 51
    {"W_4_STILLWATER_CABIN", 0x6F889F10, 1871224592, false, nil,"Stillwater Cabin"},
    {"W_4_STILT_SHACK", 0x4135DBBC, 1094048700, false, nil,"Stilt Shack"},
    {"W_4_SWADBASS_POINT", 0xBE7D779C, -1099073636, false, nil,"Swadbass Point"},
    {"W_4_TANNERS_REACH", 0xAB5E835F, -1419869345, false, nil,"Tanners Reach"},
    {"W_4_TAXIDERMIST_HOUSE", 0x8F1BCA55, -1894004139, false, nil,"Taxidermist House"},
    {"W_4_THE_HANGING_ROCK", 0x01DDD396, 31314838, false, nil,"Hanging Rock"},
    {"W_4_THE_LOFT", 0xE5D84B79, -438809735, true, 11,"The Loft"},--BOAR ID 11
    {"W_4_THE_OLD_BACCHUS_PLACE", 0xBA0B2C82, -1173672830, false, nil,"Old Bacchus Place"},
    {"W_4_TRADING_POST", 0x845CED96, -2074284650, false, nil,"Trading Post"},
    {"W_4_TRAPPERS_CABIN", 0x163AE1E1, 372957665, false, nil,"Trappers Cabin"},
    {"W_4_TWO_CROWS", 0x80DC09EC, -2133063188, false, nil,"Two Crows"},
    {"W_4_UTOPIAN_COLONY_BUILDING", 0xD21EE891, -769726319, false, nil,"Utopian Colony Building"},
    {"W_4_VAN_HORN_MANSION", 0x34863110, 881209616, true, 57,"Van Horn Mansion"},--BEAVER ID 57
    {"W_4_VENTERS_PLACE", 0x0783569F, 126047903, true, 62,"Venters Place"},--PRONGHORN ID 62
    {"W_4_VETERANS_HOMESTEAD", 0x3BAF424F, 1001341519, false, nil,"Veterans Homestead"},
    {"W_4_WALLACE_OVERLOOK", 0x65994796, 1704544150, false, nil,"Wallace Overlook"},
    {"W_4_WATSONS_CABIN", 0xBAC9B3A9, -1161186391, false, nil,"Watson's Cabin"},
    {"W_4_WILLARDS_REST", 0xF6C518EB, -154855189, false, nil,"Willard's Rest"},
    {"W_4_WITCHES_CAULDRON", 0x3375B1D2, 863351250, false, nil,"Witches Cauldron"},
    {"W_5_ARGIL_RISE", 0x0EA363C9, 245588937, false, nil,"Argil Rise"},
    {"W_5_BEAVER_HOLLOW", 0xF7B0EB8A, -139400310, false, nil,"Beaver Hollow"},
    {"W_5_BERYLS_DREAM", 0x4848054E, 1212679502, false, nil,"Beryls Dream"},
    {"W_5_BLACK_BALSAM_RISE", 0xC62FFBC6, -969933882, true, 12,"Black Balsam Rise"},--COUGAR ID 12
    {"W_5_BLACK_BONE_FOREST", 0xA43C8951, -1539536559, false, nil,"Black Bone Forest"},
    {"W_5_BROKEN_TREE", 0x81417DA0, -2126414432, false, nil,"Broken Tree"},
    {"W_5_CHADWICK_FARM", 0xCF732CFE, -814535426, false, nil,"Chadwick Farm"},
    {"W_5_DEER_COTTAGE", 0x298A013E, 696910142, false, nil,"Deer Cottage"},
    {"W_5_FISHINGSPOT", 0x7C690B35, 2087258933, false, nil,"Fishing Spot"},
    {"W_5_FORT_BRENNAND", 0x97800BD2, -1753216046, false, nil,"Fort Brennand"},
    {"W_5_GRAND_KORRIGAN_DOCKED", 0x88CD8123, -1999797981, false, nil,"Grand Korrigan"},
    {"W_5_GRAND_KORRIGAN_SEA", 0x603377B9, 1613985721, false, nil,"Grand Korrigan Sea"},
    {"W_5_HURON_GLEN", 0x0DC39324, 230920996, false, nil,"Huron Glen"},
    {"W_5_LENORA_VIEW", 0x3FE3547E, 1071862910, false, nil,"Lenora View"},
    {"W_5_LIMPANY", 0xCE67AF12, -832065774, true, 4,"Limpany"},--ALLIGATOR ID 4
    {"W_5_RADLEYS_PASTURE", 0xF0840204, -259784188, false, nil,"Radleys Pasture"},
    {"W_5_VALLEY_VIEW", 0x292C5252, 690770514, false, nil,"Valley View"},
    {"W_5_VETTERS_ECHO", 0x5511F36C, 1427239788, false, nil,"Vetter's Echo"},
    {"W_6_RADLEYS_HOUSE", 0x7678268D, 1987585677, true, 55,"Radley's House"},--FOX ID 55
    {"W_6_REED_COTTAGE", 0x59607054, 1499492436, false, nil,"Reed Cottage"},
}

Config.Districts = {
    {"p_2_bluewater_marsh", 0x93334804, -1825355772, false, nil,"Bluewater Marsh District"},
    {"P_3_AURORA_BASIN", 0x47192461, 1192830049, false, nil,"Aurora Basin"},
    {"P_3_BAHIA_DE_LA_PAZ", 0x9D32963D, -1657629123, false, nil,"Bahia De la Paz"},--GUARMA
    {"P_3_BARROW_LAGOON", 0x594D596C, 1498241388, true, 64,"Barrow Lagoon"},--MOOSE ID 64
    {"P_3_CAIRN_LAKE", 0x233DD2DA, 591254234, false, nil,"Cairn Lake"},
    {"P_3_CATTAIL_POND", 0x911B42FC, -1860484356, false, nil,"Cattail Pond"},
    {"P_3_DAKOTA_RIVER", 0xF7BC627C, -138648964, false, nil,"Dakota River"},
    {"P_3_DEADBOOT_CREEK", 0x54898248, 1418297928, true, 40,"Deadboot Creek"},--ELK ID 40
    {"P_3_DEWBERRY_CREEK", 0xF37CEFEA, -209915926, true, 47,"Dewberry Creek"},--MOOSE ID 47
    {"P_3_ELYSIAN_POOL", 0x6822C55D, 1747109213, false, nil,"Elysian Pool"},
    {"P_3_ERIS_FIELD", 0x478F80B5, 1200586933, false, nil,"Eris Field"},
    {"P_3_FLAT_IRON_LAKE", 0x00DBDA50, 14408272, false, nil,"Flat Iron Lake"},
    {"P_3_HEARTLAND_OIL_FIELDS", 0xC9C79854, -909666220, false, nil,"Heartland Oil Fields"},
    {"P_3_HEARTLAND_OVERFLOW", 0x7DC4A1C6, 2110038470, true, 37,"Heartland Overflow"},--BISON ID 37
    {"P_3_LAKAY", 0x1BD5A429, 466986025, true, 1,"Lakay"},--ALLIGATOR ID 1
    {"P_3_LAKE_DON_JULIO", 0x472F164A, 1194268234, true, 50,"Lake Don Julio"},--BOAR ID 50
    {"P_3_LANNAHECHEE_RIVER", 0x5CE61D88, 1558584712, true, 32,"Lannahechee River"},--BUCK ID 34
    {"P_3_LITTLE_CREEK_RIVER", 0x780F20F9, 2014257401, false, nil,"Little Creek River"},
    {"P_3_LOWER_MONTANA_RIVER", 0xC4270FE7, -1004072985, false, nil,"Lower Montana River"},
    {"P_3_MATTOCK_POND", 0x5D0900C3, 1560871107, true, 35,"Mattock Pond"},--BUCK ID 35
    {"P_3_MONTOS_REST", 0xB6F67FD4, -1225359404, true, 49,"Montos Rest"},--COUGAR ID 49
    {"P_3_MOONSTONE_POND", 0x63F6ACB4, 1677110452, true, 24,"Moonstone Pond"},
    {"P_3_MOUNT_HAGEN", 0x6BA71EFC, 1806114556, false, nil,"Mount Hagen"},
    {"P_3_OCREAGHS_RUN", 0x2BD2B4E6, 735229158, true, 28,"Ocreagh's Run"},--BEAR ID 28
    {"P_3_OWANJILA", 0x5DCD45F1, 1573733873, true, 5,"Owanjila"},--BEAVER ID 5
    {"P_3_ROANOKE_VALLEY", 0x58DB6580, 1490773376, true, 16,"Roanoke Valley"},--COYOTE ID 16
    {"P_3_SAN_LUIS_RIVER", 0x678A6057, 1737121879, false, nil,"San Luis River"},
    {"P_3_SEA_OF_CORONADO", 0xE29827A8, -493344856, false, nil,"Sea of Coronado"},
    {"P_3_SOUTHFIELD_FLATS", 0xE78CB65F, -410208673, true, 44,"Southfield Flats"},--FOX ID 44
    {"P_3_SPIDER_GORGE", 0x649E4CEF, 1688095983, true, 14,"Spider Gorge"},--COUGAR ID 14
    {"P_3_STILLWATER_CREEK", 0xBD5364C5, -1118608187, false, nil,"Stillwater Creek"},
    {"P_3_UPPER_MONTANA_RIVER", 0x4E98B0E9, 1318629609, false, nil,"Upper Montana River"},
    {"P_3_WHINYARD_STRAIT", 0x9640BA83, -1774142845, false, nil,"Whinyard Strait"},
    {"P_4_AGUASDULCES", 0xB32BD1BD, -1288973891, false, nil,"Afuasdulces"}, -- GUARMA
    {"P_4_ARMADILLO", 0xE6EAEFF7, -420810761, false, nil,"Armadillo"},
    {"P_4_ARROYO_DE_LA_VIBORA", 0xCD5CE9A2, -849548894, false, nil,"Arroyo De La Vibora"}, -- GUARMA
    {"P_4_BACCHUS_BRIDGE", 0x0C52C6A8, 206751400, false, nil,"Bacchus Bridge"},
    {"P_4_BACCHUS_STATION", 0xCBF9C0AF, -872824657, true, 36,"Bacchus Station"},--BUCK ID 36
    {"P_4_BARDS_CROSSING", 0x9CFF54C5, -1660988219, false, nil,"Bards Crossing"},
    {"P_4_BEARTOOTH_BECK", 0xB76E9142, -1217490622, false, nil,"Beartooth Beck"},
    {"P_4_BENEDICT_PASS", 0x57DBD9B8, 1474025912, true, 33,"Benedict Pass"},--BUCK ID 33
    {"P_4_BENEDICT_POINT", 0xD3920730, -745404624, false, nil,"Benedict Point"},
    {"P_4_BLACKWATER", 0xC87D8B8A, -931296374, false, nil,"Blackwater"},
    {"P_4_BOLGER_GLADE", 0xFBFEE55C, -67181220, true, 20,"Bolger Glade"},--PANTHER ID 20
    {"P_4_BRAITHWAITE_MANOR", 0xF60E3AED, -166839571, false, nil,"Braithwaite Manor"},
    {"P_4_CALIBANS_SEAT", 0x222E5CED, 573463789, true, 48,"Caligans Seat"},--MOOSE ID 48
    {"P_4_CALIGA_HALL", 0x7C43315A, 2084778330, false, nil,"Caliga Hall"},
    {"P_4_CALUMET_RAVINE", 0x192F0A3E, 422513214, true, 13,"Calumet Ravine"},--COUGAR ID 13
    {"P_4_CINCO_TORRES", 0x871DB74E, -2028095666, false, nil,"Cinco Torres"},--GUARMA
    {"P_4_CITADEL_ROCK", 0xAF900BFB, -1349514245, false, nil,"Citadel Rock"},
    {"P_4_COTORRA_SPRINGS", 0xC69E4B94, -962704492, true, 45,"Cotorra Springs"},--FOX ID 45
    {"P_4_CUMBERLAND_FALLS", 0xE325C1F3, -484064781, false, nil,"Cumberland Falls"},
    {"P_4_DIABLO_RIDGE", 0x3DB72923, 1035413795, false, nil,"Diablo Ridge"},
    {"P_4_DONNER_FALLS", 0x7500A60F, 1962976783, true, 41,"Donner Falls"},--ELK ID 41
    {"P_4_EMERALD_RANCH", 0x14DE5EA9, 350117545, false, nil,"Emerald Ranch"},
    {"P_4_FLATNECK_STATION", 0xCD806933, -847222477, false, nil,"Flatneck Station"},
    {"P_4_FORT_MERCER", 0xC22A2C44, -1037423548, false, nil,"Fort Mercer"},
    {"P_4_FORT_WALLACE", 0xFA0BEEA7, -99881305, false, nil,"Fort Wallace"},
    {"P_4_GRANITE_PASS", 0xBD8B165E, -1114958242, false, nil,"Granite pass"},
    {"P_4_HAWKS_EYE_CREEK", 0xD5457035, -716869579, false, nil,"Hawks Eye Creek"},
    {"P_4_JORGES_GAP", 0x785538B2, 2018850994, false, nil,"Jorges Gap"},
    {"P_4_LA_CAPILLA", 0x3FFC8A8F, 1073515151, false, nil,"La Capilla"},--GUARMA
    {"P_4_LAGRAS", 0x3552B0DE, 894611678, true, 3,"Lagras"},--ALLIGATOR ID 3
    {"P_4_LAKE_ISABELLA", 0x31941238, 831787576, true, 39,"Lake Isabella"},--BISON ID 39
    {"P_4_MACFARLANES_RANCH", 0xA4A17FBD, -1532919875, false, nil,"Macfarlanes Ranch"},
    {"P_4_MANTECA_FALLS", 0xB84137A2, -1203685470, false, nil,"Manteca Falls"},
    {"P_4_MANZANITA_POST", 0x2279EE5F, 578416223, false, nil,"Manzanita Post"},
    {"P_4_MERCER_STATION", 0xF6AD913C, -156397252, false, nil,"Mercer Station"},
    {"P_4_MOUNT_SHANN", 0x20B2D466, 548590694, true, 30,"Mount Shann"},--RAM ID 30
    {"P_4_OWANJILA_DAM", 0xAB5763FF, -1420336129, false, nil,"Owanjila Dam"},
    {"P_4_PLAINVIEW", 0x109B730C, 278622988, false, nil,"Plainview"},
    {"P_4_QUAKERS_COVE", 0x2AF9F7C1, 721024961, true, 21,"Quakers Cove"},--PANTHER ID 21
    {"P_4_RATHSKELLER_FORK", 0xCC796CBD, -864457539, false, nil,"Rathskeller Fork"},
    {"P_4_RHODES", 0x4DD509F6, 1305807350, false, nil,"Rhodes"},
    {"P_4_RIGGS_STATION", 0x2DDEDE9F, 769580703, false, nil,"Riggs Station"},
    {"P_4_RINGNECK_CREEK", 0x695D3BFE, 1767717886, true, 54,"Ringneck Creek"},--BOAR ID 54
    {"P_4_RIO_DEL_LOBO_ROCK", 0x6EE4B99E, 1860483486, true, 17,"Rio Del Lobo Rock"},--COYOTE ID 17
    {"P_4_SAINT_DENIS", 0x009BA3DC, 10200028, false, nil,"Saint Denis"},
    {"P_4_SISIKA_PENITENTIARY", 0x41F983C2, 1106871234, false, nil,"Sisika Penitentiary"},
    {"P_4_TEMPEST_RIM", 0x867F0549, -2038495927, true, 25,"Tempest Rim"},--BEAR ID 25
    {"P_4_THIEVES_LANDING", 0x35DCE61E, 903669278, false, nil,"Thieves Landing"},
    {"P_4_THREE_SISTERS", 0x8D2C1E7E, -1926488450, true, 29,"Three Sisters"},--RAM ID 29
    {"P_4_TUMBLEWEED", 0x85D4C0D0, -2049654576, false, nil,"Tumbleweed"},
    {"P_4_TWIN_ROCKS", 0x89764F23, -1988735197, true, 61,"Twins Rocks"},--COYOTE ID 61
    {"P_4_TWIN_STACK_PASS", 0x3BD66C97, 1003908247, false, nil,"Twin Stack Pass"},
    {"P_4_VALENTINE", 0x960B8448, -1777630136, false, nil,"Valentine"},
    {"P_4_VAN_HORN_TRADING_POST", 0x9E9E3406, -1633799162, false, nil,"Van Horn Trading Post"},
    {"P_4_WALLACE_STATION", 0x56A56E44, 1453682244, false, nil,"Wallace Station"},
    {"N", 0x4A4C3F63, 1246510947, false, nil,"Window Rock"},
    {"P_5_BRANDYWINE_DROP", 0x40B8C6F2, 1085851378, true, 46,"Brandywine Drop"},--MOOSE ID 46
    {"P_5_EMERALD_STATION", 0xB69452F7, -1231793417, false, nil,"Emerald Station"},
    {"P_5_STRAWBERRY", 0xEB56F48B, -346622837, false, nil,"Strawberry"},
    {"P_5_WAPITI_INDIAN_RESERVATION", 0xD423D45C, -735849380, false, nil,"Wapiti Indian Reservation"},
    {"P_6_ANNESBURG", 0x88B34053, -2001518509, false, nil,"Annesburg"},
}

Config.Districts2 = {
    {"BayouNwa", 0x78BFE1AC, 2025841068, false, nil, "Bayou Nwa"},
    {"bigvalley", 0x3108C492, 822658194, true, 31, "Big Valley"},--RAM ID 31
    {"BluewaterMarsh", 0x4DFA0B50, 1308232528, true, 2, "Bluewater Marsh"},--ALLIGATOR 2
    {"ChollaSprings", 0xF9831C72, -108848014, false, nil, "Cholla Springs"},
    {"Cumberland", 0x6D67801E, 1835499550, false, nil, "Cumberland"},
    {"DiezCoronas", 0x19700C95, 426773653, false, nil, "Diez Coronas"},
    {"GaptoothRidge", 0x84D7AD0E, -2066240242, true, 32, "Gaptooth Ridge"},--RAM ID 32
    {"greatPlains", 0x1C68EA97, 476637847, true, 38, "Great Plains"},--BISON ID 38
    {"GrizzliesEast", 0xF8D68DC1, -120156735, true, 42, "Grizzlies East"},--ELK ID 42
    {"GrizzliesWest", 0x62162401, 1645618177, false, nil, " Grizzlies West"},
    {"GuarmaD", 0xE1736CD7, -512529193, false, nil, "Guarma"},
    {"Heartlands", 0x07D4FF5F, 131399519, true, 43, "Heartlands"},--FOX ID 43
    {"HennigansStead", 0x35390B10, 892930832, true, 15, "Hennigan's Stead"},--COUGAR ID 15
    {"Perdido", 0xB1531168, -1319956120, false, nil, "Perdido"},
    {"PuntaOrgullo", 0x56A7C746, 1453836102, false, nil, "Punta Orgullo"},
    {"RioBravo", 0x8016C23F, -2145992129, false, nil, "Rio Bravo"},
    {"roanoke", 0x0AA5F25D, 178647645, true, 6, "Roanoke"}, --BEAVER ID 6
    {"scarlettMeadows", 0xCC7C3314, -864275692, true, 10, "Scarlett Meadows"},--BOAR ID 10
    {"TallTrees", 0x6467EF09, 1684533001, true, 27, "Tall Trees"},--BEAD ID 27
}