/// @description  deleteShotAll
/// @function  deleteShotAll
/// @param  DeleteType:number

if (argument_count != 1)  return lua_show_error("DeleteShotAll: Expected 1 arguments, got " + string(argument_count));
return deleteShotAll(argument[0]);
