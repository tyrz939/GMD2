if global.showfps == 2 {
	aFPS1 = array_create(200, 1)
	rFPS = fps_real
	rFPSt = 0
	rFPSb = 0
	
	aFPS2 = array_create(200, 1)
	sFPS = 1
	sFPSt = 0
	sFPSb = 0
	
	
	show_debug_overlay(true)
}
	_counter = 0
	_dt_add = 0
	_fps = 0
	
depth = -15900