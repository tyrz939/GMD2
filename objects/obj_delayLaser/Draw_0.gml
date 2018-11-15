if gpu_get_blendmode() != blendType {gpu_set_blendmode(blendType)}

for(var i = 0; i < ds_grid_height(lasers); i++) {
	var _xx = lasers[# 0, i] + lengthdir_x(_length / 2, lasers[# 2, i])
	var _yy = lasers[# 1, i] + lengthdir_y(_length / 2, lasers[# 2, i])
	draw_image_ext(sprite, subimage, _xx, _yy, image_xscale, image_yscale, lasers[# 2, i] + 270, image_blend, image_alpha)
}
	
gpu_set_blendmode(bm_normal)