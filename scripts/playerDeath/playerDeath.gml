with obj_GUI {
	showDeathEffect = true
	deathEffectX = player.x
	deathEffectY = player.y
	game.bombs = game.startBombs
}
deleteShotExpanding(player.x, player.y, 0, 600, 60, 1)

instance_create_depth(player.x, player.y, DEATH_EFFECT_DEPTH, obj_deathEffect)

if lives == 0 {
	game.gameOver = true
}