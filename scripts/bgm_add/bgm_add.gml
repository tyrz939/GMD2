/// @function bgm_add
/// @description bgm_add
/// @param {real} file
/// @param {string} vol
/// @param {string} tag
/// @param {string} dls [opt]

var wavBuffer
if file_exists_ns(argument0) {
	// Saving the buffer to the sound ds_grid
	var _i = ds_grid_height(bgmGrid)
	ds_grid_resize(bgmGrid, ds_grid_width(bgmGrid), _i+1)
	if argument3 != 0 {FMODGMS_Snd_Set_DLS(argument3)}
	bgmGrid[# 0, _i] = FMODGMS_Snd_LoadSound(argument0)
	bgmGrid[# 1, _i] = argument1 // Vol
	bgmGrid[# 2, _i] = argument2 // Tag
	if argument3 != 0 {FMODGMS_Snd_Remove_DLS()}

	return true
} else {
	println("Sound Doesn't Exists: " + string(argument0))
	return -1
}