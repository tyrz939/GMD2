/// @function d3d_addWall
/// @description d3d_addWall
/// @param x1 The initial x coordinate of the wall.
/// @param y1 The initial y coordinate of the wall.
/// @param z1 The initial z coordinate of the wall.
/// @param x2 The opposite x coordinate of the wall.
/// @param y2 The opposite y coordinate of the wall. 
/// @param z2 The opposite z coordinate of the wall.
/// @param tex The id of the texture to use (-1 for no texture)
/// @param hrepeat Amount of horizontal repetitions for the texture.
/// @param vrepeat Amount of vertical repetitions for the texture.


if (argument_count != 9) return lua_show_error("d3d_addWall: Expected 9 arguments, got " + string(argument_count));

d3d_addWall(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);