if (menu == 0 && play == 0)
{
    if keyboard_check_pressed(vk_up)
    {
        audio_play_sound(sfx_tick, 2, false)
        selected -= 1
        delete_confirm = 0
        if (selected < 0)
            selected = (ds_list_size(menu_options) - 1)
    }
    if keyboard_check_pressed(vk_down)
    {
        audio_play_sound(sfx_tick, 2, false)
        selected += 1
        delete_confirm = 0
        if (selected == ds_list_size(menu_options))
            selected = 0
    }
}
if (play == 1)
    obj_player.hspeed += 0.25
if mobile_button_deletesave()
{
    if (delete_confirm == 0)
        delete_confirm = 1
    else if (delete_confirm == 1)
    {
        file_delete((working_directory + "save.ini"))
        scr_screenshake(10, 20, 0.1)
        audio_play_sound(sfx_deletefile, 2, false)
        delete_confirm = 0
        instance_destroy(obj_deletesavebutton)
    }
}
if keyboard_check_pressed(ord("Z"))
{
    var item = ds_list_find_value(menu_options, selected)
    if (item == "PLAY")
    {
        if (play == 0)
        {
            play = 1
            audio_play_sound(sfx_tick, 2, false)
            audio_play_sound(sfx_play, 2, false)
            alarm[0] = 160
        }
    }
    else if (item == "DELETE SAVE FILE")
    {
        if (delete_confirm == 0)
            delete_confirm = 1
        else if (delete_confirm == 1)
        {
            file_delete((working_directory + "save.ini"))
            scr_screenshake(10, 20, 0.1)
            audio_play_sound(sfx_deletefile, 2, false)
            delete_confirm = 0
            selected = 0
            ds_list_delete(menu_options, 1)
        }
    }
    else if (item == "QUIT GAME")
        game_end()
}
if (device_mouse_check_button_pressed(0, mb_left) && global.mobile == 1 && (!(position_meeting(mouse_x, mouse_y, obj_deletesavebutton))))
{
    play = 1
    audio_play_sound(sfx_tick, 2, false)
    audio_play_sound(sfx_play, 2, false)
    alarm[0] = 160
}
