/// @function nonspellSetup
/// @description nonspellSetup
/// @param boss
/// @param timer
/// @param HP
/// @param breakHP

var _boss = argument[0], _timer = argument[1], _hp = argument[2], _breakHP = argument[3]
with obj_bulletParent {instance_destroy()}
with _boss {
	bossState = bossState_t.NONSPELL
	healthBarShow = true
	
	// Timer
	bossPhaseTimer = _timer * 60
	bossPhaseTimerStart = _timer * 60
	
	// Set HP
	hp = _hp / (1 - _breakHP)
	maxhp = _hp / (1 - _breakHP)
	
	// Break HP
	bossSpellBreakHP = _breakHP * _hp
	
	return bossPhaseID
}

return -1