if global.term {
	var w = global.gui_width
	//var h = window_get_height()
    // Background
    draw_set_color(c_black);
    draw_set_alpha(0.75);
	var drop = 414
    draw_rectangle(0, 0, w, drop, false);
    
    // Text
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(font_terminal);
    draw_set_alpha(1);
    draw_set_color(c_ltgray);
    
    var ydraw = (drop - 2) - (string_height(string("A")) * line_count)
//	var sep = 18
	var termString = ""
    for(var i = line_count-1; i >= 0; i--) {
        if i = 0 {
			termString += string(line[i]) + string(curser)
        } else {
			termString += string(line[i]) + "\n"
        }
    }
	//draw_text(5, ydraw, termString)
	draw_text_custom(5, ydraw, termString, 1)
}