menu[0] = "Up";
menu[1] = "Down";
menu[2] = "Left";
menu[3] = "Right"
menu[4] = "Focus";
menu[5] = "Shoot";
menu[6] = "Bomb";
menu[7] = "Extra??";
menu[8] = "Defaults";
menu[9] = "Back";
println(vk_shift)
gray = array_create(array_length_1d(menu), false);

keys[0] = scr_rebind_return(global.Up, false);
keys[1] = scr_rebind_return(global.Down, false);
keys[2] = scr_rebind_return(global.Left, false);
keys[3] = scr_rebind_return(global.Right, false);
keys[4] = scr_rebind_return(global.B1, false);
keys[5] = scr_rebind_return(global.B2, false);
keys[6] = scr_rebind_return(global.B3, false);
keys[7] = scr_rebind_return(global.B4, false);

arrows[0] = "Up Arrow";
arrows[1] = "Down Arrow";
arrows[2] = "Left Arrow";
arrows[3] = "Right Arrow";

key_set=false;
space = global.menuSpacing;
mpos = 0;

x = global.gui_width * 0.1;
y = global.gui_height * 0.4;

rebinding = false;

//For flashy selection
alpha = 1;
alpha_dir = 0;