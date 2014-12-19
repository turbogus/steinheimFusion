antiguest_message = "Please use a different name, Guests are not allowed here."
antiguest_allowed_time = 3

minetest.register_on_joinplayer(function(player)
	local playername = player:get_player_name()
	local pos = player:getpos()
	if playername:match("Guest%d*") == playername then
		print("[antiguest] Guest detected")
		minetest.after(antiguest_allowed_time, function() --important because of stuff like inventory plus
			minetest.chat_send_player(playername, antiguest_message)
			player:remove()
		end, pos)
	end
end)
