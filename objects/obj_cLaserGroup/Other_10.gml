// Animation
if aniFrames > 1 {
	subimage += aniSpeed / 60
	if subimage >= aniStart + aniFrames {subimage = aniStart}
}

var i, u, len, _xmax, _xmin, _ymax, _ymin, d, t, countUp, c, oRadius, collisionCheck, h, j
timerStep++
__amountLeft = 0
for(i = 0; i < __amount; i++) {
	if grid[# __alive, i] {
		__amountLeft++
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
		// Direction
		d = directionS
		d += directionP
		
		
		// Edge of screen variables
		_ymax = global.shotDeleteTop
		_xmax = global.shotDeleteLeft
		_xmin = global.shotDeleteRight
		_ymin = global.shotDeleteBottom
		
		// Collision Check Decision
		var _px1 = grid[# __headerLength, i]
		var _py1 = grid[# __headerLength+__yy, i]
		var _px2 = grid[# __gridWidth-_stepSize, i]
		var _py2 = grid[# __gridWidth-_stepSize+__yy, i]
		
		oRadius = point_distance(_px1, _py1, _px2, _py2) / 2
		var _cx = _px1 + lengthdir_x(oRadius, point_direction(_px1, _py1, _px2, _py2))
		var _cy = _py1 + lengthdir_y(oRadius, point_direction(_px1, _py1, _px2, _py2))
		oRadius += __width * 2
		if shotCollisionCircle(_cx, _cy, oRadius) >= 0 && checkCollision {
			collisionCheck = true
		} else {
			collisionCheck = false
		}
		h = 0
		grid[# __lengthCounter, i] = 0
		
		// Loop
		for(u = __headerLength; u < __gridWidth; u += _stepSize) {
			if u < __gridWidth - _stepSize {
				for(t = 0; t < _stepSize-1; t++) {
					grid[# u + t, i] = grid[# u + t + _stepSize, i]
				}
			} else { // Movement of head
				grid[# __dir, i]	+= d
				grid[# u+__ddir, i]	= grid[# __dir, i]
				grid[# u, i]		+= lengthdir_x(grid[# __spd, i], grid[# u+__ddir, i])
				grid[# u+__yy, i]	+= lengthdir_y(grid[# __spd, i], grid[# u+__ddir, i])
			}
			
			// Collision
			if grid[# u+__aalive, i] {
				grid[# __lengthCounter, i]++
				if collisionCheck {
					h--
					j = _colStart + lengthdir_y(_colMid, (h / __length) * 180)
					c = shotCollisionCircle(grid[# u, i], grid[# u+__yy, i], j)
					if c != noone {
						grid[# u+__aalive, i] = false
						if c == 0 {playerHit()}
						if deleteType >= 2 {pickupCreate(grid[# u, i], grid[# u+__yy, i], game.bulletPickupDrop)}
					}
				}
			}
			
			// Detecting if it's off screen
			_ymax = max(_ymax, grid[# u+1, i])
			_xmax = max(_xmax, grid[# u, i])
			_xmin = min(_xmin, grid[# u, i])
			_ymin = min(_ymin, grid[# u+1, i])
		}
		if grid[# __lengthCounter, i] == 0 {grid[# __alive, i] = false}
		
		// Delete if off screen
		if _ymax <= global.shotDeleteTop	||
			_xmax <= global.shotDeleteLeft	||
			_xmin >= global.shotDeleteRight	||
			_ymin >= global.shotDeleteBottom {
			grid[# __alive, i] = false
		}
	}
}
directionS = 0
if __amountLeft == 0 {instance_destroy()}