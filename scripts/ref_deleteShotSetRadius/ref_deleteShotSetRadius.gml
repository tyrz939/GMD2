/// @function deleteShotSetRadius
/// @description Shot Deleter
/// @param {real} id
/// @param {real} Radius

if (argument_count != 2)  return lua_show_error("DeleteShotSetRadius: Expected 2 arguments, got " + string(argument_count));
return deleteShotSetRadius(argument[0], argument[1]);
