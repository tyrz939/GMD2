if (argument_count != 1) return lua_show_error("d3dDraw: Expected 1 arguments, got " + string(argument_count));

game.draw3d = argument0