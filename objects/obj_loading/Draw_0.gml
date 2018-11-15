draw_clear(make_color_rgb(0,0,50))

// Text
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_font(font_menuBig);
draw_set_alpha(1);
draw_set_color(c_ltgray);

draw_text(global.gui_width - 25, global.gui_height - 15, "Loading...")

image_angle += 3 * (delta_time/16666)
draw_sprite_ext(spr_loadingYinYang, 0, global.gui_width - 310, global.gui_height - 45, 1, 1, image_angle, c_white, 1)

draw_set_color(c_black);
draw_rectangle(0, 125, global.gui_width, 835, false)
draw_set_color(c_ltgray);
draw_line_width(0, 125, global.gui_width, 125, 2)
draw_line_width(0, 835, global.gui_width, 835, 2)


draw_set_color(c_white);