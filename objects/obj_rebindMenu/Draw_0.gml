//scr_title_draw();

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(global.font_MainMenu);

var m;
for (m =0; m < array_length_1d(menu); m+=1)
{
    //Menu Shadow
/*    draw_set_alpha(0.5);
    draw_set_colour(c_black);
    draw_text(x+2,y+2+(m*space),string(menu[m]));*/
    //Menu
    draw_set_alpha(1);
    draw_set_colour(global.menuTextColor);
    draw_text(x,y+(m*space),string(menu[m]));
    //Pulsing Selection
    if m == mpos {
        draw_set_alpha(alpha);
        draw_set_colour(global.menuPulseColor);
        draw_text(x,y+(m*space),string(menu[m]));
        draw_set_alpha(1);
    }
}

var i;

for ( i = 0; i < array_length_1d(keys); i++ ) {
    draw_set_colour(global.menuTextColor); 
    draw_text(x+200,y+(i*space),keys[i])
    if !rebinding {
        draw_set_colour(global.menuPulseColor);
    } else {
        draw_set_colour(make_colour_rgb(255, 100, 100));
    }
    draw_set_alpha(alpha);
    if i == mpos {
        draw_text(x+200,y+(i*space),string(keys[i]))
    }
    draw_set_alpha(1);
}

for ( i = 0; i < array_length_1d(arrows); i++ ) {
    draw_set_colour(global.menuTextColor); 
    draw_text( x + 175 + 175, y + (i * space), arrows[i] )
}