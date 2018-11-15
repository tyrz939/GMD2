var s = argument0;
var q = argument1; // state
print_error(s);
if s != global.__prevLuaError {
	show_message(s)
}
global.__prevLuaError = s