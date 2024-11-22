hspeed = (((-20 * movespeed) + 0.5) * global.timescale)
vspeed = -1
if instance_exists(obj_enemy)
    movespeed = (obj_enemy.launchsp / 275)
if (x <= 0)
    move_wrap(1, 0, sprite_get_width(sprite_index))
if (y <= 0 || y >= room_height)
    move_wrap(0, 1, sprite_get_height(sprite_index))
