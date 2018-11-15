if gpu_get_blendmode() != blendType {gpu_set_blendmode(blendType)}
if delay > timerSpawn {
	draw_set_color(shotColor)
	draw_line(x, y, x + lengthdir_x(_length, direction), y + lengthdir_y(_length, direction))
	draw_set_color(c_white)
} else {
	var _xx = x + lengthdir_x(_length / 2, direction)
	var _yy = y + lengthdir_y(_length / 2, direction)
	draw_image_ext(sprite, subimage, _xx, _yy, image_xscale, image_yscale, direction + 270, image_blend, image_alpha * alphaMultiplier)
}
draw_image_ext(_spawnSprite, _spawnSubimage, x, y, _spawnScale, _spawnScale, _spawnAngle, image_blend, _spawnAlpha * image_alpha * alphaMultiplier)
gpu_set_blendmode(bm_normal)