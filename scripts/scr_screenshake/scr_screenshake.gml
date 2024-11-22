function scr_screenshake(argument0, argument1, argument2) //scr_screenshake
{
    if instance_exists(obj_camera)
    {
        with (obj_camera)
        {
            shake = 1
            shake_time = argument0
            shake_mag = argument1
            shake_fade = argument2
        }
    }
}

