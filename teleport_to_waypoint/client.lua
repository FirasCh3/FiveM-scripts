RegisterCommand("teleport", function()
    local waypoint = GetFirstBlipInfoId(8)
    StartPlayerTeleport(PlayerId(), GetBlipInfoIdCoord(waypoint).x, GetBlipInfoIdCoord(waypoint).y,
        GetBlipInfoIdCoord(waypoint).z, 0.0, true, true, true)
end)