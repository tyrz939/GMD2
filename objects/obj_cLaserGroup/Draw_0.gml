if gpu_get_blendmode() != blendType {gpu_set_blendmode(blendType)}
var i, u, tex, t, s, _alpha = alphaMultiplier * image_alpha

tex = image_get_texture(sprite, subimage)
draw_set_color(image_blend)
draw_set_alpha(_alpha)
for(i = 0; i < __amount; i++) {
	if grid[# __alive, i] {
		draw_primitive_begin_texture(pr_trianglestrip, tex);
		t = 0
		for(u = __headerLength; u < __gridWidth; u += _stepSize) {
			s = t / __length
			if grid[# u+__aalive, i] {
				draw_vertex_texture(grid[# u, i] + lengthdir_x(__width, grid[# u+2, i]+90), grid[# u+1, i] + lengthdir_y(__width, grid[# u+2, i]+90), s, 0);
				draw_vertex_texture(grid[# u, i] + lengthdir_x(__width, grid[# u+2, i]-90), grid[# u+1, i] + lengthdir_y(__width, grid[# u+2, i]-90), s, 1);
			} else {
				draw_primitive_end();
				draw_primitive_begin_texture(pr_trianglestrip, tex);
			}
			t++
		}
		draw_primitive_end();
	}
}
draw_set_color(c_white)
draw_set_alpha(1)