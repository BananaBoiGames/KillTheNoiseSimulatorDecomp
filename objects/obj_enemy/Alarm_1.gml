if (afterimage && launchsp > 0)
{
    with (instance_create_layer((x - (launchsp * 4)), y, "Collision", obj_enemyafterimage))
    {
        copy = obj_enemy
        image_blend = global.afterimage_color
        image_angle = other.image_angle
        image_alpha = clamp((other.launchsp / 20), 0.1, 0.75)
    }
}
alarm[1] = 10
