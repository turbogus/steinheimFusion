
-- ***********************************************************************************
--														**************************************************
--				Door				**************************************************
--														**************************************************
-- ***********************************************************************************


doors.register_door("riventest:stickdoor", 
	{
		description = "Plain Stick Door",
		inventory_image = "rivendoor.png",
		groups = {choppy=2, dig_immediate=2 },
		tiles_top = {"rivendoor_a.png"},
		tiles_bottom ={"rivendoor_b.png"},
		sound_close_door = "woodengate",
		sound_open_door = "woodengate",
		only_placer_can_open = false,
	}
)



doors.register_door("riventest:uldoor", 
	{
		description = "User-Lock Door",
		inventory_image = "rivendoor2.png",
		groups = {choppy=2, dig_immediate=2 },
		tiles_top = {"rivendoor2_a.png"},
		tiles_bottom = {"rivendoor2_b.png"},
		sound_close_door = "metalgate",
		sound_open_door = "metalgate",
		only_placer_can_open = true,
	}
)



doors.register_door("riventest:kldoor", 
	{
		description = "User-Lock Door",
		inventory_image = "rivendoor3.png",
		groups = {choppy=2, dig_immediate=2 },
		tiles_top = {"rivendoor3_a.png"},
		tiles_bottom ={"rivendoor3_b.png"},
		sound_close_door = "metalgate",
		sound_open_door = "metalgate",
		only_placer_can_open = true,
	}
)

-- ***********************************************************************************
--														**************************************************
--				LINKING BOOKS						**************************************************
--														**************************************************
-- ***********************************************************************************
local linkingbook = {}
linkingbook.sounds = {}
linkingbook_sound = function(p)
	local wanted_sound = {name="linkingbook", gain=1.5}
		linkingbook.sounds[minetest.hash_node_position(p)] = {
			handle = minetest.sound_play(wanted_sound, {pos=p, loop=false}),
			name = wanted_sound.name,
		}

end
local function has_linkingbook_privilege(meta, player)
	if meta:get_string("owner") == '' then
		meta:set_string("owner", player:get_player_name())
	elseif meta:get_string("owner") ~= player:get_player_name() then
		return false
	end
	return true
end


