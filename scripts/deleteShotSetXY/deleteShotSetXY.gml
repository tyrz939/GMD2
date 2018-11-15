/// @function deleteShotSetXY
/// @description Shot Deleter
/// @param {real} id
/// @param {real} x
/// @param {real} y

for(var _i = 1; _i < ds_grid_width(game.bulletRemover); _i++) {
	if game.bulletRemover[# _i, bulletRemover_t.ID] == argument0 {
		game.bulletRemover[# _i, bulletRemover_t.X] = argument1
		game.bulletRemover[# _i, bulletRemover_t.Y] = argument2
		return true
	}
}
print_error("DeleteShotSetXY: Shot Deleter '" + string(argument0) + "' doesn't exist")
return false