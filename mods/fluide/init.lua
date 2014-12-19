-- Sève
--
-- code licence gpl v2 ou superieur
-- graphisme sous licence CC-BY-NC-SA
-- 
-- Par Jat et Turbogus
--
--*********************
--
--Génère de la sève pour la creation d'arbres géants
--La sève regénère la vie quand on se place en dessous
--Elle à les mêmes propriétés que l'eau
--
--Disponible uniquement pour le(s) administrateur(s) : utiliser /giveme seve:seve_source
--pour obtenir de la sève

minetest.register_craft ({
	output = "fluide:seve_source",
	recipe = {
		{"","default:mese",""},
		{"","default:mese",""},
		{"","bucket:bucket_water",""},
	}
})
	
--*********************
--Parametres du liquide
--*********************
WATER_ALPHA = 160
WATER_VISC = 1
LIGHT_MAX = 14

--**********************************************
--Gestion écoulement de la seve ( seve_flowing )
--**********************************************

minetest.register_node("fluide:seve_flowing", {			-- on enregistre le nom de l'item
	description = "Flowing Seve",				-- description dans le menu
	inventory_image = minetest.inventorycube("seve.png"),	-- on charge la skin du bloc dans l'inventaire du joueur
	drawtype = "flowingliquid",				-- type de bloc : ecoulement de liquide
	tiles = {"seve.png"},					-- on charge la skin du bloc dans le jeu
	special_tiles = {
		{name="seve.png", backface_culling=false},	-- parametres speciaux
		{name="seve.png", backface_culling=true},	-- //
	},
	alpha = WATER_ALPHA,					-- paramètre du liquide
	paramtype = "light",
	light_source = LIGHT_MAX - 3,				-- //
	walkable = false,					-- //
	pointable = false,					-- //
	diggable = false,					-- //
	buildable_to = true,					-- //
	liquidtype = "flowing",					-- //
	liquid_alternative_flowing = "fluide:seve_flowing",	-- //
	liquid_alternative_source = "fluide:seve_source",	-- //
	liquid_viscosity = WATER_VISC,				-- //
	post_effect_color = {a=64, r=100, g=100, b=200},	-- //
	groups = {water=3, liquid=3, puts_out_fire=1},		-- //
	
	
})


--*******************************************
--Gestion et cretion d'un bloc source de sève
--*******************************************

minetest.register_node("fluide:seve_source", {			-- Declaration du nom de l'item
	description = "Seve Source",				-- description dans l'inventaire
	inventory_image = minetest.inventorycube("seve.png"),	-- chargement de la skin pour l'inventaire
	drawtype = "liquid",					-- type de bloc : liquide
	tiles = {"seve.png"},					-- chargement skin pour jeu
	special_tiles = {
		-- New-style water source material (mostly unused)
		{name="seve.png", backface_culling=false},
	},
	alpha = WATER_ALPHA,					-- parametres du bloc
	paramtype = "light",
	light_source = LIGHT_MAX - 3,				-- //
	walkable = false,					-- //
	pointable = false,					-- //
	diggable = false,					-- //
	buildable_to = true,					-- //
	liquidtype = "source",
	liquid_alternative_flowing = "fluide:seve_flowing",	-- //
	liquid_alternative_source = "fluide:seve_source",	-- //
	liquid_viscosity = WATER_VISC,				-- //
	post_effect_color = {a=64, r=100, g=100, b=200},	-- //
	groups = {water=3, liquid=3, puts_out_fire=1},		-- //
})



--*****************************************
-- On gagne de la vie si on va dans la seve
--*****************************************

minetest.register_abm(									-- fonction permettant d'assigner une action à un bloc
    {nodenames = {"fluide:seve_flowing","fluide:seve_source"},							-- nom du bloc
    interval = 1.0,									-- ???
    chance = 1,										-- ???
    action = function(pos, node, active_object_count, active_object_count_wider)	-- fonction associée au bloc
    local objs = minetest.env:get_objects_inside_radius(pos, 1)				-- variable d'environnement : quand le joueur est dans le bloc
        for k, obj in pairs(objs) do							-- boucle "for" : 
        obj:set_hp(obj:get_hp()+1)     -- give 1HP					-- augmenter la vie HP du joueur de +1
    end
    end,
     
})


--=========================================================================================================================================================
--=========================================================================================================================================================

-- OR 

-- Fluide qui vous tue en un seul coup si vous le touchez

minetest.register_craft ({
	output = "fluide:or_source",
	recipe = {
		{"","default:mese",""},
		{"","default:mese",""},
		{"","bucket:bucket_lava",""},
	}
})

--**********************************************
--Gestion écoulement du liquide ( or_flowing )
--**********************************************

minetest.register_node("fluide:or_flowing", {			-- on enregistre le nom de l'item
	description = "Flowing Or",				-- description dans le menu
	inventory_image = minetest.inventorycube("or.png"),	-- on charge la skin du bloc dans l'inventaire du joueur
	drawtype = "flowingliquid",				-- type de bloc : ecoulement de liquide
	tiles = {"or.png"},					-- on charge la skin du bloc dans le jeu
	special_tiles = {
		{name="or.png", backface_culling=false},	-- parametres speciaux
		{name="or.png", backface_culling=true},	-- //
	},
	alpha = WATER_ALPHA,					-- paramètre du liquide
	paramtype = "light",
	light_source = LIGHT_MAX - 1,					-- //
	walkable = false,					-- //
	pointable = false,					-- //
	diggable = false,					-- //
	buildable_to = true,					-- //
	liquidtype = "flowing",					-- //
	liquid_alternative_flowing = "fluide:or_flowing",	-- //
	liquid_alternative_source = "fluide:or_source",		-- //
	liquid_viscosity = WATER_VISC,
	damage_per_second = 20*2,
	post_effect_color = {a=64, r=100, g=100, b=200},	-- //
	groups = {water=3, liquid=3, puts_out_fire=1},		-- //
	
	
})


