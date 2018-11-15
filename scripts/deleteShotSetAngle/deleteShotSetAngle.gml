/// @function deleteShotSetAngle
/// @description Shot Deleter
/// @param {real} id
/// @param {real} Angle

for(var _i = 1; _i < ds_grid_width(game.bulletRemover); _i++) {
	if game.bulletRemover[# _i, bulletRemover_t.ID] == argument0 {
		game.bulletRemover[# _i, bulletRemover_t.ANGLE] = argument1
		return true
	}
}
print_error("DeleteShotSetAngle: Shot Deleter '" + string(argument0) + "' doesn't exist")
return false