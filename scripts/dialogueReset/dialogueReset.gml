/// @function dialogueReset
/// @description dialogueReset

with obj_dialogue {
	ds_grid_destroy(dialogueGrid)
	dialogueGrid = ds_grid_create(dGrid_t.LENGTH, 0)
}