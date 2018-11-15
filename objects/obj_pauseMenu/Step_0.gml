if !game.pause {
	instance_destroy()
	exit
}
if game.stageEnd {
	if input.b3 {
		instance_destroy()
		instance_create_depth(0, 0, depth, obj_scoreScreen)
	}
}

scr_menu_step()

var push = scr_menu_select()

if push == 1 {
    play_sfx(sfx_menuSelect, false)
	switch mpos {
		case 0:
			println(state)
			if state == 2 {
				game.continues--
				game.continuesUsed++
				lives = 3
				score = 0
				game.grazeCount = 0
			}
			game.unpauseNextFrame = true;
			instance_destroy();
			break;
		case 1:
			instance_create_depth(0, 0, depth, obj_replayMenu);
			instance_deactivate_object(self)
			//instance_destroy();
			break;
		case 2:
			room_goto(rm_menu);
			instance_destroy();
			break;
	}
}