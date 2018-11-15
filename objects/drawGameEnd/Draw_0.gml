with drawGame {
	surface_reset_target()
	// Draw the GUI
	switch global.scalingTypeGUI {
		case -1: gpu_set_tex_filter(false); break;
		case 0: gpu_set_tex_filter(true); break;
	}
	better_scaling_draw_surface(guiSurface, __guiXstart, __guiYstart, __guiScale, __guiScale, 0, c_white, 1, global.scalingTypeGUI)
}