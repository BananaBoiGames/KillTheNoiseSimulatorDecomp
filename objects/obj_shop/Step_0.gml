array_set(ds_list_find_value(upgrades, 0), 1, (10 + (15 * global.powerlevel)))
array_set(ds_list_find_value(upgrades, 1), 1, (10 + (15 * global.bouncelevel)))
array_set(ds_list_find_value(upgrades, 0), 2, ("launch the noise farther. current power: " + string(global.power)))
array_set(ds_list_find_value(upgrades, 1), 2, ("makes the noise bounce more. current bounce: " + string(global.bounce)))
character_count = ds_list_size(shop_characters)
stage_count = ds_list_size(shop_stages)
for (var i = 0; i < ds_list_size(shop_characters); i += 1)
{
    for (var j = 0; j < ds_list_size(global.characters); j += 1)
    {
        if (array_get(ds_list_find_value(shop_characters, i), 0) == array_get(ds_list_find_value(global.characters, j), 0))
        {
            show_debug_message("Found character match! Deleting...")
            ds_list_delete(shop_characters, i)
        }
    }
}
for (i = 0; i < ds_list_size(shop_stages); i += 1)
{
    for (j = 0; j < ds_list_size(global.stages); j += 1)
    {
        if (array_get(ds_list_find_value(shop_stages, i), 0) == array_get(ds_list_find_value(global.stages, j), 0))
        {
            show_debug_message("Found stage match! Deleting...")
            ds_list_delete(shop_stages, i)
        }
    }
}
if (menu == 0)
{
    if (keyboard_check_pressed(vk_up) || mobile_button_up())
    {
        audio_play_sound(sfx_tick, 2, false)
        selected -= 1
        if (selected < 0)
            selected = (menu_count - 1)
    }
    if (keyboard_check_pressed(vk_down) || mobile_button_down())
    {
        audio_play_sound(sfx_tick, 2, false)
        selected += 1
        if (selected == menu_count)
            selected = 0
    }
}
else if (menu == 1)
{
    if (keyboard_check_pressed(vk_up) || mobile_button_up())
    {
        audio_play_sound(sfx_tick, 2, false)
        selected -= 1
        if (selected < 0)
            selected = (upgrade_count - 1)
    }
    if (keyboard_check_pressed(vk_down) || mobile_button_down())
    {
        audio_play_sound(sfx_tick, 2, false)
        selected += 1
        if (selected == upgrade_count)
            selected = 0
    }
}
else if (menu == 2)
{
    if (keyboard_check_pressed(vk_up) || mobile_button_up())
    {
        audio_play_sound(sfx_tick, 2, false)
        selected -= 1
        if (selected < 0)
            selected = (character_count - 1)
    }
    if (keyboard_check_pressed(vk_down) || mobile_button_down())
    {
        audio_play_sound(sfx_tick, 2, false)
        selected += 1
        if (selected == character_count)
            selected = 0
    }
}
else if (menu == 3)
{
    if (keyboard_check_pressed(vk_up) || mobile_button_up())
    {
        audio_play_sound(sfx_tick, 2, false)
        selected -= 1
        if (selected < 0)
            selected = (stage_count - 1)
    }
    if (keyboard_check_pressed(vk_down) || mobile_button_down())
    {
        audio_play_sound(sfx_tick, 2, false)
        selected += 1
        if (selected == stage_count)
            selected = 0
    }
}
if (keyboard_check_pressed(ord("X")) || mobile_button_x())
{
    if (menu == 1 || menu == 2 || menu == 3)
    {
        selected = 0
        menu = 0
    }
    else if (menu == 0)
    {
        selected = 0
        menu = 0
        room_goto(global.currentstage)
    }
    audio_play_sound(sfx_tick, 2, false)
}
if (keyboard_check_pressed(ord("Z")) || mobile_button_z())
{
    if (menu == 0)
    {
        audio_play_sound(sfx_tick, 2, false)
        menu = (selected + 1)
        selected = 0
    }
    else if (menu == 1)
    {
        var arr = ds_list_find_value(upgrades, selected)
        var price = arr[1]
        if (selected == 0)
        {
            if (global.pizzapoints >= price)
            {
                global.pizzapoints -= price
                global.power += 2.5
                audio_play_sound(sfx_buy, 8, false, 1, 0.42)
                global.powerlevel += 1
                save_game()
            }
        }
        else if (selected == 1)
        {
            if (global.pizzapoints >= price)
            {
                global.pizzapoints -= price
                global.bounce += 0.1
                audio_play_sound(sfx_buy, 8, false, 1, 0.42)
                global.bouncelevel += 1
                save_game()
            }
        }
    }
    else if (menu == 2)
    {
        arr = ds_list_find_value(shop_characters, selected)
        price = arr[1]
        if (global.pizzapoints >= price && ds_list_find_index(global.characters, arr) == -1)
        {
            show_debug_message("Bought character!")
            global.pizzapoints -= price
            ds_list_add(global.characters, arr)
            audio_play_sound(sfx_buy, 8, false, 1, 0.42)
            ds_list_delete(shop_characters, selected)
            save_game()
        }
        else if (ds_list_find_index(global.characters, arr) != -1)
            show_debug_message("Already bought character!")
        else
            show_debug_message("Not enough pizza points!")
    }
    else if (menu == 3)
    {
        arr = ds_list_find_value(shop_stages, selected)
        price = arr[1]
        if (global.pizzapoints >= price)
        {
            show_debug_message("Bought stage!")
            global.pizzapoints -= price
            ds_list_add(global.stages, arr)
            audio_play_sound(sfx_buy, 8, false, 1, 0.42)
            ds_list_delete(shop_stages, selected)
            save_game()
        }
    }
}
