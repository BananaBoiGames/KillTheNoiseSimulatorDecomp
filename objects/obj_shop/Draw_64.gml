draw_set_color(c_black)
draw_set_alpha(0.8)
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false)
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_font(fnt_gamefont24)
if (menu == 0)
{
    for (var i = 0; i < menu_count; i += 1)
    {
        var arr = ds_list_find_value(menu_options, i)
        var item = arr[0]
        var desc = arr[1]
        var s = 1
        var _xx = 10
        var _yy = (10 + (40 * i))
        if (i == selected)
            item = ("> " + item)
        item = ((item + ": ") + desc)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_text_transformed(_xx, _yy, item, s, s, 0)
    }
}
else if (menu == 1)
{
    for (i = 0; i < upgrade_count; i += 1)
    {
        arr = ds_list_find_value(upgrades, i)
        item = arr[0]
        var cost = arr[1]
        desc = arr[2]
        s = 1
        _xx = 10
        _yy = (10 + (40 * i))
        if (i == selected)
            item = ("> " + item)
        item = ((((item + ": ") + desc) + " ---------- ") + string(cost))
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_text_transformed(_xx, _yy, item, s, s, 0)
    }
}
else if (menu == 2)
{
    for (i = 0; i < character_count; i += 1)
    {
        if (ds_list_find_value(shop_characters, i) == undefined)
            return;
        arr = ds_list_find_value(shop_characters, i)
        item = arr[0]
        cost = arr[1]
        desc = arr[2]
        s = 1
        _xx = 10
        _yy = (10 + (40 * i))
        if (i == selected)
            item = ("> " + item)
        item = ((((item + ": ") + desc) + " ---------- ") + string(cost))
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_text_transformed(_xx, _yy, item, s, s, 0)
    }
}
else if (menu == 3)
{
    for (i = 0; i < stage_count; i += 1)
    {
        if (ds_list_find_value(shop_stages, i) == undefined)
            return;
        arr = ds_list_find_value(shop_stages, i)
        item = arr[0]
        cost = arr[1]
        desc = arr[2]
        s = 1
        _xx = 10
        _yy = (10 + (40 * i))
        if (i == selected)
            item = ("> " + item)
        item = ((((item + ": ") + desc) + " ---------- ") + string(cost))
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        draw_text_transformed(_xx, _yy, item, s, s, 0)
    }
}
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_font(fnt_gamefont40)
draw_text(10, display_get_gui_height(), ("PIZZA POINTS: " + string(global.pizzapoints)))
draw_text(10, (display_get_gui_height() - 100), "Z: Select --- X: Back")
draw_set_valign(fa_top)
