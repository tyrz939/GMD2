if (argument_count != 2)  return lua_show_error("BossVisible: Expected 2 arguments, got " + string(argument_count));

with argument0 {
	visible = argument1
	return true
}
return print_error("BossVisible: Boss doesn't exist: " + string(argument1))