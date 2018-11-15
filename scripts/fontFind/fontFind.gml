/// @description  fontFind
/// @function  fontFind
/// @param string:name

for(var i = 0; i < ds_grid_height(fontGrid); i++) {
	if fontGrid[# 1, i] == argument0 {
		return i
	}
}
return -1