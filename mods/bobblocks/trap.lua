local S

if intllib then
	S = intllib.Getter()
else
	S = function(s) return s end
end

-- State Changes

local update_bobtrap = function (pos, node)
    local nodename=""
    --Switch Trap State
    if 
    -- Swap Traps
               node.name == "bobblocks:trap_spike" then nodename = "bobblocks:trap_spike_set"
        elseif node.name == "bobblocks:trap_spike_set" then nodename = "bobblocks:trap_spike"
        elseif node.name == "bobblocks:trap_spike_major" then nodename = "bobblocks:trap_spike_major_set"
        elseif node.name == "bobblocks:trap_spike_major_set" then nodename = "bobblocks:trap_spike_major"
    end
    minetest.add_node(pos, {name = nodename})
end


--ABM (Spring The Traps)

minetest.register_abm(
	{nodenames = {"bobblocks:trap_spike_set","bobblocks:trap_spike_major_set"},
    interval = 0.25,
    chance = 1,
    action = function(pos, node, active_object_count, active_object_count_wider)
		local objs = minetest.get_objects_inside_radius(pos, 1)
        for k, obj in pairs(objs) do
			minetest.sound_play("bobblocks_trap_fall",{pos = pos, gain = 1.0, max_hear_distance = 3,})
			if node.name == "bobblocks:trap_spike_set" then
				obj:set_hp(obj:get_hp()-1)
			elseif node.name == "bobblocks:trap_spike_major_set" then
					obj:set_hp(obj:get_hp()-100)
			end
			update_bobtrap(pos, node)
		end
    end,
     
})


-- Nodes

minetest.register_node("bobblocks:trap_grass", {
	description = S("Trap Grass"),
	tiles = {"default_grass.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	is_ground_content = false,
	walkable = false,
})

minetest.register_node("bobblocks:trap_spike", {
	description = S("Trap Spike Minor"),
    drawtype = "plantlike",
    visual_scale = 1,
	tiles = {"bobblocks_minorspike.png"},
	inventory_image = ("bobblocks_minorspike.png"),
    paramtype = "light",
    walkable = false,
	sunlight_propagates = true,
    groups = {cracky=3,melty=3},
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(2)
	end,
	on_timer = function(pos,elapsed)
		if minetest.get_node(pos).name=="bobblocks:trap_spike" then
			minetest.add_node(pos, {name="bobblocks:trap_spike_set"})
		end
	end,
})

minetest.register_node("bobblocks:trap_spike_set", {
    drawtype = "raillike",
    visual_scale = 1,
	tiles = {"bobblocks_trap_set.png"},
    paramtype = "light",
    walkable = false,
	sunlight_propagates = true,
    groups = {cracky=3,melty=3},
    drop = "bobblocks:trap_spike",
	on_punch = function(pos, node, puncher)
		minetest.sound_play("bobblocks_trap_fall",{pos = pos, gain = 1.0, max_hear_distance = 3,})  
        update_bobtrap(pos, node)
	end,
})


minetest.register_node("bobblocks:trap_spike_major", {
	description =S("Trap Spike Major"),
    drawtype = "plantlike",
    visual_scale = 1,
	tiles = {"bobblocks_majorspike.png"},
	inventory_image = ("bobblocks_majorspike.png"),
    paramtype = "light",
    walkable = false,
	sunlight_propagates = true,
    groups = {cracky=2,melty=2},
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(2)
	end,
	on_timer = function(pos,elapsed)
		if minetest.get_node(pos).name=="bobblocks:trap_spike_major" then
			minetest.add_node(pos, {name="bobblocks:trap_spike_major_set"})
		end
	end,
})

minetest.register_node("bobblocks:trap_spike_major_set", {
    drawtype = "raillike",
    visual_scale = 1,
	tiles = {"bobblocks_trap_set.png"},
    paramtype = "light",
    walkable = false,
	sunlight_propagates = true,
    groups = {cracky=3,melty=3},
    drop = "bobblocks:trap_spike_major",
	on_punch = function(pos, node, puncher)
		minetest.sound_play("bobblocks_trap_fall",{pos = pos, gain = 1.0, max_hear_distance = 3,})  
        update_bobtrap(pos, node)
	end,
})


-- Crafting

minetest.register_craft({
	output = "bobblocks:trap_spike",
	recipe = {
		{"", "default:cobble", ""},
		{"default:cobble", "default:steel_ingot", "default:cobble"},
	}
})

minetest.register_craft({
	output = "bobblocks:trap_spike_major",
	recipe = {
		{"", "default:cobble", ""},
		{"", "default:steel_ingot", ""},
		{"default:cobble", "default:steel_ingot", "default:cobble"},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "bobblocks:trap_grass",
	recipe = {
		"default:dirt","default:stick"
	}
})