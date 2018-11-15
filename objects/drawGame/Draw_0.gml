with game {
	// Boss Distortion
	surface_reset_target()
	scr_drawBossDistortion()
}

if !surface_exists(gameSurface){
    gameSurface = surface_create(global.playAreaWidth, global.playAreaHeight)
}
surface_set_target(gameSurface)
draw_clear(c_black)

// Draw game background to surface
with game {
	if surface_exists(surface3d) {
		draw_surface_ext(surface3d, 0, 0, 1, 1, 0, c_white, 1)
	}
}