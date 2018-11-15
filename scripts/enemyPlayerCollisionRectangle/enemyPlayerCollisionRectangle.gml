/// @function enemyPlayerCollisionRectangle
/// @description enemyPlayerCollisionRectangle
/// @param {real} Instance
/// @param {real} Width
/// @param {real} Height

if instance_exists(argument0) {
	if object_get_parent(argument0.object_index) == obj_enemy {
		with argument0 {
			pHitWidth = argument1
			pHitHeight = argument2
			return true
		}
	} else {
		print_error("enemyPlayerCollisionRectangle: Instance isn't an Enemy")
		return false
	}
} else {
	print_error("enemyPlayerCollisionRectangle: Enemy doesn't exists")
	return false
}