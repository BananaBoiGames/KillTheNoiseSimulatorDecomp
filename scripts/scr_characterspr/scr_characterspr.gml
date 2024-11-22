function scr_characterspr(argument0) //scr_characterspr
{
    var _character_initial = character
    var _remove = ("spr_player" + _character_initial)
    var _sprite_name = sprite_get_name(argument0)
    var _spr = string_delete(_sprite_name, 1, string_length(_remove))
    var _character_spr = (("spr_player" + _character_initial) + _spr)
    return asset_get_index(_character_spr);
}

