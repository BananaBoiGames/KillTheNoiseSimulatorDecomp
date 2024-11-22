if (!obj_deviceselect.selected)
{
    obj_deviceselect.selected = 1
    global.mobile = is_mobile
    audio_play_sound(sfx_tick, 8, false)
    audio_play_sound(sfx_play, 10, false)
    show_debug_message(("Set mobile to: " + string(selected)))
    alarm[0] = 120
}
