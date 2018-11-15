/// @description  draw_oval_hitbox
/// @function  draw_oval_hitbox
/// @param  x
/// @param  y
/// @param  width
/// @param  height
/// @param  direction
/// @param  color

var _xx = argument0
var _yy = argument1
var _width = argument2
var _height = argument3
var _dir = argument4
var _col = argument5
var _alpha = 0.5

_xx += lengthdir_x(_width, _dir)
_yy += lengthdir_y(_width, _dir)

var _x1 = _xx
var _y1 = _yy

var _x2 = _x1 + lengthdir_x(_width, _dir+180) + lengthdir_x(_height, _dir+270)
var _y2 = _y1 + lengthdir_y(_width, _dir+180) + lengthdir_y(_height, _dir+270)

var _x3 = _x2 + lengthdir_x(_height*2, _dir+90)
var _y3 = _y2 + lengthdir_y(_height*2, _dir+90)

var _x4 = _x3 + lengthdir_x(_width, _dir+180) + lengthdir_x(_height, _dir+270)
var _y4 = _y3 + lengthdir_y(_width, _dir+180) + lengthdir_y(_height, _dir+270)

draw_primitive_begin(pr_trianglestrip);

draw_vertex_color( _x1,	_y1, _col, _alpha );
draw_vertex_color( _x2,	_y2, _col, _alpha );
draw_vertex_color( _x3,	_y3, _col, _alpha );
draw_vertex_color( _x4,	_y4, _col, _alpha );

draw_primitive_end();