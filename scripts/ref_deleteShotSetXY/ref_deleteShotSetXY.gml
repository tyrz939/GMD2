/// @function deleteShotSetXY
/// @description Shot Deleter
/// @param {real} id
/// @param {real} x
/// @param {real} y

if (argument_count != 3)  return lua_show_error("DeleteShotSetXY: Expected 3 arguments, got " + string(argument_count));
return deleteShotSetXY(argument[0], argument[1], argument[2]);
