/// @function fontSpriteSplit
/// @description fontSpriteSplit
/// @param {real} file
/// @param {real} width
/// @param {real} height
/// @param {real} subImagesPerRow
/// @param {real} numberOfSubImages

var _file = argument0, _width = argument1, _height = argument2, _perRow = argument3, _amount = argument4

if file_exists(_file) {
	var _spr_t = sprite_add( _file , 0 , false , false , 0 , 0 );
} else {
	show_message("File '" + _file + "' Doesn't exist")
	return 0
}
gpu_set_blendenable(false)
var _surf_t = surface_create(sprite_get_width(_spr_t ), sprite_get_height(_spr_t ))
surface_set_target(_surf_t)
draw_sprite(_spr_t, 0, 0, 0)
surface_reset_target()
var _spr = sprite_create_from_surface(_surf_t, 0, 0, _width, _height, false, false, 0, 0)
var _w = 1
var _h = 0
var _sx, _sy
for(var _i = 1; _i < _amount; _i++) {
	if _w >= _perRow {
		_w -= _perRow
		_h++
	}
	_sx = _w * _width
	_sy = _h * _height
	sprite_add_from_surface(_spr, _surf_t, _sx, _sy, _width, _height, false, false)
	_w++
}
surface_free(_surf_t)
sprite_delete(_spr_t)
gpu_set_blendenable(true)

return _spr