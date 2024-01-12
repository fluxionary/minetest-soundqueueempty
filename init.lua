minetest.register_chatcommand("test_sound_queue", {
    func = function(name, args)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "you must be logged in"
        end
        local handle = minetest.sound_play("queue_wind", {
            loop = true,
            object = player,
            max_hear_distance = 64,
            pitch = tonumber(args) or 8,
            gain = 0.125,
        })
        minetest.after(5, function()
            minetest.sound_stop(handle)
        end)
    end,
})
