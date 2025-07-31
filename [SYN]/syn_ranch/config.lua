Config = {}

-- Change between cores
Config.redem = false -- RedEM:RP
Config.vorp = true   -- VORP Core
Config.debug = false
Config.herdcheckdist = 12
Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["B"] = 0x4CC0E2FE,
    ["G"] = 0x760A9C6F,
    ["ENTER"] = 0xC7B5340A,
    ["DOWN"] = 0x05CA7C52,
    ["UP"] = 0x6319DB71,
    ["LEFT"] = 0xA65EBAB4,
    ["RIGHT"] = 0xDEB34313,
    ["RIGHTBRACKET"] = 0xA5BDCD3C,
    ["LEFTBRACKET"] = 0x430593AA,
    ["BACKSPACE"] = 0x156F7119,
    ["ALT"] = 0x8AAA0AD4,
    ["CTRL"] = 0xDB096B85,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
}

Config.ranchtaskdowntick = 30 -- minutes

Config.ledgerwebhook =
""
Config.webhook =
""
Config.lockmaxenviroment = 300 -- set to 0 if u dont want a maximum

Config.command = "createranch"
Config.synsocietyjob = ""
Config.allowTransfer = true       -- allow players to transfer ownership of their ranches
Config.reachedtimer = 10          -- 20 seconds after the first cattle is reached to finish herding (dont change if u dont know what ur doing)
Config.herdingcooldown = 900      --900 15 minutes, time between each herding trip. longer cool downs will encourage players to go on longer routes
Config.salecooldown = 900         -- 15 minutes between sales
Config.selltimer = 3600           -- timer for sale mission to fail 30 minutes
Config.ranchforsale = 552659337   -- ranch for sale blip
Config.playerranch = 263099185    -- owned ranch blip
Config.herdtimer = 3600           --  (30 minutes) from herding start to fail the herding if herd isnt delivered
Config.pvp = true                 -- setting this to true will reward players who kill other players cattle with half the price of each cattle type per kill on cattle.
Config.stray = 8                  -- this means 3 out of 10 times the animals have a chance of straying. higher number = lower chance up to 9. if you want to disable set to 10
Config.straycooldownherd = 300000 -- in miliseconds. timer between each goat stray, lower timer more strays harder herding
Config.straycooldownsale = 300000 -- in miliseconds. timer between each goat stray, lower timer more strays harder herding
Config.wolfcooldown = 600000      -- in miliseconds. timer between each wolf spawn, lower timer more wolfs harder herding
Config.wolf = 14                  -- 1 out of 15 chance worlff will spawn. set to 15 to disable. lower number = higher chance of spawning.

Config.herdingdogcommand =
"onme"                            -- doing /onme if you own a herding dog will bring all the herd animals to you while on a herding trail, can be used once every 5 minutes


--[Payout]
--[[
The Payout of a Sale is the ratio X Quality X herd number.
ration = Price of Cattle/100 .
if the herd ratio is 1 in the following example that would be cows. the payout at max herd quality and number would be
10,000 $. adjust as per your economy.
]]
--------------------
Config.bougthQuality = 0.1 -- Qualité de départ des animaux achetés
Config.maxquality = 200
Config.maxherd = 5         -- max number of each herd not recommended to go over 10.
--------------------

----------------------------
Config.qualitybuff = true     -- turn of if you want to buff quality gain on each herding trip
Config.qualitybuffvalue = 0.5 -- this is a multiplyer. setting it to 2 will double the quality gain on trips. use as per your economy.
--- avoid changing max quality and max herd and instead play around with this multiplyer to adjust payout.
-- by default this is off.

