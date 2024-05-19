ESX = exports['es_extended']:getSharedObject()

ESX.RegisterUsableItem("zombiemask", function(source, item)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    TriggerClientEvent("masks:client:zom", src, item.name)
end)