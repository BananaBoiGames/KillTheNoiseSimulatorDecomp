if (obj_deviceselect.selected && global.mobile == is_mobile)
{
    x = lerp(x, ((room_width / 2) - (sprite_width / 2)), 0.1)
    y = lerp(y, (room_height / 2), 0.1)
}
else if (obj_deviceselect.selected && global.mobile != is_mobile)
    x = lerp(x, (xstart - (sprite_width * 6)), 0.1)
