-- Version 1.1 Build 05
-- Erval
local reachdist = Config.herdcheckdist / 2
local goat
local reached = false
local goal = {}
local ontheway = false
local herdno
local herd = {}
local firsttimeherd = false

local wolfs = {}
local ranchTaskName = "" -- La tâche de ranch en cours
local ranchDefTask = {}  -- La tâche de ranch en cours
local hiredList = {}     -- Liste des employés du ranch pour menu fire
local justspawned = false
local onme = false
local registering = false
local pedloc
local range = 100
local loc1 = nil
local loc2 = nil
local loc3 = nil
local loc4 = nil
local reg = false
local reg1 = false
local reg2 = false
local reg3 = false
local first = false
local sec = false
local third = false
local fourth = false
local fifth = false
local sixth = false
local cooldown = false
local cooldown2 = false
local cooldown3 = false
local cooldown4 = false
local cooldown5 = false
local startcoords
local freakout
local activeTasks = {}
local reset = false
local reset2 = false
local reset3 = false
local reset4 = false
local reset5 = false
local reset6 = false
local attack = false
local finalnumber = 0
--local creatingranch = false
local ranchprice = 0
local ranchname = ""
local playerids
local playercharid
local playerjob
local playerrank
local blips = {}
local ranches = {}
local inranch = false
local ranchid
local ranchpricez
local ranchnamez
local next = next
local herdhash
local startherd = false
local ranchlocation
local typeAnimal -- type est un mot réservé pour obtenir le typage d'une variable - Erval 03092022
local cattlex = {}
local q_cattlex = {}
local timeout = false
local timer = 0
local failedherding = false
local Killer
local distance
local herdingcooldown = false
local timer2 = 0
local dist1x
local dist2x
local dist3x
local dist4x
local timer3 = 0
local timer4 = 0
local timer5 = 0
local timer6 = 0
local timer7 = 0
local timer8 = 0
local reachedtimerout = false
local reachedtimerout2 = false
local startsale = false
local herdingcooldown2 = false
local ontheway2 = false
local timeout2 = false
local reached2 = false
local failedherding2 = false
local justspawned2 = false
local regx = false
local taskname
local taskloc = {}
local chores = {}
local blipg
local chorelocx = {}
local starttask = false
local task
local q_ranch
local score
local cowpenloc = false
local cowpenloc2 = false
local chickenloc = false
local chickenloc2 = false
local cowstuff = {}
local chickenstuff = {}
local cowmo
local chicken = {}
local milking = false
local cchecking = false
local cheater = false
local dog = "0"
local dogg
local onme2 = false
local ranchtax = 0
local ranchtaxz = 0
local boss = false
local keyholdersx = {}
local hasLoaded = false
local blipHerdz

-- ## RANCH Infos Joueur - Actualisation du ranchid et du isOwner
local player_Infos = {}
local ranchesList = {}

-- ## RANCH Liste destinée à gérer blips et achats
local playerRanch_Infos = {}

-- #### Chargement du module : on veut savoir si le joueur appartient à un ranch
-- ###### Selection du personnage
RegisterNetEvent("vorp:SelectedCharacter") -- Selection du personnage avant d'entrer en jeu
AddEventHandler("vorp:SelectedCharacter", function(charid)
    initResource()
end)
-- ###### Restart du module
AddEventHandler(
    "onResourceStart",
    function(resourceName)
        if Config.debug then
            if resourceName == GetCurrentResourceName() then
                initResource()
            end
        end
    end
)

function initResource()
    ranchesList = {}
    playerRanch_Infos = {}
    TriggerServerEvent("syn_ranch:getRanchPlayerInfos")        -- Infos joueurs
    TriggerServerEvent("syn_ranch:getRanchesFromServer", true) -- Liste des ranches pour vente et blips
end

-- #### Fermeture du module
AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            for k, v in pairs(herd) do
                DeleteEntity(v.goat)
                print("Deleted goat")
            end
            for k, v in pairs(wolfs) do
                DeleteEntity(v.wolfz)
            end
            for k, v in pairs(chicken) do
                DeleteEntity(v.chicken)
            end
            DeleteEntity(dogg)
            DeleteEntity(cowmo)
            TriggerEvent("syn_ranch:Blips_Remove")
        end
    end
)

-- #### Update demandé par le serveur
-- ###### Infos du ranch du joueur
RegisterNetEvent("syn_ranch:player_ranchinfo_update")
AddEventHandler("syn_ranch:player_ranchinfo_update", function(ranchInfos, playerInfos)
    playerRanch_Infos = ranchInfos
    player_Infos = playerInfos
    playerids = player_Infos.identifier
    playercharid = player_Infos.charidentifier
    playerjob = player_Infos.job
    playerrank = player_Infos.rank
end)

function isManager()
    for k, v in pairs(playerRanch_Infos.hired) do
        if v.charidentifier == playercharid and v.manager then
            return true
        end
    end
    return false
end

function isBoss()
    return playerRanch_Infos.ranchOwner == playercharid
end

-- ###### Infos sur tous les ranchs
RegisterNetEvent("syn_ranch:RanchesList_Update")
AddEventHandler("syn_ranch:RanchesList_Update", function(ranches, updateBlipsFlag)
    ranchesList = msgpack.unpack(ranches)
    if (updateBlipsFlag) then
        TriggerEvent("syn_ranch:Blips_Reset", ranchesList)
    end
end)

RegisterNetEvent("syn_ranch:afterJoinedRanch") -- Le joueur vient d'acheter un ranch ou vient d'être engagé
AddEventHandler("syn_ranch:afterJoinedRanch", function()
    initResource()
end)

RegisterNetEvent("syn_ranch:afterJoinedRanchAll")              -- Le joueur vient d'acheter un ranch ou vient d'être engagé
AddEventHandler("syn_ranch:afterJoinedRanchAll", function()
    TriggerServerEvent("syn_ranch:getRanchesFromServer", true) -- Liste des ranches pour vente et blips
end)

--

-- #### Gestion des blips
RegisterNetEvent("syn_ranch:Blips_Reset")
AddEventHandler("syn_ranch:Blips_Reset", function(ranchesList)
    Citizen.Wait(1000)
    TriggerEvent("syn_ranch:Blips_Remove")
    Citizen.Wait(500)
    TriggerEvent("syn_ranch:Blips_Create", ranchesList)
    TriggerEvent("syn_ranch:blip")
end)

RegisterNetEvent("syn_ranch:Blips_Create")
AddEventHandler("syn_ranch:Blips_Create", function(ranchesList)
    Citizen.Wait(2000)
    local blip
    local blipType
    local blipName
    for k, v in pairs(ranchesList) do
        blipType = 0
        blipName = ""
        if v.owned == 0 then -- Ranch sans proprio = à vendre
            blipType = Config.ranchforsale
            blipName = Config.Language.ranchforsale
        elseif (v.ranchid == playerRanch_Infos.id) then -- je suis proprio du ranch ou ouvrier
            blipType = Config.playerranch
            blipName = v.ranchname
        end
        if blipType ~= 0 then
            blip = N_0x554d9d53f696d002(1664425300, v.location.x, v.location.y, v.location.z)
            SetBlipScale(blip, 0.2)
            SetBlipSprite(blip, blipType, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, blipName)
            table.insert(blips, {
                blipz = blip
            })
        end
    end
end)

RegisterNetEvent("syn_ranch:Blips_Remove")
AddEventHandler("syn_ranch:Blips_Remove", function()
    for k, v in pairs(blips) do
        RemoveBlip(v.blipz)
    end
    blips = {}
    RemoveBlip(blipg)
    RemoveBlip(blipHerdz)
end)
-- ## Marchés aux bestiaux
RegisterNetEvent("syn_ranch:blip")
AddEventHandler("syn_ranch:blip", function()
    for k, v in pairs(Config.cattlesale) do
        blipg = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
        SetBlipSprite(blipg, v.blipsprite, 1)
        SetBlipScale(blipg, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blipg, v.Name)
    end
end)

-- ## INTERRACTION joueur
-- #### TASKS - Définition coords
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if regx then
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                taskloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                if (playerRanch_Infos.chores == nil) then
                    playerRanch_Infos.chores = {}
                end
                if contains(playerRanch_Infos.chores, ranchDefTask.name) then
                    playerRanch_Infos.chores[ranchDefTask.name].loc = taskloc
                    for k, v in pairs(playerRanch_Infos.chores) do
                        v.num = 0
                    end
                    TriggerServerEvent("syn_ranch:registertaskloc", playerRanch_Infos.chores, playerRanch_Infos.id)
                else
                    playerRanch_Infos.chores[ranchDefTask.name] = { loc = taskloc, num = 0 }
                    for k, v in pairs(playerRanch_Infos.chores) do
                        v.num = 0
                    end
                    TriggerServerEvent("syn_ranch:registertaskloc", playerRanch_Infos.chores, playerRanch_Infos.id)
                end
                regx = false
            end
        end
    end
end)
-- #### COWS - Achat d'un enclos à vache
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if cowpenloc then
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                local penloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                local cows = { loc = penloc }
                TriggerServerEvent("syn_ranch:regcowpen", playerRanch_Infos.id, cows)
                cowpenloc = false
            end
        end
    end
end)
-- #### COWS - Update position enclos à vache
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if cowpenloc2 then
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                local penloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                local cows = { loc = penloc }
                TriggerServerEvent("syn_ranch:regcowpen2", playerRanch_Infos.id, cows)
                cowpenloc2 = false
            end
        end
    end
end)
-- #### CHICKENS - Achat d'un poulailler
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if chickenloc then
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                local penloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                local chickens = { loc = penloc }
                TriggerServerEvent("syn_ranch:regchickenpen", playerRanch_Infos.id, chickens)
                chickenloc = false
            end
        end
    end
end)
-- #### CHICKENS - Update position poulailler
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if chickenloc2 then
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["G"]) then
                local penloc = GetEntityCoords(PlayerPedId())
                Citizen.Wait(1000)
                local chickens = { loc = penloc }
                TriggerServerEvent("syn_ranch:regchickenpen2", playerRanch_Infos.id, chickens)
                chickenloc2 = false
            end
        end
    end
end)
-- TROUPEAU - Défintion chemin de paturage
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if registering then
            local loc = GetEntityCoords(PlayerPedId())
            local dist1
            local dist2
            local dist3
            local dist4
            -- Checkpoint 1
            if not reg then
                dist1 = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, pedloc.x, pedloc.y, pedloc.z, 0)
                if range > dist1 and dist1 > Config.herdcheckdist then
                    drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                    drawtext(Config.Language.dist .. dist1, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                    if whenKeyJustPressed(Config.keys["G"]) then
                        loc1 = GetEntityCoords(PlayerPedId())
                        dist1x = dist1
                        reg = true
                        Citizen.Wait(1000)
                    end
                elseif 8 > dist1 then
                    drawtext(Config.Language.tooclose, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                elseif dist1 > range then
                    drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                end
            end
            -- Checkpoint 2
            if reg and not reg1 then
                dist2 = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, loc1.x, loc1.y, loc1.z, 0)
                if range > dist2 and dist2 > Config.herdcheckdist then
                    drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                    drawtext(Config.Language.dist .. dist2, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                    if whenKeyJustPressed(Config.keys["G"]) then
                        loc2 = GetEntityCoords(PlayerPedId())
                        dist2x = dist2
                        reg1 = true
                        Citizen.Wait(1000)
                    end
                elseif 8 > dist2 then
                    drawtext(Config.Language.tooclose, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                elseif dist2 > range then
                    drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                end
            end
            -- Checkpoint 3
            if reg and reg1 and not reg2 then
                dist3 = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, loc2.x, loc2.y, loc2.z, 0)
                if range > dist3 and dist3 > Config.herdcheckdist then
                    drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                    drawtext(Config.Language.dist .. dist3, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                    if whenKeyJustPressed(Config.keys["G"]) then
                        loc3 = GetEntityCoords(PlayerPedId())
                        dist3x = dist3
                        reg2 = true
                        Citizen.Wait(1000)
                    end
                elseif 8 > dist3 then
                    drawtext(Config.Language.tooclose, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                elseif dist3 > range then
                    drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                end
            end
            -- Checkpoint 4
            if reg and reg1 and reg2 and not reg3 then
                dist4 = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, loc3.x, loc3.y, loc3.z, 0)
                if range > dist4 and dist4 > Config.herdcheckdist then
                    drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                    drawtext(Config.Language.dist .. dist4, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                    if whenKeyJustPressed(Config.keys["G"]) then
                        loc4 = GetEntityCoords(PlayerPedId())
                        dist4x = dist4
                        reg = false
                        reg1 = false
                        reg2 = false
                        Citizen.Wait(1000)
                        local trail = {}
                        table.insert(trail, {
                            loc1 = loc1,
                            loc2 = loc2,
                            loc3 = loc3,
                            loc4 = loc4
                        })
                        local distx = dist1x + dist2x + dist3x + dist4x
                        TriggerServerEvent("syn_ranch:registertrail", playerRanch_Infos.id, trail, distx)
                        registering = false
                    end
                elseif 8 > dist4 then
                    drawtext(Config.Language.tooclose, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                elseif dist4 > range then
                    drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                end
            end
        end
    end
end)
-- #### TROUPEAU - Paturage - Spawn
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if startherd then
            local loc = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, ranchlocation.x, ranchlocation.y, ranchlocation.z,
                0)
            if 25 > dist then
                drawtext(Config.Language.presstospawn, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.dist .. dist, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["G"]) then
                    if not loc1 then
                        TriggerEvent("vorp:TipRight", "You need to register a trail first", 3000)
                    else
                        startcoords = GetEntityCoords(PlayerPedId())
                        Citizen.Wait(500)
                        TriggerEvent("syn_ranch:herdz")
                        timer2 = Config.herdingcooldown
                        herdingcooldown = true
                    end
                    startherd = false
                    
                end
            else
                drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
        end
    end
end)
-- #### TROUPEAU - Vente - Spawn
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if startsale then
            local loc = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, ranchlocation.x, ranchlocation.y, ranchlocation.z,
                0)
            if 25 > dist then
                drawtext(Config.Language.presstospawn, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.dist .. dist, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["G"]) then
                    startsale = false
                    startcoords = GetEntityCoords(PlayerPedId())
                    Citizen.Wait(500)
                    TriggerEvent("syn_ranch:herdg")
                    timer4 = Config.salecooldown
                    herdingcooldown2 = true
                end
            else
                drawtext(Config.Language.outrange, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
        end
    end
end)
-- #### TROUPEAU - Chien - Slash command pour demander au chien de regrouper le troupeau
RegisterCommand(Config.herdingdogcommand, function(source, args, raw)
    if not onme2 then
        if ontheway then
            if dog ~= "0" then
                onme = true
                onme2 = true
                for k, v in pairs(herd) do
                    if not v.stray then
                        ClearPedTasks(v.goat)
                        FreezeEntityPosition(v.goat, false)
                        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.5, 0.5, -0.35))
                        TaskGoToCoordAnyMeans(v.goat, x, y, z, 1.5, 0, 0, 0, 0.5)
                    end
                end
                Citizen.Wait(10000)
                for k, v in pairs(herd) do
                    if not v.stray then
                        FreezeEntityPosition(v.goat, false)
                        ClearPedTasks(v.goat)
                        if goal == nil then
                            print("goal is nil")
                            goal = playerRanch_Infos.trail[1]["loc1"]
                        end
                        TaskGoToCoordAnyMeans(v.goat, goal.x, goal.y, goal.z, 1.5, 0, 0, 0, 0)
                    end
                end
                onme = false
            end
        end
    end
