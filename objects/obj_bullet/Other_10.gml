// Animation
if aniFrames > 1 {
	subimage += aniSpeed / 60
	if subimage >= aniStart + aniFrames {subimage = aniStart}
}

if delay > timerSpawn {
	timerSpawn++
	// Move
	x += ((spd/2) * cos (direction * pi / 180)) * game.gamespeed
	y += ((spd/2) * -sin (direction * pi / 180)) * game.gamespeed
	image_alpha += delayAlphaDiff / delay
	image_xscale -= (delayScale-1) / delay
	image_yscale -= (delayScale-1) / delay
} else {
	timerStep++
	// Acceleration / Deceleration
	if accelState != 0 {
		// Wait for delay time
		if accelDelay <= timerStep {
			// Add to the speed (if numbers negative, add will decelerate)
			spd += accelStepSpeed
			// Change state to 0 when done
			if timerStep >= accelTime + accelDelay {
				accelState = 0
				spd = accelFinalSpeed
			}
		}
	}
	// Move
	direction += directionS
	direction += directionP
	x += (spd * cos (direction * pi / 180)) * game.gamespeed
	y += (spd * -sin (direction * pi / 180)) * game.gamespeed

	// Collision
	if checkCollision {
		var __c = noone
		switch hitType {
			case CIRCLE:
				__c = shotCollisionCircle(x, y, hitRadius)
				break;
			case OVAL:
				__c = shotCollisionOval(x, y, hitWidth, hitHeight, direction)
				break;
			case RECTANGLE:
				__c = shotCollisionRectangle(x, y, hitWidth, hitHeight, direction)
				break;
		}
		if __c != noone {
			if __c == 0 {
				playerHit()
			}
			if deleteType >= 1 {
				part_particles_create_colour(global.partSys, x, y, global.partShotDie, merge_color(shotColor, c_white, 0.5), 1)
			}
			if deleteType >= 2 {
				pickupCreate(x, y, game.bulletPickupDrop)
			}
			instance_destroy()
		}
	}

	//Clean up once out of play field
	if autoDelete {
		if x < global.shotDeleteLeft || x > global.shotDeleteRight || y < global.shotDeleteTop || y > global.shotDeleteBottom {
		    instance_destroy()
		}
	}
}
directionS = 0