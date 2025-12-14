lib.callback.register('fg:atmrob:cb:getActive', function(source) 
    return getActive()
end)

lib.callback.register('fg:atmrob:cb:setCooldown', function(source, data)
    return setCooldown(data)
end)

lib.callback.register('fg:atmrob:cb:hackFinish', function(source, data) 
   return sortHack(data)
end)