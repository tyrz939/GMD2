
//scr_title_draw();
if !surface_exists(surf) {
	surf = surface_create(w, h * array_length_1d(menu))
	surface_set_target(surf)

	draw_set_halign(fa_left);
	var m, _name, _desc
	for (m =0; m < array_length_1d(menu); m++) {
		draw_set_colour(c_black)
		draw_set_alpha(0.75)
		draw_rectangle(0, (m*h), w, (m*h)+h-1, false)
		_name = string(menu[m])
		_desc = string(desc[m])
			
		draw_set_colour(c_white);
		draw_set_alpha(1)
		draw_set_valign(fa_top);
		draw_set_font(font_menuBig);
		draw_text(10,(m*h)+5,_name);
		draw_set_font(font_menuMedium);
		draw_text(10,(m*h)+5+50,_desc);
		
		draw_sprite(img[m], 0, w-100, (m*h)+100)
	}

	surface_reset_target()
}
	
for(var s = 0; s < array_length_1d(menu); s++) {
		
	draw_surface_part_ext(surf, 0, s*h, w, h, x + global.gui_width/2 -(w/2), y + global.gui_height/2-(h/2) + (s*space), 1, 1, c_white, 1)
}