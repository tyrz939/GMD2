if image_exists(sprite) {
	// TODO
	if trails {
		gpu_set_blendmode(bm_add)
		var _trailsAlpha = 0, _trailsScale
		for(var _i = trailsCount -1; _i >= 0; _i--) {
			_trailsAlpha +=  trailsAlpha / trailsCount
			if trailsArray[_i, 1] != 0 {
				_trailsScale = 1 + (_i/(trailsCount*trailsScale))
				draw_image_ext(sprite, trailsArray[_i, 0], trailsArray[_i, 1], trailsArray[_i, 2], _trailsScale, _trailsScale, 0, trailsCol, _trailsAlpha)
			}
		}
		gpu_set_blendmode(bm_normal)
	}
	if overlayDraw {
		shader_set(sh_color_overlay);
		scr_shader_set_color(overlayColor, overlayAlpha);
		draw_image(sprite, subImage, round(x), round(yDraw))
		shader_reset();
	} else {
		draw_image(sprite, subImage, round(x), round(yDraw))
	}
} else {
	if hitCircle > 0 {
		draw_circle(x, y, hitCircle, true)
	} else if hitWidth > 0 && hitHeight > 0 {
		draw_rectangle(x - hitWidth, y - hitHeight, x + hitWidth, y + hitHeight, true)
	} else {
		draw_circle(x, y, 10, true)
	}
}