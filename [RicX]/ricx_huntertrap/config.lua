Config = {}
Config.framework = "redemrp-reboot"--"redemrp" or "vorp" or "qbr" or "qbr2" or "redemrp-reboot" or "rsg"
Config.RefreshRate = 0
Config.InteractDistance = 0.7 --Interaction distance with placed trap
Config.InteractDistanceTrapper = 1.0 --Interaction distance with placed trappers
Config.ViewDistance = 50.0 -- view distance for placed trap
Config.ViewDistancePed = 20.0 -- view distance for trapper ped
Config.DistanceBetweenTraps = 5.0 --place distance between traps
Config.CDBetweenPlayerHunts = 15 -- minutes cooldown for player to hunt again once animal spawned successfully
Config.CDForAreaHunt = 30 --minutes cooldown for area after animal spawned successfully

Config.GuideExtraSymbol = "|"

Config.PlayerMissionCD = {
    enable = false,
    time = 15,--minutes
}

Config.ResetMissions = {--if enabled, players must finish all the Missions at Trappers then reset those to play any finished again 
    enable = false,
    reset_price = 500,
    reset_command = "reset_trapper",
    command_timer = 30,--seconds
}

Config.CDGlobalHunt = {
    enable = false, --If enabled, then only 1 hunt is allowed on the server in every configured minutes at "cd"
    cd = 30,--minutes cooldown to start hunting with trap globally
} 

Config.OwnedTrapsBlipsCommand = "beartraps"
Config.TrapBlips = {
    sprite = 960467426,
}

Config.EagleEyeTrackingTrap = true -- on true, using Eagle Eye will show effect on traps

Config.DefaultAnimalHealth = 200 -- for Config.Animals in config_base_hunt.lua, or define custom health in that file's array for any animal as example #1

Config.AnimalSpawnTimer = 50 --seconds to wait to spawn animal after area, time and bait is correct and hunt started at placed trap
Config.AnimalSpawnDistance = 100.0 -- player must stay in radius of trap to be able spawn hunted animal
Config.AnimalDespawnDistance = 200.0 -- spawned animal will despawn if distance is too high

Config.ShowNotifWhenNoAnimalAtHuntStart = true
Config.ShowAvailableAnimalAtTrapPrompt = true

Config.BuySellCD = 3 --seconds

Config.DefaultEarnXPForAnimalSpawn = 5 --add custom xp earnings to different animals in config_base_hunt.lua Config.Animals array as #1 example

Config.RandomSales = {
    --configure different random sales
    default_sale = {sell = 1.0, buy = 1.0, guide = 1.0},
    timer = 60, --minutes
    sell_sale = {
        enable = true,
        sale_amount = {min = 850, max = 1200, multiplier = 0.001}, --(random value * multiplier) * price
    },
    buy_sale = {
        enable = true,
        sale_amount = {min = 850, max = 1500, multiplier = 0.001}, --(random value * multiplier) * price
    },
    guide_sale = {
        enable = true,
        sale_amount = {min = 850, max = 1500, multiplier = 0.001}, --(random value * multiplier) * price
    },
}

Config.Interaction = {--placed trap interactions
    bait_add_only_owner = true,
    bait_remove_only_owner = true,
    add_oil_only_owner = true,
    hunt_start_only_owner = true,
}

Config.Menus = {
    type = "custom", -- "custom" for the made html UI, or "menubase" for redemrp_menu_base (and clones)
    menubase = {
        --in events.lua can be changed for menubase resource api handler
        position = "top-right",
    },
    sell_all = true, --if true, all selected item type will be sold at trapper instead 1
}

Config.MaxTrapsPerPlayer = 2

Config.TrapIdentifiers = {--extra limit for placed traps for configured identifiers
    ["steam:01"] = 2,
}

Config.HunterTrap = {
    id = "ricx_beartrap",
    label = "Hunter Trap",
    job = {"hunter", "job2"},
    condition_loss = {
        starting_hunt = 25,
        adding_bait = 2,
        remove_bait = 1,
    },
    max_condition_loss = {
        using_oil = 0.01,
        adding_bait = 0.01,
        remove_bait = 0.01,
    },
    fix_item = {id = "trapoil", label = "Trap Oil", amount = 1, condition_add = 25, remove = true},
    hold_attach = {
        bone = "skel_r_hand",
        pos = vector3(0.1, -0.05, 0.0),
        rotate = vector3(0.0, -9.0, 0.0),
    },
}

