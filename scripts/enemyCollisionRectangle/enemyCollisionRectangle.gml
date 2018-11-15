/// @function enemyCollisionRectangle
/// @description enemyCollisionRectangle
/// @param {real} x
/// @param {real} y
/// @param {real} Width
/// @param {real} Height
/// @param {real} Direction
/// @param {real} Damage
gml_pragma("forceinline")

var _xx = argument0
var _yy = argument1
var _width = argument2
var _height = argument3
var _direction = argument4
var _dmg = argument5

var inst = true
var _hit = noone

var _r, _w, _h, __angleDiff, __distance, _xc, _yc
with obj_enemy {
	if visible {
		// Rotate Rectangle
		__angleDiff = angle_difference(point_direction(_xx, _yy, x, y), _direction)
		__distance = point_distance(_xx, _yy, x, y)
		_xc = _xx + lengthdir_x(__distance, __angleDiff)
		_yc = _yy + lengthdir_y(__distance, __angleDiff)
	
		if hitCircle > 0 {
			_w = _width + hitCircle
			_h = _height + hitCircle
			if _xc > _xx - _w && _xc < _xx + _w &&
					_yc > _yy - _h && _yc < _yy + _h {
				takeDmg += _dmg
				_hit = id
			}
		}
		if hitWidth > 0 && hitHeight > 0 {
			_w = _width + hitWidth
			_h = _height + hitHeight
			if _xc > _xx - _w && _xc < _xx + _w &&
					_yc > _yy - _h && _yc < _yy + _h {
				takeDmg += _dmg
				_hit = id
			}
		}
	}
}

return _hit