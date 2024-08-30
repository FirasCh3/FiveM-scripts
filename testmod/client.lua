function spawnCar()
    local car = GetHashKey("club")
    local coords = GetEntityCoords(PlayerPedId())
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Wait(500)
    end
    CreateVehicle(car, coords.x + 1, coords.y + 1, coords.z + 1, 0.0, true, false)
end

RegisterCommand("spawnvehicle", function()
    spawnCar()
end)