end)

-- ## Circle localisation ranch + accès au menu ranch
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local sleep = true
        local showCircleMark = false
        local showAction = false
        --local circleMsg
        --local circleMenu
        for k, v in pairs(ranchesList) do
            local dist = GetDistanceBetweenCoords(coords, v.location.x, v.location.y, v.location.z, true)
            if dist > 2 and dist < 5 then
                sleep = false
                showCircleMark = true
            elseif dist < 2 then
                sleep = false
                showAction = true
            else
                showCircleMark = false
                showAction = false
            end
            if showCircleMark then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, v.location.x, v.location.y, v.location.z - 1, 0.0,
                    0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false)
                drawtext(Config.Language.rranchid .. v.ranchid, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true,
                    10000)
            end
            if showAction then
                if v.owned == 0 and (playerRanch_Infos.id == 0 or playerRanch_Infos.id == nil) then -- Ranch sans proprio = à vendre et joueur pas encore associé à un ranch
                    circleMsg = Config.Language.buyranch
                    circleMenu = 'buyranch'
                elseif (v.ranchid == playerRanch_Infos.id and playerRanch_Infos.id ~= nil) then -- je suis proprio du ranch ou ouvrier
                    circleMsg = Config.Language.openranch
                    if ranchTaskName == "racking" or ranchTaskName == "hayscope" or ranchTaskName == "feed" or ranchTaskName == "hayspread" or ranchTaskName == "water" then
                        circleMenu = 'canceltaskranch' -- menu annulation de corvée
                    else
                        circleMenu = 'ownedranch'
                    end
                else
                    circleMenu = ""
                end
                if circleMenu ~= "" then
                    local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
                    drawtext(circleMsg, 0.50, 0.95, 0.6, 0.6, true, 255, 255, 255, 255, true, 10000)
                    if IsControlJustReleased(0, Config.keys["G"]) then
                        if closestPlayer ~= -1 and closestDistance <= 2.0 then
                            if Config.vorp then
                                TriggerEvent("vorp:TipBottom", Config.Language.tooclose2, 4000)
                            elseif Config.redem then
                                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.tooclose2, 4000)
                            end
                        else
                            if circleMenu == "buyranch" then
                                playerRanch_Infos.ToBuy_Id = v.ranchid
                                playerRanch_Infos.ToBuy_Name = v.ranchname
                                playerRanch_Infos.ToBuy_Price = v.price
                                playerRanch_Infos.ToBuy_Tax = v.tax
                                TaskStandStill(PlayerPedId(), -1)
                                FreezeEntityPosition(PlayerPedId(), true)
                                WarMenu.OpenMenu(circleMenu)
                            elseif circleMenu == "canceltaskranch" then
                                TaskStandStill(PlayerPedId(), -1)
                                FreezeEntityPosition(PlayerPedId(), true)
                                WarMenu.OpenMenu(circleMenu)
                            else
                                TriggerServerEvent("syn_ranch:getInfosBeforeOpenRanchMenu", v.ranchid, true) -- on récupére les infos de cooldown, de troupeau avant d'ouvrir le menu d'interraction avec le ranch
                            end
                        end
                    end
                end
            end
        end
        if sleep then
            Citizen.Wait(500)
        end
    end
end)

local pendinginfo = false

function closeRanchInv()
    local coords = GetEntityCoords(PlayerPedId())
    for k, v in pairs(ranchesList) do
        local dist = GetDistanceBetweenCoords(coords, v.location.x, v.location.y, v.location.z, true)
        if dist < 3 then
            print("test1")
            if v.ranchid == playerRanch_Infos.id and playerRanch_Infos.id ~= nil then
                pendinginfo = true
                TriggerServerEvent("syn_ranch:getInfosBeforeOpenRanchMenu", v.ranchid)
                while pendinginfo do
                    Citizen.Wait(50)
                end

                print(isBoss(), isManager())
                if isBoss() or isManager() then
                    return true, v.ranchid
                end
            end
        end
    end
    return false
end

exports("closeRanchInv", closeRanchInv)

RegisterNetEvent("syn_ranch:doOpenMenuWithInfos") -- retour du serveur après un getInfosBeforeOpenRanchMenu
AddEventHandler("syn_ranch:doOpenMenuWithInfos",
    function(ranchInfos, activetasks, openmenu)   -- Cool down, infos cattle, qualité sur le serveur
        playerRanch_Infos = ranchInfos
        activeTasks = activetasks
        dog = playerRanch_Infos.dog
        if playerRanch_Infos.trail == nil then
            playerRanch_Infos.trail = {}
        end
        if playerRanch_Infos.trail[1] == nil then
            playerRanch_Infos.trail[1] = {}
        end
        loc1 = playerRanch_Infos.trail[1]["loc1"]
        loc2 = playerRanch_Infos.trail[1]["loc2"]
        loc3 = playerRanch_Infos.trail[1]["loc3"]
        loc4 = playerRanch_Infos.trail[1]["loc4"]
        if openmenu then
            TaskStandStill(PlayerPedId(), -1)
            FreezeEntityPosition(PlayerPedId(), true)
            WarMenu.OpenMenu("ownedranch")
        end
        pendinginfo = false
    end)

RegisterNetEvent("syn_ranch:doBossOpenMenuFire") -- retour du serveur après un beforefireplayer
AddEventHandler("syn_ranch:doBossOpenMenuFire",
    function(hiredListFromServer)                -- Cool down, infos cattle, qualité sur le serveur
        local temphiredList = hiredListFromServer
        table.sort(temphiredList, function(a, b)
            if a.manager == b.manager then
                return a.name < b.name
            elseif a.manager then
                return true
            else
                return false
            end
        end)
        hiredList = temphiredList
        WarMenu.OpenMenu("fire")
    end)

RegisterNetEvent("syn_ranch:doBossOpenMenuManagers") -- retour du serveur après un beforefireplayer
AddEventHandler("syn_ranch:doBossOpenMenuManagers",
    function(hiredListFromServer)                    -- Cool down, infos cattle, qualité sur le serveur
        local temphiredList = hiredListFromServer
        table.sort(temphiredList, function(a, b)
            if a.manager == b.manager then
                return a.name < b.name
            elseif a.manager then
                return true
            else
                return false
            end
        end)
        hiredList = temphiredList
        WarMenu.OpenMenu("updatemanagers")
    end)

