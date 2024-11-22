if (flash > 0)
{
    draw_set_color(c_white)
    draw_set_alpha(flash)
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
    draw_set_alpha(1)
}
if (global.enablehud == 1)
{
    if (state == (2 << 0) || state == (3 << 0))
    {
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_set_font(fnt_gamefont40)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_text(10, 10, ("SCORE: " + string((floor((global.score * 100)) / 100))))
    }
    if (global.messagetimer > 0)
    {
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_set_font(fnt_gamefont40)
        draw_set_halign(fa_center)
        draw_set_valign(fa_top)
        draw_text((display_get_gui_width() / 2), 100, global.messagetext)
    }
    if (state == (0 << 0))
    {
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_set_font(fnt_gamefont40)
        draw_text(10, 10, ("PIZZA POINTS: " + string(global.pizzapoints)))
        draw_text(10, 75, ("BEST SCORE: " + string(global.record)))
        draw_set_halign(fa_center)
        draw_set_valign(fa_top)
        draw_set_font(fnt_gamefont36)
        draw_text((display_get_gui_width() / 2), (display_get_gui_height() - 100), "Z: PLAY -- X: SHOP -- C: SWITCH COSMETICS -- SHIFT: SAVE AND QUIT")
    }
}
if changing_characters
{
    draw_set_color(c_black)
    draw_set_alpha(0.8)
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_set_font(fnt_gamefont40)
    if (current_menu == 0)
    {
        for (var i = 0; i < ds_list_size(menu_options); i += 1)
        {
            var name = ds_list_find_value(menu_options, i)
            var s = 1
            var _xx = 10
            var _yy = (10 + (40 * i))
            if (i == selected)
                name = ("> " + name)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            draw_text_transformed(_xx, _yy, name, s, s, 0)
        }
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_set_color(c_white)
        draw_text(10, (display_get_gui_height() - 175), "WHAT DO YOU WANT TO CHANGE?")
    }
    else if (current_menu == 1)
    {
        for (i = 0; i < ds_list_size(global.characters); i += 1)
        {
            var arr = ds_list_find_value(global.characters, i)
            name = arr[0]
            var desc = arr[2]
            s = 1
            _xx = 10
            _yy = (10 + (40 * i))
            if (i == selected)
                name = ("> " + name)
            name = ((name + ": ") + desc)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            draw_text_transformed(_xx, _yy, name, s, s, 0)
        }
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_set_color(c_white)
        draw_text(10, (display_get_gui_height() - 175), "CHOOSE A CHARACTER")
    }
    else if (current_menu == 2)
    {
        for (i = 0; i < ds_list_size(character_positions); i += 1)
        {
            name = ds_list_find_value(character_positions, i)
            s = 1
            _xx = 10
            _yy = (10 + (40 * i))
            if (i == selected)
                name = ("> " + name)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            draw_text_transformed(_xx, _yy, name, s, s, 0)
        }
        draw_set_color(c_white)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_set_color(c_white)
        draw_text(10, (display_get_gui_height() - 175), "IN WHAT PLACE DO YOU WANT THE CHARACTER TO BE IN?")
    }
    else if (current_menu == 3)
    {
        for (i = 0; i < ds_list_size(global.stages); i += 1)
        {
            arr = ds_list_find_value(global.stages, i)
            name = arr[0]
            desc = arr[2]
            s = 1
            _xx = 10
            _yy = (10 + (40 * i))
            if (i == selected)
                name = ("> " + name)
            name = ((name + ": ") + desc)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            draw_text_transformed(_xx, _yy, name, s, s, 0)
        }
        draw_set_color(c_white)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_set_color(c_white)
        draw_text(10, (display_get_gui_height() - 175), "CHOOSE A STAGE")
    }
    draw_set_color(c_white)
    draw_text(10, (display_get_gui_height() - 100), "Z: Select --- C: Back")
}
if (state == (2 << 0) && global.enablehud == 1)
{
    draw_set_alpha(1)
    draw_set_font(fnt_gamefont60)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    if (power_slide_value >= 1.75)
    {
        draw_set_color(make_color_rgb(222, 187, 16))
        draw_text((display_get_gui_width() / 2), 10, "SENSATIONAL HIT!")
    }
    else if (power_slide_value < 1.75 && power_slide_value >= 1.5)
    {
        draw_set_color(c_red)
        draw_text((display_get_gui_width() / 2), 10, "AMAZING HIT!")
    }
    else if (power_slide_value < 1.5 && power_slide_value >= 1)
    {
        draw_set_color(make_color_rgb(78, 183, 252))
        draw_text((display_get_gui_width() / 2), 10, "BEEFY HIT!")
    }
    else if (power_slide_value < 1 && power_slide_value >= 0.5)
    {
        draw_set_color(make_color_rgb(30, 201, 47))
        draw_text((display_get_gui_width() / 2), 10, "COWARDLY HIT...")
    }
    else if (power_slide_value < 0.5)
    {
        draw_set_color(make_color_rgb(31, 31, 31))
        draw_text((display_get_gui_width() / 2), 10, "DISASTROUS HIT...")
    }
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_color(c_white)
    draw_set_font(fnt_gamefont40)
    draw_text((display_get_gui_width() / 2), (display_get_gui_height() - 100), "Z: TOGGLE FAST FORWARD")
}
if (state == (1 << 0) && global.enablehud == 1)
{
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_font(fnt_gamefont40)
    draw_text((display_get_gui_width() / 2), (display_get_gui_height() - 100), "PRESS 'Z' WHEN THE ARROW IS IN THE GREEN AREA!")
    draw_sprite(spr_powerbar, 0, 10, (display_get_gui_height() / 2))
    draw_sprite(spr_arrow, 0, 128, (display_get_gui_height() - (sprite_get_height(spr_powerbar) * clamp(power_slide_value, 0.6, 1.5))))
}
if (state == (3 << 0) && global.enablehud == 1)
{
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_set_font(fnt_gamefont60)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    if new_record
    {
        draw_set_color(c_yellow)
        draw_text((display_get_gui_width() / 2), 10, "NEW RECORD!!!")
    }
    else
        draw_text((display_get_gui_width() / 2), 10, "YOU DID IT!")
    draw_set_font(fnt_gamefont40)
    draw_set_color(c_white)
    draw_text((display_get_gui_width() / 2), 80, (("+" + string(global.earnedpoints)) + " PIZZA POINTS"))
    draw_text((display_get_gui_width() / 2), 200, (("You now have " + string(global.pizzapoints)) + " Pizza Points!"))
    draw_text((display_get_gui_width() / 2), (display_get_gui_height() - 100), "PRESS 'Z' TO CONTINUE")
}
if (quit_confirm == 1)
{
    draw_set_color(c_black)
    draw_set_alpha(0.8)
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_set_font(fnt_gamefont60)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_text((display_get_gui_width() / 2), 10, "ARE YOU SURE YOU WANT TO QUIT?")
    draw_set_font(fnt_gamefont40)
    draw_text((display_get_gui_width() / 2), 80, "PRESS AGAIN TO CONFIRM OR Z TO CANCEL")
}
