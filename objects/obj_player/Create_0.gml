hsp = 0
vsp = 0
grv = 0.4
key_attack = 0
key_x = 0
key_c = 0
key_quit = 0
power_slide_value = 0
power_slide_dir = 1
flash = 0
black_effect = 0
debug = 0
quitting = 0
quit_confirm = 0
changing_characters = 0
current_menu = 0
selected = 0
selected_character = 0
can_switch_timer = 0
character_positions = ds_list_create()
ds_list_add(character_positions, "PLAYER")
ds_list_add(character_positions, "ENEMY")
menu_options = ds_list_create()
ds_list_add(menu_options, "CHARACTER")
ds_list_add(menu_options, "STAGE")
character = global.playercharacter
state = (0 << 0)
new_record = 0
if (global.mobile && room != rm_mainmenu)
{
    instance_create_depth(10, ((room_height - sprite_height) - 50), -100, obj_xbutton)
    instance_create_depth(125, ((room_height - sprite_height) - 50), -100, obj_cbutton)
    instance_create_depth(((room_width - sprite_width) - 50), ((room_height - sprite_height) - 50), -100, obj_zbutton)
    if (room != rm_shop)
        instance_create_depth((camera_get_view_width(view_camera[0]) - sprite_width), 10, -100, obj_quitbutton)
}
if (global.mobile && room == rm_shop)
{
    instance_create_depth(((room_width - sprite_width) - 100), ((room_height - sprite_height) - 50), -100, obj_upbutton)
    instance_create_depth(((room_width - sprite_width) - 100), (room_height - sprite_height), -100, obj_downbutton)
}
currentRoom = room
image_speed = 0.4
