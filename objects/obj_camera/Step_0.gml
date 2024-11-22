if (target != noone)
{
    xTo = target.x
    yTo = target.y
}
x += ((xTo - x) / 2)
y += ((yTo - y) / 2)
if shake
{
    shake_time -= 1
    var _xval = choose((-shake_mag), shake_mag)
    var _yval = choose((-shake_mag), shake_mag)
    x += _xval
    y += _yval
    if (shake_time <= 0)
    {
        shake_mag -= shake_fade
        if (shake_mag <= 0)
            shake = 0
    }
}
x = clamp(x, (view_w_half - 10), ((room_width - view_w_half) + 10))
y = clamp(y, (view_h_half - 40), (room_height - view_h_half))
camera_set_view_pos(cam, (x - view_w_half), (y - view_h_half))
camera_set_view_size(cam, camera_w, camera_h)
