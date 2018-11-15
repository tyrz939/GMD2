/// @function deleteShotDelete
/// @description Shot Deleter
/// @param {real} id

if (argument_count != 1)  return lua_show_error("DeleteShotDelete: Expected 1 arguments, got " + string(argument_count));
return deleteShotDelete(argument[0]);
