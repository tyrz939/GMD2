// Replay Variables

if global.replay {
	replayLoad(global.replayToLoad, 0)
} else {
	__replay = ds_grid_create(1, 2)
}
	__FRAME = 0
    __INPUT = 1
	__POS = 0
	replayArrayAdd = false
	
// Set Charactor Specific Variables
	playerInitScript = playerSelect(global.playerNumber)
	if !playerInitScript {
		show_message("No player found: " + string(global.playerNumber))
		show_error("No player found", true)
	}
	script_execute(playerInitScript)
	game.bulletRemover[# 0, bulletRemover_t.RADIUS] = game.hitboxRadius

// Variable initial values

	deathBombDelay = 10
	deathTimer = 0
	inBomb = false
	flashTimer = 0
	orbCount = 0
	hit = false
	canControl = false
	riseTime = 60
	prevLives = floor(lives + 0.001)
	riseCounter = riseTime
	riseDist = point_distance(game.playerSpawnX, game.playerSpawnY, game.playerGoToX, game.playerGoToY)
	riseDir = point_direction(game.playerSpawnX, game.playerSpawnY, game.playerGoToX, game.playerGoToY)
	
// Player Sprite

	aniSubimage = 0
	aniSpeedIdle = 0.2
	aniSpeedTurning = 1
	aniStateChange = true
	aniTurning = 0
	
	aniState = 0
	
	enum playerAniState {
		idle,
		turnLeft,
		turnRight,
		backLeft,
		backRight,
		left,
		right
	}
	
	aniLeft = false
	aniRight = false
	
	spriteHitboxSize = 0.5
	spriteHitboxDir = 0
	
	// Color Overlay
	scr_shader_overlay_init()
	overlayDraw = false
	overlayColor = c_blue
	overlayAlpha = 0

// Movement & Input Variables

    up = false
    down = false
    left = false
    right = false
    focus = false
    shoot_press = false
    bomb_press = false
	extra = false
	
// Create Hitbox
	instance_create_depth(x, y, HITBOX_DEPTH, obj_hitbox)