minetest.register_node("riventest:linkingbook", {
	description = "Linking Book",
	drawtype = "nodebox",
	tiles = {"riventest_linkingbook.png",'bookunder.png',"bookside.png"},
	inventory_image = "riventest_linkingbook.png",
	paramtype = "light",
	paramtype2 = "facedir",	
	node_box = {
		type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3},
--				{-0.1, -0.5, -0.5, 0.1, -0.1, 0.5},

--				{-0.5, 0.4, 0, 0.5, 0.5, 0.5},
--				{-0.1, -0.1, 0, 0.1, 0.4, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3},
--				{-0.1, -0.5, -0.5, 0.1, -0.1, 0.5},

--				{-0.5, 0.4, 0, 0.5, 0.5, 0.5},
--				{-0.1, -0.1, 0, 0.1, 0.4, 0.5},
		},
	},	
	groups = {choppy=2,dig_immediate=2},
	sounds = default.node_sound_defaults(),
	on_punch = function(pos,node,puncher)
		local player = puncher:get_player_name()-- or ""
		local meta =  minetest.get_meta(pos)
		local stringpos = meta:get_string("location")
		local p = {}
		p.x, p.y, p.z = string.match(stringpos, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
		if p.x and p.y and p.z then

			teleporiventeste =  minetest.get_player_by_name(player)
			linkingbook_sound(pos)
			teleporiventeste:setpos(p)
			linkingbook_sound(p)
		end
	end,
	on_construct = function(pos)
		local meta =  minetest.get_meta(pos)
		meta:set_string("formspec", "size[8,3;]"..
			"field[0.256,0.5;8,1;bookname;Book name:;]"..
			"field[0.256,1.5;8,1;location;Coordinates X,Y,Z:;]"..
			"button_exit[3.3,2.5;2,1;button;Write]")
		meta:set_string("infotext", "Linking Book")
		meta:set_string("owner", "")
		meta:set_string("form", "yes")
	end,	
	on_receive_fields = function(pos, formname, fields, sender)
		local meta =  minetest.get_meta(pos)
		local sender_name = sender:get_player_name()

		if not has_linkingbook_privilege(meta, sender) then
			minetest.chat_send_player(sender_name, "You cannot edit other people's books")
		return end

		meta:set_string("infotext", fields.bookname)
		meta:set_string("location", fields.location)
	end,	
	
	after_place_node = function(pos, placer)
		local meta =  minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
	end,
	
	can_dig = function(pos,player)
		meta =  minetest.get_meta(pos)
		return has_linkingbook_privilege(meta, player)
	end,
	
})
minetest.register_node("riventest:plinkingbook", {
	description = "Private Linking Book",
	drawtype = 'nodebox',
	tiles = {"riventest_plinkingbook.png"},
	inventory_image = "riventest_plinkingbook.png",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3},
--				{-0.1, -0.5, -0.5, 0.1, -0.1, 0.5},

--				{-0.5, 0.4, 0, 0.5, 0.5, 0.5},
--				{-0.1, -0.1, 0, 0.1, 0.4, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3},
--				{-0.1, -0.5, -0.5, 0.1, -0.1, 0.5},

--				{-0.5, 0.4, 0, 0.5, 0.5, 0.5},
--				{-0.1, -0.1, 0, 0.1, 0.4, 0.5},
		},
	},	
	groups = {choppy=2,dig_immediate=2},
	sounds = default.node_sound_defaults(),
	on_punch = function(pos,node,puncher)
		local meta =  minetest.get_meta(pos)
		if not has_linkingbook_privilege(meta, puncher) then return end
		local player = puncher:get_player_name()-- or ""
		local stringpos = meta:get_string("location")
		local p = {}
		p.x, p.y, p.z = string.match(stringpos, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
		if p.x and p.y and p.z then

			teleporiventeste =  minetest.get_player_by_name(player)
			linkingbook_sound(pos)
			teleporiventeste:setpos(p)
			linkingbook_sound(p)
		end
	end,
	on_construct = function(pos)
		local meta =  minetest.get_meta(pos)
		meta:set_string("formspec", "size[8,3;]"..
			"field[0.256,0.5;8,1;bookname;Book name:;]"..
			"field[0.256,1.5;8,1;location;Coordinates X,Y,Z:;]"..
			"button_exit[3.3,2.5;2,1;button;Write]")
		meta:set_string("infotext", "Personal Linking Book")
		meta:set_string("owner", "")
		meta:set_string("form", "yes")
	end,	
	on_receive_fields = function(pos, formname, fields, sender)
		local meta =  minetest.get_meta(pos)
		local sender_name = sender:get_player_name()

		if not has_linkingbook_privilege(meta, sender) then
			minetest.chat_send_player(sender_name, "You cannot edit other people's books")
		return end

		meta:set_string("infotext", fields.bookname)
		meta:set_string("location", fields.location)
	end,	
	after_place_node = function(pos, placer)
		local meta =  minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
	end,
	
	can_dig = function(pos,player)
		meta =  minetest.get_meta(pos)
		return has_linkingbook_privilege(meta, player)
	end,
	
})

-- ***********************************************************************************
--														**************************************************
--				DECORATIVE							**************************************************
--														**************************************************
-- ***********************************************************************************


GLOWLIKE = function(nodeid,nodename,drawtype)
	if drawtype == nil then 
		drawtype = 'glasslike'
		inv_image = minetest.inventorycube("riventest_"..nodeid..".png")
	else 
		inv_image = "riventest_"..nodeid..".png" 
	end
	minetest.register_node("riventest:"..nodeid, {
		description = nodename,
		drawtype = drawtype,
		tiles = {"riventest_"..nodeid..".png"},
		inventory_image = inv_image,
		paramtype = "light",
		sunlight_propagates = true,
		light_source = 15	,
		is_ground_content = true,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		sounds = default.node_sound_glass_defaults(),
	})
end
METALLIKE = function(nodeid, nodename,fence)
	minetest.register_node("riventest:"..nodeid, {
		description = nodename,
		tiles = {"riventest_"..nodeid..".png"},
		--inventory_image = minetest.inventorycube("riventest_"..nodeid..".png"),
		is_ground_content = true,
		groups = {cracky=3},
		sounds = default.node_sound_wood_defaults(),
	})
	if fence == true then
		minetest.register_node("riventest:"..nodeid.."_fence", {
			description = nodename.." Fence",
			drawtype = "fencelike",
			tiles = {"riventest_"..nodeid..".png"},
			inventory_image = "riventest_"..nodeid.."_fence.png",
			wield_image = "riventest_"..nodeid.."_fence.png",
			paramtype = "light",
			is_ground_content = true,
			selection_box = {
				type = "fixed",
				fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
			},
			groups = {cracky=3},
			sounds = default.node_sound_wood_defaults(),
		})
	end
