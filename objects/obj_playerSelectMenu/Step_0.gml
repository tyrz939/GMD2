move = 0;
move -= max(input.up,0);
move += max(input.down,0);
if move !=0{
    play_sfx(sfx_menuMove, false);
    mpos += move;
    if (mpos <0){
        mpos = array_length_1d(menu) -1;
    }
    if (mpos > array_length_1d(menu) -1){
        mpos = 0;
    }
	y_target = mpos * -space
	TweenEasyMove(x, y, x, y_target, 0, 30, EaseOutBack)
}
with obj_SharedTweener {event_user(0)}


if input.b3 {
    scr_save();
    instance_destroy();
    instance_activate_object(obj_scriptSelectMenu);
    play_sfx(sfx_menuBack, false);
    exit;
}

var push = scr_menu_select();
if push == 1 {
	play_sfx(sfx_menuSelect, false);
	if !gray[mpos] {
		play_sfx(sfx_menuSelect, false)
		switch mpos {
			// Reimu
			case 0: global.playerNumber = 0		break;
			// Marisa
			case 1: global.playerNumber = 10	break;
		}
		global.difficulty = 0
		instance_activate_all()
		room_goto(rm_game)
	}
}
