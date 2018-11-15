gml_pragma("forceinline")
/// @function playerShotCreate
/// @description Create player shot
/// @param {real} x
/// @param {real} y
/// @param {real} Direction
/// @param {real} Speed
/// @param {real} Object

var _inst = instance_create_depth(argument0, argument1, PLAYER_SHOT_DEPTH, argument4) 
with _inst {
	direction = argument2
	spd = argument3
}
return _inst