local config = require 'shared.config'

function sendDisptach()
    if not config.police.enabled then return end
    if config.police.dispatch == 'tk_dispatch' then 
        -- Coming Soon
    elseif config.police.dispatch == 'ps-disptach' then
        -- Coming Soon
    elseif config.police.dispatch == 'qs-disptach' then
        -- Coming Soon
    elseif config.police.dispatch == 'custom' then
        -- Write your own exports here
    else 
        return print('Unable to find a dispatch')
    end
end

function progressBar()
    if config.core.progress == 'ox_lib-bar' then 
        if lib.progressBar({
            duration = config.hacking.duration * 1000,
            label = 'Connecting Hacked USB..',
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
                move = true,
                combat = true
            },
            anim = {
                dict = 'missheist_jewel@hacking',
                clip = 'hack_loop'
            },
        }) then 
            return true
        else return false end
    elseif config.core.progress == 'ox_lib-circle' then 
        if lib.progressCircle({
            duration = config.hacking.duration * 1000,
            label = 'Connecting Hacked USB..',
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
                move = true,
                combat = true
            },
            anim = {
                dict = 'missheist_jewel@hacking',
                clip = 'hack_loop'
            },
        }) then 
            return true
        else return false end
    elseif config.core.progress == 'ox_lib' then 
        return false
    else 
        return print('Unable to find progress bar.')
    end
    end

function checkJob()
    if config.core.framework == 'qbx_core' then 
        return exports.qbx_core:HasGroup(config.hacking.blacklisted)
    elseif config.core.framework == 'qb-core' then 
        local qbcore = exports['qb-core']:GetCoreObject()
        local plr = qbcore.Functions.GetPlayerData()
        for i, v in pairs(config.hacking.blacklisted) do 
            if v == plr.job.name then return false end
        end
        return true
    end
end

function skillCheck()
    if config.core.skillcheck == 'ox_lib' then 
        return lib.skillCheck(config.hacking.skillcheck.difficulty, config.hacking.skillcheck.inputs)
    end
end

function notify(title, ntype)
    if config.core.notify == 'ox_lib' then 
        return lib.notify({title = title, type = ntype})
    elseif config.core.notify == 'qb-core' then 
        local qbcore = exports['qb-core']:GetCoreObject()
        return qbcore.Functions.Notify(title, ntype)
    elseif config.core.notify == 'vms_notifyv2' then 
        return exports['vms_notifyv2']:Notification({title = title, type = ntype})
    elseif config.core.notify == 'okokNotify' then 
         return exports['okokNotify']:Alert({title = title, type = ntype})
    end
end