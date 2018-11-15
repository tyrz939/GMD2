// Move
x += (spd * cos (direction * pi / 180)) * game.gamespeed
y += (spd * -sin (direction * pi / 180)) * game.gamespeed

// Bounding box for Marisa Lasers
if hitCircle > 0 {
	mask_index = spr_bboxCircle
	image_xscale = (hitCircle /32) *2
	image_yscale = (hitCircle /32) *2
} else if hitWidth > 0 && hitHeight > 0 {
	mask_index = spr_bboxRectangle
	image_xscale = (hitWidth /32) *2
	image_yscale = (hitHeight /32) *2
}

// Using shot collision because... why not. It's good
if pHitCircle > 0 {
	var _c = shotCollisionCircle(x, y, pHitCircle)
	if _c == 0 {
		playerHit()
	}
} else if pHitWidth > 0 && pHitHeight > 0 {
	var _c = shotCollisionRectangle(x, y, pHitWidth, pHitHeight, direction)
	if _c == 0 {
		playerHit()
	}
}

// Take Dmg
hp = clamp(hp - takeDmg, 0, 100000)
takeDmg = 0
if hp == 0 {
	instance_destroy()
	scoreAdd(hpStart * SCORE_DAMAGE_MULTIPLIER)
	game.enemyKillCount++
	if drops[0] != -1 {
		var rnd = clamp(10 + dropCount * 5, 10, 50)
		for(var i = 0; i < dropCount; i++) {
			if array_length_1d(drops) > 1 {
				pickupCreate(x + irandom(rnd) - rnd/2, y + irandom(rnd) - rnd/2, drops[i])
			} else {
				pickupCreate(x, y, drops[i])
			}
		}
	}
	exit
}
// Animation
if animationSpeed > 0 && image_exists(sprite) {
	subImage += animationSpeed / 60
	if floor(subImage) >= image_get_number(sprite) {
		subImage = 0
	}
}

//Clean up once out of play field
if autoDelete {
	if x < global.shotDeleteLeft || x > global.shotDeleteRight || y < global.shotDeleteTop || y > global.shotDeleteBottom {
		instance_destroy()
	}
}

// Timer
timer++