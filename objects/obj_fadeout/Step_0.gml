if (alpha < 1 && fade_stage == 0)
    alpha += 0.1
if (alpha >= 1 && fade_stage == 0)
{
    alpha = 1
    fade_stage = 1
    room_goto(global.currentstage)
}
else if (fade_stage == 1)
{
    alpha -= 0.1
    if (alpha <= 0)
    {
        alpha = 0
        instance_destroy()
    }
}