end
local SOUNDS = {}
SOUNDNODE = function(nodeid, nodename,drawtype)
	SOUNDS[nodeid] = {}
	SOUNDS[nodeid].sounds = {}
	local on_punch = function(pos,node)
		local sound = SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)]
		if sound == nil then 
			local wanted_sound = {name=nodeid, gain=1.5}
			SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)] = {	handle = minetest.sound_play(wanted_sound, {pos=pos, loop=true}),	name = wanted_sound.name, }

		else 
			minetest.sound_stop(sound.handle)
			SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)] = nil
		end

	end
	after_dig_node = function(pos,node)
		local sound = SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)]
		if sound ~= nil then
			minetest.sound_stop(sound.handle)
			SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)] = nil
			nodeupdate(pos)
		end
	end
	if drawtype == 'signlike' then
		minetest.register_node("riventest:"..nodeid, {
			description = nodename,
			drawtype = "signlike",
			tiles = {"riventest_"..nodeid..'.png'}, 
			inventory_image = "riventest_"..nodeid..'.png',
			wield_image = "riventest_"..nodeid..'.png', 
			paramtype = "light",
			paramtype2 = "wallmounted",
			sunlight_propagates = true,
			walkable = false,
			on_add = "sign",
			selection_box = {
				type = "wallmounted",
				--wall_top = <default>
				--wall_bottom = <default>
				--wall_side = <default>
			},
			groups = {choppy=2,dig_immediate=2},
			legacy_wallmounted = true,
			sounds = default.node_sound_defaults(),
			on_punch = on_punch,
			after_dig_node = after_dig_node,		
		})
	else 
		minetest.register_node("riventest:"..nodeid, { 
			description = nodename, 
			drawtype = 'plantlike', 
			tiles = {"riventest_"..nodeid..'.png'}, 
			inventory_image = "riventest_"..nodeid..'.png',
			wield_image = "riventest_"..nodeid..'.png', 
			paramtype = "light",
			groups = {cracky=3},
			sounds = default.node_sound_stone_defaults(),
			on_punch = on_punch,	
			after_dig_node = after_dig_node,
		})
	end
end
PLANTLIKE = function(nodeid, nodename,type,option)
	if option == nil then option = false end

	local params ={ description = nodename, drawtype = "plantlike", tiles = {"riventest_"..nodeid..'.png'}, 
	inventory_image = "riventest_"..nodeid..'.png',	wield_image = "riventest_"..nodeid..'.png', paramtype = "light",	}
		
	if type == 'veg' then
		params.groups = {snappy=2,dig_immediate=3,flammable=2}
		params.sounds = default.node_sound_leaves_defaults()
		if option == false then params.walkable = false end
	elseif type == 'met' then			-- metallic
		params.groups = {cracky=3}
		params.sounds = default.node_sound_stone_defaults()
	elseif type == 'cri' then			-- craft items
		params.groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3}
		params.sounds = default.node_sound_wood_defaults()
		if option == false then params.walkable = false end
	elseif type == 'eat' then			-- edible
		params.groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3}
		params.sounds = default.node_sound_wood_defaults()
		params.walkable = false
		params.on_use = minetest.item_eat(option)
	end
	minetest.register_node("riventest:"..nodeid, params)
end

METALLIKE('rt1','Riven Testnode 1')
METALLIKE('rt2','Riven Testnode 2')
METALLIKE('rt3','Riven Testnode 3')
METALLIKE('rt4','Riven Testnode 4')
METALLIKE('rt5','Riven Testnode 5')
PLANTLIKE('rt6_mushroom','Riven testnode 6 Mushroom','veg')
METALLIKE('rt7','Riven Testnode 7')
METALLIKE('rt8','Riven Testnode 8')
GLOWLIKE('rt9_lamppost','Riven testnode 9 Lamppost','plantlike')
GLOWLIKE('rt17_lamppost','Riven testnode 17 Lamppost','plantlike')
GLOWLIKE('rt18_lamppost','Riven testnode 18 Lamppost','plantlike')
GLOWLIKE('rt19_lamppost','Riven testnode 19 Lamppost','plantlike')
METALLIKE('rt10','Riven Testnode 10')
METALLIKE('rt11','Riven Testnode 11')
METALLIKE('rt12','Riven Testnode 12')


