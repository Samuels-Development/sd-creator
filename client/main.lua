local function registerItemDialog()
    local input = lib.inputDialog("Register a New Item", {
        {type = 'input', label = 'Item code', placeholder = 'yachtcodes', description = 'Unique code identifier for the item.', required = true},
        {type = 'input', label = 'Name', placeholder = 'yachtcodes', description = 'Internal name of the item.', required = true},
        {type = 'input', label = 'Label', placeholder = 'Yacht Access Codes', description = 'Display name for the item.', required = true},
        {type = 'number', label = 'Weight', placeholder = '200', description = 'Numeric weight value of the item. (in grams)', required = true},
        {type = 'input', label = 'Type', placeholder = 'item/weapon', description = 'Category or type of the item.', required = true},
        {type = 'input', label = 'Image Path', placeholder = 'yachtcodes.png / yachtcodes.jpg', description = 'Item image name', required = true},
        {type = 'checkbox', label = 'Is unique?', checked = true},
        {type = 'checkbox', label = 'Is useable?', checked = true},
        {type = 'checkbox', label = 'Should Close?', checked = true},
        {type = 'input', label = 'Combinable', placeholder = 'casinocodes', description = 'Other items this can be combined with. Leave empty if not combinable.'},
        {type = 'textarea', label = 'Description', placeholder = 'The first half of codes for the Yacht', description = 'Detailed description about the item.', required = true, min = 1, max = 4, autosize = true}
    })
    return input
end

RegisterNetEvent('sd-itemcreator:client:openMenu', function()
    local input = registerItemDialog()
    if not input then return end

    -- Trigger server side event to save the data
    TriggerServerEvent('sd-itemcreator:server:saveItem', input)
end)