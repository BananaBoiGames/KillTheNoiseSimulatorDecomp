function check_unlocks() //check_unlocks
{
    var secret_world_unlocked = 0
    var ctop_unlocked = 0
    var strongcold_unlocked = 0
    var blue_unlocked = 0
    var grinch_unlocked = 0
    var treat_unlocked = 0
    for (var i = 0; i < ds_list_size(global.stages); i += 1)
    {
        if (array_get(ds_list_find_value(global.stages, i), 0) == "SECRET WORLD")
        {
            show_debug_message("SECRET WORLD already unlocked!")
            secret_world_unlocked = 1
        }
        if (array_get(ds_list_find_value(global.stages, i), 0) == "CTOP")
        {
            show_debug_message("CTOP already unlocked!")
            ctop_unlocked = 1
        }
        if (array_get(ds_list_find_value(global.stages, i), 0) == "STRONGCOLD")
        {
            show_debug_message("STRONGCOLD already unlocked!")
            strongcold_unlocked = 1
        }
        if (array_get(ds_list_find_value(global.stages, i), 0) == "BLUE BLOCK LAND")
        {
            show_debug_message("BLUE BLOCK LAND already unlocked!")
            blue_unlocked = 1
        }
        if (array_get(ds_list_find_value(global.stages, i), 0) == "GRINCH RACE")
        {
            show_debug_message("GRINCH RACE already unlocked!")
            grinch_unlocked = 1
        }
        if (array_get(ds_list_find_value(global.stages, i), 0) == "TRICKY TREAT")
        {
            show_debug_message("TRICKY TREAT already unlocked!")
            treat_unlocked = 1
        }
    }
    if (global.score >= 5000 && (!secret_world_unlocked))
    {
        ds_list_add(global.stages, ["SECRET WORLD", 0, "unlocked by getting a score over 5000 in one run", rm_secretworld])
        with (instance_create_layer(x, y, "GameSettings", obj_unlockui))
        {
            unlock_name = "SECRET WORLD"
            unlock_type = "STAGE"
        }
    }
    if (global.score >= 10000 && (!ctop_unlocked))
    {
        ds_list_add(global.stages, ["CTOP", 0, "unlocked by getting a score over 10000 in one run", rm_ctop])
        with (instance_create_layer(x, y, "GameSettings", obj_unlockui))
        {
            unlock_name = "CTOP"
            unlock_type = "STAGE"
        }
    }
    if (global.score >= 15000 && (!strongcold_unlocked))
    {
        ds_list_add(global.stages, ["STRONGCOLD", 0, "unlocked by getting a score over 15000 in one run", rm_strongcold])
        with (instance_create_layer(x, y, "GameSettings", obj_unlockui))
        {
            unlock_name = "STRONGCOLD"
            unlock_type = "STAGE"
        }
    }
    if (global.score <= 10 && (!blue_unlocked))
    {
        ds_list_add(global.stages, ["BLUE BLOCK LAND", 0, "unlocked by getting a score under 10 in one run", rm_blue])
        with (instance_create_layer(x, y, "GameSettings", obj_unlockui))
        {
            unlock_name = "BLUE BLOCK LAND"
            unlock_type = "STAGE"
        }
    }
    if (global.gamesplayed >= 50 && (!grinch_unlocked))
    {
        ds_list_add(global.stages, ["GRINCH RACE", 0, "unlocked by playing 50 times", rm_grinch])
        with (instance_create_layer(x, y, "GameSettings", obj_unlockui))
        {
            unlock_name = "GRINCH RACE"
            unlock_type = "STAGE"
        }
    }
    if (global.gamesplayed >= 125 && (!treat_unlocked))
    {
        ds_list_add(global.stages, ["TRICKY TREAT", 0, "unlocked by playing 125 times", rm_trickytreat])
        with (instance_create_layer(x, y, "GameSettings", obj_unlockui))
        {
            unlock_name = "TRICKY TREAT"
            unlock_type = "STAGE"
        }
    }
}

