function save_game() //save_game
{
    var _struct = 
    {
        save_record: global.record,
        save_pizzapoints: global.pizzapoints,
        save_games: global.gamesplayed,
        save_power: global.power,
        save_plevel: global.powerlevel,
        save_bounce: global.bounce,
        save_blevel: global.bouncelevel,
        save_pcharacter: global.playercharacter,
        save_psound: global.playersupersound,
        save_echaracter: global.enemycharacter,
        save_esound: global.enemyscream,
        save_ecolor: global.afterimage_color,
        save_stage: global.currentstage,
        save_characters: ds_list_write(global.characters),
        save_stages: ds_list_write(global.stages)
    }

    var _string = json_stringify(_struct)
    var _buffer = buffer_create((string_byte_length(_string) + 1), buffer_fixed, 1)
    buffer_write(_buffer, buffer_string, _string)
    buffer_save(_buffer, (working_directory + "save.ini"))
    buffer_delete(_buffer)
}

function load_game() //load_game
{
    if file_exists((working_directory + "save.ini"))
    {
        show_debug_message("Loading save file...")
        var _buffer = buffer_load((working_directory + "save.ini"))
        var _json = buffer_read(_buffer, buffer_string)
        buffer_delete(_buffer)
        var _struct = json_parse(_json)
        global.record = _struct.save_record
        global.pizzapoints = _struct.save_pizzapoints
        global.gamesplayed = _struct.save_games
        global.power = _struct.save_power
        global.powerlevel = _struct.save_plevel
        global.bounce = _struct.save_bounce
        global.bouncelevel = _struct.save_blevel
        global.playercharacter = _struct.save_pcharacter
        global.playersupersound = _struct.save_psound
        global.enemycharacter = _struct.save_echaracter
        global.enemyscream = _struct.save_esound
        global.afterimage_color = _struct.save_ecolor
        global.currentstage = _struct.save_stage
        ds_list_read(global.characters, _struct.save_characters)
        ds_list_read(global.stages, _struct.save_stages)
    }
    else
    {
        ds_list_clear(global.characters)
        ds_list_clear(global.stages)
        global.score = 0
        global.record = 0
        global.pizzapoints = 0
        global.earnedpoints = 0
        global.power = 10
        global.powerlevel = 0
        global.bounce = 0
        global.bouncelevel = 0
        global.playercharacter = "P"
        global.playersupersound = sfx_peppinosuper
        global.enemycharacter = "N"
        global.enemyscream = sfx_noisescream
        global.afterimage_color = 65535
        global.currentstage = rm_outside
        global.characters = -4
        global.stages = -4
        global.characters = ds_list_create()
        global.stages = ds_list_create()
        global.timescale = 1
        global.messagetimer = 0
        global.messagetext = ""
        ds_list_add(global.characters, ["PEPPINO", 0, "a middle aged but strong cook", "P", sfx_peppinosuper, sfx_peppinoscream, c_white])
        ds_list_add(global.characters, ["THE NOISE", 0, "a silly goober, peppino hates him", "N", sfx_noisesuper, sfx_noisescream, 65535])
        ds_list_add(global.stages, ["OUTSIDE", 0, "the flat landscape, the tower is visible in the back", rm_outside])
    }
}

