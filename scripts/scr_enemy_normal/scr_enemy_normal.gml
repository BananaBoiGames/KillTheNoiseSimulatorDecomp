function scr_enemy_normal() //scr_enemy_normal
{
    sprite_index = scr_characterspr(spr_playerP_idle)
    if (obj_player.key_attack && (!obj_player.changing_characters) && (!obj_player.quitting) && (!obj_player.can_switch_timer) <= 0)
        state = (1 << 0)
    vsp += grv
}

