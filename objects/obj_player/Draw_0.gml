draw_self()
if (state == (1 << 0) && debug)
{
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_font(fnt_gamefont24)
    draw_set_color(c_white)
    draw_text(x, y, string(power_slide_value))
}