-- ## MENUS
Citizen.CreateThread(function()
    local newRanchInfos = {}
    newRanchInfos.name = ""
    newRanchInfos.price = 0
    newRanchInfos.tax = 0
    WarMenu.CreateMenu('createranch', Config.Language.createranch)
    WarMenu.CreateMenu('buyranch', Config.Language.ranchforsale)
    WarMenu.CreateMenu('ownedranch', Config.Language.ownedranch)
    WarMenu.CreateMenu('canceltaskranch', Config.Language.canceltaskranch)
    WarMenu.CreateSubMenu('confirm', 'createranch', Config.Language.sure)
    WarMenu.CreateSubMenu('confirm2', 'buyranch', Config.Language.sure)
    WarMenu.CreateSubMenu('cattletype', 'ownedranch', Config.Language.buycattle)
    WarMenu.CreateSubMenu('herding', 'ownedranch', Config.Language.selectcattle)
    WarMenu.CreateSubMenu('viewcattle', 'ownedranch', Config.Language.cattle)
    WarMenu.CreateSubMenu('sellcattle', 'ownedranch', Config.Language.cattle)
    WarMenu.CreateSubMenu('choresloc', 'ownedranch', Config.Language.choresloc)
    WarMenu.CreateSubMenu('ranchchores', 'ownedranch', Config.Language.ranchchores)
    WarMenu.CreateSubMenu('upgrades', 'ownedranch', Config.Language.upgrades)
    WarMenu.CreateSubMenu('cowpen', 'ownedranch', Config.Language.cowpen)
    WarMenu.CreateSubMenu('chickenpen', 'ownedranch', Config.Language.chickenpen)
    WarMenu.CreateSubMenu('herdingdog', 'ownedranch', Config.Language.herdingdog)
    WarMenu.CreateSubMenu('ledger', 'ownedranch', Config.Language.ledger)
    WarMenu.CreateSubMenu('bossactions', 'ownedranch', Config.Language.bossactions)
    WarMenu.CreateSubMenu('fire', 'ownedranch', Config.Language.fire)
    WarMenu.CreateSubMenu('updatemanagers', 'ownedranch', Config.Language.updatemanagers)
    while true do
        -- ADMIN - Création du ranch
        if WarMenu.IsMenuOpened('createranch') then
            -- ## NOM
            if WarMenu.Button(Config.Language.ranchname .. newRanchInfos.name) then
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.ranchname, function(cb)
                        newRanchInfos.name = cb
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.ranchname,
                        function(cb)
                            newRanchInfos.name = cb
                        end)
                end
            end
            -- ## PRIX
            if WarMenu.Button(Config.Language.ranchprice .. newRanchInfos.price) then
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.ranchprice, function(cb)
                        local count = tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 then
                            newRanchInfos.price = count
                        else
                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                        end
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.ranchprice,
                        function(cb)
                            local count = tonumber(cb)
                            if count ~= nil and count ~= 0 and count > 0 then
                                newRanchInfos.price = count
                            else
                                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                            end
                        end)
                end
            end
            -- ## TAXE
            if WarMenu.Button(Config.Language.ranchtax .. newRanchInfos.tax .. " $") then
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.ranchtax, function(cb)
                        local count = tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 then
                            newRanchInfos.tax = count
                        else
                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                        end
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.ranchtax, function(cb)
                        local count = tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 then
                            newRanchInfos.tax = count
                        else
                            TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                        end
                    end)
                end
            end
            if WarMenu.MenuButton(Config.Language.confirm, 'confirm') then end
            -- ADMIN - Confirmation de la création d'un ranch à la position de l'Admin
        elseif WarMenu.IsMenuOpened('confirm') then
            if WarMenu.Button(Config.Language.yes) then
                local ranchcoords = GetEntityCoords(PlayerPedId())
                TriggerServerEvent("syn_ranch:createranch", newRanchInfos.name, newRanchInfos.price, ranchcoords,
                    newRanchInfos.tax)
                --creatingranch = false
                WarMenu.CloseMenu()
            end
            if WarMenu.MenuButton(Config.Language.no, 'createranch') then end
            -- JOUEUR - Achat ranch
        elseif WarMenu.IsMenuOpened('buyranch') then
            if playerRanch_Infos.ToBuy_Id ~= nil and playerRanch_Infos.ToBuy_Name ~= nil and playerRanch_Infos.ToBuy_Price ~= nil and playerRanch_Infos.ToBuy_Tax ~= nil then
                if WarMenu.Button(Config.Language.ranchname .. playerRanch_Infos.ToBuy_Name) then end
                if WarMenu.Button(Config.Language.ranchid .. playerRanch_Infos.ToBuy_Id) then end
                if WarMenu.Button(Config.Language.ranchprice .. playerRanch_Infos.ToBuy_Price) then end
                if WarMenu.Button(Config.Language.ranchtax .. playerRanch_Infos.ToBuy_Tax .. " $") then end
                if WarMenu.MenuButton(Config.Language.confirm, 'confirm2') then end
            end
        elseif WarMenu.IsMenuOpened('confirm2') then
            if WarMenu.Button(Config.Language.yes) then
                TriggerServerEvent("syn_ranch:buyaranch", playerRanch_Infos.ToBuy_Price, playerRanch_Infos.ToBuy_Id)
                WarMenu.CloseMenu()
            end
            if WarMenu.MenuButton(Config.Language.no, 'buyranch') then end

            -- JOUEUR - Interractions ranch
        elseif WarMenu.IsMenuOpened('canceltaskranch') then    -- Corvée en cours
            if WarMenu.Button(Config.Language.cancelTask) then -- Je peux décider d'annuler ma corvée en cours
                ranchTaskName = ""
                WarMenu.CloseMenu()
                TriggerEvent("vorp:TipBottom", Config.Language.choreaborted, 4000)
            end
        elseif WarMenu.IsMenuOpened('ownedranch') then
            if WarMenu.Button(Config.Language.ranchname .. playerRanch_Infos.id) then end
            if WarMenu.Button(Config.Language.ranchname .. playerRanch_Infos.ranchName) then end
            if WarMenu.Button(Config.Language.ranchtax .. playerRanch_Infos.ranchTax .. " $") then end
            if WarMenu.Button(Config.Language.enviroment .. playerRanch_Infos.ranchQuality .. " %") then end
            if ranchTaskName ~= "" then -- Une tache est en cours on ne peut pas en prendre une autre
                -- Informations cooldown en cours
                -- Menu Herding en cooldown
                if playerRanch_Infos.coolDownHerding == 1 then -- Une tache de paturage en cours
                    if WarMenu.Button(Config.Language.herdcooldown .. " " .. timer2 .. Config.Language.seconds) then end
                end
                -- Menu Selling en cooldown
                if playerRanch_Infos.coolDownSelling == 1 then -- Une tache de vente de troupeau en cours
                    if WarMenu.Button(Config.Language.salecooldown .. " " .. timer4 .. Config.Language.seconds) then end
                end
                -- Une vache à rentrer à l'étable ?
                if ranchTaskName == "waitcow" then
                    if WarMenu.Button(Config.Language.cowclose) then
                        ranchTaskName = ""
                        if cowmo ~= "" and cowmo ~= nil then
                            DeleteEntity(cowmo)
                        end
                        WarMenu.CloseMenu()
                    end
                end
                -- Menu Milking en cooldown
                if playerRanch_Infos.coolDownMilking == 1 then -- Une tache de traite en cours
                    if WarMenu.Button(Config.Language.milkingcooldown .. " " .. timer7 .. Config.Language.seconds) then end
                end
                -- Les poules à rentrer ?
                if ranchTaskName == "waitchicken" then
                    if WarMenu.Button(Config.Language.chickenclose) then
                        ranchTaskName = ""
                        if chicken ~= nil then
                            for k, v in pairs(chicken) do
                                DeleteEntity(v.chicken)
                            end
                        end
                        WarMenu.CloseMenu()
                    end
                end
                -- Menu Checking en cooldown
                if playerRanch_Infos.coolDownChecking == 1 then -- Une tache de traite en cours
                    if WarMenu.Button(Config.Language.chickencooldown .. " " .. timer8 .. Config.Language.seconds) then end
                end
            else
                -- Menu paturage uniquement si un parcours, un troupeau, pas en cooldown et joueur sans task de ferme
                if playerRanch_Infos.trail ~= nil and playerRanch_Infos.cattle ~= nil and playerRanch_Infos.coolDownHerding == 0 and loc1 then -- on possède au moins un troupeau, un chemin à suivre, pas de tache en cours, et personne n'est en train de s'occuper d'un troupeau
                    if WarMenu.MenuButton(Config.Language.herd, "herding") then end
                else
                    if WarMenu.Button(Config.Language.herdcooldown .. " " .. timer2 .. Config.Language.seconds) then end
                end
                -- Menu vente bétail uniquement si un troupeau, pas en cooldown et joueur sans task de ferme
                if playerRanch_Infos.cattle ~= nil and playerRanch_Infos.coolDownSelling == 0 then
                    if WarMenu.MenuButton(Config.Language.sellcattle, "sellcattle") then end
                else
                    if WarMenu.Button(Config.Language.salecooldown .. " " .. timer4 .. Config.Language.seconds) then end
                end
                -- Consulter le bétail possédé
                if playerRanch_Infos.cattle ~= nil then -- On possède au moins un troupeau, et on à rien d'autre en cours
                    ranchTaskName = ""
                    if WarMenu.MenuButton(Config.Language.viewcattle, "viewcattle") then end
                end
                -- Consulter les corvées
                if playerRanch_Infos.chores ~= nil then -- Des lieux de corvées sont définies
                    if WarMenu.MenuButton(Config.Language.ranchchores, "ranchchores") then end
                end
                -- Menu d'achat de bétail
                if WarMenu.MenuButton(Config.Language.buycattle, 'cattletype') then end
                -- Menu définir parcours de paturage

                -- Menu définir le lieu des corvées

                -- Menu boss du ranch
                if playerRanch_Infos.cowLoc ~= nil and next(playerRanch_Infos.cowLoc) ~= nil and playerRanch_Infos.cowLoc ~= "" then -- l'updgrade enclos est débloqué
                    if WarMenu.MenuButton(Config.Language.cowpen, 'cowpen') then end
                    --if WarMenu.MenuButton(Config.Language.chickenpen,'chickenpen') then end -- on peut rentrer la vache à l'étable -> à voir ?
                end
                -- Menu chicken
                --if playerRanch_Infos.chickensLoc ~= nil and playerRanch_Infos.coolDownChecking == 0 then -- La loc des poulettes est définie personne n'est en train de récolter les oeufs et on n'a pas déjà une tache en cours
                if playerRanch_Infos.chickensLoc ~= nil and next(playerRanch_Infos.chickensLoc) ~= nil and playerRanch_Infos.chickensLoc ~= "" then -- l'upgrade poulailler est débloqué
                    if WarMenu.MenuButton(Config.Language.chickenpen, 'chickenpen') then end
                    --if WarMenu.MenuButton(Config.Language.chickenpen,'chickenpen') then end -- on peut rentrer les poules avant la nuit pour lancer le dépop -> à voir ?
                end
                -- Menu traite
                --if playerRanch_Infos.cowLoc ~= nil and playerRanch_Infos.coolDownMilking == 0 then -- La loc de l'enclos est définie, personne n'est en train de traire et on n'a pas déjà une tache en cours
                if isBoss() or isManager() then
                    if WarMenu.MenuButton(Config.Language.bossactions, 'bossactions') then end
                end
                if playercharid ~= playerRanch_Infos.ranchOwner then
                    if WarMenu.Button(Config.Language.quitranch) then
                        WarMenu.CloseMenu()
                        TriggerServerEvent("syn_ranch:quitranch", playerRanch_Infos.id)
                    end
                end
            end
            -- MENU BOSS
        elseif WarMenu.IsMenuOpened('bossactions') then
            if WarMenu.Button(Config.Language.hire) then
                WarMenu.CloseMenu()
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.id, function(cb)
                        local testid = tonumber(cb)
                        if testid ~= nil and testid ~= 0 and testid > 0 then
                            local playerid = testid
                            TriggerServerEvent("syn_ranch:hireplayer", playerid, playerRanch_Infos.id)
                        end
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.id, function(cb)
                        local testid = tonumber(cb)
                        if testid ~= nil and testid ~= 0 and testid > 0 then
                            local playerid = testid
                            TriggerServerEvent("syn_ranch:hireplayer", playerid, playerRanch_Infos.id)
                        end
                    end)
                end
            end
            if WarMenu.Button(Config.Language.fire) then
                WarMenu.CloseMenu()
                -- Bouton fire? On récupére la liste des joueurs actuellement dans le ranch depuis le serveur. En retour le serveur nous ouvrira le menu
                hiredList = {} -- on intialise la liste
                TriggerServerEvent("syn_ranch:beforefireplayer", playerRanch_Infos.id)
            end
            if WarMenu.MenuButton(Config.Language.ledger, "ledger") then end
            if WarMenu.MenuButton(Config.Language.setchoreslocation, 'choresloc') then end
            if WarMenu.Button(Config.Language.settrail) then
                registering = true
                pedloc = GetEntityCoords(PlayerPedId())
                WarMenu.CloseMenu()
            end
            if WarMenu.MenuButton(Config.Language.upgrades, "upgrades") then end

            if isBoss() then
                if WarMenu.Button(Config.Language.updatemanagers) then
                    WarMenu.CloseMenu()
                    -- Bouton fire? On récupére la liste des joueurs actuellement dans le ranch depuis le serveur. En retour le serveur nous ouvrira le menu
                    hiredList = {} -- on intialise la liste
                    TriggerServerEvent("syn_ranch:beforeupdatemanagers", playerRanch_Infos.id)
                end                --
                if WarMenu.Button(Config.Language.setwebhook) then
                    WarMenu.CloseMenu()
                    if Config.vorp then
                        TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.webhook,
                            function(webhook)
                                if webhook ~= nil and #webhook > 10 then
                                    local ranchhook = webhook
                                    TriggerServerEvent("syn_ranch:setwebhook", ranchhook, playerRanch_Infos.id)
                                end
                            end)
                    elseif Config.redem then
                        TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.webhook,
                            function(webhook)
                                if webhook ~= nil and #webhook > 10 then
                                    local ranchhook = webhook
                                    TriggerServerEvent("syn_ranch:setwebhook", ranchhook, playerRanch_Infos.id)
                                end
                            end)
                    end
                end
                if Config.allowTransfer then
                    if WarMenu.Button(Config.Language.transfer) then
                        WarMenu.CloseMenu()
                        if Config.vorp then
                            TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.id, function(cb)
                                local testid = tonumber(cb)
                                if testid ~= nil and testid ~= 0 and testid > 0 then
                                    local playerid = testid
                                    TriggerServerEvent("syn_ranch:transferplayer", playerid, playerRanch_Infos.id)
                                end
                            end)
                        elseif Config.redem then
                            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.id,
                                function(cb)
                                    local testid = tonumber(cb)
                                    if testid ~= nil and testid ~= 0 and testid > 0 then
                                        local playerid = testid
                                        TriggerServerEvent("syn_ranch:transferplayer", playerid, playerRanch_Infos.id)
                                    end
                                end)
                        end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('fire') then
            if (hiredList) ~= nil then
                for k, v in pairs(hiredList) do
                    local displayname = v.name
                    if v.manager then
                        displayname = v.name .. " (Manager)"
                    end
                    if WarMenu.Button("" .. displayname .. "") then
                        local takeid = v.identifier
                        local takecharid = v.charidentifier
                        local name = v.name
                        TriggerServerEvent("syn_ranch:fireplayer", hiredList, playerRanch_Infos.id, takeid, takecharid,
                            name)
                        WarMenu.CloseMenu()
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('updatemanagers') then
            if (hiredList) ~= nil then
                for k, v in pairs(hiredList) do
                    local displayname = v.name
                    if v.manager then
                        displayname = v.name .. " (Manager)"
                    end
                    if WarMenu.Button("" .. displayname .. "") then
                        local takeid = v.identifier
                        local takecharid = v.charidentifier
                        local name = v.name
                        local manager = true
                        if v.manager then
                            manager = false
                            print(v.name .. " is no longer a manager")
                        else
                            print(v.name .. " is now a manager")
                        end
                        for k2, v2 in pairs(hiredList) do
                            if v2.charidentifier == takecharid then
                                hiredList[k2].manager = manager
                                print("manager updated")
                            end
                        end
                        TriggerServerEvent("syn_ranch:setmanager", hiredList, playerRanch_Infos.id)
                        WarMenu.CloseMenu()
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('ledger') then
            if WarMenu.Button(Config.Language.ledger .. " : " .. playerRanch_Infos.ledger .. " $") then end
            if WarMenu.Button(Config.Language.withdraw) then
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount, function(cb)
                        local count = tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 and playerRanch_Infos.ledger >= count then
                            local take = count
                            WarMenu.CloseMenu()
                            TriggerServerEvent("syn_ranch:withdraw", playerRanch_Infos.id, take)
                        else
                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                        end
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
                        local count = tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 and v.ledger >= count then
                            local take = count
                            WarMenu.CloseMenu()
                            TriggerServerEvent("syn_ranch:withdraw", playerRanch_Infos.id, take)
                        else
                            TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                        end
                    end)
                end
            end
            if WarMenu.Button(Config.Language.deposit) then
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount, function(cb)
                        local count = tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 then
                            local depo = count
                            WarMenu.CloseMenu()
                            TriggerServerEvent("syn_ranch:deposit", playerRanch_Infos.id, depo)
                        else
                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                        end
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
                        local count = tonumber(cb)
                        if count ~= nil and count ~= 0 and count > 0 then
                            local depo = count
                            WarMenu.CloseMenu()
                            TriggerServerEvent("syn_ranch:deposit", playerRanch_Infos.id, depo)
                        else
                            TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                        end
                    end)
                end
            end
        elseif WarMenu.IsMenuOpened('herdingdog') then
            for k, v in pairs(Config.herdingdogs) do
                if WarMenu.Button(k .. " / " .. Config.herdingdogs[k].price .. " $") then
                    local price = Config.herdingdogs[k].price
                    local hash = Config.herdingdogs[k].model
                    TriggerServerEvent("syn_ranch:buydog", playerRanch_Infos.id, price, hash)
                    WarMenu.CloseMenu()
                end
            end
        elseif WarMenu.IsMenuOpened('chickenpen') then
            if isBoss() or isManager() then
                if playerRanch_Infos.eggs > 0 then
                    --if boss then
                    if WarMenu.Button(Config.Language.takeeggs .. " / " .. playerRanch_Infos.eggs) then
                        if Config.vorp then
                            TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount,
                                function(cb)
                                    local count = tonumber(cb)
                                    if count ~= nil and count ~= 0 and count > 0 and playerRanch_Infos.eggs >= count then
                                        local takeeggs = count
                                        WarMenu.CloseMenu()
                                        TriggerServerEvent("syn_ranch:takeeggs", playerRanch_Infos.id, takeeggs)
                                    else
                                        TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                                    end
                                end)
                        elseif Config.redem then
                            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount,
                                function(cb)
                                    local count = tonumber(cb)
                                    if count ~= nil and count ~= 0 and count > 0 and v.eggs >= count then
                                        local takeeggs = count
                                        WarMenu.CloseMenu()
                                        TriggerServerEvent("syn_ranch:takeeggs", playerRanch_Infos.id, takeeggs)
                                    else
                                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                                    end
                                end)
                        end
                    end
                    --end
                end
            end
            if not cooldown5 then
                if playerRanch_Infos.coolDownchecking == 1 then
                    if WarMenu.Button(Config.Language.oncooldown) then end
                else
                    if WarMenu.Button(Config.Language.checkchickens) then
                        WarMenu.CloseMenu()
                        TriggerServerEvent("syn_ranch:startedchecking", playerRanch_Infos.id)
                    end
                end
            else
                if WarMenu.Button(Config.Language.chickencooldown .. " " .. timer8 .. Config.Language.seconds) then end
            end
            if WarMenu.Button(Config.Language.changelocation) then --
                chickenloc2 = true
                WarMenu.CloseMenu()
            end
        elseif WarMenu.IsMenuOpened('cowpen') then
            if isBoss() or isManager() then
                if playerRanch_Infos.milk > 0 then
                    if WarMenu.Button(Config.Language.takemilk .. " / " .. playerRanch_Infos.milk) then
                        if Config.vorp then
                            TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.amount,
                                function(cb)
                                    local count = tonumber(cb)
                                    if count ~= nil and count ~= 0 and count > 0 and playerRanch_Infos.milk >= count then
                                        local takemilk = count
                                        WarMenu.CloseMenu()
                                        TriggerServerEvent("syn_ranch:takemilk", playerRanch_Infos.id, takemilk)
                                    else
                                        TriggerEvent("vorp:TipBottom", Config.Language.invalidamount, 4000)
                                    end
                                end)
                        elseif Config.redem then
                            TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount,
                                function(cb)
                                    local count = tonumber(cb)
                                    if count ~= nil and count ~= 0 and count > 0 and v.milk >= count then
                                        local takemilk = count
                                        WarMenu.CloseMenu()
                                        TriggerServerEvent("syn_ranch:takemilk", playerRanch_Infos.id, takemilk)
                                    else
                                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.invalidamount, 4000)
                                    end
                                end)
                        end
                    end
                end
            end
            if not cooldown4 then -- cooldown4
                if playerRanch_Infos.coolDownMilking == 1 then
                    if WarMenu.Button(Config.Language.oncooldown) then end
                else
                    if WarMenu.Button(Config.Language.milkcows) then
                        WarMenu.CloseMenu()
                        TriggerServerEvent("syn_ranch:startedmilking", playerRanch_Infos.id)
                    end
                end
            else
                if WarMenu.Button(Config.Language.milkingcooldown .. " " .. timer7 .. Config.Language.seconds) then end
            end
            if WarMenu.Button(Config.Language.changelocation) then
                cowpenloc2 = true
                WarMenu.CloseMenu()
            end
        elseif WarMenu.IsMenuOpened('upgrades') then
            if next(playerRanch_Infos.cowLoc) == nil then
                if WarMenu.Button(Config.Language.cowpen .. " / " .. Config.cowpencost .. " $") then
                    cowpenloc = true
                    WarMenu.CloseMenu()
                end
            end
            if next(playerRanch_Infos.chickensLoc) == nil then
                if WarMenu.Button(Config.Language.chickenpen .. " / " .. Config.chickenpencost .. " $") then
                    chickenloc = true
                    WarMenu.CloseMenu()
                end
            end
            if WarMenu.MenuButton(Config.Language.herdingdog, "herdingdog") then end
        elseif WarMenu.IsMenuOpened('ranchchores') then
            local chores = playerRanch_Infos.chores
            if contains(playerRanch_Infos.chores, "racking") and not contains2(activeTasks, "racking") then
                if WarMenu.Button(Config.Language.racking) then
                    chorelocx = chores["racking"].loc
                    ranchTaskName = "racking"
                    WarMenu.CloseMenu()
                end
            end
            if contains(playerRanch_Infos.chores, "hayscope") and not contains2(activeTasks, "hayscope") then
                if WarMenu.Button(Config.Language.hayscope) then
                    chorelocx = chores["hayscope"].loc
                    ranchTaskName = "hayscope"
                    WarMenu.CloseMenu()
                end
            end
            if contains(playerRanch_Infos.chores, "feed") and not contains2(activeTasks, "feed") then
                if WarMenu.Button(Config.Language.feed) then
                    chorelocx = chores["feed"].loc
                    ranchTaskName = "feed"
                    WarMenu.CloseMenu()
                end
            end
            if contains(playerRanch_Infos.chores, "hayspread") and not contains2(activeTasks, "hayspread") then
                if WarMenu.Button(Config.Language.hayspread) then
                    chorelocx = chores["hayspread"].loc
                    ranchTaskName = "hayspread"
                    WarMenu.CloseMenu()
                end
            end
            if contains(playerRanch_Infos.chores, "water") and not contains2(activeTasks, "water") then
                if WarMenu.Button(Config.Language.water) then
                    chorelocx = chores["water"].loc
                    ranchTaskName = "water"
                    WarMenu.CloseMenu()
                end
            end
        elseif WarMenu.IsMenuOpened('choresloc') then
            if WarMenu.Button(Config.Language.racking) then
                regx = true
                ranchDefTask.name = "racking"
                WarMenu.CloseMenu()
            elseif WarMenu.Button(Config.Language.hayscope) then
                regx = true
                ranchDefTask.name = "hayscope"
                WarMenu.CloseMenu()
            elseif WarMenu.Button(Config.Language.feed) then
                regx = true
                ranchDefTask.name = "feed"
                WarMenu.CloseMenu()
            elseif WarMenu.Button(Config.Language.hayspread) then
                regx = true
                ranchDefTask.name = "hayspread"
                WarMenu.CloseMenu()
            elseif WarMenu.Button(Config.Language.water) then
                regx = true
                ranchDefTask.name = "water"
                WarMenu.CloseMenu()
            end
        elseif WarMenu.IsMenuOpened('sellcattle') then
            if playerRanch_Infos.selling == 1 then
                if WarMenu.Button(Config.Language.oncooldown) then end
            else
                cattlex = playerRanch_Infos.cattle
                q_cattlex = playerRanch_Infos.cattleQuality
                distance = playerRanch_Infos.dist
                for m, l in pairs(cattlex) do
                    if l > Config.maxherd then
                        l = Config.maxherd
                    end
                    if WarMenu.Button("" .. m .. " / " .. Config.Language.owned .. " " .. l .. " / " .. Config.Language.quality .. q_cattlex[m]) then
                        for x, z in pairs(Config.cattletypes) do
                            if x == m then
                                TriggerServerEvent("syn_ranch:startedselling", playerRanch_Infos.id, l, m, z) --
                            end
                        end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('viewcattle') then
            cattlex = playerRanch_Infos.cattle
            q_cattlex = playerRanch_Infos.cattleQuality
            distance = playerRanch_Infos.dist
            for m, l in pairs(cattlex) do
                if WarMenu.Button("" .. m .. " / " .. Config.Language.owned .. " " .. l .. " / " .. Config.Language.quality .. q_cattlex[m]) then end
            end
        elseif WarMenu.IsMenuOpened('herding') then
            if playerRanch_Infos.coolDownHerding == 1 then
                if WarMenu.Button(Config.Language.oncooldown) then end
            else
                cattlex = playerRanch_Infos.cattle
                q_cattlex = playerRanch_Infos.cattleQuality
                distance = playerRanch_Infos.dist
                for m, l in pairs(cattlex) do
                    if WarMenu.Button("" .. m .. " / " .. Config.Language.owned .. " " .. l .. " / " .. Config.Language.quality .. q_cattlex[m]) then
                        for x, z in pairs(Config.cattletypes) do
                            if x == m then
                                TriggerServerEvent("syn_ranch:startedherding", playerRanch_Infos.id, l, m, z) --
                            end
                        end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('cattletype') then
            local cattlex = playerRanch_Infos.cattle
            local q_cattlex = playerRanch_Infos.cattleQuality
            local price
            for j, s in pairs(Config.cattletypes) do
                if cattlex == nil then
                    for m, n in pairs(Config.joblock) do
                        if j == m then
                            if n == "none" or n == playerjob then --
                                for r, e in pairs(Config.cattleprice) do
                                    if j == r then
                                        if WarMenu.Button(Config.Language.buy .. j .. " / " .. e .. " $") then
                                            WarMenu.CloseMenu()
                                            if Config.vorp then
                                                TriggerEvent("vorpinputs:getInput", Config.Language.confirm,
                                                    Config.Language.amount, function(cb)
                                                        local count = tonumber(cb)
                                                        if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= count then
                                                            price = e * count
                                                            local herdamount = count
                                                            cattlex[j] = herdamount
                                                            q_cattlex[j] = Config.bougthQuality
                                                            local typeAnimal = j -- The cattle type is captured as `j`

                                                            -- Trigger server event with cattle type and count
                                                            TriggerServerEvent("syn_ranch:buycattle",
                                                                playerRanch_Infos.id,
                                                                cattlex, price, q_cattlex, typeAnimal, count)
                                                        else
                                                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount,
                                                                4000)
                                                        end
                                                    end)
                                            elseif Config.redem then
                                                TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm,
                                                    Config.Language.amount, function(cb)
                                                        local count = tonumber(cb)
                                                        if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= count then
                                                            price = e * count


                                                            local herdamount = count
                                                            cattlex[j] = herdamount
                                                            q_cattlex[j] = Config.bougthQuality
                                                            TriggerServerEvent("syn_ranch:buycattle",
                                                                playerRanch_Infos.id,
                                                                cattlex, price, q_cattlex)
                                                            WarMenu.CloseMenu()
                                                        else
                                                            TriggerEvent("redem_roleplay:ShowObjective",
                                                                Config.Language.invalidamount, 4000)
                                                        end
                                                    end)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif contains(cattlex, j) and Config.maxherd > cattlex[j] then
                    for m, n in pairs(Config.joblock) do
                        if j == m then
                            if n == "none" or n == playerjob then
                                for r, e in pairs(Config.cattleprice) do
                                    if j == r then
                                        if WarMenu.Button(Config.Language.buy .. j .. " / " .. Config.Language.owned .. " " .. cattlex[j] .. " / " .. e) then
                                            WarMenu.CloseMenu()
                                            if Config.vorp then
                                                TriggerEvent("vorpinputs:getInput", Config.Language.confirm,
                                                    Config.Language.amount, function(cb)
                                                        local count = tonumber(cb)
                                                        if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= (count + cattlex[j]) then
                                                            price = e * count
                                                            local herdamount = count + cattlex[j]
                                                            --local herd_q = Config.bougthQuality + q_cattlex[j]
                                                            local herd_q = ((count * Config.bougthQuality) + (q_cattlex[j] * cattlex[j])) /
                                                                herdamount
                                                            cattlex[j] = herdamount
                                                            q_cattlex[j] = herd_q
                                                            typeAnimal = j
                                                            TriggerServerEvent("syn_ranch:buycattle",
                                                                playerRanch_Infos.id,
                                                                cattlex, price, q_cattlex, typeAnimal, count)
                                                        else
                                                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount,
                                                                4000)
                                                        end
                                                    end)
                                            elseif Config.redem then
                                                TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm,
                                                    Config.Language.amount, function(cb)
                                                        local count = tonumber(cb)
                                                        if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= (count + cattlex[j]) then
                                                            price = e * count


                                                            local herdamount = count + cattlex[j]
                                                            local herd_q = count + q_cattlex[j]
                                                            cattlex[j] = herdamount
                                                            q_cattlex[j] = herd_q
                                                            TriggerServerEvent("syn_ranch:buycattle",
                                                                playerRanch_Infos.id,
                                                                cattlex, price, q_cattlex)
                                                            WarMenu.CloseMenu()
                                                        else
                                                            TriggerEvent("redem_roleplay:ShowObjective",
                                                                Config.Language.invalidamount, 4000)
                                                        end
                                                    end)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                elseif not contains(cattlex, j) and cattlex[j] == nil then
                    for m, n in pairs(Config.joblock) do
                        if j == m then
                            if n == "none" or n == playerjob then
                                for r, e in pairs(Config.cattleprice) do
                                    if j == r then
                                        if WarMenu.Button(Config.Language.buy .. j .. " / " .. e) then
                                            WarMenu.CloseMenu()
                                            if Config.vorp then
                                                TriggerEvent("vorpinputs:getInput", Config.Language.confirm,
                                                    Config.Language.amount, function(cb)
                                                        local count = tonumber(cb)
                                                        if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= count then
                                                            price = e * count
                                                            local herdamount = count
                                                            cattlex[j] = herdamount
                                                            q_cattlex[j] = Config.bougthQuality
                                                            typeAnimal = j
                                                            TriggerServerEvent("syn_ranch:buycattle",
                                                                playerRanch_Infos.id,
                                                                cattlex, price, q_cattlex, typeAnimal, count)
                                                        else
                                                            TriggerEvent("vorp:TipBottom", Config.Language.invalidamount,
                                                                4000)
                                                        end
                                                    end)
                                            elseif Config.redem then
                                                TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm,
                                                    Config.Language.amount, function(cb)
                                                        local count = tonumber(cb)
                                                        if count ~= nil and count ~= 0 and count > 0 and Config.maxherd >= count then
                                                            price = e * count


                                                            local herdamount = count
                                                            cattlex[j] = herdamount
                                                            q_cattlex[j] = Config.bougthQuality
                                                            TriggerServerEvent("syn_ranch:buycattle",
                                                                playerRanch_Infos.id,
                                                                cattlex, price, q_cattlex)
                                                            WarMenu.CloseMenu()
                                                        else
                                                            TriggerEvent("redem_roleplay:ShowObjective",
                                                                Config.Language.invalidamount, 4000)
                                                        end
                                                    end)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            ----------------------------------------------------------
        end
        WarMenu.Display()
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("syn_ranch:afterstartedselling")
AddEventHandler("syn_ranch:afterstartedselling", function(l, m, z)
    -- La vente se déclenche au signal du serveur
    for x, z in pairs(Config.cattletypes) do
        if x == m then
            herdno = l
            herdhash = z
            WarMenu.CloseMenu()
            ranchlocation = playerRanch_Infos.location
            typeAnimal = m
        end
    end
    startsale = true
end)

