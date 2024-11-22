character = global.playercharacter
if (!global.mobile)
    key_attack = keyboard_check_pressed(ord("Z"))
else
    key_attack = mobile_button_z()
if (!global.mobile)
    key_x = keyboard_check_pressed(ord("X"))
else
    key_x = mobile_button_x()
if (!global.mobile)
    key_c = keyboard_check_pressed(ord("C"))
else
    key_c = mobile_button_c()
if (!global.mobile)
    key_quit = keyboard_check_pressed(vk_shift)
else
    key_quit = mobile_button_quit()
if (can_switch_timer > 0)
    can_switch_timer -= 1
if (state == (1 << 0) && black_effect < 1)
    black_effect += 0.1
if (global.messagetimer > 0)
    global.messagetimer -= 1
if changing_characters
{
    if (current_menu == 1)
    {
        if (keyboard_check_pressed(vk_up) || mobile_button_up())
        {
            audio_play_sound(sfx_tick, 2, false)
            selected -= 1
            if (selected < 0)
                selected = (ds_list_size(global.characters) - 1)
        }
        if (keyboard_check_pressed(vk_down) || mobile_button_down())
        {
            audio_play_sound(sfx_tick, 2, false)
            selected += 1
            if (selected == ds_list_size(global.characters))
                selected = 0
        }
        if (keyboard_check_pressed(ord("Z")) || mobile_button_z())
        {
            audio_play_sound(sfx_tick, 2, false)
            selected_character = selected
            current_menu = 2
            selected = 0
        }
    }
    else if (current_menu == 2)
    {
        if (keyboard_check_pressed(vk_up) || mobile_button_up())
        {
            audio_play_sound(sfx_tick, 2, false)
            selected -= 1
            if (selected < 0)
                selected = (ds_list_size(character_positions) - 1)
        }
        if (keyboard_check_pressed(vk_down) || mobile_button_down())
        {
            audio_play_sound(sfx_tick, 2, false)
            selected += 1
            if (selected == ds_list_size(character_positions))
                selected = 0
        }
        if (keyboard_check_pressed(ord("Z")) || mobile_button_z())
        {
            if (selected == 0)
            {
                global.playercharacter = array_get(ds_list_find_value(global.characters, selected_character), 3)
                global.playersupersound = array_get(ds_list_find_value(global.characters, selected_character), 4)
                save_game()
                show_debug_message(("Switch player character to: " + global.playercharacter))
            }
            else
            {
                global.enemycharacter = array_get(ds_list_find_value(global.characters, selected_character), 3)
                global.enemyscream = array_get(ds_list_find_value(global.characters, selected_character), 5)
                global.afterimage_color = array_get(ds_list_find_value(global.characters, selected_character), 6)
                save_game()
                show_debug_message(("Switch enemy character to: " + global.playercharacter))
            }
            audio_play_sound(sfx_characterswitch, 2, false)
            current_menu = 0
            selected = 0
        }
    }
    else if (current_menu == 0)
    {
        if (keyboard_check_pressed(vk_up) || mobile_button_up())
        {
            audio_play_sound(sfx_tick, 2, false)
            selected -= 1
            if (selected < 0)
                selected = (ds_list_size(menu_options) - 1)
        }
        if (keyboard_check_pressed(vk_down) || mobile_button_down())
        {
            audio_play_sound(sfx_tick, 2, false)
            selected += 1
            if (selected == ds_list_size(menu_options))
                selected = 0
        }
        if (keyboard_check_pressed(ord("Z")) || mobile_button_z())
        {
            if (selected == 0)
            {
                current_menu = 1
                selected = 0
            }
            else
            {
                current_menu = 3
                selected = 0
            }
            audio_play_sound(sfx_tick, 2, false)
        }
    }
    else if (current_menu == 3)
    {
        if (keyboard_check_pressed(vk_up) || mobile_button_up())
        {
            audio_play_sound(sfx_tick, 2, false)
            selected -= 1
            if (selected < 0)
                selected = (ds_list_size(global.stages) - 1)
        }
        if (keyboard_check_pressed(vk_down) || mobile_button_down())
        {
            audio_play_sound(sfx_tick, 2, false)
            selected += 1
            if (selected == ds_list_size(global.stages))
                selected = 0
        }
        if (keyboard_check_pressed(ord("Z")) || mobile_button_z())
        {
            audio_play_sound(sfx_tick, 2, false)
            changing_characters = 0
            audio_stop_all()
            room_goto(array_get(ds_list_find_value(global.stages, selected), 3))
            global.currentstage = array_get(ds_list_find_value(global.stages, selected), 3)
            selected = 0
            save_game()
        }
    }
    if (key_c && can_switch_timer <= 0)
    {
        if (current_menu == 2)
        {
            selected = 0
            current_menu = 1
        }
        else if (current_menu == 1)
        {
            selected = 0
            current_menu = 0
        }
        else
        {
            current_menu = 0
            selected = 0
            changing_characters = 0
            if global.mobile
            {
                if instance_exists(obj_upbutton)
                    instance_destroy(obj_upbutton)
                if instance_exists(obj_downbutton)
                    instance_destroy(obj_downbutton)
            }
        }
        can_switch_timer = 10
        audio_play_sound(sfx_tick, 2, false)
    }
}
switch state
{
    case (0 << 0):
        scr_player_normal()
        break
    case (1 << 0):
        scr_player_ready()
        break
    case (2 << 0):
        scr_player_punch()
        break
    case (3 << 0):
        scr_player_win()
        break
    case (4 << 0):
        break
}

if (flash > 0)
    flash -= 0.025
scr_collide()
