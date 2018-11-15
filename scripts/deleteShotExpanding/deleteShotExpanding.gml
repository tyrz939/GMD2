/// @function playerShotCreate
/// @description Create player shot
/// @param {real} x
/// @param {real} y
/// @param {real} StartRadius
/// @param {real} EndRadius
/// @param {real} Duration
/// @param {real} DamageToEnemies

with instance_create_depth(argument0, argument1, 0, obj_deleteTimer) {
	startRadius = argument2
	endRadius = argument3
	duration = argument4
	if argument5 > 0 {
		damage = argument5
		damageEnemy = true
	}
	deleter = deleteShotCircle(x, y, startRadius, duration)
}