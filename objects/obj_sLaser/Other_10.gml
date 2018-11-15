// Animation
if aniFrames > 1 {
	subimage += aniSpeed / 60
	if subimage >= aniStart + aniFrames {subimage = aniStart}
}

if delay >= timerSpawn {
	timerSpawn++
	_spawnAlpha += _spawnAlphaStep
} else if _duration > timerStep {
	timerStep++
	if image_xscale < aniFinalScale {
		image_xscale += aniInScaleSteps
		hitWidth += hitWidthSteps
	}
	var _xx = x + lengthdir_x(hitHeight, direction)
	var _yy = y + lengthdir_y(hitHeight, direction)
	
	// hitHeight and hitWidth are meant to be swapped here
	if checkCollision {
		var __c = shotCollisionRectangle(_xx, _yy, hitHeight, hitWidth, direction)
		if __c != noone {
			if __c == 0 {
				playerHit()
			}
			if deleteType >= 2 {
				for(var i = 0; i < _length; i += 16) {
					pickupCreate(x + lengthdir_x(i, direction), y + lengthdir_y(i, direction), game.bulletPickupDrop)
				}
			}
			instance_destroy()
		}
	}
} else {
	image_xscale	-= aniSpeed
	image_alpha		-= aniSpeed
	_spawnAlpha		-= aniSpeed
	if image_xscale <= 0 {instance_destroy()}
}
_spawnAngle += 15