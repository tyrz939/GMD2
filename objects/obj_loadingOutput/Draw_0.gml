if y < 150 {instance_destroy(); exit;}

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(font_terminal);
draw_set_alpha(1);
draw_set_color(c_ltgray);

draw_text_custom(x, y, text, image_alpha)