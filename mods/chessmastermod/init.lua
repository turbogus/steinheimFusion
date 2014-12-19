-- ChessMaster_Mod Code Libre Ze.-=Lua Minetest Steinheim=-

--
-- Register Node
--

-- Plateau

minetest.register_node("chessmastermod:bordEchec",{
  description = 'Jeu Echec Plateau ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  drawtype = 'nodebox',
  tiles = {
   'chess_bord.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5}, 
		}
	}
})

minetest.register_node("chessmastermod:plateauNoir",{
  description = 'Jeu Echec Plateau ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  drawtype = 'nodebox',
  tiles = {
   'chess_plateaunoir.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5}, 
		}
	}
})

minetest.register_node("chessmastermod:plateauBlanc",{
  description = 'Jeu Echec Plateau ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  drawtype = 'nodebox',
  tiles = {
   'chess_plateaublanc.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5}, 
		}
	}
})


-- Pieces

minetest.register_node("chessmastermod:pionNoir",{
  description = 'Echec PionNoir ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Pion Noir "..
				meta:get_string("owner")..")")
	end,

  drawtype = 'nodebox',
  tiles = {
   'chess_pionsnoir.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875,-0.5,-0.1875,0.1875,-0.375,0.1875}, 
			{-0.125,-0.375,-0.125,0.125,-0.3125,0.125}, 
		     {-0.0625,-0.3125,-0.0625,0.0625,-0.125,0.0625}, 
			{-0.125,-0.125,-0.125,0.125,0.125,0.125},
		}
	}
})


minetest.register_node("chessmastermod:pionBlanc",{
  description = 'Echec PionBlanc ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Pion Blanc "..
				meta:get_string("owner")..")")
	end,

  drawtype = 'nodebox',
  tiles = {
   'chess_pionsblanc.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875,-0.5,-0.1875,0.1875,-0.375,0.1875}, 
			{-0.125,-0.375,-0.125,0.125,-0.3125,0.125}, 
		     {-0.0625,-0.3125,-0.0625,0.0625,-0.125,0.0625}, 
			{-0.125,-0.125,-0.125,0.125,0.125,0.125},
		}
	}
})

minetest.register_node("chessmastermod:tourBlanc",{
  description = 'Echec TourBlanc ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Tour Blanc "..
				meta:get_string("owner")..")")
	end,

  drawtype = 'nodebox',
  tiles = {
   'chess_pionsblanc.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,-0.5,-0.3125,0.3125,-0.375,0.3125}, 
			{-0.25,-0.375,-0.25,0.25,-0.3125,0.25}, 
		    {-0.1875,-0.3125,-0.1875,0.1875,-0.0625,0.1875}, 
			{-0.25,-0.0625,-0.25,0.25,0.1875,0.25}, 
			{0.0625,0.1875,-0.25,0.25,0.3125,-0.0625}, 
			{-0.25,0.1875,0.0625,-0.0625,0.3125,0.25}, 
			{-0.25,0.1875,-0.25,-0.125,0.3125,-0.0625}, 
			{0.0625,0.1875,0.0625,0.25,0.3125,0.25}, 
		}
	}
})

minetest.register_node("chessmastermod:tourNoir",{
  description = 'Echec TourNoir ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Tour Noir "..
				meta:get_string("owner")..")")
	end,

  drawtype = 'nodebox',
  tiles = {
   'chess_pionsnoir.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,-0.5,-0.3125,0.3125,-0.375,0.3125}, 
			{-0.25,-0.375,-0.25,0.25,-0.3125,0.25}, 
		    {-0.1875,-0.3125,-0.1875,0.1875,-0.0625,0.1875}, 
			{-0.25,-0.0625,-0.25,0.25,0.1875,0.25}, 
			{0.0625,0.1875,-0.25,0.25,0.3125,-0.0625}, 
			{-0.25,0.1875,0.0625,-0.0625,0.3125,0.25}, 
			{-0.25,0.1875,-0.25,-0.125,0.3125,-0.0625}, 
			{0.0625,0.1875,0.0625,0.25,0.3125,0.25}, 
		}
	}
})

