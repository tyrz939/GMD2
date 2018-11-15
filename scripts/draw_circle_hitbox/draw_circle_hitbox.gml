/// @description  draw_circle_hitbox
/// @function  draw_circle_hitbox
/// @param  x
/// @param  y
/// @param  radius
/// @param  color

var _xx = argument0
var _yy = argument1
var _radius = argument2
var _col = argument3
var _alpha = 0.5

var _count = 16

draw_primitive_begin(pr_trianglestrip);
var _dir
for( var _i = 0; _i <= _count; _i++ ) {
	_dir = (360/_count) * _i
	draw_vertex_color( _xx + lengthdir_x(_radius, _dir), _yy + lengthdir_y(_radius, _dir), _col, _alpha );
	draw_vertex_color( _xx, _yy, _col, _alpha );
}

draw_primitive_end();