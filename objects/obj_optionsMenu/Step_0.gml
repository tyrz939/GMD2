scr_menu_step();

if input.b3 {
    scr_save();
    instance_destroy();
    instance_activate_object(obj_mainMenu);
    play_sfx(sfx_menuBack, false);
    exit;
}

var push = scr_menu_select();
if mpos <= 2 {
    push = max(input.left, input.right,0);
    if input.left {
        left = true;
    } else if input.left == false {
        left = false;
    }
    if input.right {
        right = true;
    } else if input.right == false {
        right = false;
    }
    
    if mpos <= 1 {
        if left || right {
            if hold_counter == 30 {
                push = 1;
                hold_counter -= 6;
            }
            hold_counter++;
        } else {
            hold_counter = 0;
        }
    }
}

if push == 1 {
    switch mpos {
        case 0: // BGM
            var music_vol_prev = global.music_vol;
            if right global.music_vol += 0.05;
            if left global.music_vol -= 0.05;
            global.music_vol = clamp(global.music_vol, 0, 1);
            break;
        case 1: // SFX
            if right global.sfx_vol += 0.05;
            if left global.sfx_vol -= 0.05;
            global.sfx_vol = clamp(global.sfx_vol, 0, 1);
			audio_group_set_gain(SFX, global.sfx_vol, 0)
            sfx_timer = 60;
            break;
        case 2: // Show FPS
            play_sfx(sfx_menuSelect, false);
            if right global.showfps += 1;
            if left global.showfps -= 1;
			global.showfps = clamp(global.showfps, 0, 2);
			instance_destroy(obj_fps);
            if global.showfps >= 1 {
				instance_create_depth(0, 0, 0, obj_fps);
			}
            break;
        case 3: // Graphics Options
            play_sfx(sfx_menuSelect, false);
            instance_deactivate_object(self);
            instance_create_depth(x,y,depth,obj_graphicsMenu);
            break;
        case 4: // Rebind Menu
            play_sfx(sfx_menuSelect, false);
            instance_deactivate_object(self);
            instance_create_depth(x,y,depth,obj_rebindMenu);
            break;
        case 5: // Back
            play_sfx(sfx_menuBack, false);
            scr_save();
            instance_destroy();
            instance_activate_object(obj_mainMenu);
            break;
    }
}

// Right Side array
on[0] = string(round(global.music_vol * 100)) + "%";
on[1] = string(round(global.sfx_vol * 100)) + "%";

if global.showfps == 2
    {on[2] = "Hella On";}
else if global.showfps == 1
    {on[2] = "On";}
else
    {on[2] = "Off";}

if mpos == 1 {
    if sfx_timer == 60 {
        play_sfx(sfx_menuSelect, false);
        sfx_timer = 0;
    }
    sfx_timer++;
} else {
    sfx_timer = 0;
}