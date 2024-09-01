Citizen.CreateThread(function()
    while true do
        allPeds = GetGamePool("CPed")
        playerCoords = GetEntityCoords(PlayerPedId())
        for index, ped in pairs(allPeds) do
            if not IsPedAPlayer(ped) then
                pedCoords = GetEntityCoords(ped)
                if #(playerCoords - pedCoords) < 1500 and IsPedInAnyVehicle(ped, false) and not IsPlayerFreeAimingAtEntity(PlayerId(), ped) then
                    TaskSetBlockingOfNonTemporaryEvents(ped, true)
                elseif IsPlayerFreeAimingAtEntity(PlayerId(), ped) then
                    TaskSetBlockingOfNonTemporaryEvents(ped, false)
                end
            end
        end
        Wait(1000)
    end
end)
