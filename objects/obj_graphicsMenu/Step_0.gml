scr_menu_step();

if input.b3 {
    scr_save();
    instance_destroy();
    instance_activate_object(obj_optionsMenu);
    play_sfx(sfx_menuBack, false);
    exit;
}

var push = scr_menu_select();
if mpos <= 6 {
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
}

if push == 1 {
    switch mpos {
        case 0: // Fullscreen
			global.fullscreen = !global.fullscreen;
			window_set_fullscreen(global.fullscreen);
			if !global.fullscreen {window_set_size(global.window_width, global.window_height)}
            break;
        case 1: // Vsync
            global.vsync = !global.vsync;
            display_reset(0, global.vsync);
            break;
        case 2: // Texture Filtering
			if left		{global.afLevel /= 2}
			if right	{global.afLevel *= 2}
			global.afLevel = clamp(global.afLevel, 1, 16)
			if global.afLevel >= 2	{global.textureFilterMode = tf_anisotropic}
			else					{global.textureFilterMode = tf_linear}
		break;
        case 3: // Scaling
			if left		{global.upscale -= 1}
			if right	{global.upscale += 1}
			global.upscale = clamp(global.upscale, 0, 1)
			drawSystemResize()
            break;
        case 4: // Game Shader
			if left		{global.scalingTypeGame -= 1}
			if right	{global.scalingTypeGame += 1}
			global.scalingTypeGame = clamp(global.scalingTypeGame, -1, 5)
            break;
        case 5: // GUI Shader
			if left		{global.scalingTypeGUI -= 1}
			if right	{global.scalingTypeGUI += 1}
			global.scalingTypeGUI = clamp(global.scalingTypeGUI, -1, 5)
            break;
        case 6: // Back
            play_sfx(sfx_menuBack, false);
            scr_save();
            instance_destroy();
            instance_activate_object(obj_optionsMenu);
            break;
    }
}

// Right Side array
if global.fullscreen == 1	{on[0] = "On";}
else						{on[0] = "Off";}

if global.vsync == 1	{on[1] = "On";}
else					{on[1] = "Off";}
	
if global.textureFilterMode == tf_linear	{on[2] = "Trilinear Filtering";}
else										{on[2] = "Anisotropic Filtering x" + string(global.afLevel);}

if global.upscale == true	{on[3] = "Resolution Upscaler - Nicer";}
else						{on[3] = "Standard Resolution - Faster";}
	
switch global.scalingTypeGame {
	case -1: on[4] = "GameMaker Pixelated";				break;
	case 0: on[4] = "GameMaker Interpolated";			break;
	case 1: on[4] = "Bicubic upscale";					break;
	case 2: on[4] = "hq4x depixelization";				break;
	case 3: on[4] = "5xbra depixelization (round)";		break;
	case 4: on[4] = "5xbrb depixelization (semi-round)";break;
	case 5: on[4] = "5xbrc depixelization (square)";	break;
}
	
switch global.scalingTypeGUI {
	case -1: on[5] = "GameMaker Pixelated";				break;
	case 0: on[5] = "GameMaker Interpolated";			break;
	case 1: on[5] = "Bicubic upscale";					break;
	case 2: on[5] = "hq4x depixelization";				break;
	case 3: on[5] = "5xbra depixelization (round)";		break;
	case 4: on[5] = "5xbrb depixelization (semi-round)";break;
	case 5: on[5] = "5xbrc depixelization (square)";	break;
}