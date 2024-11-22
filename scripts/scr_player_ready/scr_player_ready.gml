function scr_player_ready() //scr_player_ready
{
    sprite_index = scr_characterspr(spr_playerP_ready)
    if (power_slide_dir == 1)
    {
        power_slide_value += 0.1
        if (power_slide_value >= 2)
            power_slide_dir = -1
    }
    else if (power_slide_dir == -1)
    {
        power_slide_value -= 0.1
        if (power_slide_value <= 0.1)
            power_slide_dir = 1
    }
    if key_attack
    {
        scr_screenshake(20, (10 * power_slide_value), 0.5)
        if instance_exists(obj_enemy)
        {
            with (obj_enemy)
            {
                if (other.power_slide_value > 1.75)
                {
                    audio_play_sound(global.playersupersound, 4, false)
                    audio_play_sound(global.enemyscream, 4, false)
                    afterimage = 1
                }
                vsp = lengthdir_y((global.power * other.power_slide_value), 45)
                launchsp = lengthdir_x((global.power * other.power_slide_value), 45)
                if instance_exists(obj_enemy)
                {
                    obj_camera.target = obj_enemy
                    with (obj_enemy)
                    {
                        rotation = random_range(-25, 25)
                        state = (2 << 0)
                    }
                }
            }
        }
        audio_stop_sound(sfx_wind)
        audio_stop_sound(sfx_blackoutpunch)
        audio_play_sound(sfx_punch, 4, false)
        audio_play_sound(mu_killmusic, 9, true)
        image_blend = c_white
        sprite_index = scr_characterspr(spr_playerP_punch)
        state = (2 << 0)
    }
}

