-- Quicksands mod ßý Mg
--

-- Registrations
minetest.register_node("quicksands:sand_flowing", {
	description = "Flowing Sand",
	inventory_image = minetest.inventorycube("default_sand.png"),
	drawtype = "flowingliquid",
	tiles = {"default_sand.png"},
	special_tiles = {
		{
			image = "quicksands_flowing_animated.png",
			backface_culling=false,
			animation={type = "vertical_frames", aspect_w= 16,
				aspect_h = 16, length = 0.6}
		},
		{
			image = "quicksands_flowing_animated.png",
			backface_culling=true,
			animation={type = "vertical_frames", aspect_w= 16,
				aspect_h = 16, length = 0.6}
		},
	},
	alpha = 255,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 4,
	liquidtype = "flowing",
	liquid_alternative_flowing = "quicksands:sand_flowing",
	liquid_alternative_source = "quicksands:sand_source",
	liquid_viscosity = 20,
	post_effect_color = {a = 250, r = 0, g = 0, b = 0},
	groups = {liquid = 3, not_in_creative_inventory = 1},
})

minetest.register_node("quicksands:sand_source", {
	description = "Sand Source",
	inventory_image = minetest.inventorycube("default_sand.png"),
	drawtype = "liquid",
	tiles = {"default_sand.png"},
	alpha = 255,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 4,
	liquidtype = "source",
	liquid_alternative_flowing = "quicksands:sand_flowing",
	liquid_alternative_source = "quicksands:sand_source",
	liquid_viscosity = 20,
	liquid_renewable = false,
	post_effect_color = {a = 250, r = 0, g = 0, b = 0},
	groups = {liquid = 3},
})

-- Aliases
minetest.register_alias("default:sand_source", "quicksands:sand_source")
minetest.register_alias("default:sand_flowing",
	"quicksands:sand_flowing")

-- Craft
minetest.register_craft({
	output = "bucket:bucket_sand",
	recipe = {
		{"group:sand"},
		{"group:sand"},
		{"bucket:bucket_water"},
	},
})
