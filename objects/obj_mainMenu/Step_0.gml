scr_menu_step()

if input.b3 && mpos != array_length_1d(menu)-1 {
    mpos = array_length_1d(menu)-1
    play_sfx(sfx_menuMove, false)
}

var push = scr_menu_select()

if push == 1 {
    play_sfx(sfx_menuSelect, false)
    switch mpos {
        case 0: // Script Select
            instance_deactivate_object(self)
			global.replay = false
            instance_create_depth(x, y, depth, obj_scriptSelectMenu)
            break;
        case 1: // Replay Menu
            instance_deactivate_object(self)
			global.replay = true
            instance_create_depth(x, y, depth, obj_replayMenu)
            break;
        case 2: // Options Menu
            instance_deactivate_object(self)
            instance_create_depth(x, y, depth, obj_optionsMenu)
            break;
        case 3: // Quit
            scr_save()
            game_end()
            break;
    }
}