shakeX = 0
shakeY = 0
shakeAmplitude = 0
shakeDuration = 0

var w = window_get_width(), h = window_get_height()
if w > 0 && h > 0 {
	if !instance_exists(game) {
		global.res_x = 64
		global.res_y = 48
		playFieldSetup(0, 0, 64, 48)
	}
	if !surface_exists(gameSurface){
	    gameSurface = surface_create(global.playAreaWidth, global.playAreaHeight)
	}

	surface_resize(gameSurface, global.playAreaWidth, global.playAreaHeight)
	if !surface_exists(guiSurface) {
		guiSurface = surface_create(global.gui_width, global.gui_height)
	}
	surface_resize(guiSurface, global.gui_width, global.gui_height)

	if global.upscale {
		display_set_gui_size(w, h)
		surface_resize(application_surface, w, h)
		room_width = w
		room_height = h
		window_set_size(w, h)
		__guiScale = min(w / global.gui_width, h / global.gui_height)
		__guiXstart = (w / 2) - ((global.gui_width / 2) * __guiScale)
		__guiYstart = (h / 2) - ((global.gui_height / 2) * __guiScale)
		//__gameScale = min(w / global.res_x, h / global.res_y)
		__gameScale = min(global.gui_width / global.res_x, global.gui_height / global.res_y)
		
		__xyOffset = __gameScale * __guiScale
	} else {
		display_set_gui_size(global.gui_width, global.gui_height)
		surface_resize(application_surface, global.window_width, global.window_height)
		room_width = global.window_width
		room_height = global.window_height
		window_set_size(global.window_width, global.window_height)
		__guiScale = 1
		__guiXstart = 0
		__guiYstart = 0
		__gameScale = min(global.gui_width / global.res_x, global.gui_height / global.res_y)
		__xyOffset = __gameScale * __guiScale
	}
	
	// Variables to make life easier
	GUIPlayAreaStartX = (global.playAreaStartX * drawGame.__xyOffset) / drawGame.__guiScale
	GUIPlayAreaStartY = (global.playAreaStartY * drawGame.__xyOffset) / drawGame.__guiScale
	GUIPlayAreaEndX = ((global.playAreaStartX + global.playAreaWidth) * drawGame.__xyOffset) / drawGame.__guiScale
	GUIPlayAreaEndY = ((global.playAreaStartY + global.playAreaHeight) * drawGame.__xyOffset) / drawGame.__guiScale
}