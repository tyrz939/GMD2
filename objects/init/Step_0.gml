if !instance_exists(input) {instance_create_depth(0, 0, 0, input);}
if !instance_exists(drawGame) {instance_create_depth(0, 0, 0, drawGame);}

if global.debug {
	if !instance_exists(terminal) {instance_create_depth(0, 0, 0, terminal);}
}

if global.showfps >= 1 && !instance_exists(obj_fps) {
	instance_create_depth(0, 0, 0, obj_fps);
}

instance_create_depth(0, 0, -100, obj_mainMenu);

global.replay = false
global.replayToLoad = -1
instance_destroy();