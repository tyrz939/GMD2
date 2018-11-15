var push = scr_menu_select();

if rebinding {
    alpha = 1;
    alpha_dir = 0;
    if keyboard_check_pressed(vk_anykey) {
        var apply = true;
        // Conflicting with another key
        if scr_rebind_return(keyboard_lastkey, true) == "1" {
            apply = false;
            play_sfx(sfx_menuBack, false);
        }
        // Not a valid key
        if scr_rebind_return(keyboard_lastkey, true) == "2" {
            apply = false;
            play_sfx(sfx_menuBack, false);
        }
        if apply {
            key = keyboard_lastkey;
            key_set = true;
            play_sfx(sfx_menuSelect, false);
        }
        rebinding = false;
    }
} else {
    if input.b3 {
        instance_destroy();
        instance_activate_object(obj_optionsMenu);
        play_sfx(sfx_menuBack, false);
        exit;
    }
    scr_menu_step();
}

if !rebinding && mpos < array_length_1d(menu) - 2{
    if push {
        rebinding = true;
    }
}
// Defaults/Back Press
if push == 1 && mpos >= array_length_1d(menu) - 2 {
    key_set = true;
}

if key_set == true {
    if mpos < 9 {
		play_sfx(sfx_menuSelect, false);
	} else {
		play_sfx(sfx_menuBack, false);
	}
    key_set = false;
    switch mpos {
        case 0: global.Up = key; break;
        case 1: global.Down = key; break;
        case 2: global.Left = key; break;
        case 3: global.Right = key; break;
        case 4: global.B1 = key; break;
        case 5: global.B2 = key; break;
        case 6: global.B3 = key; break;
        case 7: global.B4 = key; break;
        case 8:
            global.Up = ord("W");
            global.Down = ord("S");
            global.Left = ord("A");
            global.Right = ord("D");
            global.B1 = vk_shift;
            global.B2 = ord("Z");
            global.B3 = ord("X");
            global.B4 = ord("C");
            break; //Defaults
        case 9:
            scr_save();
            instance_destroy();
            instance_activate_object(obj_optionsMenu);
            break;
    }
}

keys[0] = scr_rebind_return(global.Up, false);
keys[1] = scr_rebind_return(global.Down, false);
keys[2] = scr_rebind_return(global.Left, false);
keys[3] = scr_rebind_return(global.Right, false);
keys[4] = scr_rebind_return(global.B1, false);
keys[5] = scr_rebind_return(global.B2, false);
keys[6] = scr_rebind_return(global.B3, false);
keys[7] = scr_rebind_return(global.B4, false);

keyboard_lastkey=-1; //Reset Last Key reading.