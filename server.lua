ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand(Config.Command, function(source, args, raw)
    TriggerClientEvent('LRP-RepairZone:Repair', source)
end)

ESX.RegisterServerCallback('LRP-RepairZone:RemoveMoney', function(source, cb, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (xPlayer.getMoney() >= price) then
        print ('->LRP-RepairZones: Retiro de Efectivo: $' .. price .. " - ID " .. source)
        xPlayer.removeMoney(price)
        cb(true)
    elseif (xPlayer.getBank() >= price) then
        print ('->LRP-RepairZones: Retiro de Banco: $' .. price .. " - ID " .. source)
        xPlayer.removeAccountMoney('bank', price)
        cb(true)
    else
        print ('->LRP-RepairZones: No tiene dinero suficiente' .. " - ID " .. source)
        cb(false)
    end
end)