RegisterNetEvent("syn_ranch:afterstartedherding")
AddEventHandler("syn_ranch:afterstartedherding", function(l, m, z)
    -- La transhumance se déclenche au signal du serveur
    ranchTaskName = "herding"
    herdno = l
    herdhash = z
    WarMenu.CloseMenu()
    local trailx = playerRanch_Infos.trail
    for u, g in pairs(trailx) do
        loc1 = g.loc1
        loc2 = g.loc2
        loc3 = g.loc3
        loc4 = g.loc4
    end
    ranchlocation = playerRanch_Infos.location
    startherd = true
    typeAnimal = m
    if dog ~= "0" then
        if Config.vorp then
            TriggerEvent("vorp:TipBottom", Config.Language.dogg .. Config.herdingdogcommand .. Config.Language.tome, 4000)
        elseif Config.redem then
            TriggerEvent("redem_roleplay:ShowObjective",
                Config.Language.dogg .. Config.herdingdogcommand .. Config.Language.tome, 4000)
        end
    end
end)

RegisterNetEvent("syn_ranch:afterbuycattle")
AddEventHandler("syn_ranch:afterbuycattle", function()
    WarMenu.CloseMenu()
end)

RegisterNetEvent("syn_ranch:menuclosed")
AddEventHandler("syn_ranch:menuclosed", function()
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
    if playerRanch_Infos.id then
        TriggerServerEvent("syn_ranch:removeactivemenu", playerRanch_Infos.id)
    end
    -- Remove the sale state
    playerRanch_Infos.ToBuy_Id = nil
    playerRanch_Infos.ToBuy_Name = nil
    playerRanch_Infos.ToBuy_Price = nil
    playerRanch_Infos.ToBuy_Tax = nil
    --if inranch then
    --  inranch = false
    --end
    -- if creatingranch then
    --  creatingranch = false
    --  ranchname = ""
    --  ranchprice = 0
    --end
end)

