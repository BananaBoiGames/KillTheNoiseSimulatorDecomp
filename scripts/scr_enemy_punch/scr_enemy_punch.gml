function scr_enemy_punch() //scr_enemy_punch
{
    global.score = lerp(global.score, (global.score + (launchsp * global.timescale)), 0.1)
    mask_index = spr_ballmask
    if (vsp > bounce_power)
        bounce_power = (vsp / global.timescale)
    sprite_index = scr_characterspr(spr_playerP_hit)
    x = lerp(x, ((room_width / 2) + launchsp), 0.1)
    if (place_meeting(x, (y + 1), obj_solid) || place_meeting(x, (y - 1), obj_solid))
    {
        if (launchsp > 0)
            launchsp -= (0.075 * global.timescale)
        vsp -= (bounce_power * clamp((0.75 + global.bounce), 0, 0.99))
        bounce_power = 0
        randomize()
        if (round(vsp) != 0)
            audio_play_sound(sfx_jump, 4, false, 2, 0, random_range(0.75, 1.2))
    }
    else
        image_angle += (rotation * global.timescale)
    var lay_id = layer_get_id("Background")
    layer_hspeed(lay_id, (-20 * ((launchsp * global.timescale) / 400)))
    vsp += grv
}

