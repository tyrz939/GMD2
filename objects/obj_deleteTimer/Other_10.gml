if timer == duration {instance_destroy(); exit;}

timer++

if deleteShotExists(deleter) {
	var radius = startRadius + (endRadius - startRadius) / (duration / timer)
	deleteShotSetRadius(deleter, radius)
}

if damageEnemy {
	enemyCollisionCircle(x, y, radius, damage)
}