RegisterNetEvent("syn_ranch:endcurrenttask")
AddEventHandler("syn_ranch:endcurrenttask", function()
    ranchTaskName = ""
end)

--

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if justspawned then
            Citizen.Wait(100000)
            justspawned = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if justspawned2 then
            Citizen.Wait(100000)
            justspawned2 = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if cooldown then
            Citizen.Wait(Config.straycooldownherd)
            cooldown = false
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if cooldown3 then
            Citizen.Wait(Config.straycooldownsale)
            cooldown3 = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if cooldown2 then
            Citizen.Wait(Config.wolfcooldown)
            cooldown2 = false
        end
    end
end)




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if onme2 then
            Citizen.Wait(300000)
            onme2 = false
        end
    end
end)


-- Function to handle distance check and trigger event
function CheckDistanceAndTrigger(herd, goal, ontheway, reachdist, message, bliptext, loc)
    local allWithin = true
    for k, v in pairs(herd) do
        local hcoords = GetEntityCoords(v.goat)
        local caldist = GetDistanceBetweenCoords(goal.x, goal.y, goal.z, hcoords.x, hcoords.y, hcoords.z, 0)
        if caldist > reachdist then
            allWithin = false
            break
        end
    end
    if allWithin and ontheway then
        TriggerEvent("vorp:TipBottom", message, 8000)
        RemoveBlip(blipHerdz)
        blipHerdz = Citizen.InvokeNative(0x554D9D53F696D002, -1282792512, loc.x, loc.y, loc.z, 5) --creates blip
        Citizen.InvokeNative(0x9CB1A1623062F402, blipHerdz, bliptext)                             --names blip
        return true
    end
    return false
end

-- Function to handle herd movement
function MoveHerdToGoal(herd, goal)
    Wait(1000)
    for k, v in pairs(herd) do
        FreezeEntityPosition(v.goat, false)
        ClearPedTasks(v.goat)
        TaskGoToCoordAnyMeans(v.goat, goal.x, goal.y, goal.z, 1.5, 0, 0, 0, 0)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local sleep = true
        if not onme and ontheway then
            sleep = false
            if not first then
                goal = playerRanch_Infos.trail[1]["loc1"] -- this is important
                local reset = CheckDistanceAndTrigger(herd, goal, ontheway, reachdist, Config.Language.herdzStep2,
                    Config.herdzBlipStep2, loc2)
                if reset then
                    goal = playerRanch_Infos.trail[1]["loc2"]
                    MoveHerdToGoal(herd, goal)
                    first = true
                    print("first")
                end
            elseif first and not sec then
                local reset = CheckDistanceAndTrigger(herd, goal, ontheway, reachdist, Config.Language.herdzStep3,
                    Config.herdzBlipStep3, loc3)
                if reset then
                    goal = playerRanch_Infos.trail[1]["loc3"]
                    MoveHerdToGoal(herd, goal)
                    sec = true
                    print("sec")
                end
            elseif sec and not third then
                local reset = CheckDistanceAndTrigger(herd, goal, ontheway, reachdist, Config.Language.herdzStep4,
                    Config.herdzBlipStep4, loc4)
                if reset then
                    goal = playerRanch_Infos.trail[1]["loc4"]
                    MoveHerdToGoal(herd, goal)
                    third = true
                    print("third")
                end
            elseif third and not fourth then
                local reset = CheckDistanceAndTrigger(herd, goal, ontheway, reachdist, Config.Language.herdzStep5,
                    Config.herdzBlipStep3, loc3)
                if reset then
                    goal = playerRanch_Infos.trail[1]["loc3"]
                    MoveHerdToGoal(herd, goal)
                    fourth = true
                    print("fourth")
                end
            elseif fourth and not fifth then
                local reset = CheckDistanceAndTrigger(herd, goal, ontheway, reachdist, Config.Language.herdzStep6,
                    Config.herdzBlipStep2, loc2)
                if reset then
                    goal = playerRanch_Infos.trail[1]["loc2"]
                    MoveHerdToGoal(herd, goal)
                    fifth = true
                    print("fifth")
                end
            elseif fifth and not sixth then
                local reset = CheckDistanceAndTrigger(herd, goal, ontheway, reachdist, Config.Language.herdzStep7,
                    Config.herdzBlipStep1, loc1)
                if reset then
                    goal = playerRanch_Infos.trail[1]["loc1"]
                    MoveHerdToGoal(herd, goal)
                    sixth = true
                    print("sixth")
                end
            end
            if first and sec and third and fourth and fifth and sixth then
                sleep = false
                for k, v in pairs(herd) do
                    local hcoords = GetEntityCoords(v.goat)
                    local gcoords = playerRanch_Infos.trail[1]["loc1"]
                    local isDead = IsEntityDead(v.goat)

                    local caldist = GetDistanceBetweenCoords(gcoords.x, gcoords.y, gcoords.z, hcoords.x, hcoords.y,
                        hcoords.z, 0)

                    if reachdist > caldist and not reachedtimerout and not isDead then
                        print(reachdist, caldist, reachedtimerout, "reached")
                        reached = true
                        print("test321")
                        DeleteEntity(v.goat)
                        finalnumber = finalnumber + 1
                        timer3 = Config.reachedtimer
                        startcoords = nil
                    end
                end
            end
            if sleep then
                Wait(500)
            end
        end
    end
end)
----


-- TROUPEAU 2 - Vente de bétail
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        for k, v in pairs(herd) do
            local xcoords = GetEntityCoords(v.goat)
            local isDead = IsEntityDead(v.goat)
            for f, g in pairs(Config.cattlesale) do
                local caldist = GetDistanceBetweenCoords(g.Pos.x, g.Pos.y, g.Pos.z, xcoords.x, xcoords.y, xcoords.z, 0)
                if reachdist > caldist and ontheway2 and not reachedtimerout2 and not isDead then
                    reached2 = true
                    print("test32")
                    DeleteEntity(v.goat)
                    finalnumber = finalnumber + 1
                    timer5 = Config.reachedtimer
                end
            end
        end
    end
end)
-- TROUPEAU -- Gestion de la mort d'une tête de bétail.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if ontheway and not reached then
            if not firsttimeherd and 0 >= #herd then
                Wait(3000)
                firsttimeherd = true
            end
            for k, v in pairs(herd) do
                if IsEntityDead(v.goat) then
                    print(v.goat, "is dead")
                    table.remove(herd, k)
                    herdno = herdno - 1
                    q_cattlex[typeAnimal] = q_cattlex[typeAnimal] - (q_cattlex[typeAnimal] * 0.1)
                    if Config.pvp then -- Qui est le méchant joueur pvp qui a tué mon zanimal ?
                        local PedKiller = GetPedSourceOfDeath(v.goat)
                        if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
                            Killer = NetworkGetPlayerIndexFromPed(PedKiller)
                        elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
                            Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
                        end
                        if (Killer ~= PlayerId()) then
                            local killz = GetPlayerServerId(Killer)
                            if killz ~= nil then
                                if Config.vorp then
                                    TriggerEvent("vorp:TipBottom", Config.Language.herddie, 4000)
                                elseif Config.redem then
                                    TriggerEvent("redem_roleplay:Tip", Config.Language.herddie, 4000)
                                end
                                TriggerServerEvent("syn_ranch:rewardkiller", typeAnimal, killz)
                            end
                            killz = nil
                        end
                    end
                end
            end
            if 0 >= #herd then
                herdno = 0
                failedherding = true
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if ontheway2 and not reached2 then
            for o, p in pairs(herd) do
                TaskGoToEntity(p.goat, PlayerPedId(), -1, 1.5, 2.0, 0, 0)
                local coo = GetEntityCoords(PlayerPedId())
                TaskGoToCoordAnyMeans(p.goat, coo.x, coo.y, coo.z, 1.5, 0, 0, 0, 0)
                Citizen.InvokeNative(0x489FFCCCE7392B55, p.goat, PlayerPedId()) --Follow
            end
            for k, v in pairs(herd) do
                if IsEntityDead(v.goat) then
                    table.remove(herd, k)
                    herdno = herdno - 1
                    q_cattlex[typeAnimal] = q_cattlex[typeAnimal] - (q_cattlex[typeAnimal] * 0.1)
                    if Config.pvp then
                        local PedKiller = GetPedSourceOfDeath(v.goat)
                        if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
                            Killer = NetworkGetPlayerIndexFromPed(PedKiller)
                        elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
                            Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
                        end
                        if (Killer ~= PlayerId()) then
                            local killz = GetPlayerServerId(Killer)
                            if killz ~= nil then
                                if Config.vorp then
                                    TriggerEvent("vorp:TipBottom", Config.Language.herddie, 4000)
                                elseif Config.redem then
                                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.herddie, 4000)
                                end
                                TriggerServerEvent("syn_ranch:rewardkiller", typeAnimal, killz)
                            end
                            killz = nil
                        end
                    end
                end
            end
            if 0 >= #herd then
                herdno = 0
                failedherding2 = true
            end
        end
    end
end)
-- TROUPEAU 2 - ECHEC
Citizen.CreateThread(function() -- findme
    while true do
        Citizen.Wait(100)

        if ontheway2 and not reached2 then
            if IsEntityDead(PlayerPedId()) or timeout2 or failedherding2 then -- le joueur est mort, le timeout atteint, ou c'est l'échec de la mission
                print("timeout2", timeout2, "failedherding2", failedherding2, "ontheway2", ontheway2, "reached2",
                    reached2)
                for k, v in pairs(herd) do
                    DeleteEntity(v.goat) -- On supprime la bête
                    print("test12")
                end
                for k, v in pairs(wolfs) do
                    DeleteEntity(v.wolfz) -- On supprime un loup éventuel -- TODO tester s'il est en vie. Si mort ne pas le supprimer
                end
                DeleteEntity(dogg)        -- On supprime notre toutou gardien de troupeau
                ontheway2 = false
                if herdno > 1 then        -- En cas d'échec on perd la moitié du troupeau ???
                    finalnumber = round(herdno / 2)
                    q_cattlex[typeAnimal] = round(q_cattlex[typeAnimal] / 2)
                else
                    finalnumber = 0
                end
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.failed, 4000)
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.failed, 4000)
                end
                Citizen.Wait(100)
                if finalnumber ~= 0 then
                    cattlex[typeAnimal] = finalnumber
                elseif 0 >= finalnumber then
                    cattlex[typeAnimal] = nil
                    q_cattlex[typeAnimal] = nil
                end
                if q_cattlex[typeAnimal] == nil or 0 >= q_cattlex[typeAnimal] then
                    cattlex[typeAnimal] = nil
                    q_cattlex[typeAnimal] = nil
                end
                TriggerServerEvent("syn_ranch:finishedherding", playerRanch_Infos.id, cattlex, q_cattlex)
            end
        end
    end
end)

