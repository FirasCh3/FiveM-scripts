AddEventHandler("onResourceStart", function()
    SetWeaponDamageModifier(911657153, 0.1)
end)

AddEventHandler("entityDamaged", function(victim, culprit, weapon, baseDamage)
    if culprit == PlayerPedId() and weapon == 911657153 then
        if (HasEntityBeenDamagedByWeapon(victim, 911657153, 0)) then
            randomDuration = math.random(10000, 20000)
            SetPedMinGroundTimeForStungun(victim, randomDuration)
        end
    end
end)
