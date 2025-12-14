local config = require 'shared.config'

function getItem(src, item)
    if config.core.inventory == 'ox_inventory' then 
        local x = exports.ox_inventory:GetItemCount(src, item)
        if x == 0 then 
            return false 
        else 
            return true 
        end
    elseif config.core.inventory == 'qs-inventory' then 
        local x = exports['qs-inventory']:GetItemTotalAmount(src, item)
        if x == 0 then 
            return false 
        else 
            return true
        end
    else 
        print('Unable to find inventory')
    end
end

function addMoney(src, amount, mtype)
    if config.core.framework == 'qbx_core' then 
        return exports.qbx_core:AddMoney(src, mtype, amount, 'ATM-Robbery')
    elseif config.core.framework == 'qb-core' then 
        local qbcore = exports['qb-core']:GetCoreObject()
        local player = qbcore.Functions.GetPlayer(src)
        if not player then return end 
        return player.Functions.AddMoney(mtype, amount)
    else 
        print('Unable to find core')
    end
end

function removeItem(src, item, amount)
    if config.core.inventory == 'ox_inventory' then 
        return exports.ox_inventory:RemoveItem(src, item, amount)
    elseif config.core.inventory == 'qs-inventory' then 
        return exports['qs-inventory']:RemoveItem(src, item, amount) 
    else 
        print('Unable to find inventory')
    end
end

function cLog(text, lvl)
    if lvl == 'error' then 
        lib.print.error(text)
    elseif lvl == 'warn' then 
        lib.print.warn(text)
    elseif lvl == 'info' then 
        lib.print.info(text)
    elseif lvl == 'debug' then 
        lib.print.debug(text)
    end
end

function notify(source, title, ntype)
    if config.core.notify == 'ox_lib' then 
        local data = {title = title, type = ntype}
        return TriggerClientEvent('ox_lib:notify', source, data)
    elseif config.core.notify == 'qb-core' then 
        local qbcore = exports['qb-core']:GetCoreObject()
        return qbcore.Functions.Notify(source, title, ntype)
    elseif config.core.notify == 'vms_notifyv2' then 
        local data = {title = title, type = ntype}
        return TriggerClientEvent('vms_notifyv2:Notification', source, data)
    elseif config.core.notify == 'okokNotify' then 
         return TriggerClientEvent('okokNotify:Notification', source, data)
    end
end