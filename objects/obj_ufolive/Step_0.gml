speed = (((-20 * movespeed) + ufolive_speed) * global.timescale)
if instance_exists(obj_enemy)
    movespeed = (obj_enemy.launchsp / 6)
if (x <= 0 || x >= room_width)
    move_wrap(1, 0, sprite_get_width(sprite_index))
if place_meeting(x, y, obj_enemy)
{
    if (obj_enemy.state == (2 << 0))
    {
        randomize()
        with (obj_enemy)
        {
            vsp -= (bounce_power * clamp((0.75 + global.bounce), 0, 0.99))
            bounce_power = 0
        }
        scr_screenshake(10, 5, 0.1)
        game_message("KILLED AN OLIVE! (+1 PIZZA POINTS)", 120)
        audio_play_sound(sfx_killenemy, 8, false)
        instance_create_layer(random_range((-room_width), (room_width * 2)), random_range(0, (room_height - 200)), "Ufolives", obj_ufolive)
        instance_create_layer(x, y, "Ufolives", obj_ufolivedead)
        instance_destroy()
    }
}
