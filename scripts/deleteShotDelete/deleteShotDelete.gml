/// @function deleteShotDelete
/// @description Shot Deleter
/// @param {real} id

for(var _i = 1; _i < ds_grid_width(game.bulletRemover); _i++) {
	if game.bulletRemover[# _i, bulletRemover_t.ID] == argument0 {
		game.bulletRemover[# _i, bulletRemover_t.ALIVE] = 0
		return true
	}
}
print_error("DeleteShotDelete: Shot Deleter '" + string(argument0) + "' doesn't exist")
return false