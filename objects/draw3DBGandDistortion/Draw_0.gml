with game {
	// 3D Start
	if !surface_exists(surface3d) {
		surface3d = surface_create(global.playAreaWidth, global.playAreaHeight)
	}
	surface_set_target(surface3d)
	draw_clear(backColor)

	if draw3d {
		gpu_set_tex_mip_enable(mip_on)
		gpu_set_tex_mip_filter(global.textureFilterMode);
		gpu_set_ztestenable(true)
		gpu_set_zwriteenable(true)

		/*yaw += (window_mouse_get_x()-global.window_width/2)/8;
		pitch += (window_mouse_get_y()-global.window_height/2)/8;
		if pitch > 89 {pitch = 89;}
		if pitch < -89 {pitch = -89;}
		window_mouse_set(global.window_width/2,global.window_height/2);
		println("ZDIR " + string(pitch))
		println("DIR " + string(yaw))*/

		var xto = xx + lengthdir_x(180, yaw) * lengthdir_x(1, pitch)
		var yto = yy + lengthdir_y(180, yaw) * lengthdir_x(1, pitch)
		var zto = zz + lengthdir_y(180, pitch)

		var matrix = matrix_build_lookat(xx, yy, zz, xto, yto, zto, 0, 0, -1)
	
		camera_set_view_mat(camera, matrix);

		camera_apply(camera);
		gpu_set_fog(true, fogColor, fogStart, fogEnd );

		// 3D Happend here
		//live_call("draw3d")
		scr_draw3d()
	
		// Clean up mess people may have made
		if gpu_get_blendmode() != bm_normal {gpu_set_blendmode(bm_normal)}
		draw_set_alpha(1)
		draw_set_color(c_white)


		gpu_set_ztestenable(false)
		gpu_set_zwriteenable(false)
		gpu_set_fog(false, fogColor, fogStart, fogEnd );
		gpu_set_tex_mip_enable(mip_off);
		gpu_set_tex_mip_filter(tf_point);
	}
	surface_reset_target()
	// 3D End
	
	surface_set_target(surface3d)
	
	//surface_reset_target()
}