/// @function FontAdd
/// @description FontAdd
/// @param {real} file
/// @param {real} size
/// @param {real} bold
/// @param {real} italic
/// @param {real} first
/// @param {real} last
/// @param {real} tag

var _i = ds_grid_height(fontGrid)
ds_grid_resize(fontGrid, ds_grid_width(fontGrid), _i+1)
fontGrid[# 0, _i] = font_add(argument0, argument1, argument2, argument3, argument4, argument5)
fontGrid[# 1, _i] = argument6
fontGrid[# 2, _i] = -1