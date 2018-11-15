with obj_boss {
	bossState = bossState_t.IDLE
	bossPhaseID++
}

with player {
	canControl = true
	extra = 0
	bomb_press = 0
	shoot_press = 0
}