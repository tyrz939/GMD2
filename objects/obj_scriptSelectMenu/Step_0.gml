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
    instance_activate_object(obj_mainMenu);
    play_sfx(sfx_menuBack, false);
    exit;
}

if is_array(scripts) {
	var push = scr_menu_select();
	if push == 1 {
	    play_sfx(sfx_menuSelect, false);
		if !gray[mpos] {
			play_sfx(sfx_menuSelect, false);
			global.scriptName = menu[mpos]
			global.scriptDesc = desc[mpos]
			global.scriptAuth = auth[mpos]
			global.scriptDirectory = scripts[mpos] + "/"
			global.scriptFile = sfile[mpos]
			scr_loadInit(global.scriptDirectory)
			if file_exists_ns(global.scriptDirectory + global.scriptFile) {
				instance_deactivate_object(self)
				instance_create_depth(0, 0, depth, obj_playerSelectMenu)
			}
		}
	}
}