-----------------------------
Config.maxscorelock = true      -- setting to true will enable a max score on minigames. this will limit the modifier that players get on their enviroment
Config.maxscore = 10            -- max score for mini games, better to keep it off as it gives players who are better at the mini game an edge
-----------------------------
Config.taskresettimer = 1800000 -- 30 minutes. every 30 minutes randomized task reset will happen
-----------------------------------------------------------
Config.cowpencost = 2000        -- cost of the cow pen upgrade
Config.milkingcooldown = 900    -- in seconds (900)
Config.milkitem = "milk"
Config.reducedmilk = true       -- toggle to true if you want half the milk output. toggling on will make getting milk harder.
-- milkoutput is score * (ranch_q/100). if reducedmilk is true score is devided by 2
Config.stopcheaters = true      -- people who kill their own cows to farm them will get charged 100$
------------------------------------------------------------
Config.chickenpencost = 1500
Config.chickenscooldown = 900
Config.eggitem = "eggs"
Config.reducedeggs = true
-----------------------------------------------------------
Config.repo = true --- turn to false if you dont want a repo system
-- only set one of those true
Config.monthlyrepo = true
Config.repotime = { -- day, hour, and minute of monthly repo of ranches. when the server time matches these values. ranches that dont have money in their ledger = or more than the tax rate of the ranch will
    -- go on sale and their owner will lose their ownership. these ranches will be marked as repoed.
    day = 15,
    hour = 0,
    minute = 10
}
Config.weeklyrepo = false
Config.repotime2 = { -- day, hour, and minute of monthly repo of ranches. when the server time matches these values. ranches that dont have money in their ledger = or more than the tax rate of the ranch will
    -- go on sale and their owner will lose their ownership. these ranches will be marked as repoed.
    day1 = 3,
    day2 = 10,
    day3 = 17,
    day4 = 24,
    hour = 6,
    minute = 10
}
-----------------------------------------------------------
Config.herdingdogs = { -- dogs will allow the onme command which brings all herd animals around you.
    -- dogs will also try to bring stray animals back to the group. this doesnt always work flawlessly and sometimes the player will have
    -- to fitch the animal themselves. but when it works its pretty cool
    ["Huskey"] = { model = "A_C_DogHusky_01", price = 1000 },
    ["Chesbay Retriever"] = { model = "A_C_DogChesBayRetriever_01", price = 300 },
    ["Labrador Retriever"] = { model = "A_C_DogLab_01", price = 300 },
    ["Labrador Retriever 2"] = { model = "A_C_DogRufus_01", price = 300 },
    ["Coon Hound"] = { model = "A_C_DogBluetickCoonhound_01", price = 300 },
    ["Border Collie"] = { model = "A_C_DogCollie_01", price = 300 },
    --["Ches Bay Retriever"] = {model = "A_C_DogChesBayRetriever_01",price = 300},
    ["Foxhound"] = { model = "A_C_DogAmericanFoxhound_01", price = 300 },
    ["Catahoula Cur"] = { model = "a_c_dogcatahoulacur_01", price = 75 },

}
----------------------------------------------------------------------
-- add more by finding the ped models here
-- https://github.com/femga/rdr3_discoveries/blob/master/peds/peds_list.lua
-- make sure all 3 tables have the same naming, the naming can be whatever you want
Config.buffpayout = 2
Config.cattletypes = {
    ["goats"] = 'a_c_goat_01',
    ["sheep"] = 'a_c_sheep_01',
    --["Kentucky Saddle"] = 'A_C_Horse_KentuckySaddle_Black',
    ["cow"] = 'a_c_cow',
    ["chicken"] = 'a_c_chicken_01',
    ["pig"] = 'a_c_pig_01',
    ["Pronghorn"] = "A_C_Pronghorn_01",
    ["Bison"] = "A_C_Buffalo_01",
    ["Ram"] = "A_C_BigHornRam_01",
    ["Deer"] = "A_C_Deer_01",
}

Config.itemsgive = {
    ["sheep"] = { "wool" },
    ["cow"] = { "cows" },
    ["goats"] = { "fibers" },
    ["pig"] = { "porkfat" },
    ["chicken"] = { "chickenf" },
    ["Pronghorn"] = { "prongs", "venison" },
    ["Bison"] = { "bisons", "beef" },
    ["Ram"] = { "rams" },
    ["Deer"] = { "deerskin" }



}

Config.joblock = {
    ["goats"] = 'none', -- keep at none if you want anyone to buy
    ["sheep"] = 'none', -- keep at none if you want anyone to buy
    --["Kentucky Saddle"] = 'horsetrainer', -- only players with the horsetrainer job can buy those
    ["cow"] = 'none',
    ["chicken"] = 'none',
    ["pig"] = 'none',
    ["Pronghorn"] = 'none',
    ["Bison"] = 'none',
    ["Ram"] = 'none',
    ["Deer"] = 'none',
}

