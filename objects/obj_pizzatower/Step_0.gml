speed = ((-20 * movespeed) * global.timescale)
if instance_exists(obj_enemy)
    movespeed = (obj_enemy.launchsp / 300)
if (x <= 0)
    move_wrap(1, 0, sprite_get_width(sprite_index))
x = clamp(x, 500, 9999)
