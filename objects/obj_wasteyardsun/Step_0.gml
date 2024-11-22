speed = ((-20 * movespeed) * global.timescale)
if instance_exists(obj_enemy)
    movespeed = (obj_enemy.launchsp / 500)
x = clamp(x, 10, 9999)
