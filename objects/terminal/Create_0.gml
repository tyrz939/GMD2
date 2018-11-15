line_count = 30;
curser = "";
flash = 30;
flash_curser = 0;

line = array_create(line_count, "");

state = 1
current_dir = ""

if keyboard_check_pressed(vk_enter) {
    keyboard_string = "";
}

// Colors
_green = make_color_rgb(51, 255, 51)
_orange = make_color_rgb(255, 95, 63)
_amber = make_color_rgb(255,176,0)
_purple = make_color_rgb(255, 0, 127)
_ltblue = make_color_rgb(0,176,255)
_white = c_ltgray

game_version = text_color(_amber) + global.name + text_color(_green) + " v" + GM_version + text_color(_white)
//game_compileDate = "Compiled on: " + date_date_string(GM_build_date) + " at " + date_time_string(GM_build_date)
game_compileDate = "Compiled on: " + text_color(_green) + date_date_string(GM_build_date) + text_color(_white) + " at " + text_color(_green) + date_time_string(GM_build_date) + text_color(_white)
+ " By Runtime Version: " + text_color(_green) + string(GM_runtime_version) + text_color(_white)

println(game_version)
println(game_compileDate)
println("-------------------------------------")

depth = -15901