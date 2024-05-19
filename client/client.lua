ESX = exports['es_extended']:getSharedObject()
local wearing = false

RegisterNetEvent('masks:client:zom', function(itemName)
    local ped = PlayerPedId()
    local gender = GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") and "female" or "male"

    if gender == "male" then
        if not wearing then
            TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
            lib.progressCircle({
                duration = 3000,
                label = "Putting mask on..",
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                anim = {
                    dict = 'mp_masks@standard_car@ds@',
                    clip = 'put_on_mask',
                }
            })
            Citizen.Wait(500)
            exports['zombies_script']:setProtectionTime(99999999999)
            SetPedComponentVariation(PlayerPedId(), 1, Config.MaleMaskID, Config.MaleMaskTextureID)
            wearing = true
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        elseif wearing then
            TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
            lib.progressCircle({
                duration = 3000,
                label = "Putting mask off..",
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                anim = {
                    dict = 'anim@mp_player_intuppersmoke',
                    clip = 'idle_a',
                }
            })
            Citizen.Wait(500)
            exports['zombies_script']:setProtectionTime(0) 
            SetPedComponentVariation(PlayerPedId(), 1, 0, 0)
            wearing = false
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end
    end
    print(gender)
end)






