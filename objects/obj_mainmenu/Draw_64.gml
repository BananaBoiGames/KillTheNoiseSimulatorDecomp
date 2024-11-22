if (global.mobile == 0)
{
    draw_set_color(c_white)
    for (var i = 0; i < ds_list_size(menu_options); i += 1)
    {
        var item = ds_list_find_value(menu_options, i)
        var s = 1
        var _xx = 0
        var _yy = 0
        _xx = (display_get_gui_width() - 10)
        _yy = ((display_get_gui_height() / 2) + (50 * i))
        if (i == selected)
            item = ("> " + item)
        if (item == "> DELETE SAVE FILE" && delete_confirm == 1)
            item = "> ARE YOU SURE? (SELECT AGAIN TO CONFIRM)"
        draw_set_font(fnt_gamefont40)
        draw_set_halign(fa_right)
        draw_set_valign(fa_top)
        draw_text_transformed(_xx, _yy, item, s, s, 0)
    }
    draw_set_font(fnt_gamefont40)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_text((window_get_width() / 2), (window_get_height() - 100), "UP/DOWN: MOVE SELECTION ----- Z: SELECT")
}
else
{
    draw_set_color(c_white)
    draw_set_font(fnt_gamefont40)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    if (delete_confirm == 0)
        draw_text((window_get_width() / 2), (window_get_height() - 100), "TAP ANYWHERE TO PLAY!")
    else
        draw_text((window_get_width() / 2), (window_get_height() - 100), "ARE YOU SURE? (PRESS AGAIN TO CONFIRM)")
}
