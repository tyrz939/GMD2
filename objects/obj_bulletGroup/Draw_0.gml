if gpu_get_blendmode() != blendType {gpu_set_blendmode(blendType)}
var _xd, _yd, _alpha = alphaMultiplier * image_alpha
if drawRotated >= 0 {
	for(var i = 0; i < __amount; i++) {
		if grid[# __alive, i] {
			if drawRounded	{_xd = round(grid[# __xx, i]); _yd = round(grid[# __yy, i])}
			else			{_xd = grid[# __xx, i]; _yd = grid[# __yy, i]}
			draw_image_ext(sprite, subimage, _xd, _yd, image_xscale, image_yscale, grid[# __dir, i]+drawRotated, image_blend, _alpha)
		}
	}
} else {
	for(var i = 0; i < __amount; i++) {
		if grid[# __alive, i] {
			if drawRounded	{_xd = round(grid[# __xx, i]); _yd = round(grid[# __yy, i])}
			else			{_xd = grid[# __xx, i]; _yd = grid[# __yy, i]}
			draw_image_ext(sprite, subimage, _xd, _yd, image_xscale, image_yscale, 0, image_blend, _alpha)
		}
	}
}