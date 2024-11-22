function scr_collide() //scr_collide
{
    if place_meeting((x + hsp), y, obj_solid)
    {
        yplus = 0
        while (place_meeting((x + hsp), (y - yplus), obj_solid) && yplus <= abs((1 * hsp)))
            yplus += 1
        if place_meeting((x + hsp), (y - yplus), obj_solid)
        {
            while (!(place_meeting((x + sign(hsp)), y, obj_solid)))
                x += sign(hsp)
            hsp = 0
        }
        else
            y -= yplus
    }
    x += hsp
    if ((!(place_meeting(x, y, obj_solid))) && vsp >= 0 && place_meeting(x, ((y + 2) + abs(hsp)), obj_solid))
    {
        while (!(place_meeting(x, (y + 1), obj_solid)))
            y += 1
    }
    if place_meeting(x, (y + vsp), obj_solid)
    {
        while (!(place_meeting(x, (y + sign(vsp)), obj_solid)))
            y += sign(vsp)
        vsp = 0
    }
    y += vsp
}

