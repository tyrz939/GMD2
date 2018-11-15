gpu_set_blendmode(bm_subtract)
draw_set_color(make_color_rgb(47,95,191))
draw_rectangle(0, 0, global.playAreaWidth, global.playAreaHeight, false)
draw_set_color(c_white)
gpu_set_blendmode(bm_add)
var r1 = lengthdir_x(2, timer*2)
var r2 = lengthdir_x(2, timer*2 + 120)
var r3 = lengthdir_x(2, timer*2 + 240)
draw_image_ext(game.marisaBomb1, 0, x, y, image_xscale*2, image_yscale*2.2, image_angle+r1, make_color_rgb(255, 127, 127), image_alpha*0.7)
draw_image_ext(game.marisaBomb1, 0, x, y, image_xscale*2, image_yscale*2.2, image_angle+r2, make_color_rgb(127, 223, 127), image_alpha*0.7)
draw_image_ext(game.marisaBomb1, 0, x, y, image_xscale*2, image_yscale*2.2, image_angle+r3, make_color_rgb(127, 127, 191), image_alpha*0.7)
var scale2, xd, yd, t
for(var i = 0; i < 4; i++) {
	t = pulses[i] / pulseSpd
	t /= (600 / pulseSpd)
	t = -t + 1
	scale2 =  1 + -(t * t * t * (-lengthdir_y(1, t * 90)))
	
	xd = x + lengthdir_x(pulses[i] - 128, direction)
	yd = y + lengthdir_y(pulses[i] - 128, direction)
	if pulses[i] > 0 {
		draw_image_ext(game.marisaBomb2, 0, xd, yd, scale2*1.5, scale2*1.5, image_angle, make_color_rgb(255, 127, 127), image_alpha/2)
	}
}

gpu_set_blendmode(bm_normal)