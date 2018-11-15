/// Transition from Game to GUI
with drawGame {
	surface_reset_target()
	// Draw the game field
	switch global.scalingTypeGame {
		case -1: gpu_set_tex_filter(false); break;
		case 0: gpu_set_tex_filter(true); break;
	}
	//draw_clear(c_black)
	var _st
	if room == rm_game {
		_st = global.scalingTypeGame
	} else {
		_st = 0
		gpu_set_tex_filter(false);
	}
	
	// GUI START
	if !surface_exists(guiSurface) {
		guiSurface = surface_create(global.gui_width, global.gui_height)
	}

	surface_set_target(guiSurface)
	draw_clear(c_black)
	
	// Draw Game Surface
	gpu_set_blendenable(false)
	better_scaling_draw_surface(gameSurface, GUIPlayAreaStartX + shakeX * __gameScale, GUIPlayAreaStartY + shakeX * __gameScale, __gameScale, __gameScale, 0, c_white, 1, _st)
	gpu_set_blendenable(true)
}