-- TROUPEAU 1 - ECHEC
Citizen.CreateThread(function() -- findme
    while true do
        Citizen.Wait(100)

        if ontheway and not reached then
            if IsEntityDead(PlayerPedId()) or timeout or failedherding then
                print(timeout, failedherding, "timeout,failedherding")
                goal = {}
                for k, v in pairs(herd) do
                    DeleteEntity(v.goat)
                    print("test1112")
                end
                for k, v in pairs(wolfs) do
                    DeleteEntity(v.wolfz) -- On supprime un loup éventuel -- TODO tester s'il est en vie. Si mort ne pas le supprimer
                end
                DeleteEntity(dogg)
                ontheway = false

                print(finalnumber, "finalnumber")
                print(herdno, "herdno")
                if herdno > Config.maxherd or 0 > herdno then
                    herdno = Config.maxherd
                end
                if finalnumber > Config.maxherd or 0 > finalnumber then
                    finalnumber = Config.maxherd - 1
                end

                if herdno > 1 then
                    finalnumber = round(herdno / 2)
                    q_cattlex[typeAnimal] = round(q_cattlex[typeAnimal] / 2)
                else
                    finalnumber = 0
                end
                Citizen.Wait(100)
                local deleted = herdno - finalnumber
                if finalnumber ~= 0 then
                    cattlex[typeAnimal] = finalnumber
                elseif 0 >= finalnumber then
                    cattlex[typeAnimal] = nil
                    q_cattlex[typeAnimal] = nil
                end
                if q_cattlex[typeAnimal] == nil or 0 >= q_cattlex[typeAnimal] then
                    cattlex[typeAnimal] = nil
                    q_cattlex[typeAnimal] = nil
                end

                if Config.vorp then
                    if q_cattlex[typeAnimal] == nil then
                        TriggerEvent("vorp:TipBottom", Config.Language.failed .. Config.Language.reportHerdzStressed,
                            10000)
                    else
                        TriggerEvent("vorp:TipBottom",
                            Config.Language.failed ..
                            finalnumber ..
                            Config.Language.reportHerdzCountLive .. deleted .. Config.Language.reportHerdzCountDeath,
                            10000)
                    end
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.failed, 4000)
                end

                TriggerServerEvent("syn_ranch:finishedherding", playerRanch_Infos.id, cattlex, q_cattlex)
                failedherding = false
                reached = false
                first = false
                sec = false
                third = false
                fourth = false
                fifth = false
                sixth = false
                reset = false
                reset2 = false
                reset3 = false
                reset4 = false
                reset5 = false
                reset6 = false
                reachedtimerout = false
                timeout = false
                timer3 = Config.reachedtimer
                timer = Config.herdtimer
                finalnumber = 0
                herd = {}
                RemoveBlip(blipHerdz) --removes the blip
            end
        end
    end
end)
--[[ Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true
        -- Function to handle timers
        local function handleTimer(timerName, flagName, cooldownName, resetValue, entityName, invincibleName)
            if _G[timerName] >= 0 and _G[flagName] then
                sleep = false
                Citizen.Wait(1000)
                if _G[timerName] > 0 then
                    _G[timerName] = _G[timerName] - 1
                end
                if 0 >= _G[timerName] then
                    _G[cooldownName] = false
                    if entityName then
                        SetPlayerInvincible(_G[entityName], false)
                        DeleteEntity(_G[entityName])
                    end
                    if invincibleName then
                        for k, v in pairs(_G[invincibleName]) do
                            SetPlayerInvincible(v.chicken, false)
                            DeleteEntity(v.chicken)
                        end
                    end
                    if resetValue then
                        _G[timerName] = Config[resetValue]
                    end
                end
            end
        end

        -- Handle timers
        handleTimer("timer", "ontheway", "timeout")
        handleTimer("timer6", "ontheway2", "timeout2")
        handleTimer("timer3", "reached", "reachedtimerout")
        handleTimer("timer5", "reached2", "reachedtimerout2")
        handleTimer("timer7", "cooldown4", nil, nil, "cowmo")
        handleTimer("timer8", "cooldown5", nil, nil, nil, "chicken")
        handleTimer("timer2", "herdingcooldown", nil, "herdingcooldown")
        handleTimer("timer4", "herdingcooldown2", nil, "salecooldown")

        -- Sleep if no timers are active
        if sleep then
            Citizen.Wait(500)
        end
    end
end) ]]

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true
        -- Timer for ontheway
        if timer >= 0 and ontheway then
            sleep = false
            Citizen.Wait(1000)
            if timer > 0 then
                timer = timer - 1
            end
            if 0 >= timer then
                timeout = true
            end
        end

        -- Timer for ontheway2
        if timer6 >= 0 and ontheway2 then
            sleep = false
            Citizen.Wait(1000)
            if timer6 > 0 then
                timer6 = timer6 - 1
            end
            if 0 >= timer6 then
                timeout2 = true
            end
        end

        -- Timer for reached
        if timer3 >= 0 and reached then
            sleep = false
            Citizen.Wait(1000)
            if timer3 > 0 then
                timer3 = timer3 - 1
            end
            if 0 >= timer3 then
                reachedtimerout = true
            end
        end

        -- Timer for reached2
        if timer5 >= 0 and reached2 then
            sleep = false
            Citizen.Wait(1000)
            if timer5 > 0 then
                timer5 = timer5 - 1
            end
            if 0 >= timer5 then
                reachedtimerout2 = true
            end
        end

        -- Timer for cooldown4
        if timer7 >= 0 and cooldown4 then
            sleep = false
            Citizen.Wait(1000)
            if timer7 > 0 then
                timer7 = timer7 - 1
            end
            if 0 >= timer7 then
                cooldown4 = false
                SetPlayerInvincible(cowmo, false)
                DeleteEntity(cowmo)
                cheater = false
            end
        end

        -- Timer for cooldown5
        if timer8 >= 0 and cooldown5 then
            sleep = false
            Citizen.Wait(1000)
            if timer8 > 0 then
                timer8 = timer8 - 1
            end
            if 0 >= timer8 then
                cooldown5 = false
                for k, v in pairs(chicken) do
                    SetPlayerInvincible(v.chicken, false)
                    DeleteEntity(v.chicken)
                end
            end
        end

        -- Timer for herdingcooldown
        if timer2 >= 0 and herdingcooldown then
            sleep = false
            Citizen.Wait(1000)
            if timer2 > 0 then
                timer2 = timer2 - 1
            end
            if 0 >= timer2 then
                herdingcooldown = false
                timer2 = Config.herdingcooldown
            end
        end

        -- Timer for herdingcooldown2
        if timer4 >= 0 and herdingcooldown2 then
            sleep = false
            Citizen.Wait(1000)
            if timer4 > 0 then
                timer4 = timer4 - 1
            end
            if 0 >= timer4 then
                herdingcooldown2 = false
                timer4 = Config.salecooldown
            end
        end
        if sleep then
            Wait(500)
        end
    end
end)
-- TROUPEAU 2 - SUCCES VENTE
Citizen.CreateThread(function() --  findme
    while true do
        Citizen.Wait(100)
        if reached2 and 0 >= timer5 then
            print("SUCCES VENTE", reached2, timer5)
            local quality = 0
            local num
            ontheway2 = false
            if Config.vorp then
                TriggerEvent("vorp:TipBottom", Config.Language.finished, 4000)
            elseif Config.redem then
                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.finished, 4000)
            end
            for k, v in pairs(herd) do
                DeleteEntity(v.goat)
                print("SUPPRESSION", v.goat)
            end
            for k, v in pairs(wolfs) do
                DeleteEntity(v.wolfz) -- On supprime un loup éventuel -- TODO tester s'il est en vie. Si mort ne pas le supprimer
            end
            DeleteEntity(dogg)
            reached2 = false
            reachedtimerout2 = false
            timeout2 = false
            timer6 = Config.selltimer
            timer5 = Config.reachedtimer
            herd = {}
            if finalnumber ~= herdno then
                local deleted = herdno - finalnumber
                q_cattlex[typeAnimal] = q_cattlex[typeAnimal] - ((q_cattlex[typeAnimal] * 0.1) * deleted)
            end
            if finalnumber ~= 0 then
                cattlex[typeAnimal] = finalnumber
                quality = q_cattlex[typeAnimal]
                num = finalnumber
            elseif 0 >= finalnumber then
                cattlex[typeAnimal] = nil
                q_cattlex[typeAnimal] = nil
                quality = 0
                num = 0
            end
            cattlex[typeAnimal] = nil
            q_cattlex[typeAnimal] = nil
            TriggerServerEvent("syn_ranch:rewardsale", playerRanch_Infos.id, cattlex, q_cattlex, quality, num, typeAnimal)
            finalnumber = 0
        end
    end
end)

-- TROUPEAU 1 - SUCCES
Citizen.CreateThread(function() -- findme
    while true do
        Citizen.Wait(100)
        if reached and 0 >= timer3 then
            print(reached, timer3, "reached")
            goal = {}
            ontheway = false
            for k, v in pairs(herd) do
                DeleteEntity(v.goat)
                print("test121")
            end
            for k, v in pairs(wolfs) do
                DeleteEntity(v.wolfz) -- On supprime un loup éventuel -- TODO tester s'il est en vie. Si mort ne pas le supprimer
            end
            DeleteEntity(dogg)
            reached = false
            first = false
            sec = false
            third = false
            fourth = false
            fifth = false
            sixth = false
            reset = false
            reset2 = false
            reset3 = false
            reset4 = false
            reset5 = false
            reset6 = false
            timeout = false
            timer3 = Config.reachedtimer
            reachedtimerout = false
            local deleted = 0
            herd = {}
            print(finalnumber, "finalnumber")
            print(herdno, "herdno")
            if herdno > Config.maxherd then
                herdno = Config.maxherd
            end
            if finalnumber > Config.maxherd then
                finalnumber = Config.maxherd - 1
            end
            if finalnumber ~= herdno then
                deleted = herdno - finalnumber
                q_cattlex[typeAnimal] = q_cattlex[typeAnimal] - ((q_cattlex[typeAnimal] * 0.1) * deleted)
            end
            if finalnumber ~= 0 then
                cattlex[typeAnimal] = finalnumber
                if Config.maxquality > q_cattlex[typeAnimal] then
                    q_cattlex[typeAnimal] = (q_cattlex[typeAnimal] + finalnumber) * distance
                end
            elseif 0 >= finalnumber then
                cattlex[typeAnimal] = nil
                q_cattlex[typeAnimal] = nil
            end
            if playerRanch_Infos.ranchQuality == 0 then
                playerRanch_Infos.ranchQuality = 1
            end
            q_cattlex[typeAnimal] = q_cattlex[typeAnimal] * (playerRanch_Infos.ranchQuality / 100)
            if Config.qualitybuff then
                q_cattlex[typeAnimal] = q_cattlex[typeAnimal] * Config.qualitybuffvalue
            end
            if q_cattlex[typeAnimal] > Config.maxquality then
                q_cattlex[typeAnimal] = Config.maxquality
            end

            if Config.vorp then
                if q_cattlex[typeAnimal] == nil then
                    TriggerEvent("vorp:TipBottom", Config.Language.finished .. Config.Language.reportHerdzStressed, 10000)
                else
                    TriggerEvent("vorp:TipBottom",
                        Config.Language.finished ..
                        finalnumber ..
                        Config.Language.reportHerdzCountLive .. deleted .. Config.Language.reportHerdzCountDeath, 10000)
                end
            elseif Config.redem then
                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.finished, 4000)
            end

            TriggerServerEvent("syn_ranch:finishedherding", playerRanch_Infos.id, cattlex, q_cattlex)
            TriggerServerEvent("syn_ranch:giveselection", typeAnimal, finalnumber)

            finalnumber = 0
            RemoveBlip(blipHerdz) --removes the blip
        end
    end
end)
-- TROUPEAU 1 - PATURE - onme = on appelle toutou pour ramener le troupeau au joueur
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if ontheway then
            for k, v in pairs(herd) do
                if dog ~= "0" then -- Avec un chien gardien de troupeau
                    local xcoords = GetEntityCoords(v.goat)
                    local ycoords = GetEntityCoords(dogg)
                    local zcoords = GetEntityCoords(PlayerPedId())
                    local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y,
                        xcoords.z, 0)
                    local caldist = GetDistanceBetweenCoords(ycoords.x, ycoords.y, ycoords.z, xcoords.x, xcoords.y,
                        xcoords.z, 0)
                    if caldist2 > Config.herdcheckdist and caldist > 15 and ontheway and not v.stray and not onme then -- Troupeau trop loin du joueur : il attend le joueur
                        ClearPedTasks(v.goat)
                        FreezeEntityPosition(v.goat, true)
                        v.far = true
                    elseif v.far and (8 > caldist2 or 15 > caldist) and not v.stray and not onme then -- Un membre du troupeau trop loin, les autres bêtes le rejoignent ?
                        FreezeEntityPosition(v.goat, false)
                        TaskGoToCoordAnyMeans(v.goat, goal.x, goal.y, goal.z, 1.5, 0, 0, 0, 0)

                        v.far = false
                    end
                else -- Sans le chien
                    local xcoords = GetEntityCoords(v.goat)
                    local zcoords = GetEntityCoords(PlayerPedId())
                    local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y,
                        xcoords.z, 0)
                    if caldist2 > Config.herdcheckdist and ontheway and not v.stray and not onme then
                        ClearPedTasks(v.goat)
                        FreezeEntityPosition(v.goat, true)
                        v.far = true
                    elseif v.far and 8 > caldist2 and not v.stray and not onme then
                        FreezeEntityPosition(v.goat, false)
                        TaskGoToCoordAnyMeans(v.goat, goal.x, goal.y, goal.z, 1.5, 0, 0, 0, 0)

                        v.far = false
                    end
                end
            end
        end
    end
