var pgc = floor(game.grazeCount)
game.grazeCount += argument0

if floor(game.grazeCount) != pgc {
	play_sfx_buffer(game.sfxGraze, false)
//	scoreAdd(5)
}