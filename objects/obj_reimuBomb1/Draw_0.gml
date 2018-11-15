var xx, yy
gpu_set_blendmode(bm_add)

var dist = 15, times = 5

var draws = 5
for( var i = 0; i < amount; i++) {
	if bomb[i, ALIVE] {
		for( var d = 0; d < draws; d++) {
			xx = bomb[i, X] + lengthdir_x(dist, (timer*times) + (360/draws) * d)
			yy = bomb[i, Y] + lengthdir_y(dist, (timer*times) + (360/draws) * d)
			//draw_sprite_ext(sprite_index, 0, xx, yy, 1, 1, (timer*times) + (360/draws) * d, make_color_hsv((360/draws) * d, 255, 255), image_alpha/2)
			draw_image_ext(sprite, 0, xx, yy, 1, 1, (timer*times) + (360/draws) * d, make_color_hsv((360/draws) * d, 255, 255), image_alpha/2)
		}
	}
}
gpu_set_blendmode(bm_normal)