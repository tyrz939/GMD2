/// @function d3d_addSetAlpha
/// @description d3d_addSetAlpha
/// @param Alpha

var _i = ds_grid_width(scene3d)
ds_grid_resize(scene3d, _i+1, 10)

scene3d[# _i, 0] = d3dTypes.alpha
scene3d[# _i, 1] = argument0