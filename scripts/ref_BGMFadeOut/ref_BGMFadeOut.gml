if (argument_count != 1)  return lua_show_error("BGMFadeOut: Expected 1 arguments, got " + string(argument_count));

with instance_create_depth(0, 0, 0, obj_fadeBGM) {
	oldVol = FMODGMS_Chan_Get_Volume(0)
	vol = oldVol
	duration = argument0
	timer = 0
}