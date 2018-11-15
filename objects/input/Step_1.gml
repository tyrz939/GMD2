// Hack for playing sounds only once. Needs to be ran every frame :\
global.prevSfx = -1

// Alt F4 - Quit
if keyboard_check(vk_alt) && keyboard_check(vk_f4) {
    scr_save();
    game_end();
}

if global.debug {
    if keyboard_check_pressed(vk_tab) {
        game_set_speed(6000, gamespeed_fps);
    }
    if keyboard_check_released(vk_tab) {
        game_set_speed(60, gamespeed_fps);
    }
}

/*
Sets if "pressed" or "released"
It's like this for the replay system, I know it sucks
*/

// Resets Variables

up=noone;
down=noone;
left=noone;
right=noone;
b1=noone;
b2=noone;
b3=noone;
b4=noone;
esc=noone;
enter=noone;

if !global.term {
    // Keyboard Start!
    // Movement
    if keyboard_check_pressed(vk_anykey) || keyboard_check_released(vk_anykey) {
        if keyboard_check_pressed(global.Up) || keyboard_check_pressed(vk_up) {up=true;}
            if keyboard_check_released(global.Up) || keyboard_check_released(vk_up) {up=false;}
        if keyboard_check_pressed(global.Down) || keyboard_check_pressed(vk_down) {down=true;}
            if keyboard_check_released(global.Down) || keyboard_check_released(vk_down) {down=false;}
        if keyboard_check_pressed(global.Left) || keyboard_check_pressed(vk_left) {left=true;}
            if keyboard_check_released(global.Left) || keyboard_check_released(vk_left) {left=false;}
        if keyboard_check_pressed(global.Right) || keyboard_check_pressed(vk_right) {right=true;}
            if keyboard_check_released(global.Right) || keyboard_check_released(vk_right) {right=false;}
			
        if keyboard_check_pressed(global.B1) {b1=true;}
            if keyboard_check_released(global.B1) {b1=false;}
        if keyboard_check_pressed(global.B2) {b2=true;}
            if keyboard_check_released(global.B2) {b2=false;}
        if keyboard_check_pressed(global.B3) {b3=true;}
            if keyboard_check_released(global.B3) {b3=false;}
        if keyboard_check_pressed(global.B4) {b4=true;}
            if keyboard_check_released(global.B4) {b4=false;}
            
        if keyboard_check_pressed(vk_escape) {esc=true;}
            if keyboard_check_released(vk_escape) {esc=false;}
        if keyboard_check_pressed(vk_enter) {enter=true;}
            if keyboard_check_released(vk_enter) {enter=false;}
    }
    // Keyboard End
    
    // Game Pad Start!
    var gp_num = gamepad_get_device_count();
    for( var i = 0; i < gp_num; i++; ) {
        if gamepad_is_connected(i) {
            // Movement
            // Analog Sticks
            gamepad_set_axis_deadzone(i, 0.5);
            var LVaxis = gamepad_axis_value(i, gp_axislv);
            if LVaxis < 0 && up1 == false {up=true; up1=true;}
            if LVaxis > 0 && down1 == false {down=true; down1=true;}
            if LVaxis = 0 && (up1 || down1)
                {up1=false; down1=false; up=false; down=false;}
            var LHaxis = gamepad_axis_value(i, gp_axislh);
            if LHaxis < 0 && left1 == false {left=true; left1=true;}
            if LHaxis > 0 && right1 == false {right=true; right1=true;}
            if LHaxis = 0 && (left1 || right1)
                {left1=false; right1=false; left=false; right=false;}
            // Buttons
            if gamepad_button_check_pressed(i,gp_padu) {up=true;}
                if gamepad_button_check_released(i,gp_padu) {up=false;}
            if gamepad_button_check_pressed(i,gp_padd) {down=true;}
                if gamepad_button_check_released(i,gp_padd) {down=false;}
            if gamepad_button_check_pressed(i,gp_padl) {left=true;}
                if gamepad_button_check_released(i,gp_padl) {left=false;}
            if gamepad_button_check_pressed(i,gp_padr) {right=true;}
                if gamepad_button_check_released(i,gp_padr) {right=false;}
            if gamepad_button_check_pressed(i,gp_shoulderr) {b1=true;}
                if gamepad_button_check_released(i,gp_shoulderr) {b1=false;}
            // Bomb, Shoot & Esc
            if gamepad_button_check_pressed(i,gp_face1) {b2=true;}
                if gamepad_button_check_released(i,gp_face1){b2=false;}
            if gamepad_button_check_pressed(i,gp_face2) {b3=true;}
                if gamepad_button_check_released(i,gp_face2) {b3=false;}
            if gamepad_button_check_pressed(i,gp_start) {esc=true;}
                if gamepad_button_check_released(i,gp_start){esc=false;}
        }
    }
}
// Game Pad End