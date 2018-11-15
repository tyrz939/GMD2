/*************
Replay System
*************/
if global.replay {
    // Replay Input Playback
    while __replay[# __POS,__FRAME] < game.frame && __POS < __replayWidth-1 {__POS++}
    if game.frame == __replay[# __POS,__FRAME] {
		if __replay[# __POS,__INPUT] >= 128 {up = true;			__replay[# __POS,__INPUT] -= 128}	else {up = false}
		if __replay[# __POS,__INPUT] >= 64	{down = true;		__replay[# __POS,__INPUT] -= 64}	else {down = false}
		if __replay[# __POS,__INPUT] >= 32	{left = true;		__replay[# __POS,__INPUT] -= 32}	else {left = false}
		if __replay[# __POS,__INPUT] >= 16	{right = true;		__replay[# __POS,__INPUT] -= 16}	else {right = false}
		if __replay[# __POS,__INPUT] >= 8	{focus = true;		__replay[# __POS,__INPUT] -= 8}		else {focus = false}
		if __replay[# __POS,__INPUT] >= 4	{shoot_press = true;__replay[# __POS,__INPUT] -= 4}		else {shoot_press = false}
		if __replay[# __POS,__INPUT] >= 2	{bomb_press = true;	__replay[# __POS,__INPUT] -= 2}		else {bomb_press = false}
		if __replay[# __POS,__INPUT] >= 1	{extra = true;		__replay[# __POS,__INPUT] -= 1}		else {extra = false}
    }
} else {
	// Replay Input Recording
	if replayArrayAdd {
		ds_grid_resize(__replay, __POS+1, 2)
		__replay[# __POS,__FRAME] =		game.frame
		__replay[# __POS,__INPUT] =		0
		__replay[# __POS,__INPUT] +=	up			<<7
	    __replay[# __POS,__INPUT] +=	down		<<6
	    __replay[# __POS,__INPUT] +=	left		<<5
	    __replay[# __POS,__INPUT] +=	right		<<4
	    __replay[# __POS,__INPUT] +=	focus		<<3
	    __replay[# __POS,__INPUT] +=	shoot_press	<<2
	    __replay[# __POS,__INPUT] +=	bomb_press	<<1
		__replay[# __POS,__INPUT] +=	extra		<<0
		
		replayArrayAdd = false
		__POS++
	}
}
/*********************
If Player can control
*********************/
if canControl {
/********
Movement
********/
	var move
	// Focus slow down
	if focus {move = focusSpeed} else {move = moveSpeed}
	
	// Diag speed
	if (up xor down) && (left xor right) {move *= sqrt(0.5)}
        
	// Bomb Slow
	if player.inBomb == true {move *= bombSpeedPenalty}
			
	// Set x,y
	if left		{x -= move * game.gamespeed}
	if right	{x += move * game.gamespeed}
	if up		{y -= move * game.gamespeed}
	if down		{y += move * game.gamespeed}
	
	// Boundaries
	if y < game.boundaryTop								{y = game.boundaryTop}
	if y > global.playAreaHeight - game.boundaryBottom	{y = global.playAreaHeight - game.boundaryBottom}
	if x < game.boundaryLeft							{x = game.boundaryLeft}
	if x > global.playAreaWidth - game.boundaryRight	{x = global.playAreaWidth - game.boundaryRight}

	/******************
	Player Step Script
	******************/
	script_execute(stepScript)
} else {
	with obj_playerOrb {instance_destroy()}
}
/*************
Player Hitbox
*************/
game.bulletRemover[# 0, bulletRemover_t.X] = x
game.bulletRemover[# 0, bulletRemover_t.Y] = y
game.bulletRemover[# 0, bulletRemover_t.RADIUS] = game.hitboxRadius
/******************
Player Step Script
******************/
if riseCounter >= 0 {
	if riseCounter == 0 && !instance_exists(obj_dialogue) {
		canControl = true
	} else {
		riseCounter--
		x += lengthdir_x(riseDist / riseTime, riseDir)
		y += lengthdir_y(riseDist / riseTime, riseDir)
	}
}

/*****
Death
*****/
if hit && flashTimer == 0 {
	deathTimer++
	if inBomb {
		deathTimer = 0
		hit = false
	}
	if deathTimer == deathBombDelay {
		playerDeath()
		lives = clamp(lives-1, 0, 8)
		hit = false
		deathTimer = 0
		x = xstart
		y = ystart
		flashTimer = 180
		image_alpha = 1
		canControl = false
		riseCounter = riseTime
		y = game.playerSpawnY
		x = game.playerSpawnX
	}
}
if flashTimer > 0 {
	flashTimer--
	if flashTimer % 2 == 0 {
		overlayColor = c_navy
		overlayAlpha = 0.5
		overlayDraw = !overlayDraw
	}
	hit = false
}
/*********
SFX Lives get
*********/
if floor(lives + 0.001) > prevLives {play_sfx_buffer(game.sfxExtend, false)}
prevLives = floor(lives + 0.001)

/*********
Animation
*********/
// Focus Animation
if focus	{spriteHitboxSize += 0.1}
else		{spriteHitboxSize -= 0.1}
spriteHitboxSize = clamp(spriteHitboxSize, 0.5, 1)
spriteHitboxDir += 3

// Sprite Animation Handler
if spriteAnimationType == 0 {
	
	if aniLeft != left || aniRight != right {
		aniStateChange = true
	}
	
	aniLeft = false
	aniRight = false
	if (left xor right) && canControl {aniLeft = left; aniRight = right;}
	
	if aniStateChange {
		switch aniState {
			case playerAniState.idle:
				if aniLeft {aniState = playerAniState.turnLeft; aniSubimage = 7}
				if aniRight {aniState = playerAniState.turnRight; aniSubimage = 15}
				break
			case playerAniState.turnLeft:
				if !aniLeft {aniState = playerAniState.backLeft}
				if aniRight {aniState = playerAniState.turnRight}
				break
			case playerAniState.turnRight:
				if aniLeft {aniState = playerAniState.turnLeft}
				if !aniRight {aniState = playerAniState.backRight}
				break
			case playerAniState.backLeft:
				if aniLeft {aniState = playerAniState.turnLeft; aniSubimage = 7}
				if aniRight {aniState = playerAniState.turnRight; aniSubimage = 15}
				break
			case playerAniState.backRight:
				if aniLeft {aniState = playerAniState.turnLeft; aniSubimage = 7}
				if aniRight {aniState = playerAniState.turnRight; aniSubimage = 15}
				break
			case playerAniState.left:
				if !aniLeft {aniState = playerAniState.backLeft; aniSubimage = 11}
				if aniRight {aniState = playerAniState.turnRight; aniSubimage = 15}
				break
			case playerAniState.right:
				if aniLeft {aniState = playerAniState.turnLeft; aniSubimage = 7}
				if !aniRight {aniState = playerAniState.backRight; aniSubimage = 19}
				break
		}
		aniStateChange = false
	}
	
	switch aniState {
		case playerAniState.idle:
			aniSubimage += aniSpeedIdle
			if aniSubimage >= 8 {aniSubimage = 0}
			break
		case playerAniState.turnLeft:
			aniSubimage += aniSpeedTurning
			if aniSubimage >= 11 {aniState = playerAniState.left}
			break
		case playerAniState.turnRight:
			aniSubimage += aniSpeedTurning
			if aniSubimage >= 19 {aniState = playerAniState.right}
			break
		case playerAniState.backLeft:
			aniSubimage -= aniSpeedTurning
			if aniSubimage <= 8 {aniState = playerAniState.idle}
			break
		case playerAniState.backRight:
			aniSubimage -= aniSpeedTurning
			if aniSubimage <= 16 {aniState = playerAniState.idle}
			break
		case playerAniState.left:
			aniSubimage += aniSpeedIdle
			if aniSubimage >= 16 {aniSubimage = 11}
			break
		case playerAniState.right:
			aniSubimage += aniSpeedIdle
			if aniSubimage >= 24 {aniSubimage = 19}
			break
	}
}
