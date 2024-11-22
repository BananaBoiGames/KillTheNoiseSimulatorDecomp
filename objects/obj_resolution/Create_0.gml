browser_w = browser_width
browser_h = browser_height
cam = view_camera[0]
camera_set_view_size(cam, browser_w, browser_h)
camera_set_view_pos(cam, ((((-browser_w) / 2) + camera_get_view_width(cam)) / 2), ((((-browser_w) / 2) + camera_get_view_height(cam)) / 2))
surface_resize(application_surface, view_wport[0], view_hport[0])
window_set_size(browser_w, browser_h)
window_center()
