-- tables.lua

local tables = {}

tables.asteroids = {"metallic", "carbonic", "oxide"}
tables.target_items = {
    {item = "stone", default_probability = {[""] = 0.05, ["advanced-"] = 0.3, ["standalone-"] = 0.5}},
    {item = "uranium-ore", default_probability = {[""] = 0.001, ["advanced-"] = 0.01, ["standalone-"] = 0.1}}
}
tables.prefixes = {"", "advanced-", "trace-"}

return tables
