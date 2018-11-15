/// @function deleteShotSetResist
/// @description Shot Deleter
/// @param {real} id
/// @param {real} Resist

if (argument_count != 2)  return lua_show_error("DeleteShotSetResist: Expected 2 arguments, got " + string(argument_count));
return deleteShotSetResist(argument[0], argument[1]);
