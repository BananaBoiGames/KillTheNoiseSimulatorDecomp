character = global.enemycharacter
switch state
{
    case (0 << 0):
        scr_enemy_normal()
        break
    case (1 << 0):
        scr_enemy_ready()
        break
    case (2 << 0):
        scr_enemy_punch()
        break
}

if (launchsp < 0 && state == (2 << 0))
{
    launchsp = 0
    alarm[0] = 60
}
scr_collide()
image_xscale = xscale
