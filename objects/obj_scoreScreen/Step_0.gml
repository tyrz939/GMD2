if !game.scoreCalculated {
	if timer == 0					{play_sfx(sfx_countScore, false)}
	if timer >= 0 && timer < 30		{bonusDraw += game.bonusScore / 30}
	if timer == 60					{play_sfx(sfx_countScore, false)}
	if timer >= 60 && timer < 90	{shootdownDraw += shootdown / 30}
	if timer == 120					{play_sfx(sfx_countScore, false)}
	if timer >= 120 && timer < 150	{grazeMultiplierDraw += grazeMultiplier / 30}
	if timer == 180					{play_sfx(sfx_countScore, false)}
	if timer >= 180 && timer < 210	{bonusDraw += bonusToAdd / 30}
	if timer == 210					{scoreAdd(bonus); game.scoreCalculated = true;}
}

if game.scoreCalculated && (input.b2 || input.b3 || input.b4) {
	instance_create_depth(0, 0, depth, obj_pauseMenu)
	instance_destroy()
}

scoreCalculated = true

timer++