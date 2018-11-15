/// @function DelayLaserAdd
/// @description DelayLaserAdd
/// @param {real} DelayLaser
/// @param {real} Bullet
/// @param {real} DelayTime

if (argument_count != 3)  return lua_show_error("DelayLaserAdd: Expected 3 arguments, got " + string(argument_count));

with argument[0] {
	if object_index != obj_delayLaser {return lua_show_error("DelayLaserAdd: Not a DelayLaser: '" + string(argument[0]) + "'");}
	ds_grid_resize(grid, ds_grid_width(grid), ds_grid_height(grid) + 1)
	grid[# 0, ds_grid_height(grid)-1] = argument[1] // Bullet
	grid[# 1, ds_grid_height(grid)-1] = argument[2] // Timer
	instance_deactivate_object(argument[1])
	return true
}
return lua_show_error("DelayLaserAdd: DelayLaser doesn't exist");