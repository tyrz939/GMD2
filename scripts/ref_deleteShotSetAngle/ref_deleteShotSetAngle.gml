/// @function deleteShotSetAngle
/// @description Shot Deleter
/// @param {real} id
/// @param {real} Angle

if (argument_count != 2)  return lua_show_error("DeleteShotSetAngle: Expected 2 arguments, got " + string(argument_count));
return deleteShotSetAngle(argument[0], argument[1]);
