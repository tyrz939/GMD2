with player {
	if !hit && !inBomb && flashTimer == 0 && canControl {
		hit = true
		part_particles_create_colour(global.partSys, x, y, global.partPlayerDie, playerDeathColor, 1);
		play_sfx_buffer(game.sfxPlayerDeath, false)
	}
}