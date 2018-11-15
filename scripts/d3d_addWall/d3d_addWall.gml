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

var _i = ds_grid_width(scene3d)
ds_grid_resize(scene3d, _i+1, 10)

scene3d[# _i, 0] = d3dTypes.Wall
scene3d[# _i, 1] = argument0
scene3d[# _i, 2] = argument1
scene3d[# _i, 3] = argument2
scene3d[# _i, 4] = argument3
scene3d[# _i, 5] = argument4
scene3d[# _i, 6] = argument5
scene3d[# _i, 7] = argument6
scene3d[# _i, 8] = argument7
scene3d[# _i, 9] = argument8