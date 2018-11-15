/// @function BossCreate
/// @description BossCreate
/// @param x
/// @param y
/// @param sprite

if (argument_count != 3)  return lua_show_error("BossCreate: Expected 3 arguments, got " + string(argument_count));

var inst = instance_create_depth(argument[0], argument[1], ENEMY_DEPTH+1, obj_boss)
inst.sprite = argument[2]
return inst