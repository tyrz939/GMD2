if game.gameOver && !global.replay	{menu[0] = "Continue";		state = 2;}
else if global.replay				{menu[0] = "Resume Replay";	state = 1;}
else								{menu[0] = "Resume Game";	state = 0;}
menu[1] = "Save Replay and Quit"
menu[2] = "Quit"

gray = array_create(array_length_1d(menu), false);

push = 0;
space = 50;
mpos = 0;

// For flashy selection
alpha = 1;
alpha_dir = 0;

gameToGuiScaleWidth = global.gui_width / global.res_x
gameToGuiScaleWidth = global.gui_height / global.res_y

x = gameToGuiX(ref_getCenterX())
y = gameToGuiY(ref_getCenterY())

if game.frame == game.replayEndFrame || game.continues == 0 || game.stageEnd {
	gray[0] = true
	mpos++
}
if global.replay || game.continuesUsed > 0 {
	gray[1] = true
	if gray[0] = true {mpos++}
}