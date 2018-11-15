/// @function d3d_addFloor
/// @description d3d_addFloor
/// @param Start
/// @param End
/// @param Color
/// @param Background

if (argument_count != 4) return lua_show_error("d3dSetFog: Expected 4 arguments, got " + string(argument_count));

game.fogStart =	argument[0]
game.fogEnd =	argument[1]
game.fogColor =	argument[2]
game.backColor = argument[3]