--custom blip settings can be configured for each animal in config_base_hunt.lua Config.Animals array as example #1
Config.AnimalBlip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`}

Config.GuideBook = {
    id = "ricx_leg_animal_guide",
    label = "Legendary Animal Guides",
    command = {
        enable = true,
        cmd = "animal_guide",
    },
}

Config.DefaultBaitData = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/inventory_items/consumable_predator_bait.png"}} --img used for "custom" type Menu
Config.ExtraBaitData = {--Configure baits in config_base_hunt.lua file's Config.Baits array
    --img used for "custom" type Menu
    mutton = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    pork = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    bird = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    beef = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    woodlog = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    corn = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    wheat = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    venison = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    stringy = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    game = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    herptile = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
    biggame = {model = `s_wrappedmutton01x`, img = {size = "2.0", url = ""}, required_xp = 0},
}

Config.MissionTrack = {
    blip_style = `BLIP_MODIFIER_AREA_PULSE`,
    blip_radius = 70.0,
    track_interact_distance = 2.0,
    spawn_distance = 40.0,
    fail_distance_after_spawn = 200.0,
    finished_mission_reward_multiplier = {
        items = true, --checking adding reward items if mission was already finished
        money = 0.25,
        xp = 0.3,
    },
    fail_mission_at_player_death = true,
}

Config.DisableKeysWhileBusy = { --disabling control keys while placing, in menus
    --add here control keys to disable
    0xD9D0E1C0,
    0xCEFD9220,
    0x4CC0E2FE,
    0xC1989F95,
}

Config.Prompts = {
    PromptShop = 0x05CA7C52,
    PromptPlace = 0xC7B5340A,
    PromptRotate = 0x62800C92,
    PromptRotate2 = 0x8BDE7443,
    PromptAway = 0x156F7119,
    PromptTake = 0x156F7119,
    PromptBait = 0x05CA7C52,
    PromptHunt = 0xC7B5340A,
    PromptOil = 0x80F28E95,
    PromptGuide = 0x760A9C6F,
    PromptMission = 0xC7B5340A,
    PromptTrack = 0xC7B5340A,
}

Config.Marker = {
    rgba = {126, 0, 0, 100},
    size = {1.0, 1.0, 0.3},
    enable = true,
}

Config.Texts = {
    PromptShop = "Open Shop",
    PromptGuide = "Buy Guide",
    PromptRotate = "Rotate +",
    PromptRotate2 = "Rotate -",
    PromptPlace = "Place Trap",
    PromptAway = "Put away",
    PromptTake = "Take Trap",
    PromptBait = "Add Bait",
    PromptBait2 = "Remove Bait",
    PromptHunt = "Start Hunt",
    PromptOil = "Use Oil",
    PromptMission = "Check Missions",
    PromptTrack = "Search track",
    --TEXTS
    HuntingTrap = "Hunting Trap",
    SelectBait = "Select Bait",
    Baits = "Baits",
    NoAnimal = "No animal",
    BuyGear = "Buy Gear",
    XP = "XP",
    Options = "Options",
    SellProduct = "Sell Product",
    AvailableGuides = "Available Guides",
    FavBait = "Bait",
    Time = "Time",
    TrapperMissions = "Trapper Missions",
    AvailableMissions = "Available Missions",
    AnimalTrack = "Animal Track",
    SelectMission = "Select Mission",
    Sell = "Sell",
    Buy = "Buy",
    --Notifications
    NoPlace = "Place somewhere else!",
    GoCloser = "Go closer to place!",
    NoAnimalNotif = "No Animal found!",
    WaitAnimal = "Wait for the animal to appear!",
    CantSpawn = "Cant spawn animal!",
    WrongTime = "Come back in different hours!",
    AnimalSpawn = "Animal appeared, look around!",
    IncorrectBait = "Incorrect bait used, try different!",
    NoAnimalNotif2 = "No animal can be found in this area!",
    NoJob = "You dont have the required job!",
    LimitReached = "Limit reached, cant place more!",
    InHand = "A trap is in your hand already!",
    NoTrap = "You dont have any trap!",
    Placed = "Placed trap!",
    CantDo = "Cant do that now, try later!",
    NoXP1 = "Not enough XP! %s/%s",
    NoMoney = "You dont have enough money!",
    Purchased = "Purchased gear! +%s %s",
    NoItem = "You dont have that product!",
    Sold = "Sold products for $%s! -%s %s ",
    CantAdd = "Cant add items, check inventory!",
    RemoveBait = "Remove bait first!",
    TrapPicked = "Trap picked up!",
    TrapBroke = "Trap is broken, its destroyed now",
    BaitAdd = "Bait added to trap!",
    NoBait = "You dont have that bait!",
    InvalidItem = "Invalid item!",
    BaitAdded = "Bait is already added!",
    ConditionBad = "Condition is bad, fix or destroy trap!",
    BaitRemove = "Bait removed from trap!",
    CantRemove = "Cant remove, there is an ongoing hunt with trap!",
    NoBait2 = "No bait in trap!",
    OilAdded = "Oil added to trap, condition is better now!",
    NoOil = "Not enough oil to fix! %s/%s",
    CantFix = "Cant fix anymore, take it to destroy!",
    OnHunt = "Someone else is hunting with trap already!",
    OnHunt2 = "You are already hunting!",
    CantHunt = "Cant hunt here now, try later!",
    CantHunt2 = "You have to wait before hunting again!",
    NeedXP = "You need more xp to hunt animal here! %s/%s XP",
    NewSale = "New sale on shop, open again!",
    NotOwned = "That is not your trap!",
    NoGuide = "No available guide!",
    BoughtGuide = "Guide purchased! %s",
    InMission = "You are already in a mission!",
    MissionStart = "Go to the area and track down the animal!",
    MissionFinish = "Mission finished, animal has been hunted down!",
    MissionCant = "Cant start mission, something wrong!",
    TrackFound = "Found a track, look for the next one!",
    TrackLast = "Found last track, look for the animal!",
    AnimalSpawn = "Found the animal, hunt it down!",
    MissionFail = "Mission failed!",
    NeedTrap = "You need a trap nearby with %s bait to lure animal!",
    NoHunt = "Hunting is not possible, try later!",
    NoTrap2 = "No traps placed!",
    MissionCD = "Wait some time before doing missions again!",
    NotNext = "Mission is not the next one! Select the new one!",
    CanReset = "All mission finished, use //%s command to reset progress!",
    MissionCD2 = "Mission is on cooldown, try later!",
    MissionReset = "Missions reset finished!",
    --webhook
    W_Source = "Source",
    W_ID = "Identifiers",
    W_Coords = "Coords",
    W_DBID = "DB ID",
    W_Bait = "Bait ID",
    W_Condition = "Condition",
    W_Area = "Area ID",
    W_Animal = "Animal ID",
    W_HuntID = "Hunt ID",
    W_EXP = "Earned XP",
    W_EntityID = "Entity Network ID",
    W_Item = "Item",
    W_Price = "Price",
    W_Amount = "Amount",
    W_Guide = "Guide ID",
    W_GuideName = "Guide Name",
    W_Trapper = "Trapper ID",
    W_Mission = "Mission ID",
    W_Money = "Reward Money",
    W_Items = "Items",
    W_Name = "Player Name",
}

Config.Textures = {
    cross = {"scoretimer_textures", "scoretimer_generic_cross"},
    locked = {"menu_textures","stamp_locked_rank"},
    tick = {"scoretimer_textures","scoretimer_generic_tick"},
    money = {"inventory_items", "money_moneystack"},
    alert = {"menu_textures", "menu_icon_alert"},
}

Config.WaitAfterAnimForUpdate = 1 -- seconds to wait after anim triggered for interaction on trap
Config.InteractAnims = {
    start_hunt = {"amb_work@prop_human_wood_chop@logdrop2@male_a@trans", "logdrop2_trans_pickuprside2_08_09_11_a", 3},
    use_oil = {"amb_work@prop_human_wood_chop@logdrop2@male_a@trans", "logdrop2_trans_pickuprside2_08_09_11_a", 3},
    remove_bait = {"amb_work@prop_human_wood_chop@logdrop2@male_a@trans", "logdrop2_trans_pickuprside2_08_09_11_a", 3},
    add_bait = {"amb_work@prop_human_wood_chop@logdrop2@male_a@trans", "logdrop2_trans_pickuprside2_08_09_11_a", 3},
    take_trap = {"amb_work@prop_human_wood_chop@logdrop2@male_a@trans", "logdrop2_trans_pickuprside2_08_09_11_a", 3},
}

Config.TimeFormat = {
    [1] = "1 AM",
    [2] = "2 AM",
    [3] = "3 AM",
    [4] = "4 AM",
    [5] = "5 AM",
    [6] = "6 AM",
    [7] = "7 AM",
    [8] = "8 AM",
    [9] = "9 AM",
    [10] = "10 AM",
    [11] = "11 AM",
    [12] = "12 PM",
    [13] = "1 PM",
    [14] = "2 PM",
    [15] = "3 PM",
    [16] = "4 PM",
    [17] = "5 PM",
    [18] = "6 PM",
    [19] = "7 PM",
    [20] = "8 PM",
    [21] = "9 PM",
    [22] = "10 PM",
    [23] = "11 PM",
    [0] = "12 PM",
}

Config.Predators = {
    [`mp_a_c_bear_01`] = true,
    [`mp_a_c_wolf_01`] = true,
    [`mp_a_c_panther_01`] = true,
    [`mp_a_c_cougar_01`] = true,
    [`mp_a_c_alligator_01`] = true,
    [`a_c_alligator_01`] = true,
    [`a_c_alligator_02`] = true,
    [`a_c_alligator_03`] = true,
    [`a_c_snake_01`] = true,
    [`a_c_snakeredboa10ft_01`] = true,
    [`a_c_cougar_01`] = true,
    [`A_C_Wolf`] = true,
    [`a_c_wolf_medium`] = true,
    [`a_c_wolf_small`] = true,
    [`a_c_bear_01`] = true,
    [`a_c_panther_01`] = true,    
}

Config.DisableTrappers = false

Config.Trapper = {
    --Configure any Trapper as example #1 and #2 show
    [1] = {
        model = `u_m_m_sdtrapper_01`,
        coords = vector4(1251.39, 1156.23, 150.2, 306.22),
        name = "Trapper",
        blip = {enable = true, sprite = -1031152097, style = `BLIP_STYLE_ADVERSARY`},
        job = {"hunter", "job2"},
        xp_requirement = 0,
        guide_price = 150,
        --Missions
        missions = {
            {
                name = "#1: Tutorial Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a gator, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Teca Alligator", model = `mp_a_c_alligator_01`, preset = 0},
                health = 200,
                tracks = {--Can be configured array for random selection or as single vector3 position for any track
                    {--Track #1 - random position will be selected in array
                        vector3(1313.528, 1150.769, 155.602), 
                        vector3(1322.96, 1132.26, 155.74)
                    },
                    vector3(1297.893, 1164.228, 149.775), --Track #2
                    vector3(1280.596, 1210.813, 148.454), --Track #3

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(1236.607, 1198.008, 148.577, 181.567), vector4(1248.873, 1182.738, 147.176, 0.245)}, -- Multiple positions for spawn can be configured
                custom_ai_id = "mission_1_1", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_cs_rabbitmeat01x`,
                trap_requirement = {enable = true, bait = "bird", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
                cooldown = 30,--minutes, if cooldown configured, only 1 player can do the mission at the same time
            },
            {
                name = "#2: Moose Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a Moose, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Snowflake Moose", model = `mp_a_c_moose_01`, preset = 1},
                health = 200,
                tracks = {
                    vector3(2515.34, 2118.32, 169.01),
                    vector3(2574.07, 2129.66, 168.19),
                    vector3(2595.43, 2108.13, 170.82),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(2659.628, 2093.513, 169.059, 259.291), vector4(2692.862, 2129.560, 166.414, 0.280)},
                custom_ai_id = "mission_1_2", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_moosetuftsfur01x`,
                trap_requirement = {enable = false, bait = "corn", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
            {
                name = "#3: Wolf Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a Wolf, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Wolf", model = `A_C_Wolf`, preset = 3},
                health = 200,
                tracks = {
                    vector3(764.3, 1939.9, 244.58),
                    vector3(792.47, 1933.11, 253.81),
                    vector3(829.66, 1972.06, 273.83),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(833.647, 1902.207, 273.699, 359.843), vector4(885.094, 1918.355, 291.980, 293.777)},
                custom_ai_id = "mission_1_3", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_wolfpoop01x`,
                trap_requirement = {enable = false, bait = "mutton", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
            {
                name = "#4: Bear Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a Bear, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Bear", model = `mp_a_c_bear_01`, preset = 0},
                health = 200,
                tracks = {
                    vector3(1448.28, 1533.77, 159.87),
                    vector3(1409.48, 1574.28, 175.61),
                    vector3(1438.15, 1633.76, 187.08),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(1340.858, 1684.907, 218.189, 73.02), vector4(1337.181, 1651.034, 217.629, 0.1215)},
                custom_ai_id = "mission_1_4", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `mp007_p_nat_beartuftsfur01x`,
                trap_requirement = {enable = false, bait = "pork", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
            {
                name = "#5: Cougar Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a Cougar, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Cougar", model = `mp_a_c_cougar_01`, preset = 0},
                health = 200,
                tracks = {
                    vector3(1423.65, 821.62, 102.23),
                    vector3(1505.44, 850.65, 104.52),
                    vector3(1546.28, 834.9, 124.3),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(1559.725, 903.870, 148.439, 21.68), vector4(1517.065, 928.824, 153.105, 88.338)},
                custom_ai_id = "mission_1_5", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_cougarkillremains01x`,
                trap_requirement = {enable = true, bait = "venison", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
            {
                name = "#6: Panther Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a Panther, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Panther", model = `mp_a_c_panther_01`, preset = 0},
                health = 200,
                tracks = {
                    vector3(2130.69, 1393.71, 145.51),
                    vector3(2146.87, 1355.99, 117.01),
                    vector3(2189.65, 1321.87, 110.67),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(2236.616, 1398.402, 86.640, 262.11), vector4(2214.629, 1428.885, 84.914, 271.970)},
                custom_ai_id = "mission_1_6", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_cougarscat01x`,
                trap_requirement = {enable = true, bait = "venison", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
        },
        --Shop Buy Items (standard items and weapons)
        buy = {
            {id = "ricx_leg_animal_guide", label = "Legendary Guide Book", price = 200, xp = 0},
            {id = "ricx_beartrap", label = "Hunting Trap", price = 200, xp = 0},
            {id = "trapoil", label = "Trap Oil", price = 10, xp = 0},
            {id = "WEAPON_RIFLE_ELEPHANT", label = "Elephant Rifle", price = 500, xp = 0},
            {id = "WEAPON_RIFLE_SPRINGFIELD", label = "Springfield Rifle", price = 500, xp = 0},
            {id = "WEAPON_RIFLE_BOLTACTION", label = "Bolt Action", price = 500, xp = 0},
            {id = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK", label = "Rolling Block Rifle", price = 800, xp = 0},
            {id = "WEAPON_SNIPERRIFLE_CARCANO", label = "Carcano Rifle", price = 800, xp = 1000},
        },
        --Shop Sell Items (standard items only)
        --category "img" image only for "custom" menu
        sell = {
            {
                name = "Animal Parts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/provision_buck_antlers.png"},
                items = {
                    {id = "legmooseantler", label = "Legendary Moose Antlers", price = 100, xp = 0},
                    {id = "legbisonhorn", label = "Legendary Bison Horns", price = 100, xp = 0},
                    {id = "legramhorn", label = "Legendary Ram Horns", price = 100, xp = 0},
                    {id = "legelkantler", label = "Legendary Elk Antlers", price = 100, xp = 0},
                    {id = "legendbuckantler", label = "Legendary Buck Antlers", price = 100, xp = 0},
                },
            },
            {
                name = "Moose Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_moose.png"},
                items = {
                    {id = "legmooses1", label = "Snowflake Moose pelt", price = 400, xp = 0},
                    {id = "legmooses2", label = "Knight Moose pelt", price = 400, xp = 0},
                    {id = "legmooses3", label = "Rudy Moose pelt", price = 400, xp = 0},
                    {id = "legmooses", label = "Legendary Moose Pelt", price = 300, xp = 0},
                }
            },
            {
                name = "Fox Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_fox.png"},
                items = {
                    {id = "legfoxs1", label = "Ota Fox pelt", price = 250, xp = 0},
                    {id = "legfoxs2", label = "Marble Fox pelt", price = 250, xp = 0},
                    {id = "legfoxs3", label = "Cross Fox pelt", price = 250, xp = 0},
                    {id = "legfoxskin", label = "Legendary Fox pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Elk Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_elk.png"},
                items = {
                    {id = "legelks1", label = "Katata Elk pelt", price = 300, xp = 0},
                    {id = "legelks2", label = "Ozuya Elk pelt", price = 300, xp = 0},
                    {id = "legelks3", label = "Inahme Elk pelt", price = 300, xp = 0},
                    {id = "legelks", label = "Legendary Elk pelt", price = 250, xp = 0},
                }
            },
            {
                name = "Bison Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_buffalo_white.png"},
                items = {
                    {id = "legbisons1", label = "Tatanka Bison pelt", price = 300, xp = 0},
                    {id = "legbisons2", label = "Winyan Bison pelt", price = 300, xp = 0},
                    {id = "legbisons3", label = "Payata Bison pelt", price = 300, xp = 0},
                    {id = "legbisonstak", label = "Takanta Bison pelt", price = 300, xp = 0},
                    {id = "legbisons", label = "Legendary Bison pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Buck Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_buck.png"},
                items = {
                    {id = "legbucks1", label = "Legendary Buck pelt", price = 200, xp = 0},
                    {id = "legbucks2", label = "Mudrunner Buck pelt", price = 300, xp = 0},
                    {id = "legbucks3", label = "Snow Buck pelt", price = 300, xp = 0},
                    {id = "legbucks4", label = "Shadow Buck pelt", price = 300, xp = 0},
                    {id = "legbucks", label = "Legendary Buck pelt 2", price = 200, xp = 0},
                }
            },
            {
                name = "Ram Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_bighornram.png"},
                items = {
                    {id = "legrams1", label = "Gabbro Horn Ram pelt", price = 350, xp = 0},
                    {id = "legrams2", label = "Chalk Horn Ram pelt", price = 350, xp = 0},
                    {id = "legrams3", label = "Rutile Horn Ram pelt", price = 350, xp = 0},
                    {id = "legrams4", label = "GreatHorn Ram pelt", price = 350, xp = 0},
                    {id = "legrams", label = "Legendary Ram pelt", price = 250, xp = 0},
                }
            },
            {
                name = "Bear Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_bear.png"},
                items = {
                    {id = "legbears1", label = "Deadly Bear pelt", price = 450, xp = 0},
                    {id = "legbears2", label = "Owiza Bear pelt", price = 450, xp = 0},
                    {id = "legbears3", label = "Ridgeback Spirit Bear pelt", price = 450, xp = 0},
                    {id = "legbears4", label = "Golden Spirit Bear pelt", price = 450, xp = 0},
                    {id = "leggbears", label = "Legendary Bear pelt", price = 350, xp = 0},
                }
            },
            {
                name = "Wolf Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_wolf.png"},
                items = {
                    {id = "legwolfs1", label = "Emerald Wolf pelt", price = 400, xp = 0},
                    {id = "legwolfs2", label = "Onyx Wolf pelt", price = 400, xp = 0},
                    {id = "legwolfs3", label = "Moonstone Wolf pelt", price = 400, xp = 0},
                    {id = "legwolfpelt", label = "Legendary Wolf pelt", price = 300, xp = 0},
                }
            },
            {
                name = "Panther Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_panther.png"},
                items = {
                    {id = "legpanthers1", label = "Nightwalker Panther pelt", price = 450, xp = 0},
                    {id = "legpanthers2", label = "Ghost Panther pelt", price = 450, xp = 0},
                    {id = "legpanthers3", label = "Iwakta Panther pelt", price = 450, xp = 0},
                }
            },
            {
                name = "Coyote Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_coyote.png"},
                items = {
                    {id = "legcoyotes1", label = "Red Streak Coyote pelt", price = 250, xp = 0},
                    {id = "legcoyotes2", label = "Midnight Paw Coyote pelt", price = 250, xp = 0},
                    {id = "legcoyotes3", label = "Milk Coyote pelt", price = 250, xp = 0},
                    {id = "legcoyotes", label = "Legendary Coyote pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Cougar Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_cougar_giaguaro.png"},
                items = {
                    {id = "legcougars", label = "Legendary Cougar pelt", price = 400, xp = 0},
                    {id = "legcougars1", label = "Iguga Cougar pelt", price = 400, xp = 0},
                    {id = "legcougars2", label = "Maza Cougar pelt", price = 400, xp = 0},
                    {id = "legcougars3", label = "Sapa Cougar pelt", price = 400, xp = 0},
                    {id = "legcougars4", label = "Black Cougar pelt", price = 400, xp = 0},
                }
            },
            {
                name = "Boar Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_boar.png"},
                items = {
                    {id = "legboars1", label = "Cogi Boar pelt", price = 250, xp = 0},
                    {id = "legboars2", label = "Wakpa Boar pelt", price = 250, xp = 0},
                    {id = "legboars3", label = "Icahi Boar pelt", price = 250, xp = 0},
                    {id = "legboars4", label = "Wildhog pelt", price = 250, xp = 0},
                    {id = "legboars", label = "Legendary Boar pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Beaver Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_beaver.png"},
                items = {
                    {id = "legbeavers1", label = "Grey Beaver pelt", price = 250, xp = 0},
                    {id = "legbeavers2", label = "White Beaver pelt", price = 250, xp = 0},
                    {id = "legbeavers3", label = "Black Beaver pelt", price = 250, xp = 0},
                    {id = "legbeawers", label = "Legendary Beaver pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Alligator Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_alligator_big.png"},
                items = {
                    {id = "legaligators1", label = "Teca Alligator pelt", price = 400, xp = 0},
                    {id = "legaligators2", label = "Sun Alligator pelt", price = 400, xp = 0},
                    {id = "legaligators3", label = "Banded Alligator pelt", price = 400, xp = 0},
                    {id = "legaligators", label = "Legendary Alligator pelt", price = 400, xp = 0},
                }
            },
            {
                name = "Pronghorn Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_pronghorn.png"},
                items = {
                    {id = "legprongs", label = "Legendary Pronghorn pelt", price = 300, xp = 0},
                }
            },
        },
    },
    [2] = {
        model = `u_m_m_sdtrapper_01`,
        coords = vector4(-772.107, -1345.594, 42.574, 347.881),
        name = "Trapper",
        blip = {enable = true, sprite = -1031152097, style = `BLIP_STYLE_ADVERSARY`},
        job = {"hunter", "job2"},
        xp_requirement = 1000,
        guide_price = 150,
        --Missions
        missions = {
            {
                name = "#1: Beaver Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a Beaver, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Beaver", model = `mp_a_c_beaver_01`, preset = 0},
                health = 200,
                tracks = {
                    {
                        vector3(-1048.77, -875.19, 42.48),
                    },
                    vector3(-991.73, -891.46, 41.93),
                    vector3(-953.88, -915.00, 40.95),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(-901.261, -925.337, 40.770, 229.500), vector4(-878.371, -974.851, 40.570, 282.559)},
                custom_ai_id = "mission_2_1", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_beaverscat01x`,
                trap_requirement = {enable = true, bait = "woodlog", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
            {
                name = "#2: Boar Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a Boar, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Boar", model = `mp_a_c_boar_01`, preset = 0},
                health = 200,
                tracks = {
                    {
                        vector3(-1601.41, -1013.10, 69.10),
                    },
                    vector3(-1583.79, -959.47, 84.18),
                    vector3(-1615.16, -909.71, 91.17),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(-1693.762, -871.912, 97.803, 57.898), vector4(-1748.112, -920.499, 100.678, 186.991)},
                custom_ai_id = "mission_2_2", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_boarscat01x`,
                trap_requirement = {enable = false, bait = "corn", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
            {
                name = "#3: Buck Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a Buck, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Buck", model = `mp_a_c_buck_01`, preset = 0},
                health = 200,
                tracks = {
                    {
                        vector3(-1050.95, -1027.65, 62.4),
                    },
                    vector3(-1090.94, -980.22, 65.40),
                    vector3(-1179.40, -1005.06, 63.98),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(-1306.114, -955.252, 62.856, 57.229), vector4(-1236.856, -939.449, 67.700, 93.74)},
                custom_ai_id = "mission_2_3", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_buckscat01x`,
                trap_requirement = {enable = false, bait = "wheat", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
            {
                name = "#4: Bison Hunt",
                xp_requirement = 0,
                description = "Found some tracks of a Bison, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Bison", model = `mp_a_c_buffalo_01`, preset = 0},
                health = 200,
                tracks = {
                    {
                        vector3(-1265.28, -1489.05, 78.77),
                    },
                    vector3(-1357.96, -1472.43, 87.37),
                    vector3(-1354.45, -1589.07, 82.11),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(-1369.436, -1755.338, 84.401, 209.824), vector4(-1233.173, -1781.089, 63.763, 245.694)},
                custom_ai_id = "mission_2_4", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_bisonscat01x`,
                trap_requirement = {enable = false, bait = "wheat", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
            {
                name = "#5: Elk Hunt",
                xp_requirement = 0,
                description = "Found some tracks of an Elk, check and hunt it down!",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/ui_textures_mp/images/toasts_mp_generic/toast_mp_animal.png"},--only for "custom" menu
                animal = {name = "Legendary Elk", model = `mp_a_c_elk_01`, preset = 0},
                health = 200,
                tracks = {
                    {
                        vector3(-1722.45, -1678.53, 91.05),
                    },
                    vector3(-1787.6, -1681.71, 104.44),
                    vector3(-1836.96, -1635.10, 103.71),

                },
                blip = {enable = true, sprite = -1646261997, modifier = `BLIP_MODIFIER_FLASH_FOREVER`},
                spawn = {vector4(-1927.136, -1477.717, 111.156, 38.81), vector4(-1852.521, -1519.179, 99.724, 260.529)},
                custom_ai_id = "mission_2_5", --custom AI for animal ped can be configured in events.lua CustomAnimalAI function
                track_object = `p_buckscat01x`,
                trap_requirement = {enable = false, bait = "corn", radius = 150.0},
                reward = {
                    money = 200,
                    xp = 10,
                    items = {
                        {id = "bread", label = "Bread", amount = 1, texture = {dict = "inventory_items", name = "consumable_bread_roll", color = "COLOR_WHITE"}},
                    }
                },
            },
        },
        --Shop Buy Items (standard items and weapons)
        buy = {
            {id = "ricx_leg_animal_guide", label = "Legendary Guide Book", price = 200, xp = 0},
            {id = "ricx_beartrap", label = "Hunting Trap", price = 200, xp = 0},
            {id = "trapoil", label = "Trap Oil", price = 10, xp = 0},
            {id = "WEAPON_RIFLE_ELEPHANT", label = "Elephant Rifle", price = 500, xp = 0},
            {id = "WEAPON_RIFLE_SPRINGFIELD", label = "Springfield Rifle", price = 500, xp = 0},
            {id = "WEAPON_RIFLE_BOLTACTION", label = "Bolt Action", price = 500, xp = 0},
            {id = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK", label = "Rolling Block Rifle", price = 800, xp = 0},
            {id = "WEAPON_SNIPERRIFLE_CARCANO", label = "Carcano Rifle", price = 800, xp = 0},
        },
        --Shop Sell Items (standard items only)
        --category image only for "custom ui"
        sell = {
            {
                name = "Animal Parts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/provision_buck_antlers.png"},
                items = {
                    {id = "legmooseantler", label = "Legendary Moose Antlers", price = 100, xp = 0},
                    {id = "legbisonhorn", label = "Legendary Bison Horns", price = 100, xp = 0},
                    {id = "legramhorn", label = "Legendary Ram Horns", price = 100, xp = 0},
                    {id = "legelkantler", label = "Legendary Elk Antlers", price = 100, xp = 0},
                    {id = "legendbuckantler", label = "Legendary Buck Antlers", price = 100, xp = 0},
                },
            },
            {
                name = "Moose Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_moose.png"},
                items = {
                    {id = "legmooses1", label = "Snowflake Moose pelt", price = 400, xp = 0},
                    {id = "legmooses2", label = "Knight Moose pelt", price = 400, xp = 0},
                    {id = "legmooses3", label = "Rudy Moose pelt", price = 400, xp = 0},
                    {id = "legmooses", label = "Legendary Moose Pelt", price = 300, xp = 0},
                }
            },
            {
                name = "Fox Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_fox.png"},
                items = {
                    {id = "legfoxs1", label = "Ota Fox pelt", price = 250, xp = 0},
                    {id = "legfoxs2", label = "Marble Fox pelt", price = 250, xp = 0},
                    {id = "legfoxs3", label = "Cross Fox pelt", price = 250, xp = 0},
                    {id = "legfoxskin", label = "Legendary Fox pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Elk Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_elk.png"},
                items = {
                    {id = "legelks1", label = "Katata Elk pelt", price = 300, xp = 0},
                    {id = "legelks2", label = "Ozuya Elk pelt", price = 300, xp = 0},
                    {id = "legelks3", label = "Inahme Elk pelt", price = 300, xp = 0},
                    {id = "legelks", label = "Legendary Elk pelt", price = 250, xp = 0},
                }
            },
            {
                name = "Bison Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_buffalo_white.png"},
                items = {
                    {id = "legbisons1", label = "Tatanka Bison pelt", price = 300, xp = 0},
                    {id = "legbisons2", label = "Winyan Bison pelt", price = 300, xp = 0},
                    {id = "legbisons3", label = "Payata Bison pelt", price = 300, xp = 0},
                    {id = "legbisonstak", label = "Takanta Bison pelt", price = 300, xp = 0},
                    {id = "legbisons", label = "Legendary Bison pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Buck Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_buck.png"},
                items = {
                    {id = "legbucks1", label = "Legendary Buck pelt", price = 200, xp = 0},
                    {id = "legbucks2", label = "Mudrunner Buck pelt", price = 300, xp = 0},
                    {id = "legbucks3", label = "Snow Buck pelt", price = 300, xp = 0},
                    {id = "legbucks4", label = "Shadow Buck pelt", price = 300, xp = 0},
                    {id = "legbucks", label = "Legendary Buck pelt 2", price = 200, xp = 0},
                }
            },
            {
                name = "Ram Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_bighornram.png"},
                items = {
                    {id = "legrams1", label = "Gabbro Horn Ram pelt", price = 350, xp = 0},
                    {id = "legrams2", label = "Chalk Horn Ram pelt", price = 350, xp = 0},
                    {id = "legrams3", label = "Rutile Horn Ram pelt", price = 350, xp = 0},
                    {id = "legrams4", label = "GreatHorn Ram pelt", price = 350, xp = 0},
                    {id = "legrams", label = "Legendary Ram pelt", price = 250, xp = 0},
                }
            },
            {
                name = "Bear Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_bear.png"},
                items = {
                    {id = "legbears1", label = "Deadly Bear pelt", price = 450, xp = 0},
                    {id = "legbears2", label = "Owiza Bear pelt", price = 450, xp = 0},
                    {id = "legbears3", label = "Ridgeback Spirit Bear pelt", price = 450, xp = 0},
                    {id = "legbears4", label = "Golden Spirit Bear pelt", price = 450, xp = 0},
                    {id = "leggbears", label = "Legendary Bear pelt", price = 350, xp = 0},
                }
            },
            {
                name = "Wolf Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_wolf.png"},
                items = {
                    {id = "legwolfs1", label = "Emerald Wolf pelt", price = 400, xp = 0},
                    {id = "legwolfs2", label = "Onyx Wolf pelt", price = 400, xp = 0},
                    {id = "legwolfs3", label = "Moonstone Wolf pelt", price = 400, xp = 0},
                    {id = "legwolfpelt", label = "Legendary Wolf pelt", price = 300, xp = 0},
                }
            },
            {
                name = "Panther Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_panther.png"},
                items = {
                    {id = "legpanthers1", label = "Nightwalker Panther pelt", price = 450, xp = 0},
                    {id = "legpanthers2", label = "Ghost Panther pelt", price = 450, xp = 0},
                    {id = "legpanthers3", label = "Iwakta Panther pelt", price = 450, xp = 0},
                }
            },
            {
                name = "Coyote Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_coyote.png"},
                items = {
                    {id = "legcoyotes1", label = "Red Streak Coyote pelt", price = 250, xp = 0},
                    {id = "legcoyotes2", label = "Midnight Paw Coyote pelt", price = 250, xp = 0},
                    {id = "legcoyotes3", label = "Milk Coyote pelt", price = 250, xp = 0},
                    {id = "legcoyotes", label = "Legendary Coyote pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Cougar Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_cougar_giaguaro.png"},
                items = {
                    {id = "legcougars", label = "Legendary Cougar pelt", price = 400, xp = 0},
                    {id = "legcougars1", label = "Iguga Cougar pelt", price = 400, xp = 0},
                    {id = "legcougars2", label = "Maza Cougar pelt", price = 400, xp = 0},
                    {id = "legcougars3", label = "Sapa Cougar pelt", price = 400, xp = 0},
                    {id = "legcougars4", label = "Black Cougar pelt", price = 400, xp = 0},
                }
            },
            {
                name = "Boar Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_boar.png"},
                items = {
                    {id = "legboars1", label = "Cogi Boar pelt", price = 250, xp = 0},
                    {id = "legboars2", label = "Wakpa Boar pelt", price = 250, xp = 0},
                    {id = "legboars3", label = "Icahi Boar pelt", price = 250, xp = 0},
                    {id = "legboars4", label = "Wildhog pelt", price = 250, xp = 0},
                    {id = "legboars", label = "Legendary Boar pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Beaver Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_beaver.png"},
                items = {
                    {id = "legbeavers1", label = "Grey Beaver pelt", price = 250, xp = 0},
                    {id = "legbeavers2", label = "White Beaver pelt", price = 250, xp = 0},
                    {id = "legbeavers3", label = "Black Beaver pelt", price = 250, xp = 0},
                    {id = "legbeawers", label = "Legendary Beaver pelt", price = 200, xp = 0},
                }
            },
            {
                name = "Alligator Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_alligator_big.png"},
                items = {
                    {id = "legaligators1", label = "Teca Alligator pelt", price = 400, xp = 0},
                    {id = "legaligators2", label = "Sun Alligator pelt", price = 400, xp = 0},
                    {id = "legaligators3", label = "Banded Alligator pelt", price = 400, xp = 0},
                    {id = "legaligators", label = "Legendary Alligator pelt", price = 400, xp = 0},
                }
            },
            {
                name = "Pronghorn Pelts",
                img = {size = "2.0", url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/refs/heads/master/useful_info_from_rpfs/textures/inventory_items/images/satchel_textures/animal_legendary_pronghorn.png"},
                items = {
                    {id = "legprongs", label = "Legendary Pronghorn pelt", price = 300, xp = 0},
                }
            },
        },
    },
}
--[[
------------------------------------------------------------------------------------------------------
    --QBR/QR/RS ITEM
------------------------------------------------------------------------------------------------------
    ['ricx_beartrap'] 					= {['name'] = 'ricx_beartrap', 			 	  	['label'] = 'Hunter Trap',	    				['weight'] = 1,			['type'] = 'item', 				['image'] = 'ricx_beartrap.png', 					['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,    	['level'] = 0,		['description'] = 'Hunting Tool'},
	['ricx_leg_animal_guide'] 					= {['name'] = 'ricx_leg_animal_guide', 			 	  	['label'] = 'Legendary Animal Guide Book',	    				['weight'] = 1,			['type'] = 'item', 				['image'] = 'ricx_leg_animal_guide.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,    	['level'] = 0,		['description'] = 'Hunting Tool'},
	
    -- 1.0 ITEMS
    ['trapoil'] 					= {['name'] = 'trapoil', 			 	  	['label'] = 'Trap Oil',	    				['weight'] = 1,			['type'] = 'item', 				['image'] = 'trapoil.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,    	['level'] = 0,		['description'] = 'Hunting Tool'},

    ['biggame'] = {['name'] = 'biggame', ['label'] = 'Big Game Meat', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/biggame.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
    ['venison'] = {['name'] = 'venison', ['label'] = 'Venison', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/venison.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
    ['beef'] = {['name'] = 'beef', ['label'] = 'Beef', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/beef.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
    ['aligatormeat'] = {['name'] = 'aligatormeat', ['label'] = 'Alligator meat', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/biggame.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
    ['bird'] = {['name'] = 'bird', ['label'] = 'Bird meat', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/bird.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
    ['game'] = {['name'] = 'game', ['label'] = 'Game Meat', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/game.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
    ['pork'] = {['name'] = 'pork', ['label'] = 'Pork', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/pork.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
    ['herptile'] = {['name'] = 'herptile', ['label'] = 'Herptile meat', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/herptile.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
    ['stringy'] = {['name'] = 'stringy', ['label'] = 'Stringy meat', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/stringy.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
    ['mutton'] = {['name'] = 'mutton', ['label'] = 'Mutton', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/mutton.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Animal Parts'},
        
    ['wheat'] = {['name'] = 'wheat', ['label'] = 'Wheat', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/wheat.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Product'},
    ['corn'] = {['name'] = 'corn', ['label'] = 'Corn', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/corn.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Product'},
    ['woodlog'] = {['name'] = 'woodlog', ['label'] = 'Woodlog', ['weight'] = 1, ['type'] = 'item', ['image'] = 'items/woodlog.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Product'},

------------------------------------------------------------------------------------------------------
    --REDEM:RP INVENTORY ITEM
------------------------------------------------------------------------------------------------------
    ["ricx_beartrap"] = { label = "Hunting Trap", description = "Hunter tool", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 5,imgsrc = "items/ricx_beartrap.png", type = "item_standard",},
    ["ricx_leg_animal_guide"] = { label = "Legendary Animal Guide Book", description = "Hunter tool", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 5,imgsrc = "items/ricx_leg_animal_guide.png", type = "item_standard",},

    -- 1.0 ITEMS
    ["trapoil"] =
    {
        label = "Oil for traps",
        description = "Fixes your problems",
        weight = 0.01,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/trapoil.png",
        type = "item_standard",
    },
    ["biggame"] =
    {
        label = "Big Game Meat",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/biggame.png",
        type = "item_standard",
    },
    ["venison"] =
    {
        label = "Venison",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/venison.png",
        type = "item_standard",
    },
    ["beef"] =
    {
        label = "Beef",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/beef.png",
        type = "item_standard",
    },
    ["aligatormeat"] =
    {
        label = "Alligator Meat",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/biggame.png",
        type = "item_standard",
    },
    ["bird"] =
    {
        label = "Bird Meat",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/bird.png",
        type = "item_standard",
    },
    ["game"] =
    {
        label = "Game Meat",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/game.png",
        type = "item_standard",
    },
    ["pork"] =
    {
        label = "Pork",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/pork.png",
        type = "item_standard",
    },
    ["herptile"] =
    {
        label = "Herptile meat",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/herptile.png",
        type = "item_standard",
    },
    ["stringy"] =
    {
        label = "Stringy meat",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/stringy.png",
        type = "item_standard",
    },
    ["mutton"] =
    {
        label = "Mutton",
        description = "Raw meat",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/mutton.png",
        type = "item_standard",
    },
    ["wheat"] =
    {
        label = "Wheat",
        description = "plant",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/wheat.png",
        type = "item_standard",
    },
    ["corn"] =
    {
        label = "Corn",
        description = "plant",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/corn.png",
        type = "item_standard",
    },
    ["woodlog"] =
    {
        label = "Woodlog",
        description = "item",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 100,
        imgsrc = "items/woodlog.png",
        type = "item_standard",
    },

]]