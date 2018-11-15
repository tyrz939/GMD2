x += (spd * cos (direction * pi / 180)) * game.gamespeed;
y += (spd * -sin (direction * pi / 180)) * game.gamespeed;

if timer < 24 {
	image_angle -= 45
}

if pickupType == pickup_t.STAR && timer >= 30 {
	pickupCollect = true
}

timer++
bgRotation += 3

if spd < 2 && !pickupCollect {
	spd += 0.025
}

if y > global.playAreaHeight + 16 {
	instance_destroy()
}

if point_distance(x, y, player.x, player.y) < 50 {
	pickupCollect = true
}

if pickupAutoCollect {
	pickupCollect = true
}

if player.y < game.pointOfCollect {
	pickupCollect = true
	pickupMaxValue = true
}

if pickupType == pickup_t.STAR {
	pickupWhiteCollectDelay--
	if pickupWhiteCollectDelay == 0 {
		pickupCollect = true
	}
}

if pickupCollect {
	direction = point_direction(x, y, player.x, player.y)
	spd = clamp(point_distance(x, y, player.x, player.y) / 20, 6, 10)
	
	if point_distance(x, y, player.x, player.y) < 10 {
		switch pickupType {
			case pickup_t.POWER:
				game.shotPower = clamp(game.shotPower + 0.01, 0, player.shotPowerMax);
				break;
			case pickup_t.POWER8:
				game.shotPower = clamp(game.shotPower + 0.08, 0, player.shotPowerMax);
				break;
			case pickup_t.STAR:
				scoreAdd(SCORE_PICKUP_STAR)
				break;
			case pickup_t.LIFE:
				lives  = clamp(++lives, 0, 8);
				break;
			case pickup_t.BOMB:
				game.bombs  = clamp(++game.bombs, 0, 8);
				break;
			case pickup_t.FULL:
				game.shotPower = player.shotPowerMax;
				break;
			case pickup_t.SCORE:
				var s
				if pickupMaxValue {
					col = c_yellow
					s = SCORE_PICKUP_SCORE
				} else {
					col = c_white
					s = (player.y - game.pointOfCollect) / (global.playAreaHeight - game.pointOfCollect)
					s = round(clamp(SCORE_PICKUP_SCORE - (s * SCORE_PICKUP_SCORE), 1, SCORE_PICKUP_SCORE))
				}
				scoreAdd(s)
				text = string(s)
				break;
		}
		play_sfx_buffer(game.sfxPickup, false)
		if text != "" {
			with instance_create_depth(x, y, depth, obj_pickupText) {
				text = other.text
				col = other.col
			}
		}
		instance_destroy()
	}
}