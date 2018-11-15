
if draw == true{
    var dist = point_distance(x, y, end_x, end_y);
    if gpu_get_blendmode() != bm_add {gpu_set_blendmode(bm_add)}
	gpu_set_tex_repeat(true)
//    var steps = 10;
    if hit_enemy {
        var hit_alpha = 1;
		_col = make_color_rgb(127,127,255)
    } else {
        var hit_alpha = 1;
		_col = c_white
    }
	// Star
	var sc = 0.75 + lengthdir_x(0.25, timer * 45)
	var ro = timer * 30
	//draw_sprite_ext(spr_marisaLaserStar, 0, x, y, sc, sc, ro, c_white, alpha)
	draw_image_ext(game.marisaLaserStar, 0, x, y, sc, sc, ro, c_white, alpha)
	
	// Laser
	var w = image_get_height(game.marisaLaser)
	var h = image_get_width(game.marisaLaser)
	if cycleImage > h {cycleImage -= h}
	var ex = x + lengthdir_x(h, direction,)
	var ey = y + lengthdir_y(h, direction,)
	var cx = x + lengthdir_x(cycleImage, direction,)
	var cy = y + lengthdir_y(cycleImage, direction,)
	var c_dist = point_distance(x, y, cx, cy)
	//var b_dist = point_distance(cx, cy, end_x, end_y);
	//draw_sprite_general(sprite_index, 0, 0, h - c_dist, w, dist, x+(w/2), y, 1, 1, direction+90, _col, _col, _col, _col, alpha * hit_alpha)
	//draw_image_general(game.marisaLaser, 0, 0, h - c_dist, w, dist, x+(w/2), y, 1, 1, direction, _col, _col, _col, _col, alpha * hit_alpha)
	draw_image_general(game.marisaLaser, 0, h - c_dist, 0, dist, 16, x-(w/2), y, 1, 1, direction, _col, _col, _col, _col, alpha * hit_alpha)
	if dist > h {
		draw_image_general(game.marisaLaser, 0, h - c_dist, 0, dist-h, 16, ex-(w/2), ey, 1, 1, direction, _col, _col, _col, _col, alpha * hit_alpha)
	}
	//draw_image(game.marisaLaser, 0, x, y)
//	draw_line(x, y, end_x, end_y)
}