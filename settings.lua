-- settings.lua

local tables = require("tables")

data:extend({
    {
        type = "string-setting",
        name = "processing-mode",
        setting_type = "startup",
        default_value = "standalone-only",
        allowed_values = {
            "standalone-only",
            "advanced-only",
            "all"
        },
        order = "a"
    }
})

for _, target_item in ipairs(tables.target_items) do
    for _, asteroid in ipairs(tables.asteroids) do
        data:extend({
            {
                type = "int-setting",
                name = target_item.item .. "-amount-" .. asteroid,
                setting_type = "startup",
                default_value = 1,
                minimum_value = 1,
                maximum_value = 100,
                order = "b-" .. target_item.item .. "-" .. asteroid
            }
        })
    end
    for _, prefix in ipairs(tables.prefixes) do
        data:extend({
            {
                type = "double-setting",
                name = prefix .. target_item.item .. "-probability",
                setting_type = "startup",
                default_value = target_item.default_probability[prefix],
                minimum_value = 0.0,
                maximum_value = 1.0,
                order = "c-" .. prefix .. target_item.item
            }
        })
    end
end
