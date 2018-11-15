/// @function BossSetTrail
/// @description BossSetTrail
/// @param boss
/// @param Trails on/off
/// @param amount
/// @param scale
/// @param color
/// @param alpha

if (argument_count != 6)  return lua_show_error("BossSetTrail: Expected 6 arguments, got " + string(argument_count));

with argument[0] {
	if argument[0].object_index == obj_boss {
		trails = argument[1]
		trailsCount = argument[2]
		trailsScale = argument[3]
		trailsCol = argument[4]
		trailsAlpha = argument[5]
		
		trailsArray = 0
		for(var _i = trailsCount-1; _i >= 0; _i--) {
			trailsArray[_i, 2] = 0
			trailsArray[_i, 1] = 0
			trailsArray[_i, 0] = 0
		}
		
		return true
	} else {
		return lua_show_error("BossSetTrail: Instance isn't a boss");
	}
}
return lua_show_error("BossSetTrail: Instance doesn't exist");