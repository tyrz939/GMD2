menu[0] = "Fullscreen";
menu[1] = "Vsync";
menu[2] = "Texture Filtering";
menu[3] = "Scaling Mode";
menu[4] = "Game Shader";
menu[5] = "GUI Shader";
menu[6] = "Back";

gray = array_create(array_length_1d(menu), false);

space = global.menuSpacing;
mpos = 0;

x = global.gui_width * 0.1;
y = global.gui_height * 0.4;

//For flashy selection
alpha = 1;
alpha_dir = 0;

// Right Side array
if global.fullscreen == 1	{on[0] = "On";}
else						{on[0] = "Off";}

if global.vsync == 1		{on[1] = "On";}
else						{on[1] = "Off";}
	
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

hold_counter = 0;
left = false;
right = false;