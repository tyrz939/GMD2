/// @function bgm_add
/// @description bgm_add
/// @param {real} file
/// @param {real} vol
/// @param {real} tag
/// @param {real} dls [opt]
if !in_range(argument_count, 3, 4) return lua_show_error("LoadQueueAddBGM: Expected 3-4 arguments, got " + string(argument_count));
global.__importScript = 6
if argument_count == 3 {
	importAddQueue(argument[0], argument[1], argument[2], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
} else {
	importAddQueue(argument[0], argument[1], argument[2], argument[3], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}