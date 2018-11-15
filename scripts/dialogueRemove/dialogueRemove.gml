/// @function dialogueRemove
/// @description dialogueRemove
/// @param {real} num

with obj_dialogue {
	if ds_grid_height(dialogueGrid) > argument0 {
		dialogueGrid[# dGrid_t.INSTANCE, argument0] = noone
	} else {
		show_message("Dialogue doesn't exist '" + string(argument0) + "'")
	}
	return true
}

show_message("Dialogue system not running")