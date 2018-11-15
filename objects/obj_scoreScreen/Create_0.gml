timer = -30


if game.enemyCount > 0	{shootdown = (game.enemyKillCount / game.enemyCount) * 100}
else					{shootdown = 100}
shootdownDraw = 0

grazeMultiplier = (game.grazeCount / 10000)
grazeMultiplierDraw = 1

bonusToAdd = ((game.bonusScore * (1 + grazeMultiplier)) * (1 + (shootdown / 400))) - game.bonusScore
bonus = game.bonusScore + bonusToAdd
bonusDraw = 0

if game.scoreCalculated {
	shootdownDraw = shootdown
	grazeMultiplierDraw += grazeMultiplier
	bonusDraw = bonus
}