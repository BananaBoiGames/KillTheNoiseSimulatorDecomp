function mobile_button_c() //mobile_button_c
{
    return (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_cbutton));
}

function mobile_button_x() //mobile_button_x
{
    return (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_xbutton));
}

function mobile_button_z() //mobile_button_z
{
    return (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_zbutton));
}

function mobile_button_up() //mobile_button_up
{
    return (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_upbutton));
}

function mobile_button_down() //mobile_button_down
{
    return (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_downbutton));
}

function mobile_button_quit() //mobile_button_quit
{
    return (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_quitbutton));
}

function mobile_button_deletesave() //mobile_button_deletesave
{
    return (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_deletesavebutton));
}

