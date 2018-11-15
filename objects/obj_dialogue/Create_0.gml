with player {
	TweenEasyMove(x, y, game.playerGoToX, game.playerGoToY, 0, 60, EaseInOutQuad)
	canControl = false
}

timer = 0


depth = DIALOGUE_DEPTH

lock = player

col1 = c_black
col2 = c_white
font = font_terminal

skip = false

enum dGrid_t {
	INSTANCE,
	STRING,
	TYPE_STRING,
	COUNTER,
	SPEED,
	TIMER,
	LENGTH
}

dialogueGrid = ds_grid_create(dGrid_t.LENGTH, 0)

player.extra = 0
player.bomb_press = 0
player.shoot_press = 0