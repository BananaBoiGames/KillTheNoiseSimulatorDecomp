function scr_player_punch() //scr_player_punch
{
    image_speed = 0.4
    if (floor(image_index) == (image_number - 1) && sprite_index == scr_characterspr(spr_playerP_punch))
        sprite_index = scr_characterspr(spr_playerP_punchidle)
    if key_attack
    {
        if (global.timescale == 1)
            global.timescale = 2
        else
            global.timescale = 1
    }
    hsp = ((-obj_ground.movespeed) * 20)
}

