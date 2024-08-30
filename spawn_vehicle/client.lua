RegisterCommand("despawn", function()
    playerCoords = GetEntityCoords(PlayerPedId())
    allVehicles = GetGamePool("CVehicle")
    for index, vehicle in pairs(allVehicles) do
        vehicleCoords = GetEntityCoords(vehicle)
        if #(playerCoords - vehicleCoords) < 3 then
            SetEntityAsMissionEntity(vehicle, true, true)
            DeleteVehicle(vehicle)
        end
    end
end)

RegisterCommand("spawn", function()
    playerCoords = GetEntityCoords(PlayerPedId())
    ped = GetHashKey("csb_abigail")
    vehicle = GetHashKey("adder")
    RequestModel(ped)
    RequestModel(vehicle)
    while not HasModelLoaded(ped) do
        RequestModel(ped)
        Citizen.Wait(1)
    end
    while not HasModelLoaded(vehicle) do
        RequestModel(vehicle)
        Citizen.Wait(1)
    end
    local createdVehicle = CreateVehicle(vehicle, playerCoords.x + 2, playerCoords.y + 2, playerCoords.z + 2, 0.0, false,
        true)
    local newPed = CreatePed(5, ped, playerCoords.x + 4, playerCoords.y + 4, playerCoords.z + 4, 0.0, false, true)
    TaskWarpPedIntoVehicle(newPed, createdVehicle, -1)
    SetModelAsNoLongerNeeded(ped)
    SetModelAsNoLongerNeeded(vehicle)
    SetEntityAsNoLongerNeeded(newPed)
end)
