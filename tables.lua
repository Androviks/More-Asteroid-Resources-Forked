-- tables.lua

local tables = {}

tables.asteroids = {"metallic", "carbonic", "oxide"}
tables.target_items = {
    metallic = {
        {item = "holmium-ore", default_probability = {[""] = 0.03, ["advanced-"] = 0.1}}.
        {item = "tungsten-ore", default_probability = {[""] = 0.001, ["advanced-"] = 0.01}}.
    },
    carbonic = {
        {item = "stone", default_probability = {[""] = 0.03, ["advanced-"] = 0.1}},
        {item = "uranium-ore", default_probability = {[""] = 0.001, ["advanced-"] = 0.01}}
    },
    oxide = {
        {item = "stone", default_probability = {[""] = 0.03, ["advanced-"] = 0.1}},
        {item = "iron-ore", default_probability = {[""] = 0.001, ["advanced-"] = 0.01}}
    },
}
