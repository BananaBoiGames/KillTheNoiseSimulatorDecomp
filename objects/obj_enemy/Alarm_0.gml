global.earnedpoints = round((global.score / 100))
global.pizzapoints += global.earnedpoints
global.gamesplayed += 1
show_debug_message(("Games Played: " + string(global.gamesplayed)))
if (global.score > global.record)
{
    global.record = global.score
    obj_player.new_record = 1
    audio_play_sound(sfx_newrecord, 8, false)
}
global.timescale = 1
audio_stop_sound(mu_killmusic)
audio_play_sound(sfx_cheers, 7, false)
obj_camera.target = obj_player
obj_player.flash = 1
obj_player.x = (room_width / 2)
obj_player.state = (3 << 0)
check_unlocks()
save_game()
instance_destroy()
