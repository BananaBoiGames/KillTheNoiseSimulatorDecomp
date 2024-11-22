menu_options = ds_list_create()
menu = 0
selected = 0
delete_confirm = 0
play = 0
ds_list_add(menu_options, "PLAY")
if file_exists((working_directory + "save.ini"))
    ds_list_add(menu_options, "DELETE SAVE FILE")
ds_list_add(menu_options, "QUIT GAME")
if (global.mobile && file_exists((working_directory + "save.ini")))
    instance_create_depth(10, 10, -100, obj_deletesavebutton)
audio_play_sound(mu_titlescreen, 10, true)
