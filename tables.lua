-- tables.lua

local tables = {}

tables.asteroids = {"metallic", "carbonic", "oxide"}
tables.target_items = {
    {item = "stone", default_probability = {[""] = 0.05, ["advanced-"] = 0.3}},
    {item = "uranium-ore", default_probability = {[""] = 0.001, ["advanced-"] = 0.01}}
}
tables.prefixes = {"", "advanced-"}

return tables
