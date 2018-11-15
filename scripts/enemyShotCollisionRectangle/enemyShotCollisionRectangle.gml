/// @function enemyShotCollisionRectangle
/// @description enemyShotCollisionRectangle
/// @param {real} Instance
/// @param {real} Width
/// @param {real} Height

if instance_exists(argument0) {
	if object_get_parent(argument0.object_index) == obj_enemy {
		with argument0 {
			hitWidth = argument1
			hitHeight = argument2
			return true
		}
	} else {
		print_error("enemyShotCollisionRectangle: Instance isn't an Enemy")
		return false
	}
} else {
	print_error("enemyShotCollisionRectangle: Enemy doesn't exists")
	return false
}