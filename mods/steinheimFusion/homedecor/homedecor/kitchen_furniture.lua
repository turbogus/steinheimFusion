-- This file supplies Kitchen cabinets and kitchen sink

local S = homedecor.gettext

local counter_materials = { "", "granite", "marble", "steel" }
local cabinet_sides = "(default_wood.png^[transformR90)^homedecor_kitchen_cabinet_bevel.png"
local cabinet_bottom = "(default_wood.png^[colorize:#000000:100)^(homedecor_kitchen_cabinet_bevel.png^[colorize:#46321580)"

for _, mat in ipairs(counter_materials) do

	local desc = S("Kitchen Cabinet")
	local material = ""

	if mat ~= "" then
		desc = S("Kitchen Cabinet ("..mat.." top)")
		material = "_"..mat
	end

	homedecor.register("kitchen_cabinet"..material, {
		description = desc,
		tiles = { 'homedecor_kitchen_cabinet_top'..material..'.png',
				cabinet_bottom,
				cabinet_sides,
				cabinet_sides,
				cabinet_sides,
				'homedecor_kitchen_cabinet_front.png'},
		groups = { snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		infotext=S("Kitchen Cabinet"),
		inventory = {
			size=24,
		},
	})
end

local kitchen_cabinet_half_box = homedecor.nodebox.slab_y(0.5, 0.5)
homedecor.register("kitchen_cabinet_half", {
	description = S('Half-height Kitchen Cabinet (on ceiling)'),
	tiles = {
		cabinet_sides,
		cabinet_bottom,
		cabinet_sides,
		cabinet_sides,
		cabinet_sides,
		'homedecor_kitchen_cabinet_front_half.png'
	},
	selection_box = kitchen_cabinet_half_box,
	node_box = kitchen_cabinet_half_box,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	infotext=S("Kitchen Cabinet"),
	inventory = {
		size=12,
	},
})

homedecor.register("kitchen_cabinet_with_sink", {
	description = S("Kitchen Cabinet with sink"),
	mesh = "homedecor_kitchen_sink.obj",
	tiles = {
		"homedecor_kitchen_sink_top.png",
		"homedecor_kitchen_cabinet_front.png",
		cabinet_sides,
		cabinet_bottom
	},
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	infotext=S("Under-sink cabinet"),
	inventory = {
		size=16,
	},
})

local cp_cbox = {
	type = "fixed",
	fixed = { -0.375, -0.5, -0.5, 0.375, -0.3125, 0.3125 }
}

homedecor.register("copper_pans", {
	description = "Copper pans",
	mesh = "homedecor_copper_pans.obj",
	tiles = { "homedecor_polished_copper.png" },
	inventory_image = "homedecor_copper_pans_inv.png",
	groups = { snappy=3 },
	selection_box = cp_cbox,
	walkable = false,
	on_place = minetest.rotate_node
})

local kf_cbox = {
	type = "fixed",
	fixed = { -2/16, -8/16, 1/16, 2/16, -1/16, 8/16 }
}

homedecor.register("kitchen_faucet", {
	mesh = "homedecor_kitchen_faucet.obj",
	tiles = { "homedecor_generic_metal_bright.png" },
	inventory_image = "homedecor_kitchen_faucet_inv.png",
	description = "Kitchen Faucet",
	groups = {snappy=3},
	selection_box = kf_cbox,
	walkable = false
})

homedecor.register("paper_towel", {
	mesh = "homedecor_paper_towel.obj",
	tiles = {
		"homedecor_generic_quilted_paper.png",
		"default_wood.png"
	},
	inventory_image = "homedecor_paper_towel_inv.png",
	description = "Paper towels",
	groups = { snappy=3 },
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.4375, 0.125, 0.0625, 0.4375, 0.4375, 0.5 }
	},
})
