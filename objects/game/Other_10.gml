/// @description Game Step Event

/********************
Main Loop Equivalent
********************/

if unpauseNextFrame {
	pause = false
	unpauseNextFrame = false
	part_system_automatic_update(global.partSys, true)
	FMODGMS_Chan_ResumeChannel(channel[0])
	audio_resume_all()
}

if stageEnd && !pause {
	pause = true
	FMODGMS_Chan_PauseChannel(channel[0])
	audio_pause_all()
	if !instance_exists(obj_ingameMenuParent) {
		var _xs = 50, _ys = 150
		instance_create_depth(_xs, _ys, PAUSE_MENU_DEPTH, obj_scoreScreen)
	}
}
if (input.esc || (os_is_paused() && !global.replay) || frame == replayEndFrame || gameOver) && !pause {
	pause = true
	FMODGMS_Chan_PauseChannel(channel[0])
	audio_pause_all()
	if !instance_exists(obj_ingameMenuParent) {
		var _xs = 50, _ys = 150
		instance_create_depth(_xs, _ys, PAUSE_MENU_DEPTH, obj_pauseMenu)
	}
	gameOver = false
}

if !pause {
	frame++
	random_set_seed(frame)
} else {
	part_system_automatic_update(global.partSys, false)
}

if !pause {
	/**********
	Lua Runner
	**********/
	live_call("step")
	scr_stepDeleter()
	
	/************************
	Game Object Event Runner
	************************/
	with player					{event_user(0)}
	with obj_playerOrb			{event_user(0)}
	with obj_playerShotParent	{event_user(0)}
	with obj_deleteTimer		{event_user(0)}
	with obj_enemy				{event_user(0)}
	with obj_bossBackSprite		{event_user(0)}
	with obj_bulletParent		{event_user(0)}
	with obj_pickup				{event_user(0)}
	with obj_dialogueParent		{event_user(0)}
	
	with obj_SharedTweener		{event_user(0)}
	with drawGame				{event_user(0)}
}