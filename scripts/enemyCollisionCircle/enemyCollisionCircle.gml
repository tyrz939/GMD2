/// @function enemyCollisionCircle
/// @description enemyCollisionCircle
/// @param {real} x
/// @param {real} y
/// @param {real} Radius
/// @param {real} Damage
gml_pragma("forceinline")

var _xx = argument0
var _yy = argument1
var _radius = argument2
var _dmg = argument3

var inst = true
var _hit = noone

var _r, _w, _h
with obj_enemy {
	if visible {
		if hitCircle > 0 {
			_r = _radius + hitCircle
			if point_distance(_xx, _yy, x, y) < _r {
				takeDmg += _dmg
				_hit = id
			}
		}
		if hitWidth > 0 && hitHeight > 0 {
			_w = _radius + hitWidth
			_h = _radius + hitHeight
			if x > _xx - _w && x < _xx + _w &&
					y > _yy - _h && y < _yy + _h {
				takeDmg += _dmg
				_hit = id
			}
		}
	}
}

return _hit