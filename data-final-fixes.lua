local asteroid_productivity = data.raw["technology"]["asteroid-productivity"]

if asteroid_productivity then
    table.insert(asteroid_productivity.effects, {
        type = "change-recipe-productivity",
        recipe = "trace-carbonic-crushing",
        change = 0.1
    })
    table.insert(asteroid_productivity.effects, {
        type = "change-recipe-productivity",
        recipe = "trace-metallic-crushing",
        change = 0.1
    })
    table.insert(asteroid_productivity.effects, {
        type = "change-recipe-productivity",
        recipe = "trace-oxide-crushing",
        change = 0.1
    })
	table.insert(asteroid_productivity.effects, {
        type = "change-recipe-productivity",
        recipe = "promethium-metallic-processing",
        change = 0.1
    })
	table.insert(asteroid_productivity.effects, {
        type = "change-recipe-productivity",
        recipe = "promethium-carbonic-processing",
        change = 0.1
    })
	table.insert(asteroid_productivity.effects, {
        type = "change-recipe-productivity",
        recipe = "promethium-oxide-processing",
        change = 0.1
    })
end