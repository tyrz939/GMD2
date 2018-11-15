/// @function enemyPlayerCollisionCircle
/// @description enemyPlayerCollisionCircle
/// @param {real} Instance
/// @param {real} Radius

if instance_exists(argument0) {
	if object_get_parent(argument0.object_index) == obj_enemy {
		with argument0 {
			pHitCircle = argument1
			return true
		}
	} else {
		print_error("enemyPlayerCollisionCircle: Instance isn't an Enemy")
		return false
	}
} else {
	print_error("enemyPlayerCollisionCircle: Enemy doesn't exists")
	return false
}