end)
-- TROUPEAU 2 - PATURE - Pas de chien gardien de troupeau
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if ontheway2 then
            for k, v in pairs(herd) do
                local xcoords = GetEntityCoords(v.goat)
                local zcoords = GetEntityCoords(PlayerPedId())
                local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y,
                    xcoords.z, 0)
                if caldist2 > 20 and ontheway2 and not v.stray then -- La bête trop loin attend le joueur
                    ClearPedTasks(v.goat)
                    FreezeEntityPosition(v.goat, true)
                    v.far = true
                elseif v.far and reachdist > caldist2 and not v.stray then -- La bête essaye de suivre le joueur par tous moyens
                    FreezeEntityPosition(v.goat, false)
                    TaskGoToEntity(v.goat, PlayerPedId(), -1, 1.5, 2.0, 0, 0)
                    Citizen.InvokeNative(0x489FFCCCE7392B55, v.goat, PlayerPedId()) --Follow
                    local coo = GetEntityCoords(PlayerPedId())
                    TaskGoToCoordAnyMeans(v.goat, coo.x, coo.y, coo.z, 1.5, 0, 0, 0, 0)

                    v.far = false
                end
            end
        end
    end
end)


-- TROUPEAU 2 - Dissidence d'un membre du troupeau - Stray = s'égarer
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if not justspawned2 and ontheway2 then
            for k, v in pairs(herd) do
                if ontheway2 and not v.far and not v.stray then
                    Citizen.Wait(5000)
                    local straychance = math.random(1, 10)
                    if straychance > Config.stray and not cooldown3 then
                        freakout = GetEntityCoords(v.goat)
                        cooldown3 = true
                        v.stray = true
                        local hcoords = GetEntityCoords(v.goat)
                        v.orgcoords = hcoords
                        ClearPedTasks(v.goat)
                        FreezeEntityPosition(v.goat, false)
                        TaskGoToCoordAnyMeans(v.goat, hcoords.x + 20, hcoords.y + 20, hcoords.z, 1.5, 0, 0, 0, 0.5)
                    end
                end
            end
        end
    end
end)


-- TROUPEAU 1 - Event - Spawn d'un loup
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local x, y, z
        if not justspawned and ontheway then
            for k, v in pairs(herd) do
                if ontheway and not v.far and not v.stray and not cooldown2 then
                    Citizen.Wait(9000)
                    local straychance = math.random(1, 15)
                    if straychance > Config.wolf and not cooldown2 then
                        cooldown2 = true
                        attack = true
                    end
                end
            end
            if attack then
                for i = 1, herdno / 2 do
                    local wolf
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 10.5, 10.5, 1.15))
                    wolf = GetHashKey("a_c_wolf")
                    RequestModel(wolf)
                    while not HasModelLoaded(wolf) do
                        Wait(10)
                    end
                    wolf = CreatePed("a_c_wolf", x, y, z, true, true, true)
                    attack = false
                    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, wolf, 1, 0)
                    Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, wolf)
                    table.insert(wolfs, {
                        wolfz = wolf
                    })
                end
            end
        end
    end
end)
-- TROUPEAU 1 - Dissidence d'un membre du troupeau - Stray = s'égarer - Avec chien
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if not justspawned and ontheway then
            for k, v in pairs(herd) do
                if ontheway and not v.far and not v.stray then
                    Citizen.Wait(5000)
                    local straychance = math.random(1, 10)
                    if straychance > Config.stray and not cooldown then
                        freakout = GetEntityCoords(v.goat)
                        cooldown = true
                        v.stray = true
                        local hcoords = GetEntityCoords(v.goat)
                        v.orgcoords = hcoords
                        ClearPedTasks(v.goat)
                        FreezeEntityPosition(v.goat, false)
                        TaskGoToCoordAnyMeans(v.goat, hcoords.x + 20, hcoords.y + 20, hcoords.z, 1.5, 0, 0, 0, 0.5)
                        if dog ~= "0" then
                            ClearPedTasks(dogg)
                            TaskGoToEntity(dogg, v.goat, -1, 1.5, 2.0, 0, 0)
                            local coo = GetEntityCoords(v.goat)
                            TaskGoToCoordAnyMeans(dogg, coo.x, coo.y, coo.z, 1.5, 0, 0, 0, 0)
                            Citizen.InvokeNative(0x489FFCCCE7392B55, dogg, v.goat)
                        end
                    end
                end
            end
        end
    end
end)
-- TROUPEAU - Gestion des bêtes égarées - Interraction avec le chien ou avec le joueur
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if ontheway then
            for k, v in pairs(herd) do
                if v.stray then
                    if dog ~= "0" then
                        Citizen.Wait(5000)
                        local xcoords = GetEntityCoords(v.goat)
                        local zcoords = GetEntityCoords(PlayerPedId())
                        local ycoords = GetEntityCoords(dogg)
                        local hasdog = false
                        local caldist = GetDistanceBetweenCoords(ycoords.x, ycoords.y, ycoords.z, xcoords.x, xcoords.y,
                            xcoords.z, 0)
                        local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y,
                            xcoords.z, 0)
                        if 5 > caldist2 or 5 > caldist then
                            ClearPedTasks(v.goat)
                            SetBlockingOfNonTemporaryEvents(farm2, true)
                            TaskGoToCoordAnyMeans(v.goat, freakout.x, freakout.y, freakout.z, 1.5, 0, 0, 0, 0.5)
                            v.far = false
                            TaskGoToCoordAnyMeans(v.goat, goal.x, goal.y, goal.z, 1.5, 0, 0, 0, 0)
                            Citizen.Wait(15000)
                            v.stray = false
                            v.far = false
                            ClearPedTasks(dogg)
                            TaskGoToEntity(dogg, PlayerPedId(), -1, 3.5, 2.0, 0, 0)
                            local coo = GetEntityCoords(PlayerPedId())
                            TaskGoToCoordAnyMeans(dogg, coo.x, coo.y, coo.z, 1.5, 0, 0, 0, 0)
                            Citizen.InvokeNative(0x489FFCCCE7392B55, dogg, PlayerPedId())
                        end
                    else
                        Citizen.Wait(5000)
                        local xcoords = GetEntityCoords(v.goat)
                        local zcoords = GetEntityCoords(PlayerPedId())
                        local hasdog = false
                        local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y,
                            xcoords.z, 0)
                        if 5 > caldist2 then
                            ClearPedTasks(v.goat)
                            SetBlockingOfNonTemporaryEvents(farm2, true)
                            TaskGoToCoordAnyMeans(v.goat, freakout.x, freakout.y, freakout.z, 1.5, 0, 0, 0, 0.5)
                            v.stray = false
                            v.far = false
                            Citizen.Wait(10000)

                            TaskGoToCoordAnyMeans(v.goat, goal.x, goal.y, goal.z, 1.5, 0, 0, 0, 0)
                        end
                    end
                end
            end
        end
    end
end)
-- TROUPEAU - Gestion des bêtes égarées - Interraction avec le joueur
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if ontheway2 then
            for k, v in pairs(herd) do
                if v.stray then
                    Citizen.Wait(5000)
                    local xcoords = GetEntityCoords(v.goat)
                    local zcoords = GetEntityCoords(PlayerPedId())
                    local caldist2 = GetDistanceBetweenCoords(zcoords.x, zcoords.y, zcoords.z, xcoords.x, xcoords.y,
                        xcoords.z, 0)
                    if 5 > caldist2 then
                        ClearPedTasks(v.goat)
                        SetBlockingOfNonTemporaryEvents(farm2, true)
                        TaskGoToCoordAnyMeans(v.goat, freakout.x, freakout.y, freakout.z, 1.5, 0, 0, 0, 0.5)
                        v.stray = false
                        v.far = false
                        Citizen.Wait(10000)
                        TaskGoToEntity(v.goat, PlayerPedId(), -1, 1.5, 2.0, 0, 0)
                        local coo = GetEntityCoords(PlayerPedId())
                        TaskGoToCoordAnyMeans(v.goat, coo.x, coo.y, coo.z, 1.5, 0, 0, 0, 0)
                        Citizen.InvokeNative(0x489FFCCCE7392B55, v.goat, PlayerPedId()) --Follow
                    end
                end
            end
        end
    end
end)

function round(x)
    return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
end

function AnIndexOf(t, val)
    for k, v in ipairs(t) do
        if v == val then return k end
    end
end

local function getIndex(tab, val)
    local index = nil
    for i, v in ipairs(tab) do
        if (v.id == val) then
            index = i
        end
    end
    return index
end

-- Affichage Timers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if timer > 0 and ontheway and not reached then
            drawtext(Config.Language.timerxz .. timer, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if timer6 > 0 and ontheway2 and not reached2 then
            drawtext(Config.Language.timerxz .. timer6, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if timer3 > 0 and reached then
            drawtext(Config.Language.timerxz .. timer3, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if timer5 > 0 and reached2 then
            drawtext(Config.Language.timerxz .. timer5, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
        end
    end
end)
-- Infos joueur, ranch et reset blips
Citizen.CreateThread(function()
    if Config.vorp then
        Citizen.Wait(3000)
        --TriggerServerEvent("syn_ranch:getplayerinfo")
        TriggerServerEvent("syn_ranch:getranchinfo")
        Citizen.Wait(3000)
        TriggerEvent("syn_ranch:resetblips")
        TriggerEvent("syn_ranch:blip")
    end
end)



-- RANCH - Menu
RegisterNetEvent("syn_ranch:createranch")
AddEventHandler("syn_ranch:createranch", function()
    creatingranch = true
    WarMenu.OpenMenu('createranch')
end)

-- TROUPEAU - START 2
RegisterNetEvent("syn_ranch:herdg")
AddEventHandler("syn_ranch:herdg", function()
    if not ontheway2 then
        initHerdVar() -- Reset variables
        timer6 = Config.selltimer
        timer3 = Config.reachedtimer
        if typeAnimal == "chicken" then -- More time for chickens
            timer6 = timer6 * 1.5
        end
        justspawned2 = true
        reached2 = false
        reachedtimerout2 = false
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.5, 0.5, -0.35))
        z = z + 0.2
        for i = 1, herdno do
            local attempt = 0
            local maxAttempts = 5
            local animalCreated = false
            local farm2

            while attempt < maxAttempts and not animalCreated do
                attempt = attempt + 1
                x = x + 0.2
                y = y + 0.2
                local skin = nil
                if herdhash == "A_C_Pronghorn_01" then
                    skin = 2
                end
                local animalHash = GetHashKey(herdhash)
                RequestModel(animalHash)
                while not HasModelLoaded(animalHash) do
                    Wait(10)
                end
                farm2 = CreatePed(animalHash, x, y, z, true, true, true)
                SetBlockingOfNonTemporaryEvents(farm2, true)
                Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)
                Citizen.InvokeNative(0xAE6004120C18DF97, farm2, 0, false)
                if skin then
                    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, tonumber(skin))
                end
                Wait(1000)

                -- Check if the animal exists and is not dead
                if DoesEntityExist(farm2) and not IsEntityDead(farm2) then
                    animalCreated = true
                else
                    -- Delete the invalid entity to prevent leaks
                    if DoesEntityExist(farm2) then
                        DeleteEntity(farm2)
                    end
                    -- Wait a bit before trying again
                    Wait(100)
                end
            end

            if animalCreated then
                table.insert(herd, {
                    goat = farm2,
                    stray = false,
                    far = false
                })
            else
                -- Handle the failure to create an animal after 5 attempts
                print("Failed to create animal after 5 attempts in syn_ranch:herdg")
            end
        end

        -- Once created, each animal approaches the player
        for o, p in pairs(herd) do
            TaskGoToEntity(p.goat, PlayerPedId(), -1, 1.5, 2.0, 0, 0)
            local coo = GetEntityCoords(PlayerPedId())
            TaskGoToCoordAnyMeans(p.goat, coo.x, coo.y, coo.z, 1.5, 0, 0, 0, 0)
            Citizen.InvokeNative(0x489FFCCCE7392B55, p.goat, PlayerPedId()) -- Follow
        end
        ontheway2 = true
    end
end)

