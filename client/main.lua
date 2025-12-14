local config = require 'shared.config'
local atms = { 
    'prop_fleeca_atm',
    'prop_atm_03',
    'prop_atm_01',
}

local function sortHack(data)
   if not progressBar() then return end 
   if not skillCheck() then return end 
   local x = lib.callback.await('fg:atmrob:cb:hackFinish', false, data)
   if not x then 
    notify('Failed Robbery', 'error')
   end
end 

local function sortCooldown(data)
    local aData = lib.callback.await('fg:atmrob:cb:getActive', false)
    local coords = data.coords 
    if next(aData) then 
        for i, v in pairs(aData) do 
            local dist = Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z)
            if dist <= 1.0 then 
                return exports.qbx_core:Notify('Cooldown Active', 'error') 
            end
        end
        local x = lib.callback.await('fg:atmrob:cb:setCooldown', false, data)
        if x then sortHack(data) end
    else 
        local x = lib.callback.await('fg:atmrob:cb:setCooldown', false, data)
        if x then sortHack(data) end
    end
end


function sortTargets()
    local options = {
        [1] = {
            label = 'Hack Atm',
            name = 'fg:hackatm',
            icon = 'fa-solid fa-money-bills',
            distance = 2.0,
            canInteract = function(data) 
                return not checkJob()
            end, 
            items = config.hacking.hack_item,
            onSelect = function(data)
                sortCooldown(data)
            end
        }
    }
    exports.ox_target:addModel(atms, options)
end

lib.callback.register('fg:atmrob:client:checkVdist', function(data, aData)
    local coords = data.coords
    for i, v in pairs(aData) do 
        local dist = Vdist(coords.x, coords.y, coords.z, v.x, v.y, v.z)
        if dist > 1.0 then 
            return false
        end
    end
    return true
end)

sortTargets()