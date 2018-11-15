/// @function BossSetBackSprite
/// @description BossSetBackSprite
/// @param boss
/// @param sprite
/// @param minScale
/// @param maxScale
/// @param scaleSpeed
/// @param rotationSpeed
/// @param alpha

if (argument_count != 7)  return lua_show_error("BossSetBackSprite: Expected 7 arguments, got " + string(argument_count));


with argument[0] {
	if argument[0].object_index == obj_boss {
		backSprite = argument[1]
		backSpriteMinScale = argument[2]
		backSpriteMaxScale = argument[3]
		backSpriteScaleSpeed = argument[4]
		backSpriteRotationSpeed = argument[5]
		backSpriteAlpha = argument[6]
		backSpriteScaleDir = 0
		backSpriteRotationDir = 0
		if !instance_exists(obj_bossBackSprite) {instance_create_depth(0, 0, 0, obj_bossBackSprite)}
		return true
	} else {
		return lua_show_error("BossSetBackSprite: Instance isn't a boss");
	}
}
return lua_show_error("BossSetBackSprite: Instance doesn't exist");