--***********************************************
--Gestion et cretion d'un bloc source de liquide
--***********************************************

minetest.register_node("fluide:or_source", {			-- Declaration du nom de l'item
	description = "Or Source",				-- description dans l'inventaire
	inventory_image = minetest.inventorycube("or.png"),	-- chargement de la skin pour l'inventaire
	drawtype = "liquid",					-- type de bloc : liquide
	tiles = {"or.png"},					-- chargement skin pour jeu
	special_tiles = {
		-- New-style water source material (mostly unused)
		{name="or.png", backface_culling=false},
	},
	alpha = WATER_ALPHA,					-- parametres du bloc
	paramtype = "light",
	light_source = LIGHT_MAX - 1,				-- Le fluide Or emet de la lumiere
	walkable = false,					-- //
	pointable = false,					-- //
	diggable = false,					-- //
	buildable_to = true,					-- //
	liquidtype = "source",
	liquid_alternative_flowing = "fluide:or_flowing",	-- //
	liquid_alternative_source = "fluide:or_source",		-- //
	liquid_viscosity = WATER_VISC,
	damage_per_second = 20*2,
	post_effect_color = {a=64, r=100, g=100, b=200},	-- //
	groups = {water=3, liquid=3, puts_out_fire=1},		-- //
})

--=========================================================================================================================================================
--=========================================================================================================================================================


--gazole

-- Liquide extremement inflammable utilise en combustible dans les fours

minetest.register_node("fluide:gazole_flowing", {			-- on enregistre le nom de l'item
	description = "Flowing gazole",				-- description dans le menu
	inventory_image = minetest.inventorycube("gazole.png"),	-- on charge la skin du bloc dans l'inventaire du joueur
	drawtype = "flowingliquid",				-- type de bloc : ecoulement de liquide
	tiles = {"gazole.png"},					-- on charge la skin du bloc dans le jeu
	special_tiles = {
		{name="gazole.png", backface_culling=false},	-- parametres speciaux
		{name="gazole.png", backface_culling=true},	-- //
	},
	alpha = WATER_ALPHA,					-- paramètre du liquide
	paramtype = "light",
	light_source = LIGHT_MAX - 1,					-- //
	walkable = false,					-- //
	pointable = true,					-- //
	diggable = false,					-- //
	buildable_to = true,					-- //
	liquidtype = "flowing",					-- //
	liquid_alternative_flowing = "fluide:gazole_flowing",	-- //
	liquid_alternative_source = "fluide:gazole_source",		-- //
	liquid_viscosity = WATER_VISC,				-- //
	post_effect_color = {a=64, r=100, g=100, b=200},	-- //
	groups = {water=3, liquid=3, flammable=1},		-- //
	
	
})


--***********************************************
--Gestion et cretion d'un bloc source de liquide
--***********************************************

minetest.register_node("fluide:gazole_source", {			-- Declaration du nom de l'item
	description = "gazole Source",				-- description dans l'inventaire
	inventory_image = minetest.inventorycube("gazole.png"),	-- chargement de la skin pour l'inventaire
	drawtype = "liquid",					-- type de bloc : liquide
	tiles = {"gazole.png"},					-- chargement skin pour jeu
	special_tiles = {
		-- New-style water source material (mostly unused)
		{name="gazole.png", backface_culling=false},
	},
	alpha = WATER_ALPHA,					-- parametres du bloc
	paramtype = "light",
	light_source = LIGHT_MAX - 1,				-- Le fluide Or emet de la lumiere
	walkable = false,					-- //
	pointable = true,					-- //
	diggable = false,					-- //
	buildable_to = true,					-- //
	liquidtype = "source",
	liquid_alternative_flowing = "fluide:gazole_flowing",	-- //
	liquid_alternative_source = "fluide:gazole_source",	-- //
	liquid_viscosity = WATER_VISC,				-- //
	post_effect_color = {a=64, r=100, g=100, b=200},	-- //
	groups = {water=3, liquid=3, flammable=1},		-- //
})

--minetest.register_abm(									-- fonction permettant d'assigner une action à un bloc
--    {nodenames = {"fluide:gazole_flowing"},							-- nom du bloc
--    interval = 1.0,									-- ???
--    chance = 1,										-- ???
--    action = function(pos, node, active_object_count, active_object_count_wider)	-- fonction associée au bloc
--    local objs = minetest.env:get_objects_inside_radius(pos, 1)				-- variable d'environnement : quand le joueur est dans le bloc
--        for k, obj in pairs(objs) do							-- boucle "for" : 
--        obj:set_hp(obj:get_hp()-0.5)     					
--    end
--    end,
     
--})

-------------------
-- test pour bucket
-------------------

bucket.register_liquid(
	"fluide:gazole_source",
	"fluide:gazole_flowing",
	"fluide:bucket_gazole",
	"bucket_gazole.png",
	"Gazole Bucket"
)

bucket.register_liquid(
	"fluide:seve_source",
	"fluide:seve_flowing",
	"fluide:bucket_seve",
	"bucket_seve.png",
	"Seve Bucket"
)




