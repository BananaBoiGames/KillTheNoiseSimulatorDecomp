global.score = 0
global.record = 0
global.pizzapoints = 0
global.earnedpoints = 0
global.gamesplayed = 0
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
global.enablehud = 1
global.mobile = 0
ds_list_add(global.characters, ["PEPPINO", 0, "a middle aged but strong cook", "P", sfx_peppinosuper, sfx_peppinoscream, c_white])
ds_list_add(global.characters, ["THE NOISE", 0, "a silly goober, peppino hates him", "N", sfx_noisesuper, sfx_noisescream, 65535])
ds_list_add(global.stages, ["OUTSIDE", 0, "the flat landscape, the tower is visible in the back", rm_outside])
load_game()
room_goto(rm_mainmenu)
