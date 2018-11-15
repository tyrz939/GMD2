draw_set_color(c_black)
draw_set_alpha(0.75)
draw_rectangle(drawGame.GUIPlayAreaStartX, drawGame.GUIPlayAreaStartY, drawGame.GUIPlayAreaEndX, drawGame.GUIPlayAreaEndY, false)
draw_set_alpha(1)

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.font_MainMenu);

var m;
for (m = 0; m < array_length_1d(menu); m++) {
    draw_set_alpha(1);
    if gray[m] {
        draw_set_colour(global.menuGrayColor);
    } else {
        draw_set_colour(global.menuTextColor);
    }
    draw_text(x,y+(m*space),string(menu[m]));
    //Pulsing Selection
    if m == mpos {
        draw_set_alpha(alpha);
        draw_set_colour(global.menuPulseColor);
        draw_text(x,y+(m*space),string(menu[m]));
        draw_set_alpha(1);
    }
}
draw_set_color(c_white)