Config.cattleprice = {
    ["goats"] = 20,                    --
    ["sheep"] = 30,                    --
    --[[ ["Kentucky Saddle"] = 100, ]] -- 5.0 ratio
    ["cow"] = 50,
    ["chicken"] = 10,
    ["pig"] = 30,
    ["Ram"] = 40,
    ["Pronghorn"] = 50,
    ["Deer"] = 60,
    ["Bison"] = 80,
}
----------------------------------------------------------------------------------
-- locations where players can sell cattle, add more by copy pasting the backets marked

Config.cattlesale = {
    -- copy from here
    Valentine = {
        Pos = { x = -217.18, y = 634.94, z = 113.20 },
        blipsprite = -569968788,
        Name = 'Valintine Sale Barn',
    }, -- to here

    Rhodes = {
        Pos = { x = 1332.0, y = -1271.8, z = 76.8 },
        blipsprite = -569968788,
        Name = 'Rhodes Sale Barn',
    },

    Blackwater = {
        Pos = { x = -853.13, y = -1337.95, z = 43.48 },
        blipsprite = -569968788,
        Name = 'Blackwater Sale Barn',
    },

    Strawberry = {
        Pos = { x = -1837.10, y = -438.56, z = 159.53 },
        blipsprite = -569968788,
        Name = 'Strawberry Sale Barn',
    },

    Armadillo = {
        Pos = { x = -3660.93, y = -2564.88, z = -13.75 },
        blipsprite = -569968788,
        Name = 'Armadillo Sale Barn',
    },

    SD = {
        Pos = { x = 2393.30, y = -1416.46, z = 45.76 },
        blipsprite = -569968788,
        Name = 'SD Sale Barn',
    },

    Annesburg = {
        Pos = { x = 2936.83, y = 1312.21, z = 44.53 },
        blipsprite = -569968788,
        Name = 'Annesburg Sale Barn',
    },

    Tumbleweed = {
        Pos = { x = -5410.35, y = -2934.25, z = 0.92 },
        blipsprite = -569968788,
        Name = 'Tumbleweed Sale Barn',
    },

    Colter = {
        Pos = { x = -1304.8245, y = 2423.0364, z = 307.0239 },
        blipsprite = -569968788,
        Name = 'Valintine Sale Barn',
    },

}

