/// @function BGMSetLoop
/// @description BGMSetLoop
/// @param {real} BGM
/// @param {real} Start
/// @param {real} End

if (argument_count != 3)  return lua_show_error("BGMSetLoop: Expected 3 arguments, got " + string(argument_count));

if argument0 < ds_grid_height(game.bgmGrid) && argument0 >= 0 {
	FMODGMS_Snd_Set_LoopPoints(game.bgmGrid[# 0, argument0], argument1, argument2);
	FMODGMS_Snd_Set_LoopMode(game.bgmGrid[# 0, argument0], 1, -1);
	return true
} else {
	return lua_show_error("BGMSetLoop: No BGM File '" + string(argument0) + "'")
}