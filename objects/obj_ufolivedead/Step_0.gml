x += hsp
y += vsp
vsp += grv
if (y >= room_height || x < 0 || x > room_width)
    instance_destroy()
