for (var i = 0; i < 2; i += 1)
{
    with (instance_create_depth(10, ((room_height / 2) + (100 * i)), 4, obj_devicebutton))
    {
        if (i == 1)
        {
            is_mobile = 1
            image_index = 0
        }
        else
        {
            is_mobile = 0
            image_index = 1
        }
    }
}
selected = 0
