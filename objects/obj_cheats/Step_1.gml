/****************
Debug/Cheat keys
****************/
if !global.term {
	
	// State HARD RESET
	if keyboard_check_pressed(vk_f5) {
		room_goto(rm_game)
	}
	// State SOFT RESET
	if keyboard_check_pressed(vk_f6) {
		with game {
			with obj_enemy			{instance_destroy()}
			with obj_bulletParent	{instance_destroy()}
			with obj_drawDepth		{instance_destroy()}
			// Killing Lua
			live_cleanup()
			with obj_GUI {instance_destroy()}
			ds_grid_destroy(shotCreateGrid)
			ds_grid_destroy(scene3d)
			// Starting Lua Again
			instance_create_depth(0, 0, INTERFACE_DEPTH, obj_GUI)
			scr_init3d()
			scr_initShots()
			live_init(global.scriptDirectory + global.scriptFile)
			lua_add_code(live_state, luaStartCode())
			live_call("initialize")
		}
	}
	/*if keyboard_check_pressed(vk_f7) {
		with game {
			live_update()
		}
	}*/
	
	// Power
	if instance_exists(player) {
	    if keyboard_check_pressed(vk_subtract)	{game.shotPower -= 1;}
	    if keyboard_check_pressed(vk_add)		{game.shotPower += 1;}
		game.shotPower = clamp(game.shotPower, 0, player.shotPowerMax)
	}
	
	// God Mode
    if keyboard_check_pressed(ord("9")) {god = !god}
}
if god == true {player.hit = false}