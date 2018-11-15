/// @function BossSetDistortion
/// @description BossSetDistortion
/// @param boss
/// @param Distortion on/off
/// @param Scale
/// @param Color
/// @param Alpha

if (argument_count != 5)  return lua_show_error("BossSetDistortion: Expected 5 arguments, got " + string(argument_count));

with argument[0] {
	if argument[0].object_index == obj_boss {
		distortion = argument[1]
		distortionScale = argument[2]
		distortionBGColor = argument[3]
		distortionBGAlpha = argument[4]
		return true
	} else {
		return lua_show_error("BossSetDistortion: Instance isn't a boss");
	}
}
return lua_show_error("BossSetDistortion: Instance doesn't exist");