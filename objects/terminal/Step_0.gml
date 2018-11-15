if keyboard_check_pressed(192) {
    global.term = !global.term;
    keyboard_string = "";
}

if global.term {
	if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V"))) || mouse_check_button_pressed(mb_right) {
		if clipboard_has_text() {
			keyboard_string += clipboard_get_text()
		}
	}
	var startOfLine = ""
    if keyboard_check_pressed(vk_enter) {
        println(line[0]);
		
		/*---- Lua Terminal ----*/
		if state == 0 {
			if keyboard_string == "exit" {
				state = 1;
				println("---- " + text_color(_amber) +"GMD2 " + text_color(_purple) + "Console" + text_color(_white) + " ----")
			}
			else if instance_exists(game) {
				with game {
					execute_lua(keyboard_string)
				}
			} else {
				println("Not currently LUAing")
			}
			keyboard_string = "";
			
		/*---- GMD2 Terminal ----*/
		}
		
		if state == 1 {
			var exec = scr_string_remove_space( keyboard_string + "", 0 )
		
	        // Run Commands
	        var run = exec[0];
	        if run != ""{
	            if run == "exit" {
					game_end();
				}
	            else if run == "lua" {
					state = 0;
					println("---- " + text_color(_amber) +"GMD2 " + text_color(_purple) + "Lua" + text_color(_white) + " ----")
				}
	            else if run == "ls" {
					if exec[2] == "-d" {
						var _a = list_files_type(current_dir + exec[1], fa_directory)
					} else {
						var _a = list_files(current_dir + exec[1])
					}
					if is_array(_a) {
						for(var _i = 0; _i < array_length_1d(_a); _i++) {
							println(_a[_i])
						}
					}
				}
	            else if run == "cd" {
					if exec[1] == ".." {
						var _s, _l
						//_l = string_length(current_dir)
						//_s = string_delete(current_dir, _l, 1)
						//current_dir = _s
						while string_length(current_dir) > 0 {
							_l = string_length(current_dir)
							_s = string_delete(current_dir, _l, 1)
							current_dir = _s
							if string_char_at(current_dir, string_length(current_dir)) == "\\" {break}
						}
					}
					else if directory_exists_ns(current_dir + exec[1]) {current_dir += exec[1] + "\\"}
					else {println("No directory '" + text_color(_purple) + exec[1] + text_color(_white) + "'")}
				}
	            else if run == "pwd" {
					println(working_directory + current_dir)
				}
	            else if run == "inst" {
					if exec[1] == "count" {
					    println("current instance count = " + string(instance_count));
					}

					else if exec[1] == "" {
					    println("inst: missing operand");
					}

					else{
					    println("inst: '" + exec[1] + "' invalid operand");
					}
				}
	            else if run == "debug" {
					if exec[1] == "on" {
					    show_debug_overlay(true);
					    global.debug = true;
					    println("debug mode ON");
					}
					else if exec[1] == "off" {
					    show_debug_overlay(false);
					    global.debug = false;
					    println("debug mode OFF");
					}

					else if exec[1] == "" {
					    println("debug: missing operand");
					}

					else{
					    println("debug: '" + exec[1] + "' invalid operand");
					}
				}
	            else if run == "clear" {
					t_clear()
					var rtn = "";
				}
	            else if run == "restart" {
					game_restart();
				}
	            else if run == "clear_config" {
					if file_exists_ns("save.conf") {
					    file_delete_ns("save.conf");
					}
					game_restart();
				}
	            else if run == "ver" {
					println(game_version);
					println(game_compileDate);
				} else {
					println("'" + text_color(_purple) + run + text_color(_white) + "' command not found");
				}
	        }
	        keyboard_string = "";
	    }
	}
	
	switch state {
		case 0: startOfLine = text_color(_orange) + "Lua: " + text_color(_white);					break;
		case 1: startOfLine = text_color(_orange) + "\\" + current_dir + " " + text_color(_white);	break;
	}
    
    line[0] =  startOfLine + keyboard_string;
    
    // Flash Curser
    if flash_curser < flash * 2 {
        flash_curser++;
    } else {
        flash_curser = 0;
        curser = " ";
    }
    if flash_curser == flash {
        curser =  text_color(_orange) + "_";
    }
} else {
    flash_curser = 0;
}