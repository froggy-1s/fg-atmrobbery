local active = {}
local config = require 'shared.config'
function getActive()
    return active
end

function setCooldown(data)
    local atm = {x = data.coords.x, y = data.coords.y, z = data.coords.z }
    table.insert(active, atm)
     if config.core.debug then
        local id = {x = math.floor(atm.x), y = math.floor(atm.y), z = math.floor(atm.z)}
        cLog('[#'..json.encode(id)..'] Cooldown Started', 'debug') 
    end 
    CreateThread(function()
        Wait(config.hacking.cooldown * 1000)
        for i, v in pairs(active) do 
            if v == atm then 
                table.remove(active, i)
                if config.core.debug then
                    local id = {x = math.floor(v.x), y = math.floor(v.y), z = math.floor(v.z)}
                    cLog('[#'..json.encode(id)..'] Cooldown Removed', 'debug') 
                end 
            end
        end
    end)
    return true
end 


function sortHack(data)
    local src = source 
    local ped = GetPlayerPed(src)
    local dist = data.distance 
    
    if dist >= 2.0 then return end 
    local coords = data.coords
    local aData = getActive()
    local item = getItem(src, config.hacking.hack_item)
    if not item then 
        cLog('[#'..src..'] Failed to get item.', 'warn')
        return false 
    end 

    local remItem = removeItem(src, config.hacking.hack_item, 1)
    if not remItem then 
        if config.core.debug then 
            cLog('[#'..src..'] Failed to remove item.', 'warn')
        end
        return false 
    end
    local amount = math.random(config.hacking.reward.reward[1], config.hacking.reward.reward[2])
    local addM = addMoney(src, amount, config.hacking.reward.type)
    if not addM then 
        if config.core.debug then 
            cLog('[#'..src..'] Failed to add money.', 'warn')
        end
        return false 
    end 
    if config.core.debug then 
        cLog('[#'..src..'] Robbed an atm: Removed x1 '.. config.hacking.hack_item .. ' x' ..amount..''..config.hacking.reward.type..' given.', 'debug')
    end
    notify(src, 'Succesfully Hacked', 'success')
end