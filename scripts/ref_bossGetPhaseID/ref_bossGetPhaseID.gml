with argument0 {
	if argument0.object_index == obj_boss {
		return bossPhaseID
	} else {
		return lua_show_error("BossGetPhaseID: Instance isn't a boss");
	}
}
return lua_show_error("BossGetPhaseID: Instance doesn't exist");