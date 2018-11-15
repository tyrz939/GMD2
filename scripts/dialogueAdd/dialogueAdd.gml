/// @function dialogueAdd
/// @description dialogueAdd
/// @param {real} instance
/// @param {real} string
/// @param {real} speed

if !instance_exists(obj_dialogue) {
	instance_create_depth(0, 0, DIALOGUE_DEPTH, obj_dialogue)
}

with obj_dialogue {
	var s = ds_grid_height(dialogueGrid)
	ds_grid_resize(dialogueGrid, dGrid_t.LENGTH, s+1)
	
	dialogueGrid[# dGrid_t.INSTANCE, s] = argument0
	dialogueGrid[# dGrid_t.STRING, s] = argument1
	dialogueGrid[# dGrid_t.TYPE_STRING, s] = ""
	dialogueGrid[# dGrid_t.SPEED, s] = clamp(argument2, 1, 100)
	if argument2 <= 0 {
		dialogueGrid[# dGrid_t.COUNTER, s] = string_length(argument1)
	} else {
		dialogueGrid[# dGrid_t.COUNTER, s] = 0
	}
	dialogueGrid[# dGrid_t.TIMER, s] = 0
	return s
}