/// @description Loading/Init
var col1 = make_color_rgb(51, 255, 51)
var col3 = make_color_rgb(255,176,0)
var col4 = make_color_rgb(255, 0, 127)
var col5 = make_color_rgb(0,176,255)
var col2 = c_ltgray
switch loadingState {
	case 0:
		luaScriptDir = string_replace_all(global.scriptDirectory, "/", ".")
		gmScriptDir = global.scriptDirectory
		live_init(global.scriptDirectory + global.scriptFile)
		lua_add_code(live_state, luaStartCode())
		
		loadingPrint("Lua Initialized")
	
		importGrid = ds_grid_create(17, 1)
		ds_grid_set_region(importGrid, 0, 0, 17, 0, -1)
		
		//importAssets("mainTexPage", 0)
		
		image_system_init()
		image_group_create("mainTexPage")
		image_stream_start("mainTexPage", 4096, 4096, 1)
		live_call("importAssets")
		if loadDefaultAssets {
			lua_add_code(live_state, @"
				_assets = require('assets.assets')
				_assets.loadAssets('mainTexPage')
			")
		}
		
		loadingPrint("Starting asset import")
		
		_li = 0
		loadingState++
		break
	case 1: /********** Importing Sprites **********/
		if importGrid[# 0, _li] != -1 {
			switch importGrid[# 0, _li] {
				case 1:
					image_stream_add(importGrid[# 1, _li], importGrid[# 2, _li], importGrid[# 3, _li], importGrid[# 4, _li], importGrid[# 5, _li], importGrid[# 6, _li]);
					loadingPrint("Fetched '" + text_color(col1) + importGrid[# 2, _li] + text_color(col2) + "' from '" + text_color(col1) + importGrid[# 3, _li] + text_color(col2) + "' for group '" + text_color(col1) + importGrid[# 1, _li] + text_color(col2) + "'")
					break;
				case 2:
					image_stream_add_ext(importGrid[# 1, _li], importGrid[# 2, _li], importGrid[# 3, _li], importGrid[# 4, _li], importGrid[# 5, _li], importGrid[# 6, _li], importGrid[# 7, _li], importGrid[# 8, _li], importGrid[# 9, _li], importGrid[# 10, _li], importGrid[# 11, _li], importGrid[# 12, _li], importGrid[# 13, _li]);
					loadingPrint("Fetched '" + text_color(col1) + importGrid[# 2, _li] + text_color(col2) + "' from '" + text_color(col1) + importGrid[# 3, _li] + text_color(col2) + "' for group '" + text_color(col1) + importGrid[# 1, _li] + text_color(col2) + "'")
					break;
				case 3:
					image_stream_add_3d(importGrid[# 1, _li], importGrid[# 2, _li], importGrid[# 3, _li], importGrid[# 4, _li], importGrid[# 5, _li], importGrid[# 6, _li]);
					loadingPrint("Fetched '" + text_color(col1) + importGrid[# 2, _li] + text_color(col2) + "' from '" + text_color(col1) + importGrid[# 3, _li] + text_color(col2) + "' for group '" + text_color(col1) + importGrid[# 1, _li] + text_color(col2) + "'")
					break;
				case 4:
					image_stream_add_3d_ext(importGrid[# 1, _li], importGrid[# 2, _li], importGrid[# 3, _li], importGrid[# 4, _li], importGrid[# 5, _li], importGrid[# 6, _li], importGrid[# 7, _li], importGrid[# 8, _li], importGrid[# 9, _li], importGrid[# 10, _li], importGrid[# 11, _li], importGrid[# 12, _li], importGrid[# 13, _li]);
					loadingPrint("Fetched '" + text_color(col1) + importGrid[# 2, _li] + text_color(col2) + "' from '" + text_color(col1) + importGrid[# 3, _li] + text_color(col2) + "' for group '" + text_color(col1) + importGrid[# 1, _li] + text_color(col2) + "'")
					break;
				case 5:
					wav_add(importGrid[# 1, _li], importGrid[# 2, _li], importGrid[# 3, _li]);
					loadingPrint("Fetched PCM Sound '" + text_color(col3) + importGrid[# 3, _li] + text_color(col2) + "' from '" + text_color(col3) + importGrid[# 1, _li] + text_color(col2) + "'")
					break;
				case 6:
					bgm_add(importGrid[# 1, _li], importGrid[# 2, _li], importGrid[# 3, _li], importGrid[# 4, _li]);
					loadingPrint("Fetched BGM '" + text_color(col4) + importGrid[# 3, _li] + text_color(col2) + "' from '" + text_color(col4) + importGrid[# 1, _li] + text_color(col2) + "'")
					break;
				case 7:
					fontAdd(importGrid[# 1, _li], importGrid[# 2, _li], importGrid[# 3, _li], importGrid[# 4, _li], importGrid[# 5, _li], importGrid[# 6, _li], importGrid[# 7, _li]);
					loadingPrint("Fetched Font '" + text_color(col5) + importGrid[# 7, _li] + text_color(col2) + "' from '" + text_color(col5) + importGrid[# 1, _li] + text_color(col2) + "'")
					break;
				case 8:
					fontSpriteAdd(importGrid[# 1, _li], importGrid[# 2, _li], importGrid[# 3, _li], importGrid[# 4, _li], importGrid[# 5, _li], importGrid[# 6, _li], importGrid[# 7, _li], importGrid[# 8, _li], importGrid[# 9, _li]);
					loadingPrint("Fetched Sprite Font '" + text_color(col5) + importGrid[# 9, _li] + text_color(col2) + "' from '" + text_color(col5) + importGrid[# 1, _li] + text_color(col2) + "'")
					break;
				case 9:
					fontSpriteExtAdd(importGrid[# 1, _li], importGrid[# 2, _li], importGrid[# 3, _li], importGrid[# 4, _li], importGrid[# 5, _li], importGrid[# 6, _li], importGrid[# 7, _li], importGrid[# 8, _li], importGrid[# 9, _li]);
					loadingPrint("Fetched Sprite Font '" + text_color(col5) + importGrid[# 9, _li] + text_color(col2) + "' from '" + text_color(col5) + importGrid[# 1, _li] + text_color(col2) + "'")
					break;
			}
		}
		_li++
		if _li == ds_grid_height(importGrid) {
			loadingState++;
			_li = 0;
			loadingPrint("Asset import complete")
			loadingPrint("Generating texture page") // Lags so printing it a frame before it happens
		}
		break
	case 2: /********** Finalizing import **********/
		image_stream_finish("mainTexPage")
		loadingPrint("Texture page generated")
		loadingState++
		break
	case 3: /********** Preemptively 'finding images', storing in (now unused) function spot **********/
		if importGrid[# 0, _li] != -1 && importGrid[# 0, _li] <= 4 {
			importGrid[# 0, _li] = image_group_find_image(importGrid[# 1, _li], importGrid[# 2, _li])
			loadingPrint("Allocated Image '" + text_color(col1) + importGrid[# 2, _li] + text_color(col2) + "' from '" + text_color(col1) + importGrid[# 1, _li] + text_color(col2) + "'")
		}
		/*if importGrid[# 0, _li] == 5 {
			
			loadingPrint("Allocated PCM Sound '" + text_color(col1) + importGrid[# 2, _li] + text_color(col2) + "'")
		}*/
		_li++
		if _li == ds_grid_height(importGrid) {
			loadingState++;
			_li = 0;
			loadingPrint("Finalizing...")
		}
		break
	case 4: /********** If done loading **********/
		//importAssets("mainTexPage", 1)
		live_call("initialize")
		if loadDefaultAssets {
			lua_add_code(live_state, @"
				_assets.setAssets('mainTexPage')
			")
		}
	
		// Done Loading
		loading = false
		game_set_speed(60, gamespeed_fps);
		visible = true
		with obj_GUI {visible = true}
		with obj_loading {instance_destroy()}
		// Set more variables
		startBombs = bombs
	
		// Tell the drawing system to update scaling
		drawSystemResize()
	
		// Create Instances
		if global.debug {instance_create_depth(0, 0, 0, obj_cheats)}
		instance_create_depth(playerSpawnX, playerSpawnY, PLAYER_DEPTH, player)
		break
}


