/// @function deleteShotSetRadius
/// @description Shot Deleter
/// @param {real} id
/// @param {real} Radius

for(var _i = 1; _i < ds_grid_width(game.bulletRemover); _i++) {
	if game.bulletRemover[# _i, bulletRemover_t.ID] == argument0 {
		game.bulletRemover[# _i, bulletRemover_t.RADIUS] = argument1
		return true
	}
}
print_error("DeleteShotSetRadius: Shot Deleter '" + string(argument0) + "' doesn't exist")
return false