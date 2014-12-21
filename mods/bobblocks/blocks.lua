-- BobBlocks mod by RabbiBob
-- State Changes
-- Simplify and modify by Jat
local S

if rawget(_G,"intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end

local couleurs={"black","cyan","violet","white","yellow","red","orange","pink","grey","green","blue"}
local rulesbobblocks =	{	
	{x=0, y=0, z=-1},
	{x=0, y=0, z=1},
	{x=1, y=0, z=0},
	{x=-1, y=0, z=0}, 
	{x=0, y=1, z=0},
	{x=0, y=-1, z=0}
}

-- Nodes

for a=1,table.getn(couleurs) do
	--Block
	minetest.register_node("bobblocks:"..couleurs[a].."block", {
		drawtype = "glasslike",
		tiles = {"bobblocks_"..couleurs[a].."block.png"},
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = true,
		sounds = default.node_sound_glass_defaults(),
		light_source = LIGHT_MAX,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		drop = "bobblocks:"..couleurs[a].."block_off",
		on_rightclick = function(pos, node)
			minetest.add_node(pos, {name = "bobblocks:"..couleurs[a].."block_off"})
			minetest.sound_play("bobblocks_glassblock",{pos = pos, gain = 1.0, max_hear_distance = 32,})
		end,
		mesecons =	{conductor ={
			state = mesecon.state.on,
			offstate = "bobblocks:"..couleurs[a].."block_off",
			rules = rulesbobblocks
		}},
	})

	minetest.register_node("bobblocks:"..couleurs[a].."block_off", {
		description = S("%s Block"):format(S(couleurs[a])),
		tiles = {"bobblocks_"..couleurs[a].."block.png"},
		is_ground_content = true,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		on_rightclick = function(pos, node)
			minetest.add_node(pos, {name = "bobblocks:"..couleurs[a].."block"})
			minetest.sound_play("bobblocks_glassblock",{pos = pos, gain = 1.0, max_hear_distance = 32,})
		end,
		mesecons =	{conductor ={
			state = mesecon.state.off,
			onstate = "bobblocks:"..couleurs[a].."block",
			rules = rulesbobblocks
		}},
	})
	--Pole
	minetest.register_node("bobblocks:"..couleurs[a].."pole", {
		drawtype = "fencelike",
		tiles = {"bobblocks_"..couleurs[a].."block.png"},
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = true,
		sounds = default.node_sound_glass_defaults(),
		light_source = LIGHT_MAX,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		drop = "bobblocks:"..couleurs[a].."pole_off",
		on_rightclick = function(pos, node)
			minetest.add_node(pos, {name = "bobblocks:"..couleurs[a].."pole_off"})
			minetest.sound_play("bobblocks_glassblock",{pos = pos, gain = 1.0, max_hear_distance = 32,})
		end,
		mesecons =	{conductor ={
			state = mesecon.state.on,
			offstate = "bobblocks:"..couleurs[a].."pole_off",
			rules = rulesbobblocks
		}},
	})

	minetest.register_node("bobblocks:"..couleurs[a].."pole_off", {
		description = S("%s Pole"):format(S(couleurs[a])),
		drawtype = "fencelike",
		tiles = {"bobblocks_"..couleurs[a].."block.png"},
		inventory_image = ("bobblocks_inv"..couleurs[a].."pole.png"),
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = true,
		sounds = default.node_sound_glass_defaults(),
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		on_rightclick = function(pos, node)
			minetest.add_node(pos, {name = "bobblocks:"..couleurs[a].."pole"})
			minetest.sound_play("bobblocks_glassblock",{pos = pos, gain = 1.0, max_hear_distance = 32,})
		end,
		mesecons =	{conductor ={
			state = mesecon.state.off,
			onstate = "bobblocks:"..couleurs[a].."pole",
			rules = rulesbobblocks
		}},
	})
	--Craft
	--Block
	minetest.register_craft({
		type = "shapeless",
		output = "bobblocks:"..couleurs[a].."block_off 2", 
		recipe = {
			"default:glass", "group:mesecon_conductor_craftable", "dye:"..couleurs[a]
		},
	})
	--Pole
	minetest.register_craft({
		type = "shapeless",
		output = "bobblocks:"..couleurs[a].."pole_off",
		recipe = {
			"bobblocks:"..couleurs[a].."block_off", "default:stick"
		},
	})
end