SOUNDNODE('1','Riven Art (1)','signlike')
SOUNDNODE('2','Riven Art (2)','signlike')
SOUNDNODE('3','Riven Art (3)','signlike')
METALLIKE('wood','Riven Wood')
METALLIKE('woodblue','Riven Wood (Blue)')
METALLIKE('stone1','Riven Stone (1)')
METALLIKE('stone2','Riven Stone (2)')
METALLIKE('stoneblue','Riven Stone (Blue)')
METALLIKE('metal','Riven Rusted Metal')
METALLIKE('bulkhead','Riven Metal Bulkhead')
METALLIKE('goldstone1','Riven Gold Stone (1)')
METALLIKE('goldstone2','Riven Gold Stone (2)')

minetest.register_node("riventest:rt15", {
	description = "Stained Glass",
	drawtype = "nodebox",
	tiles = {"riventest_rt15.png"},
--	inventory_image = minetest.inventorycube("riventest_rt15.png"),
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = LIGHT_MAX-1,	
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1, 0.5,0.5, 0.1},
--				{-0.1, -0.5, -0.5, 0.1, -0.1, 0.5},

--				{-0.5, 0.4, 0, 0.5, 0.5, 0.5},
--				{-0.1, -0.1, 0, 0.1, 0.4, 0.5},
			},
		},
selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1, 0.5,0.5, 0.1},
--				{-0.1, -0.5, -0.5, 0.1, -0.1, 0.5},

