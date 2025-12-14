return {
    core = { 
        -- Only enable if you know what you're doing
        -- Should only be used when testing, not production
        debug = true, 
        -- Your core framework
        -- Options are: qbx_core, qb-core
        framework = 'qbx_core',
        -- Notification System
        -- Options are: ox_lib, qb-core, vms_notifyv2, okokNotify
        notify = 'ox_lib',
        -- Progress System
        -- Options are: ox_lib-bar, ox_lib-circle, qb-core
        -- If ox_lib, specifcy ox_lib-bar or ox_lib-circle or else it will bug.
        progress = 'ox_lib-bar',
        -- Inventory System
        -- Options are: ox_inventory, qs-inventory
        inventory = 'ox_inventory',
        -- Skillcheck System
        -- Options are: ox_lib
        skillcheck = 'ox_lib',
    },
    

    police = {
        -- Whether you want police to be on or notified
        -- Must be true or false
        enabled = true,
        -- Minimum Police to be on duty to perform robbery
        -- Must be a number
        minPolice = 1, 
        -- Dispatch System for police
        -- Options are: tk_dispatch, ps-dispatch, qs-disptach, custom (if custom you must edit your own in client/functions.lua)
        dispatch = 'tk_dispatch'
    },

    hacking = {
        -- Duration for connecting hack usb
        -- Must be in seconds
        duration = 8, 
        -- Cooldown for ATMs, this cooldown is global
        -- Must be in seconds
        cooldown = 600,
        -- Hacking item for ATMs
        -- Must be in your shared/items.lua
        hack_item = 'hacked_usb',
        -- Blacklisted Jobs, they cannot hack the atm
        -- Must be a table, so {}
        blacklisted = {'police', 'ambulance'},
        -- Money reward
        -- Must be a table, so {}
        -- Reward must be low -> high or else it will bug. If you wish to have one value then set them both the same.
        -- Type options are: cash, money, marked_bills or black_money (try both, it depends on your items.lua)
        reward = {type = 'cash', reward = {3000, 5000}},
        -- Skill Checks
        -- Must be how its layed out or else it will bug.
        skillcheck = { difficulty = {'easy', 'easy', 'easy', 'easy'}, inputs = {'w', 'a', 's', 'd'} }
    }
}
