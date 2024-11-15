-- data.lua

local tables = require("tables")
local mode = settings.startup["processing-mode"].value

if settings.startup["processing-mode"].value ~= "standalone-only" then
	if settings.startup["processing-mode"].value == "advanced-only" or settings.startup["processing-mode"].value == "all" then
		for _, asteroid in ipairs(tables.asteroids) do
			for _, target_item in ipairs(tables.target_items[asteroid]) do
				local recipe_name = "advanced-" .. asteroid .. "-asteroid-crushing"
				if data.raw["recipe"][recipe_name] then
					table.insert(data.raw["recipe"][recipe_name].results, {
						type = "item",
						name = target_item.item,
						amount = settings.startup[target_item.item .. "-amount-" .. asteroid].value,
						probability = settings.startup["advanced-" .. target_item.item .. "-probability-" .. asteroid].value
						})
				end
			end
		end
	end
	if settings.startup["processing-mode"].value == "all" then
		for _, asteroid in ipairs(tables.asteroids) do
			for _, target_item in ipairs(tables.target_items[asteroid]) do
				local recipe_name = asteroid .. "-asteroid-crushing"
				if data.raw["recipe"][recipe_name] then
					table.insert(data.raw["recipe"][recipe_name].results, {
						type = "item",
						name = target_item.item,
						amount = settings.startup[target_item.item .. "-amount-" .. asteroid].value,
						probability = settings.startup[target_item.item .. "-probability-" .. asteroid].value
					})
				end
			end
		end
	end
end
-- make these configurable at some point, lazy.
data:extend({
	{
		type = "recipe",
		name = "trace-metallic-crushing",
		group = "space",
		subgroup = "space-crushing",
		category = "crushing",
		order = "g-a",
		energy_required = 10,
		ingredients = {
			{type = "item", name = "metallic-asteroid-chunk", amount = 3},
		},
		results = {
			{type = "item", name = "iron-ore", amount = 20},
			{type = "item", name = "copper-ore", amount = 3},
			{type = "item", name = "holmium-ore", amount = 3, probability = 0.3},
			{type = "item", name = "tungsten-ore", amount = 1, probability = 0.1}
		},
		icon_size = 64,
        	icons = {
            		{icon = "__space-age__/graphics/icons/advanced-metallic-asteroid-crushing.png", icon_size = 64, scale = 1},
            		{icon = "__space-age__/graphics/icons/holmium-ore.png", icon_size = 64, scale = 0.5, shift = {-16, -16}},
            		{icon = "__space-age__/graphics/icons/tungsten-ore.png", icon_size = 64, scale = 0.5, shift = {16, -16}},
        	},
		enabled = false
	}
})

data:extend({
	{
		type = "recipe",
		name = "trace-carbonic-crushing",
		group = "space",
		subgroup = "space-crushing",
		category = "crushing",
		order = "g-b",
		energy_required = 10,
		ingredients = {
			{type = "item", name = "carbonic-asteroid-chunk", amount = 3},
		},
		results = {
			{type = "item", name = "carbon", amount = 20},
			{type = "item", name = "sulfur", amount = 8},
			{type = "item", name = "stone", amount = 5, probability = 0.5},
			{type = "item", name = "uranium-ore", amount = 3, probability = 0.3}
		},
		icon_size = 64,
        	icons = {
            		{icon = "__space-age__/graphics/icons/advanced-carbonic-asteroid-crushing.png", icon_size = 64, scale = 1},
            		{icon = "__base__/graphics/icons/stone.png", icon_size = 64, scale = 0.5, shift = {-16, -16}},
            		{icon = "__base__/graphics/icons/uranium-ore.png", icon_size = 64, scale = 0.5, shift = {16, -16}},
        	},
		enabled = false
	}
})

data:extend({
	{
		type = "recipe",
		name = "trace-oxide-crushing",
		group = "space",
		subgroup = "space-crushing",
		category = "crushing",
		order = "g-c",
		energy_required = 10,
		ingredients = {
			{type = "item", name = "oxide-asteroid-chunk", amount = 3},
		},
		results = {
			{type = "item", name = "ice", amount = 20},
			{type = "item", name = "calcite", amount = 8},
			{type = "item", name = "stone", amount = 5, probability = 0.5},
			{type = "item", name = "lithium", amount = 3, probability = 0.3}
		},
		icon_size = 64,
        	icons = {
            		{icon = "__space-age__/graphics/icons/advanced-oxide-asteroid-crushing.png", icon_size = 64, scale = 1},
            		{icon = "__base__/graphics/icons/stone.png", icon_size = 64, scale = 0.5, shift = {-16, -16}},
            		{icon = "__space-age__/graphics/icons/lithium.png", icon_size = 64, scale = 0.5, shift = {16, -16}},
        	},
		enabled = false
	}
})

data:extend({
	{
		type = "technology",
		name = "trace-metallic-processing",
		icon_size = 256,
		icon = "__More-Asteroid-Resources-Forked__/graphics/technology/trace-metallic-processing.png",
		prerequisites = {"advanced-asteroid-processing", "holmium-processing", "tungsten-carbide"},
		unit = {
			count = 3000,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"production-science-pack", 1}, {"utility-science-pack", 1}, {"space-science-pack", 1}, {"electromagnetic-science-pack", 1}, {"metallurgic-science-pack", 1}},
			time = 60
		},
		effects = {
			{type = "unlock-recipe", recipe = "trace-metallic-crushing"}
		}
	}
})

data:extend({
	{
		type = "technology",
		name = "trace-carbonic-processing",
		icon_size = 256,
		icon = "__More-Asteroid-Resources-Forked__/graphics/technology/trace-carbonic-processing.png",
		prerequisites = {"advanced-asteroid-processing", "nuclear-power"},
		unit = {
			count = 3000,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"production-science-pack", 1}, {"utility-science-pack", 1}, {"space-science-pack", 1}, {"metallurgic-science-pack", 1}, {"agricultural-science-pack", 1}},
			time = 60
		},
		effects = {
			{type = "unlock-recipe", recipe = "trace-carbonic-crushing"}
		}
	}
})

data:extend({
	{
		type = "technology",
		name = "trace-oxide-processing",
		icon_size = 256,
		icon = "__More-Asteroid-Resources-Forked__/graphics/technology/trace-oxide-processing.png",
		prerequisites = {"advanced-asteroid-processing", "lithium-processing"},
		unit = {
			count = 3000,
			ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"production-science-pack", 1}, {"utility-science-pack", 1}, {"space-science-pack", 1}, {"metallurgic-science-pack", 1}, {"cryogenic-science-pack", 1}},
			time = 60
		},
		effects = {
			{type = "unlock-recipe", recipe = "trace-oxide-crushing"}
		}
	}
})
