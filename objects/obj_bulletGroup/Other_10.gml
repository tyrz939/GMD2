// Animation
if aniFrames > 1 {
	subimage += aniSpeed / 60
	if subimage >= aniStart + aniFrames {subimage = aniStart}
}

if delay > timerSpawn {
	timerSpawn++
	for(var i = 0; i < __amount; i++) {
		// Move
		grid[# __dir, i] += directionS
		grid[# __dir, i] += directionP
		grid[# __xx, i] += (grid[# __spd, i]/2 * cos (grid[# __dir, i] * pi / 180)) * game.gamespeed
		grid[# __yy, i] += (grid[# __spd, i]/2 * -sin (grid[# __dir, i] * pi / 180)) * game.gamespeed
	}
	image_alpha += delayAlphaDiff / delay
	image_xscale -= (delayScale-1) / delay
	image_yscale -= (delayScale-1) / delay
} else {
	timerStep++
	var __c
	for(var i = 0; i < __amount; i++) {
		if grid[# __alive, i] {
			// Acceleration / Deceleration
			if grid[# __accelState, i] != 0 {
				// Wait for delay time
				if grid[# __accelDelay, i] <= timerStep {
					// Add to the speed (if numbers negative, add will decelerate)
					grid[# __spd, i] += grid[# __accelStepSpeed, i]
					// Change state to 0 when done
					if timerStep >= grid[# __accelTime, i] + grid[# __accelDelay, i] {
						grid[# __accelState, i] = 0
						grid[# __spd, i] = grid[# __accelFinalSpeed, i]
					}
				}
			}
			// Move
			grid[# __dir, i] += directionS
			grid[# __dir, i] += directionP
			grid[# __xx, i] += (grid[# __spd, i] * cos (grid[# __dir, i] * pi / 180)) * game.gamespeed
			grid[# __yy, i] += (grid[# __spd, i] * -sin (grid[# __dir, i] * pi / 180)) * game.gamespeed
			// Collision
			if checkCollision {
				__c = noone
				switch hitType {
					case CIRCLE:
						__c = shotCollisionCircle(grid[# __xx, i], grid[# __yy, i], hitRadius)
						break;
					case OVAL:
						__c = shotCollisionOval(grid[# __xx, i], grid[# __yy, i], hitWidth, hitHeight, grid[# __dir, i])
						break;
					case RECTANGLE:
						__c = shotCollisionRectangle(grid[# __xx, i], grid[# __yy, i], hitWidth, hitHeight, grid[# __dir, i])
						break;
				}
				if __c != noone {
					if __c == 0 {playerHit()}
					shotGroupDeleteBullet(id, i)
				}
			}
			//Clean up once out of play field
			if autoDelete {
				if grid[# __xx, i] < global.shotDeleteLeft || grid[# __xx, i] > global.shotDeleteRight || grid[# __yy, i] < global.shotDeleteTop || grid[# __yy, i] > global.shotDeleteBottom {
				    shotGroupDeleteBullet(id, i)
				}
			}
		}
	}
	if __amountLeft == 0 {
		instance_destroy()
	}
}
directionS = 0