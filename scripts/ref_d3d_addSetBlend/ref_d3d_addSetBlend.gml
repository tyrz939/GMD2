/// @function d3d_addSetBlend
/// @description d3d_addSetBlend
/// @param Blend


if (argument_count != 1) return lua_show_error("d3d_AddSetBlend: Expected 1 arguments, got " + string(argument_count));

d3d_addSetBlend(argument0);