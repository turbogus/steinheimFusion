--[[

[SPEEDWALL] 
Mod permettant de creer simplement des murs coloré !!!

Crée par turbogus
code et graphisme sous licence GPL v2 ou superieur

]]--

--déclaration de la liste de couleurs ( dyes et differentes couleur de bloc )
local couleurs = {"black","blue","brown","cyan","green","grey","orange","pink","red","violet","white","yellow"}

--les blocs de speedwall :
for z=1,table.getn(couleurs) do
	
	--speedwall_sand :
	minetest.register_craft({
	output = "speedwall:sand"..couleurs[z].." 10",
	recipe = {
		{"dye:"..couleurs[z]..""},
		{"default:sand"},
		}
	})
	minetest.register_craft({
	output = "speedwall:sand"..couleurs[z].." 10",
	recipe = {
		{"dye:"..couleurs[z]..""},
		{"default:desert_sand"},
		}
	})
	minetest.register_node("speedwall:sand"..couleurs[z].."", {
		description = "Bloc de sable "..couleurs[z].."", 
		tiles = {"speedwall_sand_"..couleurs[z]..".png"}, 
		is_ground_content = true,
		groups = {crumbly=3, falling_node=1, sand=1},
		--sounds = default.node_sound_sand_defaults(),
	})

	--speedwall_sandstone :
	minetest.register_craft({
	output = "speedwall:sandstone"..couleurs[z].." 4",
	recipe = {
		{"dye:"..couleurs[z]..""},
		{"default:sandstone"},
		}
	})
	minetest.register_node("speedwall:sandstone"..couleurs[z].."", {
		description = "Bloc de sandstone "..couleurs[z].."", 
		tiles = {"speedwall_sandstone_"..couleurs[z]..".png"}, 
		is_ground_content = true,
		groups = {crumbly=2,cracky=3},
		--sounds = default.node_sound_sand_defaults(),
	})
	minetest.register_alias("simplewall:"..couleurs[z], "speedwall:sandstone"..couleurs[z])
	
	--speedwall_sandstone_brick :
	minetest.register_craft({
	output = "speedwall:sandstonebrick"..couleurs[z].." 2",
	recipe = {
		{"dye:"..couleurs[z]..""},
		{"default:sandstonebrick"},
		}
	})
	minetest.register_node("speedwall:sandstonebrick"..couleurs[z].."", {
		description = "Bloc de sandstone brick "..couleurs[z].."", 
		tiles = {"speedwall_sandstone_brick_"..couleurs[z]..".png"}, 
		is_ground_content = true,
		groups = {cracky=2},
		--sounds = default.node_sound_sand_defaults(),
	})
end

minetest.register_alias("simplewall:bitume", "speedwall:sandstoneblack")
