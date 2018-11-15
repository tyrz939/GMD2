with obj_loadingOutput {
	y -= 25
}

with instance_create_depth(0, 0, LOAD_DEPTH-1, obj_loadingOutput) {
	text = argument0
}