function scr_player_normal() //scr_player_normal
{
    image_speed = 0.4
    sprite_index = scr_characterspr(spr_playerP_idle)
    if ((key_attack && (!changing_characters) && can_switch_timer <= 0 && (!global.mobile)) || (key_attack && (!changing_characters) && can_switch_timer <= 0 && (!(instance_position(mouse_x, mouse_y, obj_cbutton))) && global.mobile))
    {
        if (quit_confirm == 1)
        {
            quitting = 0
            quit_confirm = 0
        }
        else
        {
            audio_play_sound(sfx_blackoutpunch, 4, false)
            obj_enemy.state = (1 << 0)
            state = (1 << 0)
        }
    }
    if (key_c && (!changing_characters) && can_switch_timer <= 0)
    {
        changing_characters = 1
        can_switch_timer = 10
        audio_play_sound(sfx_tick, 2, false)
        if global.mobile
        {
            instance_create_depth(((room_width - sprite_width) - 100), ((room_height - sprite_height) - 50), -100, obj_upbutton)
            instance_create_depth(((room_width - sprite_width) - 100), (room_height - sprite_height), -100, obj_downbutton)
        }
    }
    if (key_x && (!changing_characters) && can_switch_timer <= 0)
    {
        audio_play_sound(sfx_tick, 2, false)
        room_goto(rm_shop)
    }
    if (key_quit && (!changing_characters) && can_switch_timer <= 0)
    {
        if (quit_confirm == 0)
        {
            quit_confirm = 1
            quitting = 1
        }
        else if (quit_confirm == 1)
        {
            save_game()
            audio_stop_all()
            room_goto(rm_mainmenu)
        }
    }
    vsp += grv
}

