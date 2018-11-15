menu[0] = "BGM Volume";
menu[1] = "SFX Volume";
menu[2] = "Show FPS";
menu[3] = "Graphics Options";
menu[4] = "Key Rebinding";
menu[5] = "Back";

gray = array_create(array_length_1d(menu), false);

space = global.menuSpacing;
mpos = 0;

x = global.gui_width * 0.1;
y = global.gui_height * 0.4;

//For flashy selection
alpha = 1;
alpha_dir = 0;


//On/Off part
on[0] = string(round(global.music_vol * 100)) + "%";
on[1] = string(round(global.sfx_vol * 100)) + "%";

if global.showfps == 2
    {on[2] = "Hella On";}
else if global.showfps == 1
    {on[2] = "On";}
else
    {on[2] = "Off";}
    
sfx_timer = 0;
hold_counter = 0;
left = false;
right = false;