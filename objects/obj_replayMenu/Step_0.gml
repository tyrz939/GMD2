scr_menu_step()

if input.b3 {
    instance_destroy();
    instance_activate_object(obj_mainMenu);
    instance_activate_object(obj_ingameMenuParent);
    play_sfx(sfx_menuBack, false);
    exit;
}

var push = scr_menu_select()

if push == 1 {
	// Replay Loading
	if room = rm_menu {
		global.scriptDirectory = menuGrid[# replyMenu_t.SDIR, mpos]// + "/"
		global.scriptFile = menuGrid[# replyMenu_t.SFIL, mpos]
		if file_exists_ns(global.scriptDirectory + global.scriptFile) {
			scr_loadInit(global.scriptDirectory)
			global.replay = true
			global.replayToLoad = mpos
			global.scriptName = menuGrid[# replyMenu_t.NAME, mpos]
			global.scriptDesc = menuGrid[# replyMenu_t.DESC, mpos]
			global.scriptAuth = menuGrid[# replyMenu_t.AUTH, mpos]
			global.playerNumber = menuGrid[# replyMenu_t.CHAR, mpos]
			global.difficulty = menuGrid[# replyMenu_t.DIFF, mpos]
			room_goto(rm_game)
		}
	}
	// Replay Saving
	if room = rm_game {
		replaySave(mpos)
		room_goto(rm_menu)
	}
}