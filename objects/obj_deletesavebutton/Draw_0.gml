var _zwrite = gpu_get_zwriteenable()
var _ztest = gpu_get_ztestenable()
gpu_set_zwriteenable(1)
gpu_set_ztestenable(1)
var _depth = gpu_get_depth()
gpu_set_depth((-y))
draw_self()
gpu_set_depth(_depth)
gpu_set_zwriteenable(_zwrite)
gpu_set_ztestenable(_ztest)