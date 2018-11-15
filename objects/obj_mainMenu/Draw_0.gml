//scr_title_draw();

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(global.font_MainMenu);

var m;
for (m =0; m < array_length_1d(menu); m+=1) {
    //Menu Shadow
/*    draw_set_alpha(0.5);
    draw_set_colour(c_black);
    draw_text(x+2,y+2+(m*space),string(menu[m]));*/
    //Menu
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