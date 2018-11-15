menu[0] = "Script Select";
menu[1] = "Replay";
menu[2] = "Options";
menu[3] = "Quit";

gray = array_create(array_length_1d(menu), false);

push = 0;
space = global.menuSpacing;
mpos = 0;
x = global.gui_width * 0.1;
y = global.gui_height * 0.5;

// For flashy selection
alpha = 1;
alpha_dir = 0;

if !instance_exists(obj_menuParticles) {
	instance_create_depth(32, 24, 100, obj_menuParticles);
	instance_create_depth(32, 24, -1, obj_menuBG);
}