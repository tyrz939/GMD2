/// @function deleteShotExists
/// @description Shot Deleter
/// @param {real} id

if (argument_count != 1)  return lua_show_error("DeleteShotExists: Expected 1 arguments, got " + string(argument_count));
return deleteShotExists(argument[0]);
