local S = homedecor.gettext

local bookcolors = {
	{ "red",    "#c00000:150" },
	{ "green",  "#008000:150" },
	{ "blue",   "#4040c0:150" },
	{ "violet", "#600070:150" },
	{ "grey",   "#202020:150" },
	{ "brown",  "#603010:175" }
}

local BOOK_FORMNAME = "homedecor:book_form"

for c in ipairs(bookcolors) do
	local color   = bookcolors[c][1]
	local color_d = S(bookcolors[c][1])
	local hue     = bookcolors[c][2]

	local function book_dig(pos, node, digger)
		if minetest.is_protected(pos, digger:get_player_name()) then return end
		local meta = minetest.get_meta(pos)
		local stack = ItemStack({
			name = "homedecor:book_"..color,
			metadata = meta:get_string("text"),
		})
		stack = digger:get_inventory():add_item("main", stack)
		if not stack:is_empty() then
			minetest.item_drop(stack, digger, pos)
		end
		minetest.remove_node(pos)
	end

	local inv_img = "homedecor_book_inv.png^[colorize:"..hue.."^homedecor_book_trim_inv.png"

	homedecor.register("book_"..color, {
		description = S("Writable Book (%s)"):format(color_d),
		mesh = "homedecor_book.obj",
		tiles = {
			"(homedecor_book_cover.png^[colorize:"..hue..")^homedecor_book_cover_trim.png",
			"homedecor_book_edges.png"
		},
		inventory_image = inv_img,
		wield_image = inv_img,
		groups = { snappy=3, oddly_breakable_by_hand=3, book=1 },
		walkable = false,
		stack_max = 1,
		on_rightclick = function(pos, node, clicker)
			local fdir = node.param2
			minetest.swap_node(pos, { name = "homedecor:book_open_"..color, param2 = fdir })
		end,
		on_place = function(itemstack, placer, pointed_thing)
			local plname = placer:get_player_name()
			local pos = pointed_thing.under
			local node = minetest.get_node(pos)
			local n = minetest.registered_nodes[node.name]
			if not n.buildable_to then
				pos = pointed_thing.above
				node = minetest.get_node(pos)
				n = minetest.registered_nodes[node.name]
				if not n.buildable_to then return end
			end
			if minetest.is_protected(pos, plname) then return end
			local fdir = minetest.dir_to_facedir(placer:get_look_dir())
			minetest.set_node(pos, {
				name = "homedecor:book_"..color,
				param2 = fdir,
			})
			local text = itemstack:get_metadata() or ""
			local meta = minetest.get_meta(pos)
			meta:set_string("text", text)
			local data = minetest.deserialize(text) or {}
			if data.title and data.title ~= "" then
				meta:set_string("infotext", data.title)
			end
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end,
		on_dig = book_dig,
		on_use = function(itemstack, user, pointed_thing)
			local player_name = user:get_player_name()
			local data = minetest.deserialize(itemstack:get_metadata())
			local title, text, owner = "", "", player_name
			if data then
				title, text, owner = data.title, data.text, data.owner
			end
			local formspec
			if owner == player_name then
				formspec = "size[8,8]"..default.gui_bg..default.gui_bg_img..
					"field[0.5,1;7.5,0;title;Book title :;"..
						minetest.formspec_escape(title).."]"..
					"textarea[0.5,1.5;7.5,7;text;Book content :;"..
						minetest.formspec_escape(text).."]"..
					"button_exit[2.5,7.5;3,1;save;Save]"
			else
				formspec = "size[8,8]"..default.gui_bg..
				"button_exit[7,0.25;1,0.5;close;X]"..
				default.gui_bg_img..
					"label[0.5,0.5;by "..owner.."]"..
					"label[0.5,0;"..minetest.formspec_escape(title).."]"..
					"textarea[0.5,1.5;7.5,7;;"..minetest.formspec_escape(text)..";]"
			end
			minetest.show_formspec(user:get_player_name(), BOOK_FORMNAME, formspec)
		end,
		selection_box = {
		        type = "fixed",
				fixed = {-0.2, -0.5, -0.25, 0.2, -0.35, 0.25}
		}
	})

	homedecor.register("book_open_"..color, {
		mesh = "homedecor_book_open.obj",
		tiles = {
			"(homedecor_book_cover.png^[colorize:"..hue..")^homedecor_book_cover_trim.png",
			"homedecor_book_edges.png",
			"homedecor_book_pages.png"
		},
		groups = { snappy=3, oddly_breakable_by_hand=3, not_in_creative_inventory=1 },
		drop = "homedecor:book_"..color,
		walkable = false,
		on_dig = book_dig,
		on_rightclick = function(pos, node, clicker)
			local fdir = node.param2
			minetest.swap_node(pos, { name = "homedecor:book_"..color, param2 = fdir })
			minetest.sound_play("homedecor_book_close", {
				pos=pos,
				max_hear_distance = 3,
				gain = 2,
				})
		end,
		selection_box = {
		        type = "fixed",
				fixed = {-0.35, -0.5, -0.25, 0.35, -0.4, 0.25}
		}
	})

end

minetest.register_on_player_receive_fields(function(player, form_name, fields)
	if form_name ~= BOOK_FORMNAME or not fields.save then
		return
	end
	local stack = player:get_wielded_item()
	if minetest.get_item_group(stack:get_name(), "book") == 0 then
		return
	end
	local data = minetest.deserialize(stack:get_metadata()) or {}
	data.title, data.text, data.owner =
		fields.title, fields.text, player:get_player_name()
	stack:set_metadata(minetest.serialize(data))
	player:set_wielded_item(stack)
	minetest.log("action", player:get_player_name().." has written in a book (title: \""..fields.title.."\"): \""..fields.text..
		"\" at location: "..minetest.pos_to_string(player:getpos()))
end)
