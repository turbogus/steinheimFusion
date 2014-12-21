local S

if rawget(_G,"intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end

  
dofile(minetest.get_modpath("bobblocks") .. "/blocks.lua")
dofile(minetest.get_modpath("bobblocks") .. "/health.lua")
dofile(minetest.get_modpath("bobblocks") .. "/trap.lua")

print("[BobBlocks By minetest@rabbibob.com] Version 0.0.6 loaded!")