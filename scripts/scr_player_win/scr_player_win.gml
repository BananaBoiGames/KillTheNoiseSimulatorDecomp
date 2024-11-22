function scr_player_win() //scr_player_win
{
    hsp = 0
    image_speed = 0.4
    if new_record
        sprite_index = scr_characterspr(spr_playerP_newrecord)
    else
        sprite_index = scr_characterspr(spr_playerP_winidle)
    vsp += grv
    if (key_attack && (!instance_exists(obj_fadeout)))
    {
        currentRoom = room
        global.score = 0
        instance_create_depth(x, y, 0, obj_fadeout)
    }
}

