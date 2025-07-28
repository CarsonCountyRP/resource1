--THREAD
local lootedNpcs = {}
CreateThread(function()
    repeat Wait(5000) until LocalPlayer.state.IsInSession

    while true do
        local sleep = 0
        local size = GetNumberOfEvents(0)
        if size > 0 then
            for i = 0, size - 1 do
                local eventAtIndex = GetEventAtIndex(0, i)
                if eventAtIndex == `EVENT_LOOT_COMPLETE` then
                    local eventDataSize = 3
                    local eventDataStruct = DataView.ArrayBuffer(128)
                    eventDataStruct:SetInt32(0, 0)
                    eventDataStruct:SetInt32(8, 0)
                    eventDataStruct:SetInt32(16, 0)
                    local is_data_exists = Citizen.InvokeNative(0x57EC5FA4D4D6AFCA, 0, i, eventDataStruct:Buffer(), eventDataSize)
                    if is_data_exists then -- can contiue
                        local looter = eventDataStruct:GetInt32(0)
                        local entity = eventDataStruct:GetInt32(8)
                        local is_looted = eventDataStruct:GetInt32(16)
                        if is_looted == 1 then
                            if IsPedHuman(entity) then
                                if PlayerPedId() == looter then
                                    if Citizen.InvokeNative(0x8DE41E9902E85756, entity) then -- _IS_ENTITY_FULLY_LOOTED
                                        local netid = NetworkGetNetworkIdFromEntity(entity)
                                        if not lootedNpcs[netid] then
                                            lootedNpcs[netid] = true
                                            TriggerServerEvent("npcloot:give_reward", netid)
                                        else
                                            print("already looted")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent("npcloot:looted", function(netid)
    lootedNpcs[netid] = nil
end)