--				{-0.5, 0.4, 0, 0.5, 0.5, 0.5},
--				{-0.1, -0.1, 0, 0.1, 0.4, 0.5},
			},
		},		
})
minetest.register_node("riventest:glass", {
	description = "Riven Glass",
	drawtype = "glasslike",
	tiles = {"riventest_glass.png"},
	inventory_image = minetest.inventorycube("riventest_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
minetest.register_node("riventest:rt16", {
	description = "Puzzle Book",
	drawtype = "signlike",
	tiles = {"riventest_rt16.png"},
	inventory_image = "riventest_rt16.png",
	wield_image = "riventest_rt16.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	light_source = 10,
	walkable = false,

	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})
extend_chain = function(pos)
	
	local upos = {x=pos.x,y=pos.y-1,z=pos.z}
	local apos = {x=pos.x,y=pos.y+1,z=pos.z}
	
	local unode =  minetest.get_node(upos)
	local anode =  minetest.get_node(apos)
	if unode.name == 'air' then
		 minetest.add_node( upos, { name = 'riventest:chain'} )	
		extend_chain(upos)
	end
	if anode.name == 'air' then
		 minetest.add_node( apos, { name = 'riventest:chain'} )	
		extend_chain(apos)
	end	

end
minetest.register_node("riventest:chain", {
	description = "Chain",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"riventest_chain.png"},
	inventory_image = "riventest_chain.png",
	wield_image = "riventest_chain.png",
	paramtype = "light",
	walkable = false,
	climbable = true,
	--buildable_to = true,
	groups = {snappy=2,dig_immediate=3},
	sounds = default.node_sound_wood_defaults(),
	--after_place_node = extend_chain,
})
minetest.register_node("riventest:water_flowing", {
	description = "Flowing Water",
	inventory_image = minetest.inventorycube("riventest_altwater.png"),
	drawtype = "flowingliquid",
	tiles = {"riventest_altwater.png"},
	alpha = WATER_ALPHA,
	paramtype = "light",
--	light_source = 8,	
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "flowing",
	liquid_alternative_flowing = "riventest:water_flowing",
	liquid_alternative_source = "riventest:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	special_tiles = {
		{image="riventest_altwater.png", backface_culling=false},
		{image="riventest_altwater.png", backface_culling=true},
	},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("riventest:water_source", {
	description = "Water Source",
	inventory_image = minetest.inventorycube("riventest_altwater.png"),
	drawtype = "liquid",
	tiles = {"riventest_altwater.png"},
	alpha = WATER_ALPHA,
	paramtype = "light",
	light_source = 8,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "source",
	liquid_alternative_flowing = "riventest:water_flowing",
	liquid_alternative_source = "riventest:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{image="riventest_altwater.png", backface_culling=false},
	},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("riventest:beetle", {
	description = "Sign",
	drawtype = "signlike",
	tiles = {"riventest_beetle.png"},
	inventory_image = "riventest_beetle.png",
	wield_image = "riventest_beetle.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	light_source = 10,
	walkable = false,

	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})
minetest.register_node("riventest:dagger", {
	description = "Sign",
	drawtype = "signlike",
	tiles = {"riventest_dagger.png"},
	inventory_image = "riventest_dagger.png",
	wield_image = "riventest_dagger.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	on_add = "sign",
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_construct = function(pos)
		--local n =  minetest.get_node(pos)
		local meta =  minetest.get_meta(pos)
		meta:set_string("formspec", "hack:sign_text_input")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		local meta =  minetest.get_meta(pos)
		fields.text = fields.text or ""
		print((sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
})
minetest.register_tool("riventest:tool", {
	description = "Riven Dagger (tool)",
	inventory_image = "riventest_tool.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=6.00, [2]=3, [3]=1}, uses=10, maxlevel=3},
			cracky={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=5000, maxlevel=3},
			crumbly={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=5000, maxlevel=3},
			snappy={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=5000, maxlevel=3}
		}
	},
})

minetest.register_node("riventest:holocobble", {
	description = "Holographic Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = true,
	walkable = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("riventest:holostone", {
	description = "Holographic Stone",
	tiles = {"default_stone.png"},
	is_ground_content = true,
	walkable = false,
	groups = {cracky=3},
	--drop = 'default:cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_alias('rtt1', 'riventest:1')
minetest.register_alias('rtt2', 'riventest:2')
minetest.register_alias('rtt3', 'riventest:3')
minetest.register_alias('rtbluewood', 'riventest:woodblue')
minetest.register_alias('rtstone1', 'riventest:stone1')
minetest.register_alias('rtstone2', 'riventest:stone2')
minetest.register_alias('rtbluestone', 'riventest:stoneblue')
minetest.register_alias('rtmetal', 'riventest:metal')
minetest.register_alias('rtbulkhead', 'riventest:bulkhead')
minetest.register_alias('rtgold1', 'riventest:goldstone1')
minetest.register_alias('rtgold2', 'riventest:goldstone2')
minetest.register_alias('rtglass', 'riventest:glass')
minetest.register_alias('rtwood', 'riventest:wood')
minetest.register_alias('rtchain', 'riventest:chain')
minetest.register_alias('rtbeetle', 'riventest:beetle')
minetest.register_alias('rtdagger', 'riventest:dagger')
minetest.register_alias('rttool', 'riventest:tool')
minetest.register_alias('rtwater', 'riventest:water_source')
minetest.register_alias('bluebook', 'riventest:linkingbook')
minetest.register_alias('redbook', 'riventest:plinkingbook')


-- Moreblocks !
if moreblocks then
	table.insert(circular_saw.known_stairs,"riventest:wood")
	register_stair_slab_panel_micro("riventest", "wood", "riventest:wood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2},
		{"riventest_wood.png"},
		"Wooden",
		"wood",
	0)

	table.insert(circular_saw.known_stairs,"riventest:woodblue")
	register_stair_slab_panel_micro("riventest", "woodblue", "riventest:woodblue",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2},
		{"riventest_woodblue.png"},
		"Wooden Blue",
		"woodblue",
	0)

	table.insert(circular_saw.known_stairs,"riventest:metal")
	register_stair_slab_panel_micro("riventest", "metal", "riventest:metal",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2},
		{"riventest_metal.png"},
		"Metal",
		"metal",
	0)

	table.insert(circular_saw.known_stairs,"riventest:stoneblue")
	register_stair_slab_panel_micro("riventest", "stoneblue", "riventest:stoneblue",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2},
		{"riventest_stoneblue.png"},
		"Stone Blue",
		"stoneblue",
	0)

	table.insert(circular_saw.known_stairs,"riventest:rt4")
	register_stair_slab_panel_micro("riventest", "rt4", "riventest:rt4",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2},
		{"riventest_rt4.png"},
		"rt4",
		"rt4",
	0)
end