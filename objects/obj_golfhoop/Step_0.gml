speed = ((-20 * movespeed) * global.timescale)
if instance_exists(obj_enemy)
    movespeed = (obj_enemy.launchsp / 8)
if (x <= 0 || x >= room_width)
    move_wrap(1, 0, sprite_get_width(sprite_index))
if place_meeting(x, y, obj_enemy)
{
    if (obj_enemy.state == (2 << 0))
    {
        randomize()
        scr_screenshake(10, 5, 0.1)
        var _point_value = irandom_range(1, 5)
        game_message((("GOLF HOOP! (+" + string(_point_value)) + " PIZZA POINTS)"), 120)
        audio_play_sound(sfx_tada, 8, false)
        instance_create_layer(random_range((-room_width), (room_width * 2)), random_range(100, (room_height - 200)), "Golf", obj_golfhoop)
        instance_destroy()
    }
}
