__amount = global.__shotGroupAmount
__amountLeft = __amount
__width = global.__LaserWidth / 2
grazeAdd = 0.01
deleteType = 0
deleteParent = noone
deleteResist = 0
image_blend = c_white
checkCollision = true

shotType = global.__shotType

spd = global.__shotSpeed
direction = global.__shotDirection


sprite = global.__shotSpriteIndex
subimage = global.__shotImageIndex
shotColor = global.__shotColor
aniFrames = global.__ShotAniFrames
aniSpeed = global.__ShotAniSpeed
aniStart = subimage
blendType = bm_normal
alphaMultiplier = 1

// Grid based
__alive = 0
__dir = 1
__posNext = 2
__posPrev = 3
__spd = 4
__lengthCounter = 5
__accelState = 6
__accelStepSpeed = 7
__accelDelay = 8
__accelFinalSpeed = 9
__accelTime = 10
__headerLength = 11

// Strip Add
__yy = 1
__ddir = 2
__aalive = 3
_stepSize = 4

var width = __headerLength + global.__LaserLength * _stepSize
grid = ds_grid_create(width, __amount)
__length = global.__LaserLength
__gridWidth = width

var d, i, u, len
for(i = 0; i < __amount; i++) {
	switch global.__shotGroupType{
		case shotGroupType.circle:	d = direction + (360 / __amount) * i;						break;
		case shotGroupType.arc:		d = direction + (global.__shotGroupSpread / __amount) * i;	break;
	}
	grid[# __alive, i] =		true
	grid[# __dir, i] =			d
	grid[# __spd, i] =			spd
	grid[# __lengthCounter, i] =__length
	
	grid[# __accelState, i] = 0
	grid[# __accelStepSpeed, i] = 0
	grid[# __accelDelay, i] = 0
	grid[# __accelFinalSpeed, i] = 0
	grid[# __accelTime, i] = 0
	
	for(u = __headerLength; u < __gridWidth; u += _stepSize) {
		grid[# u, i] =		x + lengthdir_x(global.__shotGroupDistFromCenter, d)
		grid[# u+__yy, i] =	y + lengthdir_y(global.__shotGroupDistFromCenter, d)
		grid[# u+__ddir, i] =	d
		grid[# u+__aalive, i] =	true
	}
}
directionS = 0
directionP = 0
timerStep = 0

// For Collision
_colStart = 1 * (__width / image_get_height(sprite))
_colMid = 5 * (__width / image_get_height(sprite))