minetest.register_node("chessmastermod:fouNoir",{
  description = 'Echec FouNoir ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Fou Noir "..
				meta:get_string("owner")..")")
	end,


  drawtype = 'nodebox',
  tiles = {
   'chess_pionsnoir.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,-0.5,-0.3125,0.3125,-0.375,0.3125}, 
			{-0.25,-0.375,-0.25,0.25,-0.3125,0.25}, 
			{-0.125,-0.3125,-0.125,0.125,0,0.125}, 
			{-0.1875,0,-0.1875,0.1875,0.25,0.1875}, 
			{-0.125,0.25,-0.125,0.125,0.375,0.125}, 
			{-0.0625,0.375,-0.0625,0.0625,0.5,0.0625}, 
		}
	}
})

minetest.register_node("chessmastermod:fouBlanc",{
  description = 'Echec FouBlanc ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Fou Blanc "..
				meta:get_string("owner")..")")
	end,
  drawtype = 'nodebox',
  tiles = {
   'chess_pionsblanc.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,-0.5,-0.3125,0.3125,-0.375,0.3125}, 
			{-0.25,-0.375,-0.25,0.25,-0.3125,0.25}, 
			{-0.125,-0.3125,-0.125,0.125,0,0.125}, 
			{-0.1875,0,-0.1875,0.1875,0.25,0.1875}, 
			{-0.125,0.25,-0.125,0.125,0.375,0.125}, 
			{-0.0625,0.375,-0.0625,0.0625,0.5,0.0625}, 
		}
	}
})

minetest.register_node("chessmastermod:cavalierBlanc",{
  description = 'Echec CavalierBlanc ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Cavalier Blanc "..
				meta:get_string("owner")..")")
	end,

  drawtype = 'nodebox',
  tiles = {
   'chess_pionsblanc.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,-0.5,-0.3125,0.3125,-0.375,0.3125}, 
			{-0.25,-0.375,-0.25,0.25,-0.3125,0.25}, 
			{-0.125,-0.3125,-0.1875,0.125,0,0.1875}, 
			{-0.0625,0,-0.25,0.0625,0.25,0.25}, 
			{-0.0625,0.25,-0.1875,0.0625,0.3125,0.1875}, 
			{-0.0625,-0.125,0.25,0.0625,0.1875,0.375}, 
			{-0.0625,0,-0.375,0.0625,0.1875,-0.25}, 
			{-0.0625,0,-0.5,0.0625,0.125,-0.375}, 
			{-0.0625,0.3125,-0.0625,0.0625,0.375,0.1875}, 
		}
	}
})

minetest.register_node("chessmastermod:cavalierNoir",{
  description = 'Echec CavalierNoir ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Cavalier Noir "..
				meta:get_string("owner")..")")
	end,

  drawtype = 'nodebox',
  tiles = {
   'chess_pionsnoir.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,-0.5,-0.3125,0.3125,-0.375,0.3125}, 
			{-0.25,-0.375,-0.25,0.25,-0.3125,0.25}, 
			{-0.125,-0.3125,-0.1875,0.125,0,0.1875}, 
			{-0.0625,0,-0.25,0.0625,0.25,0.25}, 
			{-0.0625,0.25,-0.1875,0.0625,0.3125,0.1875}, 
			{-0.0625,-0.125,0.25,0.0625,0.1875,0.375}, 
			{-0.0625,0,-0.375,0.0625,0.1875,-0.25}, 
			{-0.0625,0,-0.5,0.0625,0.125,-0.375}, 
			{-0.0625,0.3125,-0.0625,0.0625,0.375,0.1875}, 
		}
	}
})

minetest.register_node("chessmastermod:reineNoir",{
  description = 'Echec ReineNoir ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Reine Noir "..
				meta:get_string("owner")..")")
	end,

  drawtype = 'nodebox',
  tiles = {
   'chess_pionsnoir.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,-0.5,-0.3125,0.3125,-0.375,0.3125}, 
			{-0.25,-0.5,-0.25,0.25,-0.3125,0.25}, 
		    {-0.1875,-0.3125,-0.1875,0.1875,-0.1875,0.1875}, 
			{-0.125,-0.1875,-0.125,0.125,0.125,0.125}, 
			{-0.25,0.125,-0.25,0.25,0.375,0.25}, 
			{0.125,0.375,-0.25,0.25,0.4125,-0.125}, 
			{0.125,0.375,0.125,0.25,0.4125,0.25}, 
			{-0.25,0.375,-0.25,-0.125,0.4125,-0.125}, 
			{-0.25,0.375,0.125,-0.125,0.4125,0.25}, 
			{-0.25,-0.0625,-0.25,0.25,0,0.25}, 
			{-0.125,0.375,-0.125,0.125,0.4375,0.125}, 
			{-0.0625,0.425,-0.0625,0.0625,0.5,0.0625}, 
		}
	}
})


