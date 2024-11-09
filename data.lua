-- data.lua

local tables = require("tables")

for _, prefix in ipairs(tables.prefixes) do
    if prefix == "advanced" or not settings.startup["only-advanced-recipes"].value then
        for _, target_item in ipairs(tables.target_items) do
            for _, asteroid in ipairs(tables.asteroids) do
                table.insert(data.raw["recipe"][prefix .. asteroid .. "-asteroid-crushing"].results, {
                    type = "item",
                    name = target_item.item,
                    amount = settings.startup[target_item.item .. "-amount-" .. asteroid].value,
                    probability = settings.startup[prefix .. target_item.item .. "-probability"].value
                })				
            end
        end
    end
end
