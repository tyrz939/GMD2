if room = rm_game {
	draw_set_color(c_black)
	draw_set_alpha(0.75)
	draw_rectangle(0, 0, global.gui_width, global.gui_height, false)
	draw_set_alpha(1)
}

draw_set_font(font_replay)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
for(var i = 0; i < menuLength; i++) {
	if i == mpos {draw_set_color(global.menuPulseColor)}
	else {draw_set_color(global.menuTextColor)}
	draw_text(50, 50 + (i * space), string(menu[i]))
}

draw_set_color(c_white)