minetest.register_node("chessmastermod:reineBlanc",{
  description = 'Echec ReineBlanc ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Reine Blanc "..
				meta:get_string("owner")..")")
	end,
  drawtype = 'nodebox',
  tiles = {
   'chess_pionsblanc.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,-0.5,-0.3125,0.3125,-0.375,0.3125}, 
			{-0.25,-0.5,-0.25,0.25,-0.3125,0.25}, 
		    {-0.1875,-0.3125,-0.1875,0.1875,-0.1875,0.1875}, 
			{-0.125,-0.1875,-0.125,0.125,0.125,0.125}, 
			{-0.25,0.125,-0.25,0.25,0.375,0.25}, 
			{0.125,0.375,-0.25,0.25,0.4125,-0.125}, 
			{0.125,0.375,0.125,0.25,0.4125,0.25}, 
			{-0.25,0.375,-0.25,-0.125,0.4125,-0.125}, 
			{-0.25,0.375,0.125,-0.125,0.4125,0.25}, 
			{-0.25,-0.0625,-0.25,0.25,0,0.25}, 
			{-0.125,0.375,-0.125,0.125,0.4375,0.125}, 
			{-0.0625,0.425,-0.0625,0.0625,0.5,0.0625}, 
		}
	}
})

minetest.register_node("chessmastermod:roiBlanc",{
  description = 'Echec RoiBlanc ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Roi Blanc "..
				meta:get_string("owner")..")")
	end,

  drawtype = 'nodebox',
  tiles = {
   'chess_pionsblanc.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.375,-0.5,-0.375,0.375,-0.375,0.375}, 
			{-0.3125,-0.5,-0.3125,0.3125,-0.3125,0.3125}, 
			{-0.25,-0.3125,-0.25,0.25,-0.1875,0.25}, 
			{-0.1875,-0.1875,-0.1875,0.1875,0.125,0.1875}, 
			{-0.3125,0.125,-0.3125,0.3125,0.375,0.3125}, 
			{0.125,0.375,-0.25,0.25,0.5,-0.125}, 
			{0.125,0.375,0.125,0.25,0.5,0.25}, 
			{-0.25,0.375,-0.25,-0.125,0.5,-0.125}, 
			{-0.25,0.375,0.125,-0.125,0.5,0.25}, 
			{-0.25,0,-0.25,0.25,0.125,0.25}, 
			{-0.25,0.45,-0.25,0.25,0.5,0.25},
			{-0.0625,0.425,-0.0625,0.0625,0.5,0.0625}, 			{-0.3125,-0.125,-0.3125,0.3125,-0.0625,0.3125}, 
		}
	}
})

minetest.register_node("chessmastermod:roiNoir",{
  description = 'Echec RoiNoir ',
  paramtype = 'light',
  paramtype2 = 'facedir',
  is_ground_content = true,
  groups = {cracky=3},
  after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "(Roi Noir "..
				meta:get_string("owner")..")")
	end,

  drawtype = 'nodebox',
  tiles = {
   'chess_pionsnoir.png',
  },

selection_box = {
    type = 'fixed',
    fixed = { -1/3, -1/3, -1/3, 1/3, 1/3, 1/3 }
  },

	node_box = {
		type = "fixed",
		fixed = {
			{-0.375,-0.5,-0.375,0.375,-0.375,0.375}, 
			{-0.3125,-0.5,-0.3125,0.3125,-0.3125,0.3125}, 
			{-0.25,-0.3125,-0.25,0.25,-0.1875,0.25}, 
			{-0.1875,-0.1875,-0.1875,0.1875,0.125,0.1875}, 
			{-0.3125,0.125,-0.3125,0.3125,0.375,0.3125}, 
			{0.125,0.375,-0.25,0.25,0.5,-0.125}, 
			{0.125,0.375,0.125,0.25,0.5,0.25}, 
			{-0.25,0.375,-0.25,-0.125,0.5,-0.125}, 
			{-0.25,0.375,0.125,-0.125,0.5,0.25}, 
			{-0.25,0,-0.25,0.25,0.125,0.25}, 
			{-0.25,0.45,-0.25,0.25,0.5,0.25},
			{-0.0625,0.425,-0.0625,0.0625,0.5,0.0625}, 			{-0.3125,-0.125,-0.3125,0.3125,-0.0625,0.3125}, 
		}
	}
})




-- http://steinheim.vraiforum.com/index.php
