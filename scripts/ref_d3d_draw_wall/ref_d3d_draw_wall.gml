/// @description  d3d_draw_wall(x1:number, y1:number, z1:number, x2:number y2:number, z2:number, texture:pointer, hrepeat:number, vrepeat:number)
/// @function  d3d_draw_wall
/// @param  x1:number
/// @param  y1:number
/// @param  z1:number
/// @param  x2:number
/// @param  y2:number
/// @param  z2:number
/// @param  texture:pointer
/// @param  hrepeat:number
/// @param  vrepeat:number
if (argument_count != 9) return lua_show_error("d3d_draw_wall: Expected 9 arguments, got " + string(argument_count));
d3d_draw_wall(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);

