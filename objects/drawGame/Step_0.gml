if prevWindowWidth != window_get_width() || prevWindowHeight != window_get_height() {
	event_user(15)
	prevWindowWidth = window_get_width()
	prevWindowHeight = window_get_height()
}