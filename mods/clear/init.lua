local old_nodes = {"moretrees:apple_blossome","holo:holo:",
				"maptools:wood", "bushes:youngtree2_bottom", "bushes:bushbranches1", "bushes:bushbranches2", "bushes:BushLeaves1", "bushes:BushLeaves2",
				 "stoneage:grass_with_silex", 
				 "sumpf:peat", "sumpf:sumpf", "bushes:bushbranches", "bushes:BushLeaves", "bushes:youngtree2_bottom",
				 "bushes:youngtree2_bottom", "bushes:bushbranches2", "bushes:BushLeaves1", "cavestuff:pebble_1", 
				 "cavestuff:pebble_2", "cavestuff:desert_pebble_1", "cavestuff:desert_pebble_2", "cavestuff:stalactite_1", 
				 "cavestuff:stalactite_2", "cavestuff:stalactite_3", "dryplants:sickle", "dryplants:grass", "dryplants:hay", 
				 "dryplants:grass_short", "dryplants:juncus", "dryplants:juncus_02", "dryplants:grass_short", "dryplants:wetreed", 
				 "dryplants:wetreed_slab", "dryplants:wetreed_roof", "dryplants:wetreed_roof_corner", "dryplants:wetreed_roof_corner_2", 
				 "dryplants:reed", "dryplants:reed_slab", "dryplants:reed_roof", "dryplants:reed_roof_corner", "dryplants:reed_roof_corner_2", 
				 "dryplants:reedmace_spikes", "dryplants:reedmace_top", "dryplants:reedmace_height_2", "dryplants:reedmace_height_3", "dryplants:reedmace_height_3_spikes", 
				 "dryplants:reedmace", "dryplants:reedmace_bottom", "dryplants:reedmace_sapling", "dryplants:reedmace_water", 
				 "ferns:fern_01", "ferns:fern_02", "ferns:fern_03", "ferns:fern_04", "archaeplantae:fern", "archaeplantae:fern_mid", "archaeplantae:fern_small", 
				 "ferns:tree_fern_leaves_giant", "ferns:tree_fern_leave_big", "ferns:tree_fern_leave_big_end", "ferns:fern_trunk_big_top", "ferns:fern_trunk_big", "ferns:sapling_giant_tree_fern", 
				 "ferns:horsetail_01", "ferns:horsetail_02", "ferns:horsetail_03", "ferns:horsetail_04", 
				 "ferns:sapling_tree_fern", "ferns:tree_fern_leaves", "ferns:tree_fern_leaves_02", "ferns:fern_trunk", "ferns:sapling_tree_fern", 
				 "flowers:waterlily", "flowers:waterlily_225", "flowers:waterlily_45", "flowers:waterlily_675", "flowers:waterlily_s1", "flowers:waterlily_s2", "flowers:waterlily_s3", "flowers:waterlily_s4", "flowers:seaweed", "flowers:seaweed_2", "flowers:seaweed_3", "flowers:seaweed_4",
				 "molehills:molehill", 
				 "mushroom:brown", "mushroom:red", "mushroom:spore_brown", "mushroom:spore_red", "mushroom:brown_natural", "mushroom:red_natural", "poisonivy:seedling", "poisonivy:sproutling", "poisonivy:climbing", 
				 "trunks:twig", "trunks:twig_1", "trunks:moss", "trunks:moss_fungus", "woodstuff:twigs", "trunks:twigs_slab", "trunks:twigs_roof", "trunks:twigs_roof_corner", "trunks:twigs_roof_corner_2", 
				 "vines:rope_block", "vines:rope", "vines:rope_end", "vines:side", "vines:side_rotten", "vines:willow", "vines:willow_rotten", "vines:root", "vines:vine", "vines:vine_rotten", 
				 "woodsoils:dirt_with_leaves_1", "woodsoils:dirt_with_leaves_2", "woodsoils:grass_with_leaves_1", "woodsoils:grass_with_leaves_2", 
				 "youngtrees:bamboo", "youngtrees:youngtree2_middle", "youngtrees:youngtree_top", "youngtrees:youngtree_middle", "youngtrees:youngtree_bottom"
				   }
local old_entities = {}

for _,node_name in ipairs(old_nodes) do
    minetest.register_node(":"..node_name, {
        groups = {old=1},
    })
end

minetest.register_abm({
    nodenames = {"group:old"},
    interval = 1,
    chance = 1,
    action = function(pos, node)
        minetest.env:remove_node(pos)
    end,
})

for _,entity_name in ipairs(old_entities) do
    minetest.register_entity(":"..entity_name, {
        on_activate = function(self, staticdata)
            self.object:remove()
        end,
    })
end
