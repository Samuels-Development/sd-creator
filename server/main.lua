QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('createitem', '', {}, false, function(source, args)
    local src = source
    TriggerClientEvent('sd-itemcreator:client:openMenu', src, src)
end,'admin')

local function validateItem(item)
    for i = 1, 6 do 
        if not item[i] or item[i] == "" then
            return false
        end
    end
    return true
end

local function saveToFile(item)
    local resourcePath = GetResourcePath(GetCurrentResourceName())
    local filePath = resourcePath .. "/items.txt"
    local file = io.open(filePath, "a") 

    if file then
        file:write(string.format(
            "['%s'] = {['name'] = '%s', ['label'] = '%s', ['weight'] = %d, ['type'] = '%s', ['image'] = '%s', ['unique'] = %s, ['useable'] = %s, ['shouldClose'] = %s, ['combinable'] = %s, ['description'] = '%s'},\n",
            item[1], item[2], item[3], item[4], item[5], item[6], tostring(item[7]), tostring(item[8]), tostring(item[9]), item[10] or 'nil', item[11]
        ))
        file:close()
    else
        print("Error: Failed to open items.txt for writing.")
    end
end

RegisterServerEvent('sd-itemcreator:server:saveItem', function(item)
    if validateItem(item) then
        saveToFile(item)
        print("Item registered and saved to items.txt!")
    else
        print("Item validation failed.")
    end
end)