-- TROUPEAU - START avec chien
RegisterNetEvent("syn_ranch:herdz")
AddEventHandler("syn_ranch:herdz", function()
    if not ontheway then
        initHerdVar() -- Reset variables
        timer = Config.herdtimer
        timer5 = Config.reachedtimer
        justspawned = true
        reached = false
        reachedtimerout = false
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.5, 0.5, -0.35))
        z = z + 0.2
        for i = 1, herdno do
            local attempt = 0
            local maxAttempts = 5
            local animalCreated = false
            local farm2

            while attempt < maxAttempts and not animalCreated do
                attempt = attempt + 1
                x = x + 0.2
                y = y + 0.2
                local skin = nil
                if herdhash == "A_C_Pronghorn_01" then
                    skin = 2
                end
                local animalHash = GetHashKey(herdhash)
                RequestModel(animalHash)
                while not HasModelLoaded(animalHash) do
                    Wait(10)
                end
                farm2 = CreatePed(animalHash, x, y, z, true, true, true)
                SetBlockingOfNonTemporaryEvents(farm2, true)
                Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)
                Citizen.InvokeNative(0xAE6004120C18DF97, farm2, 0, false)
                if skin then
                    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, tonumber(skin))
                end
                Wait(1000)
                -- Check if the animal exists and is not dead
                if DoesEntityExist(farm2) and not IsEntityDead(farm2) then
                    animalCreated = true
                else
                    -- Delete the invalid entity to prevent leaks
                    if DoesEntityExist(farm2) then
                        DeleteEntity(farm2)
                    end
                    -- Wait a bit before trying again
                    Wait(100)
                end
            end

            if animalCreated then
                table.insert(herd, {
                    goat = farm2,
                    stray = false,
                    far = false
                })
            else
                -- Handle the failure to create an animal after 5 attempts
                print("Failed to create animal after 5 attempts in syn_ranch:herdz")
            end
        end

        if dog ~= "0" then
            local attemptDog = 0
            local maxAttemptsDog = 5
            local dogCreated = false

            while attemptDog < maxAttemptsDog and not dogCreated do
                attemptDog = attemptDog + 1
                local dogHash = GetHashKey(dog)
                RequestModel(dogHash)
                while not HasModelLoaded(dogHash) do
                    Wait(10)
                end
                dogg = CreatePed(dogHash, x, y, z, true, true, true)
                SetBlockingOfNonTemporaryEvents(dogg, true)
                Citizen.InvokeNative(0x77FF8D35EEC6BBC4, dogg, 1, 0)
                TaskGoToEntity(dogg, PlayerPedId(), -1, 3.5, 2.0, 0, 0)
                local coo = GetEntityCoords(PlayerPedId())
                TaskGoToCoordAnyMeans(dogg, coo.x, coo.y, coo.z, 1.5, 0, 0, 0, 0)
                Citizen.InvokeNative(0x489FFCCCE7392B55, dogg, PlayerPedId())

                -- Check if the dog exists and is not dead
                if DoesEntityExist(dogg) and not IsEntityDead(dogg) then
                    dogCreated = true
                else
                    -- Delete the invalid entity to prevent leaks
                    if DoesEntityExist(dogg) then
                        DeleteEntity(dogg)
                    end
                    -- Wait a bit before trying again
                    Wait(100)
                end
            end

            if not dogCreated then
                -- Handle the failure to create the dog after 5 attempts
                print("Failed to create dog after 5 attempts in syn_ranch:herdz")
            end
        end

        -- Creation of an invisible entity to direct the herd...
        for o, p in pairs(herd) do
            local coo = playerRanch_Infos.trail[1]["loc1"]
            print("coo.x = " .. coo.x .. " coo.y = " .. coo.y .. " coo.z = " .. coo.z)
            TaskGoToCoordAnyMeans(p.goat, coo.x, coo.y, coo.z, 1.5, 0, 0, 0, 0)
        end
        blipHerdz = Citizen.InvokeNative(0x554D9D53F696D002, -1282792512, loc1.x, loc1.y, loc1.z, 5) -- Creates blip
        Citizen.InvokeNative(0x9CB1A1623062F402, blipHerdz, Config.Language.herdzBlipStep1)          -- Names blip
        TriggerEvent("vorp:TipBottom", Config.Language.herdzStep1, 10000)

        ontheway = true
    end
end)


function initHerdVar() -- Intialisation des variables des étapes du paturage.
    failedherding = false
    reached = false
    first = false
    sec = false
    third = false
    fourth = false
    fifth = false
    sixth = false
    reset = false
    reset2 = false
    reset3 = false
    reset4 = false
    reset5 = false
    reset6 = false
    reachedtimerout = false
    timeout = false
    finalnumber = 0
    herd = {}
end

function contains(table, element)
    for k, v in pairs(table) do
        if k == element then
            return true
        end
    end
    return false
end

RegisterNUICallback('send', function(data)
    SetNuiFocus(false, false)
    score = tonumber(data.score)
end)
RegisterNetEvent("syn_ranch:score")
AddEventHandler("syn_ranch:score", function()
    playerRanch_Infos.chores[ranchTaskName].num = playerRanch_Infos.chores[ranchTaskName].num + 1
    if score == nil then
        score = 1
    end
    if Config.maxscorelock then
        if score > Config.maxscore then
            score = Config.maxscore
        end
    end
    TriggerServerEvent("syn_ranch:updatetasks", playerRanch_Infos.id, playerRanch_Infos.chores, score, ranchTaskName)
end)
-- Fin traite des vaches
RegisterNetEvent("syn_ranch:score2")
AddEventHandler("syn_ranch:score2", function()
    if playerRanch_Infos.ranchQuality == 0 then
        playerRanch_Infos.ranchQuality = 1
    end
    local balance = score
    if Config.reducedmilk then
        balance = score / 2
    end
    local milk = balance * (playerRanch_Infos.ranchQuality / 100)
    local final = round(milk)
    TriggerServerEvent("syn_ranch:finishedmilking", playerRanch_Infos.id, final)
end)
-- Fin récolte des oeufs
RegisterNetEvent("syn_ranch:score3")
AddEventHandler("syn_ranch:score3", function()
    if playerRanch_Infos.ranchQuality == 0 then
        playerRanch_Infos.ranchQuality = 1
    end
    local balance = score
    if Config.reducedeggs then
        balance = score / 2
    end
    local eggs = balance * (playerRanch_Infos.ranchQuality / 100)
    local final = round(eggs)
    TriggerServerEvent("syn_ranch:finishedchecking", playerRanch_Infos.id, final)
end)

-- ACTIONS - Gestion touche des actions : ratisser, creuser, nourrir les poulets, étendre le foin, tirer de l'eau
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        --if starttask then
        if (ranchTaskName == "racking" or ranchTaskName == "hayscope" or ranchTaskName == "feed" or ranchTaskName == "hayspread" or ranchTaskName == "water") then
            local loc = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(chorelocx.x, chorelocx.y, chorelocx.z, loc.x, loc.y, loc.z, 0)
            if dist > 3 then
                drawtext(Config.Language.gotoloc, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, chorelocx.x, chorelocx.y, chorelocx.z, 0.0, 0.0, 0.0,
                    0, 0.0, 0.0, 2.0, 2.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false)
            elseif dist <= 3 then
                drawtext(Config.Language.starttask, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["G"]) then
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        action = "show",
                        pic = ranchTaskName,
                    })

                    exports['progressBars']:startUI(32000, Config.Language.working)

                    if ranchTaskName == "racking" then
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FARMER_RAKE"), 32000, true, false,
                            false, false)
                    elseif ranchTaskName == "hayscope" then
                        shovelanim()
                    elseif ranchTaskName == "feed" then
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_FEED_CHICKEN"), 32000, true,
                            false, false, false)
                    elseif ranchTaskName == "hayspread" then
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_PITCH_HAY_SPREAD"), 32000, true,
                            false, false, false)
                    elseif ranchTaskName == "water" then
                        for i = 1, 5 do
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_PLAYER_CHORES_BUCKET_POUR_HIGH"),
                                15000, true, false, false, false)
                            Citizen.Wait(2000)
                        end
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_PLAYER_CHORES_BUCKET_POUR_LOW"), 15000,
                            true, false, false, false)
                    end
                    Citizen.Wait(32000)
                    TriggerEvent("syn_ranch:score")
                    ClearPedTasks(PlayerPedId())
                    --starttask = false
                    ranchTaskName = ""
                    Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), false, true)
                end
            end
        end
    end
end)

-- ACTIONS - ANIM - Lait
function CrouchAnim()
    local dict = "mech_milking"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "milking_loop_player", 1.0, 8.0, -1, 1, 0, false, false, false)
end

-- ACTIONS - ANIM - Oeuf
function egganim()
    local dict = "mech_pickup@loot_body@dead_hogtie_face_up@transitions"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "rt_to_loot", 1.0, 8.0, -1, 1, 0, false, false, false)
end

-- ACTIONS - ANIM - Pelle
function shovelanim()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_SHOVEL_COAL_PICKUP"), 32000, true, false, false,
        false)
    local dict = "mech_pickup@mp_treasure@grab_01"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    local ped = PlayerPedId()
    TaskPlayAnim(ped, dict, "base", 1.0, 8.0, -1, 1, 0, false, false, false)
end

-- ACTIONS - Progression - LAIT
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ranchTaskName == "Milking" then
            local showprompt = false
            local locxx = GetEntityCoords(PlayerPedId())
            local locyy = GetEntityCoords(cowmo)
            local dist = GetDistanceBetweenCoords(locxx.x, locxx.y, locxx.z, locyy.x, locyy.y, locyy.z, 0)
            if dist > 3 then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, locyy.x, locyy.y, locyy.z, 0.0, 0.0, 0.0, 0, 0.0,
                    0.0, 2.0, 2.0, 1.0, 100, 1, 1, 190, false, true, 2, false, false, false, false)
                drawtext(Config.Language.gotocow, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            elseif 3 >= dist then
                if not showprompt then
                    drawtext(Config.Language.gtomilk, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                end
                if whenKeyJustPressed(Config.keys["G"]) then
                    showprompt = true
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        action = "show",
                        pic = "milk",
                    })

                    exports['progressBars']:startUI(32000, Config.Language.working)

                    CrouchAnim()
                    Citizen.Wait(32000)
                    ClearPedTasks(PlayerPedId())
                    TriggerEvent("syn_ranch:score2")
                    timer7 = Config.milkingcooldown
                    cooldown4 = true
                    ranchTaskName = "waitcow"
                    --milking = false
                    FreezeEntityPosition(cowmo, false)
                end
            end
        end
    end
end)

-- ACTIONS - LAIT - Spawn vache
RegisterNetEvent("syn_ranch:spawncow") --
AddEventHandler("syn_ranch:spawncow", function()
    local cowstuff = playerRanch_Infos.cowLoc
    local location = cowstuff["loc"]
    cowmo = GetHashKey("a_c_cow")
    RequestModel(cowmo)
    while not HasModelLoaded(cowmo) do
        Wait(10)
    end
    cowmo = CreatePed("a_c_cow", location.x, location.y, location.z, true, true, true)
    SetBlockingOfNonTemporaryEvents(cowmo, true)
    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, cowmo, 1, 0)
    Citizen.InvokeNative(0xAE6004120C18DF97, cowmo, 0, false)

    Wait(1000)
    FreezeEntityPosition(cowmo, true)
    ranchTaskName = "Milking"
    --milking = true
end)
-- ACTIONS - Progression - OEUF
Citizen.CreateThread(function() --
    while true do
        Citizen.Wait(0)
        if ranchTaskName == "Checking" then
            local chickenstuff = playerRanch_Infos.chickensLoc
            local showprompt = false
            local locxx = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(locxx.x, locxx.y, locxx.z, chickenstuff["loc"].x, chickenstuff["loc"]
                .y, chickenstuff["loc"].z, 0)
            if dist > 3 then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, chickenstuff["loc"].x, chickenstuff["loc"].y,
                    chickenstuff["loc"].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 100, 1, 1, 190, false, true, 2,
                    false, false, false, false)
                drawtext(Config.Language.gotochicken, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            elseif dist <= 3 then
                if not showprompt then
                    drawtext(Config.Language.gotochicken, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                end
                if whenKeyJustPressed(Config.keys["G"]) then
                    showprompt = true
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        action = "show",
                        pic = "eggs",
                    })

                    exports['progressBars']:startUI(32000, Config.Language.working)

                    egganim()
                    Citizen.Wait(32000)
                    ClearPedTasks(PlayerPedId())
                    TriggerEvent("syn_ranch:score3")
                    timer8 = Config.chickenscooldown
                    cooldown5 = true
                    ranchTaskName = "waitchicken"
                    --cchecking = false
                    for k, v in pairs(chicken) do
                        FreezeEntityPosition(v.chicken, false)
                    end
                end
            end
        end
    end
end)
-- ACTIONS - OEUF - Spawn poulets
RegisterNetEvent("syn_ranch:spawnchickens")
AddEventHandler("syn_ranch:spawnchickens", function()
    local chickenstuff = playerRanch_Infos.chickensLoc
    local location = chickenstuff["loc"]
    if location == nil or location == "" then
        -- Pas de position des poulets ?
    else
        for i = 1, 4 do
            local farm2 = GetHashKey("a_c_chicken_01")
            RequestModel(farm2)
            while not HasModelLoaded(farm2) do
                Wait(10)
            end
            farm2 = CreatePed("a_c_chicken_01", location.x, location.y, location.z, true, true, true)
            SetBlockingOfNonTemporaryEvents(farm2, true)
            Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)
            Citizen.InvokeNative(0xAE6004120C18DF97, farm2, 0, false)

            Wait(1000)
            FreezeEntityPosition(farm2, true)
            table.insert(chicken, {
                chicken = farm2,
            })
        end
    end
    ranchTaskName = "Checking"
    --cchecking = true
end)

-- Gestion de la mort d'une vache pendant la traite - Eviter une tricherie pour finir plus vite la récolte du lait en tuant la vache ?
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if (cooldown4 or ranchTaskName == "Milking") and not cheater then
            if IsEntityDead(cowmo) then
                local PedKiller = GetPedSourceOfDeath(cowmo)
                if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
                    Killer = NetworkGetPlayerIndexFromPed(PedKiller)
                elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
                    Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
                end
                if (Killer == PlayerId()) then
                    local killz = GetPlayerServerId(Killer)
                    if killz ~= nil then
                        TriggerServerEvent("syn_ranch:catchcheater", killz)
                        cheater = true
                        if ranchTaskName == "Milking" then
                            ranchTaskName = ""
                        end
                    end
                    killz = nil
                else
                    local killz = GetPlayerServerId(Killer)
                    if killz ~= nil then
                        TriggerServerEvent("syn_ranch:catchcheater2", killz)
                    end
                end
            end
        end
    end
end)

-- UTILITAIRES
function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end

    for i = 1, #players, 1 do
        local tgt = GetPlayerPed(players[i])
        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
                playerid = GetPlayerServerId(players[i])
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return closestPlayer, closestDistance, playerid, tgt1
end

function drawtext(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then
        SetTextDropshadow(1, 0, 0, 0, 255)
    end
    Citizen.InvokeNative(0xADA9255D, 10);
    DisplayText(str, x, y)
end

function contains2(table, element)
    for k, v in pairs(table) do
        if v == element then
            return true
        end
    end
    return false
end

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end
