if sprite != noone {
	if overlayDraw {
		shader_set(sh_color_overlay);
		scr_shader_set_color(overlayColor, overlayAlpha);
		draw_image(sprite, subImage, round(x), round(y))
		shader_reset();
	} else {
		draw_image(sprite, subImage, round(x), round(y))
	}
} else {
	if hitCircle > 0 {
		draw_circle(x, y, hitCircle, true)
	} else if hitWidth > 0 && hitHeight > 0 {
		draw_rectangle(x - hitWidth, y - hitHeight, x + hitWidth, y + hitHeight, true)
	} else {
		draw_circle(x, y, 10, true)
	}
	draw_line(x, y, x + lengthdir_x(15, direction), y + lengthdir_y(15, direction))
}