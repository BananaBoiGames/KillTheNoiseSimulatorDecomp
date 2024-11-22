speed = ((-20 * movespeed) * global.timescale)
if instance_exists(obj_enemy)
    movespeed = (obj_enemy.launchsp / 4)
if (x <= 0)
{
    randomize()
    y = irandom_range(100, (room_height - 200))
    move_wrap(1, 0, sprite_get_width(sprite_index))
}
