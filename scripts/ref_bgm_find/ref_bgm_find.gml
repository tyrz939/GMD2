/// @description  bgm_find
/// @function  bgm_find
/// @param string:name

if (argument_count != 1) return lua_show_error("FindBGM: Expected 1 arguments, got " + string(argument_count));

return bgm_find(argument0)