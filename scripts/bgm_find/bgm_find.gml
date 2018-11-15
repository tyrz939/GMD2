/// @description  bgm_find
/// @function  bgm_find
/// @param string:name

for(var i = 0; i < ds_grid_height(bgmGrid); i++) {
	if bgmGrid[# 2, i] == argument0 {
		return i
	}
}
return -1