Config.Language = {
    inmenu = "Menu is Being used",

    rranchid = "Ranch ID: ",
    quitranch = "Quit ranch",
    ------------------------- new lines
    canceltaskranch = "cancel task",
    choreaborted = "Task Cancelled",
    cowclose = "Return cow to barn",
    chickenclose = "Return chickens to barn",
    cancelTask = "Cancel chore",
    herdzStep1 = "take the animals out to pasture. Lead the herd to the first spot.",
    herdzBlipStep1 = "1st step grazing",
    herdzStep2 = "The grass is scarce. Look for greener grass.",
    herdzBlipStep2 = "2nd stage of grazing",
    herdzStep3 = "The grass is no longer thick enough. Proceed to the next spot of pasture.",
    herdzBlipStep3 = "3rd stage of grazing",
    herdzStep4 = "move to the next spot",
    herdzBlipStep4 = "4th stage of grazing",
    herdzStep5 = "The animals are tired. Start walking back",
    herdzBlipStep5 = "5th stage of grazing",
    herdzStep6 = "Just a little more. Go back to your ranch",
    herdzBlipStep6 = "6th stage of grazing",
    herdzStep7 = "Bring the animals back into the pen.",
    herdzBlipStep = "Enclosure",
    reportHerdzCountLive = " animals survived ",
    reportHerdzCountDeath = " died",
    reportHerdzStressed = "All animals died",
    ------------------
    invalidamount = "Invalid Amount",
    ranchname = "Ranch Name: ",
    ranchprice = "Ranch Price: ",
    confirm = "Confirm",
    createranch = "Create A Ranch",
    sure = "Are You Sure ?",
    yes = "Yes",
    no = "No",
    buyranch = "Press G For Buy Ranch Menu",
    ranchforsale = "Ranch for Sale",
    boughtranch = "You Received A Ranch",
    soldranch = "You Transferred Your Ranch",
    nocash = "Not Enough Cash",
    openranch = "Press G For Ranch Menu",
    ownedranch = "Ranch",
    settrail = "Set Herd Trail",
    trailset = "Trail Has Been Set",
    herd = "Herd Cattle",
    buycattle = "Buy Cattle",
    buy = "Buy ",
    amount = "Amount:",
    cattlebought = "You Bought Cattle",
    owned = "Owned:",
    forr = " for ",
    dollar = " $",
    selectcattle = "Select Cattle",
    killeda = "You Killed ",
    paid = " ,Rewarded: ",
    herdcooldown = "Herding on cooldown: ",
    seconds = " seconds",
    quality = "Quality: ",
    cattle = "Cattle: ",
    viewcattle = "View Cattle",
    sellcattle = "Sell Cattle",
    paid2 = "You Sold Cattle For ",
    salecooldown = "Selling on cooldown: ",
    choresloc = "Chores Location: ",
    setchoreslocation = "Set Chores Location",
    racking = "Raking",
    pressg = "Press G To Register Location",
    tasklocregistered = "Registered New Task Location.",
    hayscope = "Shovel",
    feed = "Feed",
    hayspread = "Hay Spread",
    water = "Water Bucket",
    enviroment = "Enviroment: ",
    ranchchores = "Ranch Chores",
    gotoloc = "Go To Marked Location To Start Task",
    starttask = "Press G To Start Task",
    finishedtask = "You Finished A Task",
    working = "Working...",
    failed = "Failed...",
    finished = "Finished.",
    upgrades = "Upgrades",
    cowpen = "Cow Pen",
    chickenpen = "Chicken Coop",
    locregistered = "Location Registered",
    boughtpen = "You Bought A Cow Pen",
    boughtpen2 = "You Bought A Chickens Pen",
    changelocation = "Change Location",
    milkcows = "Milk Cows",
    gotocow = "Go To Cow To Start Milking",
    gotochicken = "Go To Chickens To Start Collecting Eggs",
    gtomilk = "Press G To Start Milking",
    milkingcooldown = "Milking On Cooldown",
    yougot = "Added To Your Ranch ",
    milk = " Milk",
    takemilk = "Take Milk",
    takeeggs = "Take Eggs",
    took = "You Took ",
    youkilledyourcow = "You Killed Your Own Cow and Lost ",
    cantcarry = "Cant Carry More Items",
    herdingdog = "Herding Dog",
    boughtdog = "You Bought a Herding Dog",
    dogg = "You Have a Herding Dog. Typing /",
    tome = " While herding will bring all animals to you.",
    tooclose = "too close",
    outrange = "out of range",
    dist = "Dist= ",
    ledger = "Ledger",
    withdraw = "Withdraw",
    withdrew = "You Withdrew ",
    deposit = "Deposit",
    deposited = "You Deposited ",
    ranchtax = "Tax: ",
    homtax1h = "~e~Ranch Tax Collection in 1 hour~q~",
    makesure = "~e~Make Sure Your Ranch Ledger Has Enoguh Money To Pay Tax~q~",
    herddie = "One Of Your Herd Animals Died",
    eggs = " Eggs",
    checkchickens = "Check On Chickens",
    chickencooldown = "Checking Chicken On Cooldown ",
    oncooldown = "On Cool Down",
    loggedoffselling = " Logged Off While Selling",
    loggedoffherding = " Logged off While Herding",
    killedherdanimal = " Killed a Herd Animal",
    killedtheircow = "Killed Their Own Cow",
    killedplayercow = "Killed A Players Cow",
    hire = "Hire Farm-Hand",
    id = "Player ID",
    fire = "Fire",
    bossactions = "Boss Actions",
    hired = "You Hired ",
    gothired = "You Got Hired At A Ranch.",
    alreadyhired = "Already Hired",
    wrongid = "Wrong ID",
    fired = "You Fired ",
    tooclose2 = "Someone Is Too Close",
    timerxz = "Timer = ",
    presstospawn = "press G to spawn herd",
    ranchid = "Ranch ID: ",
    transfer = "Transfer Ownership",
    updatemanagers = "Update Managers",
    managerset = "Manager Status Updated",
    setwebhook = "Set Webhook",
    webhookset = "Webhook Set",
    webhook = "Enter Webhook",
}
