/// @function deleteShotSetResist
/// @description Shot Deleter
/// @param {real} id
/// @param {real} Resist

for(var _i = 1; _i < ds_grid_width(game.bulletRemover); _i++) {
	if game.bulletRemover[# _i, bulletRemover_t.ID] == argument0 {
		game.bulletRemover[# _i, bulletRemover_t.RESIST] = argument1
		return true
	}
}
print_error("DeleteShotSetResist: Shot Deleter '" + string(argument0) + "' doesn't exist")
return false